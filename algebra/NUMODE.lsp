
(/VERSIONCHECK 2) 

(DEFUN |NUMODE;rk4a;VI4FIMV;1|
       (|ystart| |nvar| |x1| |x2| |eps| |htry| |nstep| |derivs| $)
  (PROG (|i| #1=#:G158 |x| |iter| |outlist| |m| |tiny| |step| |t6| #2=#:G148
         |t5| #3=#:G146 |t4| #4=#:G144 |t3| #5=#:G142 |t2| #6=#:G140 |t1|
         #7=#:G138 |dydx| #8=#:G136 |yscal| #9=#:G134 |y| #10=#:G132)
    (RETURN
     (SEQ
      (LETT |y|
            (MAKEARR1
             (PROG1 (LETT #10# |nvar| . #11=(|NUMODE;rk4a;VI4FIMV;1|))
               (|check_subtype| (>= #10# 0) '(|NonNegativeInteger|) #10#))
             (SPADCALL 0 0 10 (QREFELT $ 10)))
            . #11#)
      (LETT |yscal|
            (MAKEARR1
             (PROG1 (LETT #9# |nvar| . #11#)
               (|check_subtype| (>= #9# 0) '(|NonNegativeInteger|) #9#))
             (SPADCALL 1 0 10 (QREFELT $ 10)))
            . #11#)
      (LETT |dydx|
            (MAKEARR1
             (PROG1 (LETT #8# |nvar| . #11#)
               (|check_subtype| (>= #8# 0) '(|NonNegativeInteger|) #8#))
             (SPADCALL 0 0 10 (QREFELT $ 10)))
            . #11#)
      (LETT |t1|
            (MAKEARR1
             (PROG1 (LETT #7# |nvar| . #11#)
               (|check_subtype| (>= #7# 0) '(|NonNegativeInteger|) #7#))
             (SPADCALL 0 0 10 (QREFELT $ 10)))
            . #11#)
      (LETT |t2|
            (MAKEARR1
             (PROG1 (LETT #6# |nvar| . #11#)
               (|check_subtype| (>= #6# 0) '(|NonNegativeInteger|) #6#))
             (SPADCALL 0 0 10 (QREFELT $ 10)))
            . #11#)
      (LETT |t3|
            (MAKEARR1
             (PROG1 (LETT #5# |nvar| . #11#)
               (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|) #5#))
             (SPADCALL 0 0 10 (QREFELT $ 10)))
            . #11#)
      (LETT |t4|
            (MAKEARR1
             (PROG1 (LETT #4# |nvar| . #11#)
               (|check_subtype| (>= #4# 0) '(|NonNegativeInteger|) #4#))
             (SPADCALL 0 0 10 (QREFELT $ 10)))
            . #11#)
      (LETT |t5|
            (MAKEARR1
             (PROG1 (LETT #3# |nvar| . #11#)
               (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|) #3#))
             (SPADCALL 0 0 10 (QREFELT $ 10)))
            . #11#)
      (LETT |t6|
            (MAKEARR1
             (PROG1 (LETT #2# |nvar| . #11#)
               (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
             (SPADCALL 0 0 10 (QREFELT $ 10)))
            . #11#)
      (LETT |step|
            (VECTOR |htry| (SPADCALL 0 0 10 (QREFELT $ 10))
                    (SPADCALL 0 0 10 (QREFELT $ 10)))
            . #11#)
      (LETT |x| |x1| . #11#)
      (LETT |tiny|
            (SPADCALL (SPADCALL 10 0 10 (QREFELT $ 10))
                      (- (+ (SPADCALL (QREFELT $ 12)) 1)) (QREFELT $ 13))
            . #11#)
      (LETT |m| |nvar| . #11#)
      (LETT |outlist|
            (LIST (SPADCALL |x| (QREFELT $ 15)) (SPADCALL |x| (QREFELT $ 15))
                  (SPADCALL |x| (QREFELT $ 15)))
            . #11#)
      (LETT |eps|
            (SPADCALL (SPADCALL 1 0 10 (QREFELT $ 10)) |eps| (QREFELT $ 16))
            . #11#)
      (SEQ (LETT |i| 1 . #11#) G190 (COND ((|greater_SI| |i| |m|) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |y| |i| (SPADCALL |ystart| |i| (QREFELT $ 18))
                       (QREFELT $ 19))))
           (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191 (EXIT NIL))
      (SEQ
       (EXIT
        (SEQ (LETT |iter| 1 . #11#) G190
             (COND ((|greater_SI| |iter| |nstep|) (GO G191)))
             (SEQ (SPADCALL |dydx| |y| |x| |derivs|)
                  (COND
                   ((SPADCALL
                     (SPADCALL (SPADCALL |x| (QVELT |step| 0) (QREFELT $ 20))
                               |x2| (QREFELT $ 21))
                     (SPADCALL 0 0 10 (QREFELT $ 10)) (QREFELT $ 23))
                    (QSETVELT |step| 0 (SPADCALL |x2| |x| (QREFELT $ 21)))))
                  (SEQ (LETT |i| 1 . #11#) G190
                       (COND ((|greater_SI| |i| |m|) (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |yscal| |i|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |y| |i| (QREFELT $ 18))
                                      (QREFELT $ 24))
                                     (SPADCALL
                                      (SPADCALL (QVELT |step| 0)
                                                (SPADCALL |dydx| |i|
                                                          (QREFELT $ 18))
                                                (QREFELT $ 25))
                                      (QREFELT $ 24))
                                     (QREFELT $ 20))
                                    |tiny| (QREFELT $ 20))
                                   (QREFELT $ 19))))
                       (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191
                       (EXIT NIL))
                  (|NUMODE;rk4qclocal| |y| |dydx| |nvar| |x| |step| |eps|
                   |yscal| |derivs| |t1| |t2| |t3| |t4| |t5| |t6| $)
                  (LETT |x| (SPADCALL |x| (QVELT |step| 1) (QREFELT $ 20))
                        . #11#)
                  (COND
                   ((SPADCALL (SPADCALL |x| |x2| (QREFELT $ 21))
                              (SPADCALL 0 0 10 (QREFELT $ 10)) (QREFELT $ 26))
                    (PROGN (LETT #1# |$NoValue| . #11#) (GO #1#))))
                  (EXIT (QSETVELT |step| 0 (QVELT |step| 2))))
             (LETT |iter| (|inc_SI| |iter|) . #11#) (GO G190) G191 (EXIT NIL)))
       #1# (EXIT #1#))
      (COND
       ((EQL |iter| (+ |nstep| 1))
        (SEQ (SPADCALL "ode: ERROR " (QREFELT $ 30))
             (SPADCALL |outlist| 1 (SPADCALL |nstep| (QREFELT $ 31))
                       (QREFELT $ 33))
             (SPADCALL |outlist| 2 " steps to small, last h = " (QREFELT $ 33))
             (SPADCALL |outlist| 3 (SPADCALL (QVELT |step| 1) (QREFELT $ 15))
                       (QREFELT $ 33))
             (SPADCALL (SPADCALL |outlist| (QREFELT $ 35)) (QREFELT $ 36))
             (EXIT
              (SPADCALL " y= " (SPADCALL |y| (QREFELT $ 37))
                        (QREFELT $ 38))))))
      (EXIT
       (SEQ (LETT |i| 1 . #11#) G190 (COND ((|greater_SI| |i| |m|) (GO G191)))
            (SEQ
             (EXIT
              (SPADCALL |ystart| |i| (SPADCALL |y| |i| (QREFELT $ 18))
                        (QREFELT $ 19))))
            (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191 (EXIT NIL))))))) 

(DEFUN |NUMODE;rk4qc;VIFRFVMV;2| (|y| |n| |x| |step| |eps| |yscal| |derivs| $)
  (PROG (|t7| #1=#:G179 |t6| #2=#:G177 |t5| #3=#:G175 |t4| #4=#:G173 |t3|
         #5=#:G171 |t2| #6=#:G169 |t1| #7=#:G167)
    (RETURN
     (SEQ
      (LETT |t1|
            (MAKEARR1
             (PROG1 (LETT #7# |n| . #8=(|NUMODE;rk4qc;VIFRFVMV;2|))
               (|check_subtype| (>= #7# 0) '(|NonNegativeInteger|) #7#))
             (SPADCALL 0 0 10 (QREFELT $ 10)))
            . #8#)
      (LETT |t2|
            (MAKEARR1
             (PROG1 (LETT #6# |n| . #8#)
               (|check_subtype| (>= #6# 0) '(|NonNegativeInteger|) #6#))
             (SPADCALL 0 0 10 (QREFELT $ 10)))
            . #8#)
      (LETT |t3|
            (MAKEARR1
             (PROG1 (LETT #5# |n| . #8#)
               (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|) #5#))
             (SPADCALL 0 0 10 (QREFELT $ 10)))
            . #8#)
      (LETT |t4|
            (MAKEARR1
             (PROG1 (LETT #4# |n| . #8#)
               (|check_subtype| (>= #4# 0) '(|NonNegativeInteger|) #4#))
             (SPADCALL 0 0 10 (QREFELT $ 10)))
            . #8#)
      (LETT |t5|
            (MAKEARR1
             (PROG1 (LETT #3# |n| . #8#)
               (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|) #3#))
             (SPADCALL 0 0 10 (QREFELT $ 10)))
            . #8#)
      (LETT |t6|
            (MAKEARR1
             (PROG1 (LETT #2# |n| . #8#)
               (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
             (SPADCALL 0 0 10 (QREFELT $ 10)))
            . #8#)
      (LETT |t7|
            (MAKEARR1
             (PROG1 (LETT #1# |n| . #8#)
               (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
             (SPADCALL 0 0 10 (QREFELT $ 10)))
            . #8#)
      (SPADCALL |t7| |y| |x| |derivs|)
      (LETT |eps|
            (SPADCALL (SPADCALL 1 0 10 (QREFELT $ 10)) |eps| (QREFELT $ 16))
            . #8#)
      (EXIT
       (|NUMODE;rk4qclocal| |y| |t7| |n| |x| |step| |eps| |yscal| |derivs| |t1|
        |t2| |t3| |t4| |t5| |t6| $)))))) 

(DEFUN |NUMODE;rk4qc;VIFRFVM7VV;3|
       (|y| |n| |x| |step| |eps| |yscal| |derivs| |t1| |t2| |t3| |t4| |t5| |t6|
        |dydx| $)
  (SEQ (SPADCALL |dydx| |y| |x| |derivs|)
       (LETT |eps|
             (SPADCALL (SPADCALL 1 0 10 (QREFELT $ 10)) |eps| (QREFELT $ 16))
             |NUMODE;rk4qc;VIFRFVM7VV;3|)
       (EXIT
        (|NUMODE;rk4qclocal| |y| |dydx| |n| |x| |step| |eps| |yscal| |derivs|
         |t1| |t2| |t3| |t4| |t5| |t6| $)))) 

(DEFUN |NUMODE;rk4qclocal|
       (|y| |dydx| |n| |x| |step| |eps| |yscal| |derivs| |t1| |t2| |t3| |ysav|
        |dysav| |ytemp| $)
  (PROG (|i| #1=#:G208 |h| |errmax| |hh| |m| |errcon| |shrink| |grow| |safety|
         |fcor| |xsav|)
    (RETURN
     (SEQ (LETT |xsav| |x| . #2=(|NUMODE;rk4qclocal|))
          (LETT |h| (QVELT |step| 0) . #2#)
          (LETT |fcor|
                (SPADCALL (SPADCALL 1 0 10 (QREFELT $ 10))
                          (SPADCALL 15 0 10 (QREFELT $ 10)) (QREFELT $ 16))
                . #2#)
          (LETT |safety| (SPADCALL 9 -1 10 (QREFELT $ 10)) . #2#)
          (LETT |grow|
                (SPADCALL (SPADCALL 20 -2 10 (QREFELT $ 10)) (QREFELT $ 44))
                . #2#)
          (LETT |shrink|
                (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 10)) (QREFELT $ 44))
                . #2#)
          (LETT |errcon| (SPADCALL 6 -5 10 (QREFELT $ 10)) . #2#)
          (LETT |m| |n| . #2#)
          (SEQ (LETT |i| 1 . #2#) G190
               (COND ((|greater_SI| |i| |m|) (GO G191)))
               (SEQ
                (SPADCALL |dysav| |i| (SPADCALL |dydx| |i| (QREFELT $ 18))
                          (QREFELT $ 19))
                (EXIT
                 (SPADCALL |ysav| |i| (SPADCALL |y| |i| (QREFELT $ 18))
                           (QREFELT $ 19))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (SEQ
           (EXIT
            (SEQ G190 NIL
                 (SEQ
                  (LETT |hh|
                        (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 10)) |h|
                                  (QREFELT $ 25))
                        . #2#)
                  (|NUMODE;rk4local| |ysav| |dysav| |n| |xsav| |hh| |ytemp|
                   |derivs| |t1| |t2| |t3| $)
                  (LETT |x| (SPADCALL |xsav| |hh| (QREFELT $ 20)) . #2#)
                  (SPADCALL |dydx| |ytemp| |x| |derivs|)
                  (|NUMODE;rk4local| |ytemp| |dydx| |n| |x| |hh| |y| |derivs|
                   |t1| |t2| |t3| $)
                  (LETT |x| (SPADCALL |xsav| |h| (QREFELT $ 20)) . #2#)
                  (|NUMODE;rk4local| |ysav| |dysav| |n| |xsav| |h| |ytemp|
                   |derivs| |t1| |t2| |t3| $)
                  (LETT |errmax| (SPADCALL 0 0 10 (QREFELT $ 10)) . #2#)
                  (SEQ (LETT |i| 1 . #2#) G190
                       (COND ((|greater_SI| |i| |m|) (GO G191)))
                       (SEQ
                        (SPADCALL |ytemp| |i|
                                  (SPADCALL (SPADCALL |y| |i| (QREFELT $ 18))
                                            (SPADCALL |ytemp| |i|
                                                      (QREFELT $ 18))
                                            (QREFELT $ 21))
                                  (QREFELT $ 19))
                        (EXIT
                         (LETT |errmax|
                               (SPADCALL |errmax|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |ytemp| |i|
                                                     (QREFELT $ 18))
                                           (SPADCALL |yscal| |i|
                                                     (QREFELT $ 18))
                                           (QREFELT $ 16))
                                          (QREFELT $ 24))
                                         (QREFELT $ 45))
                               . #2#)))
                       (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                       (EXIT NIL))
                  (LETT |errmax| (SPADCALL |errmax| |eps| (QREFELT $ 25))
                        . #2#)
                  (EXIT
                   (COND
                    ((SPADCALL |errmax| (SPADCALL 1 0 10 (QREFELT $ 10))
                               (QREFELT $ 23))
                     (LETT |h|
                           (SPADCALL (SPADCALL |safety| |h| (QREFELT $ 25))
                                     (SPADCALL |errmax| |shrink|
                                               (QREFELT $ 46))
                                     (QREFELT $ 25))
                           . #2#))
                    ('T
                     (SEQ (QSETVELT |step| 1 |h|)
                          (COND
                           ((SPADCALL |errmax| |errcon| (QREFELT $ 23))
                            (QSETVELT |step| 2
                                      (SPADCALL
                                       (SPADCALL |safety| |h| (QREFELT $ 25))
                                       (SPADCALL |errmax| |grow|
                                                 (QREFELT $ 46))
                                       (QREFELT $ 25))))
                           ('T
                            (QSETVELT |step| 2
                                      (SPADCALL 4 |h| (QREFELT $ 47)))))
                          (EXIT
                           (PROGN (LETT #1# |$NoValue| . #2#) (GO #1#))))))))
                 NIL (GO G190) G191 (EXIT NIL)))
           #1# (EXIT #1#))
          (EXIT
           (SEQ (LETT |i| 1 . #2#) G190
                (COND ((|greater_SI| |i| |m|) (GO G191)))
                (SEQ
                 (EXIT
                  (SPADCALL |y| |i|
                            (SPADCALL (SPADCALL |y| |i| (QREFELT $ 18))
                                      (SPADCALL
                                       (SPADCALL |ytemp| |i| (QREFELT $ 18))
                                       |fcor| (QREFELT $ 25))
                                      (QREFELT $ 20))
                            (QREFELT $ 19))))
                (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))))))) 

(DEFUN |NUMODE;rk4f;VI2FIMV;5| (|y| |nvar| |x1| |x2| |nstep| |derivs| $)
  (PROG (|x| |i| |h| |ynew| #1=#:G221 |dydx| #2=#:G219 |dym| #3=#:G217 |dyt|
         #4=#:G215 |yt| #5=#:G213)
    (RETURN
     (SEQ
      (LETT |yt|
            (MAKEARR1
             (PROG1 (LETT #5# |nvar| . #6=(|NUMODE;rk4f;VI2FIMV;5|))
               (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|) #5#))
             (SPADCALL 0 0 10 (QREFELT $ 10)))
            . #6#)
      (LETT |dyt|
            (MAKEARR1
             (PROG1 (LETT #4# |nvar| . #6#)
               (|check_subtype| (>= #4# 0) '(|NonNegativeInteger|) #4#))
             (SPADCALL 0 0 10 (QREFELT $ 10)))
            . #6#)
      (LETT |dym|
            (MAKEARR1
             (PROG1 (LETT #3# |nvar| . #6#)
               (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|) #3#))
             (SPADCALL 0 0 10 (QREFELT $ 10)))
            . #6#)
      (LETT |dydx|
            (MAKEARR1
             (PROG1 (LETT #2# |nvar| . #6#)
               (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
             (SPADCALL 0 0 10 (QREFELT $ 10)))
            . #6#)
      (LETT |ynew|
            (MAKEARR1
             (PROG1 (LETT #1# |nvar| . #6#)
               (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
             (SPADCALL 0 0 10 (QREFELT $ 10)))
            . #6#)
      (LETT |h|
            (SPADCALL (SPADCALL |x2| |x1| (QREFELT $ 21))
                      (SPADCALL |nstep| (QREFELT $ 48)) (QREFELT $ 16))
            . #6#)
      (LETT |x| |x1| . #6#)
      (EXIT
       (SEQ (LETT |i| 1 . #6#) G190
            (COND ((|greater_SI| |i| |nstep|) (GO G191)))
            (SEQ (SPADCALL |dydx| |y| |x| |derivs|)
                 (|NUMODE;rk4local| |y| |dydx| |nvar| |x| |h| |y| |derivs| |yt|
                  |dyt| |dym| $)
                 (EXIT (LETT |x| (SPADCALL |x| |h| (QREFELT $ 20)) . #6#)))
            (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))))))) 

(DEFUN |NUMODE;rk4;VI2FMV;6| (|y| |n| |x| |h| |derivs| $)
  (PROG (|t4| #1=#:G236 |t3| #2=#:G234 |t2| #3=#:G232 |t1| #4=#:G230)
    (RETURN
     (SEQ
      (LETT |t1|
            (MAKEARR1
             (PROG1 (LETT #4# |n| . #5=(|NUMODE;rk4;VI2FMV;6|))
               (|check_subtype| (>= #4# 0) '(|NonNegativeInteger|) #4#))
             (SPADCALL 0 0 10 (QREFELT $ 10)))
            . #5#)
      (LETT |t2|
            (MAKEARR1
             (PROG1 (LETT #3# |n| . #5#)
               (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|) #3#))
             (SPADCALL 0 0 10 (QREFELT $ 10)))
            . #5#)
      (LETT |t3|
            (MAKEARR1
             (PROG1 (LETT #2# |n| . #5#)
               (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
             (SPADCALL 0 0 10 (QREFELT $ 10)))
            . #5#)
      (LETT |t4|
            (MAKEARR1
             (PROG1 (LETT #1# |n| . #5#)
               (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
             (SPADCALL 0 0 10 (QREFELT $ 10)))
            . #5#)
      (SPADCALL |t1| |y| |x| |derivs|)
      (EXIT
       (|NUMODE;rk4local| |y| |t1| |n| |x| |h| |y| |derivs| |t2| |t3| |t4|
        $)))))) 

(DEFUN |NUMODE;rk4;VI2FM4VV;7| (|y| |n| |x| |h| |derivs| |t1| |t2| |t3| |t4| $)
  (SEQ (SPADCALL |t1| |y| |x| |derivs|)
       (EXIT
        (|NUMODE;rk4local| |y| |t1| |n| |x| |h| |y| |derivs| |t2| |t3| |t4|
         $)))) 

(DEFUN |NUMODE;rk4local|
       (|y| |dydx| |n| |x| |h| |yout| |derivs| |yt| |dyt| |dym| $)
  (PROG (|i| |m| |xh| |h6| |hh|)
    (RETURN
     (SEQ
      (LETT |hh|
            (SPADCALL |h| (SPADCALL 5 -1 10 (QREFELT $ 10)) (QREFELT $ 25))
            . #1=(|NUMODE;rk4local|))
      (LETT |h6| (SPADCALL |h| (SPADCALL 6 0 10 (QREFELT $ 10)) (QREFELT $ 16))
            . #1#)
      (LETT |xh| (SPADCALL |x| |hh| (QREFELT $ 20)) . #1#) (LETT |m| |n| . #1#)
      (SEQ (LETT |i| 1 . #1#) G190 (COND ((|greater_SI| |i| |m|) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |yt| |i|
                       (SPADCALL (SPADCALL |y| |i| (QREFELT $ 18))
                                 (SPADCALL |hh|
                                           (SPADCALL |dydx| |i| (QREFELT $ 18))
                                           (QREFELT $ 25))
                                 (QREFELT $ 20))
                       (QREFELT $ 19))))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (SPADCALL |dyt| |yt| |xh| |derivs|)
      (SEQ (LETT |i| 1 . #1#) G190 (COND ((|greater_SI| |i| |m|) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |yt| |i|
                       (SPADCALL (SPADCALL |y| |i| (QREFELT $ 18))
                                 (SPADCALL |hh|
                                           (SPADCALL |dyt| |i| (QREFELT $ 18))
                                           (QREFELT $ 25))
                                 (QREFELT $ 20))
                       (QREFELT $ 19))))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (SPADCALL |dym| |yt| |xh| |derivs|)
      (SEQ (LETT |i| 1 . #1#) G190 (COND ((|greater_SI| |i| |m|) (GO G191)))
           (SEQ
            (SPADCALL |yt| |i|
                      (SPADCALL (SPADCALL |y| |i| (QREFELT $ 18))
                                (SPADCALL |h|
                                          (SPADCALL |dym| |i| (QREFELT $ 18))
                                          (QREFELT $ 25))
                                (QREFELT $ 20))
                      (QREFELT $ 19))
            (EXIT
             (SPADCALL |dym| |i|
                       (SPADCALL (SPADCALL |dyt| |i| (QREFELT $ 18))
                                 (SPADCALL |dym| |i| (QREFELT $ 18))
                                 (QREFELT $ 20))
                       (QREFELT $ 19))))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (SPADCALL |dyt| |yt| (SPADCALL |x| |h| (QREFELT $ 20)) |derivs|)
      (EXIT
       (SEQ (LETT |i| 1 . #1#) G190 (COND ((|greater_SI| |i| |m|) (GO G191)))
            (SEQ
             (EXIT
              (SPADCALL |yout| |i|
                        (SPADCALL (SPADCALL |y| |i| (QREFELT $ 18))
                                  (SPADCALL |h6|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |dydx| |i|
                                                        (QREFELT $ 18))
                                              (SPADCALL
                                               (SPADCALL 2 0 10 (QREFELT $ 10))
                                               (SPADCALL |dym| |i|
                                                         (QREFELT $ 18))
                                               (QREFELT $ 25))
                                              (QREFELT $ 20))
                                             (SPADCALL |dyt| |i|
                                                       (QREFELT $ 18))
                                             (QREFELT $ 20))
                                            (QREFELT $ 25))
                                  (QREFELT $ 20))
                        (QREFELT $ 19))))
            (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))))))) 

(DEFUN |NumericalOrdinaryDifferentialEquations| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G255)
       (RETURN
        (COND
         ((LETT #1#
                (HGET |$ConstructorCache|
                      '|NumericalOrdinaryDifferentialEquations|)
                . #2=(|NumericalOrdinaryDifferentialEquations|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache|
                         '|NumericalOrdinaryDifferentialEquations|
                         (LIST
                          (CONS NIL
                                (CONS 1
                                      (|NumericalOrdinaryDifferentialEquations;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache|
                    '|NumericalOrdinaryDifferentialEquations|))))))))))) 

(DEFUN |NumericalOrdinaryDifferentialEquations;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|NumericalOrdinaryDifferentialEquations|)
            . #1=(|NumericalOrdinaryDifferentialEquations|))
      (LETT $ (GETREFV 52) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|NumericalOrdinaryDifferentialEquations|
                  NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|NumericalOrdinaryDifferentialEquations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Float|) (0 . |Zero|) (|Integer|)
              (|PositiveInteger|) (4 . |float|) (11 . |One|) (15 . |digits|)
              (19 . ^) (|OutputForm|) (25 . |coerce|) (30 . /) (|Vector| 6)
              (36 . |elt|) (42 . |setelt|) (49 . +) (55 . -) (|Boolean|)
              (61 . >) (67 . |abs|) (72 . *) (78 . >=) (|Void|) (|String|)
              (|OutputPackage|) (84 . |output|) (89 . |coerce|) (|List| 14)
              (94 . |setelt|) (|List| $) (101 . |blankSeparate|)
              (106 . |output|) (111 . |coerce|) (116 . |output|)
              (|Mapping| 27 17 17 6) |NUMODE;rk4a;VI4FIMV;1|
              (|Record| (|:| |to_try| 6) (|:| |did| 6) (|:| |next| 6))
              |NUMODE;rk4qc;VIFRFVMV;2| |NUMODE;rk4qc;VIFRFVM7VV;3| (122 . -)
              (127 . |max|) (133 . ^) (139 . *) (145 . |coerce|)
              |NUMODE;rk4f;VI2FIMV;5| |NUMODE;rk4;VI2FMV;6|
              |NUMODE;rk4;VI2FM4VV;7|)
           '#(|rk4qc| 150 |rk4f| 179 |rk4a| 189 |rk4| 201) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 51
                                                 '(0 6 0 7 3 6 0 8 8 9 10 0 6 0
                                                   11 0 6 9 12 2 6 0 0 8 13 1 6
                                                   14 0 15 2 6 0 0 0 16 2 17 6
                                                   0 8 18 3 17 6 0 8 6 19 2 6 0
                                                   0 0 20 2 6 0 0 0 21 2 6 22 0
                                                   0 23 1 6 0 0 24 2 6 0 0 0 25
                                                   2 6 22 0 0 26 1 29 27 28 30
                                                   1 8 14 0 31 3 32 14 0 8 14
                                                   33 1 14 0 34 35 1 29 27 14
                                                   36 1 17 14 0 37 2 29 27 28
                                                   14 38 1 6 0 0 44 2 6 0 0 0
                                                   45 2 6 0 0 0 46 2 6 0 9 0 47
                                                   1 6 0 8 48 7 0 27 17 8 6 41
                                                   6 17 39 42 14 0 27 17 8 6 41
                                                   6 17 39 17 17 17 17 17 17 17
                                                   43 6 0 27 17 8 6 6 8 39 49 8
                                                   0 27 17 8 6 6 6 6 8 39 40 5
                                                   0 27 17 8 6 6 39 50 9 0 27
                                                   17 8 6 6 39 17 17 17 17
                                                   51)))))
           '|lookupComplete|)) 

(MAKEPROP '|NumericalOrdinaryDifferentialEquations| 'NILADIC T) 
