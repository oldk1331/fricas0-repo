
(/VERSIONCHECK 2) 

(DEFUN |ALGPKG;convVM| (|v| $)
  (PROG (|z| #1=#:G135 |j| #2=#:G134 |i| |cond|)
    (RETURN
     (SEQ
      (LETT |cond|
            (SPADCALL (QREFELT $ 10) (QREFELT $ 10) (|spadConstant| $ 16)
                      (QREFELT $ 19))
            . #3=(|ALGPKG;convVM|))
      (LETT |z| 0 . #3#)
      (SEQ (LETT |i| 1 . #3#) (LETT #2# (QREFELT $ 10) . #3#) G190
           (COND ((|greater_SI| |i| #2#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #3#) (LETT #1# (QREFELT $ 10) . #3#) G190
                  (COND ((|greater_SI| |j| #1#) (GO G191)))
                  (SEQ (LETT |z| (+ |z| 1) . #3#)
                       (EXIT
                        (SPADCALL |cond| |i| |j|
                                  (SPADCALL |v| |z| (QREFELT $ 23))
                                  (QREFELT $ 24))))
                  (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |cond|))))) 

(DEFUN |ALGPKG;radicalOfLeftTraceForm;L;2| ($)
  (PROG (|ma|)
    (RETURN
     (SEQ
      (LETT |ma| (SPADCALL (QREFELT $ 25)) |ALGPKG;radicalOfLeftTraceForm;L;2|)
      (EXIT
       (SPADCALL (ELT $ 26) (SPADCALL |ma| (QREFELT $ 28)) (QREFELT $ 32))))))) 

(DEFUN |ALGPKG;basisOfLeftAnnihilator;AL;3| (|a| $)
  (PROG (|cond| #1=#:G145 #2=#:G147 |i| #3=#:G146 |ca|)
    (RETURN
     (SEQ
      (LETT |ca|
            (SPADCALL (SPADCALL (SPADCALL |a| (QREFELT $ 34)) (QREFELT $ 35))
                      (QREFELT $ 36))
            . #4=(|ALGPKG;basisOfLeftAnnihilator;AL;3|))
      (LETT |cond|
            (SPADCALL (ELT $ 37)
                      (PROGN
                       (LETT #3# (GETREFV #5=(QVSIZE (QREFELT $ 15))) . #4#)
                       (SEQ (LETT |i| 1 . #4#) (LETT #2# #5# . #4#)
                            (LETT #1# 0 . #4#) G190
                            (COND ((|greater_SI| |i| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SETELT #3# #1#
                                      (SPADCALL |ca|
                                                (SPADCALL
                                                 (SPADCALL (QREFELT $ 15) |i|
                                                           (QREFELT $ 38))
                                                 (QREFELT $ 36))
                                                (QREFELT $ 39)))))
                            (LETT #1#
                                  (PROG1 (|inc_SI| #1#)
                                    (LETT |i| (|inc_SI| |i|) . #4#))
                                  . #4#)
                            (GO G190) G191 (EXIT NIL))
                       #3#)
                      (QREFELT $ 41))
            . #4#)
      (EXIT
       (SPADCALL (ELT $ 26) (SPADCALL |cond| (QREFELT $ 28))
                 (QREFELT $ 32))))))) 

(DEFUN |ALGPKG;basisOfRightAnnihilator;AL;4| (|a| $)
  (PROG (|cond| #1=#:G154 #2=#:G156 |i| #3=#:G155 |ca|)
    (RETURN
     (SEQ
      (LETT |ca|
            (SPADCALL (SPADCALL (SPADCALL |a| (QREFELT $ 34)) (QREFELT $ 35))
                      (QREFELT $ 36))
            . #4=(|ALGPKG;basisOfRightAnnihilator;AL;4|))
      (LETT |cond|
            (SPADCALL (ELT $ 37)
                      (PROGN
                       (LETT #3# (GETREFV #5=(QVSIZE (QREFELT $ 15))) . #4#)
                       (SEQ (LETT |i| 1 . #4#) (LETT #2# #5# . #4#)
                            (LETT #1# 0 . #4#) G190
                            (COND ((|greater_SI| |i| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SETELT #3# #1#
                                      (SPADCALL |ca|
                                                (SPADCALL (QREFELT $ 15) |i|
                                                          (QREFELT $ 38))
                                                (QREFELT $ 39)))))
                            (LETT #1#
                                  (PROG1 (|inc_SI| #1#)
                                    (LETT |i| (|inc_SI| |i|) . #4#))
                                  . #4#)
                            (GO G190) G191 (EXIT NIL))
                       #3#)
                      (QREFELT $ 41))
            . #4#)
      (EXIT
       (SPADCALL (ELT $ 26) (SPADCALL |cond| (QREFELT $ 28))
                 (QREFELT $ 32))))))) 

(DEFUN |ALGPKG;basisOfLeftNucloid;L;5| ($)
  (PROG (#1=#:G172 |sol| #2=#:G171 |r2| |r1| #3=#:G170 |r| |z| #4=#:G169 |k|
         #5=#:G168 |j| #6=#:G167 |i| |condo| |cond|)
    (RETURN
     (SEQ
      (LETT |cond|
            (SPADCALL (QREFELT $ 12) (QREFELT $ 11) (|spadConstant| $ 16)
                      (QREFELT $ 19))
            . #7=(|ALGPKG;basisOfLeftNucloid;L;5|))
      (LETT |condo|
            (SPADCALL (QREFELT $ 12) (QREFELT $ 11) (|spadConstant| $ 16)
                      (QREFELT $ 19))
            . #7#)
      (LETT |z| 0 . #7#)
      (SEQ (LETT |i| 1 . #7#) (LETT #6# (QREFELT $ 10) . #7#) G190
           (COND ((|greater_SI| |i| #6#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #7#) (LETT #5# (QREFELT $ 10) . #7#) G190
                  (COND ((|greater_SI| |j| #5#) (GO G191)))
                  (SEQ (LETT |r1| 0 . #7#)
                       (EXIT
                        (SEQ (LETT |k| 1 . #7#) (LETT #4# (QREFELT $ 10) . #7#)
                             G190 (COND ((|greater_SI| |k| #4#) (GO G191)))
                             (SEQ (LETT |z| (+ |z| 1) . #7#)
                                  (LETT |r2| |i| . #7#)
                                  (EXIT
                                   (SEQ (LETT |r| 1 . #7#)
                                        (LETT #3# (QREFELT $ 10) . #7#) G190
                                        (COND
                                         ((|greater_SI| |r| #3#) (GO G191)))
                                        (SEQ (LETT |r1| (+ |r1| 1) . #7#)
                                             (SPADCALL |cond| |z| |r1|
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (QREFELT $ 15) |r|
                                                         (QREFELT $ 38))
                                                        |i| |j| (QREFELT $ 44))
                                                       (QREFELT $ 24))
                                             (SPADCALL |condo| |z| |r2|
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT $ 15) |k|
                                                          (QREFELT $ 38))
                                                         |r| |j|
                                                         (QREFELT $ 44))
                                                        (QREFELT $ 45))
                                                       (QREFELT $ 24))
                                             (EXIT
                                              (LETT |r2|
                                                    (+ |r2| (QREFELT $ 10))
                                                    . #7#)))
                                        (LETT |r| (|inc_SI| |r|) . #7#)
                                        (GO G190) G191 (EXIT NIL))))
                             (LETT |k| (|inc_SI| |k|) . #7#) (GO G190) G191
                             (EXIT NIL))))
                  (LETT |j| (|inc_SI| |j|) . #7#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (PROGN
        (LETT #2# NIL . #7#)
        (SEQ (LETT |sol| NIL . #7#)
             (LETT #1#
                   (SPADCALL (SPADCALL |cond| |condo| (QREFELT $ 46))
                             (QREFELT $ 28))
                   . #7#)
             G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |sol| (CAR #1#) . #7#) NIL))
               (GO G191)))
             (SEQ (EXIT (LETT #2# (CONS (|ALGPKG;convVM| |sol| $) #2#) . #7#)))
             (LETT #1# (CDR #1#) . #7#) (GO G190) G191
             (EXIT (NREVERSE #2#))))))))) 

(DEFUN |ALGPKG;basisOfCommutingElements;L;6| ($)
  (PROG (|cond| |gam| #1=#:G179 #2=#:G181 |i| #3=#:G180)
    (RETURN
     (SEQ
      (LETT |cond|
            (SPADCALL (ELT $ 37)
                      (PROGN
                       (LETT #3# (GETREFV #4=(QVSIZE (QREFELT $ 15)))
                             . #5=(|ALGPKG;basisOfCommutingElements;L;6|))
                       (SEQ (LETT |i| 1 . #5#) (LETT #2# #4# . #5#)
                            (LETT #1# 0 . #5#) G190
                            (COND ((|greater_SI| |i| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SETELT #3# #1#
                                      (SPADCALL
                                       (LETT |gam|
                                             (SPADCALL (QREFELT $ 15) |i|
                                                       (QREFELT $ 38))
                                             . #5#)
                                       (SPADCALL |gam| (QREFELT $ 36))
                                       (QREFELT $ 49)))))
                            (LETT #1#
                                  (PROG1 (|inc_SI| #1#)
                                    (LETT |i| (|inc_SI| |i|) . #5#))
                                  . #5#)
                            (GO G190) G191 (EXIT NIL))
                       #3#)
                      (QREFELT $ 41))
            . #5#)
      (EXIT
       (SPADCALL (ELT $ 26) (SPADCALL |cond| (QREFELT $ 28))
                 (QREFELT $ 32))))))) 

(DEFUN |ALGPKG;basisOfLeftNucleus;L;7| ($)
  (PROG (|entry| #1=#:G196 |l| #2=#:G195 |i| |z| #3=#:G194 |s| #4=#:G193 |j|
         #5=#:G192 |k| |condi|)
    (RETURN
     (SEQ
      (LETT |condi|
            (SPADCALL (QREFELT $ 12) (QREFELT $ 10) (|spadConstant| $ 16)
                      (QREFELT $ 19))
            . #6=(|ALGPKG;basisOfLeftNucleus;L;7|))
      (LETT |z| 0 . #6#)
      (SEQ (LETT |k| 1 . #6#) (LETT #5# (QREFELT $ 10) . #6#) G190
           (COND ((|greater_SI| |k| #5#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #6#) (LETT #4# (QREFELT $ 10) . #6#) G190
                  (COND ((|greater_SI| |j| #4#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |s| 1 . #6#) (LETT #3# (QREFELT $ 10) . #6#)
                         G190 (COND ((|greater_SI| |s| #3#) (GO G191)))
                         (SEQ (LETT |z| (+ |z| 1) . #6#)
                              (EXIT
                               (SEQ (LETT |i| 1 . #6#)
                                    (LETT #2# (QREFELT $ 10) . #6#) G190
                                    (COND ((|greater_SI| |i| #2#) (GO G191)))
                                    (SEQ
                                     (LETT |entry| (|spadConstant| $ 16) . #6#)
                                     (SEQ (LETT |l| 1 . #6#)
                                          (LETT #1# (QREFELT $ 10) . #6#) G190
                                          (COND
                                           ((|greater_SI| |l| #1#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |entry|
                                                  (SPADCALL
                                                   (SPADCALL |entry|
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 15)
                                                                |l|
                                                                (QREFELT $ 38))
                                                               |j| |k|
                                                               (QREFELT $ 44))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 15)
                                                                |s|
                                                                (QREFELT $ 38))
                                                               |i| |l|
                                                               (QREFELT $ 44))
                                                              (QREFELT $ 51))
                                                             (QREFELT $ 52))
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 15)
                                                               |l|
                                                               (QREFELT $ 38))
                                                     |i| |j| (QREFELT $ 44))
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 15)
                                                               |s|
                                                               (QREFELT $ 38))
                                                     |l| |k| (QREFELT $ 44))
                                                    (QREFELT $ 51))
                                                   (QREFELT $ 53))
                                                  . #6#)))
                                          (LETT |l| (|inc_SI| |l|) . #6#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (SPADCALL |condi| |z| |i| |entry|
                                                (QREFELT $ 24))))
                                    (LETT |i| (|inc_SI| |i|) . #6#) (GO G190)
                                    G191 (EXIT NIL))))
                         (LETT |s| (|inc_SI| |s|) . #6#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191 (EXIT NIL))))
           (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL (ELT $ 26) (SPADCALL |condi| (QREFELT $ 28))
                 (QREFELT $ 32))))))) 

(DEFUN |ALGPKG;basisOfRightNucleus;L;8| ($)
  (PROG (|entry| #1=#:G211 |l| #2=#:G210 |i| |z| #3=#:G209 |s| #4=#:G208 |j|
         #5=#:G207 |k| |condo|)
    (RETURN
     (SEQ
      (LETT |condo|
            (SPADCALL (QREFELT $ 12) (QREFELT $ 10) (|spadConstant| $ 16)
                      (QREFELT $ 19))
            . #6=(|ALGPKG;basisOfRightNucleus;L;8|))
      (LETT |z| 0 . #6#)
      (SEQ (LETT |k| 1 . #6#) (LETT #5# (QREFELT $ 10) . #6#) G190
           (COND ((|greater_SI| |k| #5#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #6#) (LETT #4# (QREFELT $ 10) . #6#) G190
                  (COND ((|greater_SI| |j| #4#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |s| 1 . #6#) (LETT #3# (QREFELT $ 10) . #6#)
                         G190 (COND ((|greater_SI| |s| #3#) (GO G191)))
                         (SEQ (LETT |z| (+ |z| 1) . #6#)
                              (EXIT
                               (SEQ (LETT |i| 1 . #6#)
                                    (LETT #2# (QREFELT $ 10) . #6#) G190
                                    (COND ((|greater_SI| |i| #2#) (GO G191)))
                                    (SEQ
                                     (LETT |entry| (|spadConstant| $ 16) . #6#)
                                     (SEQ (LETT |l| 1 . #6#)
                                          (LETT #1# (QREFELT $ 10) . #6#) G190
                                          (COND
                                           ((|greater_SI| |l| #1#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |entry|
                                                  (SPADCALL
                                                   (SPADCALL |entry|
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 15)
                                                                |l|
                                                                (QREFELT $ 38))
                                                               |k| |i|
                                                               (QREFELT $ 44))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 15)
                                                                |s|
                                                                (QREFELT $ 38))
                                                               |j| |l|
                                                               (QREFELT $ 44))
                                                              (QREFELT $ 51))
                                                             (QREFELT $ 52))
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 15)
                                                               |l|
                                                               (QREFELT $ 38))
                                                     |j| |k| (QREFELT $ 44))
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 15)
                                                               |s|
                                                               (QREFELT $ 38))
                                                     |l| |i| (QREFELT $ 44))
                                                    (QREFELT $ 51))
                                                   (QREFELT $ 53))
                                                  . #6#)))
                                          (LETT |l| (|inc_SI| |l|) . #6#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (SPADCALL |condo| |z| |i| |entry|
                                                (QREFELT $ 24))))
                                    (LETT |i| (|inc_SI| |i|) . #6#) (GO G190)
                                    G191 (EXIT NIL))))
                         (LETT |s| (|inc_SI| |s|) . #6#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191 (EXIT NIL))))
           (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL (ELT $ 26) (SPADCALL |condo| (QREFELT $ 28))
                 (QREFELT $ 32))))))) 

(DEFUN |ALGPKG;basisOfMiddleNucleus;L;9| ($)
  (PROG (|entry| #1=#:G226 |l| #2=#:G225 |i| |z| #3=#:G224 |s| #4=#:G223 |j|
         #5=#:G222 |k| |conda|)
    (RETURN
     (SEQ
      (LETT |conda|
            (SPADCALL (QREFELT $ 12) (QREFELT $ 10) (|spadConstant| $ 16)
                      (QREFELT $ 19))
            . #6=(|ALGPKG;basisOfMiddleNucleus;L;9|))
      (LETT |z| 0 . #6#)
      (SEQ (LETT |k| 1 . #6#) (LETT #5# (QREFELT $ 10) . #6#) G190
           (COND ((|greater_SI| |k| #5#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #6#) (LETT #4# (QREFELT $ 10) . #6#) G190
                  (COND ((|greater_SI| |j| #4#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |s| 1 . #6#) (LETT #3# (QREFELT $ 10) . #6#)
                         G190 (COND ((|greater_SI| |s| #3#) (GO G191)))
                         (SEQ (LETT |z| (+ |z| 1) . #6#)
                              (EXIT
                               (SEQ (LETT |i| 1 . #6#)
                                    (LETT #2# (QREFELT $ 10) . #6#) G190
                                    (COND ((|greater_SI| |i| #2#) (GO G191)))
                                    (SEQ
                                     (LETT |entry| (|spadConstant| $ 16) . #6#)
                                     (SEQ (LETT |l| 1 . #6#)
                                          (LETT #1# (QREFELT $ 10) . #6#) G190
                                          (COND
                                           ((|greater_SI| |l| #1#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |entry|
                                                  (SPADCALL
                                                   (SPADCALL |entry|
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 15)
                                                                |l|
                                                                (QREFELT $ 38))
                                                               |j| |i|
                                                               (QREFELT $ 44))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 15)
                                                                |s|
                                                                (QREFELT $ 38))
                                                               |l| |k|
                                                               (QREFELT $ 44))
                                                              (QREFELT $ 51))
                                                             (QREFELT $ 52))
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 15)
                                                               |l|
                                                               (QREFELT $ 38))
                                                     |i| |k| (QREFELT $ 44))
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 15)
                                                               |s|
                                                               (QREFELT $ 38))
                                                     |j| |l| (QREFELT $ 44))
                                                    (QREFELT $ 51))
                                                   (QREFELT $ 53))
                                                  . #6#)))
                                          (LETT |l| (|inc_SI| |l|) . #6#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (SPADCALL |conda| |z| |i| |entry|
                                                (QREFELT $ 24))))
                                    (LETT |i| (|inc_SI| |i|) . #6#) (GO G190)
                                    G191 (EXIT NIL))))
                         (LETT |s| (|inc_SI| |s|) . #6#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191 (EXIT NIL))))
           (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL (ELT $ 26) (SPADCALL |conda| (QREFELT $ 28))
                 (QREFELT $ 32))))))) 

(DEFUN |ALGPKG;basisOfNucleus;L;10| ($)
  (PROG (|ent| |enter| |entry| #1=#:G242 |l| #2=#:G241 |i| |w| |u| |z|
         #3=#:G240 |s| #4=#:G239 |j| #5=#:G238 |k| |condi|)
    (RETURN
     (SEQ
      (LETT |condi|
            (SPADCALL (* 3 (QREFELT $ 12)) (QREFELT $ 10) (|spadConstant| $ 16)
                      (QREFELT $ 19))
            . #6=(|ALGPKG;basisOfNucleus;L;10|))
      (LETT |z| 0 . #6#) (LETT |u| (QREFELT $ 12) . #6#)
      (LETT |w| (* 2 (QREFELT $ 12)) . #6#)
      (SEQ (LETT |k| 1 . #6#) (LETT #5# (QREFELT $ 10) . #6#) G190
           (COND ((|greater_SI| |k| #5#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #6#) (LETT #4# (QREFELT $ 10) . #6#) G190
                  (COND ((|greater_SI| |j| #4#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |s| 1 . #6#) (LETT #3# (QREFELT $ 10) . #6#)
                         G190 (COND ((|greater_SI| |s| #3#) (GO G191)))
                         (SEQ (LETT |z| (+ |z| 1) . #6#)
                              (LETT |u| (+ |u| 1) . #6#)
                              (LETT |w| (+ |w| 1) . #6#)
                              (EXIT
                               (SEQ (LETT |i| 1 . #6#)
                                    (LETT #2# (QREFELT $ 10) . #6#) G190
                                    (COND ((|greater_SI| |i| #2#) (GO G191)))
                                    (SEQ
                                     (LETT |entry| (|spadConstant| $ 16) . #6#)
                                     (LETT |enter| (|spadConstant| $ 16) . #6#)
                                     (LETT |ent| (|spadConstant| $ 16) . #6#)
                                     (SEQ (LETT |l| 1 . #6#)
                                          (LETT #1# (QREFELT $ 10) . #6#) G190
                                          (COND
                                           ((|greater_SI| |l| #1#) (GO G191)))
                                          (SEQ
                                           (LETT |entry|
                                                 (SPADCALL
                                                  (SPADCALL |entry|
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT $ 15)
                                                               |l|
                                                               (QREFELT $ 38))
                                                              |j| |k|
                                                              (QREFELT $ 44))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT $ 15)
                                                               |s|
                                                               (QREFELT $ 38))
                                                              |i| |l|
                                                              (QREFELT $ 44))
                                                             (QREFELT $ 51))
                                                            (QREFELT $ 52))
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL (QREFELT $ 15)
                                                              |l|
                                                              (QREFELT $ 38))
                                                    |i| |j| (QREFELT $ 44))
                                                   (SPADCALL
                                                    (SPADCALL (QREFELT $ 15)
                                                              |s|
                                                              (QREFELT $ 38))
                                                    |l| |k| (QREFELT $ 44))
                                                   (QREFELT $ 51))
                                                  (QREFELT $ 53))
                                                 . #6#)
                                           (LETT |enter|
                                                 (SPADCALL
                                                  (SPADCALL |enter|
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT $ 15)
                                                               |l|
                                                               (QREFELT $ 38))
                                                              |k| |i|
                                                              (QREFELT $ 44))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT $ 15)
                                                               |s|
                                                               (QREFELT $ 38))
                                                              |j| |l|
                                                              (QREFELT $ 44))
                                                             (QREFELT $ 51))
                                                            (QREFELT $ 52))
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL (QREFELT $ 15)
                                                              |l|
                                                              (QREFELT $ 38))
                                                    |j| |k| (QREFELT $ 44))
                                                   (SPADCALL
                                                    (SPADCALL (QREFELT $ 15)
                                                              |s|
                                                              (QREFELT $ 38))
                                                    |l| |i| (QREFELT $ 44))
                                                   (QREFELT $ 51))
                                                  (QREFELT $ 53))
                                                 . #6#)
                                           (EXIT
                                            (LETT |ent|
                                                  (SPADCALL
                                                   (SPADCALL |ent|
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 15)
                                                                |l|
                                                                (QREFELT $ 38))
                                                               |j| |k|
                                                               (QREFELT $ 44))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 15)
                                                                |s|
                                                                (QREFELT $ 38))
                                                               |i| |l|
                                                               (QREFELT $ 44))
                                                              (QREFELT $ 51))
                                                             (QREFELT $ 52))
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 15)
                                                               |l|
                                                               (QREFELT $ 38))
                                                     |j| |i| (QREFELT $ 44))
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 15)
                                                               |s|
                                                               (QREFELT $ 38))
                                                     |l| |k| (QREFELT $ 44))
                                                    (QREFELT $ 51))
                                                   (QREFELT $ 53))
                                                  . #6#)))
                                          (LETT |l| (|inc_SI| |l|) . #6#)
                                          (GO G190) G191 (EXIT NIL))
                                     (SPADCALL |condi| |z| |i| |entry|
                                               (QREFELT $ 24))
                                     (SPADCALL |condi| |u| |i| |enter|
                                               (QREFELT $ 24))
                                     (EXIT
                                      (SPADCALL |condi| |w| |i| |ent|
                                                (QREFELT $ 24))))
                                    (LETT |i| (|inc_SI| |i|) . #6#) (GO G190)
                                    G191 (EXIT NIL))))
                         (LETT |s| (|inc_SI| |s|) . #6#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191 (EXIT NIL))))
           (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL (ELT $ 26) (SPADCALL |condi| (QREFELT $ 28))
                 (QREFELT $ 32))))))) 

(DEFUN |ALGPKG;basisOfCenter;L;11| ($)
  (PROG (D |enter| |entry| #1=#:G261 |l| #2=#:G260 |i| |u| |z| #3=#:G259 |s|
         #4=#:G258 |j| #5=#:G257 |k| |condi| B |cond| |gammak| #6=#:G256
         |gamma1|)
    (RETURN
     (SEQ
      (LETT |gamma1| (SPADCALL (QREFELT $ 15) (QREFELT $ 58))
            . #7=(|ALGPKG;basisOfCenter;L;11|))
      (LETT |gamma1|
            (SPADCALL |gamma1| (SPADCALL |gamma1| (QREFELT $ 36))
                      (QREFELT $ 49))
            . #7#)
      (LETT |cond| |gamma1| . #7#)
      (SEQ (LETT |i| 2 . #7#) (LETT #6# (QREFELT $ 10) . #7#) G190
           (COND ((|greater_SI| |i| #6#) (GO G191)))
           (SEQ
            (LETT |gammak| (SPADCALL (QREFELT $ 15) |i| (QREFELT $ 38)) . #7#)
            (LETT |gammak|
                  (SPADCALL |gammak| (SPADCALL |gammak| (QREFELT $ 36))
                            (QREFELT $ 49))
                  . #7#)
            (EXIT
             (LETT |cond| (SPADCALL |cond| |gammak| (QREFELT $ 37)) . #7#)))
           (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
      (LETT B |cond| . #7#)
      (LETT |condi|
            (SPADCALL (* 2 (QREFELT $ 12)) (QREFELT $ 10) (|spadConstant| $ 16)
                      (QREFELT $ 19))
            . #7#)
      (LETT |z| 0 . #7#) (LETT |u| (QREFELT $ 12) . #7#)
      (SEQ (LETT |k| 1 . #7#) (LETT #5# (QREFELT $ 10) . #7#) G190
           (COND ((|greater_SI| |k| #5#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #7#) (LETT #4# (QREFELT $ 10) . #7#) G190
                  (COND ((|greater_SI| |j| #4#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |s| 1 . #7#) (LETT #3# (QREFELT $ 10) . #7#)
                         G190 (COND ((|greater_SI| |s| #3#) (GO G191)))
                         (SEQ (LETT |z| (+ |z| 1) . #7#)
                              (LETT |u| (+ |u| 1) . #7#)
                              (EXIT
                               (SEQ (LETT |i| 1 . #7#)
                                    (LETT #2# (QREFELT $ 10) . #7#) G190
                                    (COND ((|greater_SI| |i| #2#) (GO G191)))
                                    (SEQ
                                     (LETT |entry| (|spadConstant| $ 16) . #7#)
                                     (LETT |enter| (|spadConstant| $ 16) . #7#)
                                     (SEQ (LETT |l| 1 . #7#)
                                          (LETT #1# (QREFELT $ 10) . #7#) G190
                                          (COND
                                           ((|greater_SI| |l| #1#) (GO G191)))
                                          (SEQ
                                           (LETT |entry|
                                                 (SPADCALL
                                                  (SPADCALL |entry|
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT $ 15)
                                                               |l|
                                                               (QREFELT $ 38))
                                                              |j| |k|
                                                              (QREFELT $ 44))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT $ 15)
                                                               |s|
                                                               (QREFELT $ 38))
                                                              |i| |l|
                                                              (QREFELT $ 44))
                                                             (QREFELT $ 51))
                                                            (QREFELT $ 52))
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL (QREFELT $ 15)
                                                              |l|
                                                              (QREFELT $ 38))
                                                    |i| |j| (QREFELT $ 44))
                                                   (SPADCALL
                                                    (SPADCALL (QREFELT $ 15)
                                                              |s|
                                                              (QREFELT $ 38))
                                                    |l| |k| (QREFELT $ 44))
                                                   (QREFELT $ 51))
                                                  (QREFELT $ 53))
                                                 . #7#)
                                           (EXIT
                                            (LETT |enter|
                                                  (SPADCALL
                                                   (SPADCALL |enter|
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 15)
                                                                |l|
                                                                (QREFELT $ 38))
                                                               |k| |i|
                                                               (QREFELT $ 44))
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (QREFELT $ 15)
                                                                |s|
                                                                (QREFELT $ 38))
                                                               |j| |l|
                                                               (QREFELT $ 44))
                                                              (QREFELT $ 51))
                                                             (QREFELT $ 52))
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 15)
                                                               |l|
                                                               (QREFELT $ 38))
                                                     |j| |k| (QREFELT $ 44))
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT $ 15)
                                                               |s|
                                                               (QREFELT $ 38))
                                                     |l| |i| (QREFELT $ 44))
                                                    (QREFELT $ 51))
                                                   (QREFELT $ 53))
                                                  . #7#)))
                                          (LETT |l| (|inc_SI| |l|) . #7#)
                                          (GO G190) G191 (EXIT NIL))
                                     (SPADCALL |condi| |z| |i| |entry|
                                               (QREFELT $ 24))
                                     (EXIT
                                      (SPADCALL |condi| |u| |i| |enter|
                                                (QREFELT $ 24))))
                                    (LETT |i| (|inc_SI| |i|) . #7#) (GO G190)
                                    G191 (EXIT NIL))))
                         (LETT |s| (|inc_SI| |s|) . #7#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT |j| (|inc_SI| |j|) . #7#) (GO G190) G191 (EXIT NIL))))
           (LETT |k| (|inc_SI| |k|) . #7#) (GO G190) G191 (EXIT NIL))
      (LETT D (SPADCALL |condi| B (QREFELT $ 37)) . #7#)
      (EXIT
       (SPADCALL (ELT $ 26) (SPADCALL D (QREFELT $ 28)) (QREFELT $ 32))))))) 

(DEFUN |ALGPKG;basisOfRightNucloid;L;12| ($)
  (PROG (#1=#:G277 |sol| #2=#:G276 |r2| |r1| #3=#:G275 |r| |z| #4=#:G274 |k|
         #5=#:G273 |j| #6=#:G272 |i| |condo| |cond|)
    (RETURN
     (SEQ
      (LETT |cond|
            (SPADCALL (QREFELT $ 12) (QREFELT $ 11) (|spadConstant| $ 16)
                      (QREFELT $ 19))
            . #7=(|ALGPKG;basisOfRightNucloid;L;12|))
      (LETT |condo|
            (SPADCALL (QREFELT $ 12) (QREFELT $ 11) (|spadConstant| $ 16)
                      (QREFELT $ 19))
            . #7#)
      (LETT |z| 0 . #7#)
      (SEQ (LETT |i| 1 . #7#) (LETT #6# (QREFELT $ 10) . #7#) G190
           (COND ((|greater_SI| |i| #6#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #7#) (LETT #5# (QREFELT $ 10) . #7#) G190
                  (COND ((|greater_SI| |j| #5#) (GO G191)))
                  (SEQ (LETT |r1| 0 . #7#)
                       (EXIT
                        (SEQ (LETT |k| 1 . #7#) (LETT #4# (QREFELT $ 10) . #7#)
                             G190 (COND ((|greater_SI| |k| #4#) (GO G191)))
                             (SEQ (LETT |z| (+ |z| 1) . #7#)
                                  (LETT |r2| |i| . #7#)
                                  (EXIT
                                   (SEQ (LETT |r| 1 . #7#)
                                        (LETT #3# (QREFELT $ 10) . #7#) G190
                                        (COND
                                         ((|greater_SI| |r| #3#) (GO G191)))
                                        (SEQ (LETT |r1| (+ |r1| 1) . #7#)
                                             (SPADCALL |cond| |z| |r1|
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (QREFELT $ 15) |r|
                                                         (QREFELT $ 38))
                                                        |j| |i| (QREFELT $ 44))
                                                       (QREFELT $ 24))
                                             (SPADCALL |condo| |z| |r2|
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT $ 15) |k|
                                                          (QREFELT $ 38))
                                                         |j| |r|
                                                         (QREFELT $ 44))
                                                        (QREFELT $ 45))
                                                       (QREFELT $ 24))
                                             (EXIT
                                              (LETT |r2|
                                                    (+ |r2| (QREFELT $ 10))
                                                    . #7#)))
                                        (LETT |r| (|inc_SI| |r|) . #7#)
                                        (GO G190) G191 (EXIT NIL))))
                             (LETT |k| (|inc_SI| |k|) . #7#) (GO G190) G191
                             (EXIT NIL))))
                  (LETT |j| (|inc_SI| |j|) . #7#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (PROGN
        (LETT #2# NIL . #7#)
        (SEQ (LETT |sol| NIL . #7#)
             (LETT #1#
                   (SPADCALL (SPADCALL |cond| |condo| (QREFELT $ 46))
                             (QREFELT $ 28))
                   . #7#)
             G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |sol| (CAR #1#) . #7#) NIL))
               (GO G191)))
             (SEQ (EXIT (LETT #2# (CONS (|ALGPKG;convVM| |sol| $) #2#) . #7#)))
             (LETT #1# (CDR #1#) . #7#) (GO G190) G191
             (EXIT (NREVERSE #2#))))))))) 

(DEFUN |ALGPKG;basisOfCentroid;L;13| ($)
  (PROG (#1=#:G293 |sol| #2=#:G292 |r2| |r1| #3=#:G291 |r| |u| |z| #4=#:G290
         |k| #5=#:G289 |j| #6=#:G288 |i| |condo| |cond|)
    (RETURN
     (SEQ
      (LETT |cond|
            (SPADCALL (* 2 (QREFELT $ 12)) (QREFELT $ 11) (|spadConstant| $ 16)
                      (QREFELT $ 19))
            . #7=(|ALGPKG;basisOfCentroid;L;13|))
      (LETT |condo|
            (SPADCALL (* 2 (QREFELT $ 12)) (QREFELT $ 11) (|spadConstant| $ 16)
                      (QREFELT $ 19))
            . #7#)
      (LETT |z| 0 . #7#) (LETT |u| (QREFELT $ 12) . #7#)
      (SEQ (LETT |i| 1 . #7#) (LETT #6# (QREFELT $ 10) . #7#) G190
           (COND ((|greater_SI| |i| #6#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #7#) (LETT #5# (QREFELT $ 10) . #7#) G190
                  (COND ((|greater_SI| |j| #5#) (GO G191)))
                  (SEQ (LETT |r1| 0 . #7#)
                       (EXIT
                        (SEQ (LETT |k| 1 . #7#) (LETT #4# (QREFELT $ 10) . #7#)
                             G190 (COND ((|greater_SI| |k| #4#) (GO G191)))
                             (SEQ (LETT |z| (+ |z| 1) . #7#)
                                  (LETT |u| (+ |u| 1) . #7#)
                                  (LETT |r2| |i| . #7#)
                                  (EXIT
                                   (SEQ (LETT |r| 1 . #7#)
                                        (LETT #3# (QREFELT $ 10) . #7#) G190
                                        (COND
                                         ((|greater_SI| |r| #3#) (GO G191)))
                                        (SEQ (LETT |r1| (+ |r1| 1) . #7#)
                                             (SPADCALL |cond| |z| |r1|
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (QREFELT $ 15) |r|
                                                         (QREFELT $ 38))
                                                        |i| |j| (QREFELT $ 44))
                                                       (QREFELT $ 24))
                                             (SPADCALL |cond| |u| |r1|
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (QREFELT $ 15) |r|
                                                         (QREFELT $ 38))
                                                        |j| |i| (QREFELT $ 44))
                                                       (QREFELT $ 24))
                                             (SPADCALL |condo| |z| |r2|
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT $ 15) |k|
                                                          (QREFELT $ 38))
                                                         |r| |j|
                                                         (QREFELT $ 44))
                                                        (QREFELT $ 45))
                                                       (QREFELT $ 24))
                                             (SPADCALL |condo| |u| |r2|
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT $ 15) |k|
                                                          (QREFELT $ 38))
                                                         |j| |r|
                                                         (QREFELT $ 44))
                                                        (QREFELT $ 45))
                                                       (QREFELT $ 24))
                                             (EXIT
                                              (LETT |r2|
                                                    (+ |r2| (QREFELT $ 10))
                                                    . #7#)))
                                        (LETT |r| (|inc_SI| |r|) . #7#)
                                        (GO G190) G191 (EXIT NIL))))
                             (LETT |k| (|inc_SI| |k|) . #7#) (GO G190) G191
                             (EXIT NIL))))
                  (LETT |j| (|inc_SI| |j|) . #7#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (PROGN
        (LETT #2# NIL . #7#)
        (SEQ (LETT |sol| NIL . #7#)
             (LETT #1#
                   (SPADCALL (SPADCALL |cond| |condo| (QREFELT $ 46))
                             (QREFELT $ 28))
                   . #7#)
             G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |sol| (CAR #1#) . #7#) NIL))
               (GO G191)))
             (SEQ (EXIT (LETT #2# (CONS (|ALGPKG;convVM| |sol| $) #2#) . #7#)))
             (LETT #1# (CDR #1#) . #7#) (GO G190) G191
             (EXIT (NREVERSE #2#))))))))) 

(DEFUN |ALGPKG;doubleRank;ANni;14| (|x| $)
  (PROG (|enter| |entry| #1=#:G304 |i| |u| |z| #2=#:G303 |j| #3=#:G302 |k|
         |cond|)
    (RETURN
     (SEQ
      (LETT |cond|
            (SPADCALL (* 2 (QREFELT $ 10)) (QREFELT $ 10) (|spadConstant| $ 16)
                      (QREFELT $ 19))
            . #4=(|ALGPKG;doubleRank;ANni;14|))
      (SEQ (LETT |k| 1 . #4#) (LETT #3# (QREFELT $ 10) . #4#) G190
           (COND ((|greater_SI| |k| #3#) (GO G191)))
           (SEQ (LETT |z| 0 . #4#) (LETT |u| (QREFELT $ 10) . #4#)
                (EXIT
                 (SEQ (LETT |j| 1 . #4#) (LETT #2# (QREFELT $ 10) . #4#) G190
                      (COND ((|greater_SI| |j| #2#) (GO G191)))
                      (SEQ (LETT |z| (+ |z| 1) . #4#)
                           (LETT |u| (+ |u| 1) . #4#)
                           (LETT |entry| (|spadConstant| $ 16) . #4#)
                           (LETT |enter| (|spadConstant| $ 16) . #4#)
                           (SEQ (LETT |i| 1 . #4#)
                                (LETT #1# (QREFELT $ 10) . #4#) G190
                                (COND ((|greater_SI| |i| #1#) (GO G191)))
                                (SEQ
                                 (LETT |entry|
                                       (SPADCALL |entry|
                                                 (SPADCALL
                                                  (SPADCALL |x| |i|
                                                            (QREFELT $ 62))
                                                  (SPADCALL
                                                   (SPADCALL (QREFELT $ 15) |k|
                                                             (QREFELT $ 38))
                                                   |j| |i| (QREFELT $ 44))
                                                  (QREFELT $ 51))
                                                 (QREFELT $ 52))
                                       . #4#)
                                 (EXIT
                                  (LETT |enter|
                                        (SPADCALL |enter|
                                                  (SPADCALL
                                                   (SPADCALL |x| |i|
                                                             (QREFELT $ 62))
                                                   (SPADCALL
                                                    (SPADCALL (QREFELT $ 15)
                                                              |k|
                                                              (QREFELT $ 38))
                                                    |i| |j| (QREFELT $ 44))
                                                   (QREFELT $ 51))
                                                  (QREFELT $ 52))
                                        . #4#)))
                                (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                                (EXIT NIL))
                           (SPADCALL |cond| |z| |k| |entry| (QREFELT $ 24))
                           (EXIT
                            (SPADCALL |cond| |u| |k| |enter| (QREFELT $ 24))))
                      (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                      (EXIT NIL))))
           (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |cond| (QREFELT $ 63))))))) 

(DEFUN |ALGPKG;weakBiRank;ANni;15| (|x| $)
  (PROG (|entry| #1=#:G318 |s| #2=#:G317 |l| #3=#:G316 |k| |z| #4=#:G315 |j|
         #5=#:G314 |i| |cond|)
    (RETURN
     (SEQ
      (LETT |cond|
            (SPADCALL (QREFELT $ 11) (QREFELT $ 10) (|spadConstant| $ 16)
                      (QREFELT $ 19))
            . #6=(|ALGPKG;weakBiRank;ANni;15|))
      (LETT |z| 0 . #6#)
      (SEQ (LETT |i| 1 . #6#) (LETT #5# (QREFELT $ 10) . #6#) G190
           (COND ((|greater_SI| |i| #5#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #6#) (LETT #4# (QREFELT $ 10) . #6#) G190
                  (COND ((|greater_SI| |j| #4#) (GO G191)))
                  (SEQ (LETT |z| (+ |z| 1) . #6#)
                       (EXIT
                        (SEQ (LETT |k| 1 . #6#) (LETT #3# (QREFELT $ 10) . #6#)
                             G190 (COND ((|greater_SI| |k| #3#) (GO G191)))
                             (SEQ (LETT |entry| (|spadConstant| $ 16) . #6#)
                                  (SEQ (LETT |l| 1 . #6#)
                                       (LETT #2# (QREFELT $ 10) . #6#) G190
                                       (COND
                                        ((|greater_SI| |l| #2#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SEQ (LETT |s| 1 . #6#)
                                              (LETT #1# (QREFELT $ 10) . #6#)
                                              G190
                                              (COND
                                               ((|greater_SI| |s| #1#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT |entry|
                                                      (SPADCALL |entry|
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (SPADCALL |x|
                                                                            |l|
                                                                            (QREFELT
                                                                             $
                                                                             62))
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (QREFELT $
                                                                             15)
                                                                    |s|
                                                                    (QREFELT $
                                                                             38))
                                                                   |i| |l|
                                                                   (QREFELT $
                                                                            44))
                                                                  (QREFELT $
                                                                           51))
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (QREFELT $
                                                                            15)
                                                                   |k|
                                                                   (QREFELT $
                                                                            38))
                                                                  |s| |j|
                                                                  (QREFELT $
                                                                           44))
                                                                 (QREFELT $
                                                                          51))
                                                                (QREFELT $ 52))
                                                      . #6#)))
                                              (LETT |s| (|inc_SI| |s|) . #6#)
                                              (GO G190) G191 (EXIT NIL))))
                                       (LETT |l| (|inc_SI| |l|) . #6#)
                                       (GO G190) G191 (EXIT NIL))
                                  (EXIT
                                   (SPADCALL |cond| |z| |k| |entry|
                                             (QREFELT $ 24))))
                             (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191
                             (EXIT NIL))))
                  (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |cond| (QREFELT $ 63))))))) 

(DEFUN |ALGPKG;biRank;ANni;16| (|x| $)
  (PROG (|enter| |entry| #1=#:G341 |i| #2=#:G340 |k| |w| |u| #3=#:G339 |j| |c|
         #4=#:G338 |s| #5=#:G337 |l| #6=#:G336 |z| #7=#:G335 #8=#:G334 |cond|)
    (RETURN
     (SEQ
      (LETT |cond|
            (SPADCALL (+ (+ (QREFELT $ 11) (* 2 (QREFELT $ 10))) 1)
                      (QREFELT $ 10) (|spadConstant| $ 16) (QREFELT $ 19))
            . #9=(|ALGPKG;biRank;ANni;16|))
      (LETT |z| 0 . #9#)
      (SEQ (LETT |j| 1 . #9#) (LETT #8# (QREFELT $ 10) . #9#) G190
           (COND ((|greater_SI| |j| #8#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |i| 1 . #9#) (LETT #7# (QREFELT $ 10) . #9#) G190
                  (COND ((|greater_SI| |i| #7#) (GO G191)))
                  (SEQ (LETT |z| (+ |z| 1) . #9#)
                       (EXIT
                        (SEQ (LETT |k| 1 . #9#) (LETT #6# (QREFELT $ 10) . #9#)
                             G190 (COND ((|greater_SI| |k| #6#) (GO G191)))
                             (SEQ (LETT |entry| (|spadConstant| $ 16) . #9#)
                                  (SEQ (LETT |l| 1 . #9#)
                                       (LETT #5# (QREFELT $ 10) . #9#) G190
                                       (COND
                                        ((|greater_SI| |l| #5#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SEQ (LETT |s| 1 . #9#)
                                              (LETT #4# (QREFELT $ 10) . #9#)
                                              G190
                                              (COND
                                               ((|greater_SI| |s| #4#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT |entry|
                                                      (SPADCALL |entry|
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (SPADCALL |x|
                                                                            |l|
                                                                            (QREFELT
                                                                             $
                                                                             62))
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (QREFELT $
                                                                             15)
                                                                    |s|
                                                                    (QREFELT $
                                                                             38))
                                                                   |i| |l|
                                                                   (QREFELT $
                                                                            44))
                                                                  (QREFELT $
                                                                           51))
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (QREFELT $
                                                                            15)
                                                                   |k|
                                                                   (QREFELT $
                                                                            38))
                                                                  |s| |j|
                                                                  (QREFELT $
                                                                           44))
                                                                 (QREFELT $
                                                                          51))
                                                                (QREFELT $ 52))
                                                      . #9#)))
                                              (LETT |s| (|inc_SI| |s|) . #9#)
                                              (GO G190) G191 (EXIT NIL))))
                                       (LETT |l| (|inc_SI| |l|) . #9#)
                                       (GO G190) G191 (EXIT NIL))
                                  (EXIT
                                   (SPADCALL |cond| |z| |k| |entry|
                                             (QREFELT $ 24))))
                             (LETT |k| (|inc_SI| |k|) . #9#) (GO G190) G191
                             (EXIT NIL))))
                  (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191 (EXIT NIL))))
           (LETT |j| (|inc_SI| |j|) . #9#) (GO G190) G191 (EXIT NIL))
      (LETT |u| (* (QREFELT $ 10) (QREFELT $ 10)) . #9#)
      (LETT |w| (* (QREFELT $ 10) (+ (QREFELT $ 10) 1)) . #9#)
      (LETT |c| (+ (+ (QREFELT $ 11) (* 2 (QREFELT $ 10))) 1) . #9#)
      (SEQ (LETT |j| 1 . #9#) (LETT #3# (QREFELT $ 10) . #9#) G190
           (COND ((|greater_SI| |j| #3#) (GO G191)))
           (SEQ (LETT |u| (+ |u| 1) . #9#) (LETT |w| (+ |w| 1) . #9#)
                (SEQ (LETT |k| 1 . #9#) (LETT #2# (QREFELT $ 10) . #9#) G190
                     (COND ((|greater_SI| |k| #2#) (GO G191)))
                     (SEQ (LETT |entry| (|spadConstant| $ 16) . #9#)
                          (LETT |enter| (|spadConstant| $ 16) . #9#)
                          (SEQ (LETT |i| 1 . #9#)
                               (LETT #1# (QREFELT $ 10) . #9#) G190
                               (COND ((|greater_SI| |i| #1#) (GO G191)))
                               (SEQ
                                (LETT |entry|
                                      (SPADCALL |entry|
                                                (SPADCALL
                                                 (SPADCALL |x| |i|
                                                           (QREFELT $ 62))
                                                 (SPADCALL
                                                  (SPADCALL (QREFELT $ 15) |k|
                                                            (QREFELT $ 38))
                                                  |j| |i| (QREFELT $ 44))
                                                 (QREFELT $ 51))
                                                (QREFELT $ 52))
                                      . #9#)
                                (EXIT
                                 (LETT |enter|
                                       (SPADCALL |enter|
                                                 (SPADCALL
                                                  (SPADCALL |x| |i|
                                                            (QREFELT $ 62))
                                                  (SPADCALL
                                                   (SPADCALL (QREFELT $ 15) |k|
                                                             (QREFELT $ 38))
                                                   |i| |j| (QREFELT $ 44))
                                                  (QREFELT $ 51))
                                                 (QREFELT $ 52))
                                       . #9#)))
                               (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191
                               (EXIT NIL))
                          (SPADCALL |cond| |u| |k| |entry| (QREFELT $ 24))
                          (EXIT
                           (SPADCALL |cond| |w| |k| |enter| (QREFELT $ 24))))
                     (LETT |k| (|inc_SI| |k|) . #9#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (SPADCALL |cond| |c| |j| (SPADCALL |x| |j| (QREFELT $ 62))
                           (QREFELT $ 24))))
           (LETT |j| (|inc_SI| |j|) . #9#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |cond| (QREFELT $ 63))))))) 

(DEFUN |ALGPKG;leftRank;ANni;17| (|x| $)
  (PROG (|entry| #1=#:G350 |i| #2=#:G349 |j| #3=#:G348 |k| |cond|)
    (RETURN
     (SEQ
      (LETT |cond|
            (SPADCALL (QREFELT $ 10) (QREFELT $ 10) (|spadConstant| $ 16)
                      (QREFELT $ 19))
            . #4=(|ALGPKG;leftRank;ANni;17|))
      (SEQ (LETT |k| 1 . #4#) (LETT #3# (QREFELT $ 10) . #4#) G190
           (COND ((|greater_SI| |k| #3#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #4#) (LETT #2# (QREFELT $ 10) . #4#) G190
                  (COND ((|greater_SI| |j| #2#) (GO G191)))
                  (SEQ (LETT |entry| (|spadConstant| $ 16) . #4#)
                       (SEQ (LETT |i| 1 . #4#) (LETT #1# (QREFELT $ 10) . #4#)
                            G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |entry|
                                    (SPADCALL |entry|
                                              (SPADCALL
                                               (SPADCALL |x| |i|
                                                         (QREFELT $ 62))
                                               (SPADCALL
                                                (SPADCALL (QREFELT $ 15) |k|
                                                          (QREFELT $ 38))
                                                |i| |j| (QREFELT $ 44))
                                               (QREFELT $ 51))
                                              (QREFELT $ 52))
                                    . #4#)))
                            (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT (SPADCALL |cond| |j| |k| |entry| (QREFELT $ 24))))
                  (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191 (EXIT NIL))))
           (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |cond| (QREFELT $ 63))))))) 

(DEFUN |ALGPKG;rightRank;ANni;18| (|x| $)
  (PROG (|entry| #1=#:G359 |i| #2=#:G358 |j| #3=#:G357 |k| |cond|)
    (RETURN
     (SEQ
      (LETT |cond|
            (SPADCALL (QREFELT $ 10) (QREFELT $ 10) (|spadConstant| $ 16)
                      (QREFELT $ 19))
            . #4=(|ALGPKG;rightRank;ANni;18|))
      (SEQ (LETT |k| 1 . #4#) (LETT #3# (QREFELT $ 10) . #4#) G190
           (COND ((|greater_SI| |k| #3#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #4#) (LETT #2# (QREFELT $ 10) . #4#) G190
                  (COND ((|greater_SI| |j| #2#) (GO G191)))
                  (SEQ (LETT |entry| (|spadConstant| $ 16) . #4#)
                       (SEQ (LETT |i| 1 . #4#) (LETT #1# (QREFELT $ 10) . #4#)
                            G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |entry|
                                    (SPADCALL |entry|
                                              (SPADCALL
                                               (SPADCALL |x| |i|
                                                         (QREFELT $ 62))
                                               (SPADCALL
                                                (SPADCALL (QREFELT $ 15) |k|
                                                          (QREFELT $ 38))
                                                |j| |i| (QREFELT $ 44))
                                               (QREFELT $ 51))
                                              (QREFELT $ 52))
                                    . #4#)))
                            (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT (SPADCALL |cond| |j| |k| |entry| (QREFELT $ 24))))
                  (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191 (EXIT NIL))))
           (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |cond| (QREFELT $ 63))))))) 

(DEFUN |ALGPKG;basis;2V;19| (|va| $)
  (PROG (#1=#:G372 #2=#:G374 |j| #3=#:G373 |finished?| |h| |lj| |mCI| |mRI| |m|
         #4=#:G371 |i| |v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL (ELT $ 70) |va| (QREFELT $ 73))
            . #5=(|ALGPKG;basis;2V;19|))
      (LETT |v| (SPADCALL |v| (QREFELT $ 74)) . #5#)
      (EXIT
       (COND ((SPADCALL |v| (QREFELT $ 75)) (VECTOR (|spadConstant| $ 76)))
             ('T
              (SEQ
               (LETT |m|
                     (SPADCALL
                      (SPADCALL (SPADCALL |v| 1 (QREFELT $ 77)) (QREFELT $ 34))
                      (QREFELT $ 35))
                     . #5#)
               (SEQ (LETT |i| 2 . #5#) (LETT #4# (QVSIZE |v|) . #5#) G190
                    (COND ((|greater_SI| |i| #4#) (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT |m|
                            (SPADCALL |m|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |v| |i| (QREFELT $ 77))
                                        (QREFELT $ 34))
                                       (QREFELT $ 35))
                                      (QREFELT $ 78))
                            . #5#)))
                    (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
               (LETT |m| (SPADCALL |m| (QREFELT $ 79)) . #5#)
               (LETT |lj| NIL . #5#) (LETT |h| 1 . #5#)
               (LETT |mRI| (SPADCALL |m| (QREFELT $ 80)) . #5#)
               (LETT |mCI| (SPADCALL |m| (QREFELT $ 81)) . #5#)
               (LETT |finished?| 'NIL . #5#) (LETT |j| 1 . #5#)
               (SEQ G190
                    (COND ((NULL (COND (|finished?| 'NIL) ('T 'T))) (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((NULL
                         (SPADCALL (SPADCALL |m| |h| |j| (QREFELT $ 44))
                                   (QREFELT $ 82)))
                        (SEQ (LETT |lj| (CONS |j| |lj|) . #5#)
                             (LETT |h| |mRI| . #5#)
                             (SEQ G190
                                  (COND
                                   ((NULL
                                     (SPADCALL
                                      (SPADCALL |m| |h| |j| (QREFELT $ 44))
                                      (QREFELT $ 82)))
                                    (GO G191)))
                                  (SEQ (EXIT (LETT |h| (- |h| 1) . #5#))) NIL
                                  (GO G190) G191 (EXIT NIL))
                             (LETT |finished?| (EQL |h| |mRI|) . #5#)
                             (EXIT
                              (COND
                               ((NULL |finished?|)
                                (LETT |h| (+ |h| 1) . #5#))))))
                       ((< |j| |mCI|) (LETT |j| (+ |j| 1) . #5#))
                       ('T (LETT |finished?| 'T . #5#)))))
                    NIL (GO G190) G191 (EXIT NIL))
               (EXIT
                (PROGN
                 (LETT #3# (GETREFV (SIZE #6=(REVERSE |lj|))) . #5#)
                 (SEQ (LETT |j| NIL . #5#) (LETT #2# #6# . #5#)
                      (LETT #1# 0 . #5#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |j| (CAR #2#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #3# #1# (SPADCALL |v| |j| (QREFELT $ 77)))))
                      (LETT #1#
                            (PROG1 (|inc_SI| #1#) (LETT #2# (CDR #2#) . #5#))
                            . #5#)
                      (GO G190) G191 (EXIT NIL))
                 #3#)))))))))) 

(DECLAIM (NOTINLINE |AlgebraPackage;|)) 

(DEFUN |AlgebraPackage| (&REST #1=#:G375)
  (PROG ()
    (RETURN
     (PROG (#2=#:G376)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|AlgebraPackage|)
                                           '|domainEqualList|)
                . #3=(|AlgebraPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |AlgebraPackage;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|AlgebraPackage|))))))))))) 

(DEFUN |AlgebraPackage;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|AlgebraPackage|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|AlgebraPackage| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 84) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|EuclideanDomain|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|AlgebraPackage| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 10 (SPADCALL (QREFELT $ 9)))
      (QSETREFV $ 11 (* (QREFELT $ 10) (QREFELT $ 10)))
      (QSETREFV $ 12 (* (QREFELT $ 10) (QREFELT $ 11)))
      (QSETREFV $ 15 (SPADCALL (QREFELT $ 14)))
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 83 (CONS (|dispatchFunction| |ALGPKG;basis;2V;19|) $))))
      $)))) 

(MAKEPROP '|AlgebraPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|PositiveInteger|) (0 . |rank|) '|n| '|n2| '|n3| (|Vector| 18)
              (4 . |structuralConstants|) '|gamma| (8 . |Zero|)
              (|NonNegativeInteger|) (|Matrix| 6) (12 . |new|) (19 . |One|)
              (|Integer|) (|Vector| 6) (23 . |elt|) (29 . |setelt|)
              (37 . |leftTraceMatrix|) (41 . |represents|) (|List| 22)
              (46 . |nullSpace|) (|List| 7) (|Mapping| 7 22)
              (|ListFunctions2| 22 7) (51 . |map|)
              |ALGPKG;radicalOfLeftTraceForm;L;2| (57 . |coordinates|)
              (62 . |coerce|) (67 . |transpose|) (72 . |vertConcat|)
              (78 . |elt|) (84 . *) (|Mapping| 18 18 18) (90 . |reduce|)
              |ALGPKG;basisOfLeftAnnihilator;AL;3|
              |ALGPKG;basisOfRightAnnihilator;AL;4| (96 . |elt|) (103 . -)
              (108 . +) (|List| 18) |ALGPKG;basisOfLeftNucloid;L;5| (114 . -)
              |ALGPKG;basisOfCommutingElements;L;6| (120 . *) (126 . +)
              (132 . -) |ALGPKG;basisOfLeftNucleus;L;7|
              |ALGPKG;basisOfRightNucleus;L;8|
              |ALGPKG;basisOfMiddleNucleus;L;9| |ALGPKG;basisOfNucleus;L;10|
              (138 . |first|) |ALGPKG;basisOfCenter;L;11|
              |ALGPKG;basisOfRightNucloid;L;12| |ALGPKG;basisOfCentroid;L;13|
              (143 . |elt|) (149 . |rank|) |ALGPKG;doubleRank;ANni;14|
              |ALGPKG;weakBiRank;ANni;15| |ALGPKG;biRank;ANni;16|
              |ALGPKG;leftRank;ANni;17| |ALGPKG;rightRank;ANni;18| (|Boolean|)
              (154 . |zero?|) (|Mapping| 69 7) (|Vector| 7) (159 . |remove|)
              (165 . |removeDuplicates|) (170 . |empty?|) (175 . |Zero|)
              (179 . |elt|) (185 . |horizConcat|) (191 . |rowEchelon|)
              (196 . |maxRowIndex|) (201 . |maxColIndex|) (206 . |zero?|)
              (211 . |basis|))
           '#(|weakBiRank| 216 |rightRank| 221 |radicalOfLeftTraceForm| 226
              |leftRank| 230 |doubleRank| 235 |biRank| 240
              |basisOfRightNucloid| 245 |basisOfRightNucleus| 249
              |basisOfRightAnnihilator| 253 |basisOfNucleus| 258
              |basisOfMiddleNucleus| 262 |basisOfLeftNucloid| 266
              |basisOfLeftNucleus| 270 |basisOfLeftAnnihilator| 274
              |basisOfCommutingElements| 279 |basisOfCentroid| 283
              |basisOfCenter| 287 |basis| 291)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 83
                                                 '(0 7 8 9 0 7 13 14 0 6 0 16 3
                                                   18 0 17 17 6 19 0 6 0 20 2
                                                   22 6 0 21 23 4 18 6 0 21 21
                                                   6 24 0 7 18 25 1 7 0 22 26 1
                                                   18 27 0 28 2 31 29 30 27 32
                                                   1 7 22 0 34 1 18 0 22 35 1
                                                   18 0 0 36 2 18 0 0 0 37 2 13
                                                   18 0 21 38 2 18 0 0 0 39 2
                                                   13 18 40 0 41 3 18 6 0 21 21
                                                   44 1 6 0 0 45 2 18 0 0 0 46
                                                   2 18 0 0 0 49 2 6 0 0 0 51 2
                                                   6 0 0 0 52 2 6 0 0 0 53 1 13
                                                   18 0 58 2 7 6 0 21 62 1 18
                                                   17 0 63 1 7 69 0 70 2 72 0
                                                   71 0 73 1 72 0 0 74 1 72 69
                                                   0 75 0 7 0 76 2 72 7 0 21 77
                                                   2 18 0 0 0 78 1 18 0 0 79 1
                                                   18 21 0 80 1 18 21 0 81 1 6
                                                   69 0 82 1 0 72 72 83 1 0 17
                                                   7 65 1 0 17 7 68 0 0 29 33 1
                                                   0 17 7 67 1 0 17 7 64 1 0 17
                                                   7 66 0 0 47 60 0 0 29 55 1 0
                                                   29 7 43 0 0 29 57 0 0 29 56
                                                   0 0 47 48 0 0 29 54 1 0 29 7
                                                   42 0 0 29 50 0 0 47 61 0 0
                                                   29 59 1 1 72 72 83)))))
           '|lookupComplete|)) 
