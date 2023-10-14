
(/VERSIONCHECK 2) 

(DEFUN |FRIDEAL;One;$;1| ($)
  (CONS (VECTOR (|spadConstant| $ 15)) (|spadConstant| $ 12))) 

(PUT '|FRIDEAL;numer;$V;2| '|SPADreplace| 'QCAR) 

(DEFUN |FRIDEAL;numer;$V;2| (|i| $) (QCAR |i|)) 

(PUT '|FRIDEAL;denom;$R;3| '|SPADreplace| 'QCDR) 

(DEFUN |FRIDEAL;denom;$R;3| (|i| $) (QCDR |i|)) 

(PUT '|FRIDEAL;mkIdeal| '|SPADreplace| 'CONS) 

(DEFUN |FRIDEAL;mkIdeal| (|v| |d| $) (CONS |v| |d|)) 

(DEFUN |FRIDEAL;invrep| (|m| $)
  (SPADCALL
   (SPADCALL (SPADCALL |m| (QREFELT $ 20))
             (SPADCALL (|spadConstant| $ 15) (QREFELT $ 22)) (QREFELT $ 23))
   (QREFELT $ 24))) 

(DEFUN |FRIDEAL;upmat| (|x| |i| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|FRIDEAL;upmat!0| (VECTOR $ |i|))
               (SPADCALL (SPADCALL |x| (QREFELT $ 27)) (QREFELT $ 20))
               (QREFELT $ 31))))) 

