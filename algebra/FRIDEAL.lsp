
(SDEFUN |FRIDEAL;One;$;1| (($ $))
        (CONS (VECTOR (|spadConstant| $ 13)) (|spadConstant| $ 12))) 

(PUT '|FRIDEAL;numer;$V;2| '|SPADreplace| 'QCAR) 

(SDEFUN |FRIDEAL;numer;$V;2| ((|i| $) ($ |Vector| A)) (QCAR |i|)) 

(PUT '|FRIDEAL;denom;$R;3| '|SPADreplace| 'QCDR) 

(SDEFUN |FRIDEAL;denom;$R;3| ((|i| $) ($ R)) (QCDR |i|)) 

(PUT '|FRIDEAL;mkIdeal| '|SPADreplace| 'CONS) 

(SDEFUN |FRIDEAL;mkIdeal| ((|v| |Vector| A) (|d| R) ($ $)) (CONS |v| |d|)) 

(SDEFUN |FRIDEAL;invrep| ((|m| |Matrix| F) ($ A))
        (SPADCALL
         (SPADCALL (SPADCALL |m| (QREFELT $ 18))
                   (SPADCALL (|spadConstant| $ 13) (QREFELT $ 20))
                   (QREFELT $ 21))
         (QREFELT $ 22))) 

(SDEFUN |FRIDEAL;upmat| ((|x| A) (|i| |NonNegativeInteger|) ($ |Matrix| UP))
        (SPROG NIL
               (SPADCALL (CONS #'|FRIDEAL;upmat!0| (VECTOR $ |i|))
                         (SPADCALL (SPADCALL |x| (QREFELT $ 25))
                                   (QREFELT $ 18))
                         (QREFELT $ 29)))) 

(SDEFUN |FRIDEAL;upmat!0| ((|s| NIL) ($$ NIL))
        (PROG (|i| $)
          (LETT |i| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |s| |i| (QREFELT $ 24)))))) 

(SDEFUN |FRIDEAL;ret?| ((|v| |Vector| A) ($ |Boolean|))
        (SPADCALL (CONS #'|FRIDEAL;ret?!0| $) |v| (QREFELT $ 34))) 

(SDEFUN |FRIDEAL;ret?!0| ((|s| NIL) ($ NIL))
        (QEQCAR (SPADCALL |s| (QREFELT $ 31)) 0)) 

(SDEFUN |FRIDEAL;=;2$B;8| ((|x| $) (|y| $) ($ |Boolean|))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 16)) (SPADCALL |y| (QREFELT $ 16))
                    (QREFELT $ 35))
          (SPADCALL (SPADCALL |x| (QREFELT $ 15)) (SPADCALL |y| (QREFELT $ 15))
                    (QREFELT $ 36)))
         ('T NIL))) 

(SDEFUN |FRIDEAL;agcd| ((|l| |List| A) ($ R))
        (SPROG ((#1=#:G134 NIL) (|a| NIL) (#2=#:G133 NIL))
               (SEQ
                (SPADCALL (ELT $ 39)
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |a| NIL) (LETT #1# |l|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |a| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (|FRIDEAL;vgcd|
                                          (SPADCALL |a| (QREFELT $ 20)) $)
                                         #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (|spadConstant| $ 38) (QREFELT $ 42))))) 

(SDEFUN |FRIDEAL;oldnorm| ((|i| $) ($ F))
        (SPROG ((#1=#:G144 NIL) (|u| NIL) (#2=#:G143 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #2# NIL)
                   (SEQ (LETT |u| NIL)
                        (LETT #1#
                              (SPADCALL
                               (SPADCALL (|FRIDEAL;summat| |i| $)
                                         (QREFELT $ 43))
                               (QREFELT $ 45)))
                        G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2# (CONS (SPADCALL |u| (QREFELT $ 46)) #2#))))
                        (LETT #1# (CDR #1#)) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (QREFELT $ 48))
                 (SPADCALL (SPADCALL |i| (QREFELT $ 16))
                           (SPADCALL (QREFELT $ 50)) (QREFELT $ 51))
                 (QREFELT $ 52))))) 

(SDEFUN |FRIDEAL;norm;$F;11| ((|i| $) ($ F))
        (SPROG
         ((#1=#:G158 NIL) (|j| NIL) (#2=#:G157 NIL)
          (|dv| (|SingletonAsOrderedSet|))
          (|pp| (|SparseUnivariatePolynomial| A)) (#3=#:G156 NIL)
          (|j0| (|Integer|)) (|chara| (|NonNegativeInteger|)) (|n| (|Integer|))
          (|v| (|Vector| A)))
         (SEQ (LETT |v| (SPADCALL |i| (QREFELT $ 15)))
              (LETT |n| (* (- (QVSIZE |v|) 1) (SPADCALL (QREFELT $ 50))))
              (LETT |chara| (SPADCALL (QREFELT $ 53)))
              (COND
               ((SPADCALL |chara| 0 (QREFELT $ 55))
                (COND ((>= |n| |chara|) (EXIT (|FRIDEAL;oldnorm| |i| $))))))
              (LETT |pp| (|spadConstant| $ 57))
              (LETT |j0| (SPADCALL |v| (QREFELT $ 59)))
              (SEQ (LETT |j| 0) (LETT #3# (- (QVSIZE |v|) 1)) G190
                   (COND ((|greater_SI| |j| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |pp|
                           (SPADCALL |pp|
                                     (SPADCALL (QAREF1O |v| (+ |j0| |j|) 1) |j|
                                               (QREFELT $ 60))
                                     (QREFELT $ 61)))))
                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
              (LETT |dv| (SPADCALL (QREFELT $ 63)))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |j| 0) (LETT #1# |n|) G190
                       (COND ((|greater_SI| |j| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL |pp| |dv|
                                             (SPADCALL |j| (QREFELT $ 64))
                                             (QREFELT $ 65))
                                   (QREFELT $ 66))
                                  (QREFELT $ 67))
                                 (QREFELT $ 46))
                                #2#))))
                       (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 48))
                (SPADCALL (SPADCALL |i| (QREFELT $ 16))
                          (SPADCALL (QREFELT $ 50)) (QREFELT $ 51))
                (QREFELT $ 52)))))) 

(SDEFUN |FRIDEAL;tryRange|
        ((|range| |NonNegativeInteger|) (|nm| |Vector| A) (|nrm| R) (|i| $)
         ($ |Union| $ "failed"))
        (SPROG
         ((#1=#:G169 NIL) (#2=#:G170 NIL) (#3=#:G163 NIL) (|a| (A)) (|j| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |j| 0) G190 (COND ((|greater_SI| |j| 10) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ
                    (LETT |a|
                          (SPADCALL (SPADCALL 10 |range| (QREFELT $ 69)) |nm|
                                    (QREFELT $ 70)))
                    (EXIT
                     (COND
                      ((SPADCALL
                        (SPADCALL
                         (PROG2
                             (LETT #3#
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |a| (QREFELT $ 67))
                                              (QREFELT $ 46))
                                    |nrm| (QREFELT $ 72)))
                             (QCDR #3#)
                           (|check_union2| (QEQCAR #3# 0) (QREFELT $ 6)
                                           (|Union| (QREFELT $ 6) "failed")
                                           #3#))
                         |nrm| (QREFELT $ 39))
                        (QREFELT $ 73))
                       (PROGN
                        (LETT #1#
                              (PROGN
                               (LETT #2#
                                     (CONS 0
                                           (|FRIDEAL;intIdeal|
                                            (LIST
                                             (SPADCALL
                                              (SPADCALL |nrm| (QREFELT $ 74))
                                              (QREFELT $ 75))
                                             |a|)
                                            (SPADCALL |i| (QREFELT $ 16)) $)))
                               (GO #4=#:G168)))
                        (GO #5=#:G165)))))))
                  #5# (EXIT #1#))
                 (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 1 "failed"))))
          #4# (EXIT #2#)))) 

(SDEFUN |FRIDEAL;summat| ((|i| $) ($ |Matrix| UP))
        (SPROG
         ((#1=#:G178 NIL) (|j| NIL) (#2=#:G177 NIL) (|m| (|Integer|))
          (|v| (|Vector| A)))
         (SEQ
          (LETT |m|
                (SPADCALL (LETT |v| (SPADCALL |i| (QREFELT $ 15)))
                          (QREFELT $ 59)))
          (EXIT
           (SPADCALL (ELT $ 76)
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |j| 0) (LETT #1# (- (QVSIZE |v|) 1)) G190
                           (COND ((|greater_SI| |j| #1#) (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (|FRIDEAL;upmat|
                                     (QAREF1O |v| (+ |j| |m|) 1) |j| $)
                                    #2#))))
                           (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 79)))))) 

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
                           (SPADCALL (ELT $ 81) (|FRIDEAL;summat| |i| $)
                                     (QREFELT $ 85))
                           (QREFELT $ 86)))
                    (QCDR #5#)
                  (|check_union2| (QEQCAR #5# 0)
                                  (|Matrix| (|Fraction| (QREFELT $ 8)))
                                  (|Union|
                                   (|Matrix| (|Fraction| (QREFELT $ 8)))
                                   "failed")
                                  #5#)))
          (LETT |cd|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (SPADCALL |i| (QREFELT $ 16)) (QREFELT $ 74))
                    (QREFELT $ 87))
                   (QREFELT $ 81))
                  |m| (QREFELT $ 88))
                 (QREFELT $ 91)))
          (LETT |cd2|
                (SPADCALL (SPADCALL (QCDR |cd|) (QREFELT $ 45))
                          (QREFELT $ 94)))
          (LETT |invd|
                (SPADCALL (QCDR |cd2|)
                          (SPADCALL (ELT $ 39) (QCAR |cd2|) (QREFELT $ 95))
                          (QREFELT $ 52)))
          (LETT |d|
                (SPADCALL (ELT $ 99)
                          (PROGN
                           (LETT #4# NIL)
                           (SEQ (LETT |p| NIL)
                                (LETT #3#
                                      (SPADCALL (QCAR |cd|) (QREFELT $ 97)))
                                G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |p| (CAR #3#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #4#
                                        (CONS (SPADCALL |p| (QREFELT $ 98))
                                              #4#))))
                                (LETT #3# (CDR #3#)) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          (QREFELT $ 102)))
          (EXIT
           (SPADCALL
            (PROGN
             (LETT #2# (GETREFV (|inc_SI| |d|)))
             (SEQ (LETT |j| 0) (LETT #1# |d|) G190
                  (COND ((|greater_SI| |j| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SETELT #2# |j|
                            (SPADCALL |invd|
                                      (|FRIDEAL;invrep|
                                       (SPADCALL
                                        (CONS #'|FRIDEAL;inv;2$;14!0|
                                              (VECTOR $ |j|))
                                        (QCAR |cd|) (QREFELT $ 106))
                                       $)
                                      (QREFELT $ 107)))))
                  (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
             #2#)
            (QREFELT $ 108)))))) 

(SDEFUN |FRIDEAL;inv;2$;14!0| ((|s| NIL) ($$ NIL))
        (PROG (|j| $)
          (LETT |j| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |s| |j| (QREFELT $ 103)))))) 

(SDEFUN |FRIDEAL;ideal;V$;15| ((|v| |Vector| A) ($ $))
        (SPROG
         ((#1=#:G233 NIL) (|i| NIL) (#2=#:G232 NIL) (|d| (R)) (#3=#:G231 NIL)
          (#4=#:G230 NIL))
         (SEQ
          (LETT |d|
                (SPADCALL (ELT $ 112)
                          (PROGN
                           (LETT #4# NIL)
                           (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 59)))
                                (LETT #3# (QVSIZE |v|)) G190
                                (COND ((> |i| #3#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #4#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL (QAREF1O |v| |i| 1)
                                                    (QREFELT $ 20))
                                          (QREFELT $ 111))
                                         #4#))))
                                (LETT |i| (+ |i| 1)) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          (QREFELT $ 95)))
          (EXIT
           (|FRIDEAL;intIdeal|
            (PROGN
             (LETT #2# NIL)
             (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 59)))
                  (LETT #1# (QVSIZE |v|)) G190 (COND ((> |i| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (SPADCALL (SPADCALL |d| (QREFELT $ 74))
                                     (QAREF1O |v| |i| 1) (QREFELT $ 107))
                           #2#))))
                  (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT (NREVERSE #2#))))
            |d| $))))) 

(SDEFUN |FRIDEAL;intIdeal| ((|l| |List| A) (|d| R) ($ $))
        (SPROG
         ((|va| (|Vector| A)) (#1=#:G248 NIL) (#2=#:G250 NIL) (|m| NIL)
          (#3=#:G249 NIL) (|invb| (F)) (|a| (A)) (|b| (R)) (|g| (R)) (|r| (R))
          (|nr| (|List| A)) (|lr| (|List| R)) (|u| (|Union| F "failed"))
          (#4=#:G247 NIL) (|x| NIL))
         (SEQ (LETT |lr| NIL) (LETT |nr| NIL)
              (SEQ (LETT |x| NIL) (LETT #4# (SPADCALL |l| (QREFELT $ 114)))
                   G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 31)))
                        (EXIT
                         (COND
                          ((QEQCAR |u| 0)
                           (LETT |lr|
                                 (CONS (SPADCALL (QCDR |u|) (QREFELT $ 46))
                                       |lr|)))
                          ('T (LETT |nr| (CONS |x| |nr|))))))
                   (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
              (LETT |r| (SPADCALL |lr| (QREFELT $ 48)))
              (LETT |g| (|FRIDEAL;agcd| |nr| $))
              (LETT |a|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL |r|
                                (LETT |b|
                                      (SPADCALL
                                       (SPADCALL |d| |r| (QREFELT $ 39)) |g|
                                       (QREFELT $ 39)))
                                (QREFELT $ 115))
                      (QREFELT $ 74))
                     (QREFELT $ 75)))
              (LETT |d| (SPADCALL |d| |b| (QREFELT $ 115)))
              (COND
               ((SPADCALL |r| (|spadConstant| $ 38) (QREFELT $ 116))
                (COND
                 ((QEQCAR (SPADCALL |g| |r| (QREFELT $ 72)) 0)
                  (EXIT (|FRIDEAL;mkIdeal| (VECTOR |a|) |d| $))))))
              (LETT |invb|
                    (SPADCALL (SPADCALL |b| (QREFELT $ 74)) (QREFELT $ 117)))
              (LETT |va|
                    (PROGN
                     (LETT #3# (GETREFV (SIZE |nr|)))
                     (SEQ (LETT |m| NIL) (LETT #2# |nr|) (LETT #1# 0) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |m| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT #3# #1#
                                    (SPADCALL |invb| |m| (QREFELT $ 107)))))
                          (LETT #1#
                                (PROG1 (|inc_SI| #1#) (LETT #2# (CDR #2#))))
                          (GO G190) G191 (EXIT NIL))
                     #3#))
              (EXIT
               (COND
                ((SPADCALL |a| (QREFELT $ 118)) (|FRIDEAL;mkIdeal| |va| |d| $))
                ('T
                 (|FRIDEAL;mkIdeal| (SPADCALL |a| |va| (QREFELT $ 119)) |d|
                  $))))))) 

(SDEFUN |FRIDEAL;vgcd| ((|v| |Vector| F) ($ R))
        (SPROG ((#1=#:G254 NIL) (|i| NIL) (#2=#:G253 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 120)))
                       (LETT #1# (QVSIZE |v|)) G190
                       (COND ((> |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (SPADCALL (SPADCALL |v| |i| (QREFELT $ 121))
                                          (QREFELT $ 46))
                                #2#))))
                       (LETT |i| (+ |i| 1)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 48))))) 

(SDEFUN |FRIDEAL;poly| ((|i| $) ($ |SparseUnivariatePolynomial| A))
        (SPROG
         ((#1=#:G256 NIL) (#2=#:G255 #3=(|SparseUnivariatePolynomial| A))
          (#4=#:G257 #3#) (#5=#:G260 NIL) (|m| (|Integer|)) (|v| (|Vector| A)))
         (SEQ
          (LETT |m|
                (SPADCALL (LETT |v| (SPADCALL |i| (QREFELT $ 15)))
                          (QREFELT $ 59)))
          (EXIT
           (PROGN
            (LETT #1# NIL)
            (SEQ (LETT |i| 0) (LETT #5# (- (QVSIZE |v|) 1)) G190
                 (COND ((|greater_SI| |i| #5#) (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #4#
                          (SPADCALL (QAREF1O |v| (+ |i| |m|) 1) |i|
                                    (QREFELT $ 60)))
                    (COND (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 61))))
                          ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|spadConstant| $ 57)))))))) 

(SDEFUN |FRIDEAL;*;3$;19| ((|i1| $) (|i2| $) ($ $))
        (|FRIDEAL;intIdeal|
         (SPADCALL
          (SPADCALL (|FRIDEAL;poly| |i1| $) (|FRIDEAL;poly| |i2| $)
                    (QREFELT $ 122))
          (QREFELT $ 123))
         (SPADCALL (SPADCALL |i1| (QREFELT $ 16))
                   (SPADCALL |i2| (QREFELT $ 16)) (QREFELT $ 124))
         $)) 

(SDEFUN |FRIDEAL;^;$I$;20| ((|i| $) (|m| |Integer|) ($ $))
        (SPROG
         ((#1=#:G268 NIL) (|j| NIL) (#2=#:G267 NIL) (|v| (|Vector| A))
          (|n| (|NonNegativeInteger|)) (#3=#:G263 NIL))
         (SEQ
          (COND
           ((< |m| 0)
            (SPADCALL (SPADCALL |i| (QREFELT $ 109)) (- |m|) (QREFELT $ 126)))
           ('T
            (SEQ
             (LETT |n|
                   (PROG1 (LETT #3# |m|)
                     (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #3#)))
             (LETT |v| (SPADCALL |i| (QREFELT $ 15)))
             (EXIT
              (|FRIDEAL;intIdeal|
               (PROGN
                (LETT #2# NIL)
                (SEQ (LETT |j| (SPADCALL |v| (QREFELT $ 59)))
                     (LETT #1# (QVSIZE |v|)) G190
                     (COND ((> |j| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2#
                             (CONS
                              (SPADCALL (QAREF1O |v| |j| 1) |n|
                                        (QREFELT $ 127))
                              #2#))))
                     (LETT |j| (+ |j| 1)) (GO G190) G191
                     (EXIT (NREVERSE #2#))))
               (SPADCALL (SPADCALL |i| (QREFELT $ 16)) |n| (QREFELT $ 128))
               $)))))))) 

(SDEFUN |FRIDEAL;num2O| ((|v| |Vector| A) ($ |OutputForm|))
        (SPROG ((#1=#:G272 NIL) (|i| NIL) (#2=#:G271 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 59)))
                       (LETT #1# (QVSIZE |v|)) G190
                       (COND ((> |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (SPADCALL (QAREF1O |v| |i| 1) (QREFELT $ 130))
                                #2#))))
                       (LETT |i| (+ |i| 1)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 131))))) 

(SDEFUN |FRIDEAL;basis;$V;22| ((|i| $) ($ |Vector| A))
        (SPROG
         ((#1=#:G277 NIL) (#2=#:G279 NIL) (|j| NIL) (#3=#:G278 NIL) (|d| (F))
          (|v| (|Vector| A)))
         (SEQ (LETT |v| (SPADCALL |i| (QREFELT $ 15)))
              (LETT |d|
                    (SPADCALL
                     (SPADCALL (SPADCALL |i| (QREFELT $ 16)) (QREFELT $ 74))
                     (QREFELT $ 117)))
              (EXIT
               (PROGN
                (LETT #3#
                      (GETREFV
                       (|inc_SI|
                        (- #4=(QVSIZE |v|) #5=(SPADCALL |v| (QREFELT $ 59))))))
                (SEQ (LETT |j| #5#) (LETT #2# #4#) (LETT #1# 0) G190
                     (COND ((> |j| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SETELT #3# #1#
                               (SPADCALL |d| (QAREF1O |v| |j| 1)
                                         (QREFELT $ 107)))))
                     (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |j| (+ |j| 1))))
                     (GO G190) G191 (EXIT NIL))
                #3#))))) 

(SDEFUN |FRIDEAL;coerce;$Of;23| ((|i| $) ($ |OutputForm|))
        (SPROG ((|nm| (|OutputForm|)))
               (SEQ
                (LETT |nm| (|FRIDEAL;num2O| (SPADCALL |i| (QREFELT $ 15)) $))
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |i| (QREFELT $ 16))
                             (|spadConstant| $ 12) (QREFELT $ 35))
                   |nm|)
                  ('T
                   (SPADCALL
                    (SPADCALL (SPADCALL 1 (QREFELT $ 133))
                              (SPADCALL (SPADCALL |i| (QREFELT $ 16))
                                        (QREFELT $ 134))
                              (QREFELT $ 135))
                    |nm| (QREFELT $ 136)))))))) 

(SDEFUN |FRIDEAL;randomLC;NniVA;24|
        ((|m| |NonNegativeInteger|) (|v| |Vector| A) ($ A))
        (SPROG
         ((#1=#:G284 NIL) (#2=#:G283 (A)) (#3=#:G285 (A)) (#4=#:G287 NIL)
          (|j| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |j| (SPADCALL |v| (QREFELT $ 59)))
                (LETT #4# (QVSIZE |v|)) G190 (COND ((> |j| #4#) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (SPADCALL (QREFELT $ 138))
                                   (QAREF1O |v| |j| 1) (QREFELT $ 107)))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 139))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 140))))))) 

(SDEFUN |FRIDEAL;randomLC;NniVA;25|
        ((|m| |NonNegativeInteger|) (|v| |Vector| A) ($ A))
        (SPROG
         ((#1=#:G289 NIL) (#2=#:G288 (A)) (#3=#:G290 (A)) (#4=#:G292 NIL)
          (|j| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |j| (SPADCALL |v| (QREFELT $ 59)))
                (LETT #4# (QVSIZE |v|)) G190 (COND ((> |j| #4#) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (RANDOM |m|) (QAREF1O |v| |j| 1)
                                   (QREFELT $ 141)))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 139))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 140))))))) 

(SDEFUN |FRIDEAL;minimize;2$;26| ((|i| $) ($ $))
        (SPROG
         ((#1=#:G301 NIL) (#2=#:G302 NIL) (|u| (|Union| $ "failed"))
          (|range| NIL) (|nrm| (R)) (|n| (|NonNegativeInteger|))
          (|nm| (|Vector| A)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (QVSIZE (LETT |nm| (SPADCALL |i| (QREFELT $ 15)))))
                (COND ((EQL |n| 1) (EXIT |i|))
                      ((< |n| 3) (COND ((|FRIDEAL;ret?| |nm| $) (EXIT |i|)))))
                (LETT |nrm|
                      (SPADCALL
                       (SPADCALL
                        (|FRIDEAL;mkIdeal| |nm| (|spadConstant| $ 12) $)
                        (QREFELT $ 68))
                       (QREFELT $ 46)))
                (SEQ
                 (EXIT
                  (SEQ (LETT |range| 1) G190
                       (COND ((|greater_SI| |range| 5) (GO G191)))
                       (SEQ
                        (LETT |u|
                              (|FRIDEAL;tryRange| |range| |nm| |nrm| |i| $))
                        (EXIT
                         (COND
                          ((QEQCAR |u| 0)
                           (PROGN
                            (LETT #1#
                                  (PROGN (LETT #2# (QCDR |u|)) (GO #3=#:G300)))
                            (GO #4=#:G298))))))
                       (LETT |range| (|inc_SI| |range|)) (GO G190) G191
                       (EXIT NIL)))
                 #4# (EXIT #1#))
                (EXIT |i|)))
          #3# (EXIT #2#)))) 

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
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FractionalIdeal;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FractionalIdeal|)))))))))) 

(DEFUN |FractionalIdeal;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|FractionalIdeal| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 146))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
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
      (QSETREFV $ 70
                (CONS (|dispatchFunction| |FRIDEAL;randomLC;NniVA;24|) $)))
     ('T
      (QSETREFV $ 70
                (CONS (|dispatchFunction| |FRIDEAL;randomLC;NniVA;25|) $))))
    $))) 

(MAKEPROP '|FractionalIdeal| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) '|Rep|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |FRIDEAL;One;$;1|) $))
              (0 . |One|) (4 . |One|) (|Vector| 9) |FRIDEAL;numer;$V;2|
              |FRIDEAL;denom;$R;3| (|Matrix| 7) (8 . |transpose|) (|Vector| 7)
              (13 . |coordinates|) (18 . *) (24 . |represents|)
              (|NonNegativeInteger|) (29 . |monomial|)
              (35 . |regularRepresentation|) (|Matrix| 8) (|Mapping| 8 7)
              (|MatrixCategoryFunctions2| 7 19 19 17 8 (|Vector| 8)
                                          (|Vector| 8) 26)
              (40 . |map|) (|Union| 7 '"failed") (46 . |retractIfCan|)
              (|Boolean|) (|Mapping| 32 9) (51 . |any?|) (57 . =) (63 . =)
              |FRIDEAL;=;2$B;8| (69 . |Zero|) (73 . |gcd|) (|Mapping| 6 6 6)
              (|List| 6) (79 . |reduce|) (86 . |determinant|) (|List| 7)
              (91 . |coefficients|) (96 . |retract|) (|List| $) (101 . |gcd|)
              (|PositiveInteger|) (106 . |rank|) (110 . ^) (116 . /)
              (122 . |characteristic|) (126 . |Zero|) (130 . >)
              (|SparseUnivariatePolynomial| 9) (136 . |Zero|) (|Integer|)
              (140 . |minIndex|) (145 . |monomial|) (151 . +)
              (|SingletonAsOrderedSet|) (157 . |create|) (161 . |coerce|)
              (166 . |eval|) (173 . |retract|) (178 . |norm|)
              |FRIDEAL;norm;$F;11| (183 . *) (189 . |randomLC|)
              (|Union| $ '"failed") (195 . |exquo|) (201 . |unit?|)
              (206 . |coerce|) (211 . |coerce|) (216 . +) (|Mapping| 26 26 26)
              (|List| 26) (222 . |reduce|) (|Fraction| 8) (228 . |coerce|)
              (|Matrix| 80) (|Mapping| 80 8)
              (|MatrixCategoryFunctions2| 8 (|Vector| 8) (|Vector| 8) 26 80
                                          (|Vector| 80) (|Vector| 80) 82)
              (233 . |map|) (239 . |inverse|) (244 . |coerce|) (249 . *)
              (|Record| (|:| |num| 26) (|:| |den| 8))
              (|MatrixCommonDenominator| 8 80) (255 . |splitDenominator|)
              (|Record| (|:| |num| 41) (|:| |den| 6))
              (|InnerCommonDenominator| 6 7 41 44) (260 . |splitDenominator|)
              (265 . |reduce|) (|List| 8) (271 . |parts|) (276 . |degree|)
              (281 . |max|) (|Mapping| 23 23 23) (|List| 23) (287 . |reduce|)
              (293 . |coefficient|) (|Mapping| 7 8)
              (|MatrixCategoryFunctions2| 8 (|Vector| 8) (|Vector| 8) 26 7 19
                                          19 17)
              (299 . |map|) (305 . *) |FRIDEAL;ideal;V$;15| |FRIDEAL;inv;2$;14|
              (|CommonDenominator| 6 7 19) (311 . |commonDenominator|)
              (316 . |lcm|) (|List| 9) (322 . |removeDuplicates|) (327 . |quo|)
              (333 . ~=) (339 . |inv|) (344 . |zero?|) (349 . |concat|)
              (355 . |minIndex|) (360 . |elt|) (366 . *) (372 . |coefficients|)
              (377 . *) |FRIDEAL;*;3$;19| |FRIDEAL;^;$I$;20| (383 . ^)
              (389 . ^) (|OutputForm|) (395 . |coerce|) (400 . |paren|)
              |FRIDEAL;basis;$V;22| (405 . |coerce|) (410 . |coerce|) (415 . /)
              (421 . *) |FRIDEAL;coerce;$Of;23| (427 . |random|) (431 . +)
              (437 . |Zero|) (441 . *) |FRIDEAL;minimize;2$;26| (|HashState|)
              (|String|) (|SingleInteger|))
           '#(~= 447 |sample| 453 |rightRecip| 457 |rightPower| 462 |recip| 474
              |randomLC| 479 |one?| 485 |numer| 490 |norm| 495 |minimize| 500
              |leftRecip| 505 |leftPower| 510 |latex| 522 |inv| 527 |ideal| 532
              |hashUpdate!| 537 |hash| 543 |denom| 548 |conjugate| 553
              |commutator| 559 |coerce| 565 |basis| 570 ^ 575 |One| 593 = 597 /
              603 * 609)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|Group&| NIL NIL |MagmaWithUnit&| |Magma&| |SetCategory&|
                     NIL NIL |BasicType&| NIL)
                  (CONS
                   '#((|Group|) (|Monoid|) (|SemiGroup|) (|MagmaWithUnit|)
                      (|Magma|) (|SetCategory|) (|unitsKnown|)
                      (|TwoSidedRecip|) (|BasicType|) (|CoercibleTo| 129))
                   (|makeByteWordVec2| 145
                                       '(0 6 0 12 0 9 0 13 1 17 0 0 18 1 9 19 0
                                         20 2 17 19 0 19 21 1 9 0 19 22 2 8 0 7
                                         23 24 1 9 17 0 25 2 28 26 27 17 29 1 9
                                         30 0 31 2 14 32 33 0 34 2 6 32 0 0 35
                                         2 14 32 0 0 36 0 6 0 38 2 6 0 0 0 39 3
                                         41 6 40 0 6 42 1 26 8 0 43 1 8 44 0 45
                                         1 7 6 0 46 1 6 0 47 48 0 9 49 50 2 6 0
                                         0 49 51 2 7 0 6 6 52 0 9 23 53 0 7 0
                                         54 2 23 32 0 0 55 0 56 0 57 1 14 58 0
                                         59 2 56 0 9 23 60 2 56 0 0 0 61 0 62 0
                                         63 1 9 0 58 64 3 56 0 0 62 9 65 1 56 9
                                         0 66 1 9 7 0 67 2 23 0 49 0 69 2 0 9
                                         23 14 70 2 6 71 0 0 72 1 6 32 0 73 1 7
                                         0 6 74 1 9 0 7 75 2 26 0 0 0 76 2 78
                                         26 77 0 79 1 80 0 8 81 2 84 82 83 26
                                         85 1 82 71 0 86 1 8 0 7 87 2 82 0 80 0
                                         88 1 90 89 82 91 1 93 92 44 94 2 41 6
                                         40 0 95 1 26 96 0 97 1 8 23 0 98 2 23
                                         0 0 0 99 2 101 23 100 0 102 2 8 7 0 23
                                         103 2 105 17 104 26 106 2 9 0 7 0 107
                                         1 110 6 19 111 2 6 0 0 0 112 1 113 0 0
                                         114 2 6 0 0 0 115 2 6 32 0 0 116 1 7 0
                                         0 117 1 9 32 0 118 2 14 0 9 0 119 1 19
                                         58 0 120 2 19 7 0 58 121 2 56 0 0 0
                                         122 1 56 113 0 123 2 6 0 0 0 124 2 9 0
                                         0 23 127 2 6 0 0 23 128 1 9 129 0 130
                                         1 129 0 47 131 1 58 129 0 133 1 6 129
                                         0 134 2 129 0 0 0 135 2 129 0 0 0 136
                                         0 7 0 138 2 9 0 0 0 139 0 9 0 140 2 9
                                         0 58 0 141 2 0 32 0 0 1 0 0 0 1 1 0 71
                                         0 1 2 0 0 0 23 1 2 0 0 0 49 1 1 0 71 0
                                         1 2 0 9 23 14 70 1 0 32 0 1 1 0 14 0
                                         15 1 0 7 0 68 1 0 0 0 142 1 0 71 0 1 2
                                         0 0 0 23 1 2 0 0 0 49 1 1 0 144 0 1 1
                                         0 0 0 109 1 0 0 14 108 2 0 143 143 0 1
                                         1 0 145 0 1 1 0 6 0 16 2 0 0 0 0 1 2 0
                                         0 0 0 1 1 0 129 0 137 1 0 14 0 132 2 0
                                         0 0 58 126 2 0 0 0 23 1 2 0 0 0 49 1 0
                                         0 0 11 2 0 32 0 0 37 2 0 0 0 0 1 2 0 0
                                         0 0 125)))))
           '|lookupComplete|)) 
