
(/VERSIONCHECK 2) 

(DEFUN |FELFUN;rabs;2F;1| (|r| $) (SPADCALL |r| (QREFELT $ 7))) 

(DEFUN |FELFUN;rabs;CF;2| (|r| $)
  (SPADCALL (SPADCALL |r| (QREFELT $ 10)) (QREFELT $ 11))) 

(DEFUN |FELFUN;landen1;FL;3| (|m1| $)
  (PROG (|res| |kn1| |kp|)
    (RETURN
     (SEQ (LETT |res| NIL . #1=(|FELFUN;landen1;FL;3|))
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL (SPADCALL |m1| (QREFELT $ 8))
                            (SPADCALL 25 -2 10 (QREFELT $ 15)) (QREFELT $ 17)))
                 (GO G191)))
               (SEQ (LETT |kp| (SPADCALL |m1| (QREFELT $ 18)) . #1#)
                    (LETT |kn1|
                          (SPADCALL (SPADCALL 2 |kp| (QREFELT $ 19))
                                    (SPADCALL (|spadConstant| $ 20) |kp|
                                              (QREFELT $ 21))
                                    (QREFELT $ 22))
                          . #1#)
                    (LETT |res|
                          (CONS
                           (SPADCALL (|spadConstant| $ 20) |kn1|
                                     (QREFELT $ 23))
                           |res|)
                          . #1#)
                    (EXIT
                     (LETT |m1|
                           (SPADCALL (SPADCALL 2 |kn1| (QREFELT $ 19))
                                     (SPADCALL |kn1| 2 (QREFELT $ 24))
                                     (QREFELT $ 23))
                           . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |m1| |res|)))))) 

(DEFUN |FELFUN;landen2;FLFL;4| (|m| |res| |eps| $)
  (PROG (|kn| |kp| #1=#:G164 |am|)
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
            (SEQ (LETT |res| (SPADCALL |m1| (QREFELT $ 26)) . #1#)
                 (LETT |m|
                       (SPADCALL (|spadConstant| $ 20) (|SPADfirst| |res|)
                                 (QREFELT $ 23))
                       . #1#)
                 (EXIT (LETT |res| (CDR |res|) . #1#)))))
          (EXIT (SPADCALL |m| |res| |eps| (QREFELT $ 31))))))) 

(DEFUN |FELFUN;kprod;LF;6| (|ll| $)
  (PROG (#1=#:G176 |k| #2=#:G175)
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
  (PROG (|res| #1=#:G180 |k|)
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

(DEFUN |FELFUN;landen1;CL;8| (|m1| $)
  (PROG (|res| |kn1| |kp|)
    (RETURN
     (SEQ (LETT |res| NIL . #1=(|FELFUN;landen1;CL;8|))
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL (SPADCALL |m1| (QREFELT $ 12))
                            (SPADCALL 25 -2 10 (QREFELT $ 15)) (QREFELT $ 17)))
                 (GO G191)))
               (SEQ (LETT |kp| (SPADCALL |m1| (QREFELT $ 40)) . #1#)
                    (LETT |kn1|
                          (SPADCALL (SPADCALL 2 |kp| (QREFELT $ 41))
                                    (SPADCALL (|spadConstant| $ 32) |kp|
                                              (QREFELT $ 42))
                                    (QREFELT $ 43))
                          . #1#)
                    (LETT |res|
                          (CONS
                           (SPADCALL (|spadConstant| $ 32) |kn1|
                                     (QREFELT $ 44))
                           |res|)
                          . #1#)
                    (EXIT
                     (LETT |m1|
                           (SPADCALL (SPADCALL 2 |kn1| (QREFELT $ 41))
                                     (SPADCALL |kn1| 2 (QREFELT $ 45))
                                     (QREFELT $ 44))
                           . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |m1| |res|)))))) 

(DEFUN |FELFUN;landen2;CLFL;9| (|m| |res| |eps| $)
  (PROG (|kn| |kp| #1=#:G188 |am|)
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
            (SEQ (LETT |res| (SPADCALL |m1| (QREFELT $ 47)) . #1#)
                 (LETT |m|
                       (SPADCALL (|spadConstant| $ 32) (|SPADfirst| |res|)
                                 (QREFELT $ 44))
                       . #1#)
                 (EXIT (LETT |res| (CDR |res|) . #1#)))))
          (EXIT (SPADCALL |m| |res| |eps| (QREFELT $ 50))))))) 

(DEFUN |FELFUN;kprod;LC;11| (|ll| $)
  (PROG (#1=#:G200 |k| #2=#:G199)
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
  (PROG (|res| #1=#:G204 |k|)
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
  (PROG (|res| |kres| |res0| #1=#:G221 |k|)
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
          (COND
           ((SPADCALL |m1| (SPADCALL 25 -2 10 (QREFELT $ 15)) (QREFELT $ 17))
            (SEQ (LETT |ll| (SPADCALL |m1| (QREFELT $ 26)) . #1#)
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
  (PROG (|ni| |d1| |c1| |s1| |#G71| |#G70| |#G69| |#G68| |#G67| |#G66| |nr|
         |#G65| |#G64| |#G63| |iu| |ms1| |den| |ms2| |s2| |ctwo| |zz1| |z1|
         |iz1| |itau| |tau| |ppi| |kk2| |ll2| |m1| |iz| |kk| |ll| |eps| |res|
         |pl| |k| |cc| |prec| |obits|)
    (RETURN
     (SEQ (LETT |obits| (SPADCALL (QREFELT $ 67)) . #1=(|FELFUN;sn_cn_dn|))
          (LETT |prec| (+ |obits| 20) . #1#)
          (EXIT
           (COND
            ((SPADCALL |m| (|spadConstant| $ 32) (QREFELT $ 70))
             (SEQ (LETT |cc| (SPADCALL |z| (QREFELT $ 82)) . #1#)
                  (LETT |res|
                        (COND
                         ((SPADCALL |cc| (|spadConstant| $ 78) (QREFELT $ 70))
                          (SEQ
                           (LETT |cc|
                                 (SPADCALL (|spadConstant| $ 32)
                                           (SPADCALL |z| (QREFELT $ 83))
                                           (QREFELT $ 43))
                                 . #1#)
                           (EXIT
                            (LIST (|spadConstant| $ 78) (|spadConstant| $ 32)
                                  |cc| |cc|))))
                         (#2='T
                          (SEQ
                           (LETT |cc|
                                 (SPADCALL (|spadConstant| $ 32) |cc|
                                           (QREFELT $ 43))
                                 . #1#)
                           (EXIT
                            (LIST (|spadConstant| $ 32)
                                  (SPADCALL |z| (QREFELT $ 84)) |cc| |cc|)))))
                        . #1#)
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
                    . #1#)
              (LETT |k| (SPADCALL |m| (QREFELT $ 40)) . #1#)
              (LETT |z| (SPADCALL |z| |k| (QREFELT $ 43)) . #1#)
              (LETT |pl| (|FELFUN;sn_cn_dn| |z| |m| $) . #1#)
              (LETT |res|
                    (COND
                     ((SPADCALL (SPADCALL |pl| 1 (QREFELT $ 81))
                                (|spadConstant| $ 32) (QREFELT $ 70))
                      (LIST (|spadConstant| $ 32)
                            (SPADCALL |k| (SPADCALL |pl| 2 (QREFELT $ 81))
                                      (QREFELT $ 52))
                            (SPADCALL |pl| 4 (QREFELT $ 81))
                            (SPADCALL |pl| 3 (QREFELT $ 81))))
                     (#2#
                      (LIST (|spadConstant| $ 78) (|spadConstant| $ 32)
                            (SPADCALL (SPADCALL |pl| 4 (QREFELT $ 81)) |k|
                                      (QREFELT $ 43))
                            (SPADCALL (SPADCALL |pl| 3 (QREFELT $ 81)) |k|
                                      (QREFELT $ 43)))))
                    . #1#)
              (EXIT |res|)))
            ((SPADCALL (SPADCALL |m| (QREFELT $ 11))
                       (SPADCALL 5 -1 10 (QREFELT $ 15)) (QREFELT $ 74))
             (|FELFUN;jacobi_imaginary| |z| |m| $))
            (#2#
             (SEQ
              (LETT |eps| (SPADCALL 1 (- (QUOTIENT2 |prec| 2)) (QREFELT $ 64))
                    . #1#)
              (LETT |ll| (SPADCALL |m| |eps| (QREFELT $ 51)) . #1#)
              (LETT |kk| (SPADCALL |ll| (QREFELT $ 55)) . #1#)
              (LETT |z1| (SPADCALL |z| |kk| (QREFELT $ 43)) . #1#)
              (LETT |iz| (SPADCALL |z1| (QREFELT $ 85)) . #1#)
              (LETT |m1| (SPADCALL (|spadConstant| $ 32) |m| (QREFELT $ 44))
                    . #1#)
              (LETT |ll2| (SPADCALL |m1| |eps| (QREFELT $ 51)) . #1#)
              (LETT |iu|
                    (SPADCALL (|spadConstant| $ 65)
                              (SPADCALL 1 0 10 (QREFELT $ 15)) (QREFELT $ 79))
                    . #1#)
              (LETT |kk2| (SPADCALL |ll2| (QREFELT $ 55)) . #1#)
              (LETT |ppi| (SPADCALL (SPADCALL (QREFELT $ 58)) 2 (QREFELT $ 48))
                    . #1#)
              (LETT |z1|
                    (SPADCALL |z| (SPADCALL |kk| |ppi| (QREFELT $ 86))
                              (QREFELT $ 43))
                    . #1#)
              (LETT |tau|
                    (SPADCALL (SPADCALL |iu| |kk2| (QREFELT $ 52)) |kk|
                              (QREFELT $ 43))
                    . #1#)
              (LETT |itau| (SPADCALL |tau| (QREFELT $ 85)) . #1#)
              (LETT |iz1| (SPADCALL |z1| (QREFELT $ 85)) . #1#)
              (LETT |ni|
                    (SPADCALL
                     (SPADCALL (SPADCALL |iz1| |itau| (QREFELT $ 22))
                               (QREFELT $ 59))
                     (QREFELT $ 60))
                    . #1#)
              (LETT |z1|
                    (SPADCALL |z1| (SPADCALL |ni| |tau| (QREFELT $ 87))
                              (QREFELT $ 44))
                    . #1#)
              (LETT |nr|
                    (SPADCALL
                     (SPADCALL (SPADCALL |z1| (QREFELT $ 11)) (QREFELT $ 59))
                     (QREFELT $ 60))
                    . #1#)
              (LETT |z1|
                    (SPADCALL |z1|
                              (SPADCALL (SPADCALL |nr| (QREFELT $ 88))
                                        (QREFELT $ 89))
                              (QREFELT $ 44))
                    . #1#)
              (LETT |zz1| (SPADCALL |ppi| |z1| (QREFELT $ 72)) . #1#)
              (LETT |s1| (SPADCALL |zz1| |ll| (QREFELT $ 57)) . #1#)
              (LETT |ctwo|
                    (SPADCALL (SPADCALL 2 0 10 (QREFELT $ 15)) (QREFELT $ 89))
                    . #1#)
              (LETT |s2|
                    (SPADCALL (SPADCALL |zz1| |ctwo| (QREFELT $ 43)) |ll|
                              (QREFELT $ 57))
                    . #1#)
              (LETT |s2| (SPADCALL |s2| |s2| (QREFELT $ 52)) . #1#)
              (LETT |ms2| (SPADCALL |m| |s2| (QREFELT $ 52)) . #1#)
              (LETT |den|
                    (SPADCALL (|spadConstant| $ 32)
                              (SPADCALL |ms2| |s2| (QREFELT $ 52))
                              (QREFELT $ 44))
                    . #1#)
              (LETT |c1|
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 32)
                               (SPADCALL |s2|
                                         (SPADCALL |ctwo| |ms2| (QREFELT $ 44))
                                         (QREFELT $ 52))
                               (QREFELT $ 44))
                     |den| (QREFELT $ 43))
                    . #1#)
              (LETT |d1|
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 32)
                               (SPADCALL |ms2|
                                         (SPADCALL |ctwo| |s2| (QREFELT $ 44))
                                         (QREFELT $ 52))
                               (QREFELT $ 44))
                     |den| (QREFELT $ 43))
                    . #1#)
              (LETT |ni| (SPADCALL |ni| 4 (QREFELT $ 90)) . #1#)
              (LETT |nr| (SPADCALL |nr| 4 (QREFELT $ 90)) . #1#)
              (LETT |ms1| (SPADCALL |m1| (QREFELT $ 40)) . #1#)
              (LETT |iu|
                    (SPADCALL (|spadConstant| $ 65)
                              (SPADCALL 1 0 10 (QREFELT $ 15)) (QREFELT $ 79))
                    . #1#)
              (COND
               ((>= |nr| 2)
                (SEQ
                 (PROGN
                  (LETT |#G63| (SPADCALL |s1| (QREFELT $ 80)) . #1#)
                  (LETT |#G64| (SPADCALL |c1| (QREFELT $ 80)) . #1#)
                  (LETT |#G65| |d1| . #1#)
                  (LETT |s1| |#G63| . #1#)
                  (LETT |c1| |#G64| . #1#)
                  (LETT |d1| |#G65| . #1#))
                 (EXIT (LETT |nr| (- |nr| 2) . #1#)))))
              (COND
               ((EQL |nr| 1)
                (PROGN
                 (LETT |#G66| (SPADCALL |c1| |d1| (QREFELT $ 43)) . #1#)
                 (LETT |#G67|
                       (SPADCALL
                        (SPADCALL (SPADCALL |ms1| |s1| (QREFELT $ 52)) |d1|
                                  (QREFELT $ 43))
                        (QREFELT $ 80))
                       . #1#)
                 (LETT |#G68| (SPADCALL |ms1| |d1| (QREFELT $ 43)) . #1#)
                 (LETT |s1| |#G66| . #1#)
                 (LETT |c1| |#G67| . #1#)
                 (LETT |d1| |#G68| . #1#))))
              (COND
               ((>= |ni| 2)
                (SEQ
                 (PROGN
                  (LETT |#G69| |s1| . #1#)
                  (LETT |#G70| (SPADCALL |c1| (QREFELT $ 80)) . #1#)
                  (LETT |#G71| (SPADCALL |d1| (QREFELT $ 80)) . #1#)
                  (LETT |s1| |#G69| . #1#)
                  (LETT |c1| |#G70| . #1#)
                  (LETT |d1| |#G71| . #1#))
                 (EXIT (LETT |ni| (- |ni| 2) . #1#)))))
              (EXIT
               (COND ((EQL |ni| 0) (LIST (|spadConstant| $ 32) |s1| |c1| |d1|))
                     ((SPADCALL |s1| (|spadConstant| $ 78) (QREFELT $ 70))
                      (LIST (|spadConstant| $ 78) (|spadConstant| $ 32)
                            (SPADCALL (SPADCALL |iu| |d1| (QREFELT $ 52))
                                      (QREFELT $ 80))
                            (SPADCALL (SPADCALL |iu| |ms1| (QREFELT $ 52))
                                      (QREFELT $ 80))))
                     (#2#
                      (LIST (|spadConstant| $ 32)
                            (SPADCALL (|spadConstant| $ 32)
                                      (SPADCALL |ms1| |s1| (QREFELT $ 52))
                                      (QREFELT $ 43))
                            (SPADCALL
                             (SPADCALL (SPADCALL |iu| |d1| (QREFELT $ 52))
                                       (SPADCALL |ms1| |s1| (QREFELT $ 52))
                                       (QREFELT $ 43))
                             (QREFELT $ 80))
                            (SPADCALL
                             (SPADCALL (SPADCALL |iu| |c1| (QREFELT $ 52)) |s1|
                                       (QREFELT $ 43))
                             (QREFELT $ 80)))))))))))))) 

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
        ((SPADCALL |m| (SPADCALL 1 0 10 (QREFELT $ 15)) (QREFELT $ 94))
         (SEQ (SPADCALL |prec| (QREFELT $ 68))
              (LETT |res| (SPADCALL |z| (QREFELT $ 95)) . #1#)
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
        ((SPADCALL |m| (SPADCALL 1 0 10 (QREFELT $ 15)) (QREFELT $ 94))
         (SEQ (SPADCALL |prec| (QREFELT $ 68))
              (LETT |res|
                    (SPADCALL (|spadConstant| $ 20)
                              (SPADCALL |z| (QREFELT $ 97)) (QREFELT $ 22))
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
        ((SPADCALL |m| (SPADCALL 1 0 10 (QREFELT $ 15)) (QREFELT $ 94))
         (SEQ (SPADCALL |prec| (QREFELT $ 68))
              (LETT |res|
                    (SPADCALL (|spadConstant| $ 20)
                              (SPADCALL |z| (QREFELT $ 97)) (QREFELT $ 22))
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

(DEFUN |FELFUN;ellipticF;3F;30| (|z| |m| $)
  (PROG (|res| |delta| #1=#:G293 |k| |ll| |eps| |prec| |z2| |m2| |obits|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |m| (|spadConstant| $ 20) (QREFELT $ 94))
        (SPADCALL |z| (QREFELT $ 100)))
       (#2='T
        (SEQ
         (LETT |obits| (SPADCALL (QREFELT $ 67))
               . #3=(|FELFUN;ellipticF;3F;30|))
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
                                      (QREFELT $ 101))
                            |m2| (QREFELT $ 22))
                           . #3#)
                     (SPADCALL |obits| (QREFELT $ 68)) (EXIT |res|)))))))
           ((SPADCALL |m| (|spadConstant| $ 65) (QREFELT $ 94))
            (SPADCALL |z| (QREFELT $ 102)))
           (#2#
            (COND
             ((SPADCALL (SPADCALL |z| (QREFELT $ 7)) (|spadConstant| $ 20)
                        (QREFELT $ 74))
              (|error| "ellipticF: abs(z) > 1"))
             ((SPADCALL |z| (|spadConstant| $ 20) (QREFELT $ 94))
              (SPADCALL |m| (QREFELT $ 69)))
             (#2#
              (COND
               ((SPADCALL |z| (SPADCALL (|spadConstant| $ 20) (QREFELT $ 76))
                          (QREFELT $ 94))
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
                           (SPADCALL |res| (SPADCALL |z| (QREFELT $ 102))
                                     (QREFELT $ 34))
                           . #3#)
                     (SPADCALL |obits| (QREFELT $ 68))
                     (EXIT |res|)))))))))))))))) 

(DEFUN |FELFUN;ellipticE;2F;31| (|m| $)
  (PROG (|e_val| |p| |k1inv| |f_val| |k1| #1=#:G298 |k| |llr| |ll| |eps| |prec|
         |obits|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |m| (|spadConstant| $ 20) (QREFELT $ 66))
        (|error| "ellipticE: m >=1"))
       ((SPADCALL |m| (|spadConstant| $ 65) (QREFELT $ 94))
        (SPADCALL (SPADCALL (QREFELT $ 58)) 2 (QREFELT $ 48)))
       ('T
        (SEQ
         (LETT |obits| (SPADCALL (QREFELT $ 67))
               . #2=(|FELFUN;ellipticE;2F;31|))
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

(DEFUN |FELFUN;ellipticE;3F;32| (|z| |m| $)
  (PROG (|e_val| |r| |k_z2| |z2| |p| |k1inv| |f_val| |k1| #1=#:G312 |k|
         #2=#:G313 |lz| |delta| #3=#:G311 |llr| |ll| |eps| |prec| |res| |m2|
         |obits|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |m| (|spadConstant| $ 20) (QREFELT $ 94))
        (SPADCALL |z| (QREFELT $ 100)))
       (#4='T
        (SEQ
         (LETT |obits| (SPADCALL (QREFELT $ 67))
               . #5=(|FELFUN;ellipticE;3F;32|))
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
                         (EXIT (|error| "ellipticE: abs(z) > 1/sqrt(m)"))))
                   (#4#
                    (SEQ
                     (LETT |res|
                           (SPADCALL
                            (SPADCALL |m2|
                                      (SPADCALL |z2|
                                                (SPADCALL (|spadConstant| $ 20)
                                                          |m| (QREFELT $ 22))
                                                (QREFELT $ 104))
                                      (QREFELT $ 34))
                            (SPADCALL
                             (SPADCALL |m| (|spadConstant| $ 20)
                                       (QREFELT $ 23))
                             |z| (QREFELT $ 34))
                            (QREFELT $ 23))
                           . #5#)
                     (SPADCALL |obits| (QREFELT $ 68)) (EXIT |res|)))))))
           ((SPADCALL |m| (|spadConstant| $ 65) (QREFELT $ 94))
            (SPADCALL |z| (QREFELT $ 102)))
           (#4#
            (COND
             ((SPADCALL (SPADCALL |z| (QREFELT $ 7)) (|spadConstant| $ 20)
                        (QREFELT $ 74))
              (|error| "ellipticE: abs(z) > 1"))
             ((SPADCALL |z| (|spadConstant| $ 20) (QREFELT $ 94))
              (SPADCALL |m| (QREFELT $ 103)))
             (#4#
              (COND
               ((SPADCALL |z| (SPADCALL (|spadConstant| $ 20) (QREFELT $ 76))
                          (QREFELT $ 94))
                (SPADCALL (SPADCALL |m| (QREFELT $ 103)) (QREFELT $ 76)))
               (#4#
                (SEQ (LETT |prec| (+ |obits| 20) . #5#)
                     (SPADCALL |prec| (QREFELT $ 68))
                     (LETT |eps|
                           (|FELFUN;two_to_minus_n| (QUOTIENT2 |prec| 2) $)
                           . #5#)
                     (LETT |ll| (SPADCALL |m| |eps| (QREFELT $ 33)) . #5#)
                     (LETT |llr| (REVERSE |ll|) . #5#) (LETT |lz| NIL . #5#)
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
                                  (SPADCALL (SPADCALL 4 |k| (QREFELT $ 19))
                                            (SPADCALL |z| 2 (QREFELT $ 24))
                                            (QREFELT $ 34))
                                  (QREFELT $ 23))
                                 . #5#)
                           (LETT |z|
                                 (SPADCALL (SPADCALL 2 |z| (QREFELT $ 19))
                                           (SPADCALL
                                            (SPADCALL (|spadConstant| $ 20) |k|
                                                      (QREFELT $ 21))
                                            (SPADCALL |delta| (QREFELT $ 18))
                                            (QREFELT $ 21))
                                           (QREFELT $ 22))
                                 . #5#)
                           (EXIT (LETT |lz| (CONS |z| |lz|) . #5#)))
                          (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
                     (LETT |f_val|
                           (LETT |e_val| (SPADCALL |z| (QREFELT $ 102)) . #5#)
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
                           (LETT |f_val| (SPADCALL |k1| |f_val| (QREFELT $ 34))
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
                           (LETT |z2| (SPADCALL |z| |z| (QREFELT $ 34)) . #5#)
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
                                (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #5#))
                                . #5#)
                          (GO G190) G191 (EXIT NIL))
                     (SPADCALL |obits| (QREFELT $ 68))
                     (EXIT |e_val|)))))))))))))))) 

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
                                (QREFELT $ 89))
                      (QREFELT $ 43))
            . #1#)
      (LETT |sd| (SPADCALL |dd1| (QREFELT $ 40)) . #1#)
      (LETT |sd1|
            (SPADCALL
             (SPADCALL |sd| (SPADCALL 3 |g3| (QREFELT $ 41)) (QREFELT $ 42))
             (SPADCALL (SPADCALL 24 0 10 (QREFELT $ 15)) (QREFELT $ 89))
             (QREFELT $ 43))
            . #1#)
      (LETT |rr| (SPADCALL |sd1| (SPADCALL 1 3 (QREFELT $ 29)) (QREFELT $ 105))
            . #1#)
      (LETT |r1| (SPADCALL (SPADCALL 3 0 10 (QREFELT $ 15)) (QREFELT $ 18))
            . #1#)
      (LETT |g23|
            (SPADCALL |g2|
                      (SPADCALL (SPADCALL 12 0 10 (QREFELT $ 15))
                                (QREFELT $ 89))
                      (QREFELT $ 43))
            . #1#)
      (EXIT
       (LIST (|FELFUN;mkr| |rr| |g23| (|spadConstant| $ 32) $)
             (|FELFUN;mkr| |rr| |g23|
              (SPADCALL
               (SPADCALL (SPADCALL (|spadConstant| $ 20) (QREFELT $ 76)) |r1|
                         (QREFELT $ 79))
               (SPADCALL (SPADCALL 2 0 10 (QREFELT $ 15)) (QREFELT $ 89))
               (QREFELT $ 43))
              $)
             (|FELFUN;mkr| |rr| |g23|
              (SPADCALL
               (SPADCALL (SPADCALL (|spadConstant| $ 20) (QREFELT $ 76))
                         (SPADCALL |r1| (QREFELT $ 76)) (QREFELT $ 79))
               (SPADCALL (SPADCALL 2 0 10 (QREFELT $ 15)) (QREFELT $ 89))
               (QREFELT $ 43))
              $))))))) 

(DEFUN |FELFUN;weierstrassHalfPeriods;2CL;35| (|g2| |g3| $)
  (PROG (|omega2| |omega1| |zq| |m| |e13| |rl|)
    (RETURN
     (SEQ
      (LETT |rl| (|FELFUN;cardano| |g2| |g3| $)
            . #1=(|FELFUN;weierstrassHalfPeriods;2CL;35|))
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

(DEFUN |FELFUN;weierstrassP;4C;36| (|g2| |g3| |x| $)
  (PROG (|pp| |x1| |zq| |m| |e13| |rl|)
    (RETURN
     (SEQ
      (LETT |rl| (|FELFUN;cardano| |g2| |g3| $)
            . #1=(|FELFUN;weierstrassP;4C;36|))
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
      (LETT |pp| (SPADCALL |x1| |m| (QREFELT $ 91)) . #1#)
      (EXIT
       (SPADCALL (SPADCALL |rl| 3 (QREFELT $ 81))
                 (SPADCALL |e13| (SPADCALL |pp| 2 (QREFELT $ 45))
                           (QREFELT $ 43))
                 (QREFELT $ 42))))))) 

(DEFUN |FELFUN;weierstrassPPrime;4C;37| (|g2| |g3| |x| $)
  (PROG (|d1| |c1| |s1| |pl| |x1| |zq| |m| |e13| |rl|)
    (RETURN
     (SEQ
      (LETT |rl| (|FELFUN;cardano| |g2| |g3| $)
            . #1=(|FELFUN;weierstrassPPrime;4C;37|))
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

(DEFUN |FELFUN;weierstrassP;4F;38| (|g2| |g3| |x| $)
  (SPADCALL
   (SPADCALL (SPADCALL |g2| (QREFELT $ 89)) (SPADCALL |g3| (QREFELT $ 89))
             (SPADCALL |x| (QREFELT $ 89)) (QREFELT $ 107))
   (QREFELT $ 11))) 

(DEFUN |FELFUN;weierstrassPPrime;4F;39| (|g2| |g3| |x| $)
  (SPADCALL
   (SPADCALL (SPADCALL |g2| (QREFELT $ 89)) (SPADCALL |g3| (QREFELT $ 89))
             (SPADCALL |x| (QREFELT $ 89)) (QREFELT $ 108))
   (QREFELT $ 11))) 

(DEFUN |FloatEllipticFunctions| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G328)
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
      (LETT $ (GETREFV 111) . #1#)
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
              (55 . -) (61 . ^) (|List| 6) |FELFUN;landen1;FL;3|
              (|Fraction| 13) (67 . |One|) (71 . /) (77 . *)
              |FELFUN;landen2;FLFL;4| (83 . |One|) |FELFUN;landen;2FL;5|
              (87 . *) (|Mapping| 6 6 6) (93 . |reduce|) |FELFUN;kprod;LF;6|
              (99 . |sin|) |FELFUN;sn2;FLF;7| (104 . |sqrt|) (109 . *)
              (115 . +) (121 . /) (127 . -) (133 . ^) (|List| 9)
              |FELFUN;landen1;CL;8| (139 . /) (145 . *) |FELFUN;landen2;CLFL;9|
              |FELFUN;landen;CFL;10| (151 . *) (|Mapping| 9 9 9)
              (157 . |reduce|) |FELFUN;kprod;LC;11| (163 . |sin|)
              |FELFUN;sn2;CLC;12| (168 . |pi|) (172 . |round|)
              (177 . |retract|) (182 . *) (188 . |base|) (192 . ~=)
              (198 . |float|) (204 . |Zero|) (208 . >=) (214 . |bits|)
              (218 . |bits|) |FELFUN;ellipticK;2F;15| (223 . =) (229 . |pi|)
              (233 . *) |FELFUN;ellipticK;2C;16| (239 . >) (245 . ^) (251 . -)
              (256 . |sign|) (261 . |Zero|) (265 . |complex|) (271 . -)
              (276 . |elt|) (282 . |cosh|) (287 . |sinh|) (292 . |tanh|)
              (297 . |imag|) (302 . *) (308 . *) (314 . |coerce|)
              (319 . |coerce|) (324 . |positiveRemainder|)
              |FELFUN;jacobiSn;3C;24| |FELFUN;jacobiCn;3C;25|
              |FELFUN;jacobiDn;3C;26| (330 . =) (336 . |tanh|)
              |FELFUN;jacobiSn;3F;27| (341 . |cosh|) |FELFUN;jacobiCn;3F;28|
              |FELFUN;jacobiDn;3F;29| (346 . |atanh|) |FELFUN;ellipticF;3F;30|
              (351 . |asin|) |FELFUN;ellipticE;2F;31| |FELFUN;ellipticE;3F;32|
              (356 . ^) |FELFUN;weierstrassHalfPeriods;2CL;35|
              |FELFUN;weierstrassP;4C;36| |FELFUN;weierstrassPPrime;4C;37|
              |FELFUN;weierstrassP;4F;38| |FELFUN;weierstrassPPrime;4F;39|)
           '#(|weierstrassPPrime| 362 |weierstrassP| 376
              |weierstrassHalfPeriods| 390 |sn2| 396 |rabs| 408 |landen2| 418
              |landen1| 432 |landen| 442 |kprod| 454 |jacobiSn| 464 |jacobiDn|
              476 |jacobiCn| 488 |ellipticK| 500 |ellipticF| 510 |ellipticE|
              516)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 110
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
                                                   0 84 1 9 6 0 85 2 9 0 0 6 86
                                                   2 9 0 13 0 87 1 6 0 13 88 1
                                                   9 0 6 89 2 13 0 0 0 90 2 6
                                                   16 0 0 94 1 6 0 0 95 1 6 0 0
                                                   97 1 6 0 0 100 1 6 0 0 102 2
                                                   9 0 0 27 105 3 0 9 9 9 9 108
                                                   3 0 6 6 6 6 110 3 0 6 6 6 6
                                                   109 3 0 9 9 9 9 107 2 0 46 9
                                                   9 106 2 0 9 9 46 57 2 0 6 6
                                                   25 39 1 0 6 6 8 1 0 6 9 12 3
                                                   0 25 6 25 6 31 3 0 46 9 46 6
                                                   50 1 0 25 6 26 1 0 46 9 47 2
                                                   0 46 9 6 51 2 0 25 6 6 33 1
                                                   0 9 46 55 1 0 6 25 37 2 0 6
                                                   6 6 96 2 0 9 9 9 91 2 0 6 6
                                                   6 99 2 0 9 9 9 93 2 0 6 6 6
                                                   98 2 0 9 9 9 92 1 0 6 6 69 1
                                                   0 9 9 73 2 0 6 6 6 101 1 0 6
                                                   6 103 2 0 6 6 6 104)))))
           '|lookupComplete|)) 

(MAKEPROP '|FloatEllipticFunctions| 'NILADIC T) 