(DEFUN |FRIDEAL;upmat!0| (|s| $$)
  (PROG (|i| $)
    (LETT |i| (QREFELT $$ 1) . #1=(|FRIDEAL;upmat|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |s| |i| (QREFELT $ 26)))))) 

(DEFUN |FRIDEAL;ret?| (|v| $)
  (SPADCALL (CONS #'|FRIDEAL;ret?!0| $) |v| (QREFELT $ 36))) 

(DEFUN |FRIDEAL;ret?!0| (|s| $) (QEQCAR (SPADCALL |s| (QREFELT $ 33)) 0)) 

(DEFUN |FRIDEAL;=;2$B;8| (|x| |y| $)
  (COND
   ((SPADCALL (SPADCALL |x| (QREFELT $ 18)) (SPADCALL |y| (QREFELT $ 18))
              (QREFELT $ 37))
    (SPADCALL (SPADCALL |x| (QREFELT $ 17)) (SPADCALL |y| (QREFELT $ 17))
              (QREFELT $ 38)))
   ('T 'NIL))) 

(DEFUN |FRIDEAL;agcd| (|l| $)
  (PROG (#1=#:G155 |a| #2=#:G154)
    (RETURN
     (SEQ
      (SPADCALL (ELT $ 41)
                (PROGN
                 (LETT #2# NIL . #3=(|FRIDEAL;agcd|))
                 (SEQ (LETT |a| NIL . #3#) (LETT #1# |l| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (|FRIDEAL;vgcd| (SPADCALL |a| (QREFELT $ 22)) $)
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (|spadConstant| $ 40) (QREFELT $ 44)))))) 

(DEFUN |FRIDEAL;norm;$F;10| (|i| $)
  (PROG (#1=#:G163 #2=#:G162 #3=#:G164 #4=#:G166 |u|)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #1# NIL . #5=(|FRIDEAL;norm;$F;10|))
        (SEQ (LETT |u| NIL . #5#)
             (LETT #4#
                   (SPADCALL (SPADCALL (|FRIDEAL;summat| |i| $) (QREFELT $ 45))
                             (QREFELT $ 47))
                   . #5#)
             G190
             (COND
              ((OR (ATOM #4#) (PROGN (LETT |u| (CAR #4#) . #5#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (PROGN
                (LETT #3# (SPADCALL |u| (QREFELT $ 48)) . #5#)
                (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 41)) . #5#))
                      ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
             (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
        (COND (#1# #2#) ('T (|spadConstant| $ 40))))
       (SPADCALL (SPADCALL |i| (QREFELT $ 18)) (SPADCALL (QREFELT $ 50))
                 (QREFELT $ 51))
       (QREFELT $ 52)))))) 

(DEFUN |FRIDEAL;tryRange| (|range| |nm| |nrm| |i| $)
  (PROG (#1=#:G173 #2=#:G176 #3=#:G171 |a| |j|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |j| 0 . #4=(|FRIDEAL;tryRange|)) G190
             (COND ((|greater_SI| |j| 10) (GO G191)))
             (SEQ
              (EXIT
               (SEQ
                (LETT |a|
                      (SPADCALL (SPADCALL 10 |range| (QREFELT $ 54)) |nm|
                                (QREFELT $ 55))
                      . #4#)
                (EXIT
                 (COND
                  ((SPADCALL
                    (SPADCALL
                     (PROG2
                         (LETT #3#
                               (SPADCALL
                                (SPADCALL (SPADCALL |a| (QREFELT $ 56))
                                          (QREFELT $ 48))
                                |nrm| (QREFELT $ 58))
                               . #4#)
                         (QCDR #3#)
                       (|check_union| (QEQCAR #3# 0) (QREFELT $ 6) #3#))
                     |nrm| (QREFELT $ 41))
                    (QREFELT $ 59))
                   (PROGN
                    (LETT #1#
                          (PROGN
                           (LETT #2#
                                 (CONS 0
                                       (|FRIDEAL;intIdeal|
                                        (LIST
                                         (SPADCALL
                                          (SPADCALL |nrm| (QREFELT $ 60))
                                          (QREFELT $ 61))
                                         |a|)
                                        (SPADCALL |i| (QREFELT $ 18)) $))
                                 . #4#)
                           (GO #2#))
                          . #4#)
                    (GO #1#)))))))
              #1# (EXIT #1#))
             (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 1 "failed"))))
      #2# (EXIT #2#))))) 

(DEFUN |FRIDEAL;summat| (|i| $)
  (PROG (#1=#:G184 |j| #2=#:G183 |m| |v|)
    (RETURN
     (SEQ
      (LETT |m|
            (SPADCALL
             (LETT |v| (SPADCALL |i| (QREFELT $ 17)) . #3=(|FRIDEAL;summat|))
             (QREFELT $ 63))
            . #3#)
      (EXIT
       (SPADCALL (ELT $ 64)
                 (PROGN
                  (LETT #2# NIL . #3#)
                  (SEQ (LETT |j| 0 . #3#) (LETT #1# (- (QVSIZE |v|) 1) . #3#)
                       G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (|FRIDEAL;upmat| (QAREF1O |v| (+ |j| |m|) 1)
                                 |j| $)
                                #2#)
                               . #3#)))
                       (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 67))))))) 

(DEFUN |FRIDEAL;inv;2$;13| (|i| $)
  (PROG (|j| #1=#:G223 |d| #2=#:G222 |p| #3=#:G221 |invd| |cd2| |cd| |m|
         #4=#:G192)
    (RETURN
     (SEQ
      (LETT |m|
            (PROG2
                (LETT #4#
                      (SPADCALL
                       (SPADCALL (ELT $ 69) (|FRIDEAL;summat| |i| $)
                                 (QREFELT $ 73))
                       (QREFELT $ 74))
                      . #5=(|FRIDEAL;inv;2$;13|))
                (QCDR #4#)
              (|check_union| (QEQCAR #4# 0)
                             (|Matrix| (|Fraction| (QREFELT $ 8))) #4#))
            . #5#)
      (LETT |cd|
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL (SPADCALL |i| (QREFELT $ 18)) (QREFELT $ 60))
                (QREFELT $ 75))
               (QREFELT $ 69))
              |m| (QREFELT $ 76))
             (QREFELT $ 79))
            . #5#)
      (LETT |cd2|
            (SPADCALL (SPADCALL (QCDR |cd|) (QREFELT $ 47)) (QREFELT $ 82))
            . #5#)
      (LETT |invd|
            (SPADCALL (QCDR |cd2|)
                      (SPADCALL (ELT $ 41) (QCAR |cd2|) (QREFELT $ 83))
                      (QREFELT $ 52))
            . #5#)
      (LETT |d|
            (SPADCALL (ELT $ 87)
                      (PROGN
                       (LETT #3# NIL . #5#)
                       (SEQ (LETT |p| NIL . #5#)
                            (LETT #2# (SPADCALL (QCAR |cd|) (QREFELT $ 85))
                                  . #5#)
                            G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |p| (CAR #2#) . #5#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #3#
                                    (CONS (SPADCALL |p| (QREFELT $ 86)) #3#)
                                    . #5#)))
                            (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                            (EXIT (NREVERSE #3#))))
                      (QREFELT $ 90))
            . #5#)
      (EXIT
       (SPADCALL
        (PROGN
         (LETT #1# (GETREFV (|inc_SI| |d|)) . #5#)
         (SEQ (LETT |j| 0 . #5#) G190 (COND ((|greater_SI| |j| |d|) (GO G191)))
              (SEQ
               (EXIT
                (SETELT #1# |j|
                        (SPADCALL |invd|
                                  (|FRIDEAL;invrep|
                                   (SPADCALL
                                    (CONS #'|FRIDEAL;inv;2$;13!0|
                                          (VECTOR $ |j|))
                                    (QCAR |cd|) (QREFELT $ 94))
                                   $)
                                  (QREFELT $ 95)))))
              (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191 (EXIT NIL))
         #1#)
        (QREFELT $ 96))))))) 

(DEFUN |FRIDEAL;inv;2$;13!0| (|s| $$)
  (PROG (|j| $)
    (LETT |j| (QREFELT $$ 1) . #1=(|FRIDEAL;inv;2$;13|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |s| |j| (QREFELT $ 91)))))) 

(DEFUN |FRIDEAL;ideal;V$;14| (|v| $)
  (PROG (#1=#:G238 |i| #2=#:G237 |d| #3=#:G236 #4=#:G235)
    (RETURN
     (SEQ
      (LETT |d|
            (SPADCALL (ELT $ 100)
                      (PROGN
                       (LETT #4# NIL . #5=(|FRIDEAL;ideal;V$;14|))
                       (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 63)) . #5#)
                            (LETT #3# (QVSIZE |v|) . #5#) G190
                            (COND ((> |i| #3#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #4#
                                    (CONS
                                     (SPADCALL
                                      (SPADCALL (QAREF1O |v| |i| 1)
                                                (QREFELT $ 22))
                                      (QREFELT $ 99))
                                     #4#)
                                    . #5#)))
                            (LETT |i| (+ |i| 1) . #5#) (GO G190) G191
                            (EXIT (NREVERSE #4#))))
                      (QREFELT $ 83))
            . #5#)
      (EXIT
       (|FRIDEAL;intIdeal|
        (PROGN
         (LETT #2# NIL . #5#)
         (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 63)) . #5#)
              (LETT #1# (QVSIZE |v|) . #5#) G190 (COND ((> |i| #1#) (GO G191)))
              (SEQ
               (EXIT
                (LETT #2#
                      (CONS
                       (SPADCALL (SPADCALL |d| (QREFELT $ 60))
                                 (QAREF1O |v| |i| 1) (QREFELT $ 95))
                       #2#)
                      . #5#)))
              (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT (NREVERSE #2#))))
        |d| $)))))) 

(DEFUN |FRIDEAL;intIdeal| (|l| |d| $)
  (PROG (|va| #1=#:G263 #2=#:G265 |m| #3=#:G264 |invb| |a| |b| |g| |r| |nr|
         |lr| |u| #4=#:G262 |x|)
    (RETURN
     (SEQ (LETT |lr| NIL . #5=(|FRIDEAL;intIdeal|)) (LETT |nr| NIL . #5#)
          (SEQ (LETT |x| NIL . #5#)
               (LETT #4# (SPADCALL |l| (QREFELT $ 102)) . #5#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#) . #5#) NIL))
                 (GO G191)))
               (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 33)) . #5#)
                    (EXIT
                     (COND
                      ((QEQCAR |u| 0)
                       (LETT |lr|
                             (CONS (SPADCALL (QCDR |u|) (QREFELT $ 48)) |lr|)
                             . #5#))
                      ('T (LETT |nr| (CONS |x| |nr|) . #5#)))))
               (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
          (LETT |r|
                (SPADCALL (ELT $ 41) |lr| (|spadConstant| $ 40) (QREFELT $ 44))
                . #5#)
          (LETT |g| (|FRIDEAL;agcd| |nr| $) . #5#)
          (LETT |a|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |r|
                            (LETT |b|
                                  (SPADCALL (SPADCALL |d| |r| (QREFELT $ 41))
                                            |g| (QREFELT $ 41))
                                  . #5#)
                            (QREFELT $ 104))
                  (QREFELT $ 60))
                 (QREFELT $ 61))
                . #5#)
          (LETT |d| (SPADCALL |d| |b| (QREFELT $ 104)) . #5#)
          (COND
           ((SPADCALL |r| (|spadConstant| $ 40) (QREFELT $ 105))
            (COND
             ((QEQCAR (SPADCALL |g| |r| (QREFELT $ 58)) 0)
              (EXIT (|FRIDEAL;mkIdeal| (VECTOR |a|) |d| $))))))
          (LETT |invb| (SPADCALL (SPADCALL |b| (QREFELT $ 60)) (QREFELT $ 106))
                . #5#)
          (LETT |va|
                (PROGN
                 (LETT #3# (GETREFV (SIZE |nr|)) . #5#)
                 (SEQ (LETT |m| NIL . #5#) (LETT #2# |nr| . #5#)
                      (LETT #1# 0 . #5#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |m| (CAR #2#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #3# #1# (SPADCALL |invb| |m| (QREFELT $ 95)))))
                      (LETT #1#
                            (PROG1 (|inc_SI| #1#) (LETT #2# (CDR #2#) . #5#))
                            . #5#)
                      (GO G190) G191 (EXIT NIL))
                 #3#)
                . #5#)
          (EXIT
           (COND
            ((SPADCALL |a| (QREFELT $ 107)) (|FRIDEAL;mkIdeal| |va| |d| $))
            ('T
             (|FRIDEAL;mkIdeal| (SPADCALL |a| |va| (QREFELT $ 108)) |d|
              $)))))))) 

(DEFUN |FRIDEAL;vgcd| (|v| $)
  (PROG (#1=#:G272 |i| #2=#:G271)
    (RETURN
     (SEQ
      (SPADCALL (ELT $ 41)
                (PROGN
                 (LETT #2# NIL . #3=(|FRIDEAL;vgcd|))
                 (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 109)) . #3#)
                      (LETT #1# (QVSIZE |v|) . #3#) G190
                      (COND ((> |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (SPADCALL |v| |i| (QREFELT $ 110))
                                         (QREFELT $ 48))
                               #2#)
                              . #3#)))
                      (LETT |i| (+ |i| 1) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 83)))))) 

(DEFUN |FRIDEAL;poly| (|i| $)
  (PROG (#1=#:G274 #2=#:G273 #3=#:G275 #4=#:G278 |m| |v|)
    (RETURN
     (SEQ
      (LETT |m|
            (SPADCALL
             (LETT |v| (SPADCALL |i| (QREFELT $ 17)) . #5=(|FRIDEAL;poly|))
             (QREFELT $ 63))
            . #5#)
      (EXIT
       (PROGN
        (LETT #1# NIL . #5#)
        (SEQ (LETT |i| 0 . #5#) (LETT #4# (- (QVSIZE |v|) 1) . #5#) G190
             (COND ((|greater_SI| |i| #4#) (GO G191)))
             (SEQ
              (EXIT
               (PROGN
                (LETT #3#
                      (SPADCALL (QAREF1O |v| (+ |i| |m|) 1) |i|
                                (QREFELT $ 112))
                      . #5#)
                (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 113)) . #5#))
                      ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
             (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
        (COND (#1# #2#) ('T (|spadConstant| $ 114))))))))) 

(DEFUN |FRIDEAL;*;3$;18| (|i1| |i2| $)
  (|FRIDEAL;intIdeal|
   (SPADCALL
    (SPADCALL (|FRIDEAL;poly| |i1| $) (|FRIDEAL;poly| |i2| $) (QREFELT $ 115))
    (QREFELT $ 116))
   (SPADCALL (SPADCALL |i1| (QREFELT $ 18)) (SPADCALL |i2| (QREFELT $ 18))
             (QREFELT $ 117))
   $)) 

(DEFUN |FRIDEAL;^;$I$;19| (|i| |m| $)
  (PROG (#1=#:G286 |j| #2=#:G285 |v| |n| #3=#:G281)
    (RETURN
     (SEQ
      (COND
       ((< |m| 0)
        (SPADCALL (SPADCALL |i| (QREFELT $ 97)) (- |m|) (QREFELT $ 119)))
       ('T
        (SEQ
         (LETT |n|
               (PROG1 (LETT #3# |m| . #4=(|FRIDEAL;^;$I$;19|))
                 (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|) #3#))
               . #4#)
         (LETT |v| (SPADCALL |i| (QREFELT $ 17)) . #4#)
         (EXIT
          (|FRIDEAL;intIdeal|
           (PROGN
            (LETT #2# NIL . #4#)
            (SEQ (LETT |j| (SPADCALL |v| (QREFELT $ 63)) . #4#)
                 (LETT #1# (QVSIZE |v|) . #4#) G190
                 (COND ((> |j| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2#
                         (CONS
                          (SPADCALL (QAREF1O |v| |j| 1) |n| (QREFELT $ 120))
                          #2#)
                         . #4#)))
                 (LETT |j| (+ |j| 1) . #4#) (GO G190) G191
                 (EXIT (NREVERSE #2#))))
           (SPADCALL (SPADCALL |i| (QREFELT $ 18)) |n| (QREFELT $ 121))
           $))))))))) 

(DEFUN |FRIDEAL;num2O| (|v| $)
  (PROG (#1=#:G290 |i| #2=#:G289)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|FRIDEAL;num2O|))
        (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 63)) . #3#)
             (LETT #1# (QVSIZE |v|) . #3#) G190 (COND ((> |i| #1#) (GO G191)))
             (SEQ
              (EXIT
               (LETT #2#
                     (CONS (SPADCALL (QAREF1O |v| |i| 1) (QREFELT $ 123)) #2#)
                     . #3#)))
             (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       (QREFELT $ 125)))))) 

(DEFUN |FRIDEAL;basis;$V;21| (|i| $)
  (PROG (#1=#:G295 #2=#:G297 |j| #3=#:G296 |d| |v|)
    (RETURN
     (SEQ (LETT |v| (SPADCALL |i| (QREFELT $ 17)) . #4=(|FRIDEAL;basis;$V;21|))
          (LETT |d|
                (SPADCALL
                 (SPADCALL (SPADCALL |i| (QREFELT $ 18)) (QREFELT $ 60))
                 (QREFELT $ 106))
                . #4#)
          (EXIT
           (PROGN
            (LETT #3#
                  (GETREFV
                   (|inc_SI|
                    (- #5=(QVSIZE |v|) #6=(SPADCALL |v| (QREFELT $ 63)))))
                  . #4#)
            (SEQ (LETT |j| #6# . #4#) (LETT #2# #5# . #4#) (LETT #1# 0 . #4#)
                 G190 (COND ((> |j| #2#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SETELT #3# #1#
                           (SPADCALL |d| (QAREF1O |v| |j| 1) (QREFELT $ 95)))))
                 (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |j| (+ |j| 1) . #4#))
                       . #4#)
                 (GO G190) G191 (EXIT NIL))
            #3#)))))) 

(DEFUN |FRIDEAL;coerce;$Of;22| (|i| $)
  (PROG (|nm|)
    (RETURN
     (SEQ
      (LETT |nm| (|FRIDEAL;num2O| (SPADCALL |i| (QREFELT $ 17)) $)
            |FRIDEAL;coerce;$Of;22|)
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |i| (QREFELT $ 18)) (|spadConstant| $ 12)
                   (QREFELT $ 37))
         |nm|)
        ('T
         (SPADCALL
          (SPADCALL (SPADCALL 1 (QREFELT $ 127))
                    (SPADCALL (SPADCALL |i| (QREFELT $ 18)) (QREFELT $ 128))
                    (QREFELT $ 129))
          |nm| (QREFELT $ 130))))))))) 

(DEFUN |FRIDEAL;randomLC;NniVA;23| (|m| |v| $)
  (PROG (#1=#:G302 #2=#:G301 #3=#:G303 #4=#:G305 |j|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|FRIDEAL;randomLC;NniVA;23|))
       (SEQ (LETT |j| (SPADCALL |v| (QREFELT $ 63)) . #5#)
            (LETT #4# (QVSIZE |v|) . #5#) G190 (COND ((> |j| #4#) (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3#
                     (SPADCALL (SPADCALL (QREFELT $ 132)) (QAREF1O |v| |j| 1)
                               (QREFELT $ 95))
                     . #5#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 133)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 134)))))))) 

(DEFUN |FRIDEAL;randomLC;NniVA;24| (|m| |v| $)
  (PROG (#1=#:G307 #2=#:G306 #3=#:G308 #4=#:G310 |j|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|FRIDEAL;randomLC;NniVA;24|))
       (SEQ (LETT |j| (SPADCALL |v| (QREFELT $ 63)) . #5#)
            (LETT #4# (QVSIZE |v|) . #5#) G190 (COND ((> |j| #4#) (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3#
                     (SPADCALL (RANDOM |m|) (QAREF1O |v| |j| 1)
                               (QREFELT $ 135))
                     . #5#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 133)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 134)))))))) 

(DEFUN |FRIDEAL;minimize;2$;25| (|i| $)
  (PROG (#1=#:G316 #2=#:G318 |u| |range| |nrm| |n| |nm|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |n|
              (QVSIZE
               (LETT |nm| (SPADCALL |i| (QREFELT $ 17))
                     . #3=(|FRIDEAL;minimize;2$;25|)))
              . #3#)
        (COND ((EQL |n| 1) (EXIT |i|))
              ((< |n| 3) (COND ((|FRIDEAL;ret?| |nm| $) (EXIT |i|)))))
        (LETT |nrm|
              (SPADCALL
               (SPADCALL (|FRIDEAL;mkIdeal| |nm| (|spadConstant| $ 12) $)
                         (QREFELT $ 53))
               (QREFELT $ 48))
              . #3#)
        (SEQ
         (EXIT
          (SEQ (LETT |range| 1 . #3#) G190
               (COND ((|greater_SI| |range| 5) (GO G191)))
               (SEQ
                (LETT |u| (|FRIDEAL;tryRange| |range| |nm| |nrm| |i| $) . #3#)
                (EXIT
                 (COND
                  ((QEQCAR |u| 0)
                   (PROGN
                    (LETT #1# (PROGN (LETT #2# (QCDR |u|) . #3#) (GO #2#))
                          . #3#)
                    (GO #1#))))))
               (LETT |range| (|inc_SI| |range|) . #3#) (GO G190) G191
               (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT |i|)))
      #2# (EXIT #2#))))) 

(DEFUN |FractionalIdeal| (&REST #1=#:G319)
  (PROG ()
    (RETURN
     (PROG (#2=#:G320)
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
             ((NOT #2#) (HREM |$ConstructorCache| '|FractionalIdeal|))))))))))) 

(DEFUN |FractionalIdeal;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FractionalIdeal|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|FractionalIdeal| DV$1 DV$2 DV$3 DV$4) . #1#)
      (LETT $ (GETREFV 140) . #1#)
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
        (QSETREFV $ 55
                  (CONS (|dispatchFunction| |FRIDEAL;randomLC;NniVA;23|) $)))
       ('T
        (QSETREFV $ 55
                  (CONS (|dispatchFunction| |FRIDEAL;randomLC;NniVA;24|) $))))
      $)))) 

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
              (99 . |coefficients|) (104 . |retract|) (|PositiveInteger|)
              (109 . |rank|) (113 . ^) (119 . /) |FRIDEAL;norm;$F;10| (125 . *)
              (131 . |randomLC|) (137 . |norm|) (|Union| $ '"failed")
              (142 . |exquo|) (148 . |unit?|) (153 . |coerce|) (158 . |coerce|)
              (|Integer|) (163 . |minIndex|) (168 . +) (|Mapping| 28 28 28)
              (|List| 28) (174 . |reduce|) (|Fraction| 8) (180 . |coerce|)
              (|Matrix| 68) (|Mapping| 68 8)
              (|MatrixCategoryFunctions2| 8 (|Vector| 8) (|Vector| 8) 28 68
                                          (|Vector| 68) (|Vector| 68) 70)
              (185 . |map|) (191 . |inverse|) (196 . |coerce|) (201 . *)
              (|Record| (|:| |num| 28) (|:| |den| 8))
              (|MatrixCommonDenominator| 8 68) (207 . |splitDenominator|)
              (|Record| (|:| |num| 43) (|:| |den| 6))
              (|InnerCommonDenominator| 6 7 43 46) (212 . |splitDenominator|)
              (217 . |reduce|) (|List| 8) (223 . |parts|) (228 . |degree|)
              (233 . |max|) (|Mapping| 25 25 25) (|List| 25) (239 . |reduce|)
              (245 . |coefficient|) (|Mapping| 7 8)
              (|MatrixCategoryFunctions2| 8 (|Vector| 8) (|Vector| 8) 28 7 21
                                          21 19)
              (251 . |map|) (257 . *) |FRIDEAL;ideal;V$;14| |FRIDEAL;inv;2$;13|
              (|CommonDenominator| 6 7 21) (263 . |commonDenominator|)
              (268 . |lcm|) (|List| 9) (274 . |removeDuplicates|)
              (279 . |Zero|) (283 . |quo|) (289 . ~=) (295 . |inv|)
              (300 . |zero?|) (305 . |concat|) (311 . |minIndex|) (316 . |elt|)
              (|SparseUnivariatePolynomial| 9) (322 . |monomial|) (328 . +)
              (334 . |Zero|) (338 . *) (344 . |coefficients|) (349 . *)
              |FRIDEAL;*;3$;18| |FRIDEAL;^;$I$;19| (355 . ^) (361 . ^)
              (|OutputForm|) (367 . |coerce|) (|List| $) (372 . |paren|)
              |FRIDEAL;basis;$V;21| (377 . |coerce|) (382 . |coerce|) (387 . /)
              (393 . *) |FRIDEAL;coerce;$Of;22| (399 . |random|) (403 . +)
              (409 . |Zero|) (413 . *) |FRIDEAL;minimize;2$;25| (|HashState|)
              (|String|) (|SingleInteger|))
           '#(~= 419 |sample| 425 |recip| 429 |randomLC| 434 |one?| 440 |numer|
              445 |norm| 450 |minimize| 455 |latex| 460 |inv| 465 |ideal| 470
              |hashUpdate!| 475 |hash| 481 |denom| 486 |conjugate| 491
              |commutator| 497 |coerce| 503 |basis| 508 ^ 513 |One| 531 = 535 /
              541 * 547)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0))
                 (CONS
                  '#(|Group&| |Monoid&| |SemiGroup&| |SetCategory&|
                     |BasicType&| NIL NIL)
                  (CONS
                   '#((|Group|) (|Monoid|) (|SemiGroup|) (|SetCategory|)
                      (|BasicType|) (|unitsKnown|) (|CoercibleTo| 122))
                   (|makeByteWordVec2| 139
                                       '(0 6 0 12 0 7 0 13 0 8 0 14 0 9 0 15 1
                                         19 0 0 20 1 9 21 0 22 2 19 21 0 21 23
                                         1 9 0 21 24 2 8 0 7 25 26 1 9 19 0 27
                                         2 30 28 29 19 31 1 9 32 0 33 2 16 34
                                         35 0 36 2 6 34 0 0 37 2 16 34 0 0 38 0
                                         6 0 40 2 6 0 0 0 41 3 43 6 42 0 6 44 1
                                         28 8 0 45 1 8 46 0 47 1 7 6 0 48 0 9
                                         49 50 2 6 0 0 49 51 2 7 0 6 6 52 2 25
                                         0 49 0 54 2 0 9 25 16 55 1 9 7 0 56 2
                                         6 57 0 0 58 1 6 34 0 59 1 7 0 6 60 1 9
                                         0 7 61 1 16 62 0 63 2 28 0 0 0 64 2 66
                                         28 65 0 67 1 68 0 8 69 2 72 70 71 28
                                         73 1 70 57 0 74 1 8 0 7 75 2 70 0 68 0
                                         76 1 78 77 70 79 1 81 80 46 82 2 43 6
                                         42 0 83 1 28 84 0 85 1 8 25 0 86 2 25
                                         0 0 0 87 2 89 25 88 0 90 2 8 7 0 25 91
                                         2 93 19 92 28 94 2 9 0 7 0 95 1 98 6
                                         21 99 2 6 0 0 0 100 1 101 0 0 102 0 7
                                         0 103 2 6 0 0 0 104 2 6 34 0 0 105 1 7
                                         0 0 106 1 9 34 0 107 2 16 0 9 0 108 1
                                         21 62 0 109 2 21 7 0 62 110 2 111 0 9
                                         25 112 2 111 0 0 0 113 0 111 0 114 2
                                         111 0 0 0 115 1 111 101 0 116 2 6 0 0
                                         0 117 2 9 0 0 25 120 2 6 0 0 25 121 1
                                         9 122 0 123 1 122 0 124 125 1 62 122 0
                                         127 1 6 122 0 128 2 122 0 0 0 129 2
                                         122 0 0 0 130 0 7 0 132 2 9 0 0 0 133
                                         0 9 0 134 2 9 0 62 0 135 2 0 34 0 0 1
                                         0 0 0 1 1 0 57 0 1 2 0 9 25 16 55 1 0
                                         34 0 1 1 0 16 0 17 1 0 7 0 53 1 0 0 0
                                         136 1 0 138 0 1 1 0 0 0 97 1 0 0 16 96
                                         2 0 137 137 0 1 1 0 139 0 1 1 0 6 0 18
                                         2 0 0 0 0 1 2 0 0 0 0 1 1 0 122 0 131
                                         1 0 16 0 126 2 0 0 0 62 119 2 0 0 0 25
                                         1 2 0 0 0 49 1 0 0 0 11 2 0 34 0 0 39
                                         2 0 0 0 0 1 2 0 0 0 0 118)))))
           '|lookupComplete|)) 
