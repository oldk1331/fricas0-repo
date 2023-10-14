
(SDEFUN |FRIDEAL;One;$;1| (($ $))
        (CONS (VECTOR (|spadConstant| $ 15)) (|spadConstant| $ 12))) 

(PUT '|FRIDEAL;numer;$V;2| '|SPADreplace| 'QCAR) 

(SDEFUN |FRIDEAL;numer;$V;2| ((|i| $) ($ |Vector| A)) (QCAR |i|)) 

(PUT '|FRIDEAL;denom;$R;3| '|SPADreplace| 'QCDR) 

(SDEFUN |FRIDEAL;denom;$R;3| ((|i| $) ($ R)) (QCDR |i|)) 

(PUT '|FRIDEAL;mkIdeal| '|SPADreplace| 'CONS) 

(SDEFUN |FRIDEAL;mkIdeal| ((|v| |Vector| A) (|d| R) ($ $)) (CONS |v| |d|)) 

(SDEFUN |FRIDEAL;invrep| ((|m| |Matrix| F) ($ A))
        (SPADCALL
         (SPADCALL (SPADCALL |m| (QREFELT $ 20))
                   (SPADCALL (|spadConstant| $ 15) (QREFELT $ 22))
                   (QREFELT $ 23))
         (QREFELT $ 24))) 

(SDEFUN |FRIDEAL;upmat| ((|x| A) (|i| |NonNegativeInteger|) ($ |Matrix| UP))
        (SPROG NIL
               (SPADCALL (CONS #'|FRIDEAL;upmat!0| (VECTOR $ |i|))
                         (SPADCALL (SPADCALL |x| (QREFELT $ 27))
                                   (QREFELT $ 20))
                         (QREFELT $ 31)))) 

(SDEFUN |FRIDEAL;upmat!0| ((|s| NIL) ($$ NIL))
        (PROG (|i| $)
          (LETT |i| (QREFELT $$ 1) . #1=(|FRIDEAL;upmat|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |s| |i| (QREFELT $ 26)))))) 

(SDEFUN |FRIDEAL;ret?| ((|v| |Vector| A) ($ |Boolean|))
        (SPADCALL (CONS #'|FRIDEAL;ret?!0| $) |v| (QREFELT $ 36))) 

(SDEFUN |FRIDEAL;ret?!0| ((|s| NIL) ($ NIL))
        (QEQCAR (SPADCALL |s| (QREFELT $ 33)) 0)) 

(SDEFUN |FRIDEAL;=;2$B;8| ((|x| $) (|y| $) ($ |Boolean|))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 18)) (SPADCALL |y| (QREFELT $ 18))
                    (QREFELT $ 37))
          (SPADCALL (SPADCALL |x| (QREFELT $ 17)) (SPADCALL |y| (QREFELT $ 17))
                    (QREFELT $ 38)))
         ('T 'NIL))) 

(SDEFUN |FRIDEAL;agcd| ((|l| |List| A) ($ R))
        (SPROG ((#1=#:G134 NIL) (|a| NIL) (#2=#:G133 NIL))
               (SEQ
                (SPADCALL (ELT $ 41)
                          (PROGN
                           (LETT #2# NIL . #3=(|FRIDEAL;agcd|))
                           (SEQ (LETT |a| NIL . #3#) (LETT #1# |l| . #3#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (|FRIDEAL;vgcd|
                                          (SPADCALL |a| (QREFELT $ 22)) $)
                                         #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (|spadConstant| $ 40) (QREFELT $ 44))))) 

(SDEFUN |FRIDEAL;oldnorm| ((|i| $) ($ F))
        (SPROG ((#1=#:G144 NIL) (|u| NIL) (#2=#:G143 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #2# NIL . #3=(|FRIDEAL;oldnorm|))
                   (SEQ (LETT |u| NIL . #3#)
                        (LETT #1#
                              (SPADCALL
                               (SPADCALL (|FRIDEAL;summat| |i| $)
                                         (QREFELT $ 45))
                               (QREFELT $ 47))
                              . #3#)
                        G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2# (CONS (SPADCALL |u| (QREFELT $ 48)) #2#)
                                . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (QREFELT $ 50))
                 (SPADCALL (SPADCALL |i| (QREFELT $ 18))
                           (SPADCALL (QREFELT $ 52)) (QREFELT $ 53))
                 (QREFELT $ 54))))) 

(SDEFUN |FRIDEAL;norm;$F;11| ((|i| $) ($ F))
        (SPROG
         ((#1=#:G158 NIL) (|j| NIL) (#2=#:G157 NIL)
          (|dv| (|SingletonAsOrderedSet|))
          (|pp| (|SparseUnivariatePolynomial| A)) (#3=#:G156 NIL)
          (|j0| (|Integer|)) (|chara| (|NonNegativeInteger|)) (|n| (|Integer|))
          (|v| (|Vector| A)))
         (SEQ
          (LETT |v| (SPADCALL |i| (QREFELT $ 17)) . #4=(|FRIDEAL;norm;$F;11|))
          (LETT |n| (* (- (QVSIZE |v|) 1) (SPADCALL (QREFELT $ 52))) . #4#)
          (LETT |chara| (SPADCALL (QREFELT $ 55)) . #4#)
          (COND
           ((SPADCALL |chara| 0 (QREFELT $ 57))
            (COND ((>= |n| |chara|) (EXIT (|FRIDEAL;oldnorm| |i| $))))))
          (LETT |pp| (|spadConstant| $ 59) . #4#)
          (LETT |j0| (SPADCALL |v| (QREFELT $ 61)) . #4#)
          (SEQ (LETT |j| 0 . #4#) (LETT #3# (- (QVSIZE |v|) 1) . #4#) G190
               (COND ((|greater_SI| |j| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |pp|
                       (SPADCALL |pp|
                                 (SPADCALL (QAREF1O |v| (+ |j0| |j|) 1) |j|
                                           (QREFELT $ 62))
                                 (QREFELT $ 63))
                       . #4#)))
               (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191 (EXIT NIL))
          (LETT |dv| (SPADCALL (QREFELT $ 65)) . #4#)
          (EXIT
           (SPADCALL
            (SPADCALL
             (PROGN
              (LETT #2# NIL . #4#)
              (SEQ (LETT |j| 0 . #4#) (LETT #1# |n| . #4#) G190
                   (COND ((|greater_SI| |j| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #2#
                           (CONS
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL |pp| |dv|
                                         (SPADCALL |j| (QREFELT $ 66))
                                         (QREFELT $ 67))
                               (QREFELT $ 68))
                              (QREFELT $ 69))
                             (QREFELT $ 48))
                            #2#)
                           . #4#)))
                   (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                   (EXIT (NREVERSE #2#))))
             (QREFELT $ 50))
            (SPADCALL (SPADCALL |i| (QREFELT $ 18)) (SPADCALL (QREFELT $ 52))
                      (QREFELT $ 53))
            (QREFELT $ 54)))))) 

(SDEFUN |FRIDEAL;tryRange|
        ((|range| |NonNegativeInteger|) (|nm| |Vector| A) (|nrm| R) (|i| $)
         ($ |Union| $ "failed"))
        (SPROG
         ((#1=#:G169 NIL) (#2=#:G170 NIL) (#3=#:G163 NIL) (|a| (A)) (|j| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |j| 0 . #4=(|FRIDEAL;tryRange|)) G190
                 (COND ((|greater_SI| |j| 10) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ
                    (LETT |a|
                          (SPADCALL (SPADCALL 10 |range| (QREFELT $ 71)) |nm|
                                    (QREFELT $ 72))
                          . #4#)
                    (EXIT
                     (COND
                      ((SPADCALL
                        (SPADCALL
                         (PROG2
                             (LETT #3#
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |a| (QREFELT $ 69))
                                              (QREFELT $ 48))
                                    |nrm| (QREFELT $ 74))
                                   . #4#)
                             (QCDR #3#)
                           (|check_union2| (QEQCAR #3# 0) (QREFELT $ 6)
                                           (|Union| (QREFELT $ 6) "failed")
                                           #3#))
                         |nrm| (QREFELT $ 41))
                        (QREFELT $ 75))
                       (PROGN
                        (LETT #1#
                              (PROGN
                               (LETT #2#
                                     (CONS 0
                                           (|FRIDEAL;intIdeal|
                                            (LIST
                                             (SPADCALL
                                              (SPADCALL |nrm| (QREFELT $ 76))
                                              (QREFELT $ 77))
                                             |a|)
                                            (SPADCALL |i| (QREFELT $ 18)) $))
                                     . #4#)
                               (GO #5=#:G168))
                              . #4#)
                        (GO #6=#:G165)))))))
                  #6# (EXIT #1#))
                 (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 1 "failed"))))
          #5# (EXIT #2#)))) 

(SDEFUN |FRIDEAL;summat| ((|i| $) ($ |Matrix| UP))
        (SPROG
         ((#1=#:G178 NIL) (|j| NIL) (#2=#:G177 NIL) (|m| (|Integer|))
          (|v| (|Vector| A)))
         (SEQ
          (LETT |m|
                (SPADCALL
                 (LETT |v| (SPADCALL |i| (QREFELT $ 17))
                       . #3=(|FRIDEAL;summat|))
                 (QREFELT $ 61))
                . #3#)
          (EXIT
           (SPADCALL (ELT $ 78)
                     (PROGN
                      (LETT #2# NIL . #3#)
                      (SEQ (LETT |j| 0 . #3#)
                           (LETT #1# (- (QVSIZE |v|) 1) . #3#) G190
                           (COND ((|greater_SI| |j| #1#) (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (|FRIDEAL;upmat|
                                     (QAREF1O |v| (+ |j| |m|) 1) |j| $)
                                    #2#)
                                   . #3#)))
                           (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 81)))))) 

(SDEFUN |FRIDEAL;inv;2$;14| ((|i| $) ($ $))
        (SPROG
         ((#1=#:G218 NIL) (|j| NIL) (#2=#:G217 NIL)
          (|d| (|NonNegativeInteger|)) (#3=#:G216 NIL) (|p| NIL)
          (#4=#:G215 NIL) (|invd| (F))
          (|cd2| (|Record| (|:| |num| (|List| R)) (|:| |den| R)))
          (|cd| (|Record| (|:| |num| (|Matrix| UP)) (|:| |den| UP)))
          (|m| (|Matrix| (|Fraction| UP))) (#5=#:G186 NIL))
         (SEQ
          (LETT |m|
                (PROG2
                    (LETT #5#
                          (SPADCALL
                           (SPADCALL (ELT $ 83) (|FRIDEAL;summat| |i| $)
                                     (QREFELT $ 87))
                           (QREFELT $ 88))
                          . #6=(|FRIDEAL;inv;2$;14|))
                    (QCDR #5#)
                  (|check_union2| (QEQCAR #5# 0)
                                  (|Matrix| (|Fraction| (QREFELT $ 8)))
                                  (|Union|
                                   (|Matrix| (|Fraction| (QREFELT $ 8)))
                                   "failed")
                                  #5#))
                . #6#)
          (LETT |cd|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (SPADCALL |i| (QREFELT $ 18)) (QREFELT $ 76))
                    (QREFELT $ 89))
                   (QREFELT $ 83))
                  |m| (QREFELT $ 90))
                 (QREFELT $ 93))
                . #6#)
          (LETT |cd2|
                (SPADCALL (SPADCALL (QCDR |cd|) (QREFELT $ 47)) (QREFELT $ 96))
                . #6#)
          (LETT |invd|
                (SPADCALL (QCDR |cd2|)
                          (SPADCALL (ELT $ 41) (QCAR |cd2|) (QREFELT $ 97))
                          (QREFELT $ 54))
                . #6#)
          (LETT |d|
                (SPADCALL (ELT $ 101)
                          (PROGN
                           (LETT #4# NIL . #6#)
                           (SEQ (LETT |p| NIL . #6#)
                                (LETT #3# (SPADCALL (QCAR |cd|) (QREFELT $ 99))
                                      . #6#)
                                G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |p| (CAR #3#) . #6#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #4#
                                        (CONS (SPADCALL |p| (QREFELT $ 100))
                                              #4#)
                                        . #6#)))
                                (LETT #3# (CDR #3#) . #6#) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          (QREFELT $ 104))
                . #6#)
          (EXIT
           (SPADCALL
            (PROGN
             (LETT #2# (GETREFV (|inc_SI| |d|)) . #6#)
             (SEQ (LETT |j| 0 . #6#) (LETT #1# |d| . #6#) G190
                  (COND ((|greater_SI| |j| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SETELT #2# |j|
                            (SPADCALL |invd|
                                      (|FRIDEAL;invrep|
                                       (SPADCALL
                                        (CONS #'|FRIDEAL;inv;2$;14!0|
                                              (VECTOR $ |j|))
                                        (QCAR |cd|) (QREFELT $ 108))
                                       $)
                                      (QREFELT $ 109)))))
                  (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191 (EXIT NIL))
             #2#)
            (QREFELT $ 110)))))) 

(SDEFUN |FRIDEAL;inv;2$;14!0| ((|s| NIL) ($$ NIL))
        (PROG (|j| $)
          (LETT |j| (QREFELT $$ 1) . #1=(|FRIDEAL;inv;2$;14|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |s| |j| (QREFELT $ 105)))))) 

(SDEFUN |FRIDEAL;ideal;V$;15| ((|v| |Vector| A) ($ $))
        (SPROG
         ((#1=#:G233 NIL) (|i| NIL) (#2=#:G232 NIL) (|d| (R)) (#3=#:G231 NIL)
          (#4=#:G230 NIL))
         (SEQ
          (LETT |d|
                (SPADCALL (ELT $ 114)
                          (PROGN
                           (LETT #4# NIL . #5=(|FRIDEAL;ideal;V$;15|))
                           (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 61)) . #5#)
                                (LETT #3# (QVSIZE |v|) . #5#) G190
                                (COND ((> |i| #3#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #4#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL (QAREF1O |v| |i| 1)
                                                    (QREFELT $ 22))
                                          (QREFELT $ 113))
                                         #4#)
                                        . #5#)))
                                (LETT |i| (+ |i| 1) . #5#) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          (QREFELT $ 97))
                . #5#)
          (EXIT
           (|FRIDEAL;intIdeal|
            (PROGN
             (LETT #2# NIL . #5#)
             (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 61)) . #5#)
                  (LETT #1# (QVSIZE |v|) . #5#) G190
                  (COND ((> |i| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (SPADCALL (SPADCALL |d| (QREFELT $ 76))
                                     (QAREF1O |v| |i| 1) (QREFELT $ 109))
                           #2#)
                          . #5#)))
                  (LETT |i| (+ |i| 1) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            |d| $))))) 

(SDEFUN |FRIDEAL;intIdeal| ((|l| |List| A) (|d| R) ($ $))
        (SPROG
         ((|va| (|Vector| A)) (#1=#:G248 NIL) (#2=#:G250 NIL) (|m| NIL)
          (#3=#:G249 NIL) (|invb| (F)) (|a| (A)) (|b| (R)) (|g| (R)) (|r| (R))
          (|nr| (|List| A)) (|lr| (|List| R)) (|u| (|Union| F "failed"))
          (#4=#:G247 NIL) (|x| NIL))
         (SEQ (LETT |lr| NIL . #5=(|FRIDEAL;intIdeal|)) (LETT |nr| NIL . #5#)
              (SEQ (LETT |x| NIL . #5#)
                   (LETT #4# (SPADCALL |l| (QREFELT $ 116)) . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 33)) . #5#)
                        (EXIT
                         (COND
                          ((QEQCAR |u| 0)
                           (LETT |lr|
                                 (CONS (SPADCALL (QCDR |u|) (QREFELT $ 48))
                                       |lr|)
                                 . #5#))
                          ('T (LETT |nr| (CONS |x| |nr|) . #5#)))))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (LETT |r| (SPADCALL |lr| (QREFELT $ 50)) . #5#)
              (LETT |g| (|FRIDEAL;agcd| |nr| $) . #5#)
              (LETT |a|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL |r|
                                (LETT |b|
                                      (SPADCALL
                                       (SPADCALL |d| |r| (QREFELT $ 41)) |g|
                                       (QREFELT $ 41))
                                      . #5#)
                                (QREFELT $ 117))
                      (QREFELT $ 76))
                     (QREFELT $ 77))
                    . #5#)
              (LETT |d| (SPADCALL |d| |b| (QREFELT $ 117)) . #5#)
              (COND
               ((SPADCALL |r| (|spadConstant| $ 40) (QREFELT $ 118))
                (COND
                 ((QEQCAR (SPADCALL |g| |r| (QREFELT $ 74)) 0)
                  (EXIT (|FRIDEAL;mkIdeal| (VECTOR |a|) |d| $))))))
              (LETT |invb|
                    (SPADCALL (SPADCALL |b| (QREFELT $ 76)) (QREFELT $ 119))
                    . #5#)
              (LETT |va|
                    (PROGN
                     (LETT #3# (GETREFV (SIZE |nr|)) . #5#)
                     (SEQ (LETT |m| NIL . #5#) (LETT #2# |nr| . #5#)
                          (LETT #1# 0 . #5#) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |m| (CAR #2#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT #3# #1#
                                    (SPADCALL |invb| |m| (QREFELT $ 109)))))
                          (LETT #1#
                                (PROG1 (|inc_SI| #1#)
                                  (LETT #2# (CDR #2#) . #5#))
                                . #5#)
                          (GO G190) G191 (EXIT NIL))
                     #3#)
                    . #5#)
              (EXIT
               (COND
                ((SPADCALL |a| (QREFELT $ 120)) (|FRIDEAL;mkIdeal| |va| |d| $))
                ('T
                 (|FRIDEAL;mkIdeal| (SPADCALL |a| |va| (QREFELT $ 121)) |d|
                  $))))))) 

(SDEFUN |FRIDEAL;vgcd| ((|v| |Vector| F) ($ R))
        (SPROG ((#1=#:G254 NIL) (|i| NIL) (#2=#:G253 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|FRIDEAL;vgcd|))
                  (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 122)) . #3#)
                       (LETT #1# (QVSIZE |v|) . #3#) G190
                       (COND ((> |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (SPADCALL (SPADCALL |v| |i| (QREFELT $ 123))
                                          (QREFELT $ 48))
                                #2#)
                               . #3#)))
                       (LETT |i| (+ |i| 1) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 50))))) 

(SDEFUN |FRIDEAL;poly| ((|i| $) ($ |SparseUnivariatePolynomial| A))
        (SPROG
         ((#1=#:G256 NIL) (#2=#:G255 #3=(|SparseUnivariatePolynomial| A))
          (#4=#:G257 #3#) (#5=#:G260 NIL) (|m| (|Integer|)) (|v| (|Vector| A)))
         (SEQ
          (LETT |m|
                (SPADCALL
                 (LETT |v| (SPADCALL |i| (QREFELT $ 17)) . #6=(|FRIDEAL;poly|))
                 (QREFELT $ 61))
                . #6#)
          (EXIT
           (PROGN
            (LETT #1# NIL . #6#)
            (SEQ (LETT |i| 0 . #6#) (LETT #5# (- (QVSIZE |v|) 1) . #6#) G190
                 (COND ((|greater_SI| |i| #5#) (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #4#
                          (SPADCALL (QAREF1O |v| (+ |i| |m|) 1) |i|
                                    (QREFELT $ 62))
                          . #6#)
                    (COND
                     (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 63)) . #6#))
                     ('T (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                 (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|spadConstant| $ 59)))))))) 

(SDEFUN |FRIDEAL;*;3$;19| ((|i1| $) (|i2| $) ($ $))
        (|FRIDEAL;intIdeal|
         (SPADCALL
          (SPADCALL (|FRIDEAL;poly| |i1| $) (|FRIDEAL;poly| |i2| $)
                    (QREFELT $ 124))
          (QREFELT $ 125))
         (SPADCALL (SPADCALL |i1| (QREFELT $ 18))
                   (SPADCALL |i2| (QREFELT $ 18)) (QREFELT $ 126))
         $)) 

(SDEFUN |FRIDEAL;^;$I$;20| ((|i| $) (|m| |Integer|) ($ $))
        (SPROG
         ((#1=#:G268 NIL) (|j| NIL) (#2=#:G267 NIL) (|v| (|Vector| A))
          (|n| (|NonNegativeInteger|)) (#3=#:G263 NIL))
         (SEQ
          (COND
           ((< |m| 0)
            (SPADCALL (SPADCALL |i| (QREFELT $ 111)) (- |m|) (QREFELT $ 128)))
           ('T
            (SEQ
             (LETT |n|
                   (PROG1 (LETT #3# |m| . #4=(|FRIDEAL;^;$I$;20|))
                     (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #3#))
                   . #4#)
             (LETT |v| (SPADCALL |i| (QREFELT $ 17)) . #4#)
             (EXIT
              (|FRIDEAL;intIdeal|
               (PROGN
                (LETT #2# NIL . #4#)
                (SEQ (LETT |j| (SPADCALL |v| (QREFELT $ 61)) . #4#)
                     (LETT #1# (QVSIZE |v|) . #4#) G190
                     (COND ((> |j| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2#
                             (CONS
                              (SPADCALL (QAREF1O |v| |j| 1) |n|
                                        (QREFELT $ 129))
                              #2#)
                             . #4#)))
                     (LETT |j| (+ |j| 1) . #4#) (GO G190) G191
                     (EXIT (NREVERSE #2#))))
               (SPADCALL (SPADCALL |i| (QREFELT $ 18)) |n| (QREFELT $ 130))
               $)))))))) 

(SDEFUN |FRIDEAL;num2O| ((|v| |Vector| A) ($ |OutputForm|))
        (SPROG ((#1=#:G272 NIL) (|i| NIL) (#2=#:G271 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|FRIDEAL;num2O|))
                  (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 61)) . #3#)
                       (LETT #1# (QVSIZE |v|) . #3#) G190
                       (COND ((> |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (SPADCALL (QAREF1O |v| |i| 1) (QREFELT $ 132))
                                #2#)
                               . #3#)))
                       (LETT |i| (+ |i| 1) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 133))))) 

(SDEFUN |FRIDEAL;basis;$V;22| ((|i| $) ($ |Vector| A))
        (SPROG
         ((#1=#:G277 NIL) (#2=#:G279 NIL) (|j| NIL) (#3=#:G278 NIL) (|d| (F))
          (|v| (|Vector| A)))
         (SEQ
          (LETT |v| (SPADCALL |i| (QREFELT $ 17)) . #4=(|FRIDEAL;basis;$V;22|))
          (LETT |d|
                (SPADCALL
                 (SPADCALL (SPADCALL |i| (QREFELT $ 18)) (QREFELT $ 76))
                 (QREFELT $ 119))
                . #4#)
          (EXIT
           (PROGN
            (LETT #3#
                  (GETREFV
                   (|inc_SI|
                    (- #5=(QVSIZE |v|) #6=(SPADCALL |v| (QREFELT $ 61)))))
                  . #4#)
            (SEQ (LETT |j| #6# . #4#) (LETT #2# #5# . #4#) (LETT #1# 0 . #4#)
                 G190 (COND ((> |j| #2#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SETELT #3# #1#
                           (SPADCALL |d| (QAREF1O |v| |j| 1)
                                     (QREFELT $ 109)))))
                 (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |j| (+ |j| 1) . #4#))
                       . #4#)
                 (GO G190) G191 (EXIT NIL))
            #3#))))) 

(SDEFUN |FRIDEAL;coerce;$Of;23| ((|i| $) ($ |OutputForm|))
        (SPROG ((|nm| (|OutputForm|)))
               (SEQ
                (LETT |nm| (|FRIDEAL;num2O| (SPADCALL |i| (QREFELT $ 17)) $)
                      |FRIDEAL;coerce;$Of;23|)
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |i| (QREFELT $ 18))
                             (|spadConstant| $ 12) (QREFELT $ 37))
                   |nm|)
                  ('T
                   (SPADCALL
                    (SPADCALL (SPADCALL 1 (QREFELT $ 135))
                              (SPADCALL (SPADCALL |i| (QREFELT $ 18))
                                        (QREFELT $ 136))
                              (QREFELT $ 137))
                    |nm| (QREFELT $ 138)))))))) 

(SDEFUN |FRIDEAL;randomLC;NniVA;24|
        ((|m| |NonNegativeInteger|) (|v| |Vector| A) ($ A))
        (SPROG
         ((#1=#:G284 NIL) (#2=#:G283 (A)) (#3=#:G285 (A)) (#4=#:G287 NIL)
          (|j| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|FRIDEAL;randomLC;NniVA;24|))
           (SEQ (LETT |j| (SPADCALL |v| (QREFELT $ 61)) . #5#)
                (LETT #4# (QVSIZE |v|) . #5#) G190
                (COND ((> |j| #4#) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (SPADCALL (QREFELT $ 140))
                                   (QAREF1O |v| |j| 1) (QREFELT $ 109))
                         . #5#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 141)) . #5#))
                    ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 142))))))) 

(SDEFUN |FRIDEAL;randomLC;NniVA;25|
        ((|m| |NonNegativeInteger|) (|v| |Vector| A) ($ A))
        (SPROG
         ((#1=#:G289 NIL) (#2=#:G288 (A)) (#3=#:G290 (A)) (#4=#:G292 NIL)
          (|j| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|FRIDEAL;randomLC;NniVA;25|))
           (SEQ (LETT |j| (SPADCALL |v| (QREFELT $ 61)) . #5#)
                (LETT #4# (QVSIZE |v|) . #5#) G190
                (COND ((> |j| #4#) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (RANDOM |m|) (QAREF1O |v| |j| 1)
                                   (QREFELT $ 143))
                         . #5#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 141)) . #5#))
                    ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 142))))))) 

(SDEFUN |FRIDEAL;minimize;2$;26| ((|i| $) ($ $))
        (SPROG
         ((#1=#:G301 NIL) (#2=#:G302 NIL) (|u| (|Union| $ "failed"))
          (|range| NIL) (|nrm| (R)) (|n| (|NonNegativeInteger|))
          (|nm| (|Vector| A)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n|
                  (QVSIZE
                   (LETT |nm| (SPADCALL |i| (QREFELT $ 17))
                         . #3=(|FRIDEAL;minimize;2$;26|)))
                  . #3#)
            (COND ((EQL |n| 1) (EXIT |i|))
                  ((< |n| 3) (COND ((|FRIDEAL;ret?| |nm| $) (EXIT |i|)))))
            (LETT |nrm|
                  (SPADCALL
                   (SPADCALL (|FRIDEAL;mkIdeal| |nm| (|spadConstant| $ 12) $)
                             (QREFELT $ 70))
                   (QREFELT $ 48))
                  . #3#)
            (SEQ
             (EXIT
              (SEQ (LETT |range| 1 . #3#) G190
                   (COND ((|greater_SI| |range| 5) (GO G191)))
                   (SEQ
                    (LETT |u| (|FRIDEAL;tryRange| |range| |nm| |nrm| |i| $)
                          . #3#)
                    (EXIT
                     (COND
                      ((QEQCAR |u| 0)
                       (PROGN
                        (LETT #1#
                              (PROGN
                               (LETT #2# (QCDR |u|) . #3#)
                               (GO #4=#:G300))
                              . #3#)
                        (GO #5=#:G298))))))
                   (LETT |range| (|inc_SI| |range|) . #3#) (GO G190) G191
                   (EXIT NIL)))
             #5# (EXIT #1#))
            (EXIT |i|)))
          #4# (EXIT #2#)))) 

(DECLAIM (NOTINLINE |FractionalIdeal;|)) 

(DEFUN |FractionalIdeal| (&REST #1=#:G303)
  (SPROG NIL
         (PROG (#2=#:G304)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FractionalIdeal|)
                                               '|domainEqualList|)
                    . #3=(|FractionalIdeal|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FractionalIdeal;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FractionalIdeal|)))))))))) 

(DEFUN |FractionalIdeal;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|FractionalIdeal|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|FractionalIdeal| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 148) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|FractionalIdeal|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 10 (|Record| (|:| |num| (|Vector| |#4|)) (|:| |den| |#1|)))
    (COND
     ((|HasCategory| |#2| '(|Finite|))
      (QSETREFV $ 72
                (CONS (|dispatchFunction| |FRIDEAL;randomLC;NniVA;24|) $)))
     ('T
      (QSETREFV $ 72
                (CONS (|dispatchFunction| |FRIDEAL;randomLC;NniVA;25|) $))))
    $))) 

(MAKEPROP '|FractionalIdeal| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) '|Rep|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |FRIDEAL;One;$;1|) $))
              (0 . |One|) (4 . |One|) (8 . |One|) (12 . |One|) (|Vector| 9)
              |FRIDEAL;numer;$V;2| |FRIDEAL;denom;$R;3| (|Matrix| 7)
              (16 . |transpose|) (|Vector| 7) (21 . |coordinates|) (26 . *)
              (32 . |represents|) (|NonNegativeInteger|) (37 . |monomial|)
              (43 . |regularRepresentation|) (|Matrix| 8) (|Mapping| 8 7)
              (|MatrixCategoryFunctions2| 7 21 21 19 8 (|Vector| 8)
                                          (|Vector| 8) 28)
              (48 . |map|) (|Union| 7 '"failed") (54 . |retractIfCan|)
              (|Boolean|) (|Mapping| 34 9) (59 . |any?|) (65 . =) (71 . =)
              |FRIDEAL;=;2$B;8| (77 . |Zero|) (81 . |gcd|) (|Mapping| 6 6 6)
              (|List| 6) (87 . |reduce|) (94 . |determinant|) (|List| 7)
              (99 . |coefficients|) (104 . |retract|) (|List| $) (109 . |gcd|)
              (|PositiveInteger|) (114 . |rank|) (118 . ^) (124 . /)
              (130 . |characteristic|) (134 . |Zero|) (138 . >)
              (|SparseUnivariatePolynomial| 9) (144 . |Zero|) (|Integer|)
              (148 . |minIndex|) (153 . |monomial|) (159 . +)
              (|SingletonAsOrderedSet|) (165 . |create|) (169 . |coerce|)
              (174 . |eval|) (181 . |retract|) (186 . |norm|)
              |FRIDEAL;norm;$F;11| (191 . *) (197 . |randomLC|)
              (|Union| $ '"failed") (203 . |exquo|) (209 . |unit?|)
              (214 . |coerce|) (219 . |coerce|) (224 . +) (|Mapping| 28 28 28)
              (|List| 28) (230 . |reduce|) (|Fraction| 8) (236 . |coerce|)
              (|Matrix| 82) (|Mapping| 82 8)
              (|MatrixCategoryFunctions2| 8 (|Vector| 8) (|Vector| 8) 28 82
                                          (|Vector| 82) (|Vector| 82) 84)
              (241 . |map|) (247 . |inverse|) (252 . |coerce|) (257 . *)
              (|Record| (|:| |num| 28) (|:| |den| 8))
              (|MatrixCommonDenominator| 8 82) (263 . |splitDenominator|)
              (|Record| (|:| |num| 43) (|:| |den| 6))
              (|InnerCommonDenominator| 6 7 43 46) (268 . |splitDenominator|)
              (273 . |reduce|) (|List| 8) (279 . |parts|) (284 . |degree|)
              (289 . |max|) (|Mapping| 25 25 25) (|List| 25) (295 . |reduce|)
              (301 . |coefficient|) (|Mapping| 7 8)
              (|MatrixCategoryFunctions2| 8 (|Vector| 8) (|Vector| 8) 28 7 21
                                          21 19)
              (307 . |map|) (313 . *) |FRIDEAL;ideal;V$;15| |FRIDEAL;inv;2$;14|
              (|CommonDenominator| 6 7 21) (319 . |commonDenominator|)
              (324 . |lcm|) (|List| 9) (330 . |removeDuplicates|) (335 . |quo|)
              (341 . ~=) (347 . |inv|) (352 . |zero?|) (357 . |concat|)
              (363 . |minIndex|) (368 . |elt|) (374 . *) (380 . |coefficients|)
              (385 . *) |FRIDEAL;*;3$;19| |FRIDEAL;^;$I$;20| (391 . ^)
              (397 . ^) (|OutputForm|) (403 . |coerce|) (408 . |paren|)
              |FRIDEAL;basis;$V;22| (413 . |coerce|) (418 . |coerce|) (423 . /)
              (429 . *) |FRIDEAL;coerce;$Of;23| (435 . |random|) (439 . +)
              (445 . |Zero|) (449 . *) |FRIDEAL;minimize;2$;26| (|HashState|)
              (|String|) (|SingleInteger|))
           '#(~= 455 |sample| 461 |recip| 465 |randomLC| 470 |one?| 476 |numer|
              481 |norm| 486 |minimize| 491 |latex| 496 |inv| 501 |ideal| 506
              |hashUpdate!| 511 |hash| 517 |denom| 522 |conjugate| 527
              |commutator| 533 |coerce| 539 |basis| 544 ^ 549 |One| 567 = 571 /
              577 * 583)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0))
                 (CONS
                  '#(|Group&| |Monoid&| |SemiGroup&| |SetCategory&|
                     |BasicType&| NIL NIL)
                  (CONS
                   '#((|Group|) (|Monoid|) (|SemiGroup|) (|SetCategory|)
                      (|BasicType|) (|unitsKnown|) (|CoercibleTo| 131))
                   (|makeByteWordVec2| 147
                                       '(0 6 0 12 0 7 0 13 0 8 0 14 0 9 0 15 1
                                         19 0 0 20 1 9 21 0 22 2 19 21 0 21 23
                                         1 9 0 21 24 2 8 0 7 25 26 1 9 19 0 27
                                         2 30 28 29 19 31 1 9 32 0 33 2 16 34
                                         35 0 36 2 6 34 0 0 37 2 16 34 0 0 38 0
                                         6 0 40 2 6 0 0 0 41 3 43 6 42 0 6 44 1
                                         28 8 0 45 1 8 46 0 47 1 7 6 0 48 1 6 0
                                         49 50 0 9 51 52 2 6 0 0 51 53 2 7 0 6
                                         6 54 0 9 25 55 0 7 0 56 2 25 34 0 0 57
                                         0 58 0 59 1 16 60 0 61 2 58 0 9 25 62
                                         2 58 0 0 0 63 0 64 0 65 1 9 0 60 66 3
                                         58 0 0 64 9 67 1 58 9 0 68 1 9 7 0 69
                                         2 25 0 51 0 71 2 0 9 25 16 72 2 6 73 0
                                         0 74 1 6 34 0 75 1 7 0 6 76 1 9 0 7 77
                                         2 28 0 0 0 78 2 80 28 79 0 81 1 82 0 8
                                         83 2 86 84 85 28 87 1 84 73 0 88 1 8 0
                                         7 89 2 84 0 82 0 90 1 92 91 84 93 1 95
                                         94 46 96 2 43 6 42 0 97 1 28 98 0 99 1
                                         8 25 0 100 2 25 0 0 0 101 2 103 25 102
                                         0 104 2 8 7 0 25 105 2 107 19 106 28
                                         108 2 9 0 7 0 109 1 112 6 21 113 2 6 0
                                         0 0 114 1 115 0 0 116 2 6 0 0 0 117 2
                                         6 34 0 0 118 1 7 0 0 119 1 9 34 0 120
                                         2 16 0 9 0 121 1 21 60 0 122 2 21 7 0
                                         60 123 2 58 0 0 0 124 1 58 115 0 125 2
                                         6 0 0 0 126 2 9 0 0 25 129 2 6 0 0 25
                                         130 1 9 131 0 132 1 131 0 49 133 1 60
                                         131 0 135 1 6 131 0 136 2 131 0 0 0
                                         137 2 131 0 0 0 138 0 7 0 140 2 9 0 0
                                         0 141 0 9 0 142 2 9 0 60 0 143 2 0 34
                                         0 0 1 0 0 0 1 1 0 73 0 1 2 0 9 25 16
                                         72 1 0 34 0 1 1 0 16 0 17 1 0 7 0 70 1
                                         0 0 0 144 1 0 146 0 1 1 0 0 0 111 1 0
                                         0 16 110 2 0 145 145 0 1 1 0 147 0 1 1
                                         0 6 0 18 2 0 0 0 0 1 2 0 0 0 0 1 1 0
                                         131 0 139 1 0 16 0 134 2 0 0 0 60 128
                                         2 0 0 0 25 1 2 0 0 0 51 1 0 0 0 11 2 0
                                         34 0 0 39 2 0 0 0 0 1 2 0 0 0 0
                                         127)))))
           '|lookupComplete|)) 
