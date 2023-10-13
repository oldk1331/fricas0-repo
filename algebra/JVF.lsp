
(/VERSIONCHECK 2) 

(DEFUN |JVF;diff;JB$;1| (|jb| $)
  (CONS (LIST (|spadConstant| $ 14)) (LIST |jb|))) 

(DEFUN |JVF;diffX;Pi$;2| (|i| $)
  (SPADCALL (SPADCALL |i| (QREFELT $ 16)) (QREFELT $ 15))) 

(DEFUN |JVF;diffU;Pi$;3| (|i| $)
  (SPADCALL (SPADCALL |i| (QREFELT $ 18)) (QREFELT $ 15))) 

(DEFUN |JVF;diffP;PiL$;4| (|i| |mu| $)
  (SPADCALL (SPADCALL |i| |mu| (QREFELT $ 21)) (QREFELT $ 15))) 

(DEFUN |JVF;monom| (|c| |jb| $)
  (COND
   ((SPADCALL |c| (QREFELT $ 24))
    (SPADCALL (SPADCALL "D" (QREFELT $ 27)) (SPADCALL |jb| (QREFELT $ 28))
              (QREFELT $ 29)))
   ('T
    (SPADCALL (SPADCALL |c| (QREFELT $ 30))
              (SPADCALL (SPADCALL "D" (QREFELT $ 27))
                        (SPADCALL |jb| (QREFELT $ 28)) (QREFELT $ 29))
              (QREFELT $ 31))))) 

