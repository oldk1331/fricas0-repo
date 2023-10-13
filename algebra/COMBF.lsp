
(/VERSIONCHECK 2) 

(DEFUN |COMBF;factorial;2F;1| (|x| $)
  (SPADCALL (QREFELT $ 13) |x| (QREFELT $ 21))) 

(DEFUN |COMBF;binomial;3F;2| (|x| |y| $)
  (SPADCALL (QREFELT $ 15) (LIST |x| |y|) (QREFELT $ 24))) 

(DEFUN |COMBF;permutation;3F;3| (|x| |y| $)
  (SPADCALL (QREFELT $ 14) (LIST |x| |y|) (QREFELT $ 24))) 

(DEFUN |COMBF;number?| (|x| $)
  (COND
   ((|HasCategory| (QREFELT $ 6) (LIST '|RetractableTo| '(|Integer|)))
    (COND ((SPADCALL |x| (QREFELT $ 28)) 'T)
          (#1='T (QEQCAR (SPADCALL |x| (QREFELT $ 30)) 0))))
   (#1# (SPADCALL |x| (QREFELT $ 28))))) 

(DEFUN |COMBF;^;3F;5| (|x| |y| $)
  (PROG (|expr| |exp| |args|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |x| '|%power| (QREFELT $ 31))
        (SEQ
         (LETT |args|
               (SPADCALL (|SPADfirst| (SPADCALL |x| (QREFELT $ 33)))
                         (QREFELT $ 36))
               . #1=(|COMBF;^;3F;5|))
         (COND
          ((NULL (EQL (LENGTH |args|) 2))
           (EXIT (|error| "Too many arguments to ^"))))
         (COND
          ((|COMBF;number?| (|SPADfirst| |args|) $)
           (COND
            ((|COMBF;number?| |y| $)
             (EXIT
              (SPADCALL (QREFELT $ 20)
                        (LIST
                         (SPADCALL (|SPADfirst| |args|) |y| (QREFELT $ 37))
                         (SPADCALL |args| (QREFELT $ 38)))
                        (QREFELT $ 24)))))))
         (EXIT
          (SPADCALL (QREFELT $ 20)
                    (LIST (|SPADfirst| |args|)
                          (SPADCALL (SPADCALL |args| (QREFELT $ 38)) |y|
                                    (QREFELT $ 39)))
                    (QREFELT $ 24)))))
       (#2='T
        (SEQ (LETT |exp| (SPADCALL |x| (QREFELT $ 42)) . #1#)
             (EXIT
              (COND
               ((QEQCAR |exp| 0)
                (SEQ (LETT |expr| (QCDR |exp|) . #1#)
                     (EXIT
                      (SPADCALL (QREFELT $ 20)
                                (LIST (QCAR |expr|)
                                      (SPADCALL (QCDR |expr|) |y|
                                                (QREFELT $ 44)))
                                (QREFELT $ 24)))))
               (#2#
                (SPADCALL (QREFELT $ 20) (LIST |x| |y|)
                          (QREFELT $ 24)))))))))))) 

(DEFUN |COMBF;belong?;BoB;6| (|op| $)
  (SPADCALL |op| (QREFELT $ 8) (QREFELT $ 45))) 

(DEFUN |COMBF;fourth| (|l| $) (SPADCALL (CDR |l|) (QREFELT $ 47))) 

(DEFUN |COMBF;dvpow1| (|l| $)
  (SPADCALL (SPADCALL |l| (QREFELT $ 38))
            (SPADCALL (|SPADfirst| |l|)
                      (SPADCALL (SPADCALL |l| (QREFELT $ 38))
                                (|spadConstant| $ 48) (QREFELT $ 49))
                      (QREFELT $ 37))
            (QREFELT $ 39))) 

(DEFUN |COMBF;factorials;2F;9| (|x| $)
  (|COMBF;facts| |x| (SPADCALL |x| (QREFELT $ 51)) $)) 

(DEFUN |COMBF;factorials;FSF;10| (|x| |v| $) (|COMBF;facts| |x| (LIST |v|) $)) 

(DEFUN |COMBF;facts| (|x| |l| $)
  (SPADCALL (|COMBF;smpfact| (SPADCALL |x| (QREFELT $ 55)) |l| $)
            (|COMBF;smpfact| (SPADCALL |x| (QREFELT $ 56)) |l| $)
            (QREFELT $ 57))) 

(DEFUN |COMBF;summand| (|l| $)
  (SPADCALL (|SPADfirst| |l|)
            (SPADCALL (SPADCALL |l| (QREFELT $ 38)) (QREFELT $ 59))
            (SPADCALL |l| (QREFELT $ 47)) (QREFELT $ 60))) 

(DEFUN |COMBF;product;FSF;13| (|x| |i| $)
  (PROG (|k| |dm|)
    (RETURN
     (SEQ
      (LETT |dm| (SPADCALL (SPADCALL (QREFELT $ 61)) (QREFELT $ 62))
            . #1=(|COMBF;product;FSF;13|))
      (EXIT
       (SPADCALL (QREFELT $ 18)
                 (LIST
                  (SPADCALL |x| (LETT |k| (SPADCALL |i| (QREFELT $ 63)) . #1#)
                            |dm| (QREFELT $ 60))
                  |dm| (SPADCALL |k| (QREFELT $ 64)))
                 (QREFELT $ 24))))))) 

(DEFUN |COMBF;summation;FSF;14| (|x| |i| $)
  (PROG (|k| |dm|)
    (RETURN
     (SEQ
      (LETT |dm| (SPADCALL (SPADCALL (QREFELT $ 61)) (QREFELT $ 62))
            . #1=(|COMBF;summation;FSF;14|))
      (EXIT
       (SPADCALL (QREFELT $ 16)
                 (LIST
                  (SPADCALL |x| (LETT |k| (SPADCALL |i| (QREFELT $ 63)) . #1#)
                            |dm| (QREFELT $ 60))
                  |dm| (SPADCALL |k| (QREFELT $ 64)))
                 (QREFELT $ 24))))))) 

(DEFUN |COMBF;dvsum| (|l| |x| $)
  (SPADCALL (QREFELT $ 16)
            (LIST (SPADCALL (|SPADfirst| |l|) |x| (QREFELT $ 67))
                  (SPADCALL |l| (QREFELT $ 38)) (SPADCALL |l| (QREFELT $ 47)))
            (QREFELT $ 24))) 

(DEFUN |COMBF;dvdsum| (|l| |x| $)
  (PROG (|g| |h| |y|)
    (RETURN
     (COND
      ((EQUAL |x|
              (SPADCALL
               (LETT |y| (SPADCALL |l| (QREFELT $ 47)) . #1=(|COMBF;dvdsum|))
               (QREFELT $ 68)))
       (|spadConstant| $ 69))
      ((OR
        (SPADCALL |x|
                  (SPADCALL
                   (LETT |h| (SPADCALL (CDR (CDR |l|)) (QREFELT $ 47)) . #1#)
                   (QREFELT $ 51))
                  (QREFELT $ 70))
        (SPADCALL |x|
                  (SPADCALL
                   (LETT |g| (SPADCALL (CDR |l|) (QREFELT $ 47)) . #1#)
                   (QREFELT $ 51))
                  (QREFELT $ 70)))
       (|error| "a sum cannot be differentiated with respect to a bound"))
      ('T
       (SPADCALL (QREFELT $ 17)
                 (LIST (SPADCALL (|SPADfirst| |l|) |x| (QREFELT $ 67))
                       (SPADCALL |l| (QREFELT $ 38)) |y| |g| |h|)
                 (QREFELT $ 24))))))) 

(DEFUN |COMBF;dvprod| (|l| |x| $)
  (PROG (|p| |f| |dm|)
    (RETURN
     (SEQ
      (LETT |dm|
            (SPADCALL (SPADCALL (SPADCALL (QREFELT $ 61)) (QREFELT $ 62))
                      (QREFELT $ 68))
            . #1=(|COMBF;dvprod|))
      (LETT |f|
            (SPADCALL (|SPADfirst| |l|)
                      (SPADCALL (SPADCALL |l| (QREFELT $ 38)) (QREFELT $ 59))
                      (SPADCALL |dm| (QREFELT $ 62)) (QREFELT $ 60))
            . #1#)
      (LETT |p| (SPADCALL |f| |dm| (QREFELT $ 65)) . #1#)
      (EXIT
       (SPADCALL (QREFELT $ 16)
                 (LIST
                  (SPADCALL
                   (SPADCALL (SPADCALL (|SPADfirst| |l|) |x| (QREFELT $ 67))
                             (|SPADfirst| |l|) (QREFELT $ 57))
                   |p| (QREFELT $ 39))
                  (SPADCALL |l| (QREFELT $ 38)) (SPADCALL |l| (QREFELT $ 47)))
                 (QREFELT $ 24))))))) 

(DEFUN |COMBF;dvdprod| (|l| |x| $)
  (PROG (|g| |h| |y|)
    (RETURN
     (COND
      ((EQUAL |x|
              (SPADCALL
               (LETT |y| (SPADCALL |l| (QREFELT $ 47)) . #1=(|COMBF;dvdprod|))
               (QREFELT $ 68)))
       (|spadConstant| $ 69))
      ((OR
        (SPADCALL |x|
                  (SPADCALL
                   (LETT |h| (SPADCALL (CDR (CDR |l|)) (QREFELT $ 47)) . #1#)
                   (QREFELT $ 51))
                  (QREFELT $ 70))
        (SPADCALL |x|
                  (SPADCALL
                   (LETT |g| (SPADCALL (CDR |l|) (QREFELT $ 47)) . #1#)
                   (QREFELT $ 51))
                  (QREFELT $ 70)))
       (|error| "a product cannot be differentiated with respect to a bound"))
      ('T
       (SPADCALL
        (SPADCALL (QREFELT $ 17)
                  (CONS
                   (SPADCALL (SPADCALL (|SPADfirst| |l|) |x| (QREFELT $ 67))
                             (|SPADfirst| |l|) (QREFELT $ 57))
                   (CDR |l|))
                  (QREFELT $ 24))
        (SPADCALL (QREFELT $ 19) |l| (QREFELT $ 24)) (QREFELT $ 39))))))) 

(DEFUN |COMBF;dprod| (|l| $)
  (SPADCALL (SPADCALL (|COMBF;summand| |l| $) (QREFELT $ 72))
            (SPADCALL (SPADCALL |l| (QREFELT $ 47)) (QREFELT $ 72))
            (QREFELT $ 73))) 

(DEFUN |COMBF;ddprod| (|l| $)
  (SPADCALL (SPADCALL (|COMBF;summand| |l| $) (QREFELT $ 72))
            (SPADCALL (SPADCALL (SPADCALL |l| (QREFELT $ 47)) (QREFELT $ 72))
                      (SPADCALL (|COMBF;fourth| |l| $) (QREFELT $ 72))
                      (QREFELT $ 74))
            (SPADCALL (|COMBF;fourth| (CDR |l|) $) (QREFELT $ 72))
            (QREFELT $ 75))) 

(DEFUN |COMBF;dsum| (|l| $)
  (SPADCALL (SPADCALL (|COMBF;summand| |l| $) (QREFELT $ 72))
            (SPADCALL (SPADCALL |l| (QREFELT $ 47)) (QREFELT $ 72))
            (QREFELT $ 76))) 

(DEFUN |COMBF;ddsum| (|l| $)
  (SPADCALL (SPADCALL (|COMBF;summand| |l| $) (QREFELT $ 72))
            (SPADCALL (SPADCALL (SPADCALL |l| (QREFELT $ 47)) (QREFELT $ 72))
                      (SPADCALL (|COMBF;fourth| |l| $) (QREFELT $ 72))
                      (QREFELT $ 74))
            (SPADCALL (|COMBF;fourth| (CDR |l|) $) (QREFELT $ 72))
            (QREFELT $ 77))) 

(DEFUN |COMBF;equalsumprod| (|s1| |s2| $)
  (PROG (|l2| |l1|)
    (RETURN
     (SEQ
      (LETT |l1| (SPADCALL |s1| (QREFELT $ 36)) . #1=(|COMBF;equalsumprod|))
      (LETT |l2| (SPADCALL |s2| (QREFELT $ 36)) . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL (|SPADfirst| |l1|)
                  (SPADCALL (SPADCALL |l1| (QREFELT $ 38)) (QREFELT $ 59))
                  (SPADCALL |l2| (QREFELT $ 38)) (QREFELT $ 60))
        (|SPADfirst| |l2|) (QREFELT $ 78))))))) 

(DEFUN |COMBF;equaldsumprod| (|s1| |s2| $)
  (PROG (|l2| |l1|)
    (RETURN
     (SEQ
      (LETT |l1| (SPADCALL |s1| (QREFELT $ 36)) . #1=(|COMBF;equaldsumprod|))
      (LETT |l2| (SPADCALL |s2| (QREFELT $ 36)) . #1#)
      (EXIT
       (COND
        ((SPADCALL (SPADCALL (CDR |l1|) (QREFELT $ 47))
                   (SPADCALL (CDR |l2|) (QREFELT $ 47)) (QREFELT $ 78))
         (COND
          ((SPADCALL (SPADCALL (CDR (CDR |l1|)) (QREFELT $ 47))
                     (SPADCALL (CDR (CDR |l2|)) (QREFELT $ 47)) (QREFELT $ 78))
           (SPADCALL
            (SPADCALL (|SPADfirst| |l1|)
                      (SPADCALL (SPADCALL |l1| (QREFELT $ 38)) (QREFELT $ 59))
                      (SPADCALL |l2| (QREFELT $ 38)) (QREFELT $ 60))
            (|SPADfirst| |l2|) (QREFELT $ 78)))
          (#2='T 'NIL)))
        (#2# 'NIL))))))) 

(DEFUN |COMBF;product;FSbF;25| (|x| |s| $)
  (PROG (|dm| |k|)
    (RETURN
     (SEQ
      (LETT |k| (SPADCALL (SPADCALL |s| (QREFELT $ 80)) (QREFELT $ 63))
            . #1=(|COMBF;product;FSbF;25|))
      (LETT |dm| (SPADCALL (SPADCALL (QREFELT $ 61)) (QREFELT $ 62)) . #1#)
      (EXIT
       (SPADCALL (QREFELT $ 19)
                 (LIST (SPADCALL |x| |k| |dm| (QREFELT $ 60)) |dm|
                       (SPADCALL |k| (QREFELT $ 64))
                       (SPADCALL (SPADCALL |s| (QREFELT $ 82)) (QREFELT $ 83))
                       (SPADCALL (SPADCALL |s| (QREFELT $ 82)) (QREFELT $ 84)))
                 (QREFELT $ 24))))))) 

(DEFUN |COMBF;summation;FSbF;26| (|x| |s| $)
  (PROG (|dm| |k|)
    (RETURN
     (SEQ
      (LETT |k| (SPADCALL (SPADCALL |s| (QREFELT $ 80)) (QREFELT $ 63))
            . #1=(|COMBF;summation;FSbF;26|))
      (LETT |dm| (SPADCALL (SPADCALL (QREFELT $ 61)) (QREFELT $ 62)) . #1#)
      (EXIT
       (SPADCALL (QREFELT $ 17)
                 (LIST (SPADCALL |x| |k| |dm| (QREFELT $ 60)) |dm|
                       (SPADCALL |k| (QREFELT $ 64))
                       (SPADCALL (SPADCALL |s| (QREFELT $ 82)) (QREFELT $ 83))
                       (SPADCALL (SPADCALL |s| (QREFELT $ 82)) (QREFELT $ 84)))
                 (QREFELT $ 24))))))) 

(DEFUN |COMBF;smpfact| (|p| |l| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|COMBF;smpfact!0| (VECTOR $ |l|)) (ELT $ 87) |p|
               (QREFELT $ 92))))) 

(DEFUN |COMBF;smpfact!0| (|x| $$)
  (PROG (|l| $)
    (LETT |l| (QREFELT $$ 1) . #1=(|COMBF;smpfact|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|COMBF;K2fact| |x| |l| $))))) 

(DEFUN |COMBF;K2fact| (|k| |l| $)
  (PROG (|p| |n| |args| #1=#:G234 |a| #2=#:G233 #3=#:G232 |kf| |v| #4=#:G231)
    (RETURN
     (SEQ
      (COND
       ((OR
         (NULL
          (PROGN
           (LETT #4# NIL . #5=(|COMBF;K2fact|))
           (SEQ (LETT |v| NIL . #5#)
                (LETT #3#
                      (SPADCALL (LETT |kf| (SPADCALL |k| (QREFELT $ 64)) . #5#)
                                (QREFELT $ 51))
                      . #5#)
                G190
                (COND
                 ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SPADCALL |v| |l| (QREFELT $ 70))
                    (LETT #4# (CONS |v| #4#) . #5#)))))
                (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                (EXIT (NREVERSE #4#)))))
         (NULL
          (LETT |args|
                (PROGN
                 (LETT #2# NIL . #5#)
                 (SEQ (LETT |a| NIL . #5#)
                      (LETT #1# (SPADCALL |k| (QREFELT $ 36)) . #5#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (|COMBF;facts| |a| |l| $) #2#) . #5#)))
                      (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #5#)))
        |kf|)
       ((SPADCALL |k| (QREFELT $ 14) (QREFELT $ 93))
        (SPADCALL
         (SPADCALL (LETT |n| (|SPADfirst| |args|) . #5#) (QREFELT $ 22))
         (SPADCALL
          (SPADCALL |n| (SPADCALL |args| (QREFELT $ 38)) (QREFELT $ 49))
          (QREFELT $ 22))
         (QREFELT $ 57)))
       ((SPADCALL |k| (QREFELT $ 15) (QREFELT $ 93))
        (SEQ (LETT |n| (|SPADfirst| |args|) . #5#)
             (LETT |p| (SPADCALL |args| (QREFELT $ 38)) . #5#)
             (EXIT
              (SPADCALL (SPADCALL |n| (QREFELT $ 22))
                        (SPADCALL (SPADCALL |p| (QREFELT $ 22))
                                  (SPADCALL (SPADCALL |n| |p| (QREFELT $ 49))
                                            (QREFELT $ 22))
                                  (QREFELT $ 39))
                        (QREFELT $ 57)))))
       ('T (SPADCALL (SPADCALL |k| (QREFELT $ 94)) |args| (QREFELT $ 24)))))))) 

(DEFUN |COMBF;operator;2Bo;29| (|op| $)
  (COND ((SPADCALL |op| '|factorial| (QREFELT $ 95)) (QREFELT $ 13))
        ((SPADCALL |op| '|permutation| (QREFELT $ 95)) (QREFELT $ 14))
        ((SPADCALL |op| '|binomial| (QREFELT $ 95)) (QREFELT $ 15))
        ((SPADCALL |op| '|summation| (QREFELT $ 95)) (QREFELT $ 16))
        ((SPADCALL |op| '|%defsum| (QREFELT $ 95)) (QREFELT $ 17))
        ((SPADCALL |op| '|product| (QREFELT $ 95)) (QREFELT $ 18))
        ((SPADCALL |op| '|%defprod| (QREFELT $ 95)) (QREFELT $ 19))
        ((SPADCALL |op| '|%power| (QREFELT $ 95)) (QREFELT $ 20))
        ('T (|error| "Not a combinatorial operator")))) 

(DEFUN |COMBF;iprod| (|l| $)
  (COND ((SPADCALL (|SPADfirst| |l|) (QREFELT $ 97)) (|spadConstant| $ 69))
        ((SPADCALL (|SPADfirst| |l|) (|spadConstant| $ 48) (QREFELT $ 78))
         (|spadConstant| $ 48))
        ('T (SPADCALL (QREFELT $ 18) |l| (QREFELT $ 98))))) 

(DEFUN |COMBF;isum| (|l| $)
  (COND ((SPADCALL (|SPADfirst| |l|) (QREFELT $ 97)) (|spadConstant| $ 69))
        ('T (SPADCALL (QREFELT $ 16) |l| (QREFELT $ 98))))) 

(DEFUN |COMBF;idprod| (|l| $)
  (COND
   ((SPADCALL (SPADCALL (SPADCALL |l| (QREFELT $ 38)) (QREFELT $ 68))
              (SPADCALL (|SPADfirst| |l|) (QREFELT $ 51)) (QREFELT $ 70))
    (SPADCALL (QREFELT $ 19) |l| (QREFELT $ 98)))
   ('T
    (SPADCALL (|SPADfirst| |l|)
              (SPADCALL
               (SPADCALL (|COMBF;fourth| (CDR |l|) $) (|COMBF;fourth| |l| $)
                         (QREFELT $ 49))
               (|spadConstant| $ 48) (QREFELT $ 99))
              (QREFELT $ 37))))) 

(DEFUN |COMBF;idsum| (|l| $)
  (COND
   ((SPADCALL (SPADCALL (SPADCALL |l| (QREFELT $ 38)) (QREFELT $ 68))
              (SPADCALL (|SPADfirst| |l|) (QREFELT $ 51)) (QREFELT $ 70))
    (SPADCALL (QREFELT $ 17) |l| (QREFELT $ 98)))
   ('T
    (SPADCALL (|SPADfirst| |l|)
              (SPADCALL
               (SPADCALL (|COMBF;fourth| (CDR |l|) $) (|COMBF;fourth| |l| $)
                         (QREFELT $ 49))
               (|spadConstant| $ 48) (QREFELT $ 99))
              (QREFELT $ 39))))) 

(DEFUN |COMBF;ifact| (|x| $)
  (COND
   ((OR (SPADCALL |x| (QREFELT $ 97))
        (SPADCALL |x| (|spadConstant| $ 48) (QREFELT $ 78)))
    (|spadConstant| $ 48))
   ('T (SPADCALL (QREFELT $ 13) |x| (QREFELT $ 101))))) 

(DEFUN |COMBF;ibinom| (|l| $)
  (PROG (#1=#:G258 |p| |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |n| (|SPADfirst| |l|) . #2=(|COMBF;ibinom|))
            (SEQ (LETT |p| (SPADCALL |l| (QREFELT $ 38)) . #2#)
                 (EXIT
                  (COND
                   ((OR (SPADCALL |p| (|spadConstant| $ 69) (QREFELT $ 78))
                        (SPADCALL |p| |n| (QREFELT $ 78)))
                    (PROGN (LETT #1# (|spadConstant| $ 48) . #2#) (GO #1#))))))
            (COND
             ((OR (SPADCALL |p| (|spadConstant| $ 48) (QREFELT $ 78))
                  (SPADCALL |p|
                            (SPADCALL |n| (|spadConstant| $ 48) (QREFELT $ 49))
                            (QREFELT $ 78)))
              (EXIT |n|)))
            (EXIT (SPADCALL (QREFELT $ 15) |l| (QREFELT $ 98)))))
      #1# (EXIT #1#))))) 

(DEFUN |COMBF;iperm| (|l| $)
  (COND
   ((SPADCALL (SPADCALL |l| (QREFELT $ 38)) (QREFELT $ 97))
    (|spadConstant| $ 48))
   ('T (SPADCALL (QREFELT $ 14) |l| (QREFELT $ 98))))) 

(DEFUN |COMBF;iidsum;LF;37| (|l| $)
  (PROG (#1=#:G272 #2=#:G271 #3=#:G273 #4=#:G276 |i| #5=#:G274 |k| |r2| |r1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |r1| (SPADCALL (|COMBF;fourth| |l| $) (QREFELT $ 104))
               . #6=(|COMBF;iidsum;LF;37|))
         (EXIT
          (COND
           ((QEQCAR |r1| 1)
            (PROGN (LETT #5# (|COMBF;idsum| |l| $) . #6#) (GO #5#)))
           (#7='T
            (SEQ
             (LETT |r2| (SPADCALL (|COMBF;fourth| (CDR |l|) $) (QREFELT $ 104))
                   . #6#)
             (EXIT
              (COND
               ((QEQCAR |r2| 1)
                (PROGN (LETT #5# (|COMBF;idsum| |l| $) . #6#) (GO #5#)))
               (#7#
                (SEQ
                 (LETT |k|
                       (SPADCALL (SPADCALL |l| (QREFELT $ 38)) (QREFELT $ 106))
                       . #6#)
                 (EXIT
                  (COND
                   ((QEQCAR |k| 1)
                    (PROGN
                     (LETT #5# (|COMBF;idsum| |l| $) . #6#)
                     (GO #5#))))))))))))))
        (EXIT
         (PROGN
          (LETT #1# NIL . #6#)
          (SEQ (LETT |i| (QCDR |r1|) . #6#) (LETT #4# (QCDR |r2|) . #6#) G190
               (COND ((> |i| #4#) (GO G191)))
               (SEQ
                (EXIT
                 (PROGN
                  (LETT #3#
                        (SPADCALL (|SPADfirst| |l|) (QCDR |k|)
                                  (SPADCALL |i| (QREFELT $ 107))
                                  (QREFELT $ 60))
                        . #6#)
                  (COND
                   (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 99)) . #6#))
                   ('T (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
               (LETT |i| (+ |i| 1) . #6#) (GO G190) G191 (EXIT NIL))
          (COND (#1# #2#) (#7# (|spadConstant| $ 69)))))))
      #5# (EXIT #5#))))) 

(DEFUN |COMBF;iidprod;LF;38| (|l| $)
  (PROG (#1=#:G287 #2=#:G286 #3=#:G288 #4=#:G291 |i| #5=#:G289 |k| |r2| |r1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |r1| (SPADCALL (|COMBF;fourth| |l| $) (QREFELT $ 104))
               . #6=(|COMBF;iidprod;LF;38|))
         (EXIT
          (COND
           ((QEQCAR |r1| 1)
            (PROGN (LETT #5# (|COMBF;idprod| |l| $) . #6#) (GO #5#)))
           (#7='T
            (SEQ
             (LETT |r2| (SPADCALL (|COMBF;fourth| (CDR |l|) $) (QREFELT $ 104))
                   . #6#)
             (EXIT
              (COND
               ((QEQCAR |r2| 1)
                (PROGN (LETT #5# (|COMBF;idprod| |l| $) . #6#) (GO #5#)))
               (#7#
                (SEQ
                 (LETT |k|
                       (SPADCALL (SPADCALL |l| (QREFELT $ 38)) (QREFELT $ 106))
                       . #6#)
                 (EXIT
                  (COND
                   ((QEQCAR |k| 1)
                    (PROGN
                     (LETT #5# (|COMBF;idprod| |l| $) . #6#)
                     (GO #5#))))))))))))))
        (EXIT
         (PROGN
          (LETT #1# NIL . #6#)
          (SEQ (LETT |i| (QCDR |r1|) . #6#) (LETT #4# (QCDR |r2|) . #6#) G190
               (COND ((> |i| #4#) (GO G191)))
               (SEQ
                (EXIT
                 (PROGN
                  (LETT #3#
                        (SPADCALL (|SPADfirst| |l|) (QCDR |k|)
                                  (SPADCALL |i| (QREFELT $ 107))
                                  (QREFELT $ 60))
                        . #6#)
                  (COND
                   (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 39)) . #6#))
                   ('T (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
               (LETT |i| (+ |i| 1) . #6#) (GO G190) G191 (EXIT NIL))
          (COND (#1# #2#) (#7# (|spadConstant| $ 48)))))))
      #5# (EXIT #5#))))) 

(DEFUN |COMBF;iiipow| (|l| $)
  (PROG (|r| |y| |rec| |u| |x|)
    (RETURN
     (SEQ
      (LETT |u|
            (SPADCALL (LETT |x| (|SPADfirst| |l|) . #1=(|COMBF;iiipow|)) '|exp|
                      (QREFELT $ 112))
            . #1#)
      (EXIT
       (COND ((QEQCAR |u| 1) (SPADCALL (QREFELT $ 20) |l| (QREFELT $ 98)))
             (#2='T
              (SEQ (LETT |rec| (QCDR |u|) . #1#)
                   (LETT |y|
                         (|SPADfirst| (SPADCALL (QCAR |rec|) (QREFELT $ 36)))
                         . #1#)
                   (LETT |r| (SPADCALL |y| (QREFELT $ 30)) . #1#)
                   (EXIT
                    (COND
                     ((QEQCAR |r| 1)
                      (SPADCALL (QREFELT $ 20) |l| (QREFELT $ 98)))
                     (#2#
                      (SPADCALL (SPADCALL (QCAR |rec|) (QREFELT $ 94))
                                (SPADCALL
                                 (SPADCALL (QCDR |rec|) |y| (QREFELT $ 44))
                                 (SPADCALL |l| (QREFELT $ 38)) (QREFELT $ 39))
                                (QREFELT $ 21))))))))))))) 

(DEFUN |COMBF;ipow;LF;40| (|l| $)
  (PROG (|r|)
    (RETURN
     (SEQ
      (LETT |r| (SPADCALL (SPADCALL |l| (QREFELT $ 38)) (QREFELT $ 30))
            |COMBF;ipow;LF;40|)
      (EXIT
       (COND ((QEQCAR |r| 1) (|COMBF;iiipow| |l| $))
             ('T (SPADCALL (|SPADfirst| |l|) (QCDR |r|) (QREFELT $ 114))))))))) 

(DEFUN |COMBF;ipow;LF;41| (|l| $)
  (PROG (|r|)
    (RETURN
     (SEQ
      (LETT |r| (SPADCALL (SPADCALL |l| (QREFELT $ 38)) (QREFELT $ 104))
            |COMBF;ipow;LF;41|)
      (EXIT
       (COND ((QEQCAR |r| 1) (|COMBF;iiipow| |l| $))
             ('T (SPADCALL (|SPADfirst| |l|) (QCDR |r|) (QREFELT $ 116))))))))) 

(DEFUN |COMBF;ipow;LF;42| (|l| $)
  (PROG (#1=#:G320 |y| |rec| |u| |n| |x|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (LETT |x| (|SPADfirst| |l|) . #2=(|COMBF;ipow;LF;42|))
                  (QREFELT $ 97))
        (COND
         ((SPADCALL (SPADCALL |l| (QREFELT $ 38)) (QREFELT $ 97))
          (|error| "0 ^ 0"))
         (#3='T (|spadConstant| $ 69))))
       ((OR (SPADCALL |x| (|spadConstant| $ 48) (QREFELT $ 78))
            (SPADCALL (LETT |n| (SPADCALL |l| (QREFELT $ 38)) . #2#)
                      (QREFELT $ 97)))
        (|spadConstant| $ 48))
       ('T
        (COND ((SPADCALL |n| (|spadConstant| $ 48) (QREFELT $ 78)) |x|)
              (#3#
               (SEQ (LETT |u| (SPADCALL |x| '|exp| (QREFELT $ 112)) . #2#)
                    (EXIT
                     (COND
                      ((QEQCAR |u| 1)
                       (SPADCALL (QREFELT $ 20) |l| (QREFELT $ 98)))
                      (#3#
                       (SEQ
                        (EXIT
                         (SEQ (LETT |rec| (QCDR |u|) . #2#)
                              (SEQ
                               (LETT |y|
                                     (|SPADfirst|
                                      (SPADCALL (QCAR |rec|) (QREFELT $ 36)))
                                     . #2#)
                               (EXIT
                                (COND
                                 ((OR
                                   (SPADCALL |y| (|spadConstant| $ 48)
                                             (QREFELT $ 78))
                                   (SPADCALL |y|
                                             (SPADCALL (|spadConstant| $ 48)
                                                       (QREFELT $ 117))
                                             (QREFELT $ 78)))
                                  (PROGN
                                   (LETT #1#
                                         (SPADCALL
                                          (SPADCALL (QCAR |rec|)
                                                    (QREFELT $ 94))
                                          (SPADCALL
                                           (SPADCALL (QCDR |rec|) |y|
                                                     (QREFELT $ 44))
                                           |n| (QREFELT $ 39))
                                          (QREFELT $ 21))
                                         . #2#)
                                   (GO #1#))))))
                              (EXIT
                               (SPADCALL (QREFELT $ 20) |l| (QREFELT $ 98)))))
                        #1# (EXIT #1#)))))))))))))) 

(DEFUN |COMBF;iifact;2F;43| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 119)) |COMBF;iifact;2F;43|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|COMBF;ifact| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 120))
                            (QREFELT $ 87))))))))) 

(DEFUN |COMBF;iiperm;LF;44| (|l| $)
  (PROG (#1=#:G335 |r2| |r1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |r1| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 119))
               . #2=(|COMBF;iiperm;LF;44|))
         (EXIT
          (COND
           ((QEQCAR |r1| 1)
            (PROGN (LETT #1# (|COMBF;iperm| |l| $) . #2#) (GO #1#)))
           ('T
            (SEQ
             (LETT |r2|
                   (SPADCALL (SPADCALL |l| (QREFELT $ 38)) (QREFELT $ 119))
                   . #2#)
             (EXIT
              (COND
               ((QEQCAR |r2| 1)
                (PROGN (LETT #1# (|COMBF;iperm| |l| $) . #2#) (GO #1#))))))))))
        (EXIT
         (SPADCALL (SPADCALL (QCDR |r1|) (QCDR |r2|) (QREFELT $ 122))
                   (QREFELT $ 87)))))
      #1# (EXIT #1#))))) 

(DEFUN |COMBF;iibinom;LF;45| (|l| $)
  (PROG (#1=#:G353 |r2| |r1| |ans| #2=#:G356 |i| |t| |s| #3=#:G355)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |s| (SPADCALL (SPADCALL |l| (QREFELT $ 38)) (QREFELT $ 119))
               . #4=(|COMBF;iibinom;LF;45|))
         (EXIT
          (COND
           ((QEQCAR |s| 0)
            (SEQ (LETT |t| (SPADCALL (QCDR |s|) (QREFELT $ 124)) . #4#)
                 (EXIT
                  (COND
                   ((QEQCAR |t| 0)
                    (COND
                     ((SPADCALL (QCDR |t|) 0 (QREFELT $ 125))
                      (PROGN
                       (LETT #1#
                             (SEQ (LETT |ans| (|spadConstant| $ 48) . #4#)
                                  (SEQ (LETT |i| 0 . #4#)
                                       (LETT #3# (- (QCDR |t|) 1) . #4#) G190
                                       (COND
                                        ((|greater_SI| |i| #3#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT |ans|
                                               (SPADCALL |ans|
                                                         (SPADCALL
                                                          (|SPADfirst| |l|)
                                                          (SPADCALL
                                                           (SPADCALL |i|
                                                                     (QREFELT $
                                                                              126))
                                                           (QREFELT $ 87))
                                                          (QREFELT $ 49))
                                                         (QREFELT $ 39))
                                               . #4#)))
                                       (LETT |i| (|inc_SI| |i|) . #4#)
                                       (GO G190) G191 (EXIT NIL))
                                  (EXIT
                                   (SPADCALL
                                    (SPADCALL 1
                                              (SPADCALL (QCDR |t|)
                                                        (QREFELT $ 127))
                                              (QREFELT $ 128))
                                    |ans| (QREFELT $ 129))))
                             . #4#)
                       (GO #1#))))))))))))
        (SEQ
         (LETT |s|
               (SPADCALL
                (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 38))
                          (QREFELT $ 49))
                (QREFELT $ 119))
               . #4#)
         (EXIT
          (COND
           ((QEQCAR |s| 0)
            (SEQ (LETT |t| (SPADCALL (QCDR |s|) (QREFELT $ 124)) . #4#)
                 (EXIT
                  (COND
                   ((QEQCAR |t| 0)
                    (COND
                     ((SPADCALL (QCDR |t|) 0 (QREFELT $ 125))
                      (PROGN
                       (LETT #1#
                             (SEQ (LETT |ans| (|spadConstant| $ 48) . #4#)
                                  (SEQ (LETT |i| 1 . #4#)
                                       (LETT #2# (QCDR |t|) . #4#) G190
                                       (COND
                                        ((|greater_SI| |i| #2#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT |ans|
                                               (SPADCALL |ans|
                                                         (SPADCALL
                                                          (SPADCALL |l|
                                                                    (QREFELT $
                                                                             38))
                                                          (SPADCALL
                                                           (SPADCALL |i|
                                                                     (QREFELT $
                                                                              126))
                                                           (QREFELT $ 87))
                                                          (QREFELT $ 99))
                                                         (QREFELT $ 39))
                                               . #4#)))
                                       (LETT |i| (|inc_SI| |i|) . #4#)
                                       (GO G190) G191 (EXIT NIL))
                                  (EXIT
                                   (SPADCALL
                                    (SPADCALL 1
                                              (SPADCALL (QCDR |t|)
                                                        (QREFELT $ 127))
                                              (QREFELT $ 128))
                                    |ans| (QREFELT $ 129))))
                             . #4#)
                       (GO #1#))))))))))))
        (SEQ (LETT |r1| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 119)) . #4#)
             (EXIT
              (COND
               ((QEQCAR |r1| 1)
                (PROGN (LETT #1# (|COMBF;ibinom| |l| $) . #4#) (GO #1#)))
               ('T
                (SEQ
                 (LETT |r2|
                       (SPADCALL (SPADCALL |l| (QREFELT $ 38)) (QREFELT $ 119))
                       . #4#)
                 (EXIT
                  (COND
                   ((QEQCAR |r2| 1)
                    (PROGN
                     (LETT #1# (|COMBF;ibinom| |l| $) . #4#)
                     (GO #1#))))))))))
        (EXIT
         (SPADCALL (SPADCALL (QCDR |r1|) (QCDR |r2|) (QREFELT $ 130))
                   (QREFELT $ 87)))))
      #1# (EXIT #1#))))) 

(DEFUN |COMBF;iibinom;LF;46| (|l| $)
  (PROG (#1=#:G362 |r2| |r1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |r1| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 119))
               . #2=(|COMBF;iibinom;LF;46|))
         (EXIT
          (COND
           ((QEQCAR |r1| 1)
            (PROGN (LETT #1# (|COMBF;ibinom| |l| $) . #2#) (GO #1#)))
           ('T
            (SEQ
             (LETT |r2|
                   (SPADCALL (SPADCALL |l| (QREFELT $ 38)) (QREFELT $ 119))
                   . #2#)
             (EXIT
              (COND
               ((QEQCAR |r2| 1)
                (PROGN
                 (LETT #1# (|COMBF;ibinom| |l| $) . #2#)
                 (GO #1#))))))))))
        (EXIT
         (SPADCALL (SPADCALL (QCDR |r1|) (QCDR |r2|) (QREFELT $ 130))
                   (QREFELT $ 87)))))
      #1# (EXIT #1#))))) 

(DEFUN |COMBF;iibinom;LF;47| (|l| $)
  (PROG (#1=#:G369 |r2| |r1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |r1| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 119))
               . #2=(|COMBF;iibinom;LF;47|))
         (EXIT
          (COND
           ((QEQCAR |r1| 1)
            (PROGN (LETT #1# (|COMBF;ibinom| |l| $) . #2#) (GO #1#)))
           ('T
            (SEQ
             (LETT |r2|
                   (SPADCALL (SPADCALL |l| (QREFELT $ 38)) (QREFELT $ 119))
                   . #2#)
             (EXIT
              (COND
               ((QEQCAR |r2| 1)
                (PROGN
                 (LETT #1# (|COMBF;ibinom| |l| $) . #2#)
                 (GO #1#))))))))))
        (EXIT
         (SPADCALL (SPADCALL (QCDR |r1|) (QCDR |r2|) (QREFELT $ 130))
                   (QREFELT $ 87)))))
      #1# (EXIT #1#))))) 

(DEFUN |COMBF;iifact;2F;48| (|x| $) (|COMBF;ifact| |x| $)) 

(DEFUN |COMBF;iibinom;LF;49| (|l| $) (|COMBF;ibinom| |l| $)) 

(DEFUN |COMBF;iiperm;LF;50| (|l| $) (|COMBF;iperm| |l| $)) 

(DEFUN |COMBF;iipow;LF;51| (|l| $)
  (PROG (#1=#:G379 |r2| |r1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |r1| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 119))
               . #2=(|COMBF;iipow;LF;51|))
         (EXIT
          (COND
           ((QEQCAR |r1| 1)
            (PROGN (LETT #1# (SPADCALL |l| (QREFELT $ 115)) . #2#) (GO #1#)))
           ('T
            (SEQ
             (LETT |r2|
                   (SPADCALL (SPADCALL |l| (QREFELT $ 38)) (QREFELT $ 119))
                   . #2#)
             (EXIT
              (COND
               ((QEQCAR |r2| 1)
                (PROGN
                 (LETT #1# (SPADCALL |l| (QREFELT $ 115)) . #2#)
                 (GO #1#))))))))))
        (EXIT
         (SPADCALL (SPADCALL (QCDR |r1|) (QCDR |r2|) (QREFELT $ 132))
                   (QREFELT $ 87)))))
      #1# (EXIT #1#))))) 

(DEFUN |COMBF;iipow;LF;52| (|l| $) (SPADCALL |l| (QREFELT $ 115))) 

(DEFUN |COMBF;dvpow2| (|l| $)
  (COND ((SPADCALL (|SPADfirst| |l|) (QREFELT $ 97)) (|spadConstant| $ 69))
        ('T
         (SPADCALL (SPADCALL (|SPADfirst| |l|) (QREFELT $ 134))
                   (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 38))
                             (QREFELT $ 37))
                   (QREFELT $ 39))))) 

(DEFUN |CombinatorialFunction| (&REST #1=#:G435)
  (PROG ()
    (RETURN
     (PROG (#2=#:G436)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|CombinatorialFunction|)
                                           '|domainEqualList|)
                . #3=(|CombinatorialFunction|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |CombinatorialFunction;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|CombinatorialFunction|))))))))))) 

(DEFUN |CombinatorialFunction;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|CombinatorialFunction|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|CombinatorialFunction| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 144) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|CombinatorialFunction| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 '|comb|)
      (QSETREFV $ 13 (SPADCALL '|factorial| (QREFELT $ 12)))
      (QSETREFV $ 14 (SPADCALL '|permutation| (QREFELT $ 12)))
      (QSETREFV $ 15 (SPADCALL '|binomial| (QREFELT $ 12)))
      (QSETREFV $ 16 (SPADCALL '|summation| (QREFELT $ 12)))
      (QSETREFV $ 17 (SPADCALL '|%defsum| (QREFELT $ 12)))
      (QSETREFV $ 18 (SPADCALL '|product| (QREFELT $ 12)))
      (QSETREFV $ 19 (SPADCALL '|%defprod| (QREFELT $ 12)))
      (QSETREFV $ 20 (SPADCALL '|%power| (QREFELT $ 12)))
      (COND
       ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
        (PROGN
         (QSETREFV $ 108 (CONS (|dispatchFunction| |COMBF;iidsum;LF;37|) $))
         (QSETREFV $ 109 (CONS (|dispatchFunction| |COMBF;iidprod;LF;38|) $))
         (COND
          ((|HasCategory| |#2| '(|RadicalCategory|))
           (QSETREFV $ 115 (CONS (|dispatchFunction| |COMBF;ipow;LF;40|) $)))
          ('T
           (QSETREFV $ 115
                     (CONS (|dispatchFunction| |COMBF;ipow;LF;41|) $))))))
       ('T (QSETREFV $ 115 (CONS (|dispatchFunction| |COMBF;ipow;LF;42|) $))))
      (COND
       ((|HasCategory| |#1| '(|CombinatorialFunctionCategory|))
        (PROGN
         (QSETREFV $ 121 (CONS (|dispatchFunction| |COMBF;iifact;2F;43|) $))
         (QSETREFV $ 123 (CONS (|dispatchFunction| |COMBF;iiperm;LF;44|) $))
         (COND
          ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
           (COND
            ((|HasCategory| |#2| '(|Algebra| (|Fraction| (|Integer|))))
             (QSETREFV $ 131
                       (CONS (|dispatchFunction| |COMBF;iibinom;LF;45|) $)))
            ('T
             (QSETREFV $ 131
                       (CONS (|dispatchFunction| |COMBF;iibinom;LF;46|) $)))))
          ('T
           (QSETREFV $ 131
                     (CONS (|dispatchFunction| |COMBF;iibinom;LF;47|) $))))))
       ('T
        (PROGN
         (QSETREFV $ 121 (CONS (|dispatchFunction| |COMBF;iifact;2F;48|) $))
         (QSETREFV $ 131 (CONS (|dispatchFunction| |COMBF;iibinom;LF;49|) $))
         (QSETREFV $ 123 (CONS (|dispatchFunction| |COMBF;iiperm;LF;50|) $)))))
      (COND
       ((|HasCategory| |#1| '(|ElementaryFunctionCategory|))
        (QSETREFV $ 133 (CONS (|dispatchFunction| |COMBF;iipow;LF;51|) $)))
       ('T (QSETREFV $ 133 (CONS (|dispatchFunction| |COMBF;iipow;LF;52|) $))))
      (SPADCALL (QREFELT $ 13) (ELT $ 121) (QREFELT $ 137))
      (SPADCALL (QREFELT $ 20) (ELT $ 133) (QREFELT $ 139))
      (SPADCALL (QREFELT $ 14) (ELT $ 123) (QREFELT $ 139))
      (SPADCALL (QREFELT $ 15) (ELT $ 131) (QREFELT $ 139))
      (SPADCALL (QREFELT $ 16) (CONS (|function| |COMBF;isum|) $)
                (QREFELT $ 139))
      (SPADCALL (QREFELT $ 17) (ELT $ 108) (QREFELT $ 139))
      (SPADCALL (QREFELT $ 18) (CONS (|function| |COMBF;iprod|) $)
                (QREFELT $ 139))
      (SPADCALL (QREFELT $ 19) (ELT $ 109) (QREFELT $ 139))
      (SPADCALL (QREFELT $ 20)
                (LIST (CONS (|function| |COMBF;dvpow1|) $)
                      (CONS (|function| |COMBF;dvpow2|) $))
                (QREFELT $ 141))
      (SPADCALL (QREFELT $ 16) '|%specialDiff|
                (CONS (|function| |COMBF;dvsum|) $) (QREFELT $ 143))
      (SPADCALL (QREFELT $ 17) '|%specialDiff|
                (CONS (|function| |COMBF;dvdsum|) $) (QREFELT $ 143))
      (SPADCALL (QREFELT $ 18) '|%specialDiff|
                (CONS (|function| |COMBF;dvprod|) $) (QREFELT $ 143))
      (SPADCALL (QREFELT $ 19) '|%specialDiff|
                (CONS (|function| |COMBF;dvdprod|) $) (QREFELT $ 143))
      (SPADCALL (QREFELT $ 16) '|%specialDisp|
                (CONS (|function| |COMBF;dsum|) $) (QREFELT $ 143))
      (SPADCALL (QREFELT $ 17) '|%specialDisp|
                (CONS (|function| |COMBF;ddsum|) $) (QREFELT $ 143))
      (SPADCALL (QREFELT $ 18) '|%specialDisp|
                (CONS (|function| |COMBF;dprod|) $) (QREFELT $ 143))
      (SPADCALL (QREFELT $ 19) '|%specialDisp|
                (CONS (|function| |COMBF;ddprod|) $) (QREFELT $ 143))
      (SPADCALL (QREFELT $ 16) '|%specialEqual|
                (CONS (|function| |COMBF;equalsumprod|) $) (QREFELT $ 143))
      (SPADCALL (QREFELT $ 17) '|%specialEqual|
                (CONS (|function| |COMBF;equaldsumprod|) $) (QREFELT $ 143))
      (SPADCALL (QREFELT $ 18) '|%specialEqual|
                (CONS (|function| |COMBF;equalsumprod|) $) (QREFELT $ 143))
      (SPADCALL (QREFELT $ 19) '|%specialEqual|
                (CONS (|function| |COMBF;equaldsumprod|) $) (QREFELT $ 143))
      $)))) 

(MAKEPROP '|CombinatorialFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'COMB
              (|BasicOperator|) (|Symbol|) (|CommonOperators|) (0 . |operator|)
              '|opfact| '|opperm| '|opbinom| '|opsum| '|opdsum| '|opprod|
              '|opdprod| '|oppow| (5 . |elt|) |COMBF;factorial;2F;1| (|List| $)
              (11 . |elt|) |COMBF;binomial;3F;2| |COMBF;permutation;3F;3|
              (|Boolean|) (17 . |ground?|) (|Union| 113 '#1="failed")
              (22 . |retractIfCan|) (27 . |is?|) (|List| 58) (33 . |kernels|)
              (|List| 7) (|Kernel| 7) (38 . |argument|) |COMBF;^;3F;5|
              (43 . |second|) (48 . *)
              (|Record| (|:| |val| $) (|:| |exponent| 43))
              (|Union| 40 '#2="failed") (54 . |isPower|) (|Integer|) (59 . *)
              (65 . |has?|) |COMBF;belong?;BoB;6| (71 . |third|) (76 . |One|)
              (80 . -) (|List| 10) (86 . |variables|) |COMBF;factorials;2F;9|
              |COMBF;factorials;FSF;10| (|SparseMultivariatePolynomial| 6 58)
              (91 . |numer|) (96 . |denom|) (101 . /) (|Kernel| $)
              (107 . |retract|) (112 . |eval|) (119 . |new|) (123 . |coerce|)
              (128 . |kernel|) (133 . |coerce|) |COMBF;product;FSF;13|
              |COMBF;summation;FSF;14| (138 . |differentiate|)
              (144 . |retract|) (149 . |Zero|) (153 . |member?|) (|OutputForm|)
              (159 . |coerce|) (164 . |prod|) (170 . =) (176 . |prod|)
              (183 . |sum|) (189 . |sum|) (196 . =) (|SegmentBinding| 7)
              (202 . |variable|) (|Segment| 7) (207 . |segment|) (212 . |lo|)
              (217 . |hi|) |COMBF;product;FSbF;25| |COMBF;summation;FSbF;26|
              (222 . |coerce|) (|Mapping| 7 35) (|Mapping| 7 6)
              (|SparseMultivariatePolynomial| 6 35)
              (|PolynomialCategoryLifting| (|IndexedExponents| 35) 35 6 90 7)
              (227 . |map|) (234 . |is?|) (240 . |operator|) (245 . |is?|)
              |COMBF;operator;2Bo;29| (251 . |zero?|) (256 . |kernel|)
              (262 . +) (268 . |One|) (272 . |kernel|) (278 . |Zero|)
              (|Union| 43 '#1#) (282 . |retractIfCan|) (|Union| 58 '#1#)
              (287 . |retractIfCan|) (292 . |coerce|) (297 . |iidsum|)
              (302 . |iidprod|) (|Record| (|:| |var| 58) (|:| |exponent| 43))
              (|Union| 110 '#2#) (307 . |isExpt|) (|Fraction| 43) (313 . ^)
              (319 . |ipow|) (324 . ^) (330 . -) (|Union| 6 '#1#)
              (335 . |retractIfCan|) (340 . |factorial|) (345 . |iifact|)
              (350 . |permutation|) (356 . |iiperm|) (361 . |retractIfCan|)
              (366 . >) (372 . |coerce|) (377 . |factorial|) (382 . /)
              (388 . *) (394 . |binomial|) (400 . |iibinom|) (405 . ^)
              (411 . |iipow|) (416 . |log|) (|Mapping| 7 7)
              (|BasicOperatorFunctions1| 7) (421 . |evaluate|) (|Mapping| 7 34)
              (427 . |evaluate|) (|List| 138) (433 . |derivative|) (|None|)
              (439 . |setProperty|))
           '#(|summation| 446 |product| 458 |permutation| 470 |operator| 476
              |ipow| 481 |iipow| 486 |iiperm| 491 |iifact| 496 |iidsum| 501
              |iidprod| 506 |iibinom| 511 |factorials| 516 |factorial| 527
              |binomial| 532 |belong?| 538 ^ 543)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 143
                                                 '(1 11 9 10 12 2 7 0 9 0 21 2
                                                   7 0 9 23 24 1 7 27 0 28 1 7
                                                   29 0 30 2 7 27 0 10 31 1 7
                                                   32 0 33 1 35 34 0 36 1 34 7
                                                   0 38 2 7 0 0 0 39 1 7 41 0
                                                   42 2 7 0 43 0 44 2 9 27 0 10
                                                   45 1 34 7 0 47 0 7 0 48 2 7
                                                   0 0 0 49 1 7 50 0 51 1 7 54
                                                   0 55 1 7 54 0 56 2 7 0 0 0
                                                   57 1 7 58 0 59 3 7 0 0 58 0
                                                   60 0 10 0 61 1 7 0 10 62 1
                                                   35 0 10 63 1 7 0 58 64 2 7 0
                                                   0 10 67 1 7 10 0 68 0 7 0 69
                                                   2 50 27 10 0 70 1 7 71 0 72
                                                   2 71 0 0 0 73 2 71 0 0 0 74
                                                   3 71 0 0 0 0 75 2 71 0 0 0
                                                   76 3 71 0 0 0 0 77 2 7 27 0
                                                   0 78 1 79 10 0 80 1 79 81 0
                                                   82 1 81 7 0 83 1 81 7 0 84 1
                                                   7 0 6 87 3 91 7 88 89 90 92
                                                   2 35 27 0 9 93 1 35 9 0 94 2
                                                   9 27 0 10 95 1 7 27 0 97 2 7
                                                   0 9 23 98 2 7 0 0 0 99 0 6 0
                                                   100 2 7 0 9 0 101 0 6 0 102
                                                   1 7 103 0 104 1 7 105 0 106
                                                   1 7 0 43 107 1 0 7 34 108 1
                                                   0 7 34 109 2 7 111 0 10 112
                                                   2 7 0 0 113 114 1 0 7 34 115
                                                   2 7 0 0 43 116 1 7 0 0 117 1
                                                   7 118 0 119 1 6 0 0 120 1 0
                                                   7 7 121 2 6 0 0 0 122 1 0 7
                                                   34 123 1 6 103 0 124 2 43 27
                                                   0 0 125 1 6 0 43 126 1 43 0
                                                   0 127 2 113 0 43 43 128 2 7
                                                   0 113 0 129 2 6 0 0 0 130 1
                                                   0 7 34 131 2 6 0 0 0 132 1 0
                                                   7 34 133 1 7 0 0 134 2 136 9
                                                   9 135 137 2 136 9 9 138 139
                                                   2 136 9 9 140 141 3 9 0 0 10
                                                   142 143 2 0 7 7 10 66 2 0 7
                                                   7 79 86 2 0 7 7 10 65 2 0 7
                                                   7 79 85 2 0 7 7 7 26 1 0 9 9
                                                   96 1 0 7 34 115 1 0 7 34 133
                                                   1 0 7 34 123 1 0 7 7 121 1 0
                                                   7 34 108 1 0 7 34 109 1 0 7
                                                   34 131 1 0 7 7 52 2 0 7 7 10
                                                   53 1 0 7 7 22 2 0 7 7 7 25 1
                                                   0 27 9 46 2 0 7 7 7 37)))))
           '|lookupComplete|)) 
