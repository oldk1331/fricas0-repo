
(/VERSIONCHECK 2) 

(DEFUN |MODOP;One;$;1| ($)
  (SPADCALL (|spadConstant| $ 13) (|spadConstant| $ 15) (QREFELT $ 16))) 

(DEFUN |MODOP;coerce;I$;2| (|n| $)
  (SPADCALL (SPADCALL |n| (QREFELT $ 18)) (QREFELT $ 19))) 

(DEFUN |MODOP;coerce;R$;3| (|r| $)
  (COND ((SPADCALL |r| (QREFELT $ 22)) (|spadConstant| $ 23))
        ('T (SPADCALL |r| (|spadConstant| $ 15) (QREFELT $ 16))))) 

(DEFUN |MODOP;coerce;Bo$;4| (|op| $)
  (|MODOP;nocopy| (SPADCALL |op| (QREFELT $ 25)) $)) 

(DEFUN |MODOP;nocopy| (|op| $)
  (SPADCALL (|spadConstant| $ 13) (SPADCALL |op| (QREFELT $ 27))
            (QREFELT $ 16))) 

(DEFUN |MODOP;elt;$2M;6| (|x| |r| $)
  (PROG (#1=#:G153 #2=#:G152 #3=#:G154 #4=#:G157 |t|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|MODOP;elt;$2M;6|))
       (SEQ (LETT |t| NIL . #5#) (LETT #4# (SPADCALL |x| (QREFELT $ 31)) . #5#)
            G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3#
                     (SPADCALL (QCDR |t|) (|MODOP;termeval| (QCAR |t|) |r| $)
                               (QREFELT $ 32))
                     . #5#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 33)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 34)))))))) 

(DEFUN |MODOP;rmeval| (|t| |r| $)
  (SPADCALL (QCAR |t|) (|MODOP;monomeval| (QCDR |t|) |r| $) (QREFELT $ 36))) 

(DEFUN |MODOP;termcopy| (|t| $)
  (PROG (#1=#:G164 |rm| #2=#:G163)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|MODOP;termcopy|))
       (SEQ (LETT |rm| NIL . #3#) (LETT #1# |t| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |rm| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT (LETT #2# (CONS (CONS (QCAR |rm|) (QCDR |rm|)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |MODOP;characteristic;Nni;9| ($) (SPADCALL (QREFELT $ 38))) 

(DEFUN |MODOP;mkop| (|r| |fg| $)
  (SPADCALL (LIST (CONS |r| |fg|)) (QREFELT $ 41))) 

(DEFUN |MODOP;evaluate;$M$;11| (|f| |g| $)
  (|MODOP;nocopy|
   (SPADCALL (SPADCALL |f| (QREFELT $ 42)) (QREFELT $ 10) |g| (QREFELT $ 45))
   $)) 

(DEFUN |MODOP;makeop;RFg$;12| (|r| |fg| $)
  (COND
   ((SPADCALL |r| (|spadConstant| $ 48) (QREFELT $ 49))
    (|MODOP;mkop| |r| |fg| $))
   ('T
    (SPADCALL (|MODOP;mkop| (SPADCALL |r| (QREFELT $ 50)) |fg| $)
              (QREFELT $ 51))))) 

(DEFUN |MODOP;makeop;RFg$;13| (|r| |fg| $) (|MODOP;mkop| |r| |fg| $)) 

(DEFUN |MODOP;inv| (|t| $)
  (PROG (#1=#:G175 |m| |c|)
    (RETURN
     (SEQ
      (COND ((NULL |t|) (|spadConstant| $ 12))
            ('T
             (SEQ (LETT |c| (QCAR (|SPADfirst| |t|)) . #2=(|MODOP;inv|))
                  (LETT |m| (QCDR (|SPADfirst| |t|)) . #2#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL (|MODOP;inv| (CDR |t|) $)
                              (SPADCALL (|spadConstant| $ 13)
                                        (SPADCALL |m| (QREFELT $ 52))
                                        (QREFELT $ 16))
                              (QREFELT $ 53))
                    (SPADCALL
                     (PROG2 (LETT #1# (SPADCALL |c| (QREFELT $ 55)) . #2#)
                         (QCDR #1#)
                       (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
                     (QREFELT $ 19))
                    (QREFELT $ 53)))))))))) 

(DEFUN |MODOP;^;$I$;15| (|x| |i| $)
  (COND ((EQL |i| 0) (|spadConstant| $ 12))
        ((SPADCALL |i| 0 (QREFELT $ 56)) (SPADCALL |x| |i| (QREFELT $ 59)))
        ('T
         (SPADCALL (|MODOP;inv| (SPADCALL |x| (QREFELT $ 60)) $) (- |i|)
                   (QREFELT $ 61))))) 

(DEFUN |MODOP;evaluateInverse;$M$;16| (|f| |g| $)
  (|MODOP;nocopy|
   (SPADCALL (SPADCALL |f| (QREFELT $ 42)) (QREFELT $ 11) |g| (QREFELT $ 45))
   $)) 

(DEFUN |MODOP;coerce;$Of;17| (|x| $)
  (PROG (#1=#:G191 |t| #2=#:G190)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |x| (QREFELT $ 63))
        (SPADCALL (|spadConstant| $ 48) (QREFELT $ 65)))
       ('T
        (SPADCALL (ELT $ 66)
                  (PROGN
                   (LETT #2# NIL . #3=(|MODOP;coerce;$Of;17|))
                   (SEQ (LETT |t| NIL . #3#)
                        (LETT #1# (SPADCALL |x| (QREFELT $ 31)) . #3#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS (|MODOP;trm2O| (QCDR |t|) (QCAR |t|) $)
                                      #2#)
                                . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (QREFELT $ 69)))))))) 

(DEFUN |MODOP;trm2O| (|c| |t| $)
  (COND ((EQL |c| 1) (|MODOP;term2O| |t| $))
        ((EQL |c| -1) (SPADCALL (|MODOP;term2O| |t| $) (QREFELT $ 71)))
        ('T
         (SPADCALL (SPADCALL |c| (QREFELT $ 72)) (|MODOP;term2O| |t| $)
                   (QREFELT $ 73))))) 

(DEFUN |MODOP;term2O| (|t| $)
  (PROG (#1=#:G201 |rm| #2=#:G200)
    (RETURN
     (SEQ
      (SPADCALL (ELT $ 73)
                (PROGN
                 (LETT #2# NIL . #3=(|MODOP;term2O|))
                 (SEQ (LETT |rm| NIL . #3#) (LETT #1# |t| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |rm| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (|MODOP;rm2O| (QCAR |rm|) (QCDR |rm|) $)
                                    #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 69)))))) 

(DEFUN |MODOP;rm2O| (|c| |m| $)
  (COND
   ((SPADCALL |c| (|spadConstant| $ 13) (QREFELT $ 74))
    (SPADCALL |m| (QREFELT $ 75)))
   ((SPADCALL |m| (|spadConstant| $ 15) (QREFELT $ 76))
    (SPADCALL |c| (QREFELT $ 65)))
   ('T
    (SPADCALL (SPADCALL |c| (QREFELT $ 65)) (SPADCALL |m| (QREFELT $ 75))
              (QREFELT $ 73))))) 

(DEFUN |MODOP;*;3$;21| (|x| |y| $)
  (PROG (#1=#:G205 #2=#:G204 #3=#:G206 #4=#:G208 #5=#:G207 #6=#:G209 #7=#:G213
         |s| #8=#:G212 |t|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #9=(|MODOP;*;3$;21|))
       (SEQ (LETT |t| NIL . #9#) (LETT #8# (SPADCALL |x| (QREFELT $ 31)) . #9#)
            G190
            (COND
             ((OR (ATOM #8#) (PROGN (LETT |t| (CAR #8#) . #9#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3#
                     (PROGN
                      (LETT #4# NIL . #9#)
                      (SEQ (LETT |s| NIL . #9#)
                           (LETT #7# (SPADCALL |y| (QREFELT $ 31)) . #9#) G190
                           (COND
                            ((OR (ATOM #7#)
                                 (PROGN (LETT |s| (CAR #7#) . #9#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #6#
                                    (|MODOP;termprod0|
                                     (* (QCDR |t|) (QCDR |s|)) (QCAR |t|)
                                     (QCAR |s|) $)
                                    . #9#)
                              (COND
                               (#4#
                                (LETT #5# (SPADCALL #5# #6# (QREFELT $ 77))
                                      . #9#))
                               ('T
                                (PROGN
                                 (LETT #5# #6# . #9#)
                                 (LETT #4# 'T . #9#)))))))
                           (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                           (EXIT NIL))
                      (COND (#4# #5#) ('T (|spadConstant| $ 23))))
                     . #9#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 77)) . #9#))
                     ('T (PROGN (LETT #2# #3# . #9#) (LETT #1# 'T . #9#)))))))
            (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 23)))))))) 

(DEFUN |MODOP;termprod0| (|n| |x| |y| $)
  (COND ((>= |n| 0) (SPADCALL (|MODOP;termprod| |n| |x| |y| $) (QREFELT $ 41)))
        ('T
         (SPADCALL
          (SPADCALL (|MODOP;termprod| (- |n|) |x| |y| $) (QREFELT $ 41))
          (QREFELT $ 51))))) 

(DEFUN |MODOP;termprod| (|n| |x| |y| $)
  (PROG (|rm| |lc| |xx|)
    (RETURN
     (SEQ
      (LETT |lc|
            (|SPADfirst|
             (LETT |xx| (|MODOP;termcopy| |x| $) . #1=(|MODOP;termprod|)))
            . #1#)
      (PROGN
       (RPLACA |lc| (SPADCALL |n| (QCAR |lc|) (QREFELT $ 78)))
       (QCAR |lc|))
      (LETT |rm| (SPADCALL |xx| (QREFELT $ 79)) . #1#)
      (EXIT
       (COND
        ((SPADCALL (QCAR (|SPADfirst| |y|)) (|spadConstant| $ 13)
                   (QREFELT $ 74))
         (SEQ
          (PROGN
           (RPLACD |rm|
                   (SPADCALL (QCDR |rm|) (QCDR (|SPADfirst| |y|))
                             (QREFELT $ 80)))
           (QCDR |rm|))
          (EXIT
           (SPADCALL |xx| (|MODOP;termcopy| (CDR |y|) $) (QREFELT $ 81)))))
        ((SPADCALL (QCDR |rm|) (|spadConstant| $ 15) (QREFELT $ 76))
         (SEQ
          (PROGN
           (RPLACA |rm|
                   (SPADCALL (QCAR |rm|) (QCAR (|SPADfirst| |y|))
                             (QREFELT $ 82)))
           (QCAR |rm|))
          (PROGN (RPLACD |rm| (QCDR (|SPADfirst| |y|))) (QCDR |rm|))
          (EXIT
           (SPADCALL |xx| (|MODOP;termcopy| (CDR |y|) $) (QREFELT $ 81)))))
        ('T (SPADCALL |xx| (|MODOP;termcopy| |y| $) (QREFELT $ 81))))))))) 

(DEFUN |MODOP;opeval;Bo2M;24| (|op| |r| $)
  (PROG (|func|)
    (RETURN
     (SEQ
      (LETT |func| (SPADCALL |op| (QREFELT $ 10) (QREFELT $ 84))
            |MODOP;opeval;Bo2M;24|)
      (EXIT
       (COND ((QEQCAR |func| 1) (SPADCALL |op| |r| (QREFELT $ 85)))
             ('T (SPADCALL |r| (QCDR |func|))))))))) 

(DEFUN |MODOP;opeval;Bo2M;25| (|op| |r| $)
  (PROG (|func|)
    (RETURN
     (SEQ
      (LETT |func| (SPADCALL |op| (QREFELT $ 10) (QREFELT $ 84))
            |MODOP;opeval;Bo2M;25|)
      (EXIT
       (COND
        ((QEQCAR |func| 1)
         (|error| "eval: operator has no evaluation function"))
        ('T (SPADCALL |r| (QCDR |func|))))))))) 

(DEFUN |MODOP;opInvEval| (|op| |r| $)
  (PROG (|func|)
    (RETURN
     (SEQ
      (LETT |func| (SPADCALL |op| (QREFELT $ 11) (QREFELT $ 84))
            |MODOP;opInvEval|)
      (EXIT
       (COND
        ((QEQCAR |func| 1)
         (|error| "eval: operator has no inverse evaluation function"))
        ('T (SPADCALL |r| (QCDR |func|))))))))) 

(DEFUN |MODOP;termeval| (|t| |r| $)
  (PROG (#1=#:G244 |rm|)
    (RETURN
     (SEQ
      (SEQ (LETT |rm| NIL . #2=(|MODOP;termeval|))
           (LETT #1# (REVERSE |t|) . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |rm| (CAR #1#) . #2#) NIL))
             (GO G191)))
           (SEQ (EXIT (LETT |r| (|MODOP;rmeval| |rm| |r| $) . #2#)))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |r|))))) 

(DEFUN |MODOP;monomeval| (|m| |r| $)
  (PROG (#1=#:G254 |i| |g| |e| #2=#:G253 |rec|)
    (RETURN
     (SEQ
      (SEQ (LETT |rec| NIL . #3=(|MODOP;monomeval|))
           (LETT #2# (NREVERSE (SPADCALL |m| (QREFELT $ 89))) . #3#) G190
           (COND
            ((OR (ATOM #2#) (PROGN (LETT |rec| (CAR #2#) . #3#) NIL))
             (GO G191)))
           (SEQ (LETT |e| (QCDR |rec|) . #3#) (LETT |g| (QCAR |rec|) . #3#)
                (EXIT
                 (COND
                  ((SPADCALL |e| 0 (QREFELT $ 56))
                   (SEQ (LETT |i| 1 . #3#) G190
                        (COND ((|greater_SI| |i| |e|) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |r| (SPADCALL |g| |r| (QREFELT $ 86)) . #3#)))
                        (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                        (EXIT NIL)))
                  ((< |e| 0)
                   (SEQ (LETT |i| 1 . #3#) (LETT #1# (- |e|) . #3#) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT (LETT |r| (|MODOP;opInvEval| |g| |r| $) . #3#)))
                        (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                        (EXIT NIL))))))
           (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |r|))))) 

(DEFUN |MODOP;recip;$U;29| (|x| $)
  (PROG (|r1| |r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 91)) . #1=(|MODOP;recip;$U;29|))
          (EXIT
           (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                 (#2='T
                  (SEQ (LETT |r1| (SPADCALL (QCDR |r|) (QREFELT $ 55)) . #1#)
                       (EXIT
                        (COND ((QEQCAR |r1| 1) (CONS 1 "failed"))
                              (#2#
                               (CONS 0
                                     (SPADCALL (QCDR |r1|)
                                               (QREFELT $ 19)))))))))))))) 

(DEFUN |MODOP;retractIfCan;$U;30| (|x| $)
  (PROG (|rm| |t| |r|)
    (RETURN
     (SEQ
      (LETT |r| (SPADCALL |x| (QREFELT $ 94))
            . #1=(|MODOP;retractIfCan;$U;30|))
      (EXIT
       (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
             ((NULL (LETT |t| (QCDR |r|) . #1#))
              (CONS 0 (|spadConstant| $ 48)))
             ((NULL (CDR |t|))
              (SEQ (LETT |rm| (|SPADfirst| |t|) . #1#)
                   (EXIT
                    (COND
                     ((SPADCALL (QCDR |rm|) (|spadConstant| $ 15)
                                (QREFELT $ 76))
                      (CONS 0 (QCAR |rm|)))
                     (#2='T (CONS 1 "failed"))))))
             (#2# (CONS 1 "failed")))))))) 

(DEFUN |MODOP;retractIfCan;$U;31| (|x| $)
  (PROG (|rm| |t| |r|)
    (RETURN
     (SEQ
      (LETT |r| (SPADCALL |x| (QREFELT $ 94))
            . #1=(|MODOP;retractIfCan;$U;31|))
      (EXIT
       (COND
        ((OR (QEQCAR |r| 1)
             (OR (NULL (LETT |t| (QCDR |r|) . #1#)) (NULL (NULL (CDR |t|)))))
         (CONS 1 "failed"))
        ('T
         (SEQ (LETT |rm| (|SPADfirst| |t|) . #1#)
              (EXIT
               (COND
                ((SPADCALL (QCAR |rm|) (|spadConstant| $ 13) (QREFELT $ 74))
                 (SPADCALL (QCDR |rm|) (QREFELT $ 96)))
                ('T (CONS 1 "failed")))))))))))) 

(DEFUN |MODOP;*;R2$;32| (|r| |x| $)
  (SPADCALL (SPADCALL |r| (QREFELT $ 19)) |x| (QREFELT $ 53))) 

(DEFUN |MODOP;*;$R$;33| (|x| |r| $)
  (SPADCALL |x| (SPADCALL |r| (QREFELT $ 19)) (QREFELT $ 53))) 

(DEFUN |MODOP;adjoint;2$;34| (|x| $)
  (PROG (#1=#:G292 #2=#:G291 #3=#:G293 #4=#:G296 |t|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|MODOP;adjoint;2$;34|))
       (SEQ (LETT |t| NIL . #5#) (LETT #4# (SPADCALL |x| (QREFELT $ 31)) . #5#)
            G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3#
                     (SPADCALL (QCDR |t|) (|MODOP;termadj| (QCAR |t|) $)
                               (QREFELT $ 100))
                     . #5#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 77)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 23)))))))) 

(DEFUN |MODOP;rmadj| (|t| $)
  (SPADCALL (SPADCALL (QCAR |t|) (QREFELT $ 102))
            (|MODOP;monomadj| (QCDR |t|) $) (QREFELT $ 98))) 

(DEFUN |MODOP;adjoint;3$;36| (|op| |adj| $)
  (|MODOP;nocopy|
   (SPADCALL (SPADCALL |op| (QREFELT $ 42)) (QREFELT $ 9)
             (SPADCALL |adj| (QREFELT $ 104)) (QREFELT $ 45))
   $)) 

(DEFUN |MODOP;termadj| (|t| $)
  (PROG (|ans| #1=#:G304 |rm|)
    (RETURN
     (SEQ (LETT |ans| (|spadConstant| $ 12) . #2=(|MODOP;termadj|))
          (SEQ (LETT |rm| NIL . #2#) (LETT #1# |t| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |rm| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |ans|
                       (SPADCALL (|MODOP;rmadj| |rm| $) |ans| (QREFELT $ 53))
                       . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |MODOP;monomadj| (|m| $)
  (PROG (|ans| #1=#:G309 |rec|)
    (RETURN
     (SEQ (LETT |ans| (|spadConstant| $ 12) . #2=(|MODOP;monomadj|))
          (SEQ (LETT |rec| NIL . #2#)
               (LETT #1# (SPADCALL |m| (QREFELT $ 89)) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |ans|
                       (SPADCALL
                        (SPADCALL (|MODOP;opadj| (QCAR |rec|) $) (QCDR |rec|)
                                  (QREFELT $ 61))
                        |ans| (QREFELT $ 53))
                       . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |MODOP;opadj| (|op| $)
  (PROG (|adj|)
    (RETURN
     (SEQ
      (LETT |adj| (SPADCALL |op| (QREFELT $ 9) (QREFELT $ 84)) |MODOP;opadj|)
      (EXIT
       (COND
        ((QEQCAR |adj| 1)
         (|error| "adjoint: operator does not have a defined adjoint"))
        ('T (QCDR |adj|)))))))) 

(DEFUN |MODOP;conjug;2R;40| (|r| $) (SPADCALL |r| (QREFELT $ 106))) 

(PUT '|MODOP;conjug;2R;41| '|SPADreplace| '(XLAM (|r|) |r|)) 

(DEFUN |MODOP;conjug;2R;41| (|r| $) |r|) 

(DECLAIM (NOTINLINE |ModuleOperator;|)) 

(DEFUN |ModuleOperator| (&REST #1=#:G317)
  (PROG ()
    (RETURN
     (PROG (#2=#:G318)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ModuleOperator|)
                                           '|domainEqualList|)
                . #3=(|ModuleOperator|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |ModuleOperator;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|ModuleOperator|))))))))))) 

(DEFUN |ModuleOperator;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ModuleOperator|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|ModuleOperator| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 110) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|ModuleOperator| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8
                (|FreeAbelianGroup|
                 (|List|
                  (|Record| (|:| |coef| |#1|)
                            (|:| |monom| (|FreeGroup| (|BasicOperator|)))))))
      (QSETREFV $ 9 '|%opAdjoint|)
      (QSETREFV $ 10 '|%opEval|)
      (QSETREFV $ 11 '|%invEval|)
      (COND
       ((|HasCategory| |#1| '(|OrderedSet|))
        (QSETREFV $ 16 (CONS (|dispatchFunction| |MODOP;makeop;RFg$;12|) $)))
       ('T
        (QSETREFV $ 16 (CONS (|dispatchFunction| |MODOP;makeop;RFg$;13|) $))))
      (COND
       ((|HasCategory| |#2| '(|ExpressionSpace|))
        (QSETREFV $ 86 (CONS (|dispatchFunction| |MODOP;opeval;Bo2M;24|) $)))
       ('T
        (QSETREFV $ 86 (CONS (|dispatchFunction| |MODOP;opeval;Bo2M;25|) $))))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 98 (CONS (|dispatchFunction| |MODOP;*;R2$;32|) $))
         (QSETREFV $ 99 (CONS (|dispatchFunction| |MODOP;*;$R$;33|) $))
         (QSETREFV $ 101 (CONS (|dispatchFunction| |MODOP;adjoint;2$;34|) $))
         (QSETREFV $ 105 (CONS (|dispatchFunction| |MODOP;adjoint;3$;36|) $))
         (COND
          ((|HasSignature| |#1|
                           (LIST '|conjugate|
                                 (LIST (|devaluate| |#1|) (|devaluate| |#1|))))
           (QSETREFV $ 102 (CONS (|dispatchFunction| |MODOP;conjug;2R;40|) $)))
          ('T
           (QSETREFV $ 102
                     (CONS (|dispatchFunction| |MODOP;conjug;2R;41|) $)))))))
      $)))) 

(MAKEPROP '|ModuleOperator| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FreeAbelianGroup| 40) (|local| |#1|)
              (|local| |#2|) '|Rep| 'OPADJ 'OPEVAL 'INVEVAL
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |MODOP;One;$;1|) $))
              (0 . |One|) (|FreeGroup| 24) (4 . |One|) (8 . |makeop|)
              (|Integer|) (14 . |coerce|) |MODOP;coerce;R$;3|
              |MODOP;coerce;I$;2| (|Boolean|) (19 . |zero?|) (24 . |Zero|)
              (|BasicOperator|) (28 . |copy|) |MODOP;coerce;Bo$;4|
              (33 . |coerce|) (|Record| (|:| |coef| 6) (|:| |monom| 14))
              (|Record| (|:| |gen| 40) (|:| |exp| 17)) (|List| 29)
              (38 . |terms|) (43 . *) (49 . +) (55 . |Zero|) |MODOP;elt;$2M;6|
              (59 . *) (|NonNegativeInteger|) (65 . |characteristic|)
              |MODOP;characteristic;Nni;9| (|List| 28) (69 . |coerce|)
              (74 . |retract|) (|Symbol|) (|None|) (79 . |setProperty|)
              (|Mapping| 7 7) |MODOP;evaluate;$M$;11| (86 . |Zero|) (90 . >=)
              (96 . -) (101 . -) (106 . |inv|) |MODOP;*;3$;21|
              (|Union| $ '"failed") (111 . |recip|) (116 . >)
              (|PositiveInteger|) (|RepeatedSquaring| $$) (122 . |expt|)
              (128 . |retract|) |MODOP;^;$I$;15| |MODOP;evaluateInverse;$M$;16|
              (133 . |zero?|) (|OutputForm|) (138 . |coerce|) (143 . +)
              (|Mapping| 64 64 64) (|List| 64) (149 . |reduce|)
              |MODOP;coerce;$Of;17| (155 . -) (160 . |coerce|) (165 . *)
              (171 . =) (177 . |coerce|) (182 . =) (188 . +) (194 . *)
              (200 . |last|) (205 . *) (211 . |concat!|) (217 . *)
              (|Union| 44 '"failed") (223 . |property|) (229 . |kernel|)
              (235 . |opeval|) (|Record| (|:| |gen| 24) (|:| |exp| 17))
              (|List| 87) (241 . |factors|) (|Union| 6 '"failed")
              |MODOP;retractIfCan;$U;30| |MODOP;recip;$U;29|
              (|Union| 40 '"failed") (246 . |retractIfCan|)
              (|Union| 24 '"failed") (251 . |retractIfCan|)
              |MODOP;retractIfCan;$U;31| (256 . *) (262 . *) (268 . *)
              (274 . |adjoint|) (279 . |conjug|) (|NoneFunctions1| $$)
              (284 . |coerce|) (289 . |adjoint|) (295 . |conjugate|) (|String|)
              (|SingleInteger|) (|HashState|))
           '#(~= 300 |zero?| 306 |subtractIfCan| 311 |sample| 317
              |retractIfCan| 321 |retract| 331 |recip| 341 |opeval| 346 |one?|
              352 |makeop| 357 |latex| 363 |hashUpdate!| 368 |hash| 374
              |evaluateInverse| 379 |evaluate| 385 |elt| 391 |conjug| 397
              |coerce| 402 |charthRoot| 422 |characteristic| 427 |adjoint| 431
              ^ 442 |Zero| 460 |One| 464 = 468 - 474 + 485 * 491)
           'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(1 1 2 3 0 1 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0))
            (CONS
             '#(|Algebra&| |Module&| NIL NIL |Ring&| NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL |AbelianMonoid&| |Monoid&| NIL
                |SemiGroup&| |AbelianSemiGroup&| |SetCategory&| NIL
                |RetractableTo&| |RetractableTo&| NIL |BasicType&| NIL)
             (CONS
              '#((|Algebra| 6) (|Module| 6) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Ring|) (|BiModule| 6 6) (|Rng|)
                 (|LeftModule| $$) (|LeftModule| 6) (|RightModule| 6)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|SetCategory|) (|Eltable| 7 7)
                 (|RetractableTo| 24) (|RetractableTo| 6) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 64))
              (|makeByteWordVec2| 109
                                  '(0 6 0 13 0 14 0 15 2 0 0 6 14 16 1 6 0 17
                                    18 1 6 21 0 22 0 0 0 23 1 24 0 0 25 1 14 0
                                    24 27 1 8 30 0 31 2 7 0 17 0 32 2 7 0 0 0
                                    33 0 7 0 34 2 7 0 6 0 36 0 6 37 38 1 8 0 40
                                    41 1 0 24 0 42 3 24 0 0 43 44 45 0 6 0 48 2
                                    6 21 0 0 49 1 6 0 0 50 1 0 0 0 51 1 14 0 0
                                    52 1 6 54 0 55 2 17 21 0 0 56 2 58 2 2 57
                                    59 1 8 40 0 60 1 0 21 0 63 1 6 64 0 65 2 64
                                    0 0 0 66 2 68 64 67 0 69 1 64 0 0 71 1 17
                                    64 0 72 2 64 0 0 0 73 2 6 21 0 0 74 1 14 64
                                    0 75 2 14 21 0 0 76 2 0 0 0 0 77 2 6 0 17 0
                                    78 1 40 28 0 79 2 14 0 0 0 80 2 40 0 0 0 81
                                    2 6 0 0 0 82 2 24 83 0 43 84 2 7 0 24 0 85
                                    2 0 7 24 7 86 1 14 88 0 89 1 8 93 0 94 1 14
                                    95 0 96 2 0 0 6 0 98 2 0 0 0 6 99 2 0 0 17
                                    0 100 1 0 0 0 101 1 0 6 6 102 1 103 44 2
                                    104 2 0 0 0 0 105 1 6 0 0 106 2 0 21 0 0 1
                                    1 0 21 0 63 2 0 54 0 0 1 0 0 0 1 1 0 95 0
                                    97 1 0 90 0 91 1 0 24 0 42 1 0 6 0 1 1 0 54
                                    0 92 2 0 7 24 7 86 1 0 21 0 1 2 0 0 6 14 16
                                    1 0 107 0 1 2 0 109 109 0 1 1 0 108 0 1 2 0
                                    0 0 46 62 2 0 0 0 46 47 2 0 7 0 7 35 1 1 6
                                    6 102 1 0 0 24 26 1 0 0 6 19 1 0 0 17 20 1
                                    0 64 0 70 1 2 54 0 1 0 0 37 39 2 1 0 0 0
                                    105 1 1 0 0 101 2 0 0 0 17 61 2 0 0 0 37 1
                                    2 0 0 0 57 1 0 0 0 23 0 0 0 12 2 0 21 0 0 1
                                    2 0 0 0 0 1 1 0 0 0 51 2 0 0 0 0 77 2 1 0 0
                                    6 99 2 1 0 6 0 98 2 0 0 0 0 53 2 0 0 17 0
                                    100 2 0 0 37 0 1 2 0 0 57 0 1)))))
           '|lookupComplete|)) 
