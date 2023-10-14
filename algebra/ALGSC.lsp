
(/VERSIONCHECK 2) 

(DEFUN |ALGSC;recip;$U;1| (|x| $) (SPADCALL |x| (QREFELT $ 13))) 

(DEFUN |ALGSC;*;Sm2$;2| (|m| |x| $)
  (SPADCALL (SPADCALL |m| (QREFELT $ 17)) |x| (QREFELT $ 18))) 

(DEFUN |ALGSC;coerce;V$;3| (|v| $) (SPADCALL |v| (QREFELT $ 21))) 

(DEFUN |ALGSC;structuralConstants;V;4| ($) (QREFELT $ 9)) 

(DEFUN |ALGSC;coordinates;$V;5| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 26)) (QREFELT $ 27))) 

(DEFUN |ALGSC;coordinates;$VV;6| (|x| |b| $)
  (PROG (#1=#:G159 |res| |i| |transitionMatrix| |m| #2=#:G154)
    (RETURN
     (SEQ
      (LETT |m|
            (PROG1
                (LETT #2# (SPADCALL |b| (QREFELT $ 31))
                      . #3=(|ALGSC;coordinates;$VV;6|))
              (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
            . #3#)
      (LETT |transitionMatrix|
            (SPADCALL (QREFELT $ 7) |m| (|spadConstant| $ 32) (QREFELT $ 34))
            . #3#)
      (SEQ (LETT |i| 1 . #3#) G190 (COND ((|greater_SI| |i| |m|) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |transitionMatrix| |i|
                       (SPADCALL (SPADCALL |b| |i| (QREFELT $ 35))
                                 (QREFELT $ 28))
                       (QREFELT $ 36))))
           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
      (LETT |res|
            (SPADCALL |transitionMatrix| (SPADCALL |x| (QREFELT $ 28))
                      (QREFELT $ 40))
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
  (PROG (#1=#:G164 #2=#:G167 #3=#:G169 |i| #4=#:G168)
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
                       (QREFELT $ 45)))))
            (LETT #2# (PROG1 (|inc_SI| #2#) (LETT |i| (|inc_SI| |i|) . #6#))
                  . #6#)
            (GO G190) G191 (EXIT NIL))
       #4#))))) 

(DEFUN |ALGSC;someBasis;V;8| ($) (SPADCALL (QREFELT $ 42))) 

(DEFUN |ALGSC;rank;Pi;9| ($) (QREFELT $ 7)) 

(DEFUN |ALGSC;elt;$IR;10| (|x| |i| $) (SPADCALL |x| |i| (QREFELT $ 48))) 

(DEFUN |ALGSC;coerce;$Of;11| (|x| $)
  (PROG (#1=#:G173 |le| |coef| #2=#:G180 |i|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |x| (QREFELT $ 51))
        (SPADCALL (|spadConstant| $ 32) (QREFELT $ 53)))
       ('T
        (SEQ (LETT |le| NIL . #3=(|ALGSC;coerce;$Of;11|))
             (SEQ (LETT |i| 1 . #3#) (LETT #2# (QREFELT $ 7) . #3#) G190
                  (COND ((|greater_SI| |i| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |coef| (SPADCALL |x| |i| (QREFELT $ 49)) . #3#)
                         (EXIT
                          (COND
                           ((NULL (SPADCALL |coef| (QREFELT $ 54)))
                            (PROGN
                             (LETT #1#
                                   (COND
                                    ((SPADCALL |coef| (|spadConstant| $ 55)
                                               (QREFELT $ 56))
                                     (LETT |le|
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL (QREFELT $ 8) |i|
                                                       (QREFELT $ 59))
                                             (QREFELT $ 60))
                                            |le|)
                                           . #3#))
                                    ('T
                                     (LETT |le|
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL |coef| (QREFELT $ 53))
                                             (SPADCALL
                                              (SPADCALL (QREFELT $ 8) |i|
                                                        (QREFELT $ 59))
                                              (QREFELT $ 60))
                                             (QREFELT $ 61))
                                            |le|)
                                           . #3#)))
                                   . #3#)
                             (GO #1#)))))))
                   #1# (EXIT #1#))
                  (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
             (EXIT (SPADCALL (ELT $ 62) |le| (QREFELT $ 65)))))))))) 

(DEFUN |ALGSC;*;3$;12| (|x| |y| $)
  (PROG (|h| #1=#:G189 |j| #2=#:G188 |i| #3=#:G187 |k| |v|)
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
                                                          (QREFELT $ 49))
                                                (SPADCALL |y| |j|
                                                          (QREFELT $ 49))
                                                (QREFELT $ 67))
                                               (SPADCALL
                                                (SPADCALL (QREFELT $ 9) |k|
                                                          (QREFELT $ 68))
                                                |i| |j| (QREFELT $ 69))
                                               (QREFELT $ 67))
                                              (QREFELT $ 70))
                                    . #4#)))
                            (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL |v| |k| |h| (QREFELT $ 71))))
           (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |v| (QREFELT $ 21))))))) 

(DEFUN |ALGSC;alternative?;B;13| ($)
  (PROG (#1=#:G207 #2=#:G216 |res| #3=#:G230 |l| #4=#:G229 |r| #5=#:G203
         #6=#:G228 #7=#:G227 #8=#:G226 |k| #9=#:G198 #10=#:G225 #11=#:G224
         #12=#:G223 #13=#:G222 |j| #14=#:G192 #15=#:G221 #16=#:G220 #17=#:G219
         #18=#:G218 #19=#:G217 |i|)
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
                                                                (QREFELT $ 68))
                                                               |j| |k|
                                                               (QREFELT $ 69))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 68))
                                                               |k| |j|
                                                               (QREFELT $ 69))
                                                              (QREFELT $ 70))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT $ 9)
                                                               |r|
                                                               (QREFELT $ 68))
                                                              |i| |l|
                                                              (QREFELT $ 69))
                                                             (QREFELT $ 67))
                                                            (QREFELT $ 73))
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |l|
                                                               (QREFELT $ 68))
                                                     |i| |j| (QREFELT $ 69))
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |r|
                                                               (QREFELT $ 68))
                                                     |l| |k| (QREFELT $ 69))
                                                    (QREFELT $ 67))
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |l|
                                                               (QREFELT $ 68))
                                                     |i| |k| (QREFELT $ 69))
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |r|
                                                               (QREFELT $ 68))
                                                     |l| |j| (QREFELT $ 69))
                                                    (QREFELT $ 67))
                                                   (QREFELT $ 70))
                                                  (QREFELT $ 70))
                                                 . #20#)))
                                         (LETT |l| (|inc_SI| |l|) . #20#)
                                         (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (COND
                                      ((NULL (SPADCALL |res| (QREFELT $ 54)))
                                       (PROGN
                                        (LETT #14#
                                              (SEQ
                                               (SPADCALL
                                                "algebra is not right alternative"
                                                (QREFELT $ 76))
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
                                                                (QREFELT $ 68))
                                                               |i| |j|
                                                               (QREFELT $ 69))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 68))
                                                               |j| |i|
                                                               (QREFELT $ 69))
                                                              (QREFELT $ 70))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT $ 9)
                                                               |r|
                                                               (QREFELT $ 68))
                                                              |l| |k|
                                                              (QREFELT $ 69))
                                                             (QREFELT $ 67))
                                                            (QREFELT $ 70))
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |l|
                                                               (QREFELT $ 68))
                                                     |j| |k| (QREFELT $ 69))
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |r|
                                                               (QREFELT $ 68))
                                                     |i| |l| (QREFELT $ 69))
                                                    (QREFELT $ 67))
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |l|
                                                               (QREFELT $ 68))
                                                     |i| |k| (QREFELT $ 69))
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |r|
                                                               (QREFELT $ 68))
                                                     |j| |l| (QREFELT $ 69))
                                                    (QREFELT $ 67))
                                                   (QREFELT $ 70))
                                                  (QREFELT $ 73))
                                                 . #20#)))
                                         (LETT |l| (|inc_SI| |l|) . #20#)
                                         (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (COND
                                      ((NULL (SPADCALL |res| (QREFELT $ 54)))
                                       (PROGN
                                        (LETT #9#
                                              (SEQ
                                               (SPADCALL
                                                "algebra is not left alternative"
                                                (QREFELT $ 76))
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
                                                                (QREFELT $ 68))
                                                               |i| |j|
                                                               (QREFELT $ 69))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 68))
                                                               |j| |i|
                                                               (QREFELT $ 69))
                                                              (QREFELT $ 70))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT $ 9)
                                                               |r|
                                                               (QREFELT $ 68))
                                                              |l| |k|
                                                              (QREFELT $ 69))
                                                             (QREFELT $ 67))
                                                            (QREFELT $ 70))
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |l|
                                                               (QREFELT $ 68))
                                                     |j| |k| (QREFELT $ 69))
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |r|
                                                               (QREFELT $ 68))
                                                     |i| |l| (QREFELT $ 69))
                                                    (QREFELT $ 67))
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |l|
                                                               (QREFELT $ 68))
                                                     |i| |k| (QREFELT $ 69))
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |r|
                                                               (QREFELT $ 68))
                                                     |j| |l| (QREFELT $ 69))
                                                    (QREFELT $ 67))
                                                   (QREFELT $ 70))
                                                  (QREFELT $ 73))
                                                 . #20#)))
                                         (LETT |l| (|inc_SI| |l|) . #20#)
                                         (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (COND
                                      ((NULL (SPADCALL |res| (QREFELT $ 54)))
                                       (PROGN
                                        (LETT #5#
                                              (SEQ
                                               (SPADCALL
                                                "algebra is not left alternative"
                                                (QREFELT $ 76))
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
                                                                          68))
                                                                |j| |k|
                                                                (QREFELT $ 69))
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (QREFELT $ 9)
                                                                 |l|
                                                                 (QREFELT $
                                                                          68))
                                                                |k| |j|
                                                                (QREFELT $ 69))
                                                               (QREFELT $ 70))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 68))
                                                               |i| |l|
                                                               (QREFELT $ 69))
                                                              (QREFELT $ 67))
                                                             (QREFELT $ 73))
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 68))
                                                      |i| |j| (QREFELT $ 69))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 68))
                                                      |l| |k| (QREFELT $ 69))
                                                     (QREFELT $ 67))
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 68))
                                                      |i| |k| (QREFELT $ 69))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 68))
                                                      |l| |j| (QREFELT $ 69))
                                                     (QREFELT $ 67))
                                                    (QREFELT $ 70))
                                                   (QREFELT $ 70))
                                                  . #20#)))
                                          (LETT |l| (|inc_SI| |l|) . #20#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (COND
                                       ((NULL (SPADCALL |res| (QREFELT $ 54)))
                                        (PROGN
                                         (LETT #1#
                                               (SEQ
                                                (SPADCALL
                                                 "algebra is not right alternative"
                                                 (QREFELT $ 76))
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
         (QREFELT $ 76))
        (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |ALGSC;associative?;B;14| ($)
  (PROG (#1=#:G233 #2=#:G239 |res| #3=#:G244 |l| #4=#:G243 |r| #5=#:G242 |k|
         #6=#:G241 |j| #7=#:G240 |i|)
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
                                                                (QREFELT $ 68))
                                                               |i| |j|
                                                               (QREFELT $ 69))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 68))
                                                               |l| |k|
                                                               (QREFELT $ 69))
                                                              (QREFELT $ 67))
                                                             (QREFELT $ 70))
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |l|
                                                               (QREFELT $ 68))
                                                     |j| |k| (QREFELT $ 69))
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |r|
                                                               (QREFELT $ 68))
                                                     |i| |l| (QREFELT $ 69))
                                                    (QREFELT $ 67))
                                                   (QREFELT $ 73))
                                                  . #8#)))
                                          (LETT |l| (|inc_SI| |l|) . #8#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (COND
                                       ((NULL (SPADCALL |res| (QREFELT $ 54)))
                                        (PROGN
                                         (LETT #1#
                                               (SEQ
                                                (SPADCALL
                                                 "algebra is not associative"
                                                 (QREFELT $ 76))
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
        (SPADCALL "algebra is associative" (QREFELT $ 76)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |ALGSC;antiAssociative?;B;15| ($)
  (PROG (#1=#:G247 #2=#:G253 |res| #3=#:G258 |l| #4=#:G257 |r| #5=#:G256 |k|
         #6=#:G255 |j| #7=#:G254 |i|)
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
                                                                (QREFELT $ 68))
                                                               |i| |j|
                                                               (QREFELT $ 69))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 68))
                                                               |l| |k|
                                                               (QREFELT $ 69))
                                                              (QREFELT $ 67))
                                                             (QREFELT $ 70))
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |l|
                                                               (QREFELT $ 68))
                                                     |j| |k| (QREFELT $ 69))
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |r|
                                                               (QREFELT $ 68))
                                                     |i| |l| (QREFELT $ 69))
                                                    (QREFELT $ 67))
                                                   (QREFELT $ 70))
                                                  . #8#)))
                                          (LETT |l| (|inc_SI| |l|) . #8#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (COND
                                       ((NULL (SPADCALL |res| (QREFELT $ 54)))
                                        (PROGN
                                         (LETT #1#
                                               (SEQ
                                                (SPADCALL
                                                 "algebra is not anti-associative"
                                                 (QREFELT $ 76))
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
        (SPADCALL "algebra is anti-associative" (QREFELT $ 76)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |ALGSC;commutative?;B;16| ($)
  (PROG (#1=#:G261 #2=#:G265 #3=#:G268 |k| #4=#:G267 |j| #5=#:G266 |i|)
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
                                  (SPADCALL (QREFELT $ 9) |k| (QREFELT $ 68))
                                  |i| |j| (QREFELT $ 69))
                                 (SPADCALL
                                  (SPADCALL (QREFELT $ 9) |k| (QREFELT $ 68))
                                  |j| |i| (QREFELT $ 69))
                                 (QREFELT $ 56)))
                               (PROGN
                                (LETT #1#
                                      (SEQ
                                       (SPADCALL "algebra is not commutative"
                                                 (QREFELT $ 76))
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
        (SPADCALL "algebra is commutative" (QREFELT $ 76)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |ALGSC;antiCommutative?;B;17| ($)
  (PROG (#1=#:G271 #2=#:G275 #3=#:G278 |k| #4=#:G277 |j| #5=#:G276 |i|)
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
                                    (SPADCALL (QREFELT $ 9) |k| (QREFELT $ 68))
                                    |i| |i| (QREFELT $ 69)))
                                  ('T
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (QREFELT $ 9) |k|
                                               (QREFELT $ 68))
                                     |i| |j| (QREFELT $ 69))
                                    (SPADCALL
                                     (SPADCALL (QREFELT $ 9) |k|
                                               (QREFELT $ 68))
                                     |j| |i| (QREFELT $ 69))
                                    (QREFELT $ 70))))
                                 (QREFELT $ 54)))
                               (PROGN
                                (LETT #1#
                                      (SEQ
                                       (SPADCALL
                                        "algebra is not anti-commutative"
                                        (QREFELT $ 76))
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
        (SPADCALL "algebra is anti-commutative" (QREFELT $ 76)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |ALGSC;leftAlternative?;B;18| ($)
  (PROG (#1=#:G281 #2=#:G287 |res| #3=#:G292 |l| #4=#:G291 |r| #5=#:G290 |k|
         #6=#:G289 |j| #7=#:G288 |i|)
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
                                                                          68))
                                                                |i| |j|
                                                                (QREFELT $ 69))
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (QREFELT $ 9)
                                                                 |l|
                                                                 (QREFELT $
                                                                          68))
                                                                |j| |i|
                                                                (QREFELT $ 69))
                                                               (QREFELT $ 70))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 68))
                                                               |l| |k|
                                                               (QREFELT $ 69))
                                                              (QREFELT $ 67))
                                                             (QREFELT $ 70))
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 68))
                                                      |j| |k| (QREFELT $ 69))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 68))
                                                      |i| |l| (QREFELT $ 69))
                                                     (QREFELT $ 67))
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 68))
                                                      |i| |k| (QREFELT $ 69))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 68))
                                                      |j| |l| (QREFELT $ 69))
                                                     (QREFELT $ 67))
                                                    (QREFELT $ 70))
                                                   (QREFELT $ 73))
                                                  . #8#)))
                                          (LETT |l| (|inc_SI| |l|) . #8#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (COND
                                       ((NULL (SPADCALL |res| (QREFELT $ 54)))
                                        (PROGN
                                         (LETT #1#
                                               (SEQ
                                                (SPADCALL
                                                 "algebra is not left alternative"
                                                 (QREFELT $ 76))
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
        (SPADCALL "algebra is left alternative" (QREFELT $ 76)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |ALGSC;rightAlternative?;B;19| ($)
  (PROG (#1=#:G295 #2=#:G301 |res| #3=#:G306 |l| #4=#:G305 |r| #5=#:G304 |k|
         #6=#:G303 |j| #7=#:G302 |i|)
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
                                                                          68))
                                                                |j| |k|
                                                                (QREFELT $ 69))
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (QREFELT $ 9)
                                                                 |l|
                                                                 (QREFELT $
                                                                          68))
                                                                |k| |j|
                                                                (QREFELT $ 69))
                                                               (QREFELT $ 70))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 68))
                                                               |i| |l|
                                                               (QREFELT $ 69))
                                                              (QREFELT $ 67))
                                                             (QREFELT $ 73))
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 68))
                                                      |i| |j| (QREFELT $ 69))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 68))
                                                      |l| |k| (QREFELT $ 69))
                                                     (QREFELT $ 67))
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 68))
                                                      |i| |k| (QREFELT $ 69))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 68))
                                                      |l| |j| (QREFELT $ 69))
                                                     (QREFELT $ 67))
                                                    (QREFELT $ 70))
                                                   (QREFELT $ 70))
                                                  . #8#)))
                                          (LETT |l| (|inc_SI| |l|) . #8#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (COND
                                       ((NULL (SPADCALL |res| (QREFELT $ 54)))
                                        (PROGN
                                         (LETT #1#
                                               (SEQ
                                                (SPADCALL
                                                 "algebra is not right alternative"
                                                 (QREFELT $ 76))
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
        (SPADCALL "algebra is right alternative" (QREFELT $ 76)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |ALGSC;flexible?;B;20| ($)
  (PROG (#1=#:G309 #2=#:G315 |res| #3=#:G320 |l| #4=#:G319 |r| #5=#:G318 |k|
         #6=#:G317 |j| #7=#:G316 |i|)
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
                                                                           68))
                                                                 |i| |j|
                                                                 (QREFELT $
                                                                          69))
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (QREFELT $ 9)
                                                                  |r|
                                                                  (QREFELT $
                                                                           68))
                                                                 |l| |k|
                                                                 (QREFELT $
                                                                          69))
                                                                (QREFELT $ 67))
                                                               (QREFELT $ 70))
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL (QREFELT $ 9)
                                                                 |l|
                                                                 (QREFELT $
                                                                          68))
                                                       |j| |k| (QREFELT $ 69))
                                                      (SPADCALL
                                                       (SPADCALL (QREFELT $ 9)
                                                                 |r|
                                                                 (QREFELT $
                                                                          68))
                                                       |i| |l| (QREFELT $ 69))
                                                      (QREFELT $ 67))
                                                     (QREFELT $ 73))
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 68))
                                                      |k| |j| (QREFELT $ 69))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 68))
                                                      |l| |i| (QREFELT $ 69))
                                                     (QREFELT $ 67))
                                                    (QREFELT $ 70))
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |l|
                                                               (QREFELT $ 68))
                                                     |j| |i| (QREFELT $ 69))
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |r|
                                                               (QREFELT $ 68))
                                                     |k| |l| (QREFELT $ 69))
                                                    (QREFELT $ 67))
                                                   (QREFELT $ 73))
                                                  . #8#)))
                                          (LETT |l| (|inc_SI| |l|) . #8#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (COND
                                       ((NULL (SPADCALL |res| (QREFELT $ 54)))
                                        (PROGN
                                         (LETT #1#
                                               (SEQ
                                                (SPADCALL
                                                 "algebra is not flexible"
                                                 (QREFELT $ 76))
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
        (SPADCALL "algebra is flexible" (QREFELT $ 76)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |ALGSC;lieAdmissible?;B;21| ($)
  (PROG (#1=#:G323 #2=#:G329 |res| #3=#:G334 |l| #4=#:G333 |r| #5=#:G332 |k|
         #6=#:G331 |j| #7=#:G330 |i|)
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
                                                                           68))
                                                                 |i| |j|
                                                                 (QREFELT $
                                                                          69))
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (QREFELT $ 9)
                                                                  |l|
                                                                  (QREFELT $
                                                                           68))
                                                                 |j| |i|
                                                                 (QREFELT $
                                                                          69))
                                                                (QREFELT $ 73))
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (QREFELT $ 9)
                                                                  |r|
                                                                  (QREFELT $
                                                                           68))
                                                                 |l| |k|
                                                                 (QREFELT $
                                                                          69))
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (QREFELT $ 9)
                                                                  |r|
                                                                  (QREFELT $
                                                                           68))
                                                                 |k| |l|
                                                                 (QREFELT $
                                                                          69))
                                                                (QREFELT $ 73))
                                                               (QREFELT $ 67))
                                                              (QREFELT $ 70))
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL (QREFELT $ 9)
                                                                 |l|
                                                                 (QREFELT $
                                                                          68))
                                                       |j| |k| (QREFELT $ 69))
                                                      (SPADCALL
                                                       (SPADCALL (QREFELT $ 9)
                                                                 |l|
                                                                 (QREFELT $
                                                                          68))
                                                       |k| |j| (QREFELT $ 69))
                                                      (QREFELT $ 73))
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL (QREFELT $ 9)
                                                                 |r|
                                                                 (QREFELT $
                                                                          68))
                                                       |l| |i| (QREFELT $ 69))
                                                      (SPADCALL
                                                       (SPADCALL (QREFELT $ 9)
                                                                 |r|
                                                                 (QREFELT $
                                                                          68))
                                                       |i| |l| (QREFELT $ 69))
                                                      (QREFELT $ 73))
                                                     (QREFELT $ 67))
                                                    (QREFELT $ 70))
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 68))
                                                      |k| |i| (QREFELT $ 69))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |l|
                                                                (QREFELT $ 68))
                                                      |i| |k| (QREFELT $ 69))
                                                     (QREFELT $ 73))
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 68))
                                                      |l| |j| (QREFELT $ 69))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 68))
                                                      |j| |l| (QREFELT $ 69))
                                                     (QREFELT $ 73))
                                                    (QREFELT $ 67))
                                                   (QREFELT $ 70))
                                                  . #8#)))
                                          (LETT |l| (|inc_SI| |l|) . #8#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (COND
                                       ((NULL (SPADCALL |res| (QREFELT $ 54)))
                                        (PROGN
                                         (LETT #1#
                                               (SEQ
                                                (SPADCALL
                                                 "algebra is not Lie admissible"
                                                 (QREFELT $ 76))
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
        (SPADCALL "algebra is Lie admissible" (QREFELT $ 76)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |ALGSC;jordanAdmissible?;B;22| ($)
  (PROG (#1=#:G342 #2=#:G350 |res| #3=#:G357 |r| #4=#:G356 |l| #5=#:G355 |t|
         #6=#:G354 |w| #7=#:G353 |k| #8=#:G352 |j| #9=#:G351 |i|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((QEQCAR
          (SPADCALL (SPADCALL 2 (|spadConstant| $ 55) (QREFELT $ 86))
                    (QREFELT $ 87))
          1)
         (SEQ
          (SPADCALL
           "this algebra is not Jordan admissible, as 2 is not invertible in the ground ring"
           (QREFELT $ 76))
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
                                                                              68))
                                                                            |i|
                                                                            |j|
                                                                            (QREFELT
                                                                             $
                                                                             69))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              $
                                                                              9)
                                                                             |l|
                                                                             (QREFELT
                                                                              $
                                                                              68))
                                                                            |j|
                                                                            |i|
                                                                            (QREFELT
                                                                             $
                                                                             69))
                                                                           (QREFELT
                                                                            $
                                                                            70))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              $
                                                                              9)
                                                                             |r|
                                                                             (QREFELT
                                                                              $
                                                                              68))
                                                                            |w|
                                                                            |k|
                                                                            (QREFELT
                                                                             $
                                                                             69))
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (QREFELT
                                                                              $
                                                                              9)
                                                                             |r|
                                                                             (QREFELT
                                                                              $
                                                                              68))
                                                                            |k|
                                                                            |w|
                                                                            (QREFELT
                                                                             $
                                                                             69))
                                                                           (QREFELT
                                                                            $
                                                                            70))
                                                                          (QREFELT
                                                                           $
                                                                           67))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             $
                                                                             9)
                                                                            |t|
                                                                            (QREFELT
                                                                             $
                                                                             68))
                                                                           |l|
                                                                           |r|
                                                                           (QREFELT
                                                                            $
                                                                            69))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             $
                                                                             9)
                                                                            |t|
                                                                            (QREFELT
                                                                             $
                                                                             68))
                                                                           |r|
                                                                           |l|
                                                                           (QREFELT
                                                                            $
                                                                            69))
                                                                          (QREFELT
                                                                           $
                                                                           70))
                                                                         (QREFELT
                                                                          $
                                                                          67))
                                                                        (QREFELT
                                                                         $ 70))
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
                                                                             68))
                                                                           |w|
                                                                           |k|
                                                                           (QREFELT
                                                                            $
                                                                            69))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             $
                                                                             9)
                                                                            |r|
                                                                            (QREFELT
                                                                             $
                                                                             68))
                                                                           |k|
                                                                           |w|
                                                                           (QREFELT
                                                                            $
                                                                            69))
                                                                          (QREFELT
                                                                           $
                                                                           70))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             $
                                                                             9)
                                                                            |l|
                                                                            (QREFELT
                                                                             $
                                                                             68))
                                                                           |j|
                                                                           |r|
                                                                           (QREFELT
                                                                            $
                                                                            69))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             $
                                                                             9)
                                                                            |l|
                                                                            (QREFELT
                                                                             $
                                                                             68))
                                                                           |r|
                                                                           |j|
                                                                           (QREFELT
                                                                            $
                                                                            69))
                                                                          (QREFELT
                                                                           $
                                                                           70))
                                                                         (QREFELT
                                                                          $
                                                                          67))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            $
                                                                            9)
                                                                           |t|
                                                                           (QREFELT
                                                                            $
                                                                            68))
                                                                          |i|
                                                                          |l|
                                                                          (QREFELT
                                                                           $
                                                                           69))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            $
                                                                            9)
                                                                           |t|
                                                                           (QREFELT
                                                                            $
                                                                            68))
                                                                          |l|
                                                                          |i|
                                                                          (QREFELT
                                                                           $
                                                                           69))
                                                                         (QREFELT
                                                                          $
                                                                          70))
                                                                        (QREFELT
                                                                         $ 67))
                                                                       (QREFELT
                                                                        $ 73))
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
                                                                            68))
                                                                          |w|
                                                                          |j|
                                                                          (QREFELT
                                                                           $
                                                                           69))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            $
                                                                            9)
                                                                           |l|
                                                                           (QREFELT
                                                                            $
                                                                            68))
                                                                          |j|
                                                                          |w|
                                                                          (QREFELT
                                                                           $
                                                                           69))
                                                                         (QREFELT
                                                                          $
                                                                          70))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            $
                                                                            9)
                                                                           |r|
                                                                           (QREFELT
                                                                            $
                                                                            68))
                                                                          |k|
                                                                          |i|
                                                                          (QREFELT
                                                                           $
                                                                           69))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            $
                                                                            9)
                                                                           |r|
                                                                           (QREFELT
                                                                            $
                                                                            68))
                                                                          |i|
                                                                          |k|
                                                                          (QREFELT
                                                                           $
                                                                           69))
                                                                         (QREFELT
                                                                          $
                                                                          70))
                                                                        (QREFELT
                                                                         $ 67))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           $ 9)
                                                                          |t|
                                                                          (QREFELT
                                                                           $
                                                                           68))
                                                                         |l|
                                                                         |r|
                                                                         (QREFELT
                                                                          $
                                                                          69))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           $ 9)
                                                                          |t|
                                                                          (QREFELT
                                                                           $
                                                                           68))
                                                                         |r|
                                                                         |l|
                                                                         (QREFELT
                                                                          $
                                                                          69))
                                                                        (QREFELT
                                                                         $ 70))
                                                                       (QREFELT
                                                                        $ 67))
                                                                      (QREFELT
                                                                       $ 70))
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
                                                                           68))
                                                                         |k|
                                                                         |i|
                                                                         (QREFELT
                                                                          $
                                                                          69))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           $ 9)
                                                                          |r|
                                                                          (QREFELT
                                                                           $
                                                                           68))
                                                                         |k|
                                                                         |i|
                                                                         (QREFELT
                                                                          $
                                                                          69))
                                                                        (QREFELT
                                                                         $ 70))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           $ 9)
                                                                          |l|
                                                                          (QREFELT
                                                                           $
                                                                           68))
                                                                         |j|
                                                                         |r|
                                                                         (QREFELT
                                                                          $
                                                                          69))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           $ 9)
                                                                          |l|
                                                                          (QREFELT
                                                                           $
                                                                           68))
                                                                         |r|
                                                                         |j|
                                                                         (QREFELT
                                                                          $
                                                                          69))
                                                                        (QREFELT
                                                                         $ 70))
                                                                       (QREFELT
                                                                        $ 67))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          $ 9)
                                                                         |t|
                                                                         (QREFELT
                                                                          $
                                                                          68))
                                                                        |w| |l|
                                                                        (QREFELT
                                                                         $ 69))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          $ 9)
                                                                         |t|
                                                                         (QREFELT
                                                                          $
                                                                          68))
                                                                        |l| |w|
                                                                        (QREFELT
                                                                         $ 69))
                                                                       (QREFELT
                                                                        $ 70))
                                                                      (QREFELT
                                                                       $ 67))
                                                                     (QREFELT $
                                                                              73))
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
                                                                          68))
                                                                        |k| |j|
                                                                        (QREFELT
                                                                         $ 69))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          $ 9)
                                                                         |l|
                                                                         (QREFELT
                                                                          $
                                                                          68))
                                                                        |j| |k|
                                                                        (QREFELT
                                                                         $ 69))
                                                                       (QREFELT
                                                                        $ 70))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          $ 9)
                                                                         |r|
                                                                         (QREFELT
                                                                          $
                                                                          68))
                                                                        |i| |w|
                                                                        (QREFELT
                                                                         $ 69))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          $ 9)
                                                                         |r|
                                                                         (QREFELT
                                                                          $
                                                                          68))
                                                                        |w| |i|
                                                                        (QREFELT
                                                                         $ 69))
                                                                       (QREFELT
                                                                        $ 70))
                                                                      (QREFELT
                                                                       $ 67))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         $ 9)
                                                                        |t|
                                                                        (QREFELT
                                                                         $ 68))
                                                                       |l| |r|
                                                                       (QREFELT
                                                                        $ 69))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         $ 9)
                                                                        |t|
                                                                        (QREFELT
                                                                         $ 68))
                                                                       |r| |l|
                                                                       (QREFELT
                                                                        $ 69))
                                                                      (QREFELT
                                                                       $ 70))
                                                                     (QREFELT $
                                                                              67))
                                                                    (QREFELT $
                                                                             70))
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         $ 9)
                                                                        |r|
                                                                        (QREFELT
                                                                         $ 68))
                                                                       |i| |w|
                                                                       (QREFELT
                                                                        $ 69))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         $ 9)
                                                                        |r|
                                                                        (QREFELT
                                                                         $ 68))
                                                                       |w| |i|
                                                                       (QREFELT
                                                                        $ 69))
                                                                      (QREFELT
                                                                       $ 70))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         $ 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         $ 68))
                                                                       |j| |r|
                                                                       (QREFELT
                                                                        $ 69))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         $ 9)
                                                                        |l|
                                                                        (QREFELT
                                                                         $ 68))
                                                                       |r| |j|
                                                                       (QREFELT
                                                                        $ 69))
                                                                      (QREFELT
                                                                       $ 70))
                                                                     (QREFELT $
                                                                              67))
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (QREFELT
                                                                        $ 9)
                                                                       |t|
                                                                       (QREFELT
                                                                        $ 68))
                                                                      |k| |l|
                                                                      (QREFELT
                                                                       $ 69))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (QREFELT
                                                                        $ 9)
                                                                       |t|
                                                                       (QREFELT
                                                                        $ 68))
                                                                      |l| |k|
                                                                      (QREFELT
                                                                       $ 69))
                                                                     (QREFELT $
                                                                              70))
                                                                    (QREFELT $
                                                                             67))
                                                                   (QREFELT $
                                                                            73))
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
                                                            (QREFELT $ 54)))
                                                 (PROGN
                                                  (LETT #1#
                                                        (SEQ
                                                         (SPADCALL
                                                          "algebra is not Jordan admissible"
                                                          (QREFELT $ 76))
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
          (SPADCALL "algebra is Jordan admissible" (QREFELT $ 76))
          (EXIT 'T)))))
      #2# (EXIT #2#))))) 

(DEFUN |ALGSC;jordanAlgebra?;B;23| ($)
  (PROG (#1=#:G363 #2=#:G375 |res| #3=#:G382 |s| #4=#:G381 |r| #5=#:G380 |t|
         #6=#:G379 |l| #7=#:G378 |k| #8=#:G377 |j| #9=#:G376 |i|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((QEQCAR
          (SPADCALL (SPADCALL 2 (|spadConstant| $ 55) (QREFELT $ 86))
                    (QREFELT $ 87))
          1)
         (SEQ
          (SPADCALL
           "this is not a Jordan algebra, as 2 is not invertible in the ground ring"
           (QREFELT $ 76))
          (EXIT 'NIL)))
        ((SPADCALL (QREFELT $ 80))
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
                                                                             68))
                                                                           |i|
                                                                           |j|
                                                                           (QREFELT
                                                                            $
                                                                            69))
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (QREFELT
                                                                             $
                                                                             9)
                                                                            |s|
                                                                            (QREFELT
                                                                             $
                                                                             68))
                                                                           |l|
                                                                           |k|
                                                                           (QREFELT
                                                                            $
                                                                            69))
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
                                                                            68))
                                                                          |r|
                                                                          |s|
                                                                          (QREFELT
                                                                           $
                                                                           69))
                                                                         (QREFELT
                                                                          $
                                                                          67))
                                                                        (QREFELT
                                                                         $ 70))
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
                                                                            68))
                                                                          |l|
                                                                          |k|
                                                                          (QREFELT
                                                                           $
                                                                           69))
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QREFELT
                                                                            $
                                                                            9)
                                                                           |s|
                                                                           (QREFELT
                                                                            $
                                                                            68))
                                                                          |j|
                                                                          |r|
                                                                          (QREFELT
                                                                           $
                                                                           69))
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
                                                                           68))
                                                                         |i|
                                                                         |s|
                                                                         (QREFELT
                                                                          $
                                                                          69))
                                                                        (QREFELT
                                                                         $ 67))
                                                                       (QREFELT
                                                                        $ 73))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           $ 9)
                                                                          |r|
                                                                          (QREFELT
                                                                           $
                                                                           68))
                                                                         |l|
                                                                         |j|
                                                                         (QREFELT
                                                                          $
                                                                          69))
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (QREFELT
                                                                           $ 9)
                                                                          |s|
                                                                          (QREFELT
                                                                           $
                                                                           68))
                                                                         |k|
                                                                         |k|
                                                                         (QREFELT
                                                                          $
                                                                          69))
                                                                        (QREFELT
                                                                         $ 67))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          $ 9)
                                                                         |t|
                                                                         (QREFELT
                                                                          $
                                                                          68))
                                                                        |r| |s|
                                                                        (QREFELT
                                                                         $ 69))
                                                                       (QREFELT
                                                                        $ 67))
                                                                      (QREFELT
                                                                       $ 70))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          $ 9)
                                                                         |r|
                                                                         (QREFELT
                                                                          $
                                                                          68))
                                                                        |k| |i|
                                                                        (QREFELT
                                                                         $ 69))
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (QREFELT
                                                                          $ 9)
                                                                         |s|
                                                                         (QREFELT
                                                                          $
                                                                          68))
                                                                        |j| |r|
                                                                        (QREFELT
                                                                         $ 69))
                                                                       (QREFELT
                                                                        $ 67))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         $ 9)
                                                                        |t|
                                                                        (QREFELT
                                                                         $ 68))
                                                                       |l| |s|
                                                                       (QREFELT
                                                                        $ 69))
                                                                      (QREFELT
                                                                       $ 67))
                                                                     (QREFELT $
                                                                              73))
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         $ 9)
                                                                        |r|
                                                                        (QREFELT
                                                                         $ 68))
                                                                       |k| |j|
                                                                       (QREFELT
                                                                        $ 69))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         $ 9)
                                                                        |s|
                                                                        (QREFELT
                                                                         $ 68))
                                                                       |i| |k|
                                                                       (QREFELT
                                                                        $ 69))
                                                                      (QREFELT
                                                                       $ 67))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (QREFELT
                                                                        $ 9)
                                                                       |t|
                                                                       (QREFELT
                                                                        $ 68))
                                                                      |r| |s|
                                                                      (QREFELT
                                                                       $ 69))
                                                                     (QREFELT $
                                                                              67))
                                                                    (QREFELT $
                                                                             70))
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (QREFELT
                                                                        $ 9)
                                                                       |r|
                                                                       (QREFELT
                                                                        $ 68))
                                                                      |i| |l|
                                                                      (QREFELT
                                                                       $ 69))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (QREFELT
                                                                        $ 9)
                                                                       |s|
                                                                       (QREFELT
                                                                        $ 68))
                                                                      |j| |r|
                                                                      (QREFELT
                                                                       $ 69))
                                                                     (QREFELT $
                                                                              67))
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (QREFELT
                                                                       $ 9)
                                                                      |t|
                                                                      (QREFELT
                                                                       $ 68))
                                                                     |k| |s|
                                                                     (QREFELT $
                                                                              69))
                                                                    (QREFELT $
                                                                             67))
                                                                   (QREFELT $
                                                                            73))
                                                                  . #10#)
                                                            (EXIT
                                                             (COND
                                                              ((NULL
                                                                (SPADCALL |res|
                                                                          (QREFELT
                                                                           $
                                                                           54)))
                                                               (PROGN
                                                                (LETT #1#
                                                                      (SEQ
                                                                       (SPADCALL
                                                                        "this is not a Jordan algebra"
                                                                        (QREFELT
                                                                         $ 76))
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
          (SPADCALL "this is a Jordan algebra" (QREFELT $ 76)) (EXIT 'T)))
        ('T
         (SEQ (SPADCALL "this is not a Jordan algebra" (QREFELT $ 76))
              (EXIT 'NIL)))))
      #2# (EXIT #2#))))) 

(DEFUN |ALGSC;jacobiIdentity?;B;24| ($)
  (PROG (#1=#:G385 #2=#:G391 |res| #3=#:G396 |s| #4=#:G395 |r| #5=#:G394 |k|
         #6=#:G393 |j| #7=#:G392 |i|)
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
                                                                          68))
                                                                |i| |j|
                                                                (QREFELT $ 69))
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (QREFELT $ 9)
                                                                 |s|
                                                                 (QREFELT $
                                                                          68))
                                                                |j| |k|
                                                                (QREFELT $ 69))
                                                               (QREFELT $ 67))
                                                              (QREFELT $ 70))
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |r|
                                                                (QREFELT $ 68))
                                                      |j| |k| (QREFELT $ 69))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT $ 9)
                                                                |s|
                                                                (QREFELT $ 68))
                                                      |k| |i| (QREFELT $ 69))
                                                     (QREFELT $ 67))
                                                    (QREFELT $ 70))
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |r|
                                                               (QREFELT $ 68))
                                                     |k| |i| (QREFELT $ 69))
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 9)
                                                               |s|
                                                               (QREFELT $ 68))
                                                     |i| |j| (QREFELT $ 69))
                                                    (QREFELT $ 67))
                                                   (QREFELT $ 70))
                                                  . #8#)))
                                          (LETT |s| (|inc_SI| |s|) . #8#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (COND
                                       ((NULL (SPADCALL |res| (QREFELT $ 54)))
                                        (PROGN
                                         (LETT #1#
                                               (SEQ
                                                (SPADCALL
                                                 "Jacobi identity does not hold"
                                                 (QREFELT $ 76))
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
        (SPADCALL "Jacobi identity holds" (QREFELT $ 76)) (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |AlgebraGivenByStructuralConstants| (&REST #1=#:G401)
  (PROG ()
    (RETURN
     (PROG (#2=#:G402)
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
      (LETT $ (GETREFV 99) . #1#)
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
              (31 . |maxIndex|) (36 . |Zero|) (|NonNegativeInteger|)
              (40 . |new|) (47 . |elt|) (53 . |setColumn!|)
              (|Union| 20 '"failed")
              (|Record| (|:| |particular| 37) (|:| |basis| 95))
              (|LinearSystemMatrixPackage| 6 20 20 15) (60 . |solve|)
              (|Vector| $) |ALGSC;basis;V;7| |ALGSC;coordinates;$VV;6|
              (|PositiveInteger|) (66 . |unitVector|) |ALGSC;someBasis;V;8|
              |ALGSC;rank;Pi;9| (71 . |elt|) |ALGSC;elt;$IR;10| (|Boolean|)
              (77 . |zero?|) (|OutputForm|) (82 . |coerce|) (87 . |zero?|)
              (92 . |One|) (96 . =) (|Symbol|) (|List| 57) (102 . |elt|)
              (108 . |coerce|) (113 . *) (119 . +) (|Mapping| 52 52 52)
              (|List| 52) (125 . |reduce|) |ALGSC;coerce;$Of;11| (131 . *)
              (137 . |elt|) (143 . |elt|) (150 . +) (156 . |setelt|)
              |ALGSC;*;3$;12| (163 . -) (|Void|) (|String|)
              (169 . |messagePrint|) |ALGSC;alternative?;B;13|
              |ALGSC;associative?;B;14| |ALGSC;antiAssociative?;B;15|
              |ALGSC;commutative?;B;16| |ALGSC;antiCommutative?;B;17|
              |ALGSC;leftAlternative?;B;18| |ALGSC;rightAlternative?;B;19|
              |ALGSC;flexible?;B;20| |ALGSC;lieAdmissible?;B;21| (174 . *)
              (180 . |recip|) |ALGSC;jordanAdmissible?;B;22|
              |ALGSC;jordanAlgebra?;B;23| |ALGSC;jacobiIdentity?;B;24|
              (|SparseUnivariatePolynomial| (|Polynomial| 6))
              (|Record| (|:| |particular| $) (|:| |basis| (|List| $)))
              (|Union| 92 '"failed") (|SparseUnivariatePolynomial| 6)
              (|List| 20) (|List| (|Polynomial| 6)) (|SingleInteger|)
              (|HashState|))
           '#(~= 185 |zero?| 191 |unit| 196 |subtractIfCan| 200
              |structuralConstants| 206 |someBasis| 215 |sample| 219
              |rightUnits| 223 |rightUnit| 227 |rightTraceMatrix| 231
              |rightTrace| 240 |rightRegularRepresentation| 245 |rightRecip|
              256 |rightRankPolynomial| 261 |rightPower| 265 |rightNorm| 271
              |rightMinimalPolynomial| 276 |rightDiscriminant| 281
              |rightCharacteristicPolynomial| 290 |rightAlternative?| 295
              |represents| 299 |recip| 310 |rank| 315 |powerAssociative?| 319
              |plenaryPower| 323 |noncommutativeJordanAlgebra?| 329
              |lieAlgebra?| 333 |lieAdmissible?| 337 |leftUnits| 341 |leftUnit|
              345 |leftTraceMatrix| 349 |leftTrace| 358
              |leftRegularRepresentation| 363 |leftRecip| 374
              |leftRankPolynomial| 379 |leftPower| 383 |leftNorm| 389
              |leftMinimalPolynomial| 394 |leftDiscriminant| 399
              |leftCharacteristicPolynomial| 408 |leftAlternative?| 413 |latex|
              417 |jordanAlgebra?| 422 |jordanAdmissible?| 426
              |jacobiIdentity?| 430 |hashUpdate!| 434 |hash| 440 |flexible?|
              445 |elt| 449 |coordinates| 455 |convert| 477
              |conditionsForIdempotents| 487 |commutator| 496 |commutative?|
              502 |coerce| 506 |basis| 516 |associatorDependence| 520
              |associator| 524 |associative?| 531 |apply| 535 |antiCommutator|
              541 |antiCommutative?| 547 |antiAssociative?| 551 |alternative?|
              555 ^ 559 |Zero| 565 = 569 - 575 + 586 * 592)
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
                      (|BasicType|) (|CoercibleTo| 52) (|unitsKnown|))
                   (|makeByteWordVec2| 98
                                       '(1 12 11 0 13 1 16 15 0 17 2 0 0 15 0
                                         18 1 10 0 20 21 1 10 25 0 26 1 20 0 25
                                         27 1 30 29 0 31 0 6 0 32 3 15 0 33 33
                                         6 34 2 30 2 0 29 35 3 15 0 0 29 20 36
                                         2 39 38 15 20 40 1 10 0 44 45 2 10 6 0
                                         29 48 1 10 50 0 51 1 6 52 0 53 1 6 50
                                         0 54 0 6 0 55 2 6 50 0 0 56 2 58 57 0
                                         29 59 1 57 52 0 60 2 52 0 0 0 61 2 52
                                         0 0 0 62 2 64 52 63 0 65 2 6 0 0 0 67
                                         2 23 15 0 29 68 3 15 6 0 29 29 69 2 6
                                         0 0 0 70 3 20 6 0 29 6 71 2 6 0 0 0 73
                                         1 52 74 75 76 2 6 0 44 0 86 1 6 11 0
                                         87 2 0 50 0 0 1 1 0 50 0 1 0 1 11 1 2
                                         0 11 0 0 1 0 0 23 24 1 0 23 41 1 0 0
                                         41 46 0 0 0 1 0 1 93 1 0 1 11 1 0 0 15
                                         1 1 0 15 41 1 1 0 6 0 1 1 0 15 0 1 2 0
                                         15 0 41 1 1 1 11 0 1 0 2 91 1 2 0 0 0
                                         44 1 1 0 6 0 1 1 1 94 0 1 0 0 6 1 1 0
                                         6 41 1 1 0 94 0 1 0 0 50 83 1 0 0 20 1
                                         2 0 0 20 41 1 1 1 11 0 14 0 0 44 47 0
                                         0 50 1 2 0 0 0 44 1 0 0 50 1 0 0 50 1
                                         0 0 50 85 0 1 93 1 0 1 11 1 0 0 15 1 1
                                         0 15 41 1 1 0 6 0 1 1 0 15 0 1 2 0 15
                                         0 41 1 1 1 11 0 1 0 2 91 1 2 0 0 0 44
                                         1 1 0 6 0 1 1 1 94 0 1 0 0 6 1 1 0 6
                                         41 1 1 0 94 0 1 0 0 50 82 1 0 75 0 1 0
                                         0 50 89 0 0 50 88 0 0 50 90 2 0 98 98
                                         0 1 1 0 97 0 1 0 0 50 84 2 0 6 0 29 49
                                         1 0 20 0 28 1 0 15 41 1 2 0 15 41 41 1
                                         2 0 20 0 41 43 1 0 20 0 1 1 0 0 20 1 0
                                         0 96 1 1 0 96 41 1 2 0 0 0 0 1 0 0 50
                                         80 1 0 0 20 22 1 0 52 0 66 0 0 41 42 0
                                         1 95 1 3 0 0 0 0 0 1 0 0 50 78 2 0 0
                                         15 0 18 2 0 0 0 0 1 0 0 50 81 0 0 50
                                         79 0 0 50 77 2 0 0 0 44 1 0 0 0 1 2 0
                                         50 0 0 1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0
                                         0 1 2 0 0 16 0 19 2 0 0 0 6 1 2 0 0 6
                                         0 1 2 0 0 0 0 72 2 0 0 29 0 1 2 0 0 33
                                         0 1 2 0 0 44 0 1)))))
           '|lookupComplete|)) 