(DEFUN |JVF;coerce;$Of;6| (|v| $)
  (PROG (#1=#:G157 |c| #2=#:G158 |jb| #3=#:G156)
    (RETURN
     (SEQ
      (COND ((NULL (QCDR |v|)) (SPADCALL (|spadConstant| $ 32) (QREFELT $ 30)))
            ((EQL (LENGTH (QCDR |v|)) 1)
             (|JVF;monom| (|SPADfirst| (QCAR |v|)) (|SPADfirst| (QCDR |v|)) $))
            ('T
             (SPADCALL (ELT $ 33)
                       (PROGN
                        (LETT #3# NIL . #4=(|JVF;coerce;$Of;6|))
                        (SEQ (LETT |jb| NIL . #4#) (LETT #2# (QCDR |v|) . #4#)
                             (LETT |c| NIL . #4#) (LETT #1# (QCAR |v|) . #4#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |c| (CAR #1#) . #4#) NIL)
                                   (ATOM #2#)
                                   (PROGN (LETT |jb| (CAR #2#) . #4#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #3# (CONS (|JVF;monom| |c| |jb| $) #3#)
                                     . #4#)))
                             (LETT #1#
                                   (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #4#))
                                   . #4#)
                             (GO G190) G191 (EXIT (NREVERSE #3#))))
                       (QREFELT $ 36)))))))) 

(DEFUN |JVF;coefficients;$L;7| (|v| $) (SPADCALL (QCAR |v|) (QREFELT $ 39))) 

(DEFUN |JVF;directions;$L;8| (|v| $) (SPADCALL (QCDR |v|) (QREFELT $ 42))) 

(DEFUN |JVF;coefficient;$JBD;9| (|v| |jb| $)
  (PROG (|pos|)
    (RETURN
     (SEQ
      (LETT |pos| (SPADCALL |jb| (QCDR |v|) (QREFELT $ 45))
            |JVF;coefficient;$JBD;9|)
      (EXIT
       (COND
        ((< |pos| (SPADCALL (QCDR |v|) (QREFELT $ 46))) (|spadConstant| $ 32))
        ('T (SPADCALL (QCAR |v|) |pos| (QREFELT $ 47))))))))) 

(DEFUN |JVF;copy;2$;10| (|v| $)
  (CONS (SPADCALL (QCAR |v|) (QREFELT $ 39))
        (SPADCALL (QCDR |v|) (QREFELT $ 42)))) 

(PUT '|JVF;Zero;$;11| '|SPADreplace| '(XLAM NIL (CONS NIL NIL))) 

(DEFUN |JVF;Zero;$;11| ($) (CONS NIL NIL)) 

(DEFUN |JVF;zero?;$B;12| (|v| $) (NULL (QCDR |v|))) 

(DEFUN |JVF;-;2$;13| (|v| $)
  (PROG (#1=#:G169 |c| #2=#:G168)
    (RETURN
     (SEQ
      (CONS
       (PROGN
        (LETT #2# NIL . #3=(|JVF;-;2$;13|))
        (SEQ (LETT |c| NIL . #3#) (LETT #1# (QCAR |v|) . #3#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT (LETT #2# (CONS (SPADCALL |c| (QREFELT $ 53)) #2#) . #3#)))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       (QCDR |v|)))))) 

(DEFUN |JVF;+;3$;14| (|v| |w| $)
  (PROG (|lj2| |lc2| |resJ| |resC| |sum| #1=#:G186 |c1| #2=#:G187 |j1|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |v| (QREFELT $ 52)) |w|)
            ((SPADCALL |w| (QREFELT $ 52)) |v|)
            ('T
             (SEQ
              (LETT |lc2| (SPADCALL (QCAR |w|) (QREFELT $ 39))
                    . #3=(|JVF;+;3$;14|))
              (LETT |lj2| (SPADCALL (QCDR |w|) (QREFELT $ 42)) . #3#)
              (LETT |resC| NIL . #3#) (LETT |resJ| NIL . #3#)
              (SEQ (LETT |j1| NIL . #3#) (LETT #2# (QCDR |v|) . #3#)
                   (LETT |c1| NIL . #3#) (LETT #1# (QCAR |v|) . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |c1| (CAR #1#) . #3#) NIL)
                         (ATOM #2#) (PROGN (LETT |j1| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((NULL |lj2|) 'NIL)
                                  ('T
                                   (SPADCALL (|SPADfirst| |lj2|) |j1|
                                             (QREFELT $ 55)))))
                           (GO G191)))
                         (SEQ
                          (LETT |resC| (CONS (|SPADfirst| |lc2|) |resC|) . #3#)
                          (LETT |resJ| (CONS (|SPADfirst| |lj2|) |resJ|) . #3#)
                          (LETT |lc2| (CDR |lc2|) . #3#)
                          (EXIT (LETT |lj2| (CDR |lj2|) . #3#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND
                      ((OR (NULL |lj2|)
                           (NULL
                            (SPADCALL (|SPADfirst| |lj2|) |j1|
                                      (QREFELT $ 56))))
                       (SEQ (LETT |resC| (CONS |c1| |resC|) . #3#)
                            (EXIT (LETT |resJ| (CONS |j1| |resJ|) . #3#))))
                      ('T
                       (SEQ
                        (LETT |sum|
                              (SPADCALL |c1| (|SPADfirst| |lc2|)
                                        (QREFELT $ 57))
                              . #3#)
                        (COND
                         ((NULL (SPADCALL |sum| (QREFELT $ 58)))
                          (SEQ (LETT |resC| (CONS |sum| |resC|) . #3#)
                               (EXIT (LETT |resJ| (CONS |j1| |resJ|) . #3#)))))
                        (LETT |lc2| (CDR |lc2|) . #3#)
                        (EXIT (LETT |lj2| (CDR |lj2|) . #3#)))))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#))
                         . #3#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (CONS (SPADCALL (NREVERSE |resC|) |lc2| (QREFELT $ 59))
                     (SPADCALL (NREVERSE |resJ|) |lj2| (QREFELT $ 60))))))))))) 

(DEFUN |JVF;*;D2$;15| (|f| |v| $)
  (PROG (#1=#:G192 |c| #2=#:G191)
    (RETURN
     (SEQ
      (COND ((SPADCALL |f| (QREFELT $ 58)) (|spadConstant| $ 51))
            ('T
             (CONS
              (PROGN
               (LETT #2# NIL . #3=(|JVF;*;D2$;15|))
               (SEQ (LETT |c| NIL . #3#) (LETT #1# (QCAR |v|) . #3#) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2# (CONS (SPADCALL |f| |c| (QREFELT $ 62)) #2#)
                            . #3#)))
                    (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#))))
              (QCDR |v|)))))))) 

(DEFUN |JVF;prolong;$Nni$;16| (|v| |q| $)
  (PROG (|oldDir| |oldCo| |newDir| |newCo| |res| |newco| |nu| #1=#:G251 |i| |j|
         #2=#:G228 |newjv| #3=#:G223 #4=#:G221 #5=#:G250 |k| |mu| |a| |jm|
         #6=#:G248 |jv| #7=#:G249 |co| |qq| #8=#:G212 #9=#:G247 #10=#:G246
         #11=#:G244 #12=#:G245 #13=#:G201 #14=#:G243 #15=#:G242 |dxi| |ind2|
         |eta| |ind1| |xi| |jt| #16=#:G240 #17=#:G241 |coeffs| |dirs|)
    (RETURN
     (SEQ
      (COND ((ZEROP |q|) |v|)
            ('T
             (SEQ
              (LETT |dirs| (SPADCALL |v| (QREFELT $ 43))
                    . #18=(|JVF;prolong;$Nni$;16|))
              (LETT |coeffs| (SPADCALL |v| (QREFELT $ 40)) . #18#)
              (LETT |xi| NIL . #18#) (LETT |eta| NIL . #18#)
              (LETT |ind1| NIL . #18#) (LETT |ind2| NIL . #18#)
              (SEQ (LETT |co| NIL . #18#) (LETT #17# |coeffs| . #18#)
                   (LETT |jv| NIL . #18#) (LETT #16# |dirs| . #18#) G190
                   (COND
                    ((OR (ATOM #16#) (PROGN (LETT |jv| (CAR #16#) . #18#) NIL)
                         (ATOM #17#) (PROGN (LETT |co| (CAR #17#) . #18#) NIL))
                     (GO G191)))
                   (SEQ (LETT |jt| (SPADCALL |jv| (QREFELT $ 65)) . #18#)
                        (EXIT
                         (COND
                          ((EQUAL |jt| '|Indep|)
                           (SEQ (LETT |xi| (CONS |co| |xi|) . #18#)
                                (EXIT
                                 (LETT |ind1|
                                       (CONS (SPADCALL |jv| (QREFELT $ 66))
                                             |ind1|)
                                       . #18#))))
                          ((EQUAL |jt| '|Dep|)
                           (SEQ (LETT |eta| (CONS |co| |eta|) . #18#)
                                (EXIT
                                 (LETT |ind2|
                                       (CONS (SPADCALL |jv| (QREFELT $ 66))
                                             |ind2|)
                                       . #18#))))
                          ('T (|error| "not base vector field in prolong")))))
                   (LETT #16# (PROG1 (CDR #16#) (LETT #17# (CDR #17#) . #18#))
                         . #18#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |dxi|
                    (SPADCALL (LENGTH |xi|) (QREFELT $ 10)
                              (|spadConstant| $ 32) (QREFELT $ 69))
                    . #18#)
              (SEQ (LETT |i| 1 . #18#) (LETT |co| NIL . #18#)
                   (LETT #15# |xi| . #18#) G190
                   (COND
                    ((OR (ATOM #15#) (PROGN (LETT |co| (CAR #15#) . #18#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |jm| (SPADCALL (LIST |co|) (QREFELT $ 72)) . #18#)
                    (EXIT
                     (SEQ (LETT |j| 1 . #18#) (LETT #14# (QREFELT $ 10) . #18#)
                          G190 (COND ((|greater_SI| |j| #14#) (GO G191)))
                          (SEQ
                           (EXIT
                            (QSETAREF2O |dxi| |i| |j|
                                        (QCAR
                                         (SPADCALL |co|
                                                   (PROG1
                                                       (LETT #13# |j| . #18#)
                                                     (|check_subtype|
                                                      (> #13# 0)
                                                      '(|PositiveInteger|)
                                                      #13#))
                                                   |jm| (QREFELT $ 74)))
                                        1 1)))
                          (LETT |j| (|inc_SI| |j|) . #18#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #15#
                         (PROG1 (CDR #15#) (LETT |i| (|inc_SI| |i|) . #18#))
                         . #18#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |j| (QREFELT $ 12) . #18#) (LETT |oldCo| NIL . #18#)
              (SEQ (LETT |i| NIL . #18#) (LETT #12# |ind2| . #18#)
                   (LETT |co| NIL . #18#) (LETT #11# |eta| . #18#) G190
                   (COND
                    ((OR (ATOM #11#) (PROGN (LETT |co| (CAR #11#) . #18#) NIL)
                         (ATOM #12#) (PROGN (LETT |i| (CAR #12#) . #18#) NIL))
                     (GO G191)))
                   (SEQ
                    (SEQ G190
                         (COND
                          ((NULL (SPADCALL |j| |i| (QREFELT $ 75))) (GO G191)))
                         (SEQ
                          (LETT |oldCo| (CONS (|spadConstant| $ 32) |oldCo|)
                                . #18#)
                          (EXIT (LETT |j| (- |j| 1) . #18#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (LETT |oldCo| (CONS |co| |oldCo|) . #18#)
                    (EXIT (LETT |j| (- |j| 1) . #18#)))
                   (LETT #11# (PROG1 (CDR #11#) (LETT #12# (CDR #12#) . #18#))
                         . #18#)
                   (GO G190) G191 (EXIT NIL))
              (COND
               ((NULL (ZEROP |j|))
                (SEQ (LETT |i| 1 . #18#) G190
                     (COND ((|greater_SI| |i| |j|) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |oldCo| (CONS (|spadConstant| $ 32) |oldCo|)
                             . #18#)))
                     (LETT |i| (|inc_SI| |i|) . #18#) (GO G190) G191
                     (EXIT NIL))))
              (LETT |oldDir|
                    (PROGN
                     (LETT #10# NIL . #18#)
                     (SEQ (LETT |i| 1 . #18#) (LETT #9# (QREFELT $ 12) . #18#)
                          G190 (COND ((|greater_SI| |i| #9#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #10#
                                  (CONS
                                   (SPADCALL
                                    (PROG1 (LETT #8# |i| . #18#)
                                      (|check_subtype| (> #8# 0)
                                                       '(|PositiveInteger|)
                                                       #8#))
                                    (QREFELT $ 18))
                                   #10#)
                                  . #18#)))
                          (LETT |i| (|inc_SI| |i|) . #18#) (GO G190) G191
                          (EXIT (NREVERSE #10#))))
                    . #18#)
              (LETT |res| |v| . #18#)
              (SEQ (LETT |qq| 1 . #18#) G190
                   (COND ((|greater_SI| |qq| |q|) (GO G191)))
                   (SEQ (LETT |newCo| NIL . #18#) (LETT |newDir| NIL . #18#)
                        (SEQ (LETT |co| NIL . #18#) (LETT #7# |oldCo| . #18#)
                             (LETT |jv| NIL . #18#) (LETT #6# |oldDir| . #18#)
                             G190
                             (COND
                              ((OR (ATOM #6#)
                                   (PROGN (LETT |jv| (CAR #6#) . #18#) NIL)
                                   (ATOM #7#)
                                   (PROGN (LETT |co| (CAR #7#) . #18#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |jm| (SPADCALL (LIST |co|) (QREFELT $ 72))
                                    . #18#)
                              (LETT |a| (SPADCALL |jv| (QREFELT $ 66)) . #18#)
                              (LETT |mu| (SPADCALL |jv| (QREFELT $ 77)) . #18#)
                              (EXIT
                               (SEQ
                                (LETT |k|
                                      (MAX 1 (SPADCALL |jv| (QREFELT $ 78)))
                                      . #18#)
                                (LETT #5# (QREFELT $ 10) . #18#) G190
                                (COND ((> |k| #5#) (GO G191)))
                                (SEQ
                                 (LETT |newjv|
                                       (PROG2
                                           (LETT #3#
                                                 (SPADCALL |jv|
                                                           (PROG1
                                                               (LETT #4# |k|
                                                                     . #18#)
                                                             (|check_subtype|
                                                              (> #4# 0)
                                                              '(|PositiveInteger|)
                                                              #4#))
                                                           (QREFELT $ 80))
                                                 . #18#)
                                           (QCDR #3#)
                                         (|check_union| (QEQCAR #3# 0)
                                                        (QREFELT $ 6) #3#))
                                       . #18#)
                                 (LETT |newco|
                                       (QCAR
                                        (SPADCALL |co|
                                                  (PROG1 (LETT #2# |k| . #18#)
                                                    (|check_subtype| (> #2# 0)
                                                                     '(|PositiveInteger|)
                                                                     #2#))
                                                  |jm| (QREFELT $ 74)))
                                       . #18#)
                                 (SEQ (LETT |j| 1 . #18#) (LETT |i| NIL . #18#)
                                      (LETT #1# |ind1| . #18#) G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN
                                             (LETT |i| (CAR #1#) . #18#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |nu|
                                             (SPADCALL |mu| (QREFELT $ 81))
                                             . #18#)
                                       (SPADCALL |nu| |i|
                                                 (+
                                                  (SPADCALL |nu| |i|
                                                            (QREFELT $ 82))
                                                  1)
                                                 (QREFELT $ 83))
                                       (EXIT
                                        (LETT |newco|
                                              (SPADCALL |newco|
                                                        (SPADCALL
                                                         (QAREF2O |dxi| |j| |k|
                                                                  1 1)
                                                         (SPADCALL
                                                          (SPADCALL |a| |nu|
                                                                    (QREFELT $
                                                                             84))
                                                          (QREFELT $ 85))
                                                         (QREFELT $ 62))
                                                        (QREFELT $ 86))
                                              . #18#)))
                                      (LETT #1#
                                            (PROG1 (CDR #1#)
                                              (LETT |j| (|inc_SI| |j|) . #18#))
                                            . #18#)
                                      (GO G190) G191 (EXIT NIL))
                                 (LETT |res|
                                       (SPADCALL |res|
                                                 (SPADCALL |newco|
                                                           (SPADCALL |newjv|
                                                                     (QREFELT $
                                                                              15))
                                                           (QREFELT $ 63))
                                                 (QREFELT $ 61))
                                       . #18#)
                                 (LETT |newCo| (CONS |newco| |newCo|) . #18#)
                                 (EXIT
                                  (LETT |newDir| (CONS |newjv| |newDir|)
                                        . #18#)))
                                (LETT |k| (+ |k| 1) . #18#) (GO G190) G191
                                (EXIT NIL))))
                             (LETT #6#
                                   (PROG1 (CDR #6#)
                                     (LETT #7# (CDR #7#) . #18#))
                                   . #18#)
                             (GO G190) G191 (EXIT NIL))
                        (LETT |oldCo| |newCo| . #18#)
                        (EXIT (LETT |oldDir| |newDir| . #18#)))
                   (LETT |qq| (|inc_SI| |qq|) . #18#) (GO G190) G191
                   (EXIT NIL))
              (EXIT |res|)))))))) 

(DEFUN |JVF;eval;$2D;17| (|v| |f| $)
  (PROG (|res| #1=#:G255 |c| #2=#:G256 |jb|)
    (RETURN
     (SEQ (LETT |res| (|spadConstant| $ 32) . #3=(|JVF;eval;$2D;17|))
          (SEQ (LETT |jb| NIL . #3#) (LETT #2# (QCDR |v|) . #3#)
               (LETT |c| NIL . #3#) (LETT #1# (QCAR |v|) . #3#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL)
                     (ATOM #2#) (PROGN (LETT |jb| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL |c|
                                           (SPADCALL |f| |jb| (QREFELT $ 88))
                                           (QREFELT $ 62))
                                 (QREFELT $ 57))
                       . #3#)))
               (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#)) . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |JVF;commutator;3$;18| (|v| |w| $)
  (PROG (|res2| |rjb| |rco| |sum| #1=#:G273 |c1| #2=#:G274 |j1| #3=#:G271 |c2|
         #4=#:G272 |j2| |res1| #5=#:G269 #6=#:G270 #7=#:G267 #8=#:G268)
    (RETURN
     (SEQ (LETT |rco| NIL . #9=(|JVF;commutator;3$;18|)) (LETT |rjb| NIL . #9#)
          (SEQ (LETT |j1| NIL . #9#) (LETT #8# (QCDR |v|) . #9#)
               (LETT |c1| NIL . #9#) (LETT #7# (QCAR |v|) . #9#) G190
               (COND
                ((OR (ATOM #7#) (PROGN (LETT |c1| (CAR #7#) . #9#) NIL)
                     (ATOM #8#) (PROGN (LETT |j1| (CAR #8#) . #9#) NIL))
                 (GO G191)))
               (SEQ (LETT |sum| (|spadConstant| $ 32) . #9#)
                    (SEQ (LETT |j2| NIL . #9#) (LETT #6# (QCDR |w|) . #9#)
                         (LETT |c2| NIL . #9#) (LETT #5# (QCAR |w|) . #9#) G190
                         (COND
                          ((OR (ATOM #5#)
                               (PROGN (LETT |c2| (CAR #5#) . #9#) NIL)
                               (ATOM #6#)
                               (PROGN (LETT |j2| (CAR #6#) . #9#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |sum|
                                 (SPADCALL |sum|
                                           (SPADCALL |c2|
                                                     (SPADCALL |c1| |j2|
                                                               (QREFELT $ 88))
                                                     (QREFELT $ 62))
                                           (QREFELT $ 57))
                                 . #9#)))
                         (LETT #5# (PROG1 (CDR #5#) (LETT #6# (CDR #6#) . #9#))
                               . #9#)
                         (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |sum| (QREFELT $ 58)))
                       (SEQ (LETT |rco| (CONS |sum| |rco|) . #9#)
                            (EXIT (LETT |rjb| (CONS |j1| |rjb|) . #9#)))))))
               (LETT #7# (PROG1 (CDR #7#) (LETT #8# (CDR #8#) . #9#)) . #9#)
               (GO G190) G191 (EXIT NIL))
          (LETT |res1| (CONS (NREVERSE |rco|) (NREVERSE |rjb|)) . #9#)
          (LETT |rco| NIL . #9#) (LETT |rjb| NIL . #9#)
          (SEQ (LETT |j2| NIL . #9#) (LETT #4# (QCDR |w|) . #9#)
               (LETT |c2| NIL . #9#) (LETT #3# (QCAR |w|) . #9#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |c2| (CAR #3#) . #9#) NIL)
                     (ATOM #4#) (PROGN (LETT |j2| (CAR #4#) . #9#) NIL))
                 (GO G191)))
               (SEQ (LETT |sum| (|spadConstant| $ 32) . #9#)
                    (SEQ (LETT |j1| NIL . #9#) (LETT #2# (QCDR |v|) . #9#)
                         (LETT |c1| NIL . #9#) (LETT #1# (QCAR |v|) . #9#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |c1| (CAR #1#) . #9#) NIL)
                               (ATOM #2#)
                               (PROGN (LETT |j1| (CAR #2#) . #9#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |sum|
                                 (SPADCALL |sum|
                                           (SPADCALL |c1|
                                                     (SPADCALL |c2| |j1|
                                                               (QREFELT $ 88))
                                                     (QREFELT $ 62))
                                           (QREFELT $ 57))
                                 . #9#)))
                         (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #9#))
                               . #9#)
                         (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |sum| (QREFELT $ 58)))
                       (SEQ (LETT |rco| (CONS |sum| |rco|) . #9#)
                            (EXIT (LETT |rjb| (CONS |j2| |rjb|) . #9#)))))))
               (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#) . #9#)) . #9#)
               (GO G190) G191 (EXIT NIL))
          (LETT |res2| (CONS (NREVERSE |rco|) (NREVERSE |rjb|)) . #9#)
          (EXIT (SPADCALL |res2| |res1| (QREFELT $ 90))))))) 

(DEFUN |JVF;table;LTda;19| (|lv| $)
  (PROG (|c| #1=#:G283 |v2| |j| |v1| |i| #2=#:G282 |res| |len|)
    (RETURN
     (SEQ
      (LETT |len| (SPADCALL |lv| (QREFELT $ 93)) . #3=(|JVF;table;LTda;19|))
      (EXIT
       (COND ((ZEROP |len|) (|error| "empty list in table"))
             ('T
              (SEQ
               (LETT |res|
                     (SPADCALL |len| |len| (|spadConstant| $ 51)
                               (QREFELT $ 95))
                     . #3#)
               (SEQ (LETT #2# NIL . #3#) (LETT |i| 1 . #3#) G190
                    (COND (#2# (GO G191)))
                    (SEQ (LETT |v1| (SPADCALL |lv| (QREFELT $ 96)) . #3#)
                         (LETT |lv| (SPADCALL |lv| (QREFELT $ 97)) . #3#)
                         (EXIT
                          (SEQ (LETT |j| (+ |i| 1) . #3#) (LETT |v2| NIL . #3#)
                               (LETT #1# |lv| . #3#) G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |v2| (CAR #1#) . #3#) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |c| (SPADCALL |v1| |v2| (QREFELT $ 91))
                                      . #3#)
                                (SPADCALL |res| |i| |j| |c| (QREFELT $ 98))
                                (EXIT
                                 (SPADCALL |res| |j| |i|
                                           (SPADCALL |c| (QREFELT $ 54))
                                           (QREFELT $ 98))))
                               (LETT #1#
                                     (PROG1 (CDR #1#)
                                       (LETT |j| (+ |j| 1) . #3#))
                                     . #3#)
                               (GO G190) G191 (EXIT NIL))))
                    (LETT |i|
                          (PROG1 (|inc_SI| |i|)
                            (LETT #2# (SPADCALL |lv| (QREFELT $ 99)) . #3#))
                          . #3#)
                    (GO G190) G191 (EXIT NIL))
               (EXIT |res|))))))))) 

(DEFUN |JVF;lie;3$;20| (|v| |w| $) (SPADCALL |v| |w| (QREFELT $ 91))) 

(DEFUN |JetVectorField| (&REST #1=#:G289)
  (PROG ()
    (RETURN
     (PROG (#2=#:G290)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|JetVectorField|)
                                           '|domainEqualList|)
                . #3=(|JetVectorField|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |JetVectorField;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|JetVectorField|))))))))))) 

(DEFUN |JetVectorField;| (|#1| |#2|)
  (PROG (|pv$| #1=#:G288 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #2=(|JetVectorField|))
      (LETT DV$2 (|devaluate| |#2|) . #2#)
      (LETT |dv$| (LIST '|JetVectorField| DV$1 DV$2) . #2#)
      (LETT $ (GETREFV 105) . #2#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2|
                                                         '(|AbelianGroup|))
                                          (LETT #1#
                                                (|HasCategory| |#2|
                                                               '(|AbelianMonoid|))
                                                . #2#)
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|AbelianGroup|))
                                           #1#)))
                      . #2#))
      (|haddProp| |$ConstructorCache| '|JetVectorField| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 10 (SPADCALL (QREFELT $ 9)))
      (QSETREFV $ 12 (SPADCALL (QREFELT $ 11)))
      (QSETREFV $ 13
                (|Record| (|:| |Coeff| (|List| |#2|))
                          (|:| |Dir| (|List| |#1|))))
      $)))) 

(MAKEPROP '|JetVectorField| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|PositiveInteger|) (0 . |numIndVar|) '|nn| (4 . |numDepVar|)
              '|mm| '|Rep| (8 . |One|) |JVF;diff;JB$;1| (12 . X)
              |JVF;diffX;Pi$;2| (17 . U) |JVF;diffU;Pi$;3| (|List| 67) (22 . P)
              |JVF;diffP;PiL$;4| (|Boolean|) (28 . |one?|) (|String|)
              (|OutputForm|) (33 . |message|) (38 . |coerce|) (43 . |sub|)
              (49 . |coerce|) (54 . *) (60 . |Zero|) (64 . +)
              (|Mapping| 26 26 26) (|List| 26) (70 . |reduce|)
              |JVF;coerce;$Of;6| (|List| 7) (76 . |copy|)
              |JVF;coefficients;$L;7| (|List| 6) (81 . |copy|)
              |JVF;directions;$L;8| (|Integer|) (86 . |position|)
              (92 . |minIndex|) (97 . |qelt|) |JVF;coefficient;$JBD;9|
              |JVF;copy;2$;10| (103 . |empty|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |JVF;Zero;$;11|) $))
              |JVF;zero?;$B;12| (107 . -) |JVF;-;2$;13| (112 . <) (118 . =)
              (124 . +) (130 . |zero?|) (135 . |concat!|) (141 . |concat!|)
              |JVF;+;3$;14| (147 . *) |JVF;*;D2$;15| (|Symbol|) (153 . |type|)
              (158 . |index|) (|NonNegativeInteger|) (|Matrix| 7) (163 . |new|)
              (|SparseEchelonMatrix| 6 $) (|List| $) (170 . |jacobiMatrix|)
              (|Record| (|:| |DPhi| $) (|:| |JVars| 41)) (175 . |formalDiff2|)
              (182 . >) (188 . |One|) (192 . |multiIndex|) (197 . |class|)
              (|Union| $ '"0") (202 . |differentiate|) (208 . |copy|)
              (213 . |qelt|) (219 . |qsetelt!|) (226 . |Pm|) (232 . |coerce|)
              (237 . -) |JVF;prolong;$Nni$;16| (243 . |differentiate|)
              |JVF;eval;$2D;17| (249 . -) |JVF;commutator;3$;18| (|List| $$)
              (255 . |#|) (|TwoDimensionalArray| $$) (260 . |new|)
              (267 . |first|) (272 . |rest|) (277 . |qsetelt!|)
              (285 . |empty?|) (|TwoDimensionalArray| $) |JVF;table;LTda;19|
              |JVF;lie;3$;20| (|Union| $ '"failed") (|SingleInteger|))
           '#(~= 290 |zero?| 296 |table| 301 |subtractIfCan| 306 |sample| 312
              |prolong| 316 |lie| 322 |latex| 328 |hash| 333 |eval| 338
              |directions| 344 |diffX| 349 |diffU| 354 |diffP| 359 |diff| 365
              |copy| 370 |commutator| 375 |coerce| 381 |coefficients| 386
              |coefficient| 391 |Zero| 397 = 401 - 407 + 418 * 424)
           'NIL
           (CONS (|makeByteWordVec2| 3 '(0 0 0 0 1 1 3 0 0 0 0))
                 (CONS
                  '#(|Module&| NIL NIL NIL |AbelianGroup&| NIL |AbelianMonoid&|
                     |AbelianSemiGroup&| |SetCategory&| |BasicType&| NIL)
                  (CONS
                   '#((|Module| 7) (|BiModule| 7 7) (|LeftModule| 7)
                      (|RightModule| 7) (|AbelianGroup|)
                      (|CancellationAbelianMonoid|) (|AbelianMonoid|)
                      (|AbelianSemiGroup|) (|SetCategory|) (|BasicType|)
                      (|CoercibleTo| 26))
                   (|makeByteWordVec2| 104
                                       '(0 6 8 9 0 6 8 11 0 7 0 14 1 6 0 8 16 1
                                         6 0 8 18 2 6 0 8 20 21 1 7 23 0 24 1
                                         26 0 25 27 1 6 26 0 28 2 26 0 0 0 29 1
                                         7 26 0 30 2 26 0 0 0 31 0 7 0 32 2 26
                                         0 0 0 33 2 35 26 34 0 36 1 38 0 0 39 1
                                         41 0 0 42 2 41 44 6 0 45 1 41 44 0 46
                                         2 38 7 0 44 47 0 26 0 50 1 7 0 0 53 2
                                         6 23 0 0 55 2 6 23 0 0 56 2 7 0 0 0 57
                                         1 7 23 0 58 2 38 0 0 0 59 2 41 0 0 0
                                         60 2 7 0 0 0 62 1 6 64 0 65 1 6 8 0 66
                                         3 68 0 67 67 7 69 1 7 70 71 72 3 7 73
                                         0 8 70 74 2 44 23 0 0 75 0 6 0 76 1 6
                                         20 0 77 1 6 67 0 78 2 6 79 0 8 80 1 20
                                         0 0 81 2 20 67 0 44 82 3 20 67 0 44 67
                                         83 2 6 0 8 20 84 1 7 0 6 85 2 7 0 0 0
                                         86 2 7 0 0 6 88 2 0 0 0 0 90 1 92 67 0
                                         93 3 94 0 67 67 2 95 1 92 2 0 96 1 92
                                         0 0 97 4 94 2 0 44 44 2 98 1 92 23 0
                                         99 2 0 23 0 0 1 1 2 23 0 52 1 0 100 71
                                         101 2 1 103 0 0 1 0 2 0 1 2 0 0 0 67
                                         87 2 0 0 0 0 102 1 0 25 0 1 1 0 104 0
                                         1 2 0 7 0 7 89 1 0 41 0 43 1 0 0 8 17
                                         1 0 0 8 19 2 0 0 8 20 22 1 0 0 6 15 1
                                         0 0 0 49 2 0 0 0 0 91 1 0 26 0 37 1 0
                                         38 0 40 2 0 7 0 6 48 0 2 0 51 2 0 23 0
                                         0 1 2 1 0 0 0 90 1 1 0 0 54 2 0 0 0 0
                                         61 2 1 0 44 0 1 2 2 0 67 0 1 2 0 0 0 7
                                         1 2 0 0 8 0 1 2 0 0 7 0 63)))))
           '|lookupComplete|)) 
