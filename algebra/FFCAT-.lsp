
(/VERSIONCHECK 2) 

(DEFUN |FFCAT-;Q2RF| (|q| $)
  (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 11)) (QREFELT $ 12))
            (SPADCALL (SPADCALL |q| (QREFELT $ 13)) (QREFELT $ 12))
            (QREFELT $ 15))) 

(DEFUN |FFCAT-;infOrder| (|f| $)
  (- (SPADCALL (SPADCALL |f| (QREFELT $ 16)) (QREFELT $ 18))
     (SPADCALL (SPADCALL |f| (QREFELT $ 19)) (QREFELT $ 18)))) 

(DEFUN |FFCAT-;integral?;SB;3| (|f| $)
  (SPADCALL (QCDR (SPADCALL |f| (QREFELT $ 21))) (QREFELT $ 23))) 

(DEFUN |FFCAT-;integral?;SFB;4| (|f| |a| $)
  (SPADCALL (SPADCALL (QCDR (SPADCALL |f| (QREFELT $ 21))) |a| (QREFELT $ 25))
            (|spadConstant| $ 26) (QREFELT $ 27))) 

(DEFUN |FFCAT-;absolutelyIrreducible?;B;5| ($)
  (EQL (SPADCALL (QREFELT $ 29)) 1)) 

(DEFUN |FFCAT-;yCoordinates;SR;6| (|f| $)
  (SPADCALL (SPADCALL |f| (QREFELT $ 33)) (QREFELT $ 35))) 

