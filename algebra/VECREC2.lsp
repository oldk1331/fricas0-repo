
(/VERSIONCHECK 2) 

(DEFUN |VECREC2;modInverse| (|c| |p| $)
  (PROG (#1=#:G142)
    (RETURN
     (QCAR
      (PROG2
          (LETT #1# (SPADCALL |c| |p| 1 (QREFELT $ 10)) |VECREC2;modInverse|)
          (QCDR #1#)
        (|check_union| (QEQCAR #1# 0)
                       (|Record| (|:| |coef1| (|Integer|))
                                 (|:| |coef2| (|Integer|)))
                       #1#)))))) 

(DEFUN |VECREC2;empty;I$;2| (|nint| $)
  (PROG (|intvec| #1=#:G146)
    (RETURN
     (SEQ
      (LETT |intvec|
            (MAKEARR1
             (PROG1 (LETT #1# |nint| . #2=(|VECREC2;empty;I$;2|))
               (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
             0)
            . #2#)
      (EXIT
       (VECTOR 1 0 0 |nint| |intvec| (MAKE-ARRAY 0) 1 0 0 (MAKE-ARRAY 0)
               (MAKE-ARRAY 0))))))) 

(DEFUN |VECREC2;chinese_update;UvI$V;3| (|vec| |p| |statearg| $)
  (PROG (|nmp| |cor| |ii| #1=#:G167 |i| |mpfact| |nbmp| |mpcor| |mpval| |bmp|
         |bintvec| #2=#:G166 #3=#:G152 #4=#:G165 |intvec| |mp| |state|)
    (RETURN
     (SEQ (LETT |state| |statearg| . #5=(|VECREC2;chinese_update;UvI$V;3|))
          (LETT |mp| (QVELT |state| 0) . #5#)
          (LETT |mpval| (SPADCALL |mp| |p| (QREFELT $ 12)) . #5#)
          (EXIT
           (COND ((EQL |mpval| 0) (|error| "Duplicate modulus in update"))
                 (#6='T
                  (SEQ
                   (LETT |mpcor| (|VECREC2;modInverse| |mpval| |p| $) . #5#)
                   (LETT |mpfact| (* |mpcor| |mp|) . #5#)
                   (LETT |nmp| (* |mp| |p|) . #5#)
                   (LETT |mpfact| (SPADCALL |mpfact| |nmp| (QREFELT $ 12))
                         . #5#)
                   (QSETVELT |state| 2 (+ (QVELT |state| 2) 1))
                   (LETT |intvec| (QVELT |state| 4) . #5#)
                   (SEQ (LETT |i| 0 . #5#)
                        (LETT #4# (- (QVELT |state| 3) 1) . #5#) G190
                        (COND ((|greater_SI| |i| #4#) (GO G191)))
                        (SEQ (LETT |ii| (QAREF1 |intvec| |i|) . #5#)
                             (LETT |cor|
                                   (SPADCALL (- (ELT_U32 |vec| |i|) |ii|) |p|
                                             (QREFELT $ 12))
                                   . #5#)
                             (EXIT
                              (QSETAREF1 |intvec| |i|
                                         (SPADCALL (+ |ii| (* |mpfact| |cor|))
                                                   |nmp| (QREFELT $ 12)))))
                        (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                        (EXIT NIL))
                   (COND
                    ((>= (QVELT |state| 2) 200)
                     (COND
                      ((EQL (SPADCALL (QVELT |state| 2) 100 (QREFELT $ 12)) 0)
                       (SEQ (QSETVELT |state| 7 (QVELT |state| 2))
                            (EXIT
                             (COND
                              ((SPADCALL (QVELT |state| 5) (QREFELT $ 15))
                               (SEQ
                                (QSETVELT |state| 5
                                          (MAKEARR1
                                           (PROG1
                                               (LETT #3# (QVELT |state| 3)
                                                     . #5#)
                                             (|check_subtype| (>= #3# 0)
                                                              '(|NonNegativeInteger|)
                                                              #3#))
                                           0))
                                (LETT |bintvec| (QVELT |state| 5) . #5#)
                                (SEQ (LETT |i| 0 . #5#)
                                     (LETT #2# (- (QVELT |state| 3) 1) . #5#)
                                     G190
                                     (COND ((|greater_SI| |i| #2#) (GO G191)))
                                     (SEQ
                                      (QSETAREF1 |bintvec| |i|
                                                 (QAREF1 |intvec| |i|))
                                      (EXIT (QSETAREF1 |intvec| |i| 0)))
                                     (LETT |i| (|inc_SI| |i|) . #5#) (GO G190)
                                     G191 (EXIT NIL))
                                (QSETVELT |state| 6 |nmp|)
                                (EXIT (LETT |nmp| 1 . #5#))))
                              (#6#
                               (SEQ (LETT |bintvec| (QVELT |state| 5) . #5#)
                                    (LETT |bmp| (QVELT |state| 6) . #5#)
                                    (LETT |mpval|
                                          (SPADCALL |bmp| |nmp| (QREFELT $ 12))
                                          . #5#)
                                    (LETT |mpcor|
                                          (|VECREC2;modInverse| |mpval| |nmp|
                                           $)
                                          . #5#)
                                    (LETT |mpfact| (* |mpcor| |bmp|) . #5#)
                                    (LETT |nbmp| (* |bmp| |nmp|) . #5#)
                                    (LETT |mpfact|
                                          (SPADCALL |mpfact| |nbmp|
                                                    (QREFELT $ 12))
                                          . #5#)
                                    (SEQ (LETT |i| 0 . #5#)
                                         (LETT #1# (- (QVELT |state| 3) 1)
                                               . #5#)
                                         G190
                                         (COND
                                          ((|greater_SI| |i| #1#) (GO G191)))
                                         (SEQ
                                          (LETT |ii| (QAREF1 |bintvec| |i|)
                                                . #5#)
                                          (LETT |cor|
                                                (SPADCALL
                                                 (- (QAREF1 |intvec| |i|) |ii|)
                                                 |nmp| (QREFELT $ 12))
                                                . #5#)
                                          (QSETAREF1 |bintvec| |i|
                                                     (SPADCALL
                                                      (+ |ii|
                                                         (* |mpfact| |cor|))
                                                      |nbmp| (QREFELT $ 12)))
                                          (EXIT (QSETAREF1 |intvec| |i| 0)))
                                         (LETT |i| (|inc_SI| |i|) . #5#)
                                         (GO G190) G191 (EXIT NIL))
                                    (QSETVELT |state| 6 |nbmp|)
                                    (EXIT (LETT |nmp| 1 . #5#)))))))))))
                   (EXIT (QSETVELT |state| 0 |nmp|)))))))))) 

(DEFUN |VECREC2;hensel_update;UvI$V;4| (|vec| |p| |statearg| $)
  (PROG (#1=#:G172 |i| |intvec| |mp| |state|)
    (RETURN
     (SEQ (LETT |state| |statearg| . #2=(|VECREC2;hensel_update;UvI$V;4|))
          (LETT |mp| (QVELT |state| 0) . #2#)
          (LETT |intvec| (QVELT |state| 4) . #2#)
          (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QVELT |state| 3) 1) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1 |intvec| |i|
                            (+ (QAREF1 |intvec| |i|)
                               (* (ELT_U32 |vec| |i|) |mp|)))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (QSETVELT |state| 0 (* |p| |mp|))))))) 

(DEFUN |VECREC2;rational_reconstruction;4IU;5| (|x| |y| |i| |j| $)
  (PROG (|r1| |s1| |s0| |tmp| |r0| |qr|)
    (RETURN
     (SEQ (LETT |r0| |y| . #1=(|VECREC2;rational_reconstruction;4IU;5|))
          (LETT |s0| 0 . #1#)
          (LETT |r1| (SPADCALL |x| |y| (QREFELT $ 12)) . #1#)
          (LETT |s1| 1 . #1#)
          (SEQ G190
               (COND ((NULL (SPADCALL |r1| |i| (QREFELT $ 20))) (GO G191)))
               (SEQ (LETT |qr| (DIVIDE2 |r0| |r1|) . #1#)
                    (LETT |r0| |r1| . #1#) (LETT |r1| (QCDR |qr|) . #1#)
                    (LETT |tmp| (- |s0| (* (QCAR |qr|) |s1|)) . #1#)
                    (LETT |s0| |s1| . #1#) (EXIT (LETT |s1| |tmp| . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (COND
           ((< |s1| 0)
            (SEQ (LETT |s1| (- |s1|) . #1#)
                 (EXIT (LETT |r1| (- |r1|) . #1#)))))
          (EXIT
           (COND
            ((OR (SPADCALL |s1| |j| (QREFELT $ 20))
                 (SPADCALL (GCD |s1| |y|) 1 (QREFELT $ 21)))
             (CONS 1 "failed"))
            ('T (CONS 0 (CONS |r1| |s1|))))))))) 

(DEFUN |VECREC2;rational_reconstruction2| (|statearg| |block_offsets| $)
  (PROG (#1=#:G225 |cden| |ppr| |pp| |r1| |co| |cb| |j| #2=#:G211 |ctmp| |jj|
         |dens| |nums| #3=#:G206 #4=#:G204 |mm| |n| |ok| |bound2| |bound| |j0|
         |intvec| |modulus| |state|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |state| |statearg| . #5=(|VECREC2;rational_reconstruction2|))
            (LETT |modulus| (QVELT |state| 0) . #5#)
            (LETT |intvec| (QVELT |state| 4) . #5#)
            (COND
             ((>= (QVELT |state| 2) 200)
              (SEQ
               (COND
                ((< (- (QVELT |state| 2) (QVELT |state| 8)) 150)
                 (COND
                  ((SPADCALL (QVELT |state| 0) 1 (QREFELT $ 21))
                   (EXIT
                    (COND
                     ((EQL (SPADCALL (QVELT |state| 2) 100 (QREFELT $ 12)) 0)
                      (|error| "impossible"))
                     (#6='T
                      (PROGN
                       (LETT #1# (CONS 1 "failed") . #5#)
                       (GO #1#)))))))))
               (QSETVELT |state| 8 (QVELT |state| 7))
               (LETT |modulus| (QVELT |state| 6) . #5#)
               (EXIT (LETT |intvec| (QVELT |state| 5) . #5#)))))
            (LETT |j0| (QVELT |state| 1) . #5#)
            (LETT |bound| (QUOTIENT2 (SPADCALL |modulus| (QREFELT $ 26)) 10)
                  . #5#)
            (LETT |bound2| (- |modulus| |bound|) . #5#) (LETT |ok| 'T . #5#)
            (LETT |pp|
                  (SPADCALL (QAREF1 |intvec| |j0|) |modulus| |bound| |bound|
                            (QREFELT $ 24))
                  . #5#)
            (EXIT
             (COND ((QEQCAR |pp| 1) (CONS 1 "failed"))
                   (#6#
                    (SEQ (LETT |n| (QVELT |state| 3) . #5#)
                         (LETT |mm| (QVSIZE |block_offsets|) . #5#)
                         (COND
                          ((SPADCALL (QVELT |state| 9) (QREFELT $ 15))
                           (SEQ
                            (QSETVELT |state| 9
                                      (MAKEARR1
                                       (PROG1 (LETT #4# |n| . #5#)
                                         (|check_subtype| (>= #4# 0)
                                                          '(|NonNegativeInteger|)
                                                          #4#))
                                       0))
                            (EXIT
                             (QSETVELT |state| 10
                                       (MAKEARR1
                                        (PROG1 (LETT #3# |n| . #5#)
                                          (|check_subtype| (>= #3# 0)
                                                           '(|NonNegativeInteger|)
                                                           #3#))
                                        0))))))
                         (LETT |nums| (QVELT |state| 9) . #5#)
                         (LETT |dens| (QVELT |state| 10) . #5#)
                         (LETT |ppr| (QCDR |pp|) . #5#)
                         (QSETAREF1 |nums| |j0| (QCAR |ppr|))
                         (QSETAREF1 |dens| |j0| (QCDR |ppr|))
                         (LETT |cden| (QCDR |ppr|) . #5#) (LETT |co| 0 . #5#)
                         (LETT |cb| 1 . #5#)
                         (SEQ
                          (EXIT
                           (SEQ (LETT |jj| 1 . #5#) G190
                                (COND ((|greater_SI| |jj| |mm|) (GO G191)))
                                (SEQ
                                 (LETT |ctmp|
                                       (SPADCALL |block_offsets| |jj|
                                                 (QREFELT $ 28))
                                       . #5#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL |ctmp| |j0| (QREFELT $ 20))
                                    (SEQ (LETT |cb| |jj| . #5#)
                                         (LETT |co| |ctmp| . #5#)
                                         (EXIT
                                          (PROGN
                                           (LETT #2# |$NoValue| . #5#)
                                           (GO #2#))))))))
                                (LETT |jj| (|inc_SI| |jj|) . #5#) (GO G190)
                                G191 (EXIT NIL)))
                          #2# (EXIT #2#))
                         (LETT |j| |j0| . #5#)
                         (EXIT
                          (SEQ G190 NIL
                               (SEQ (LETT |j| (+ |j| 1) . #5#)
                                    (COND
                                     ((>= |j| |n|)
                                      (LETT |j| (- |j| |n|) . #5#)))
                                    (COND
                                     ((EQL |j| |co|)
                                      (COND
                                       ((SPADCALL |mm| 1 (QREFELT $ 30))
                                        (SEQ (LETT |cden| 1 . #5#)
                                             (LETT |cb|
                                                   (COND ((EQL |cb| |mm|) 1)
                                                         ('T (+ |cb| 1)))
                                                   . #5#)
                                             (EXIT
                                              (LETT |co|
                                                    (SPADCALL |block_offsets|
                                                              |cb|
                                                              (QREFELT $ 28))
                                                    . #5#)))))))
                                    (EXIT
                                     (COND
                                      ((EQL |j| |j0|)
                                       (PROGN
                                        (LETT #1# (CONS 0 (CONS |nums| |dens|))
                                              . #5#)
                                        (GO #1#)))
                                      ('T
                                       (SEQ
                                        (LETT |r1|
                                              (SPADCALL
                                               (* |cden| (QAREF1 |intvec| |j|))
                                               |modulus| (QREFELT $ 12))
                                              . #5#)
                                        (EXIT
                                         (COND
                                          ((< |r1| |bound|)
                                           (SEQ (QSETAREF1 |nums| |j| |r1|)
                                                (EXIT
                                                 (QSETAREF1 |dens| |j|
                                                            |cden|))))
                                          ((SPADCALL |r1| |bound2|
                                                     (QREFELT $ 20))
                                           (SEQ
                                            (QSETAREF1 |nums| |j|
                                                       (- |r1| |modulus|))
                                            (EXIT
                                             (QSETAREF1 |dens| |j| |cden|))))
                                          ('T
                                           (SEQ
                                            (LETT |pp|
                                                  (SPADCALL |r1| |modulus|
                                                            |bound| |bound|
                                                            (QREFELT $ 24))
                                                  . #5#)
                                            (EXIT
                                             (COND
                                              ((QEQCAR |pp| 1)
                                               (SEQ (QSETVELT |state| 1 |j|)
                                                    (EXIT
                                                     (PROGN
                                                      (LETT #1#
                                                            (CONS 1 "failed")
                                                            . #5#)
                                                      (GO #1#)))))
                                              ('T
                                               (SEQ
                                                (LETT |ppr| (QCDR |pp|) . #5#)
                                                (LETT |cden|
                                                      (* |cden| (QCDR |ppr|))
                                                      . #5#)
                                                (EXIT
                                                 (COND
                                                  ((SPADCALL |cden| |bound|
                                                             (QREFELT $ 20))
                                                   (SEQ
                                                    (QSETVELT |state| 1 |j|)
                                                    (EXIT
                                                     (PROGN
                                                      (LETT #1#
                                                            (CONS 1 "failed")
                                                            . #5#)
                                                      (GO #1#)))))
                                                  ('T
                                                   (SEQ
                                                    (QSETAREF1 |nums| |j|
                                                               (QCAR |ppr|))
                                                    (EXIT
                                                     (QSETAREF1 |dens| |j|
                                                                |cden|)))))))))))))))))))
                               NIL (GO G190) G191 (EXIT NIL)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |VECREC2;rational_reconstruction;$U;7| (|statearg| $)
  (|VECREC2;rational_reconstruction2| |statearg| (MAKEARR1 1 0) $)) 

(DEFUN |VECREC2;lcm| (|nums| |lo| |hi| $)
  (PROG (|res| |i|)
    (RETURN
     (SEQ (LETT |res| (QAREF1 |nums| |lo|) . #1=(|VECREC2;lcm|))
          (SEQ (LETT |i| (+ |lo| 1) . #1#) G190 (COND ((> |i| |hi|) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res|
                       (SPADCALL |res| (QAREF1 |nums| |i|) (QREFELT $ 34))
                       . #1#)))
               (LETT |i| (+ |i| 1) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |VECREC2;gcd| (|nums| |lo| |hi| $)
  (PROG (|res| |i|)
    (RETURN
     (SEQ (LETT |res| (QAREF1 |nums| |lo|) . #1=(|VECREC2;gcd|))
          (SEQ (LETT |i| (+ |lo| 1) . #1#) G190 (COND ((> |i| |hi|) (GO G191)))
               (SEQ (EXIT (LETT |res| (GCD |res| (QAREF1 |nums| |i|)) . #1#)))
               (LETT |i| (+ |i| 1) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |VECREC2;remove_denoms;V3Pa;10| (|block_offsets| |nums| |dens| $)
  (PROG (#1=#:G239 |i| |cfactor| |tmpp2| |cden| |hi| |li| |ib| |res| |np| |nb|)
    (RETURN
     (SEQ
      (LETT |nb| (QVSIZE |block_offsets|)
            . #2=(|VECREC2;remove_denoms;V3Pa;10|))
      (LETT |np| (QVSIZE |nums|) . #2#) (LETT |res| (MAKEARR1 |np| 0) . #2#)
      (SEQ (LETT |ib| 1 . #2#) G190 (COND ((|greater_SI| |ib| |nb|) (GO G191)))
           (SEQ
            (LETT |li| (SPADCALL |block_offsets| |ib| (QREFELT $ 28)) . #2#)
            (LETT |hi|
                  (COND ((EQL |ib| |nb|) |np|)
                        ('T
                         (SPADCALL |block_offsets| (+ |ib| 1) (QREFELT $ 28))))
                  . #2#)
            (LETT |hi| (- |hi| 1) . #2#)
            (LETT |cden| (|VECREC2;lcm| |dens| |li| |hi| $) . #2#)
            (SEQ (LETT |i| |li| . #2#) G190 (COND ((> |i| |hi|) (GO G191)))
                 (SEQ
                  (LETT |tmpp2|
                        (PROG2
                            (LETT #1#
                                  (SPADCALL |cden| (QAREF1 |dens| |i|)
                                            (QREFELT $ 36))
                                  . #2#)
                            (QCDR #1#)
                          (|check_union| (QEQCAR #1# 0) (|Integer|) #1#))
                        . #2#)
                  (EXIT (QSETAREF1 |res| |i| (* (QAREF1 |nums| |i|) |tmpp2|))))
                 (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
            (LETT |cfactor| (|VECREC2;gcd| |res| |li| |hi| $) . #2#)
            (EXIT
             (COND
              ((SPADCALL |cfactor| 1 (QREFELT $ 21))
               (COND
                ((SPADCALL |cfactor| 0 (QREFELT $ 21))
                 (SEQ (LETT |i| |li| . #2#) G190
                      (COND ((> |i| |hi|) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF1 |res| |i|
                                   (PROG2
                                       (LETT #1#
                                             (SPADCALL (QAREF1 |res| |i|)
                                                       |cfactor|
                                                       (QREFELT $ 36))
                                             . #2#)
                                       (QCDR #1#)
                                     (|check_union| (QEQCAR #1# 0) (|Integer|)
                                                    #1#)))))
                      (LETT |i| (+ |i| 1) . #2#) (GO G190) G191
                      (EXIT NIL))))))))
           (LETT |ib| (|inc_SI| |ib|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |VECREC2;reconstruct;$VU;11| (|statearg| |block_offsets| $)
  (PROG (|ppr| #1=#:G257 |pp|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |pp|
              (|VECREC2;rational_reconstruction2| |statearg| |block_offsets| $)
              . #2=(|VECREC2;reconstruct;$VU;11|))
        (EXIT
         (COND
          ((QEQCAR |pp| 1) (PROGN (LETT #1# (CONS 1 "failed") . #2#) (GO #1#)))
          ('T
           (SEQ (LETT |ppr| (QCDR |pp|) . #2#)
                (EXIT
                 (CONS 0
                       (SPADCALL |block_offsets| (QCAR |ppr|) (QCDR |ppr|)
                                 (QREFELT $ 37))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |VectorIntegerReconstructor| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G259)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|VectorIntegerReconstructor|)
                . #2=(|VectorIntegerReconstructor|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|VectorIntegerReconstructor|
                         (LIST
                          (CONS NIL
                                (CONS 1 (|VectorIntegerReconstructor;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|VectorIntegerReconstructor|))))))))))) 

(DEFUN |VectorIntegerReconstructor;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|VectorIntegerReconstructor|)
            . #1=(|VectorIntegerReconstructor|))
      (LETT $ (GETREFV 40) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|VectorIntegerReconstructor| NIL
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6
                (|Record| (|:| |cmod| (|Integer|)) (|:| |curj| (|Integer|))
                          (|:| |nmods| (|Integer|)) (|:| |nints| (|Integer|))
                          (|:| |ints| (|PrimitiveArray| (|Integer|)))
                          (|:| |bints| (|PrimitiveArray| (|Integer|)))
                          (|:| |bcmod| (|Integer|)) (|:| |bnmods| (|Integer|))
                          (|:| |nrecs| (|Integer|))
                          (|:| |numers| (|PrimitiveArray| (|Integer|)))
                          (|:| |denoms| (|PrimitiveArray| (|Integer|)))))
      $)))) 

(MAKEPROP '|VectorIntegerReconstructor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep|
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 7 '"failed")
              (|Integer|) (0 . |extendedEuclidean|) |VECREC2;empty;I$;2|
              (7 . |positiveRemainder|) (|Boolean|) (|PrimitiveArray| 9)
              (13 . |empty?|) (|Void|) (|U32Vector|)
              |VECREC2;chinese_update;UvI$V;3| |VECREC2;hensel_update;UvI$V;4|
              (18 . >) (24 . ~=) (|Record| (|:| |num| 9) (|:| |den| 9))
              (|Union| 22 '"failed") |VECREC2;rational_reconstruction;4IU;5|
              (|IntegerRoots| 9) (30 . |approxSqrt|) (|Vector| 9) (35 . |elt|)
              (|NonNegativeInteger|) (41 . >)
              (|Record| (|:| |numers| 14) (|:| |denoms| 14))
              (|Union| 31 '"failed") |VECREC2;rational_reconstruction;$U;7|
              (47 . |lcm|) (|Union| $ '"failed") (53 . |exquo|)
              |VECREC2;remove_denoms;V3Pa;10| (|Union| 14 '"failed")
              |VECREC2;reconstruct;$VU;11|)
           '#(|remove_denoms| 59 |reconstruct| 66 |rational_reconstruction| 72
              |hensel_update| 85 |empty| 92 |chinese_update| 97)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 39
                                                 '(3 9 8 0 0 0 10 2 9 0 0 0 12
                                                   1 14 13 0 15 2 9 13 0 0 20 2
                                                   9 13 0 0 21 1 25 9 9 26 2 27
                                                   9 0 9 28 2 29 13 0 0 30 2 9
                                                   0 0 0 34 2 9 35 0 0 36 3 0
                                                   14 27 14 14 37 2 0 38 0 27
                                                   39 1 0 32 0 33 4 0 23 9 9 9
                                                   9 24 3 0 16 17 9 0 19 1 0 0
                                                   9 11 3 0 16 17 9 0 18)))))
           '|lookupComplete|)) 

(MAKEPROP '|VectorIntegerReconstructor| 'NILADIC T) 
