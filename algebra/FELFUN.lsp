
(/VERSIONCHECK 2) 

(DEFUN |FELFUN;rabs;2F;1| (|r| $) (SPADCALL |r| (QREFELT $ 7))) 

(DEFUN |FELFUN;rabs;CF;2| (|r| $)
  (SPADCALL (SPADCALL |r| (QREFELT $ 10)) (QREFELT $ 11))) 

(DEFUN |FELFUN;landen1;F2L;3| (|m1| |res| $)
  (PROG (|kn1| |kp|)
    (RETURN
     (SEQ
      (SEQ G190
           (COND
            ((NULL
              (SPADCALL (SPADCALL |m1| (QREFELT $ 8))
                        (SPADCALL 25 -2 10 (QREFELT $ 15)) (QREFELT $ 17)))
             (GO G191)))
           (SEQ
            (LETT |kp| (SPADCALL |m1| (QREFELT $ 18))
                  . #1=(|FELFUN;landen1;F2L;3|))
            (LETT |kn1|
                  (SPADCALL (SPADCALL 2 |kp| (QREFELT $ 19))
                            (SPADCALL (|spadConstant| $ 20) |kp|
                                      (QREFELT $ 21))
                            (QREFELT $ 22))
                  . #1#)
            (LETT |res|
                  (CONS (SPADCALL (|spadConstant| $ 20) |kn1| (QREFELT $ 23))
                        |res|)
                  . #1#)
            (EXIT
             (LETT |m1|
                   (SPADCALL (SPADCALL 2 |kn1| (QREFELT $ 19))
                             (SPADCALL |kn1| 2 (QREFELT $ 24)) (QREFELT $ 23))
                   . #1#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT (CONS |m1| |res|)))))) 

(DEFUN |FELFUN;landen2;FLFL;4| (|m| |res| |eps| $)
  (PROG (|kn| |kp| #1=#:G178 |am|)
    (RETURN
     (SEQ
      (SEQ
       (EXIT
        (SEQ G190 NIL
             (SEQ
              (LETT |am| (SPADCALL |m| (QREFELT $ 8))
                    . #2=(|FELFUN;landen2;FLFL;4|))
              (EXIT
               (COND
                ((SPADCALL |am| |eps| (QREFELT $ 17))
                 (SEQ
                  (LETT |kn|
                        (SPADCALL (SPADCALL 1 4 (QREFELT $ 29)) |m|
                                  (QREFELT $ 30))
                        . #2#)
                  (LETT |res| (CONS |kn| |res|) . #2#)
                  (EXIT (PROGN (LETT #1# |$NoValue| . #2#) (GO #1#)))))
                ('T
                 (SEQ
                  (LETT |kp|
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 20) |m| (QREFELT $ 23))
                         (QREFELT $ 18))
                        . #2#)
                  (LETT |kn|
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 20) |kp| (QREFELT $ 23))
                         (SPADCALL (|spadConstant| $ 20) |kp| (QREFELT $ 21))
                         (QREFELT $ 22))
                        . #2#)
                  (LETT |res| (CONS |kn| |res|) . #2#)
                  (EXIT (LETT |m| (SPADCALL |kn| 2 (QREFELT $ 24)) . #2#)))))))
             NIL (GO G190) G191 (EXIT NIL)))
       #1# (EXIT #1#))
      (EXIT |res|))))) 

(DEFUN |FELFUN;landen;2FL;5| (|m| |eps| $)
  (PROG (|res| |m1|)
    (RETURN
     (SEQ (LETT |res| NIL . #1=(|FELFUN;landen;2FL;5|))
          (COND
           ((SPADCALL
             (SPADCALL
              (LETT |m1| (SPADCALL (|spadConstant| $ 20) |m| (QREFELT $ 23))
                    . #1#)
              (QREFELT $ 8))
             (SPADCALL 25 -2 10 (QREFELT $ 15)) (QREFELT $ 17))
            (SEQ (LETT |res| (SPADCALL |m1| |res| (QREFELT $ 26)) . #1#)
                 (LETT |m|
                       (SPADCALL (|spadConstant| $ 20) (|SPADfirst| |res|)
                                 (QREFELT $ 23))
                       . #1#)
                 (EXIT (LETT |res| (CDR |res|) . #1#)))))
          (EXIT (SPADCALL |m| |res| |eps| (QREFELT $ 31))))))) 

(DEFUN |FELFUN;kprod;LF;6| (|ll| $)
  (PROG (#1=#:G190 |k| #2=#:G189)
    (RETURN
     (SEQ
      (SPADCALL (ELT $ 34)
                (PROGN
                 (LETT #2# NIL . #3=(|FELFUN;kprod;LF;6|))
                 (SEQ (LETT |k| NIL . #3#) (LETT #1# |ll| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (|spadConstant| $ 20) |k|
                                         (QREFELT $ 21))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 36)))))) 

(DEFUN |FELFUN;sn2;FLF;7| (|z| |ll| $)
  (PROG (|res| #1=#:G194 |k|)
    (RETURN
     (SEQ (LETT |res| (SPADCALL |z| (QREFELT $ 38)) . #2=(|FELFUN;sn2;FLF;7|))
          (SEQ (LETT |k| NIL . #2#) (LETT #1# |ll| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 20) |k| (QREFELT $ 21))
                         |res| (QREFELT $ 34))
                        (SPADCALL (|spadConstant| $ 20)
                                  (SPADCALL |k|
                                            (SPADCALL |res| 2 (QREFELT $ 24))
                                            (QREFELT $ 34))
                                  (QREFELT $ 21))
                        (QREFELT $ 22))
                       . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |FELFUN;landen1;C2L;8| (|m1| |res| $)
  (PROG (|kn1| |kp|)
    (RETURN
     (SEQ
      (SEQ G190
           (COND
            ((NULL
              (SPADCALL (SPADCALL |m1| (QREFELT $ 12))
                        (SPADCALL 25 -2 10 (QREFELT $ 15)) (QREFELT $ 17)))
             (GO G191)))
           (SEQ
            (LETT |kp| (SPADCALL |m1| (QREFELT $ 40))
                  . #1=(|FELFUN;landen1;C2L;8|))
            (LETT |kn1|
                  (SPADCALL (SPADCALL 2 |kp| (QREFELT $ 41))
                            (SPADCALL (|spadConstant| $ 32) |kp|
                                      (QREFELT $ 42))
                            (QREFELT $ 43))
                  . #1#)
            (LETT |res|
                  (CONS (SPADCALL (|spadConstant| $ 32) |kn1| (QREFELT $ 44))
                        |res|)
                  . #1#)
            (EXIT
             (LETT |m1|
                   (SPADCALL (SPADCALL 2 |kn1| (QREFELT $ 41))
                             (SPADCALL |kn1| 2 (QREFELT $ 45)) (QREFELT $ 44))
                   . #1#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT (CONS |m1| |res|)))))) 

(DEFUN |FELFUN;landen2;CLFL;9| (|m| |res| |eps| $)
  (PROG (|kn| |kp| #1=#:G202 |am|)
    (RETURN
     (SEQ
      (SEQ
       (EXIT
        (SEQ G190 NIL
             (SEQ
              (LETT |am| (SPADCALL |m| (QREFELT $ 12))
                    . #2=(|FELFUN;landen2;CLFL;9|))
              (EXIT
               (COND
                ((SPADCALL |am| |eps| (QREFELT $ 17))
                 (SEQ
                  (LETT |kn|
                        (SPADCALL (SPADCALL 1 4 (QREFELT $ 29)) |m|
                                  (QREFELT $ 49))
                        . #2#)
                  (LETT |res| (CONS |kn| |res|) . #2#)
                  (EXIT (PROGN (LETT #1# |$NoValue| . #2#) (GO #1#)))))
                ('T
                 (SEQ
                  (LETT |kp|
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 32) |m| (QREFELT $ 44))
                         (QREFELT $ 40))
                        . #2#)
                  (LETT |kn|
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 32) |kp| (QREFELT $ 44))
                         (SPADCALL (|spadConstant| $ 32) |kp| (QREFELT $ 42))
                         (QREFELT $ 43))
                        . #2#)
                  (LETT |res| (CONS |kn| |res|) . #2#)
                  (EXIT (LETT |m| (SPADCALL |kn| 2 (QREFELT $ 45)) . #2#)))))))
             NIL (GO G190) G191 (EXIT NIL)))
       #1# (EXIT #1#))
      (EXIT |res|))))) 

(DEFUN |FELFUN;landen;CFL;10| (|m| |eps| $)
  (PROG (|res| |m1|)
    (RETURN
     (SEQ (LETT |res| NIL . #1=(|FELFUN;landen;CFL;10|))
          (COND
           ((SPADCALL
             (SPADCALL
              (LETT |m1| (SPADCALL (|spadConstant| $ 32) |m| (QREFELT $ 44))
                    . #1#)
              (QREFELT $ 12))
             (SPADCALL 25 -2 10 (QREFELT $ 15)) (QREFELT $ 17))
            (SEQ (LETT |res| (SPADCALL |m1| |res| (QREFELT $ 47)) . #1#)
                 (LETT |m|
                       (SPADCALL (|spadConstant| $ 32) (|SPADfirst| |res|)
                                 (QREFELT $ 44))
                       . #1#)
                 (EXIT (LETT |res| (CDR |res|) . #1#)))))
          (EXIT (SPADCALL |m| |res| |eps| (QREFELT $ 50))))))) 

(DEFUN |FELFUN;kprod;LC;11| (|ll| $)
  (PROG (#1=#:G214 |k| #2=#:G213)
    (RETURN
     (SEQ
      (SPADCALL (ELT $ 52)
                (PROGN
                 (LETT #2# NIL . #3=(|FELFUN;kprod;LC;11|))
                 (SEQ (LETT |k| NIL . #3#) (LETT #1# |ll| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (|spadConstant| $ 32) |k|
                                         (QREFELT $ 42))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 54)))))) 

(DEFUN |FELFUN;sn2;CLC;12| (|z| |ll| $)
  (PROG (|res| #1=#:G218 |k|)
    (RETURN
     (SEQ (LETT |res| (SPADCALL |z| (QREFELT $ 56)) . #2=(|FELFUN;sn2;CLC;12|))
          (SEQ (LETT |k| NIL . #2#) (LETT #1# |ll| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 32) |k| (QREFELT $ 42))
                         |res| (QREFELT $ 52))
                        (SPADCALL (|spadConstant| $ 32)
                                  (SPADCALL |k|
                                            (SPADCALL |res| 2 (QREFELT $ 45))
                                            (QREFELT $ 52))
                                  (QREFELT $ 42))
                        (QREFELT $ 43))
                       . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |FELFUN;pimod| (|z| $)
  (PROG (|nn| |pi2|)
    (RETURN
     (SEQ
      (LETT |pi2| (SPADCALL 2 (SPADCALL (QREFELT $ 58)) (QREFELT $ 19))
            . #1=(|FELFUN;pimod|))
      (LETT |nn|
            (SPADCALL
             (SPADCALL (SPADCALL |z| |pi2| (QREFELT $ 22)) (QREFELT $ 59))
             (QREFELT $ 60))
            . #1#)
      (EXIT
       (SPADCALL |z| (SPADCALL |nn| |pi2| (QREFELT $ 61)) (QREFELT $ 23))))))) 

(DEFUN |FELFUN;two_to_minus_n| (|n| $)
  (COND
   ((SPADCALL (SPADCALL (QREFELT $ 62)) 2 (QREFELT $ 63))
    (|error| "Only base 2 is supported"))
   ('T (SPADCALL 1 (- |n|) (QREFELT $ 64))))) 

(DEFUN |FELFUN;ellipticK;2F;15| (|m| $)
  (PROG (|res| |ll| |eps| |prec| |obits|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |m| (SPADCALL 1 0 10 (QREFELT $ 15)) (QREFELT $ 66))
        (|error| "ellipticK : m >= 1.0"))
       ('T
        (SEQ
         (LETT |obits| (SPADCALL (QREFELT $ 67))
               . #1=(|FELFUN;ellipticK;2F;15|))
         (LETT |prec| (+ |obits| 20) . #1#) (SPADCALL |prec| (QREFELT $ 68))
         (LETT |eps| (|FELFUN;two_to_minus_n| (QUOTIENT2 |prec| 2) $) . #1#)
         (LETT |ll| (SPADCALL |m| |eps| (QREFELT $ 33)) . #1#)
         (LETT |res|
               (SPADCALL
                (SPADCALL (SPADCALL 1 2 (QREFELT $ 29))
                          (SPADCALL (QREFELT $ 58)) (QREFELT $ 30))
                (SPADCALL |ll| (QREFELT $ 37)) (QREFELT $ 34))
               . #1#)
         (SPADCALL |obits| (QREFELT $ 68)) (EXIT |res|)))))))) 

(DEFUN |FELFUN;ellipticK;2C;16| (|m| $)
  (PROG (|res| |ll| |eps| |prec| |obits|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |m| (|spadConstant| $ 32) (QREFELT $ 70))
        (|error| "ellipticK : m = 1.0"))
       ('T
        (SEQ
         (LETT |obits| (SPADCALL (QREFELT $ 67))
               . #1=(|FELFUN;ellipticK;2C;16|))
         (LETT |prec| (+ |obits| 20) . #1#) (SPADCALL |prec| (QREFELT $ 68))
         (LETT |eps| (|FELFUN;two_to_minus_n| (QUOTIENT2 |prec| 2) $) . #1#)
         (LETT |ll| (SPADCALL |m| |eps| (QREFELT $ 51)) . #1#)
         (LETT |res|
               (SPADCALL
                (SPADCALL (SPADCALL 1 2 (QREFELT $ 29))
                          (SPADCALL (QREFELT $ 58)) (QREFELT $ 30))
                (SPADCALL |ll| (QREFELT $ 55)) (QREFELT $ 72))
               . #1#)
         (SPADCALL |obits| (QREFELT $ 68)) (EXIT |res|)))))))) 

(DEFUN |FELFUN;sin1| (|z| $)
  (PROG (|z1|)
    (RETURN
     (SEQ
      (COND
       ((OR (SPADCALL |z| (|spadConstant| $ 20) (QREFELT $ 17))
            (SPADCALL |z| (SPADCALL 2 0 10 (QREFELT $ 15)) (QREFELT $ 74)))
        (SPADCALL (|spadConstant| $ 20) (SPADCALL |z| (QREFELT $ 38))
                  (QREFELT $ 23)))
       ('T
        (SEQ
         (LETT |z1|
               (SPADCALL |z|
                         (SPADCALL (SPADCALL (QREFELT $ 58))
                                   (SPADCALL 2 0 10 (QREFELT $ 15))
                                   (QREFELT $ 22))
                         (QREFELT $ 23))
               . #1=(|FELFUN;sin1|))
         (LETT |z1| (SPADCALL |z1| 2 (QREFELT $ 48)) . #1#)
         (EXIT
          (SPADCALL 2
                    (SPADCALL (SPADCALL |z1| (QREFELT $ 38)) 2 (QREFELT $ 75))
                    (QREFELT $ 19)))))))))) 

(DEFUN |FELFUN;sn21| (|z| |ll| $)
  (PROG (|res| |kres| |res0| #1=#:G235 |k|)
    (RETURN
     (SEQ (LETT |res| (|FELFUN;sin1| |z| $) . #2=(|FELFUN;sn21|))
          (SEQ (LETT |k| NIL . #2#) (LETT #1# |ll| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |res0|
                      (SPADCALL (|spadConstant| $ 20) |res| (QREFELT $ 23))
                      . #2#)
                (LETT |kres| (SPADCALL |k| |res| (QREFELT $ 34)) . #2#)
                (EXIT
                 (LETT |res|
                       (SPADCALL
                        (SPADCALL (SPADCALL |res| |kres| (QREFELT $ 23))
                                  (SPADCALL |kres| |res| (QREFELT $ 34))
                                  (QREFELT $ 21))
                        (SPADCALL (|spadConstant| $ 20)
                                  (SPADCALL |k|
                                            (SPADCALL |res0| 2 (QREFELT $ 24))
                                            (QREFELT $ 34))
                                  (QREFELT $ 21))
                        (QREFELT $ 22))
                       . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |FELFUN;sn1| (|z| |m| |prec| $)
  (PROG (|z1| |kk| |ll| |res1| |res| |z0| |sign| |m1| |kp1| |kp| |eps|)
    (RETURN
     (SEQ
      (COND
       ((OR (SPADCALL |m| (SPADCALL 8 -1 10 (QREFELT $ 15)) (QREFELT $ 74))
            (SPADCALL |m|
                      (SPADCALL (SPADCALL 4 0 10 (QREFELT $ 15))
                                (QREFELT $ 76))
                      (QREFELT $ 17)))
        (SEQ (LETT |prec| (+ |prec| 20) . #1=(|FELFUN;sn1|))
             (EXIT (SPADCALL |prec| (QREFELT $ 68))))))
      (LETT |eps| (|FELFUN;two_to_minus_n| (QUOTIENT2 |prec| 2) $) . #1#)
      (EXIT
       (COND
        ((SPADCALL |m|
                   (SPADCALL (SPADCALL 48 0 10 (QREFELT $ 15)) (QREFELT $ 76))
                   (QREFELT $ 17))
         (SEQ
          (LETT |kp|
                (SPADCALL (SPADCALL (|spadConstant| $ 20) |m| (QREFELT $ 23))
                          (QREFELT $ 18))
                . #1#)
          (LETT |kp1|
                (SPADCALL (SPADCALL 2 0 10 (QREFELT $ 15))
                          (SPADCALL (|spadConstant| $ 20) |kp| (QREFELT $ 21))
                          (QREFELT $ 22))
                . #1#)
          (LETT |m1|
                (SPADCALL (SPADCALL 2 |kp1| (QREFELT $ 19))
                          (SPADCALL |kp1| 2 (QREFELT $ 24)) (QREFELT $ 23))
                . #1#)
          (LETT |z| (SPADCALL |z| |kp1| (QREFELT $ 22)) . #1#)
          (LETT |ll| NIL . #1#)
          (COND
           ((SPADCALL |m1| (SPADCALL 25 -2 10 (QREFELT $ 15)) (QREFELT $ 17))
            (SEQ (LETT |ll| (SPADCALL |m1| |ll| (QREFELT $ 26)) . #1#)
                 (LETT |m|
                       (SPADCALL (|spadConstant| $ 20) (|SPADfirst| |ll|)
                                 (QREFELT $ 23))
                       . #1#)
                 (EXIT
                  (LETT |ll| (SPADCALL |m| (CDR |ll|) |eps| (QREFELT $ 31))
                        . #1#))))
           (#2='T
            (LETT |ll|
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 20) |m1| (QREFELT $ 23)) |eps|
                   (QREFELT $ 33))
                  . #1#)))
          (LETT |kk| (SPADCALL |ll| (QREFELT $ 37)) . #1#)
          (LETT |z1| (SPADCALL |z| |kk| (QREFELT $ 22)) . #1#)
          (LETT |z1| (|FELFUN;pimod| |z1| $) . #1#)
          (COND
           ((SPADCALL |z1| (|spadConstant| $ 65) (QREFELT $ 17))
            (SEQ
             (LETT |sign| (SPADCALL (|spadConstant| $ 20) (QREFELT $ 76))
                   . #1#)
             (EXIT (LETT |z1| (SPADCALL |z1| (QREFELT $ 76)) . #1#))))
           (#2# (LETT |sign| (|spadConstant| $ 20) . #1#)))
          (LETT |z0| (SPADCALL |z1| |kk| (QREFELT $ 34)) . #1#)
          (EXIT
           (COND
            ((SPADCALL |z0| (SPADCALL 5 -1 10 (QREFELT $ 15)) (QREFELT $ 17))
             (SEQ (LETT |res| (SPADCALL |z1| |ll| (QREFELT $ 39)) . #1#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL (SPADCALL |sign| |kp1| (QREFELT $ 34)) |res|
                              (QREFELT $ 34))
                    (SPADCALL (|spadConstant| $ 20)
                              (SPADCALL
                               (SPADCALL |kp1| (|spadConstant| $ 20)
                                         (QREFELT $ 23))
                               (SPADCALL |res| 2 (QREFELT $ 24))
                               (QREFELT $ 34))
                              (QREFELT $ 21))
                    (QREFELT $ 22)))))
            (#2#
             (SEQ (LETT |res1| (|FELFUN;sn21| |z1| |ll| $) . #1#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL (SPADCALL |sign| |kp1| (QREFELT $ 34))
                              (SPADCALL (|spadConstant| $ 20) |res1|
                                        (QREFELT $ 23))
                              (QREFELT $ 34))
                    (SPADCALL |kp1|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |kp1| (|spadConstant| $ 20)
                                          (QREFELT $ 23))
                                (SPADCALL |res1|
                                          (SPADCALL 2 0 10 (QREFELT $ 15))
                                          (QREFELT $ 23))
                                (QREFELT $ 34))
                               |res1| (QREFELT $ 34))
                              (QREFELT $ 21))
                    (QREFELT $ 22)))))))))
        (#2#
         (SEQ (LETT |ll| (SPADCALL |m| |eps| (QREFELT $ 33)) . #1#)
              (LETT |kk| (SPADCALL |ll| (QREFELT $ 37)) . #1#)
              (LETT |z1| (SPADCALL |z| |kk| (QREFELT $ 22)) . #1#)
              (EXIT (SPADCALL |z1| |ll| (QREFELT $ 39))))))))))) 

(DEFUN |FELFUN;cn1| (|z| |m| |prec| $)
  (PROG (|res0| |sgn| |nn| |z2| |pih| |z1| |kk| |ll| |eps|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (|spadConstant| $ 65) (QREFELT $ 17))
        (LETT |z| (SPADCALL |z| (QREFELT $ 76)) . #1=(|FELFUN;cn1|))))
      (LETT |prec| (* 2 |prec|) . #1#)
      (COND
       ((OR (SPADCALL |m| (SPADCALL 8 -1 10 (QREFELT $ 15)) (QREFELT $ 74))
            (SPADCALL |m|
                      (SPADCALL (SPADCALL 4 0 10 (QREFELT $ 15))
                                (QREFELT $ 76))
                      (QREFELT $ 17)))
        (LETT |prec| (+ |prec| 20) . #1#)))
      (SPADCALL |prec| (QREFELT $ 68))
      (LETT |eps| (|FELFUN;two_to_minus_n| (QUOTIENT2 |prec| 2) $) . #1#)
      (LETT |ll| (SPADCALL |m| |eps| (QREFELT $ 33)) . #1#)
      (LETT |kk| (SPADCALL |ll| (QREFELT $ 37)) . #1#)
      (LETT |z1| (SPADCALL |z| |kk| (QREFELT $ 22)) . #1#)
      (LETT |pih|
            (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 15))
                      (SPADCALL (QREFELT $ 58)) (QREFELT $ 34))
            . #1#)
      (LETT |nn|
            (SPADCALL
             (SPADCALL (SPADCALL |z1| |pih| (QREFELT $ 22)) (QREFELT $ 59))
             (QREFELT $ 60))
            . #1#)
      (COND
       ((ODDP |nn|)
        (SEQ
         (LETT |z2|
               (SPADCALL |z1| (SPADCALL |nn| |pih| (QREFELT $ 61))
                         (QREFELT $ 23))
               . #1#)
         (LETT |nn| (QUOTIENT2 |nn| 2) . #1#)
         (LETT |sgn|
               (COND ((ODDP |nn|) (|spadConstant| $ 20))
                     (#2='T (SPADCALL (|spadConstant| $ 20) (QREFELT $ 76))))
               . #1#)
         (EXIT
          (LETT |sgn|
                (SPADCALL (SPADCALL |z2| (QREFELT $ 77)) |sgn| (QREFELT $ 61))
                . #1#))))
       (#2#
        (SEQ (LETT |nn| (QUOTIENT2 |nn| 2) . #1#)
             (EXIT
              (LETT |sgn|
                    (COND
                     ((ODDP |nn|)
                      (SPADCALL (|spadConstant| $ 20) (QREFELT $ 76)))
                     (#2# (|spadConstant| $ 20)))
                    . #1#)))))
      (LETT |res0| (SPADCALL |z1| |ll| (QREFELT $ 39)) . #1#)
      (EXIT
       (SPADCALL |sgn|
                 (SPADCALL
                  (SPADCALL (|spadConstant| $ 20)
                            (SPADCALL |res0| 2 (QREFELT $ 24)) (QREFELT $ 23))
                  (QREFELT $ 18))
                 (QREFELT $ 34))))))) 

(DEFUN |FELFUN;dn1| (|z| |m| |prec| $)
  (PROG (|res0|)
    (RETURN
     (SEQ (LETT |prec| (* 2 |prec|) . #1=(|FELFUN;dn1|))
          (SPADCALL |prec| (QREFELT $ 68))
          (LETT |res0| (|FELFUN;sn1| |z| |m| |prec| $) . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (|spadConstant| $ 20)
                      (SPADCALL |m| (SPADCALL |res0| 2 (QREFELT $ 24))
                                (QREFELT $ 34))
                      (QREFELT $ 23))
            (QREFELT $ 18))))))) 

(DEFUN |FELFUN;jacobi_imaginary| (|z| |m| $)
  (PROG (|cc| |pl| |iu|)
    (RETURN
     (SEQ
      (LETT |iu|
            (SPADCALL (|spadConstant| $ 65) (SPADCALL 1 0 10 (QREFELT $ 15))
                      (QREFELT $ 79))
            . #1=(|FELFUN;jacobi_imaginary|))
      (LETT |pl|
            (|FELFUN;sn_cn_dn|
             (SPADCALL (SPADCALL |iu| |z| (QREFELT $ 52)) (QREFELT $ 80))
             (SPADCALL (|spadConstant| $ 32) |m| (QREFELT $ 44)) $)
            . #1#)
      (LETT |cc| (SPADCALL |pl| 3 (QREFELT $ 81)) . #1#)
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |pl| 1 (QREFELT $ 81)) (|spadConstant| $ 32)
                   (QREFELT $ 70))
         (COND
          ((SPADCALL |cc| (|spadConstant| $ 78) (QREFELT $ 70))
           (SEQ (LETT |cc| (SPADCALL |pl| 2 (QREFELT $ 81)) . #1#)
                (EXIT
                 (LIST (|spadConstant| $ 78) (|spadConstant| $ 32)
                       (SPADCALL (|spadConstant| $ 32) |cc| (QREFELT $ 43))
                       (SPADCALL (SPADCALL |pl| 4 (QREFELT $ 81)) |cc|
                                 (QREFELT $ 43))))))
          (#2='T
           (LIST (|spadConstant| $ 32)
                 (SPADCALL
                  (SPADCALL |iu| (SPADCALL |pl| 2 (QREFELT $ 81))
                            (QREFELT $ 52))
                  |cc| (QREFELT $ 43))
                 (SPADCALL (|spadConstant| $ 32) |cc| (QREFELT $ 43))
                 (SPADCALL (SPADCALL |pl| 4 (QREFELT $ 81)) |cc|
                           (QREFELT $ 43))))))
        (#2#
         (LIST (|spadConstant| $ 32)
               (SPADCALL
                (SPADCALL |iu| (SPADCALL |pl| 2 (QREFELT $ 81)) (QREFELT $ 52))
                |cc| (QREFELT $ 43))
               (|spadConstant| $ 78)
               (SPADCALL (SPADCALL |pl| 4 (QREFELT $ 81)) |cc|
                         (QREFELT $ 43)))))))))) 

(DEFUN |FELFUN;sn_cn_dn| (|z| |m| $)
  (PROG (|ni| |d1| |c1| |s1| |#G81| |#G80| |#G79| |#G78| |#G77| |#G76| |ms1|
         |nr| |#G75| |#G74| |#G73| |iu| |den| |ms2| |s2| |ctwo| |zz1| |z1|
         |iz1| |itau| |tau| |ppi| |kk2| |ll2| |kn| |mp| |ms0| |m1| |iz| |kk|
         |ll| |eps| |res| |pl| |k| |cc| |prec| |obits|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |m| (|spadConstant| $ 78) (QREFELT $ 70))
        (LIST (|spadConstant| $ 32) (SPADCALL |z| (QREFELT $ 56))
              (SPADCALL |z| (QREFELT $ 82)) (|spadConstant| $ 32)))
       (#1='T
        (SEQ (LETT |obits| (SPADCALL (QREFELT $ 67)) . #2=(|FELFUN;sn_cn_dn|))
             (LETT |prec| (+ |obits| 20) . #2#)
             (EXIT
              (COND
               ((SPADCALL |m| (|spadConstant| $ 32) (QREFELT $ 70))
                (SEQ (LETT |cc| (SPADCALL |z| (QREFELT $ 83)) . #2#)
                     (LETT |res|
                           (COND
                            ((SPADCALL |cc| (|spadConstant| $ 78)
                                       (QREFELT $ 70))
                             (SEQ
                              (LETT |cc|
                                    (SPADCALL (|spadConstant| $ 32)
                                              (SPADCALL |z| (QREFELT $ 84))
                                              (QREFELT $ 43))
                                    . #2#)
                              (EXIT
                               (LIST (|spadConstant| $ 78)
                                     (|spadConstant| $ 32) |cc| |cc|))))
                            (#1#
                             (SEQ
                              (LETT |cc|
                                    (SPADCALL (|spadConstant| $ 32) |cc|
                                              (QREFELT $ 43))
                                    . #2#)
                              (EXIT
                               (LIST (|spadConstant| $ 32)
                                     (SPADCALL |z| (QREFELT $ 85)) |cc|
                                     |cc|)))))
                           . #2#)
                     (EXIT |res|)))
               ((SPADCALL
                 (SPADCALL (SPADCALL |m| (|spadConstant| $ 32) (QREFELT $ 44))
                           (QREFELT $ 12))
                 (SPADCALL 5 -1 10 (QREFELT $ 15)) (QREFELT $ 17))
                (|FELFUN;jacobi_imaginary| |z| |m| $))
               ((SPADCALL (SPADCALL |m| (QREFELT $ 12)) (|spadConstant| $ 20)
                          (QREFELT $ 74))
                (SEQ
                 (LETT |m| (SPADCALL (|spadConstant| $ 32) |m| (QREFELT $ 43))
                       . #2#)
                 (LETT |k| (SPADCALL |m| (QREFELT $ 40)) . #2#)
                 (LETT |z| (SPADCALL |z| |k| (QREFELT $ 43)) . #2#)
                 (LETT |pl| (|FELFUN;sn_cn_dn| |z| |m| $) . #2#)
                 (LETT |res|
                       (COND
                        ((SPADCALL (SPADCALL |pl| 1 (QREFELT $ 81))
                                   (|spadConstant| $ 32) (QREFELT $ 70))
                         (LIST (|spadConstant| $ 32)
                               (SPADCALL |k| (SPADCALL |pl| 2 (QREFELT $ 81))
                                         (QREFELT $ 52))
                               (SPADCALL |pl| 4 (QREFELT $ 81))
                               (SPADCALL |pl| 3 (QREFELT $ 81))))
                        (#1#
                         (LIST (|spadConstant| $ 78) (|spadConstant| $ 32)
                               (SPADCALL (SPADCALL |pl| 4 (QREFELT $ 81)) |k|
                                         (QREFELT $ 43))
                               (SPADCALL (SPADCALL |pl| 3 (QREFELT $ 81)) |k|
                                         (QREFELT $ 43)))))
                       . #2#)
                 (EXIT |res|)))
               ((SPADCALL (SPADCALL |m| (QREFELT $ 11))
                          (SPADCALL 5 -1 10 (QREFELT $ 15)) (QREFELT $ 74))
                (|FELFUN;jacobi_imaginary| |z| |m| $))
               (#1#
                (SEQ
                 (LETT |eps|
                       (SPADCALL 1 (- (QUOTIENT2 |prec| 2)) (QREFELT $ 64))
                       . #2#)
                 (LETT |ll| (SPADCALL |m| |eps| (QREFELT $ 51)) . #2#)
                 (LETT |kk| (SPADCALL |ll| (QREFELT $ 55)) . #2#)
                 (LETT |z1| (SPADCALL |z| |kk| (QREFELT $ 43)) . #2#)
                 (LETT |iz| (SPADCALL |z1| (QREFELT $ 86)) . #2#)
                 (LETT |m1| (SPADCALL (|spadConstant| $ 32) |m| (QREFELT $ 44))
                       . #2#)
                 (LETT |ms0| (SPADCALL |m| (QREFELT $ 40)) . #2#)
                 (COND
                  ((SPADCALL (SPADCALL |ms0| (QREFELT $ 12))
                             (SPADCALL 25 -2 10 (QREFELT $ 15)) (QREFELT $ 17))
                   (SEQ
                    (LETT |kn|
                          (SPADCALL (SPADCALL 2 |ms0| (QREFELT $ 41))
                                    (SPADCALL (|spadConstant| $ 32) |ms0|
                                              (QREFELT $ 42))
                                    (QREFELT $ 43))
                          . #2#)
                    (LETT |ll2|
                          (SPADCALL
                           (SPADCALL (SPADCALL 2 |kn| (QREFELT $ 41))
                                     (SPADCALL |kn| 2 (QREFELT $ 45))
                                     (QREFELT $ 44))
                           (LIST
                            (SPADCALL (|spadConstant| $ 32) |kn|
                                      (QREFELT $ 44)))
                           (QREFELT $ 47))
                          . #2#)
                    (LETT |mp|
                          (SPADCALL (|spadConstant| $ 32) (|SPADfirst| |ll2|)
                                    (QREFELT $ 44))
                          . #2#)
                    (EXIT
                     (LETT |ll2|
                           (SPADCALL |mp| (CDR |ll2|) |eps| (QREFELT $ 50))
                           . #2#))))
                  (#1#
                   (SEQ
                    (LETT |kn|
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 32) |ms0|
                                     (QREFELT $ 44))
                           (SPADCALL (|spadConstant| $ 32) |ms0|
                                     (QREFELT $ 42))
                           (QREFELT $ 43))
                          . #2#)
                    (EXIT
                     (LETT |ll2|
                           (SPADCALL (SPADCALL |kn| 2 (QREFELT $ 45))
                                     (LIST |kn|) |eps| (QREFELT $ 50))
                           . #2#)))))
                 (LETT |iu|
                       (SPADCALL (|spadConstant| $ 65)
                                 (SPADCALL 1 0 10 (QREFELT $ 15))
                                 (QREFELT $ 79))
                       . #2#)
                 (LETT |kk2| (SPADCALL |ll2| (QREFELT $ 55)) . #2#)
                 (LETT |ppi|
                       (SPADCALL (SPADCALL (QREFELT $ 58)) 2 (QREFELT $ 48))
                       . #2#)
                 (LETT |z1|
                       (SPADCALL |z| (SPADCALL |kk| |ppi| (QREFELT $ 87))
                                 (QREFELT $ 43))
                       . #2#)
                 (LETT |tau|
                       (SPADCALL (SPADCALL |iu| |kk2| (QREFELT $ 52)) |kk|
                                 (QREFELT $ 43))
                       . #2#)
                 (LETT |itau| (SPADCALL |tau| (QREFELT $ 86)) . #2#)
                 (LETT |iz1| (SPADCALL |z1| (QREFELT $ 86)) . #2#)
                 (LETT |ni|
                       (SPADCALL
                        (SPADCALL (SPADCALL |iz1| |itau| (QREFELT $ 22))
                                  (QREFELT $ 59))
                        (QREFELT $ 60))
                       . #2#)
                 (LETT |z1|
                       (SPADCALL |z1| (SPADCALL |ni| |tau| (QREFELT $ 88))
                                 (QREFELT $ 44))
                       . #2#)
                 (LETT |nr|
                       (SPADCALL
                        (SPADCALL (SPADCALL |z1| (QREFELT $ 11))
                                  (QREFELT $ 59))
                        (QREFELT $ 60))
                       . #2#)
                 (LETT |z1|
                       (SPADCALL |z1|
                                 (SPADCALL (SPADCALL |nr| (QREFELT $ 89))
                                           (QREFELT $ 90))
                                 (QREFELT $ 44))
                       . #2#)
                 (LETT |zz1| (SPADCALL |ppi| |z1| (QREFELT $ 72)) . #2#)
                 (LETT |s1| (SPADCALL |zz1| |ll| (QREFELT $ 57)) . #2#)
                 (LETT |ctwo|
                       (SPADCALL (SPADCALL 2 0 10 (QREFELT $ 15))
                                 (QREFELT $ 90))
                       . #2#)
                 (LETT |s2|
                       (SPADCALL (SPADCALL |zz1| |ctwo| (QREFELT $ 43)) |ll|
                                 (QREFELT $ 57))
                       . #2#)
                 (LETT |s2| (SPADCALL |s2| |s2| (QREFELT $ 52)) . #2#)
                 (LETT |ms2| (SPADCALL |m| |s2| (QREFELT $ 52)) . #2#)
                 (LETT |den|
                       (SPADCALL (|spadConstant| $ 32)
                                 (SPADCALL |ms2| |s2| (QREFELT $ 52))
                                 (QREFELT $ 44))
                       . #2#)
                 (LETT |c1|
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 32)
                                  (SPADCALL |s2|
                                            (SPADCALL |ctwo| |ms2|
                                                      (QREFELT $ 44))
                                            (QREFELT $ 52))
                                  (QREFELT $ 44))
                        |den| (QREFELT $ 43))
                       . #2#)
                 (LETT |d1|
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 32)
                                  (SPADCALL |ms2|
                                            (SPADCALL |ctwo| |s2|
                                                      (QREFELT $ 44))
                                            (QREFELT $ 52))
                                  (QREFELT $ 44))
                        |den| (QREFELT $ 43))
                       . #2#)
                 (LETT |ni| (SPADCALL |ni| 4 (QREFELT $ 91)) . #2#)
                 (LETT |nr| (SPADCALL |nr| 4 (QREFELT $ 91)) . #2#)
                 (LETT |iu|
                       (SPADCALL (|spadConstant| $ 65)
                                 (SPADCALL 1 0 10 (QREFELT $ 15))
                                 (QREFELT $ 79))
                       . #2#)
                 (COND
                  ((>= |nr| 2)
                   (SEQ
                    (PROGN
                     (LETT |#G73| (SPADCALL |s1| (QREFELT $ 80)) . #2#)
                     (LETT |#G74| (SPADCALL |c1| (QREFELT $ 80)) . #2#)
                     (LETT |#G75| |d1| . #2#)
                     (LETT |s1| |#G73| . #2#)
                     (LETT |c1| |#G74| . #2#)
                     (LETT |d1| |#G75| . #2#))
                    (EXIT (LETT |nr| (- |nr| 2) . #2#)))))
                 (COND
                  ((EQL |nr| 1)
                   (SEQ (LETT |ms1| (SPADCALL |m1| (QREFELT $ 40)) . #2#)
                        (EXIT
                         (PROGN
                          (LETT |#G76| (SPADCALL |c1| |d1| (QREFELT $ 43))
                                . #2#)
                          (LETT |#G77|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |ms1| |s1| (QREFELT $ 52))
                                           |d1| (QREFELT $ 43))
                                 (QREFELT $ 80))
                                . #2#)
                          (LETT |#G78| (SPADCALL |ms1| |d1| (QREFELT $ 43))
                                . #2#)
                          (LETT |s1| |#G76| . #2#)
                          (LETT |c1| |#G77| . #2#)
                          (LETT |d1| |#G78| . #2#))))))
                 (COND
                  ((>= |ni| 2)
                   (SEQ
                    (PROGN
                     (LETT |#G79| |s1| . #2#)
                     (LETT |#G80| (SPADCALL |c1| (QREFELT $ 80)) . #2#)
                     (LETT |#G81| (SPADCALL |d1| (QREFELT $ 80)) . #2#)
                     (LETT |s1| |#G79| . #2#)
                     (LETT |c1| |#G80| . #2#)
                     (LETT |d1| |#G81| . #2#))
                    (EXIT (LETT |ni| (- |ni| 2) . #2#)))))
                 (EXIT
                  (COND
                   ((EQL |ni| 0) (LIST (|spadConstant| $ 32) |s1| |c1| |d1|))
                   ((SPADCALL |s1| (|spadConstant| $ 78) (QREFELT $ 70))
                    (LIST (|spadConstant| $ 78) (|spadConstant| $ 32)
                          (SPADCALL (SPADCALL |iu| |d1| (QREFELT $ 52))
                                    (QREFELT $ 80))
                          (SPADCALL (SPADCALL |iu| |ms0| (QREFELT $ 52))
                                    (QREFELT $ 80))))
                   (#1#
                    (LIST (|spadConstant| $ 32)
                          (SPADCALL (|spadConstant| $ 32)
                                    (SPADCALL |ms0| |s1| (QREFELT $ 52))
                                    (QREFELT $ 43))
                          (SPADCALL
                           (SPADCALL (SPADCALL |iu| |d1| (QREFELT $ 52))
                                     (SPADCALL |ms0| |s1| (QREFELT $ 52))
                                     (QREFELT $ 43))
                           (QREFELT $ 80))
                          (SPADCALL
                           (SPADCALL (SPADCALL |iu| |c1| (QREFELT $ 52)) |s1|
                                     (QREFELT $ 43))
                           (QREFELT $ 80))))))))))))))))) 

(DEFUN |FELFUN;jacobiSn;3C;24| (|z| |m| $)
  (PROG (|pl|)
    (RETURN
     (SEQ (LETT |pl| (|FELFUN;sn_cn_dn| |z| |m| $) |FELFUN;jacobiSn;3C;24|)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |pl| 1 (QREFELT $ 81)) (|spadConstant| $ 78)
                       (QREFELT $ 70))
             (|error| "pole of jacobiSn"))
            ('T (SPADCALL |pl| 2 (QREFELT $ 81))))))))) 

(DEFUN |FELFUN;jacobiCn;3C;25| (|z| |m| $)
  (PROG (|pl|)
    (RETURN
     (SEQ (LETT |pl| (|FELFUN;sn_cn_dn| |z| |m| $) |FELFUN;jacobiCn;3C;25|)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |pl| 1 (QREFELT $ 81)) (|spadConstant| $ 78)
                       (QREFELT $ 70))
             (|error| "pole of jacobiCn"))
            ('T (SPADCALL |pl| 3 (QREFELT $ 81))))))))) 

(DEFUN |FELFUN;jacobiDn;3C;26| (|z| |m| $)
  (PROG (|pl|)
    (RETURN
     (SEQ (LETT |pl| (|FELFUN;sn_cn_dn| |z| |m| $) |FELFUN;jacobiDn;3C;26|)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |pl| 1 (QREFELT $ 81)) (|spadConstant| $ 78)
                       (QREFELT $ 70))
             (|error| "pole of jacobiDn"))
            ('T (SPADCALL |pl| 4 (QREFELT $ 81))))))))) 

(DEFUN |FELFUN;jacobiSn;3F;27| (|z| |m| $)
  (PROG (|res| |k| |cc| |prec| |obits|)
    (RETURN
     (SEQ
      (LETT |obits| (SPADCALL (QREFELT $ 67)) . #1=(|FELFUN;jacobiSn;3F;27|))
      (LETT |prec| (+ |obits| 20) . #1#)
      (EXIT
       (COND
        ((SPADCALL |m| (SPADCALL 1 0 10 (QREFELT $ 15)) (QREFELT $ 95))
         (SEQ (SPADCALL |prec| (QREFELT $ 68))
              (LETT |res| (SPADCALL |z| (QREFELT $ 96)) . #1#)
              (SPADCALL |obits| (QREFELT $ 68)) (EXIT |res|)))
        (#2='T
         (SEQ (SPADCALL |prec| (QREFELT $ 68))
              (LETT |cc| (SPADCALL 1 0 10 (QREFELT $ 15)) . #1#)
              (COND
               ((SPADCALL |m| (|spadConstant| $ 20) (QREFELT $ 74))
                (SEQ
                 (LETT |m| (SPADCALL (|spadConstant| $ 20) |m| (QREFELT $ 22))
                       . #1#)
                 (LETT |k| (SPADCALL |m| (QREFELT $ 18)) . #1#)
                 (LETT |z| (SPADCALL |z| |k| (QREFELT $ 22)) . #1#)
                 (EXIT
                  (LETT |res|
                        (SPADCALL |k| (|FELFUN;sn1| |z| |m| |prec| $)
                                  (QREFELT $ 34))
                        . #1#))))
               (#2# (LETT |res| (|FELFUN;sn1| |z| |m| |prec| $) . #1#)))
              (SPADCALL |obits| (QREFELT $ 68)) (EXIT |res|))))))))) 

(DEFUN |FELFUN;jacobiCn;3F;28| (|z| |m| $)
  (PROG (|res| |k| |prec| |obits|)
    (RETURN
     (SEQ
      (LETT |obits| (SPADCALL (QREFELT $ 67)) . #1=(|FELFUN;jacobiCn;3F;28|))
      (LETT |prec| (+ |obits| 20) . #1#)
      (EXIT
       (COND
        ((SPADCALL |m| (SPADCALL 1 0 10 (QREFELT $ 15)) (QREFELT $ 95))
         (SEQ (SPADCALL |prec| (QREFELT $ 68))
              (LETT |res|
                    (SPADCALL (|spadConstant| $ 20)
                              (SPADCALL |z| (QREFELT $ 98)) (QREFELT $ 22))
                    . #1#)
              (SPADCALL |obits| (QREFELT $ 68)) (EXIT |res|)))
        (#2='T
         (SEQ (SPADCALL |prec| (QREFELT $ 68))
              (COND
               ((SPADCALL |m| (|spadConstant| $ 20) (QREFELT $ 74))
                (SEQ
                 (LETT |m| (SPADCALL (|spadConstant| $ 20) |m| (QREFELT $ 22))
                       . #1#)
                 (LETT |k| (SPADCALL |m| (QREFELT $ 18)) . #1#)
                 (LETT |z| (SPADCALL |z| |k| (QREFELT $ 22)) . #1#)
                 (EXIT (LETT |res| (|FELFUN;dn1| |z| |m| |prec| $) . #1#))))
               (#2# (LETT |res| (|FELFUN;cn1| |z| |m| |prec| $) . #1#)))
              (SPADCALL |obits| (QREFELT $ 68)) (EXIT |res|))))))))) 

(DEFUN |FELFUN;jacobiDn;3F;29| (|z| |m| $)
  (PROG (|res| |k| |prec| |obits|)
    (RETURN
     (SEQ
      (LETT |obits| (SPADCALL (QREFELT $ 67)) . #1=(|FELFUN;jacobiDn;3F;29|))
      (LETT |prec| (+ |obits| 20) . #1#)
      (EXIT
       (COND
        ((SPADCALL |m| (SPADCALL 1 0 10 (QREFELT $ 15)) (QREFELT $ 95))
         (SEQ (SPADCALL |prec| (QREFELT $ 68))
              (LETT |res|
                    (SPADCALL (|spadConstant| $ 20)
                              (SPADCALL |z| (QREFELT $ 98)) (QREFELT $ 22))
                    . #1#)
              (SPADCALL |obits| (QREFELT $ 68)) (EXIT |res|)))
        (#2='T
         (SEQ (SPADCALL |prec| (QREFELT $ 68))
              (COND
               ((SPADCALL |m| (|spadConstant| $ 20) (QREFELT $ 74))
                (SEQ
                 (LETT |m| (SPADCALL (|spadConstant| $ 20) |m| (QREFELT $ 22))
                       . #1#)
                 (LETT |k| (SPADCALL |m| (QREFELT $ 18)) . #1#)
                 (LETT |z| (SPADCALL |z| |k| (QREFELT $ 22)) . #1#)
                 (EXIT (LETT |res| (|FELFUN;cn1| |z| |m| |prec| $) . #1#))))
               (#2# (LETT |res| (|FELFUN;dn1| |z| |m| |prec| $) . #1#)))
              (SPADCALL |obits| (QREFELT $ 68)) (EXIT |res|))))))))) 

(DEFUN |FELFUN;theta0| (|tau| $)
  (PROG (|t3| |t2| |pp| |nt3| |i| #1=#:G312 |iq2| |liq2| |rtd| |q| |q2| |k|
         |otau| |tresh| |prec|)
    (RETURN
     (SEQ (LETT |prec| (SPADCALL (QREFELT $ 67)) . #2=(|FELFUN;theta0|))
          (LETT |tresh|
                (SPADCALL
                 (SPADCALL (SPADCALL 38 100 (QREFELT $ 29)) |prec|
                           (QREFELT $ 101))
                 (QREFELT $ 102))
                . #2#)
          (LETT |k| 0 . #2#)
          (COND
           ((NULL
             (SPADCALL (SPADCALL (|spadConstant| $ 20) 2 (QREFELT $ 48))
                       (SPADCALL |tau| (QREFELT $ 86)) (QREFELT $ 17)))
            (EXIT (|error| "imag(tau) must be bigger than 1/2"))))
          (LETT |otau| |tau| . #2#)
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL (SPADCALL |tau| (QREFELT $ 86)) |tresh|
                            (QREFELT $ 17)))
                 (GO G191)))
               (SEQ
                (LETT |tau|
                      (SPADCALL (SPADCALL 2 (QREFELT $ 89)) |tau|
                                (QREFELT $ 72))
                      . #2#)
                (EXIT (LETT |k| (+ |k| 1) . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |q2|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL (|spadConstant| $ 20) 2 (QREFELT $ 48))
                             (SPADCALL (QREFELT $ 58)) (QREFELT $ 34))
                   (SPADCALL (QREFELT $ 103)) (QREFELT $ 72))
                  |tau| (QREFELT $ 52))
                 (QREFELT $ 104))
                . #2#)
          (LETT |q| (SPADCALL |q2| |q2| (QREFELT $ 52)) . #2#)
          (LETT |t2|
                (SPADCALL (SPADCALL 2 (QREFELT $ 89))
                          (SPADCALL (|spadConstant| $ 32)
                                    (SPADCALL |q| |q| (QREFELT $ 52))
                                    (QREFELT $ 42))
                          (QREFELT $ 72))
                . #2#)
          (LETT |t3|
                (SPADCALL (|spadConstant| $ 32)
                          (SPADCALL (SPADCALL 2 (QREFELT $ 89)) |q|
                                    (QREFELT $ 72))
                          (QREFELT $ 42))
                . #2#)
          (LETT |t2|
                (SPADCALL (SPADCALL |q2| |t2| (QREFELT $ 52)) |t2|
                          (QREFELT $ 52))
                . #2#)
          (LETT |t3| (SPADCALL |t3| |t3| (QREFELT $ 52)) . #2#)
          (EXIT
           (COND ((EQL |k| 0) (LIST |t2| |t3|))
                 ('T
                  (SEQ
                   (LETT |rtd|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 20) 2 (QREFELT $ 48))
                           (SPADCALL (QREFELT $ 58)) (QREFELT $ 34))
                          (SPADCALL |otau| (QREFELT $ 11)) (QREFELT $ 34))
                         . #2#)
                   (LETT |iq2|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL (QREFELT $ 103)) |rtd|
                                     (QREFELT $ 87))
                           (QREFELT $ 80))
                          (QREFELT $ 104))
                         . #2#)
                   (LETT |liq2| NIL . #2#)
                   (SEQ (LETT |i| 1 . #2#) G190
                        (COND ((|greater_SI| |i| |k|) (GO G191)))
                        (SEQ (LETT |liq2| (CONS |iq2| |liq2|) . #2#)
                             (EXIT
                              (LETT |iq2| (SPADCALL |iq2| |iq2| (QREFELT $ 52))
                                    . #2#)))
                        (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                        (EXIT NIL))
                   (SEQ (LETT |iq2| NIL . #2#) (LETT #1# |liq2| . #2#)
                        (LETT |i| 1 . #2#) G190
                        (COND
                         ((OR (|greater_SI| |i| |k|) (ATOM #1#)
                              (PROGN (LETT |iq2| (CAR #1#) . #2#) NIL))
                          (GO G191)))
                        (SEQ
                         (LETT |nt3| (SPADCALL |t3| |t2| (QREFELT $ 42)) . #2#)
                         (LETT |t2|
                               (SPADCALL (SPADCALL 2 (QREFELT $ 89))
                                         (SPADCALL
                                          (SPADCALL |t2| |t3| (QREFELT $ 52))
                                          (QREFELT $ 40))
                                         (QREFELT $ 72))
                               . #2#)
                         (LETT |pp| (SPADCALL |t2| |iq2| (QREFELT $ 52)) . #2#)
                         (COND
                          ((SPADCALL (SPADCALL |pp| (QREFELT $ 11))
                                     (|spadConstant| $ 65) (QREFELT $ 17))
                           (LETT |t2| (SPADCALL |t2| (QREFELT $ 80)) . #2#)))
                         (EXIT (LETT |t3| |nt3| . #2#)))
                        (LETT |i|
                              (PROG1 (|inc_SI| |i|) (LETT #1# (CDR #1#) . #2#))
                              . #2#)
                        (GO G190) G191 (EXIT NIL))
                   (EXIT (LIST |t2| |t3|)))))))))) 

(DEFUN |FELFUN;modularInvariants| (|tau| $)
  (PROG (|g3| |g2| |m2| |m| |k| |t3| |t2| |td|)
    (RETURN
     (SEQ
      (LETT |td| (|FELFUN;theta0| |tau| $) . #1=(|FELFUN;modularInvariants|))
      (LETT |t2| (|SPADfirst| |td|) . #1#)
      (LETT |t3| (|SPADfirst| (CDR |td|)) . #1#)
      (LETT |k| (SPADCALL |t2| |t3| (QREFELT $ 43)) . #1#)
      (LETT |m| (SPADCALL |k| |k| (QREFELT $ 52)) . #1#)
      (LETT |m2| (SPADCALL |m| |m| (QREFELT $ 52)) . #1#)
      (LETT |g2|
            (SPADCALL (SPADCALL (SPADCALL 4 3 (QREFELT $ 29)) (QREFELT $ 102))
                      (SPADCALL (SPADCALL |m2| |m| (QREFELT $ 44))
                                (|spadConstant| $ 32) (QREFELT $ 42))
                      (QREFELT $ 72))
            . #1#)
      (LETT |g3|
            (SPADCALL (SPADCALL (SPADCALL 4 27 (QREFELT $ 29)) (QREFELT $ 102))
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL 2 (QREFELT $ 89)) |m|
                                    (QREFELT $ 72))
                          |m2| (QREFELT $ 52))
                         (SPADCALL (SPADCALL 3 (QREFELT $ 89)) |m2|
                                   (QREFELT $ 72))
                         (QREFELT $ 44))
                        (SPADCALL (SPADCALL 3 (QREFELT $ 89)) |m|
                                  (QREFELT $ 72))
                        (QREFELT $ 44))
                       (SPADCALL 2 (QREFELT $ 105)) (QREFELT $ 42))
                      (QREFELT $ 72))
            . #1#)
      (EXIT (LIST |g2| |g3| |t3|)))))) 

(DEFUN |FELFUN;reduce_periods| (|w1| |w2| $)
  (PROG (|aw1| #1=#:G322 |rit| |tau| |aw2| |#G110| |#G109| |#G108| |#G107|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |aw1| (SPADCALL |w1| (QREFELT $ 12))
              . #2=(|FELFUN;reduce_periods|))
        (LETT |aw2| (SPADCALL |w2| (QREFELT $ 12)) . #2#)
        (EXIT
         (SEQ G190 NIL
              (SEQ
               (COND
                ((SPADCALL |aw2| |aw1| (QREFELT $ 74))
                 (SEQ
                  (PROGN
                   (LETT |#G107| |w2| . #2#)
                   (LETT |#G108| |w1| . #2#)
                   (LETT |w1| |#G107| . #2#)
                   (LETT |w2| |#G108| . #2#))
                  (EXIT
                   (PROGN
                    (LETT |#G109| |aw2| . #2#)
                    (LETT |#G110| |aw1| . #2#)
                    (LETT |aw1| |#G109| . #2#)
                    (LETT |aw2| |#G110| . #2#))))))
               (LETT |tau| (SPADCALL |w1| |w2| (QREFELT $ 43)) . #2#)
               (COND
                ((SPADCALL (SPADCALL |tau| (QREFELT $ 86))
                           (|spadConstant| $ 65) (QREFELT $ 17))
                 (SEQ (LETT |tau| (SPADCALL |tau| (QREFELT $ 80)) . #2#)
                      (EXIT
                       (LETT |w1| (SPADCALL |w1| (QREFELT $ 80)) . #2#)))))
               (LETT |rit|
                     (SPADCALL (SPADCALL |tau| (QREFELT $ 11)) (QREFELT $ 59))
                     . #2#)
               (EXIT
                (COND
                 ((SPADCALL |rit| (|spadConstant| $ 65) (QREFELT $ 95))
                  (PROGN (LETT #1# (LIST |w1| |w2|) . #2#) (GO #1#)))
                 ('T
                  (SEQ
                   (LETT |w1|
                         (SPADCALL |w1| (SPADCALL |rit| |w2| (QREFELT $ 72))
                                   (QREFELT $ 44))
                         . #2#)
                   (EXIT
                    (COND
                     ((SPADCALL
                       (SPADCALL (SPADCALL 2 3 (QREFELT $ 29)) (QREFELT $ 102))
                       (SPADCALL |tau| (QREFELT $ 86)) (QREFELT $ 17))
                      (PROGN (LETT #1# (LIST |w1| |w2|) . #2#) (GO #1#)))
                     ('T
                      (LETT |aw1| (SPADCALL |w1| (QREFELT $ 12)) . #2#)))))))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |FELFUN;modularInvariantJ;2C;33| (|tau| $)
  (PROG (|g2_3| |g3| |g2| |md| |nw| |obits|)
    (RETURN
     (SEQ
      (COND
       ((NULL
         (SPADCALL (|spadConstant| $ 65) (SPADCALL |tau| (QREFELT $ 86))
                   (QREFELT $ 17)))
        (|error| "need imag(tau) > 0"))
       ('T
        (SEQ
         (LETT |obits| (SPADCALL (QREFELT $ 67))
               . #1=(|FELFUN;modularInvariantJ;2C;33|))
         (EXIT
          (|finally|
           (SEQ (SPADCALL (+ (* 3 |obits|) 20) (QREFELT $ 68))
                (LETT |nw|
                      (|FELFUN;reduce_periods| |tau| (|spadConstant| $ 32) $)
                      . #1#)
                (SPADCALL (+ |obits| 20) (QREFELT $ 68))
                (LETT |tau|
                      (SPADCALL (SPADCALL |nw| 1 (QREFELT $ 81))
                                (SPADCALL |nw| 2 (QREFELT $ 81))
                                (QREFELT $ 43))
                      . #1#)
                (LETT |md| (|FELFUN;modularInvariants| |tau| $) . #1#)
                (LETT |g2| (SPADCALL |md| 1 (QREFELT $ 81)) . #1#)
                (LETT |g3| (SPADCALL |md| 2 (QREFELT $ 81)) . #1#)
                (LETT |g2_3|
                      (SPADCALL (SPADCALL |g2| |g2| (QREFELT $ 52)) |g2|
                                (QREFELT $ 52))
                      . #1#)
                (EXIT
                 (SPADCALL (SPADCALL 1728 |g2_3| (QREFELT $ 41))
                           (SPADCALL |g2_3|
                                     (SPADCALL
                                      (SPADCALL 27 |g3| (QREFELT $ 41)) |g3|
                                      (QREFELT $ 52))
                                     (QREFELT $ 44))
                           (QREFELT $ 43))))
           (SPADCALL |obits| (QREFELT $ 68))))))))))) 

(DEFUN |FELFUN;weierstrassInvariants;2CL;34| (|w1| |w2| $)
  (PROG (|s4| |s2| |s| |tf| |g3| |g2| |md| |tau| |nw| |obits|)
    (RETURN
     (SEQ
      (LETT |obits| (SPADCALL (QREFELT $ 67))
            . #1=(|FELFUN;weierstrassInvariants;2CL;34|))
      (EXIT
       (|finally|
        (SEQ (SPADCALL (+ (* 3 |obits|) 20) (QREFELT $ 68))
             (LETT |nw| (|FELFUN;reduce_periods| |w1| |w2| $) . #1#)
             (SPADCALL (+ |obits| 20) (QREFELT $ 68))
             (LETT |w1| (SPADCALL |nw| 1 (QREFELT $ 81)) . #1#)
             (LETT |w2| (SPADCALL |nw| 2 (QREFELT $ 81)) . #1#)
             (LETT |tau| (SPADCALL |w1| |w2| (QREFELT $ 43)) . #1#)
             (LETT |md| (|FELFUN;modularInvariants| |tau| $) . #1#)
             (LETT |g2| (SPADCALL |md| 1 (QREFELT $ 81)) . #1#)
             (LETT |g3| (SPADCALL |md| 2 (QREFELT $ 81)) . #1#)
             (LETT |tf| (SPADCALL |md| 3 (QREFELT $ 81)) . #1#)
             (LETT |s|
                   (SPADCALL
                    (SPADCALL (SPADCALL (QREFELT $ 58)) |tf| (QREFELT $ 72))
                    |w2| (QREFELT $ 43))
                   . #1#)
             (LETT |s2| (SPADCALL |s| |s| (QREFELT $ 52)) . #1#)
             (LETT |s4| (SPADCALL |s2| |s2| (QREFELT $ 52)) . #1#)
             (EXIT
              (LIST (SPADCALL |s4| |g2| (QREFELT $ 52))
                    (SPADCALL (SPADCALL |s2| |s4| (QREFELT $ 52)) |g3|
                              (QREFELT $ 52)))))
        (SPADCALL |obits| (QREFELT $ 68)))))))) 

(DEFUN |FELFUN;ellipticF;3F;35| (|z| |m| $)
  (PROG (|res| |delta| #1=#:G340 |k| |ll| |eps| |prec| |z2| |m2| |obits|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |m| (|spadConstant| $ 20) (QREFELT $ 95))
        (SPADCALL |z| (QREFELT $ 108)))
       (#2='T
        (SEQ
         (LETT |obits| (SPADCALL (QREFELT $ 67))
               . #3=(|FELFUN;ellipticF;3F;35|))
         (EXIT
          (COND
           ((SPADCALL |m| (|spadConstant| $ 20) (QREFELT $ 74))
            (SEQ (SPADCALL (+ |obits| 20) (QREFELT $ 68))
                 (LETT |m2| (SPADCALL |m| (QREFELT $ 18)) . #3#)
                 (LETT |z2| (SPADCALL |m2| |z| (QREFELT $ 34)) . #3#)
                 (EXIT
                  (COND
                   ((SPADCALL |z2| (|spadConstant| $ 20) (QREFELT $ 74))
                    (SEQ (SPADCALL |obits| (QREFELT $ 68))
                         (EXIT (|error| "ellipticF: abs(z) > 1/sqrt(m)"))))
                   (#2#
                    (SEQ
                     (LETT |res|
                           (SPADCALL
                            (SPADCALL |z2|
                                      (SPADCALL (|spadConstant| $ 20) |m|
                                                (QREFELT $ 22))
                                      (QREFELT $ 109))
                            |m2| (QREFELT $ 22))
                           . #3#)
                     (SPADCALL |obits| (QREFELT $ 68)) (EXIT |res|)))))))
           ((SPADCALL |m| (|spadConstant| $ 65) (QREFELT $ 95))
            (SPADCALL |z| (QREFELT $ 110)))
           (#2#
            (COND
             ((SPADCALL (SPADCALL |z| (QREFELT $ 7)) (|spadConstant| $ 20)
                        (QREFELT $ 74))
              (|error| "ellipticF: abs(z) > 1"))
             ((SPADCALL |z| (|spadConstant| $ 20) (QREFELT $ 95))
              (SPADCALL |m| (QREFELT $ 69)))
             (#2#
              (COND
               ((SPADCALL |z| (SPADCALL (|spadConstant| $ 20) (QREFELT $ 76))
                          (QREFELT $ 95))
                (SPADCALL (SPADCALL |m| (QREFELT $ 69)) (QREFELT $ 76)))
               (#2#
                (SEQ (LETT |prec| (+ |obits| 20) . #3#)
                     (SPADCALL |prec| (QREFELT $ 68))
                     (LETT |eps|
                           (|FELFUN;two_to_minus_n| (QUOTIENT2 |prec| 2) $)
                           . #3#)
                     (LETT |ll| (SPADCALL |m| |eps| (QREFELT $ 33)) . #3#)
                     (LETT |res| (SPADCALL |ll| (QREFELT $ 37)) . #3#)
                     (LETT |ll| (NREVERSE |ll|) . #3#)
                     (SEQ (LETT |k| NIL . #3#) (LETT #1# |ll| . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |delta|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 20) |k|
                                             (QREFELT $ 21))
                                   2 (QREFELT $ 75))
                                  (SPADCALL (SPADCALL 4 |k| (QREFELT $ 19))
                                            (SPADCALL |z| 2 (QREFELT $ 24))
                                            (QREFELT $ 34))
                                  (QREFELT $ 23))
                                 . #3#)
                           (EXIT
                            (LETT |z|
                                  (SPADCALL (SPADCALL 2 |z| (QREFELT $ 19))
                                            (SPADCALL
                                             (SPADCALL (|spadConstant| $ 20)
                                                       |k| (QREFELT $ 21))
                                             (SPADCALL |delta| (QREFELT $ 18))
                                             (QREFELT $ 21))
                                            (QREFELT $ 22))
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                     (LETT |res|
                           (SPADCALL |res| (SPADCALL |z| (QREFELT $ 110))
                                     (QREFELT $ 34))
                           . #3#)
                     (SPADCALL |obits| (QREFELT $ 68))
                     (EXIT |res|)))))))))))))))) 

(DEFUN |FELFUN;ellipticF_aux| (|z| |m| $)
  (PROG (|delta| #1=#:G349 |k| |zz| |snf| |dnz| |cnz| |sf| |nz| |z2| |z0| |ll|
         |res| |eps| |prec| |m2| |obits|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |m| (|spadConstant| $ 32) (QREFELT $ 70))
        (SPADCALL |z| (QREFELT $ 111)))
       (#2='T
        (SEQ
         (LETT |obits| (SPADCALL (QREFELT $ 67)) . #3=(|FELFUN;ellipticF_aux|))
         (EXIT
          (COND
           ((SPADCALL (SPADCALL |m| (QREFELT $ 12)) (|spadConstant| $ 20)
                      (QREFELT $ 74))
            (SEQ (SPADCALL (+ |obits| 20) (QREFELT $ 68))
                 (LETT |m2| (SPADCALL |m| (QREFELT $ 40)) . #3#)
                 (LETT |z2| (SPADCALL |m2| |z| (QREFELT $ 52)) . #3#)
                 (EXIT
                  (SPADCALL
                   (|FELFUN;ellipticF_aux| |z2|
                    (SPADCALL (|spadConstant| $ 32) |m| (QREFELT $ 43)) $)
                   |m2| (QREFELT $ 43)))))
           ((SPADCALL |m| (|spadConstant| $ 78) (QREFELT $ 70))
            (SPADCALL |z| (QREFELT $ 112)))
           ((SPADCALL |z| (|spadConstant| $ 32) (QREFELT $ 70))
            (SPADCALL |m| (QREFELT $ 73)))
           (#2#
            (COND
             ((SPADCALL |z| (SPADCALL (|spadConstant| $ 32) (QREFELT $ 80))
                        (QREFELT $ 70))
              (SPADCALL (SPADCALL |m| (QREFELT $ 73)) (QREFELT $ 80)))
             (#2#
              (SEQ (LETT |prec| (+ |obits| 20) . #3#)
                   (SPADCALL |prec| (QREFELT $ 68))
                   (LETT |eps| (|FELFUN;two_to_minus_n| (QUOTIENT2 |prec| 2) $)
                         . #3#)
                   (LETT |ll| (SPADCALL |m| |eps| (QREFELT $ 51)) . #3#)
                   (LETT |res| (SPADCALL |ll| (QREFELT $ 55)) . #3#)
                   (LETT |ll| (NREVERSE |ll|) . #3#)
                   (LETT |sf| (|spadConstant| $ 20) . #3#)
                   (LETT |nz| (SPADCALL |z| (QREFELT $ 113)) . #3#)
                   (COND
                    ((SPADCALL (|spadConstant| $ 20) |nz| (QREFELT $ 17))
                     (SEQ (LETT |z0| |z| . #3#)
                          (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 52)) . #3#)
                          (LETT |z2|
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 32)
                                           (SPADCALL
                                            (SPADCALL (|spadConstant| $ 32)
                                                      |z2| (QREFELT $ 44))
                                            (QREFELT $ 40))
                                           (QREFELT $ 44))
                                 (SPADCALL (|spadConstant| $ 32)
                                           (SPADCALL
                                            (SPADCALL (|spadConstant| $ 32)
                                                      (SPADCALL |m| |z2|
                                                                (QREFELT $ 52))
                                                      (QREFELT $ 44))
                                            (QREFELT $ 40))
                                           (QREFELT $ 42))
                                 (QREFELT $ 43))
                                . #3#)
                          (LETT |nz| (SPADCALL |z2| (QREFELT $ 113)) . #3#)
                          (LETT |sf| (SPADCALL 2 (QREFELT $ 89)) . #3#)
                          (LETT |cnz|
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 32) |z2|
                                           (QREFELT $ 44))
                                 (QREFELT $ 40))
                                . #3#)
                          (LETT |dnz|
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 32)
                                           (SPADCALL |m| |z2| (QREFELT $ 52))
                                           (QREFELT $ 44))
                                 (QREFELT $ 40))
                                . #3#)
                          (LETT |snf|
                                (SPADCALL (SPADCALL |cnz| |dnz| (QREFELT $ 52))
                                          (SPADCALL (|spadConstant| $ 32)
                                                    (SPADCALL
                                                     (SPADCALL |m| |z2|
                                                               (QREFELT $ 52))
                                                     |z2| (QREFELT $ 52))
                                                    (QREFELT $ 44))
                                          (QREFELT $ 43))
                                . #3#)
                          (LETT |z| (SPADCALL |z2| (QREFELT $ 40)) . #3#)
                          (LETT |zz| (SPADCALL |z| |snf| (QREFELT $ 52)) . #3#)
                          (EXIT
                           (COND
                            ((SPADCALL
                              (SPADCALL
                               (SPADCALL (SPADCALL |z0| (QREFELT $ 114)) |zz|
                                         (QREFELT $ 52))
                               (QREFELT $ 11))
                              (|spadConstant| $ 65) (QREFELT $ 17))
                             (LETT |z| (SPADCALL |z| (QREFELT $ 80))
                                   . #3#)))))))
                   (SEQ (LETT |k| NIL . #3#) (LETT #1# |ll| . #3#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (LETT |delta|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 32) |k|
                                           (QREFELT $ 42))
                                 2 (QREFELT $ 115))
                                (SPADCALL (SPADCALL 4 |k| (QREFELT $ 41))
                                          (SPADCALL |z| 2 (QREFELT $ 45))
                                          (QREFELT $ 52))
                                (QREFELT $ 44))
                               . #3#)
                         (EXIT
                          (LETT |z|
                                (SPADCALL (SPADCALL 2 |z| (QREFELT $ 41))
                                          (SPADCALL
                                           (SPADCALL (|spadConstant| $ 32) |k|
                                                     (QREFELT $ 42))
                                           (SPADCALL |delta| (QREFELT $ 40))
                                           (QREFELT $ 42))
                                          (QREFELT $ 43))
                                . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                   (EXIT
                    (SPADCALL (SPADCALL |sf| |res| (QREFELT $ 72))
                              (SPADCALL |z| (QREFELT $ 112))
                              (QREFELT $ 52)))))))))))))))) 

(DEFUN |FELFUN;ellipticF;3C;37| (|z| |m| $)
  (PROG (|obits|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |m| (|spadConstant| $ 32) (QREFELT $ 70))
        (SPADCALL |z| (QREFELT $ 111)))
       ('T
        (SEQ (LETT |obits| (SPADCALL (QREFELT $ 67)) |FELFUN;ellipticF;3C;37|)
             (EXIT
              (|finally| (|FELFUN;ellipticF_aux| |z| |m| $)
                         (SPADCALL |obits| (QREFELT $ 68))))))))))) 

(DEFUN |FELFUN;ellipticE;2F;38| (|m| $)
  (PROG (|e_val| |p| |k1inv| |f_val| |k1| #1=#:G356 |k| |llr| |ll| |eps| |prec|
         |obits|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |m| (|spadConstant| $ 20) (QREFELT $ 66))
        (|error| "ellipticE: m >=1"))
       ((SPADCALL |m| (|spadConstant| $ 65) (QREFELT $ 95))
        (SPADCALL (SPADCALL (QREFELT $ 58)) 2 (QREFELT $ 48)))
       ('T
        (SEQ
         (LETT |obits| (SPADCALL (QREFELT $ 67))
               . #2=(|FELFUN;ellipticE;2F;38|))
         (LETT |prec| (+ |obits| 20) . #2#) (SPADCALL |prec| (QREFELT $ 68))
         (LETT |eps| (|FELFUN;two_to_minus_n| (QUOTIENT2 |prec| 2) $) . #2#)
         (LETT |ll| (SPADCALL |m| |eps| (QREFELT $ 33)) . #2#)
         (LETT |llr| (REVERSE |ll|) . #2#)
         (LETT |f_val|
               (LETT |e_val|
                     (SPADCALL (SPADCALL (QREFELT $ 58)) 2 (QREFELT $ 48))
                     . #2#)
               . #2#)
         (SEQ (LETT |k| NIL . #2#) (LETT #1# |ll| . #2#) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                (GO G191)))
              (SEQ
               (LETT |k1| (SPADCALL (|spadConstant| $ 20) |k| (QREFELT $ 21))
                     . #2#)
               (LETT |f_val| (SPADCALL |k1| |f_val| (QREFELT $ 34)) . #2#)
               (LETT |k1inv|
                     (SPADCALL (|spadConstant| $ 20) |k1| (QREFELT $ 22))
                     . #2#)
               (LETT |p|
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 20) |k| (QREFELT $ 23))
                      |k1inv| (QREFELT $ 34))
                     . #2#)
               (EXIT
                (LETT |e_val|
                      (SPADCALL
                       (SPADCALL (SPADCALL 2 |k1inv| (QREFELT $ 19)) |e_val|
                                 (QREFELT $ 34))
                       (SPADCALL |p| |f_val| (QREFELT $ 34)) (QREFELT $ 23))
                      . #2#)))
              (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
         (SPADCALL |obits| (QREFELT $ 68)) (EXIT |e_val|)))))))) 

(DEFUN |FELFUN;ellipticE;2C;39| (|m| $)
  (PROG (|e_val| |p| |k1inv| |f_val| |k1| #1=#:G363 |k| |llr| |ll| |eps| |prec|
         |obits|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |m| (|spadConstant| $ 32) (QREFELT $ 70))
        (|error| "ellipticE: m = 1"))
       (#2='T
        (SEQ
         (LETT |e_val|
               (SPADCALL
                (SPADCALL (SPADCALL (QREFELT $ 58)) (SPADCALL 2 (QREFELT $ 89))
                          (QREFELT $ 22))
                (QREFELT $ 90))
               . #3=(|FELFUN;ellipticE;2C;39|))
         (EXIT
          (COND ((SPADCALL |m| (|spadConstant| $ 78) (QREFELT $ 70)) |e_val|)
                (#2#
                 (SEQ (LETT |obits| (SPADCALL (QREFELT $ 67)) . #3#)
                      (EXIT
                       (|finally|
                        (SEQ (LETT |prec| (+ |obits| 20) . #3#)
                             (SPADCALL |prec| (QREFELT $ 68))
                             (LETT |eps|
                                   (|FELFUN;two_to_minus_n|
                                    (QUOTIENT2 |prec| 2) $)
                                   . #3#)
                             (LETT |ll| (SPADCALL |m| |eps| (QREFELT $ 51))
                                   . #3#)
                             (LETT |llr| (REVERSE |ll|) . #3#)
                             (LETT |f_val| |e_val| . #3#)
                             (SEQ (LETT |k| NIL . #3#) (LETT #1# |ll| . #3#)
                                  G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |k1|
                                         (SPADCALL (|spadConstant| $ 32) |k|
                                                   (QREFELT $ 42))
                                         . #3#)
                                   (LETT |f_val|
                                         (SPADCALL |k1| |f_val| (QREFELT $ 52))
                                         . #3#)
                                   (LETT |k1inv|
                                         (SPADCALL (|spadConstant| $ 32) |k1|
                                                   (QREFELT $ 43))
                                         . #3#)
                                   (LETT |p|
                                         (SPADCALL
                                          (SPADCALL (|spadConstant| $ 32) |k|
                                                    (QREFELT $ 44))
                                          |k1inv| (QREFELT $ 52))
                                         . #3#)
                                   (EXIT
                                    (LETT |e_val|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL 2 |k1inv| (QREFELT $ 41))
                                            |e_val| (QREFELT $ 52))
                                           (SPADCALL |p| |f_val|
                                                     (QREFELT $ 52))
                                           (QREFELT $ 44))
                                          . #3#)))
                                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT |e_val|))
                        (SPADCALL |obits| (QREFELT $ 68))))))))))))))) 

(DEFUN |FELFUN;ellipticE;3F;40| (|z| |m| $)
  (PROG (|e_val| |r| |k_z2| |z2| |p| |k1inv| |f_val| |k1| #1=#:G377 |k|
         #2=#:G378 |lz| |delta| #3=#:G376 |llr| |ll| |eps| |prec| |res| |m2|
         |obits|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |m| (|spadConstant| $ 20) (QREFELT $ 95)) |z|)
            (#4='T
             (SEQ
              (LETT |obits| (SPADCALL (QREFELT $ 67))
                    . #5=(|FELFUN;ellipticE;3F;40|))
              (EXIT
               (COND
                ((SPADCALL |m| (|spadConstant| $ 20) (QREFELT $ 74))
                 (SEQ (SPADCALL (+ |obits| 20) (QREFELT $ 68))
                      (LETT |m2| (SPADCALL |m| (QREFELT $ 18)) . #5#)
                      (LETT |z2| (SPADCALL |m2| |z| (QREFELT $ 34)) . #5#)
                      (EXIT
                       (COND
                        ((SPADCALL |z2| (|spadConstant| $ 20) (QREFELT $ 74))
                         (SEQ (SPADCALL |obits| (QREFELT $ 68))
                              (EXIT
                               (|error| "ellipticE: abs(z) > 1/sqrt(m)"))))
                        (#4#
                         (SEQ
                          (LETT |res|
                                (SPADCALL
                                 (SPADCALL |m2|
                                           (SPADCALL |z2|
                                                     (SPADCALL
                                                      (|spadConstant| $ 20) |m|
                                                      (QREFELT $ 22))
                                                     (QREFELT $ 119))
                                           (QREFELT $ 34))
                                 (SPADCALL
                                  (SPADCALL |m| (|spadConstant| $ 20)
                                            (QREFELT $ 23))
                                  |z| (QREFELT $ 34))
                                 (QREFELT $ 23))
                                . #5#)
                          (SPADCALL |obits| (QREFELT $ 68)) (EXIT |res|)))))))
                ((SPADCALL |m| (|spadConstant| $ 65) (QREFELT $ 95))
                 (SPADCALL |z| (QREFELT $ 110)))
                (#4#
                 (COND
                  ((SPADCALL (SPADCALL |z| (QREFELT $ 7)) (|spadConstant| $ 20)
                             (QREFELT $ 74))
                   (|error| "ellipticE: abs(z) > 1"))
                  ((SPADCALL |z| (|spadConstant| $ 20) (QREFELT $ 95))
                   (SPADCALL |m| (QREFELT $ 117)))
                  (#4#
                   (COND
                    ((SPADCALL |z|
                               (SPADCALL (|spadConstant| $ 20) (QREFELT $ 76))
                               (QREFELT $ 95))
                     (SPADCALL (SPADCALL |m| (QREFELT $ 117)) (QREFELT $ 76)))
                    (#4#
                     (SEQ (LETT |prec| (+ |obits| 20) . #5#)
                          (SPADCALL |prec| (QREFELT $ 68))
                          (LETT |eps|
                                (|FELFUN;two_to_minus_n| (QUOTIENT2 |prec| 2)
                                 $)
                                . #5#)
                          (LETT |ll| (SPADCALL |m| |eps| (QREFELT $ 33)) . #5#)
                          (LETT |llr| (REVERSE |ll|) . #5#)
                          (LETT |lz| NIL . #5#)
                          (SEQ (LETT |k| NIL . #5#) (LETT #3# |llr| . #5#) G190
                               (COND
                                ((OR (ATOM #3#)
                                     (PROGN (LETT |k| (CAR #3#) . #5#) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |delta|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL (|spadConstant| $ 20) |k|
                                                  (QREFELT $ 21))
                                        2 (QREFELT $ 75))
                                       (SPADCALL
                                        (SPADCALL 4 |k| (QREFELT $ 19))
                                        (SPADCALL |z| 2 (QREFELT $ 24))
                                        (QREFELT $ 34))
                                       (QREFELT $ 23))
                                      . #5#)
                                (LETT |z|
                                      (SPADCALL (SPADCALL 2 |z| (QREFELT $ 19))
                                                (SPADCALL
                                                 (SPADCALL
                                                  (|spadConstant| $ 20) |k|
                                                  (QREFELT $ 21))
                                                 (SPADCALL |delta|
                                                           (QREFELT $ 18))
                                                 (QREFELT $ 21))
                                                (QREFELT $ 22))
                                      . #5#)
                                (EXIT (LETT |lz| (CONS |z| |lz|) . #5#)))
                               (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                               (EXIT NIL))
                          (LETT |f_val|
                                (LETT |e_val| (SPADCALL |z| (QREFELT $ 110))
                                      . #5#)
                                . #5#)
                          (SEQ (LETT |z| NIL . #5#) (LETT #2# |lz| . #5#)
                               (LETT |k| NIL . #5#) (LETT #1# |ll| . #5#) G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |k| (CAR #1#) . #5#) NIL)
                                     (ATOM #2#)
                                     (PROGN (LETT |z| (CAR #2#) . #5#) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |k1|
                                      (SPADCALL (|spadConstant| $ 20) |k|
                                                (QREFELT $ 21))
                                      . #5#)
                                (LETT |f_val|
                                      (SPADCALL |k1| |f_val| (QREFELT $ 34))
                                      . #5#)
                                (LETT |k1inv|
                                      (SPADCALL (|spadConstant| $ 20) |k1|
                                                (QREFELT $ 22))
                                      . #5#)
                                (LETT |p|
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| $ 20) |k|
                                                 (QREFELT $ 23))
                                       |k1inv| (QREFELT $ 34))
                                      . #5#)
                                (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 34))
                                      . #5#)
                                (LETT |k_z2| (SPADCALL |k| |z2| (QREFELT $ 34))
                                      . #5#)
                                (LETT |r|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL (|spadConstant| $ 20) |z2|
                                                  (QREFELT $ 23))
                                        (SPADCALL (|spadConstant| $ 20)
                                                  (SPADCALL |k| |k_z2|
                                                            (QREFELT $ 34))
                                                  (QREFELT $ 23))
                                        (QREFELT $ 34))
                                       (QREFELT $ 18))
                                      . #5#)
                                (LETT |r|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| $ 20) |p|
                                                   (QREFELT $ 23))
                                         |z| (QREFELT $ 34))
                                        |r| (QREFELT $ 34))
                                       (SPADCALL (|spadConstant| $ 20) |k_z2|
                                                 (QREFELT $ 21))
                                       (QREFELT $ 22))
                                      . #5#)
                                (EXIT
                                 (LETT |e_val|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL 2 |k1inv| (QREFELT $ 19))
                                          |e_val| (QREFELT $ 34))
                                         (SPADCALL |p| |f_val| (QREFELT $ 34))
                                         (QREFELT $ 23))
                                        |r| (QREFELT $ 21))
                                       . #5#)))
                               (LETT #1#
                                     (PROG1 (CDR #1#)
                                       (LETT #2# (CDR #2#) . #5#))
                                     . #5#)
                               (GO G190) G191 (EXIT NIL))
                          (SPADCALL |obits| (QREFELT $ 68))
                          (EXIT |e_val|)))))))))))))))) 

(DEFUN |FELFUN;ellipticE_aux| (|z| |m| $)
  (PROG (|e_val| |r| |k_z2| |z2| |p| |k1inv| |f_val| |k1| #1=#:G390 |k|
         #2=#:G391 |lz| |delta| #3=#:G389 |zz| |snf| |dnz| |cnz| |z0| |sf| |nz|
         |res0| |llr| |ll| |eps| |prec| |m2| |obits|)
    (RETURN
     (SEQ
      (LETT |obits| (SPADCALL (QREFELT $ 67)) . #4=(|FELFUN;ellipticE_aux|))
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |m| (QREFELT $ 12)) (|spadConstant| $ 20)
                   (QREFELT $ 74))
         (SEQ (SPADCALL (+ |obits| 20) (QREFELT $ 68))
              (LETT |m2| (SPADCALL |m| (QREFELT $ 40)) . #4#)
              (LETT |z2| (SPADCALL |m2| |z| (QREFELT $ 52)) . #4#)
              (EXIT
               (SPADCALL
                (SPADCALL |m2|
                          (|FELFUN;ellipticE_aux| |z2|
                           (SPADCALL (|spadConstant| $ 32) |m| (QREFELT $ 43))
                           $)
                          (QREFELT $ 52))
                (SPADCALL (SPADCALL |m| (|spadConstant| $ 32) (QREFELT $ 44))
                          |z| (QREFELT $ 52))
                (QREFELT $ 44)))))
        ((SPADCALL |m| (|spadConstant| $ 78) (QREFELT $ 70))
         (SPADCALL |z| (QREFELT $ 112)))
        ((SPADCALL |z| (|spadConstant| $ 32) (QREFELT $ 70))
         (SPADCALL |m| (QREFELT $ 118)))
        (#5='T
         (COND
          ((SPADCALL |z| (SPADCALL (|spadConstant| $ 32) (QREFELT $ 80))
                     (QREFELT $ 70))
           (SPADCALL (SPADCALL |m| (QREFELT $ 118)) (QREFELT $ 80)))
          (#5#
           (SEQ (LETT |prec| (+ |obits| 20) . #4#)
                (SPADCALL |prec| (QREFELT $ 68))
                (LETT |eps| (|FELFUN;two_to_minus_n| (QUOTIENT2 |prec| 2) $)
                      . #4#)
                (LETT |ll| (SPADCALL |m| |eps| (QREFELT $ 51)) . #4#)
                (LETT |llr| (REVERSE |ll|) . #4#) (LETT |lz| NIL . #4#)
                (LETT |sf| (|spadConstant| $ 20) . #4#)
                (LETT |nz| (SPADCALL |z| (QREFELT $ 113)) . #4#)
                (LETT |res0| (|spadConstant| $ 78) . #4#)
                (COND
                 ((SPADCALL (|spadConstant| $ 20) |nz| (QREFELT $ 17))
                  (SEQ (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 52)) . #4#)
                       (LETT |z2|
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 32)
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| $ 32) |z2|
                                                   (QREFELT $ 44))
                                         (QREFELT $ 40))
                                        (QREFELT $ 44))
                              (SPADCALL (|spadConstant| $ 32)
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| $ 32)
                                                   (SPADCALL |m| |z2|
                                                             (QREFELT $ 52))
                                                   (QREFELT $ 44))
                                         (QREFELT $ 40))
                                        (QREFELT $ 42))
                              (QREFELT $ 43))
                             . #4#)
                       (LETT |res0| (SPADCALL |z2| |z| (QREFELT $ 52)) . #4#)
                       (LETT |nz| (SPADCALL |z2| (QREFELT $ 113)) . #4#)
                       (LETT |sf| (SPADCALL 2 (QREFELT $ 89)) . #4#)
                       (LETT |z0| |z| . #4#)
                       (LETT |z| (SPADCALL |z2| (QREFELT $ 40)) . #4#)
                       (LETT |cnz|
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 32) |z2|
                                        (QREFELT $ 44))
                              (QREFELT $ 40))
                             . #4#)
                       (LETT |dnz|
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 32)
                                        (SPADCALL |m| |z2| (QREFELT $ 52))
                                        (QREFELT $ 44))
                              (QREFELT $ 40))
                             . #4#)
                       (LETT |snf|
                             (SPADCALL (SPADCALL |cnz| |dnz| (QREFELT $ 52))
                                       (SPADCALL (|spadConstant| $ 32)
                                                 (SPADCALL
                                                  (SPADCALL |m| |z2|
                                                            (QREFELT $ 52))
                                                  |z2| (QREFELT $ 52))
                                                 (QREFELT $ 44))
                                       (QREFELT $ 43))
                             . #4#)
                       (LETT |zz| (SPADCALL |z| |snf| (QREFELT $ 52)) . #4#)
                       (EXIT
                        (COND
                         ((SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |z0| (QREFELT $ 114)) |zz|
                                      (QREFELT $ 52))
                            (QREFELT $ 11))
                           (|spadConstant| $ 65) (QREFELT $ 17))
                          (LETT |z| (SPADCALL |z| (QREFELT $ 80)) . #4#)))))))
                (SEQ (LETT |k| NIL . #4#) (LETT #3# |llr| . #4#) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#) . #4#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |delta|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 32) |k|
                                        (QREFELT $ 42))
                              2 (QREFELT $ 115))
                             (SPADCALL (SPADCALL 4 |k| (QREFELT $ 41))
                                       (SPADCALL |z| 2 (QREFELT $ 45))
                                       (QREFELT $ 52))
                             (QREFELT $ 44))
                            . #4#)
                      (LETT |z|
                            (SPADCALL (SPADCALL 2 |z| (QREFELT $ 41))
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| $ 32) |k|
                                                 (QREFELT $ 42))
                                       (SPADCALL |delta| (QREFELT $ 40))
                                       (QREFELT $ 42))
                                      (QREFELT $ 43))
                            . #4#)
                      (EXIT (LETT |lz| (CONS |z| |lz|) . #4#)))
                     (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
                (LETT |f_val|
                      (LETT |e_val| (SPADCALL |z| (QREFELT $ 112)) . #4#)
                      . #4#)
                (SEQ (LETT |z| NIL . #4#) (LETT #2# |lz| . #4#)
                     (LETT |k| NIL . #4#) (LETT #1# |ll| . #4#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #4#) NIL)
                           (ATOM #2#) (PROGN (LETT |z| (CAR #2#) . #4#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |k1|
                            (SPADCALL (|spadConstant| $ 32) |k| (QREFELT $ 42))
                            . #4#)
                      (LETT |f_val| (SPADCALL |k1| |f_val| (QREFELT $ 52))
                            . #4#)
                      (LETT |k1inv|
                            (SPADCALL (|spadConstant| $ 32) |k1|
                                      (QREFELT $ 43))
                            . #4#)
                      (LETT |p|
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 32) |k|
                                       (QREFELT $ 44))
                             |k1inv| (QREFELT $ 52))
                            . #4#)
                      (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 52)) . #4#)
                      (LETT |k_z2| (SPADCALL |k| |z2| (QREFELT $ 52)) . #4#)
                      (LETT |r|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 32) |z2|
                                        (QREFELT $ 44))
                              (SPADCALL (|spadConstant| $ 32)
                                        (SPADCALL |k| |k_z2| (QREFELT $ 52))
                                        (QREFELT $ 44))
                              (QREFELT $ 52))
                             (QREFELT $ 40))
                            . #4#)
                      (LETT |r|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 32) |p|
                                         (QREFELT $ 44))
                               |z| (QREFELT $ 52))
                              |r| (QREFELT $ 52))
                             (SPADCALL (|spadConstant| $ 32) |k_z2|
                                       (QREFELT $ 42))
                             (QREFELT $ 43))
                            . #4#)
                      (EXIT
                       (LETT |e_val|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (SPADCALL 2 |k1inv| (QREFELT $ 41))
                                         |e_val| (QREFELT $ 52))
                               (SPADCALL |p| |f_val| (QREFELT $ 52))
                               (QREFELT $ 44))
                              |r| (QREFELT $ 42))
                             . #4#)))
                     (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #4#))
                           . #4#)
                     (GO G190) G191 (EXIT NIL))
                (EXIT
                 (SPADCALL (SPADCALL |sf| |e_val| (QREFELT $ 72))
                           (SPADCALL |m| |res0| (QREFELT $ 52))
                           (QREFELT $ 44))))))))))))) 

(DEFUN |FELFUN;ellipticE;3C;42| (|z| |m| $)
  (PROG (|obits|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |m| (|spadConstant| $ 32) (QREFELT $ 70)) |z|)
            ('T
             (SEQ
              (LETT |obits| (SPADCALL (QREFELT $ 67)) |FELFUN;ellipticE;3C;42|)
              (EXIT
               (|finally| (|FELFUN;ellipticE_aux| |z| |m| $)
                          (SPADCALL |obits| (QREFELT $ 68))))))))))) 

(DEFUN |FELFUN;mkr| (|rr| |g23| |r1| $)
  (PROG (|pr|)
    (RETURN
     (SEQ (LETT |pr| (SPADCALL |r1| |rr| (QREFELT $ 52)) |FELFUN;mkr|)
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |pr| 2 (QREFELT $ 45)) |g23| (QREFELT $ 42))
            |pr| (QREFELT $ 43))))))) 

(DEFUN |FELFUN;cardano| (|g2| |g3| $)
  (PROG (|g23| |r1| |rr| |sd1| |sd| |dd1| |dd|)
    (RETURN
     (SEQ
      (LETT |dd|
            (SPADCALL
             (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 45)) (QREFELT $ 41))
             (SPADCALL |g2| 3 (QREFELT $ 45)) (QREFELT $ 44))
            . #1=(|FELFUN;cardano|))
      (LETT |dd1|
            (SPADCALL |dd|
                      (SPADCALL (SPADCALL 3 0 10 (QREFELT $ 15))
                                (QREFELT $ 90))
                      (QREFELT $ 43))
            . #1#)
      (LETT |sd| (SPADCALL |dd1| (QREFELT $ 40)) . #1#)
      (LETT |sd1|
            (SPADCALL
             (SPADCALL |sd| (SPADCALL 3 |g3| (QREFELT $ 41)) (QREFELT $ 42))
             (SPADCALL (SPADCALL 24 0 10 (QREFELT $ 15)) (QREFELT $ 90))
             (QREFELT $ 43))
            . #1#)
      (LETT |rr| (SPADCALL |sd1| (SPADCALL 1 3 (QREFELT $ 29)) (QREFELT $ 121))
            . #1#)
      (LETT |r1| (SPADCALL (SPADCALL 3 0 10 (QREFELT $ 15)) (QREFELT $ 18))
            . #1#)
      (LETT |g23|
            (SPADCALL |g2|
                      (SPADCALL (SPADCALL 12 0 10 (QREFELT $ 15))
                                (QREFELT $ 90))
                      (QREFELT $ 43))
            . #1#)
      (EXIT
       (LIST (|FELFUN;mkr| |rr| |g23| (|spadConstant| $ 32) $)
             (|FELFUN;mkr| |rr| |g23|
              (SPADCALL
               (SPADCALL (SPADCALL (|spadConstant| $ 20) (QREFELT $ 76)) |r1|
                         (QREFELT $ 79))
               (SPADCALL (SPADCALL 2 0 10 (QREFELT $ 15)) (QREFELT $ 90))
               (QREFELT $ 43))
              $)
             (|FELFUN;mkr| |rr| |g23|
              (SPADCALL
               (SPADCALL (SPADCALL (|spadConstant| $ 20) (QREFELT $ 76))
                         (SPADCALL |r1| (QREFELT $ 76)) (QREFELT $ 79))
               (SPADCALL (SPADCALL 2 0 10 (QREFELT $ 15)) (QREFELT $ 90))
               (QREFELT $ 43))
              $))))))) 

(DEFUN |FELFUN;weierstrassHalfPeriods;2CL;45| (|g2| |g3| $)
  (PROG (|omega2| |omega1| |zq| |m| |e13| |rl|)
    (RETURN
     (SEQ
      (LETT |rl| (|FELFUN;cardano| |g2| |g3| $)
            . #1=(|FELFUN;weierstrassHalfPeriods;2CL;45|))
      (LETT |e13|
            (SPADCALL (SPADCALL |rl| 1 (QREFELT $ 81))
                      (SPADCALL |rl| 3 (QREFELT $ 81)) (QREFELT $ 44))
            . #1#)
      (LETT |m|
            (SPADCALL
             (SPADCALL (SPADCALL |rl| 2 (QREFELT $ 81))
                       (SPADCALL |rl| 3 (QREFELT $ 81)) (QREFELT $ 44))
             |e13| (QREFELT $ 43))
            . #1#)
      (LETT |zq| (SPADCALL |e13| (QREFELT $ 40)) . #1#)
      (LETT |omega1|
            (SPADCALL (SPADCALL 2 (SPADCALL |m| (QREFELT $ 73)) (QREFELT $ 41))
                      |zq| (QREFELT $ 43))
            . #1#)
      (LETT |omega2|
            (SPADCALL
             (SPADCALL
              (SPADCALL 2
                        (SPADCALL (|spadConstant| $ 65)
                                  (SPADCALL 1 0 10 (QREFELT $ 15))
                                  (QREFELT $ 79))
                        (QREFELT $ 41))
              (SPADCALL (SPADCALL (|spadConstant| $ 32) |m| (QREFELT $ 44))
                        (QREFELT $ 73))
              (QREFELT $ 52))
             |zq| (QREFELT $ 43))
            . #1#)
      (EXIT (LIST |omega1| |omega2|)))))) 

(DEFUN |FELFUN;weierstrassP;4C;46| (|g2| |g3| |x| $)
  (PROG (|pp| |x1| |zq| |m| |e13| |rl|)
    (RETURN
     (SEQ
      (LETT |rl| (|FELFUN;cardano| |g2| |g3| $)
            . #1=(|FELFUN;weierstrassP;4C;46|))
      (LETT |e13|
            (SPADCALL (SPADCALL |rl| 1 (QREFELT $ 81))
                      (SPADCALL |rl| 3 (QREFELT $ 81)) (QREFELT $ 44))
            . #1#)
      (LETT |m|
            (SPADCALL
             (SPADCALL (SPADCALL |rl| 2 (QREFELT $ 81))
                       (SPADCALL |rl| 3 (QREFELT $ 81)) (QREFELT $ 44))
             |e13| (QREFELT $ 43))
            . #1#)
      (LETT |zq| (SPADCALL |e13| (QREFELT $ 40)) . #1#)
      (LETT |x1| (SPADCALL |zq| |x| (QREFELT $ 52)) . #1#)
      (LETT |pp| (SPADCALL |x1| |m| (QREFELT $ 92)) . #1#)
      (EXIT
       (SPADCALL (SPADCALL |rl| 3 (QREFELT $ 81))
                 (SPADCALL |e13| (SPADCALL |pp| 2 (QREFELT $ 45))
                           (QREFELT $ 43))
                 (QREFELT $ 42))))))) 

(DEFUN |FELFUN;weierstrassPPrime;4C;47| (|g2| |g3| |x| $)
  (PROG (|d1| |c1| |s1| |pl| |x1| |zq| |m| |e13| |rl|)
    (RETURN
     (SEQ
      (LETT |rl| (|FELFUN;cardano| |g2| |g3| $)
            . #1=(|FELFUN;weierstrassPPrime;4C;47|))
      (LETT |e13|
            (SPADCALL (SPADCALL |rl| 1 (QREFELT $ 81))
                      (SPADCALL |rl| 3 (QREFELT $ 81)) (QREFELT $ 44))
            . #1#)
      (LETT |m|
            (SPADCALL
             (SPADCALL (SPADCALL |rl| 2 (QREFELT $ 81))
                       (SPADCALL |rl| 3 (QREFELT $ 81)) (QREFELT $ 44))
             |e13| (QREFELT $ 43))
            . #1#)
      (LETT |zq| (SPADCALL |e13| (QREFELT $ 40)) . #1#)
      (LETT |x1| (SPADCALL |zq| |x| (QREFELT $ 52)) . #1#)
      (LETT |pl| (|FELFUN;sn_cn_dn| |x1| |m| $) . #1#)
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |pl| 1 (QREFELT $ 81)) (|spadConstant| $ 78)
                   (QREFELT $ 70))
         (|spadConstant| $ 78))
        ('T
         (SEQ (LETT |s1| (SPADCALL |pl| 2 (QREFELT $ 81)) . #1#)
              (LETT |c1| (SPADCALL |pl| 3 (QREFELT $ 81)) . #1#)
              (LETT |d1| (SPADCALL |pl| 4 (QREFELT $ 81)) . #1#)
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL 2 |zq| (QREFELT $ 41)) |e13|
                             (QREFELT $ 52))
                   |c1| (QREFELT $ 52))
                  |d1| (QREFELT $ 52))
                 (SPADCALL |s1| 3 (QREFELT $ 45)) (QREFELT $ 43))
                (QREFELT $ 80))))))))))) 

(DEFUN |FELFUN;weierstrassP;4F;48| (|g2| |g3| |x| $)
  (SPADCALL
   (SPADCALL (SPADCALL |g2| (QREFELT $ 90)) (SPADCALL |g3| (QREFELT $ 90))
             (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 123))
   (QREFELT $ 11))) 

(DEFUN |FELFUN;weierstrassPPrime;4F;49| (|g2| |g3| |x| $)
  (SPADCALL
   (SPADCALL (SPADCALL |g2| (QREFELT $ 90)) (SPADCALL |g3| (QREFELT $ 90))
             (SPADCALL |x| (QREFELT $ 90)) (QREFELT $ 124))
   (QREFELT $ 11))) 

(DECLAIM (NOTINLINE |FloatEllipticFunctions;|)) 

(DEFUN |FloatEllipticFunctions| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G408)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|FloatEllipticFunctions|)
                . #2=(|FloatEllipticFunctions|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|FloatEllipticFunctions|
                         (LIST
                          (CONS NIL (CONS 1 (|FloatEllipticFunctions;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|FloatEllipticFunctions|))))))))))) 

(DEFUN |FloatEllipticFunctions;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|FloatEllipticFunctions|) . #1=(|FloatEllipticFunctions|))
      (LETT $ (GETREFV 127) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|FloatEllipticFunctions| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|FloatEllipticFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Float|) (0 . |abs|) |FELFUN;rabs;2F;1|
              (|Complex| 6) (5 . |abs|) (10 . |real|) |FELFUN;rabs;CF;2|
              (|Integer|) (|PositiveInteger|) (15 . |float|) (|Boolean|)
              (22 . <) (28 . |sqrt|) (33 . *) (39 . |One|) (43 . +) (49 . /)
              (55 . -) (61 . ^) (|List| 6) |FELFUN;landen1;F2L;3|
              (|Fraction| 13) (67 . |One|) (71 . /) (77 . *)
              |FELFUN;landen2;FLFL;4| (83 . |One|) |FELFUN;landen;2FL;5|
              (87 . *) (|Mapping| 6 6 6) (93 . |reduce|) |FELFUN;kprod;LF;6|
              (99 . |sin|) |FELFUN;sn2;FLF;7| (104 . |sqrt|) (109 . *)
              (115 . +) (121 . /) (127 . -) (133 . ^) (|List| 9)
              |FELFUN;landen1;C2L;8| (139 . /) (145 . *)
              |FELFUN;landen2;CLFL;9| |FELFUN;landen;CFL;10| (151 . *)
              (|Mapping| 9 9 9) (157 . |reduce|) |FELFUN;kprod;LC;11|
              (163 . |sin|) |FELFUN;sn2;CLC;12| (168 . |pi|) (172 . |round|)
              (177 . |retract|) (182 . *) (188 . |base|) (192 . ~=)
              (198 . |float|) (204 . |Zero|) (208 . >=) (214 . |bits|)
              (218 . |bits|) |FELFUN;ellipticK;2F;15| (223 . =) (229 . |pi|)
              (233 . *) |FELFUN;ellipticK;2C;16| (239 . >) (245 . ^) (251 . -)
              (256 . |sign|) (261 . |Zero|) (265 . |complex|) (271 . -)
              (276 . |elt|) (282 . |cos|) (287 . |cosh|) (292 . |sinh|)
              (297 . |tanh|) (302 . |imag|) (307 . *) (313 . *)
              (319 . |coerce|) (324 . |coerce|) (329 . |positiveRemainder|)
              |FELFUN;jacobiSn;3C;24| |FELFUN;jacobiCn;3C;25|
              |FELFUN;jacobiDn;3C;26| (335 . =) (341 . |tanh|)
              |FELFUN;jacobiSn;3F;27| (346 . |cosh|) |FELFUN;jacobiCn;3F;28|
              |FELFUN;jacobiDn;3F;29| (351 . *) (357 . |coerce|)
              (362 . |imaginary|) (366 . |exp|) (371 . |coerce|)
              |FELFUN;modularInvariantJ;2C;33|
              |FELFUN;weierstrassInvariants;2CL;34| (376 . |atanh|)
              |FELFUN;ellipticF;3F;35| (381 . |asin|) (386 . |atanh|)
              (391 . |asin|) (396 . |norm|) (401 . |conjugate|) (406 . ^)
              |FELFUN;ellipticF;3C;37| |FELFUN;ellipticE;2F;38|
              |FELFUN;ellipticE;2C;39| |FELFUN;ellipticE;3F;40|
              |FELFUN;ellipticE;3C;42| (412 . ^)
              |FELFUN;weierstrassHalfPeriods;2CL;45|
              |FELFUN;weierstrassP;4C;46| |FELFUN;weierstrassPPrime;4C;47|
              |FELFUN;weierstrassP;4F;48| |FELFUN;weierstrassPPrime;4F;49|)
           '#(|weierstrassPPrime| 418 |weierstrassP| 432
              |weierstrassInvariants| 446 |weierstrassHalfPeriods| 452 |sn2|
              458 |rabs| 470 |modularInvariantJ| 480 |landen2| 485 |landen1|
              499 |landen| 511 |kprod| 523 |jacobiSn| 533 |jacobiDn| 545
              |jacobiCn| 557 |ellipticK| 569 |ellipticF| 579 |ellipticE| 591)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 126
                                                 '(1 6 0 0 7 1 9 0 0 10 1 9 6 0
                                                   11 3 6 0 13 13 14 15 2 6 16
                                                   0 0 17 1 6 0 0 18 2 6 0 14 0
                                                   19 0 6 0 20 2 6 0 0 0 21 2 6
                                                   0 0 0 22 2 6 0 0 0 23 2 6 0
                                                   0 14 24 0 27 0 28 2 27 0 13
                                                   13 29 2 6 0 27 0 30 0 9 0 32
                                                   2 6 0 0 0 34 2 25 6 35 0 36
                                                   1 6 0 0 38 1 9 0 0 40 2 9 0
                                                   14 0 41 2 9 0 0 0 42 2 9 0 0
                                                   0 43 2 9 0 0 0 44 2 9 0 0 14
                                                   45 2 6 0 0 13 48 2 9 0 27 0
                                                   49 2 9 0 0 0 52 2 46 9 53 0
                                                   54 1 9 0 0 56 0 6 0 58 1 6 0
                                                   0 59 1 6 13 0 60 2 6 0 13 0
                                                   61 0 6 14 62 2 13 16 0 0 63
                                                   2 6 0 13 13 64 0 6 0 65 2 6
                                                   16 0 0 66 0 6 14 67 1 6 14
                                                   14 68 2 9 16 0 0 70 0 9 0 71
                                                   2 9 0 6 0 72 2 6 16 0 0 74 2
                                                   6 0 0 13 75 1 6 0 0 76 1 6
                                                   13 0 77 0 9 0 78 2 9 0 6 6
                                                   79 1 9 0 0 80 2 46 9 0 13 81
                                                   1 9 0 0 82 1 9 0 0 83 1 9 0
                                                   0 84 1 9 0 0 85 1 9 6 0 86 2
                                                   9 0 0 6 87 2 9 0 13 0 88 1 6
                                                   0 13 89 1 9 0 6 90 2 13 0 0
                                                   0 91 2 6 16 0 0 95 1 6 0 0
                                                   96 1 6 0 0 98 2 27 0 0 13
                                                   101 1 6 0 27 102 0 9 0 103 1
                                                   9 0 0 104 1 9 0 13 105 1 6 0
                                                   0 108 1 6 0 0 110 1 9 0 0
                                                   111 1 9 0 0 112 1 9 6 0 113
                                                   1 9 0 0 114 2 9 0 0 13 115 2
                                                   9 0 0 27 121 3 0 9 9 9 9 124
                                                   3 0 6 6 6 6 126 3 0 9 9 9 9
                                                   123 3 0 6 6 6 6 125 2 0 46 9
                                                   9 107 2 0 46 9 9 122 2 0 9 9
                                                   46 57 2 0 6 6 25 39 1 0 6 6
                                                   8 1 0 6 9 12 1 0 9 9 106 3 0
                                                   25 6 25 6 31 3 0 46 9 46 6
                                                   50 2 0 25 6 25 26 2 0 46 9
                                                   46 47 2 0 25 6 6 33 2 0 46 9
                                                   6 51 1 0 6 25 37 1 0 9 46 55
                                                   2 0 9 9 9 92 2 0 6 6 6 97 2
                                                   0 9 9 9 94 2 0 6 6 6 100 2 0
                                                   9 9 9 93 2 0 6 6 6 99 1 0 6
                                                   6 69 1 0 9 9 73 2 0 6 6 6
                                                   109 2 0 9 9 9 116 1 0 6 6
                                                   117 2 0 6 6 6 119 1 0 9 9
                                                   118 2 0 9 9 9 120)))))
           '|lookupComplete|)) 

(MAKEPROP '|FloatEllipticFunctions| 'NILADIC T) 
