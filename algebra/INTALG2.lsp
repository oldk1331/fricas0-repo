
(SDEFUN |INTALG2;exp_hermite1|
        ((|f| R)
         (|der| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         ($ |Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R)))
        (SPROG
         ((|h| (|Record| (|:| |answer| R) (|:| |logpart| R))) (|fp| (R))
          (|ff| (R)) (|w| (|Vector| R))
          (|r|
           (|Record|
            (|:| |polyPart|
                 (|LaurentPolynomial| F (|SparseUnivariatePolynomial| F)))
            (|:| |fracPart| (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (#1=#:G122 NIL) (|i| NIL)
          (|vf| #2=(|Vector| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|vp| #2#) (|n| (|NonNegativeInteger|))
          (|v| #3=(|Vector| (|SparseUnivariatePolynomial| F)))
          (|d| #4=(|SparseUnivariatePolynomial| F))
          (|c| (|Record| (|:| |num| #3#) (|:| |den| #4#))))
         (SEQ (LETT |d| (QCDR (LETT |c| (SPADCALL |f| (QREFELT $ 10)))))
              (LETT |v| (QCAR |c|))
              (LETT |vp|
                    (MAKEARR1 (LETT |n| (QVSIZE |v|)) (|spadConstant| $ 12)))
              (LETT |vf| (MAKEARR1 |n| (|spadConstant| $ 12)))
              (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 17)))
                   (LETT #1# (QVSIZE |v|)) G190 (COND ((> |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |r|
                          (SPADCALL
                           (SPADCALL (QAREF1O |v| |i| 1) |d| (QREFELT $ 19))
                           (QREFELT $ 22)))
                    (QSETAREF1O |vf| |i| (QCDR |r|) 1)
                    (EXIT
                     (QSETAREF1O |vp| |i| (SPADCALL (QCAR |r|) (QREFELT $ 23))
                                 1)))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (LETT |ff|
                    (SPADCALL |vf| (LETT |w| (SPADCALL (QREFELT $ 25)))
                              (QREFELT $ 27)))
              (LETT |fp| (SPADCALL |vp| |w| (QREFELT $ 27)))
              (LETT |h| (SPADCALL |ff| |der| (QREFELT $ 31)))
              (EXIT (VECTOR (QCAR |h|) (QCDR |h|) |fp|))))) 

(SDEFUN |INTALG2;prim_hermite1|
        ((|f| R)
         (|der| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         ($ |Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R)))
        (SPROG
         ((|fp| (R)) (|ff| (R)) (|w| (|Vector| R))
          (|r|
           (|Record| (|:| |quotient| (|SparseUnivariatePolynomial| F))
                     (|:| |remainder| (|SparseUnivariatePolynomial| F))))
          (#1=#:G132 NIL) (|i| NIL)
          (|vf| #2=(|Vector| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|vp| #2#) (|n| (|NonNegativeInteger|))
          (|v| #3=(|Vector| (|SparseUnivariatePolynomial| F)))
          (|d| #4=(|SparseUnivariatePolynomial| F))
          (|c| (|Record| (|:| |num| #3#) (|:| |den| #4#))) (|hh| (R))
          (|h| (|Record| (|:| |answer| R) (|:| |logpart| R))))
         (SEQ (LETT |h| (SPADCALL |f| |der| (QREFELT $ 31)))
              (EXIT
               (COND
                ((SPADCALL (LETT |hh| (QCDR |h|)) (QREFELT $ 33))
                 (VECTOR (QCAR |h|) (|spadConstant| $ 34)
                         (|spadConstant| $ 34)))
                ('T
                 (SEQ
                  (LETT |d| (QCDR (LETT |c| (SPADCALL |hh| (QREFELT $ 10)))))
                  (LETT |v| (QCAR |c|))
                  (LETT |vp|
                        (MAKEARR1 (LETT |n| (QVSIZE |v|))
                                  (|spadConstant| $ 12)))
                  (LETT |vf| (MAKEARR1 |n| (|spadConstant| $ 12)))
                  (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 17)))
                       (LETT #1# (QVSIZE |v|)) G190
                       (COND ((> |i| #1#) (GO G191)))
                       (SEQ
                        (LETT |r|
                              (SPADCALL (QAREF1O |v| |i| 1) |d|
                                        (QREFELT $ 36)))
                        (QSETAREF1O |vf| |i|
                                    (SPADCALL (QCDR |r|) |d| (QREFELT $ 19)) 1)
                        (EXIT
                         (QSETAREF1O |vp| |i|
                                     (SPADCALL (QCAR |r|) (QREFELT $ 37)) 1)))
                       (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                  (LETT |ff|
                        (SPADCALL |vf| (LETT |w| (SPADCALL (QREFELT $ 25)))
                                  (QREFELT $ 27)))
                  (LETT |fp| (SPADCALL |vp| |w| (QREFELT $ 27)))
                  (EXIT (VECTOR (QCAR |h|) |ff| |fp|))))))))) 

(SDEFUN |INTALG2;list_hermite|
        ((|lf| |List| R)
         (|hermite1| |Mapping|
          (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R)) R)
         ($ |List|
          (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))))
        (SPROG ((#1=#:G136 NIL) (|f| NIL) (#2=#:G135 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |f| NIL) (LETT #1# |lf|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT (LETT #2# (CONS (SPADCALL |f| |hermite1|) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |INTALG2;lin_comb2| ((|v| |Vector| F) (|lr| |List| R) ($ R))
        (SPROG
         ((|res| (R)) (#1=#:G140 NIL) (|i| NIL) (#2=#:G141 NIL) (|r| NIL))
         (SEQ (LETT |res| (|spadConstant| $ 34))
              (SEQ (LETT |r| NIL) (LETT #2# |lr|) (LETT |i| 1)
                   (LETT #1# (QVSIZE |v|)) G190
                   (COND
                    ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                         (PROGN (LETT |r| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |v| |i| (QREFELT $ 39))
                                        (QREFELT $ 40))
                                       (QREFELT $ 37))
                                      |r| (QREFELT $ 41))
                                     (QREFELT $ 42)))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |INTALG2;split_logpart|
        ((|p| |Fraction| (|SparseUnivariatePolynomial| F))
         (|lg| |Fraction| (|SparseUnivariatePolynomial| F))
         (|dden| |SparseUnivariatePolynomial| F)
         ($ |Record|
          (|:| |polypart| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|b| #1=(|SparseUnivariatePolynomial| F))
          (|a| #2=(|SparseUnivariatePolynomial| F))
          (|#G21|
           (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| F))
                     (|:| |coef2| (|SparseUnivariatePolynomial| F))))
          (#3=#:G148 NIL)
          (|eeu|
           (|Union| (|Record| (|:| |coef1| #2#) (|:| |coef2| #1#))
                    #4="failed"))
          (|d1| (|SparseUnivariatePolynomial| F)) (#5=#:G144 NIL)
          (|g| (|SparseUnivariatePolynomial| F))
          (|d0| (|SparseUnivariatePolynomial| F)))
         (SEQ (LETT |d0| (SPADCALL |lg| (QREFELT $ 43)))
              (LETT |g| (SPADCALL |dden| |d0| (QREFELT $ 44)))
              (EXIT
               (COND ((SPADCALL |g| (QREFELT $ 45)) (CONS |p| |lg|))
                     (#6='T
                      (SEQ
                       (LETT |d1|
                             (PROG2
                                 (LETT #5# (SPADCALL |d0| |g| (QREFELT $ 47)))
                                 (QCDR #5#)
                               (|check_union2| (QEQCAR #5# 0)
                                               (|SparseUnivariatePolynomial|
                                                (QREFELT $ 7))
                                               (|Union|
                                                (|SparseUnivariatePolynomial|
                                                 (QREFELT $ 7))
                                                "failed")
                                               #5#)))
                       (EXIT
                        (COND
                         ((SPADCALL |d1| (QREFELT $ 45))
                          (CONS (SPADCALL |p| |lg| (QREFELT $ 48))
                                (|spadConstant| $ 12)))
                         (#6#
                          (SEQ
                           (LETT |eeu|
                                 (SPADCALL |g| |d1|
                                           (SPADCALL |lg| (QREFELT $ 49))
                                           (QREFELT $ 52)))
                           (PROGN
                            (LETT |#G21|
                                  (PROG2 (LETT #3# |eeu|)
                                      (QCDR #3#)
                                    (|check_union2| (QEQCAR #3# 0)
                                                    (|Record|
                                                     (|:| |coef1|
                                                          (|SparseUnivariatePolynomial|
                                                           (QREFELT $ 7)))
                                                     (|:| |coef2|
                                                          (|SparseUnivariatePolynomial|
                                                           (QREFELT $ 7))))
                                                    (|Union|
                                                     (|Record|
                                                      (|:| |coef1|
                                                           (|SparseUnivariatePolynomial|
                                                            (QREFELT $ 7)))
                                                      (|:| |coef2|
                                                           (|SparseUnivariatePolynomial|
                                                            (QREFELT $ 7))))
                                                     #4#)
                                                    #3#)))
                            (LETT |a| (QCAR |#G21|))
                            (LETT |b| (QCDR |#G21|))
                            |#G21|)
                           (EXIT
                            (CONS
                             (SPADCALL |p| (SPADCALL |a| |d1| (QREFELT $ 19))
                                       (QREFELT $ 48))
                             (SPADCALL |b| |g| (QREFELT $ 19))))))))))))))) 

(SDEFUN |INTALG2;split_logparts|
        ((|lup| |List| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|llog| |List| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|dden| |SparseUnivariatePolynomial| F)
         ($ |Record|
          (|:| |polypart|
               (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|:| |logpart|
               (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))))
        (SPROG
         ((|lres| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|pres| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|lg2| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|p2| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|#G27|
           (|Record|
            (|:| |polypart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (#1=#:G159 NIL) (|p1| NIL) (#2=#:G160 NIL) (|lg1| NIL))
         (SEQ (LETT |pres| NIL) (LETT |lres| NIL)
              (SEQ (LETT |lg1| NIL) (LETT #2# |llog|) (LETT |p1| NIL)
                   (LETT #1# |lup|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |p1| (CAR #1#)) NIL)
                         (ATOM #2#) (PROGN (LETT |lg1| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (PROGN
                     (LETT |#G27|
                           (|INTALG2;split_logpart| |p1| |lg1| |dden| $))
                     (LETT |p2| (QCAR |#G27|))
                     (LETT |lg2| (QCDR |#G27|))
                     |#G27|)
                    (LETT |lres| (CONS |lg2| |lres|))
                    (EXIT (LETT |pres| (CONS |p2| |pres|))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#)))) (GO G190)
                   G191 (EXIT NIL))
              (LETT |pres| (NREVERSE |pres|)) (LETT |lres| (NREVERSE |lres|))
              (EXIT (CONS |pres| |lres|))))) 

(SDEFUN |INTALG2;diagextint|
        ((|dden| |SparseUnivariatePolynomial| F)
         (|dm| |Matrix| (|SparseUnivariatePolynomial| F)) (|w| |Vector| R)
         (|lpv| |List|
          (|Vector| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|lgv| |List|
          (|Vector| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|ca0| |List| R)
         (|ext| |Mapping|
          #1=(|List|
              (|Record|
               (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
               (|:| |coeffs| #2=(|Vector| F))))
          (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|rde| |Mapping|
          #3=(|List|
              (|Record|
               (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
               (|:| |coeffs| (|Vector| F))))
          (|Fraction| (|SparseUnivariatePolynomial| F))
          (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|csolve| |Mapping| #4=(|List| (|Vector| F)) (|Matrix| F))
         ($ |List| (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#5=#:G204 NIL) (|ai| NIL) (#6=#:G205 NIL) (|bv| NIL) (#7=#:G203 NIL)
          (|ca| (|List| R)) (|cb| (|List| #2#)) (|nca1| (|List| R))
          (#8=#:G202 NIL) (|be| NIL) (#9=#:G201 NIL) (|wi| (R))
          (|ncb1| (|List| #10=(|Vector| F))) (#11=#:G200 NIL) (#12=#:G199 NIL)
          (|res2| #3#)
          (|lup2| (|List| #13=(|Fraction| (|SparseUnivariatePolynomial| F))))
          (#14=#:G198 NIL) (#15=#:G197 NIL) (|nca0| (|List| R))
          (#16=#:G196 NIL) (#17=#:G195 NIL) (|ncb0| (|List| #10#))
          (#18=#:G194 NIL) (#19=#:G193 NIL) (|res1| #4#) (|rs2| (|Matrix| F))
          (|rs1| (|Matrix| (|SparseUnivariatePolynomial| F)))
          (|llog2| (|List| #13#)) (#20=#:G192 NIL) (#21=#:G191 NIL)
          (|llog1| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|lup1| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|#G44|
           (|Record|
            (|:| |polypart|
                 (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |logpart|
                 (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))))
          (|llog0| (|List| #22=(|Fraction| (|SparseUnivariatePolynomial| F))))
          (#23=#:G190 NIL) (|gv| NIL) (#24=#:G189 NIL) (|lup0| (|List| #22#))
          (#25=#:G188 NIL) (|pv| NIL) (#26=#:G187 NIL)
          (|dmi| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (#27=#:G186 NIL) (|i| NIL) (#28=#:G185 NIL) (|be0| NIL)
          (#29=#:G184 NIL) (#30=#:G183 NIL) (#31=#:G182 NIL) (|res0| #1#)
          (|lrf| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (#32=#:G180 NIL) (#33=#:G181 NIL) (#34=#:G179 NIL))
         (SEQ
          (LETT |lrf|
                (PROGN
                 (LETT #34# NIL)
                 (SEQ (LETT |gv| NIL) (LETT #33# |lgv|) (LETT |pv| NIL)
                      (LETT #32# |lpv|) G190
                      (COND
                       ((OR (ATOM #32#) (PROGN (LETT |pv| (CAR #32#)) NIL)
                            (ATOM #33#) (PROGN (LETT |gv| (CAR #33#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #34#
                              (CONS
                               (SPADCALL (SPADCALL |pv| 1 (QREFELT $ 55))
                                         (SPADCALL |gv| 1 (QREFELT $ 55))
                                         (QREFELT $ 48))
                               #34#))))
                      (LETT #32# (PROG1 (CDR #32#) (LETT #33# (CDR #33#))))
                      (GO G190) G191 (EXIT (NREVERSE #34#)))))
          (LETT |res0| (SPADCALL |lrf| |ext|))
          (LETT |cb|
                (PROGN
                 (LETT #31# NIL)
                 (SEQ (LETT |be0| NIL) (LETT #30# |res0|) G190
                      (COND
                       ((OR (ATOM #30#) (PROGN (LETT |be0| (CAR #30#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #31# (CONS (QCDR |be0|) #31#))))
                      (LETT #30# (CDR #30#)) (GO G190) G191
                      (EXIT (NREVERSE #31#)))))
          (LETT |wi| (SPADCALL |w| 1 (QREFELT $ 57)))
          (LETT |ca|
                (PROGN
                 (LETT #29# NIL)
                 (SEQ (LETT |be0| NIL) (LETT #28# |res0|) G190
                      (COND
                       ((OR (ATOM #28#) (PROGN (LETT |be0| (CAR #28#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #29#
                              (CONS (SPADCALL (QCAR |be0|) |wi| (QREFELT $ 41))
                                    #29#))))
                      (LETT #28# (CDR #28#)) (GO G190) G191
                      (EXIT (NREVERSE #29#)))))
          (SEQ (LETT |i| 2) (LETT #27# (QVSIZE |w|)) G190
               (COND ((|greater_SI| |i| #27#) (GO G191)))
               (SEQ
                (LETT |dmi|
                      (SPADCALL (SPADCALL |dm| |i| |i| (QREFELT $ 59)) |dden|
                                (QREFELT $ 19)))
                (LETT |lup0|
                      (PROGN
                       (LETT #26# NIL)
                       (SEQ (LETT |pv| NIL) (LETT #25# |lpv|) G190
                            (COND
                             ((OR (ATOM #25#)
                                  (PROGN (LETT |pv| (CAR #25#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #26#
                                    (CONS (SPADCALL |pv| |i| (QREFELT $ 55))
                                          #26#))))
                            (LETT #25# (CDR #25#)) (GO G190) G191
                            (EXIT (NREVERSE #26#)))))
                (LETT |llog0|
                      (PROGN
                       (LETT #24# NIL)
                       (SEQ (LETT |gv| NIL) (LETT #23# |lgv|) G190
                            (COND
                             ((OR (ATOM #23#)
                                  (PROGN (LETT |gv| (CAR #23#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #24#
                                    (CONS (SPADCALL |gv| |i| (QREFELT $ 55))
                                          #24#))))
                            (LETT #23# (CDR #23#)) (GO G190) G191
                            (EXIT (NREVERSE #24#)))))
                (PROGN
                 (LETT |#G44|
                       (|INTALG2;split_logparts| |lup0| |llog0|
                        (SPADCALL |dmi| (QREFELT $ 43)) $))
                 (LETT |lup1| (QCAR |#G44|))
                 (LETT |llog1| (QCDR |#G44|))
                 |#G44|)
                (LETT |llog2|
                      (PROGN
                       (LETT #21# NIL)
                       (SEQ (LETT |bv| NIL) (LETT #20# |cb|) G190
                            (COND
                             ((OR (ATOM #20#)
                                  (PROGN (LETT |bv| (CAR #20#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #21#
                                    (CONS
                                     (SPADCALL |bv| |llog1| (QREFELT $ 62))
                                     #21#))))
                            (LETT #20# (CDR #20#)) (GO G190) G191
                            (EXIT (NREVERSE #21#)))))
                (LETT |rs1|
                      (SPADCALL (SPADCALL (LIST |llog2|) (QREFELT $ 65))
                                (QREFELT $ 67)))
                (LETT |rs2| (SPADCALL |rs1| (QREFELT $ 69)))
                (LETT |res1| (SPADCALL |rs2| |csolve|))
                (LETT |ncb0|
                      (PROGN
                       (LETT #19# NIL)
                       (SEQ (LETT |bv| NIL) (LETT #18# |res1|) G190
                            (COND
                             ((OR (ATOM #18#)
                                  (PROGN (LETT |bv| (CAR #18#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #19#
                                    (CONS (SPADCALL |bv| |cb| (QREFELT $ 71))
                                          #19#))))
                            (LETT #18# (CDR #18#)) (GO G190) G191
                            (EXIT (NREVERSE #19#)))))
                (LETT |nca0|
                      (PROGN
                       (LETT #17# NIL)
                       (SEQ (LETT |bv| NIL) (LETT #16# |res1|) G190
                            (COND
                             ((OR (ATOM #16#)
                                  (PROGN (LETT |bv| (CAR #16#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #17#
                                    (CONS (|INTALG2;lin_comb2| |bv| |ca| $)
                                          #17#))))
                            (LETT #16# (CDR #16#)) (GO G190) G191
                            (EXIT (NREVERSE #17#)))))
                (LETT |cb| |ncb0|) (LETT |ca| |nca0|)
                (LETT |lup2|
                      (PROGN
                       (LETT #15# NIL)
                       (SEQ (LETT |bv| NIL) (LETT #14# |cb|) G190
                            (COND
                             ((OR (ATOM #14#)
                                  (PROGN (LETT |bv| (CAR #14#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #15#
                                    (CONS (SPADCALL |bv| |lup1| (QREFELT $ 62))
                                          #15#))))
                            (LETT #14# (CDR #14#)) (GO G190) G191
                            (EXIT (NREVERSE #15#)))))
                (LETT |res2| (SPADCALL |dmi| |lup2| |rde|))
                (LETT |ncb1|
                      (PROGN
                       (LETT #12# NIL)
                       (SEQ (LETT |be| NIL) (LETT #11# |res2|) G190
                            (COND
                             ((OR (ATOM #11#)
                                  (PROGN (LETT |be| (CAR #11#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #12#
                                    (CONS
                                     (SPADCALL (QCDR |be|) |cb| (QREFELT $ 71))
                                     #12#))))
                            (LETT #11# (CDR #11#)) (GO G190) G191
                            (EXIT (NREVERSE #12#)))))
                (LETT |wi| (SPADCALL |w| |i| (QREFELT $ 57)))
                (LETT |nca1|
                      (PROGN
                       (LETT #9# NIL)
                       (SEQ (LETT |be| NIL) (LETT #8# |res2|) G190
                            (COND
                             ((OR (ATOM #8#) (PROGN (LETT |be| (CAR #8#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #9#
                                    (CONS
                                     (SPADCALL
                                      (SPADCALL (QCAR |be|) |wi|
                                                (QREFELT $ 41))
                                      (|INTALG2;lin_comb2| (QCDR |be|) |ca| $)
                                      (QREFELT $ 42))
                                     #9#))))
                            (LETT #8# (CDR #8#)) (GO G190) G191
                            (EXIT (NREVERSE #9#)))))
                (LETT |cb| |ncb1|) (EXIT (LETT |ca| |nca1|)))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (PROGN
            (LETT #7# NIL)
            (SEQ (LETT |bv| NIL) (LETT #6# |cb|) (LETT |ai| NIL)
                 (LETT #5# |ca|) G190
                 (COND
                  ((OR (ATOM #5#) (PROGN (LETT |ai| (CAR #5#)) NIL) (ATOM #6#)
                       (PROGN (LETT |bv| (CAR #6#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #7#
                         (CONS
                          (CONS
                           (SPADCALL |ai| (|INTALG2;lin_comb2| |bv| |ca0| $)
                                     (QREFELT $ 72))
                           |bv|)
                          #7#))))
                 (LETT #5# (PROG1 (CDR #5#) (LETT #6# (CDR #6#)))) (GO G190)
                 G191 (EXIT (NREVERSE #7#)))))))) 

(SDEFUN |INTALG2;R_to_VQF|
        ((|p| R) ($ |Vector| (|Fraction| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((#1=#:G210 NIL) (|i| NIL)
          (|cden| #2=(|SparseUnivariatePolynomial| F))
          (|res| (|Vector| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|n| (|NonNegativeInteger|))
          (|numv| #3=(|Vector| (|SparseUnivariatePolynomial| F)))
          (|c| (|Record| (|:| |num| #3#) (|:| |den| #2#))))
         (SEQ (LETT |c| (SPADCALL |p| (QREFELT $ 10))) (LETT |numv| (QCAR |c|))
              (LETT |n| (QVSIZE |numv|))
              (LETT |res| (MAKEARR1 |n| (|spadConstant| $ 12)))
              (LETT |cden| (QCDR |c|))
              (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |res| |i|
                               (SPADCALL (SPADCALL |numv| |i| (QREFELT $ 73))
                                         |cden| (QREFELT $ 19))
                               (QREFELT $ 74))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |INTALG2;algprimextint|
        ((|der| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         (|ext| |Mapping|
          (|List|
           (|Record|
            (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |coeffs| (|Vector| F))))
          (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|rde| |Mapping|
          (|List|
           (|Record|
            (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |coeffs| (|Vector| F))))
          (|Fraction| (|SparseUnivariatePolynomial| F))
          (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|csolve| |Mapping| (|List| (|Vector| F)) (|Matrix| F))
         (|lg| |List| R)
         ($ |List| (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((|ca0| (|List| R)) (#1=#:G230 NIL) (|h| NIL) (#2=#:G229 NIL)
          (|dden| #3=(|SparseUnivariatePolynomial| F))
          (|dm|
           (|Record| (|:| |num| (|Matrix| (|SparseUnivariatePolynomial| F)))
                     (|:| |den| #3#)))
          (|w| (|Vector| R))
          (|lgv|
           (|List| (|Vector| (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (|lpv|
           (|List| (|Vector| (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (#4=#:G228 NIL)
          (|lh|
           (|List|
            (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))))
          (|hermite1|
           (|Mapping|
            (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))
            R)))
         (SEQ
          (LETT |hermite1| (CONS #'|INTALG2;algprimextint!0| (VECTOR $ |der|)))
          (LETT |lh| (|INTALG2;list_hermite| |lg| |hermite1| $))
          (LETT |lpv| NIL) (LETT |lgv| NIL)
          (SEQ (LETT |h| NIL) (LETT #4# |lh|) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |h| (CAR #4#)) NIL)) (GO G191)))
               (SEQ
                (LETT |lpv| (CONS (|INTALG2;R_to_VQF| (QVELT |h| 2) $) |lpv|))
                (EXIT
                 (LETT |lgv|
                       (CONS (|INTALG2;R_to_VQF| (QVELT |h| 1) $) |lgv|))))
               (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
          (LETT |lpv| (NREVERSE |lpv|)) (LETT |lgv| (NREVERSE |lgv|))
          (LETT |w| (SPADCALL (QREFELT $ 25)))
          (LETT |dm| (SPADCALL |der| (QREFELT $ 76))) (LETT |dden| (QCDR |dm|))
          (LETT |ca0|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |h| NIL) (LETT #1# |lh|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |h| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QVELT |h| 0) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (COND
           ((SPADCALL (SPADCALL |w| 1 (QREFELT $ 57)) (|spadConstant| $ 77)
                      (QREFELT $ 78))
            (COND
             ((SPADCALL (QCAR |dm|) (QREFELT $ 79))
              (EXIT
               (|INTALG2;diagextint| |dden| (QCAR |dm|) |w| |lpv| |lgv| |ca0|
                |ext| |rde| |csolve| $))))))
          (EXIT (|error| "algprimextint: non-root case unimplemented"))))) 

(SDEFUN |INTALG2;algprimextint!0| ((|g| NIL) ($$ NIL))
        (PROG (|der| $)
          (LETT |der| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|INTALG2;prim_hermite1| |g| |der| $))))) 

(SDEFUN |INTALG2;algexpextint|
        ((|der| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         (|ext| |Mapping|
          (|List|
           (|Record|
            (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |coeffs| (|Vector| F))))
          (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|rde| |Mapping|
          (|List|
           (|Record|
            (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |coeffs| (|Vector| F))))
          (|Fraction| (|SparseUnivariatePolynomial| F))
          (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|csolve| |Mapping| (|List| (|Vector| F)) (|Matrix| F))
         (|lg| |List| R)
         ($ |List| (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((|ca0| (|List| R)) (#1=#:G250 NIL) (|h| NIL) (#2=#:G249 NIL)
          (|dden| #3=(|SparseUnivariatePolynomial| F))
          (|dm|
           (|Record| (|:| |num| (|Matrix| (|SparseUnivariatePolynomial| F)))
                     (|:| |den| #3#)))
          (|lgv|
           (|List| (|Vector| (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (|lpv|
           (|List| (|Vector| (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (#4=#:G248 NIL) (|n| (|NonNegativeInteger|)) (|w| (|Vector| R))
          (|lh|
           (|List|
            (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))))
          (|hermite1|
           (|Mapping|
            (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))
            R)))
         (SEQ
          (LETT |hermite1| (CONS #'|INTALG2;algexpextint!0| (VECTOR $ |der|)))
          (LETT |lh| (|INTALG2;list_hermite| |lg| |hermite1| $))
          (LETT |lpv| NIL) (LETT |lgv| NIL)
          (LETT |w| (SPADCALL (QREFELT $ 25))) (LETT |n| (QVSIZE |w|))
          (SEQ (LETT |h| NIL) (LETT #4# |lh|) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |h| (CAR #4#)) NIL)) (GO G191)))
               (SEQ
                (LETT |lpv| (CONS (|INTALG2;R_to_VQF| (QVELT |h| 2) $) |lpv|))
                (EXIT
                 (LETT |lgv|
                       (CONS (|INTALG2;R_to_VQF| (QVELT |h| 1) $) |lgv|))))
               (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
          (LETT |lpv| (NREVERSE |lpv|)) (LETT |lgv| (NREVERSE |lgv|))
          (LETT |dm| (SPADCALL |der| (QREFELT $ 76))) (LETT |dden| (QCDR |dm|))
          (LETT |ca0|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |h| NIL) (LETT #1# |lh|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |h| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QVELT |h| 0) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (COND
           ((SPADCALL (SPADCALL |w| 1 (QREFELT $ 57)) (|spadConstant| $ 77)
                      (QREFELT $ 78))
            (COND
             ((SPADCALL (QCAR |dm|) (QREFELT $ 79))
              (EXIT
               (|INTALG2;diagextint| |dden| (QCAR |dm|) |w| |lpv| |lgv| |ca0|
                |ext| |rde| |csolve| $))))))
          (EXIT (|error| "algexpextint: non-root case unimplemented"))))) 

(SDEFUN |INTALG2;algexpextint!0| ((|g| NIL) ($$ NIL))
        (PROG (|der| $)
          (LETT |der| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|INTALG2;exp_hermite1| |g| |der| $))))) 

(SDEFUN |INTALG2;algextint_base;MMLL;11|
        ((|der| |Mapping| (|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         (|csolve| |Mapping| #1=(|List| (|Vector| F)) (|Matrix| F))
         (|lg| |List| R)
         ($ |List| (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#2=#:G267 NIL) (|bv| NIL) (#3=#:G266 NIL) (|ca0| (|List| R))
          (#4=#:G265 NIL) (|h| NIL) (#5=#:G264 NIL) (|res1| #1#)
          (|rs3| (|Matrix| F))
          (|rs2| (|Matrix| (|SparseUnivariatePolynomial| F)))
          (|rs1| (|Matrix| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|lg1| (|List| R)) (#6=#:G263 NIL) (#7=#:G262 NIL)
          (|lh|
           (|List|
            (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))))
          (|hermite1|
           (|Mapping|
            (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))
            R)))
         (SEQ
          (LETT |hermite1|
                (CONS #'|INTALG2;algextint_base;MMLL;11!0| (VECTOR $ |der|)))
          (LETT |lh| (|INTALG2;list_hermite| |lg| |hermite1| $))
          (LETT |lg1|
                (PROGN
                 (LETT #7# NIL)
                 (SEQ (LETT |h| NIL) (LETT #6# |lh|) G190
                      (COND
                       ((OR (ATOM #6#) (PROGN (LETT |h| (CAR #6#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #7#
                              (CONS
                               (SPADCALL (QVELT |h| 1) (QVELT |h| 2)
                                         (QREFELT $ 42))
                               #7#))))
                      (LETT #6# (CDR #6#)) (GO G190) G191
                      (EXIT (NREVERSE #7#)))))
          (LETT |rs1|
                (SPADCALL (SPADCALL (LIST |lg1|) (QREFELT $ 82))
                          (QREFELT $ 83)))
          (LETT |rs2| (SPADCALL |rs1| (QREFELT $ 67)))
          (LETT |rs3| (SPADCALL |rs2| (QREFELT $ 69)))
          (LETT |res1| (SPADCALL |rs3| |csolve|))
          (LETT |ca0|
                (PROGN
                 (LETT #5# NIL)
                 (SEQ (LETT |h| NIL) (LETT #4# |lh|) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |h| (CAR #4#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #5# (CONS (QVELT |h| 0) #5#))))
                      (LETT #4# (CDR #4#)) (GO G190) G191
                      (EXIT (NREVERSE #5#)))))
          (EXIT
           (PROGN
            (LETT #3# NIL)
            (SEQ (LETT |bv| NIL) (LETT #2# |res1|) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |bv| (CAR #2#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #3#
                         (CONS
                          (CONS
                           (SPADCALL (|INTALG2;lin_comb2| |bv| |ca0| $)
                                     (QREFELT $ 84))
                           |bv|)
                          #3#))))
                 (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT (NREVERSE #3#)))))))) 

(SDEFUN |INTALG2;algextint_base;MMLL;11!0| ((|g| NIL) ($$ NIL))
        (PROG (|der| $)
          (LETT |der| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|INTALG2;prim_hermite1| |g| |der| $))))) 

(SDEFUN |INTALG2;algextint;MMMMLL;12|
        ((|der| |Mapping| #1=(|SparseUnivariatePolynomial| F)
          (|SparseUnivariatePolynomial| F))
         (|ext| |Mapping|
          (|List|
           (|Record|
            (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |coeffs| (|Vector| F))))
          (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|rde| |Mapping|
          (|List|
           (|Record|
            (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |coeffs| (|Vector| F))))
          (|Fraction| (|SparseUnivariatePolynomial| F))
          (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|csolve| |Mapping| (|List| (|Vector| F)) (|Matrix| F))
         (|lg| |List| R)
         ($ |List| (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#2=#:G293 NIL)
          (|xx| (|Union| (|SparseUnivariatePolynomial| F) "failed")) (|x'| #1#)
          (|x| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |x'|
                (SPADCALL
                 (LETT |x| (SPADCALL (|spadConstant| $ 54) 1 (QREFELT $ 91)))
                 |der|))
          (EXIT
           (COND
            ((ZEROP (SPADCALL |x'| (QREFELT $ 92)))
             (|INTALG2;algprimextint| |der| |ext| |rde| |csolve| |lg| $))
            ('T
             (SEQ
              (EXIT
               (SEQ
                (SEQ (LETT |xx| (SPADCALL |x'| |x| (QREFELT $ 47)))
                     (EXIT
                      (COND
                       ((QEQCAR |xx| 0)
                        (COND
                         ((QEQCAR (SPADCALL (QCDR |xx|) (QREFELT $ 94)) 0)
                          (PROGN
                           (LETT #2#
                                 (|INTALG2;algexpextint| |der| |ext| |rde|
                                  |csolve| |lg| $))
                           (GO #3=#:G287))))))))
                (EXIT (|error| "algextint: unhandled case"))))
              #3# (EXIT #2#)))))))) 

(DECLAIM (NOTINLINE |AlgebraicIntegrate2;|)) 

(DEFUN |AlgebraicIntegrate2| (&REST #1=#:G294)
  (SPROG NIL
         (PROG (#2=#:G295)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|AlgebraicIntegrate2|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |AlgebraicIntegrate2;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|AlgebraicIntegrate2|)))))))))) 

(DEFUN |AlgebraicIntegrate2;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 (|devaluate| |#3|))
          (LETT |dv$| (LIST '|AlgebraicIntegrate2| DV$1 DV$2 DV$3))
          (LETT $ (GETREFV 99))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|AlgebraicIntegrate2|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|AlgebraicIntegrate2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Record| (|:| |num| 16) (|:| |den| 18))
              (0 . |integralCoordinates|) (|Fraction| 18) (5 . |Zero|)
              (9 . |Zero|) (13 . |Zero|) (|Integer|) (|Vector| 18)
              (17 . |minIndex|) (|SparseUnivariatePolynomial| 7) (22 . /)
              (|Record| (|:| |polyPart| $) (|:| |fracPart| 11))
              (|LaurentPolynomial| 7 18) (28 . |separate|) (33 . |convert|)
              (|Vector| $) (38 . |integralBasis|) (|Vector| 11)
              (42 . |represents|) (|Record| (|:| |answer| 8) (|:| |logpart| 8))
              (|Mapping| 18 18)
              (|AlgebraicHermiteIntegration| 7 18
                                             (|SparseUnivariatePolynomial| 11)
                                             8)
              (48 . |HermiteIntegrate|) (|Boolean|) (54 . |zero?|)
              (59 . |Zero|) (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (63 . |divide|) (69 . |coerce|) (|Vector| 7) (74 . |elt|)
              (80 . |coerce|) (85 . *) (91 . +) (97 . |denom|) (102 . |gcd|)
              (108 . |ground?|) (|Union| $ '"failed") (113 . |exquo|) (119 . +)
              (125 . |numer|) (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 50 '"failed") (130 . |extendedEuclidean|) (137 . |One|)
              (141 . |One|) (145 . |elt|) (|Vector| 8) (151 . |elt|)
              (|Matrix| 18) (157 . |elt|) (|List| 11)
              (|LinearCombinationUtilities| 7 18) (164 . |lin_comb|)
              (|List| 60) (|Matrix| 11) (170 . |matrix|) (|Matrix| $)
              (175 . |reducedSystem|) (|Matrix| 7) (180 . |reducedSystem|)
              (|List| 38) (185 . |lin_comb|) (191 . -) (197 . |elt|)
              (203 . |setelt!|) (|Record| (|:| |num| 58) (|:| |den| 18))
              (210 . |integralDerivationMatrix|) (215 . |One|) (219 . =)
              (225 . |diagonal?|) (|List| 88) (|Matrix| 8) (230 . |matrix|)
              (235 . |reducedSystem|) (240 . -)
              (|Record| (|:| |ratpart| 8) (|:| |coeffs| 38)) (|List| 85)
              (|Mapping| 70 68) (|List| 8) |INTALG2;algextint_base;MMLL;11|
              (|NonNegativeInteger|) (245 . |monomial|) (251 . |degree|)
              (|Union| 7 '"failed") (256 . |retractIfCan|)
              (|Record| (|:| |ratpart| 11) (|:| |coeffs| 38))
              (|Mapping| (|List| 95) 60) (|Mapping| (|List| 95) 11 60)
              |INTALG2;algextint;MMMMLL;12|)
           '#(|algextint_base| 261 |algextint| 268) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|algextint|
                                 ((|List|
                                   (|Record| (|:| |ratpart| |#3|)
                                             (|:| |coeffs| (|Vector| |#2|))))
                                  (|Mapping|
                                   (|SparseUnivariatePolynomial| |#2|)
                                   (|SparseUnivariatePolynomial| |#2|))
                                  (|Mapping|
                                   (|List|
                                    (|Record|
                                     (|:| |ratpart|
                                          (|Fraction|
                                           (|SparseUnivariatePolynomial|
                                            |#2|)))
                                     (|:| |coeffs| (|Vector| |#2|))))
                                   (|List|
                                    (|Fraction|
                                     (|SparseUnivariatePolynomial| |#2|))))
                                  (|Mapping|
                                   (|List|
                                    (|Record|
                                     (|:| |ratpart|
                                          (|Fraction|
                                           (|SparseUnivariatePolynomial|
                                            |#2|)))
                                     (|:| |coeffs| (|Vector| |#2|))))
                                   (|Fraction|
                                    (|SparseUnivariatePolynomial| |#2|))
                                   (|List|
                                    (|Fraction|
                                     (|SparseUnivariatePolynomial| |#2|))))
                                  (|Mapping| (|List| (|Vector| |#2|))
                                             (|Matrix| |#2|))
                                  (|List| |#3|)))
                                T)
                              '((|algextint_base|
                                 ((|List|
                                   (|Record| (|:| |ratpart| |#3|)
                                             (|:| |coeffs| (|Vector| |#2|))))
                                  (|Mapping|
                                   (|SparseUnivariatePolynomial| |#2|)
                                   (|SparseUnivariatePolynomial| |#2|))
                                  (|Mapping| (|List| (|Vector| |#2|))
                                             (|Matrix| |#2|))
                                  (|List| |#3|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 98
                                            '(1 8 9 0 10 0 11 0 12 0 6 0 13 0 7
                                              0 14 1 16 15 0 17 2 11 0 18 18 19
                                              1 21 20 11 22 1 21 11 0 23 0 8 24
                                              25 2 8 0 26 24 27 2 30 28 8 29 31
                                              1 8 32 0 33 0 8 0 34 2 18 35 0 0
                                              36 1 11 0 18 37 2 38 7 0 15 39 1
                                              18 0 7 40 2 8 0 11 0 41 2 8 0 0 0
                                              42 1 11 18 0 43 2 18 0 0 0 44 1
                                              18 32 0 45 2 18 46 0 0 47 2 11 0
                                              0 0 48 1 11 18 0 49 3 18 51 0 0 0
                                              52 0 6 0 53 0 7 0 54 2 26 11 0 15
                                              55 2 56 8 0 15 57 3 58 18 0 15 15
                                              59 2 61 11 38 60 62 1 64 0 63 65
                                              1 11 58 66 67 1 18 68 66 69 2 61
                                              38 38 70 71 2 8 0 0 0 72 2 16 18
                                              0 15 73 3 26 11 0 15 11 74 1 8 75
                                              29 76 0 8 0 77 2 8 32 0 0 78 1 58
                                              32 0 79 1 81 0 80 82 1 8 64 66 83
                                              1 8 0 0 84 2 18 0 7 90 91 1 18 90
                                              0 92 1 18 93 0 94 3 0 86 29 87 88
                                              89 5 0 86 29 96 97 87 88 98)))))
           '|lookupComplete|)) 