(DEFUN |FFCAT-;hyperelliptic;U;7| ($)
  (PROG (|p| |v| |u| |f|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (SPADCALL
          (LETT |f| (SPADCALL (QREFELT $ 37))
                . #1=(|FFCAT-;hyperelliptic;U;7|))
          (QREFELT $ 38))
         2 (QREFELT $ 39))
        (CONS 1 "failed"))
       (#2='T
        (SEQ
         (LETT |u| (SPADCALL (SPADCALL |f| (QREFELT $ 40)) (QREFELT $ 42))
               . #1#)
         (EXIT
          (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                (#2#
                 (SEQ
                  (LETT |v|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (QCDR |u|) (SPADCALL |f| (QREFELT $ 43))
                                    (QREFELT $ 44))
                          (QREFELT $ 45))
                         (QREFELT $ 47))
                        . #1#)
                  (EXIT
                   (COND
                    ((OR (QEQCAR |v| 1)
                         (NULL
                          (ODDP
                           (SPADCALL (LETT |p| (QCDR |v|) . #1#)
                                     (QREFELT $ 18)))))
                     (CONS 1 "failed"))
                    ('T (CONS 0 |p|))))))))))))))) 

(DEFUN |FFCAT-;algSplitSimple;SMR;8| (|f| |derivation| $)
  (PROG (|dd| #1=#:G173 |g| |cd|)
    (RETURN
     (SEQ
      (LETT |cd| (SPADCALL (SPADCALL |f| (QREFELT $ 49)) (QREFELT $ 52))
            . #2=(|FFCAT-;algSplitSimple;SMR;8|))
      (LETT |dd|
            (PROG2
                (LETT #1#
                      (SPADCALL (QCDR |cd|)
                                (LETT |g|
                                      (SPADCALL (QCDR |cd|)
                                                (SPADCALL (QCDR |cd|)
                                                          |derivation|)
                                                (QREFELT $ 53))
                                      . #2#)
                                (QREFELT $ 55))
                      . #2#)
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0) (QREFELT $ 8) #1#))
            . #2#)
      (EXIT
       (VECTOR
        (SPADCALL
         (SPADCALL (SPADCALL (SPADCALL |g| (QREFELT $ 56)) (QREFELT $ 57))
                   (QCAR |cd|) (QREFELT $ 58))
         (QREFELT $ 59))
        |dd| (SPADCALL |dd| |derivation|)
        (SPADCALL |dd| (SPADCALL (SPADCALL (QREFELT $ 60)) (QREFELT $ 61))
                  (QREFELT $ 53)))))))) 

(DEFUN |FFCAT-;elliptic;U;9| ($)
  (PROG (|p| |u|)
    (RETURN
     (SEQ (LETT |u| (SPADCALL (QREFELT $ 65)) . #1=(|FFCAT-;elliptic;U;9|))
          (EXIT
           (COND
            ((OR (QEQCAR |u| 1)
                 (NULL
                  (EQL (SPADCALL (LETT |p| (QCDR |u|) . #1#) (QREFELT $ 18))
                       3)))
             (CONS 1 "failed"))
            ('T (CONS 0 |p|)))))))) 

(DEFUN |FFCAT-;rationalPoint?;2FB;10| (|x| |y| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (SPADCALL (QREFELT $ 37))
              (SPADCALL (SPADCALL |y| (QREFELT $ 12)) (QREFELT $ 56))
              (QREFELT $ 67))
    (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 56)) (QREFELT $ 69))
   (QREFELT $ 70))) 

(DEFUN |FFCAT-;UP2P| (|p| |x| $)
  (SPADCALL (SPADCALL (ELT $ 73) |p| (QREFELT $ 77)) |x| (QREFELT $ 78))) 

(DEFUN |FFCAT-;UPUP2P| (|p| |x| |y| $)
  (PROG ()
    (RETURN
     (SPADCALL
      (SPADCALL (CONS #'|FFCAT-;UPUP2P!0| (VECTOR |x| $)) |p| (QREFELT $ 81))
      |y| (QREFELT $ 78))))) 

(DEFUN |FFCAT-;UPUP2P!0| (|s| $$)
  (PROG ($ |x|)
    (LETT $ (QREFELT $$ 1) . #1=(|FFCAT-;UPUP2P|))
    (LETT |x| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|FFCAT-;UP2P| (SPADCALL |s| (QREFELT $ 61)) |x| $))))) 

(DEFUN |FFCAT-;nonSingularModel;SL;13| (|u| $)
  (PROG (#1=#:G199 |v| |i| #2=#:G198 |y| |x| |vars| #3=#:G197 |n| #4=#:G196 |d|
         |w|)
    (RETURN
     (SEQ
      (LETT |d|
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (LETT |w| (SPADCALL (QREFELT $ 83))
                     . #5=(|FFCAT-;nonSingularModel;SL;13|))
               (QREFELT $ 85))
              (QREFELT $ 87))
             (QREFELT $ 56))
            . #5#)
      (LETT |vars|
            (PROGN
             (LETT #4# NIL . #5#)
             (SEQ (LETT |i| 1 . #5#)
                  (LETT #3# (LETT |n| (QVSIZE |w|) . #5#) . #5#) G190
                  (COND ((|greater_SI| |i| #3#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #4#
                          (CONS
                           (SPADCALL
                            (STRCONC (SPADCALL |u| (QREFELT $ 90))
                                     (STRINGIMAGE |i|))
                            (QREFELT $ 91))
                           #4#)
                          . #5#)))
                  (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            . #5#)
      (LETT |x| '|%%dummy1| . #5#) (LETT |y| '|%%dummy2| . #5#)
      (EXIT
       (SPADCALL (CONS #'|FFCAT-;nonSingularModel;SL;13!0| (VECTOR |y| $ |x|))
                 (SPADCALL
                  (PROGN
                   (LETT #2# NIL . #5#)
                   (SEQ (LETT |i| 1 . #5#) (LETT |v| NIL . #5#)
                        (LETT #1# |vars| . #5#) G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #5#) NIL)
                              (|greater_SI| |i| |n|))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (SPADCALL (SPADCALL |v| (QREFELT $ 95))
                                           (|FFCAT-;UPUP2P|
                                            (SPADCALL
                                             (SPADCALL |d|
                                                       (SPADCALL |w| |i|
                                                                 (QREFELT $
                                                                          98))
                                                       (QREFELT $ 99))
                                             (QREFELT $ 49))
                                            (SPADCALL |x| (QREFELT $ 95))
                                            (SPADCALL |y| (QREFELT $ 95)) $)
                                           (QREFELT $ 100))
                                 #2#)
                                . #5#)))
                        (LETT #1#
                              (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|) . #5#))
                              . #5#)
                        (GO G190) G191 (EXIT (NREVERSE #2#))))
                  (SPADCALL (LIST |x| |y|) |vars| (QREFELT $ 102))
                  (QREFELT $ 105))
                 (QREFELT $ 107))))))) 

(DEFUN |FFCAT-;nonSingularModel;SL;13!0| (|s| $$)
  (PROG (|x| $ |y|)
    (LETT |x| (QREFELT $$ 2) . #1=(|FFCAT-;nonSingularModel;SL;13|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |y| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (COND
       ((SPADCALL (SPADCALL |s| |x| (QREFELT $ 92)) (QREFELT $ 93))
        (SPADCALL (SPADCALL |s| |y| (QREFELT $ 92)) (QREFELT $ 93)))
       ('T (|spadConstant| $ 94))))))) 

(DEFUN |FFCAT-;ispoint| (|p| |x| |y| $)
  (PROG (|jhd|)
    (RETURN
     (SEQ
      (LETT |jhd|
            (SPADCALL |p|
                      (SPADCALL (SPADCALL |y| (QREFELT $ 12)) (QREFELT $ 56))
                      (QREFELT $ 67))
            |FFCAT-;ispoint|)
      (EXIT
       (COND
        ((SPADCALL
          (SPADCALL |jhd|
                    (SPADCALL (SPADCALL |x| (QREFELT $ 12)) (QREFELT $ 56))
                    (QREFELT $ 69))
          (QREFELT $ 70))
         (LIST |x| |y|))
        ('T NIL))))))) 

(DEFUN |FFCAT-;rationalPoints;L;15| ($)
  (PROG (|pt| #1=#:G205 #2=#:G203 #3=#:G214 |y| #4=#:G213 #5=#:G212 |x|
         #6=#:G211 |p|)
    (RETURN
     (SEQ
      (LETT |p| (SPADCALL (QREFELT $ 37)) . #7=(|FFCAT-;rationalPoints;L;15|))
      (EXIT
       (SPADCALL
        (PROGN
         (LETT #6# NIL . #7#)
         (SEQ (LETT |x| 1 . #7#) (LETT #5# (SPADCALL (QREFELT $ 109)) . #7#)
              G190 (COND ((|greater_SI| |x| #5#) (GO G191)))
              (SEQ
               (EXIT
                (LETT #6#
                      (CONS
                       (PROGN
                        (LETT #4# NIL . #7#)
                        (SEQ (LETT |y| 1 . #7#)
                             (LETT #3# (SPADCALL (QREFELT $ 109)) . #7#) G190
                             (COND ((|greater_SI| |y| #3#) (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((COND
                                  ((NULL
                                    (LETT |pt|
                                          (|FFCAT-;ispoint| |p|
                                           (SPADCALL
                                            (PROG1 (LETT #2# |x| . #7#)
                                              (|check_subtype| (> #2# 0)
                                                               '(|PositiveInteger|)
                                                               #2#))
                                            (QREFELT $ 111))
                                           (SPADCALL
                                            (PROG1 (LETT #1# |y| . #7#)
                                              (|check_subtype| (> #1# 0)
                                                               '(|PositiveInteger|)
                                                               #1#))
                                            (QREFELT $ 111))
                                           $)
                                          . #7#))
                                   'NIL)
                                  ('T 'T))
                                 (LETT #4# (CONS |pt| #4#) . #7#)))))
                             (LETT |y| (|inc_SI| |y|) . #7#) (GO G190) G191
                             (EXIT (NREVERSE #4#))))
                       #6#)
                      . #7#)))
              (LETT |x| (|inc_SI| |x|) . #7#) (GO G190) G191
              (EXIT (NREVERSE #6#))))
        (QREFELT $ 114))))))) 

(DEFUN |FFCAT-;intvalue| (|v| |x| |y| $)
  (PROG (#1=#:G226 |d| |n| #2=#:G220 #3=#:G219 #4=#:G221 #5=#:G223 #6=#:G232
         |i| |rec| #7=#:G216 #8=#:G215 #9=#:G217 #10=#:G231 |mini| |w|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 116)) (|error| "Point is singular"))
            (#11='T
             (SEQ
              (LETT |mini|
                    (SPADCALL
                     (LETT |w| (SPADCALL (QREFELT $ 83))
                           . #12=(|FFCAT-;intvalue|))
                     (QREFELT $ 117))
                    . #12#)
              (LETT |rec|
                    (SPADCALL
                     (PROGN
                      (LETT #7# NIL . #12#)
                      (SEQ (LETT |i| |mini| . #12#)
                           (LETT #10# (QVSIZE |w|) . #12#) G190
                           (COND ((> |i| #10#) (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #9#
                                    (SPADCALL
                                     (SPADCALL (QAREF1O |v| |i| 1)
                                               (QREFELT $ 56))
                                     (QAREF1O |w| |i| 1) (QREFELT $ 99))
                                    . #12#)
                              (COND
                               (#7#
                                (LETT #8# (SPADCALL #8# #9# (QREFELT $ 118))
                                      . #12#))
                               ('T
                                (PROGN
                                 (LETT #8# #9# . #12#)
                                 (LETT #7# 'T . #12#)))))))
                           (LETT |i| (+ |i| 1) . #12#) (GO G190) G191
                           (EXIT NIL))
                      (COND (#7# #8#) (#11# (|spadConstant| $ 119))))
                     (QREFELT $ 120))
                    . #12#)
              (LETT |n|
                    (PROGN
                     (LETT #2# NIL . #12#)
                     (SEQ (LETT |i| |mini| . #12#)
                          (LETT #6# (QVSIZE |w|) . #12#) G190
                          (COND ((> |i| #6#) (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #4#
                                   (SPADCALL
                                    (SPADCALL (QAREF1O (QCAR |rec|) |i| 1) |x|
                                              (QREFELT $ 25))
                                    (SPADCALL |y|
                                              (PROG1
                                                  (LETT #5# (- |i| |mini|)
                                                        . #12#)
                                                (|check_subtype| (>= #5# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 #5#))
                                              (QREFELT $ 121))
                                    (QREFELT $ 122))
                                   . #12#)
                             (COND
                              (#2#
                               (LETT #3# (SPADCALL #3# #4# (QREFELT $ 123))
                                     . #12#))
                              ('T
                               (PROGN
                                (LETT #3# #4# . #12#)
                                (LETT #2# 'T . #12#)))))))
                          (LETT |i| (+ |i| 1) . #12#) (GO G190) G191
                          (EXIT NIL))
                     (COND (#2# #3#) (#11# (|spadConstant| $ 26))))
                    . #12#)
              (EXIT
               (COND
                ((SPADCALL
                  (LETT |d| (SPADCALL (QCDR |rec|) |x| (QREFELT $ 25)) . #12#)
                  (QREFELT $ 124))
                 (COND
                  ((SPADCALL |n| (QREFELT $ 124))
                   (|error| "0/0 -- cannot compute value yet"))
                  (#11# (|error| "Shouldn't happen"))))
                (#11#
                 (PROG2 (LETT #1# (SPADCALL |n| |d| (QREFELT $ 125)) . #12#)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#)))))))))))) 

(DEFUN |FFCAT-;elt;S3F;17| (|f| |x| |y| $)
  (PROG (#1=#:G236 |d| |n| |rec|)
    (RETURN
     (SEQ (LETT |rec| (SPADCALL |f| (QREFELT $ 21)) . #2=(|FFCAT-;elt;S3F;17|))
          (LETT |n| (|FFCAT-;intvalue| (QCAR |rec|) |x| |y| $) . #2#)
          (EXIT
           (COND
            ((SPADCALL
              (LETT |d| (SPADCALL (QCDR |rec|) |x| (QREFELT $ 25)) . #2#)
              (QREFELT $ 124))
             (COND
              ((SPADCALL |n| (QREFELT $ 124))
               (|error| "0/0 -- cannot compute value yet"))
              (#3='T (|error| "Function has a pole at the given point"))))
            (#3#
             (PROG2 (LETT #1# (SPADCALL |n| |d| (QREFELT $ 125)) . #2#)
                 (QCDR #1#)
               (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))))))))) 

(DEFUN |FFCAT-;primitivePart;2S;18| (|f| $)
  (PROG (#1=#:G248 #2=#:G250 |i| #3=#:G249 |d| #4=#:G247 #5=#:G246 |cd|)
    (RETURN
     (SEQ
      (LETT |cd| (SPADCALL |f| (QREFELT $ 120))
            . #6=(|FFCAT-;primitivePart;2S;18|))
      (LETT |d|
            (SPADCALL
             (SPADCALL
              (PROGN
               (LETT #5# NIL . #6#)
               (SEQ (LETT |i| (SPADCALL (QCAR |cd|) (QREFELT $ 128)) . #6#)
                    (LETT #4# (QVSIZE (QCAR |cd|)) . #6#) G190
                    (COND ((> |i| #4#) (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #5#
                            (CONS
                             (SPADCALL (QAREF1O (QCAR |cd|) |i| 1)
                                       (QREFELT $ 129))
                             #5#)
                            . #6#)))
                    (LETT |i| (+ |i| 1) . #6#) (GO G190) G191
                    (EXIT (NREVERSE #5#))))
              (QREFELT $ 130))
             (SPADCALL (QCDR |cd|) (QREFELT $ 131)) (QREFELT $ 132))
            . #6#)
      (EXIT
       (SPADCALL
        (PROGN
         (LETT #3#
               (GETREFV
                (|inc_SI|
                 (- #7=(QVSIZE (QCAR |cd|))
                    #8=(SPADCALL (QCAR |cd|) (QREFELT $ 128)))))
               . #6#)
         (SEQ (LETT |i| #8# . #6#) (LETT #2# #7# . #6#) (LETT #1# 0 . #6#) G190
              (COND ((> |i| #2#) (GO G191)))
              (SEQ
               (EXIT
                (SETELT #3# #1#
                        (SPADCALL (QAREF1O (QCAR |cd|) |i| 1) |d|
                                  (QREFELT $ 15)))))
              (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1) . #6#))
                    . #6#)
              (GO G190) G191 (EXIT NIL))
         #3#)
        (QREFELT $ 133))))))) 

(DEFUN |FFCAT-;reduceBasisAtInfinity;2V;19| (|b| $)
  (PROG (|f| |j| #1=#:G257 #2=#:G256 |i| #3=#:G255 |x|)
    (RETURN
     (SEQ
      (LETT |x|
            (SPADCALL (SPADCALL (|spadConstant| $ 136) 1 (QREFELT $ 137))
                      (QREFELT $ 56))
            . #4=(|FFCAT-;reduceBasisAtInfinity;2V;19|))
      (EXIT
       (SPADCALL
        (PROGN
         (LETT #3# NIL . #4#)
         (SEQ (LETT |i| (SPADCALL |b| (QREFELT $ 117)) . #4#)
              (LETT #2# (QVSIZE |b|) . #4#) G190 (COND ((> |i| #2#) (GO G191)))
              (SEQ
               (EXIT
                (LETT #3#
                      (CONS
                       (LIST2VEC
                        (PROGN
                         (LETT #1# NIL . #4#)
                         (SEQ (LETT |j| 0 . #4#) G190
                              (COND
                               ((NULL
                                 (SPADCALL
                                  (LETT |f|
                                        (SPADCALL
                                         (SPADCALL |x| |j| (QREFELT $ 138))
                                         (QAREF1O |b| |i| 1) (QREFELT $ 99))
                                        . #4#)
                                  (QREFELT $ 139)))
                                (GO G191)))
                              (SEQ (EXIT (LETT #1# (CONS |f| #1#) . #4#)))
                              (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                              (EXIT (NREVERSE #1#)))))
                       #3#)
                      . #4#)))
              (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT (NREVERSE #3#))))
        (QREFELT $ 140))))))) 

(DEFUN |FFCAT-;complementaryBasis;2V;20| (|b| $)
  (PROG (#1=#:G264 #2=#:G266 |i| #3=#:G265 |m| #4=#:G259)
    (RETURN
     (SEQ
      (LETT |m|
            (PROG2
                (LETT #4#
                      (SPADCALL (SPADCALL |b| (QREFELT $ 142)) (QREFELT $ 143))
                      . #5=(|FFCAT-;complementaryBasis;2V;20|))
                (QCDR #4#)
              (|check_union| (QEQCAR #4# 0)
                             (|Matrix| (|Fraction| (QREFELT $ 8))) #4#))
            . #5#)
      (EXIT
       (PROGN
        (LETT #3# (GETREFV #6=(SPADCALL |m| (QREFELT $ 144))) . #5#)
        (SEQ (LETT |i| 1 . #5#) (LETT #2# #6# . #5#) (LETT #1# 0 . #5#) G190
             (COND ((|greater_SI| |i| #2#) (GO G191)))
             (SEQ
              (EXIT
               (SETELT #3# #1#
                       (SPADCALL (SPADCALL |m| |i| (QREFELT $ 145))
                                 (QREFELT $ 133)))))
             (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (|inc_SI| |i|) . #5#))
                   . #5#)
             (GO G190) G191 (EXIT NIL))
        #3#)))))) 

(DEFUN |FFCAT-;integralAtInfinity?;SB;21| (|f| $)
  (COND
   ((SPADCALL (CONS #'|FFCAT-;integralAtInfinity?;SB;21!0| $)
              (SPADCALL (SPADCALL |f| (QREFELT $ 33))
                        (SPADCALL (QREFELT $ 149)) (QREFELT $ 150))
              (QREFELT $ 152))
    'NIL)
   ('T 'T))) 

(DEFUN |FFCAT-;integralAtInfinity?;SB;21!0| (|s| $)
  (SPADCALL (|FFCAT-;infOrder| |s| $) (|spadConstant| $ 147) (QREFELT $ 148))) 

(DEFUN |FFCAT-;numberOfComponents;Nni;22| ($)
  (SPADCALL (ELT $ 139) (SPADCALL (QREFELT $ 83)) (QREFELT $ 155))) 

(DEFUN |FFCAT-;represents;VUPS;23| (|v| |d| $)
  (PROG (#1=#:G274 #2=#:G276 |i| #3=#:G275)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #3#
              (GETREFV
               (|inc_SI|
                (- #4=(QVSIZE |v|) #5=(SPADCALL |v| (QREFELT $ 128)))))
              . #6=(|FFCAT-;represents;VUPS;23|))
        (SEQ (LETT |i| #5# . #6#) (LETT #2# #4# . #6#) (LETT #1# 0 . #6#) G190
             (COND ((> |i| #2#) (GO G191)))
             (SEQ
              (EXIT
               (SETELT #3# #1#
                       (SPADCALL (QAREF1O |v| |i| 1) |d| (QREFELT $ 15)))))
             (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1) . #6#)) . #6#)
             (GO G190) G191 (EXIT NIL))
        #3#)
       (QREFELT $ 133)))))) 

(DEFUN |FFCAT-;genus;Nni;24| ($)
  (PROG (#1=#:G280 |dd| #2=#:G278 |d| |ds|)
    (RETURN
     (SEQ (LETT |ds| (SPADCALL (QREFELT $ 60)) . #3=(|FFCAT-;genus;Nni;24|))
          (LETT |d|
                (+ (SPADCALL (SPADCALL |ds| (QREFELT $ 61)) (QREFELT $ 18))
                   (|FFCAT-;infOrder|
                    (SPADCALL |ds|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL (QREFELT $ 157))
                                          (SPADCALL (QREFELT $ 158))
                                          (QREFELT $ 159))
                                (QREFELT $ 160))
                               2 (QREFELT $ 161))
                              (QREFELT $ 162))
                    $))
                . #3#)
          (LETT |dd|
                (PROG2
                    (LETT #2#
                          (SPADCALL
                           (-
                            (PROG2
                                (LETT #2# (SPADCALL |d| 2 (QREFELT $ 163))
                                      . #3#)
                                (QCDR #2#)
                              (|check_union| (QEQCAR #2# 0) (|Integer|) #2#))
                            (SPADCALL (QREFELT $ 164)))
                           (SPADCALL (QREFELT $ 29)) (QREFELT $ 163))
                          . #3#)
                    (QCDR #2#)
                  (|check_union| (QEQCAR #2# 0) (|Integer|) #2#))
                . #3#)
          (EXIT
           (PROG1 (LETT #1# (+ |dd| 1) . #3#)
             (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))))))) 

(DEFUN |FFCAT-;repOrder| (|m| |i| $)
  (PROG (|ans| |nostart| #1=#:G287 |j| |r|)
    (RETURN
     (SEQ (LETT |nostart| 'T . #2=(|FFCAT-;repOrder|)) (LETT |ans| 0 . #2#)
          (LETT |r| (SPADCALL |m| |i| (QREFELT $ 145)) . #2#)
          (SEQ (LETT |j| (SPADCALL |r| (QREFELT $ 166)) . #2#)
               (LETT #1# (QVSIZE |r|) . #2#) G190
               (COND ((> |j| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (QAREF1O |r| |j| 1) (|spadConstant| $ 167)
                             (QREFELT $ 168))
                   (LETT |ans|
                         (COND
                          (|nostart|
                           (SEQ (LETT |nostart| 'NIL . #2#)
                                (EXIT
                                 (|FFCAT-;infOrder| (QAREF1O |r| |j| 1) $))))
                          ('T
                           (MIN |ans|
                                (|FFCAT-;infOrder| (QAREF1O |r| |j| 1) $))))
                         . #2#)))))
               (LETT |j| (+ |j| 1) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (COND (|nostart| (|error| "Null row")) ('T |ans|))))))) 

(DEFUN |FFCAT-;infValue| (|f| $)
  (PROG (|n|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |f| (QREFELT $ 70)) (|spadConstant| $ 169))
            (#1='T
             (SEQ (LETT |n| (|FFCAT-;infOrder| |f| $) |FFCAT-;infValue|)
                  (EXIT
                   (COND
                    ((SPADCALL |n| 0 (QREFELT $ 170)) (|spadConstant| $ 169))
                    ((ZEROP |n|)
                     (SPADCALL
                      (SPADCALL (SPADCALL |f| (QREFELT $ 19)) (QREFELT $ 171))
                      (SPADCALL (SPADCALL |f| (QREFELT $ 16)) (QREFELT $ 171))
                      (QREFELT $ 172)))
                    (#1#
                     (|error| "f not locally integral at infinity"))))))))))) 

(DEFUN |FFCAT-;rfmonom| (|n| $)
  (PROG (#1=#:G293 #2=#:G292)
    (RETURN
     (COND
      ((< |n| 0)
       (SPADCALL
        (SPADCALL
         (SPADCALL (|spadConstant| $ 136)
                   (PROG1 (LETT #2# (- |n|) . #3=(|FFCAT-;rfmonom|))
                     (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
                   (QREFELT $ 137))
         (QREFELT $ 56))
        (QREFELT $ 57)))
      ('T
       (SPADCALL
        (SPADCALL (|spadConstant| $ 136)
                  (PROG1 (LETT #1# |n| . #3#)
                    (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                  (QREFELT $ 137))
        (QREFELT $ 56))))))) 

(DEFUN |FFCAT-;kmin| (|m| |v| $)
  (PROG (|i0| |k| |nostart| |nk| #1=#:G302 |i| |ii|)
    (RETURN
     (SEQ (LETT |nostart| 'T . #2=(|FFCAT-;kmin|)) (LETT |k| 0 . #2#)
          (LETT |ii| (- 1 (LETT |i0| (SPADCALL |v| (QREFELT $ 174)) . #2#))
                . #2#)
          (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 174)) . #2#)
               (LETT #1# (QVSIZE |v|) . #2#) G190
               (COND ((> |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (QAREF1O |v| |i| 1) (|spadConstant| $ 169)
                             (QREFELT $ 175))
                   (SEQ
                    (LETT |nk| (|FFCAT-;repOrder| |m| (+ |i| |ii|) $) . #2#)
                    (EXIT
                     (COND
                      (|nostart|
                       (SEQ (LETT |nostart| 'NIL . #2#) (LETT |k| |nk| . #2#)
                            (EXIT (LETT |i0| |i| . #2#))))
                      ((< |nk| |k|)
                       (SEQ (LETT |k| |nk| . #2#)
                            (EXIT (LETT |i0| |i| . #2#)))))))))))
               (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND (|nostart| (|error| "vector v has only zero entries"))
                 ('T (CONS |i0| |k|)))))))) 

(DEFUN |FFCAT-;normalizeAtInfinity;2V;29| (|w| $)
  (PROG (#1=#:G309 #2=#:G308 #3=#:G310 #4=#:G321 |i| |pr| |sol| #5=#:G315
         |solList| #6=#:G320 |j| #7=#:G319 |r| #8=#:G316 #9=#:G318 #10=#:G317
         |m| |ii| |mhat| |infm| |ans|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ans| (SPADCALL |w| (QREFELT $ 176))
              . #11=(|FFCAT-;normalizeAtInfinity;2V;29|))
        (LETT |infm| (SPADCALL (QREFELT $ 149)) . #11#)
        (LETT |mhat|
              (SPADCALL (SPADCALL (QREFELT $ 164)) (SPADCALL (QREFELT $ 164))
                        (QREFELT $ 177))
              . #11#)
        (LETT |ii| (- (SPADCALL |w| (QREFELT $ 117)) 1) . #11#)
        (EXIT
         (SEQ G190 NIL
              (SEQ
               (LETT |m|
                     (SPADCALL (SPADCALL |ans| (QREFELT $ 85)) |infm|
                               (QREFELT $ 159))
                     . #11#)
               (LETT |r|
                     (PROGN
                      (LETT #10# (GETREFV #12=(SPADCALL |m| (QREFELT $ 144)))
                            . #11#)
                      (SEQ (LETT |i| 1 . #11#) (LETT #9# #12# . #11#)
                           (LETT #8# 0 . #11#) G190
                           (COND ((|greater_SI| |i| #9#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SETELT #10# #8#
                                     (|FFCAT-;rfmonom|
                                      (|FFCAT-;repOrder| |m| |i| $) $))))
                           (LETT #8#
                                 (PROG1 (|inc_SI| #8#)
                                   (LETT |i| (|inc_SI| |i|) . #11#))
                                 . #11#)
                           (GO G190) G191 (EXIT NIL))
                      #10#)
                     . #11#)
               (SEQ (LETT |i| 1 . #11#)
                    (LETT #7# (SPADCALL |m| (QREFELT $ 144)) . #11#) G190
                    (COND ((|greater_SI| |i| #7#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |j| 1 . #11#)
                           (LETT #6# (SPADCALL |m| (QREFELT $ 178)) . #11#)
                           G190 (COND ((|greater_SI| |j| #6#) (GO G191)))
                           (SEQ
                            (EXIT
                             (QSETAREF2O |mhat| |i| |j|
                                         (SPADCALL (QAREF1O |r| (+ |i| |ii|) 1)
                                                   (QAREF2O |m| |i| |j| 1 1)
                                                   (QREFELT $ 162))
                                         1 1)))
                           (LETT |j| (|inc_SI| |j|) . #11#) (GO G190) G191
                           (EXIT NIL))))
                    (LETT |i| (|inc_SI| |i|) . #11#) (GO G190) G191 (EXIT NIL))
               (LETT |solList|
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (CONS (|function| |FFCAT-;infValue|) $) |mhat|
                                 (QREFELT $ 182))
                       (QREFELT $ 183))
                      (QREFELT $ 185))
                     . #11#)
               (EXIT
                (COND
                 ((NULL |solList|) (PROGN (LETT #5# |ans| . #11#) (GO #5#)))
                 ('T
                  (SEQ (LETT |sol| (|SPADfirst| |solList|) . #11#)
                       (LETT |pr| (|FFCAT-;kmin| |m| |sol| $) . #11#)
                       (EXIT
                        (QSETAREF1O |ans| (QCAR |pr|)
                                    (PROGN
                                     (LETT #1# NIL . #11#)
                                     (SEQ
                                      (LETT |i|
                                            (SPADCALL |sol| (QREFELT $ 174))
                                            . #11#)
                                      (LETT #4# (QVSIZE |sol|) . #11#) G190
                                      (COND ((> |i| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (PROGN
                                         (LETT #3#
                                               (SPADCALL
                                                (SPADCALL
                                                 (|FFCAT-;Q2RF|
                                                  (QAREF1O |sol| |i| 1) $)
                                                 (|FFCAT-;rfmonom|
                                                  (-
                                                   (|FFCAT-;repOrder| |m|
                                                    (- |i| |ii|) $)
                                                   (QCDR |pr|))
                                                  $)
                                                 (QREFELT $ 162))
                                                (QAREF1O |ans| |i| 1)
                                                (QREFELT $ 99))
                                               . #11#)
                                         (COND
                                          (#1#
                                           (LETT #2#
                                                 (SPADCALL #2# #3#
                                                           (QREFELT $ 118))
                                                 . #11#))
                                          ('T
                                           (PROGN
                                            (LETT #2# #3# . #11#)
                                            (LETT #1# 'T . #11#)))))))
                                      (LETT |i| (+ |i| 1) . #11#) (GO G190)
                                      G191 (EXIT NIL))
                                     (COND (#1# #2#)
                                           ('T (|spadConstant| $ 119))))
                                    1)))))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #5# (EXIT #5#))))) 

(DEFUN |FFCAT-;integral?;SUPB;30| (|f| |p| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |p| (QREFELT $ 188)) |FFCAT-;integral?;SUPB;30|)
          (EXIT
           (COND ((QEQCAR |r| 0) (SPADCALL |f| (QCDR |r|) (QREFELT $ 189)))
                 ('T
                  (QEQCAR
                   (SPADCALL (QCDR (SPADCALL |f| (QREFELT $ 21))) |p|
                             (QREFELT $ 55))
                   1)))))))) 

(DEFUN |FFCAT-;differentiate;SMS;31| (|f| |d| $)
  (PROG ()
    (RETURN
     (SPADCALL |f| (CONS #'|FFCAT-;differentiate;SMS;31!0| (VECTOR $ |d|))
               (QREFELT $ 193))))) 

(DEFUN |FFCAT-;differentiate;SMS;31!0| (|x| $$)
  (PROG (|d| $)
    (LETT |d| (QREFELT $$ 1) . #1=(|FFCAT-;differentiate;SMS;31|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |d| (QREFELT $ 191)))))) 

(DECLAIM (NOTINLINE |FunctionFieldCategory&;|)) 

(DEFUN |FunctionFieldCategory&| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FunctionFieldCategory&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|FunctionFieldCategory&| DV$1 DV$2 DV$3 DV$4) . #1#)
      (LETT $ (GETREFV 196) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST (|HasCategory| |#2| '(|Finite|))
                                               (|HasCategory| |#2|
                                                              '(|Field|))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 2)
        (PROGN
         (QSETREFV $ 108
                   (CONS (|dispatchFunction| |FFCAT-;nonSingularModel;SL;13|)
                         $)))))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 115
                   (CONS (|dispatchFunction| |FFCAT-;rationalPoints;L;15|)
                         $)))))
      $)))) 

(MAKEPROP '|FunctionFieldCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Fraction| 7) (0 . |numer|)
              (5 . |coerce|) (10 . |denom|) (|Fraction| 8) (15 . /)
              (21 . |denom|) (|NonNegativeInteger|) (26 . |degree|)
              (31 . |numer|) (|Record| (|:| |num| 127) (|:| |den| 8))
              (36 . |integralCoordinates|) (|Boolean|) (41 . |ground?|)
              |FFCAT-;integral?;SB;3| (46 . |elt|) (52 . |Zero|) (56 . ~=)
              |FFCAT-;integral?;SFB;4| (62 . |numberOfComponents|)
              |FFCAT-;numberOfComponents;Nni;22|
              |FFCAT-;absolutelyIrreducible?;B;5| (|Vector| 14)
              (66 . |coordinates|) (|InnerCommonDenominator| 8 14 127 32)
              (71 . |splitDenominator|) |FFCAT-;yCoordinates;SR;6|
              (76 . |definingPolynomial|) (80 . |degree|) (85 . ~=)
              (91 . |reductum|) (|Union| 14 '#1="failed") (96 . |retractIfCan|)
              (101 . |leadingCoefficient|) (106 . /) (112 . -)
              (|Union| 8 '"failed") (117 . |retractIfCan|)
              |FFCAT-;hyperelliptic;U;7| (122 . |lift|)
              (|Record| (|:| |num| 9) (|:| |den| 8))
              (|UnivariatePolynomialCommonDenominator| 8 14 9)
              (127 . |splitDenominator|) (132 . |gcd|) (|Union| $ '"failed")
              (138 . |exquo|) (144 . |coerce|) (149 . |inv|) (154 . *)
              (160 . |reduce|) (165 . |discriminant|) (169 . |retract|)
              (|Record| (|:| |num| $) (|:| |den| 8) (|:| |derivden| 8)
                        (|:| |gd| 8))
              (|Mapping| 8 8) |FFCAT-;algSplitSimple;SMR;8|
              (174 . |hyperelliptic|) |FFCAT-;elliptic;U;9| (178 . |elt|)
              (|Fraction| $) (184 . |elt|) (190 . |zero?|)
              |FFCAT-;rationalPoint?;2FB;10| (|Polynomial| 7) (195 . |coerce|)
              (|SparseUnivariatePolynomial| 72) (|Mapping| 72 7)
              (|UnivariatePolynomialCategoryFunctions2| 7 8 72 74)
              (200 . |map|) (206 . |elt|) (|Mapping| 72 14)
              (|UnivariatePolynomialCategoryFunctions2| 14 9 72 74)
              (212 . |map|) (|Vector| $) (218 . |integralBasis|) (|Matrix| 14)
              (222 . |coordinates|) (|MatrixCommonDenominator| 8 14)
              (227 . |commonDenominator|) (|String|) (|Symbol|)
              (232 . |string|) (237 . |coerce|) (242 . |degree|)
              (248 . |zero?|) (253 . |false|) (257 . |coerce|) (|Integer|)
              (|Vector| 6) (262 . |elt|) (268 . *) (274 . -) (|List| 89)
              (280 . |concat|) (|List| 72) (|PolyGroebner| 7)
              (286 . |lexGroebner|) (|Mapping| 22 72) (292 . |select!|)
              (298 . |nonSingularModel|) (303 . |size|) (|PositiveInteger|)
              (307 . |index|) (|List| $) (|List| (|List| 7)) (312 . |concat|)
              (317 . |rationalPoints|) (321 . |singular?|) (326 . |minIndex|)
              (331 . +) (337 . |Zero|) (341 . |yCoordinates|) (346 . ^)
              (352 . *) (358 . +) (364 . |zero?|) (369 . |exquo|)
              |FFCAT-;elt;S3F;17| (|Vector| 8) (375 . |minIndex|)
              (380 . |content|) (385 . |gcd|) (390 . |primitivePart|) (395 . *)
              (401 . |represents|) |FFCAT-;primitivePart;2S;18| (406 . |One|)
              (410 . |One|) (414 . |monomial|) (420 . ^)
              (426 . |integralAtInfinity?|) (431 . |concat|)
              |FFCAT-;reduceBasisAtInfinity;2V;19| (436 . |traceMatrix|)
              (441 . |inverse|) (446 . |maxRowIndex|) (451 . |row|)
              |FFCAT-;complementaryBasis;2V;20| (457 . |Zero|) (461 . <)
              (467 . |inverseIntegralMatrixAtInfinity|) (471 . *)
              (|Mapping| 22 14) (477 . |any?|)
              |FFCAT-;integralAtInfinity?;SB;21| (|Mapping| 22 6)
              (483 . |count|) |FFCAT-;represents;VUPS;23|
              (489 . |integralMatrixAtInfinity|)
              (493 . |inverseIntegralMatrix|) (497 . *) (503 . |determinant|)
              (508 . ^) (514 . *) (520 . |exquo|) (526 . |rank|)
              |FFCAT-;genus;Nni;24| (530 . |minIndex|) (535 . |Zero|)
              (539 . ~=) (545 . |Zero|) (549 . >) (555 . |leadingCoefficient|)
              (560 . /) (|Vector| 10) (566 . |minIndex|) (571 . ~=)
              (577 . |copy|) (582 . |zero|) (588 . |maxColIndex|) (|Matrix| 10)
              (|Mapping| 10 14)
              (|MatrixCategoryFunctions2| 14 32 32 84 10 173 173 179)
              (593 . |map|) (599 . |transpose|) (|List| 173)
              (604 . |nullSpace|) |FFCAT-;normalizeAtInfinity;2V;29|
              (|Union| 7 '#1#) (609 . |retractIfCan|) (614 . |integral?|)
              |FFCAT-;integral?;SUPB;30| (620 . |differentiate|)
              (|Mapping| 14 14) (626 . |differentiate|)
              |FFCAT-;differentiate;SMS;31| (|List| 17))
           '#(|yCoordinates| 632 |represents| 637 |reduceBasisAtInfinity| 643
              |rationalPoints| 648 |rationalPoint?| 652 |primitivePart| 658
              |numberOfComponents| 663 |normalizeAtInfinity| 667
              |nonSingularModel| 672 |integralAtInfinity?| 677 |integral?| 682
              |hyperelliptic| 699 |genus| 703 |elt| 707 |elliptic| 714
              |differentiate| 718 |complementaryBasis| 724 |algSplitSimple| 729
              |absolutelyIrreducible?| 735)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 194
                                                 '(1 10 7 0 11 1 8 0 7 12 1 10
                                                   7 0 13 2 14 0 8 8 15 1 14 8
                                                   0 16 1 8 17 0 18 1 14 8 0 19
                                                   1 6 20 0 21 1 8 22 0 23 2 8
                                                   7 0 7 25 0 7 0 26 2 7 22 0 0
                                                   27 0 6 17 29 1 6 32 0 33 1
                                                   34 20 32 35 0 6 9 37 1 9 17
                                                   0 38 2 17 22 0 0 39 1 9 0 0
                                                   40 1 9 41 0 42 1 9 14 0 43 2
                                                   14 0 0 0 44 1 14 0 0 45 1 14
                                                   46 0 47 1 6 9 0 49 1 51 50 9
                                                   52 2 8 0 0 0 53 2 8 54 0 0
                                                   55 1 14 0 8 56 1 14 0 0 57 2
                                                   9 0 14 0 58 1 6 0 9 59 0 6
                                                   14 60 1 14 8 0 61 0 6 46 65
                                                   2 9 14 0 14 67 2 8 68 68 68
                                                   69 1 14 22 0 70 1 72 0 7 73
                                                   2 76 74 75 8 77 2 74 72 0 72
                                                   78 2 80 74 79 9 81 0 6 82 83
                                                   1 6 84 82 85 1 86 8 84 87 1
                                                   89 88 0 90 1 89 0 88 91 2 72
                                                   17 0 89 92 1 17 22 0 93 0 22
                                                   0 94 1 72 0 89 95 2 97 6 0
                                                   96 98 2 6 0 14 0 99 2 72 0 0
                                                   0 100 2 101 0 0 0 102 2 104
                                                   103 103 101 105 2 103 0 106
                                                   0 107 1 0 103 89 108 0 7 17
                                                   109 1 7 0 110 111 1 113 0
                                                   112 114 0 0 113 115 1 6 22 7
                                                   116 1 97 96 0 117 2 6 0 0 0
                                                   118 0 6 0 119 1 6 20 0 120 2
                                                   7 0 0 17 121 2 7 0 0 0 122 2
                                                   7 0 0 0 123 1 7 22 0 124 2 7
                                                   54 0 0 125 1 127 96 0 128 1
                                                   8 7 0 129 1 7 0 112 130 1 8
                                                   0 0 131 2 8 0 7 0 132 1 6 0
                                                   32 133 0 6 0 135 0 7 0 136 2
                                                   8 0 7 17 137 2 14 0 0 17 138
                                                   1 6 22 0 139 1 97 0 112 140
                                                   1 6 84 82 142 1 84 54 0 143
                                                   1 84 96 0 144 2 84 32 0 96
                                                   145 0 17 0 147 2 96 22 0 0
                                                   148 0 6 84 149 2 84 32 32 0
                                                   150 2 32 22 151 0 152 2 97
                                                   17 154 0 155 0 6 84 157 0 6
                                                   84 158 2 84 0 0 0 159 1 84
                                                   14 0 160 2 14 0 0 96 161 2
                                                   14 0 0 0 162 2 96 54 0 0 163
                                                   0 6 110 164 1 32 96 0 166 0
                                                   14 0 167 2 14 22 0 0 168 0
                                                   10 0 169 2 96 22 0 0 170 1 8
                                                   7 0 171 2 10 0 7 7 172 1 173
                                                   96 0 174 2 10 22 0 0 175 1
                                                   97 0 0 176 2 84 0 17 17 177
                                                   1 84 96 0 178 2 181 179 180
                                                   84 182 1 179 0 0 183 1 179
                                                   184 0 185 1 8 187 0 188 2 6
                                                   22 0 7 189 2 14 0 0 63 191 2
                                                   6 0 0 192 193 1 0 20 0 36 2
                                                   0 0 127 8 156 1 0 82 82 141
                                                   0 0 113 115 2 0 22 7 7 71 1
                                                   0 0 0 134 0 0 17 30 1 0 82
                                                   82 186 1 0 103 89 108 1 0 22
                                                   0 153 2 0 22 0 7 28 2 0 22 0
                                                   8 190 1 0 22 0 24 0 0 46 48
                                                   0 0 17 165 3 0 7 0 7 7 126 0
                                                   0 46 66 2 0 0 0 63 194 1 0
                                                   82 82 146 2 0 62 0 63 64 0 0
                                                   22 31)))))
           '|lookupComplete|)) 
