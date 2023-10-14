
(/VERSIONCHECK 2) 

(DEFUN |SMP;Zero;$;1| ($) (CONS 0 (|spadConstant| $ 11))) 

(DEFUN |SMP;One;$;2| ($) (CONS 0 (|spadConstant| $ 13))) 

(DEFUN |SMP;zero?;$B;3| (|p| $)
  (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT $ 16))) ('T 'NIL))) 

(DEFUN |SMP;one?;$B;4| (|p| $)
  (COND
   ((QEQCAR |p| 0)
    (SPADCALL (QCDR |p|) (QCDR (|spadConstant| $ 14)) (QREFELT $ 18)))
   ('T 'NIL))) 

(DEFUN |SMP;red| (|p| $)
  (COND ((QEQCAR |p| 0) (|spadConstant| $ 12))
        ((SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 20)) (QREFELT $ 21))
         (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 20)) (QREFELT $ 22)))
        ('T
         (CONS 1
               (CONS (QCAR (QCDR |p|))
                     (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 20))))))) 

(DEFUN |SMP;numberOfMonomials;$Nni;6| (|p| $)
  (PROG (#1=#:G229 #2=#:G228 #3=#:G230 #4=#:G232 |q|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR |p| 0)
        (COND ((SPADCALL (QCDR |p|) (QREFELT $ 16)) 0) (#5='T 1)))
       (#5#
        (PROGN
         (LETT #1# NIL . #6=(|SMP;numberOfMonomials;$Nni;6|))
         (SEQ (LETT |q| NIL . #6#)
              (LETT #4# (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24)) . #6#) G190
              (COND
               ((OR (ATOM #4#) (PROGN (LETT |q| (CAR #4#) . #6#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (PROGN
                 (LETT #3# (SPADCALL |q| (QREFELT $ 26)) . #6#)
                 (COND (#1# (LETT #2# (+ #2# #3#) . #6#))
                       ('T
                        (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
              (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
         (COND (#1# #2#) (#5# 0))))))))) 

(DEFUN |SMP;coerce;VarSet$;7| (|mvar| $)
  (CONS 1 (CONS |mvar| (SPADCALL (|spadConstant| $ 14) 1 (QREFELT $ 27))))) 

(DEFUN |SMP;monomial?;$B;8| (|p| $)
  (PROG (|sup|)
    (RETURN
     (SEQ
      (COND ((QEQCAR |p| 0) 'T)
            (#1='T
             (SEQ (LETT |sup| (QCDR (QCDR |p|)) |SMP;monomial?;$B;8|)
                  (EXIT
                   (COND
                    ((SPADCALL 1 (SPADCALL |sup| (QREFELT $ 30))
                               (QREFELT $ 31))
                     'NIL)
                    (#1#
                     (SPADCALL (SPADCALL |sup| (QREFELT $ 22))
                               (QREFELT $ 32)))))))))))) 

(DEFUN |SMP;moreThanOneVariable?| (|p| $)
  (PROG (|q|)
    (RETURN
     (SEQ
      (COND ((QEQCAR |p| 0) 'NIL)
            (#1='T
             (SEQ (LETT |q| (QCDR (QCDR |p|)) |SMP;moreThanOneVariable?|)
                  (EXIT
                   (COND
                    ((SPADCALL (CONS #'|SMP;moreThanOneVariable?!0| $)
                               (SPADCALL |q| (QREFELT $ 24)) (QREFELT $ 37))
                     'T)
                    (#1# 'NIL)))))))))) 

(DEFUN |SMP;moreThanOneVariable?!0| (|x1| $)
  (COND ((SPADCALL |x1| (QREFELT $ 33)) (|spadConstant| $ 34))
        ('T (|spadConstant| $ 35)))) 

(DEFUN |SMP;univariateKnown| (|p| $)
  (COND
   ((QEQCAR |p| 0) (SPADCALL (SPADCALL |p| (QREFELT $ 38)) (QREFELT $ 40)))
   ('T
    (SPADCALL
     (SPADCALL (SPADCALL |p| (QREFELT $ 38))
               (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 41)) (QREFELT $ 42))
     (|SMP;univariateKnown| (|SMP;red| |p| $) $) (QREFELT $ 43))))) 

(DEFUN |SMP;univariate;$Sup;11| (|p| $)
  (COND
   ((QEQCAR |p| 0) (SPADCALL (SPADCALL |p| (QREFELT $ 38)) (QREFELT $ 40)))
   ((|SMP;moreThanOneVariable?| |p| $) (|error| "not univariate"))
   ('T (SPADCALL (ELT $ 38) (QCDR (QCDR |p|)) (QREFELT $ 46))))) 

(DEFUN |SMP;multivariate;SupVarSet$;12| (|u| |var| $)
  (COND ((SPADCALL |u| (QREFELT $ 48)) (CONS 0 (SPADCALL |u| (QREFELT $ 49))))
        ('T
         (SPADCALL
          (CONS 1
                (CONS |var|
                      (SPADCALL (CONS 0 (SPADCALL |u| (QREFELT $ 49)))
                                (SPADCALL |u| (QREFELT $ 50)) (QREFELT $ 27))))
          (SPADCALL (SPADCALL |u| (QREFELT $ 51)) |var| (QREFELT $ 52))
          (QREFELT $ 53))))) 

(DEFUN |SMP;univariate;$VarSetSup;13| (|p| |mvar| $)
  (PROG (|pt|)
    (RETURN
     (SEQ
      (COND
       ((OR (QEQCAR |p| 0) (SPADCALL (QCAR (QCDR |p|)) |mvar| (QREFELT $ 54)))
        (SPADCALL |p| 0 (QREFELT $ 27)))
       ('T
        (SEQ (LETT |pt| (QCDR (QCDR |p|)) |SMP;univariate;$VarSetSup;13|)
             (EXIT
              (COND ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 55)) |pt|)
                    ('T
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 14) (QCAR (QCDR |p|))
                                 (SPADCALL |pt| (QREFELT $ 41)) (QREFELT $ 56))
                       (SPADCALL (SPADCALL |pt| (QREFELT $ 22)) |mvar|
                                 (QREFELT $ 58))
                       (QREFELT $ 59))
                      (SPADCALL (|SMP;red| |p| $) |mvar| (QREFELT $ 58))
                      (QREFELT $ 60)))))))))))) 

(DEFUN |SMP;unlikeUnivReconstruct| (|u| |mvar| $)
  (PROG (|d|)
    (RETURN
     (COND
      ((ZEROP
        (LETT |d| (SPADCALL |u| (QREFELT $ 62)) |SMP;unlikeUnivReconstruct|))
       (SPADCALL |u| 0 (QREFELT $ 63)))
      ('T
       (SPADCALL
        (SPADCALL (SPADCALL |u| (QREFELT $ 64)) |mvar| |d| (QREFELT $ 56))
        (|SMP;unlikeUnivReconstruct| (SPADCALL |u| (QREFELT $ 65)) |mvar| $)
        (QREFELT $ 53))))))) 

(DEFUN |SMP;multivariate;SupVarSet$;15| (|u| |mvar| $)
  (PROG (#1=#:G269 |uu| |cc|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((SPADCALL |u| (QREFELT $ 66)) (SPADCALL |u| 0 (QREFELT $ 63)))
             ('T
              (SEQ (LETT |uu| |u| . #2=(|SMP;multivariate;SupVarSet$;15|))
                   (SEQ G190
                        (COND
                         ((NULL
                           (COND ((SPADCALL |uu| (QREFELT $ 67)) 'NIL)
                                 ('T 'T)))
                          (GO G191)))
                        (SEQ (LETT |cc| (SPADCALL |uu| (QREFELT $ 64)) . #2#)
                             (COND
                              ((OR (QEQCAR |cc| 0)
                                   (SPADCALL |mvar| (QCAR (QCDR |cc|))
                                             (QREFELT $ 68)))
                               (EXIT
                                (LETT |uu| (SPADCALL |uu| (QREFELT $ 65))
                                      . #2#))))
                             (EXIT
                              (PROGN
                               (LETT #1#
                                     (|SMP;unlikeUnivReconstruct| |u| |mvar| $)
                                     . #2#)
                               (GO #1#))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT (CONS 1 (CONS |mvar| |u|)))))))
      #1# (EXIT #1#))))) 

(DEFUN |SMP;ground?;$B;16| (|p| $) (COND ((QEQCAR |p| 0) 'T) ('T 'NIL))) 

(DEFUN |SMP;monomial;$VarSetNni$;17| (|p| |mvar| |k1| $)
  (COND ((OR (ZEROP |k1|) (SPADCALL |p| (QREFELT $ 17))) |p|)
        ((OR (QEQCAR |p| 0) (SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 68)))
         (CONS 1 (CONS |mvar| (SPADCALL |p| |k1| (QREFELT $ 27)))))
        ('T
         (SPADCALL |p|
                   (CONS 1
                         (CONS |mvar|
                               (SPADCALL (|spadConstant| $ 14) |k1|
                                         (QREFELT $ 27))))
                   (QREFELT $ 70))))) 

(DEFUN |SMP;monomial;RIe$;18| (|c| |e| $)
  (COND ((SPADCALL |e| (QREFELT $ 72)) (CONS 0 |c|))
        ('T
         (SPADCALL
          (SPADCALL (|spadConstant| $ 14) (SPADCALL |e| (QREFELT $ 73))
                    (SPADCALL |e| (QREFELT $ 74)) (QREFELT $ 56))
          (SPADCALL |c| (SPADCALL |e| (QREFELT $ 75)) (QREFELT $ 76))
          (QREFELT $ 70))))) 

(DEFUN |SMP;coefficient;$IeR;19| (|p| |e| $)
  (PROG (|vp| |ve|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |e| (QREFELT $ 72))
        (COND ((QEQCAR |p| 0) (QCDR |p|))
              (#1='T
               (SPADCALL (SPADCALL (QCDR (QCDR |p|)) 0 (QREFELT $ 77)) |e|
                         (QREFELT $ 78)))))
       ((QEQCAR |p| 0) (QCDR (|spadConstant| $ 12)))
       (#1#
        (SEQ
         (LETT |ve| (SPADCALL |e| (QREFELT $ 73))
               . #2=(|SMP;coefficient;$IeR;19|))
         (LETT |vp| (QCAR (QCDR |p|)) . #2#)
         (EXIT
          (COND
           ((SPADCALL |ve| |vp| (QREFELT $ 54))
            (SPADCALL (SPADCALL (QCDR (QCDR |p|)) 0 (QREFELT $ 77)) |e|
                      (QREFELT $ 78)))
           ((SPADCALL |ve| |vp| (QREFELT $ 68)) (QCDR (|spadConstant| $ 12)))
           (#1#
            (SPADCALL
             (SPADCALL (QCDR (QCDR |p|)) (SPADCALL |e| (QREFELT $ 74))
                       (QREFELT $ 77))
             (SPADCALL |e| (QREFELT $ 75)) (QREFELT $ 78)))))))))))) 

(DEFUN |SMP;coerce;I$;20| (|n| $) (CONS 0 (SPADCALL |n| (QREFELT $ 80)))) 

(PUT '|SMP;coerce;R$;21| '|SPADreplace| '(XLAM (|c|) (CONS 0 |c|))) 

(DEFUN |SMP;coerce;R$;21| (|c| $) (CONS 0 |c|)) 

(DEFUN |SMP;characteristic;Nni;22| ($) (SPADCALL (QREFELT $ 83))) 

(DEFUN |SMP;recip;$U;23| (|p| $)
  (PROG (|uu|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR |p| 0)
        (SEQ (LETT |uu| (SPADCALL (QCDR |p|) (QREFELT $ 86)) |SMP;recip;$U;23|)
             (EXIT
              (COND ((QEQCAR |uu| 1) (CONS 1 "failed"))
                    (#1='T (CONS 0 (CONS 0 (QCDR |uu|))))))))
       (#1# (CONS 1 "failed"))))))) 

(DEFUN |SMP;-;2$;24| (|p| $)
  (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) (QREFELT $ 88))))
        ('T
         (CONS 1
               (CONS (QCAR (QCDR |p|))
                     (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 89))))))) 

(DEFUN |SMP;*;I2$;25| (|n| |p| $)
  (PROG (|up| |mvar|)
    (RETURN
     (SEQ
      (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL |n| (QCDR |p|) (QREFELT $ 91))))
            (#1='T
             (SEQ (LETT |mvar| (QCAR (QCDR |p|)) . #2=(|SMP;*;I2$;25|))
                  (LETT |up| (SPADCALL |n| (QCDR (QCDR |p|)) (QREFELT $ 92))
                        . #2#)
                  (EXIT
                   (COND
                    ((SPADCALL |up| (QREFELT $ 21))
                     (SPADCALL |up| (QREFELT $ 22)))
                    (#1# (CONS 1 (CONS |mvar| |up|)))))))))))) 

(DEFUN |SMP;*;R2$;26| (|c| |p| $)
  (PROG (|up| |mvar|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |c| (QCDR (|spadConstant| $ 14)) (QREFELT $ 18)) |p|)
            ((QEQCAR |p| 0) (CONS 0 (SPADCALL |c| (QCDR |p|) (QREFELT $ 94))))
            (#1='T
             (SEQ (LETT |mvar| (QCAR (QCDR |p|)) . #2=(|SMP;*;R2$;26|))
                  (LETT |up|
                        (SPADCALL (CONS 0 |c|) (QCDR (QCDR |p|))
                                  (QREFELT $ 59))
                        . #2#)
                  (EXIT
                   (COND
                    ((SPADCALL |up| (QREFELT $ 21))
                     (SPADCALL |up| (QREFELT $ 22)))
                    (#1# (CONS 1 (CONS |mvar| |up|)))))))))))) 

(DEFUN |SMP;+;3$;27| (|p1| |p2| $)
  (PROG (|up| |mvar|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR |p1| 0)
        (COND
         ((QEQCAR |p2| 0)
          (EXIT (CONS 0 (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 96))))))))
      (EXIT
       (COND
        ((QEQCAR |p1| 0)
         (CONS 1
               (CONS (QCAR (QCDR |p2|))
                     (SPADCALL (SPADCALL |p1| (QREFELT $ 97))
                               (QCDR (QCDR |p2|)) (QREFELT $ 60)))))
        ((QEQCAR |p2| 0)
         (CONS 1
               (CONS (QCAR (QCDR |p1|))
                     (SPADCALL (QCDR (QCDR |p1|))
                               (SPADCALL |p2| (QREFELT $ 97))
                               (QREFELT $ 60)))))
        (#1='T
         (COND
          ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT $ 55))
           (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #2=(|SMP;+;3$;27|))
                (LETT |up|
                      (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                (QREFELT $ 60))
                      . #2#)
                (EXIT
                 (COND
                  ((SPADCALL |up| (QREFELT $ 21))
                   (SPADCALL |up| (QREFELT $ 22)))
                  (#1# (CONS 1 (CONS |mvar| |up|)))))))
          ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT $ 54))
           (CONS 1
                 (CONS (QCAR (QCDR |p2|))
                       (SPADCALL (SPADCALL |p1| (QREFELT $ 97))
                                 (QCDR (QCDR |p2|)) (QREFELT $ 60)))))
          (#1#
           (CONS 1
                 (CONS (QCAR (QCDR |p1|))
                       (SPADCALL (QCDR (QCDR |p1|))
                                 (SPADCALL |p2| (QREFELT $ 97))
                                 (QREFELT $ 60))))))))))))) 

(DEFUN |SMP;-;3$;28| (|p1| |p2| $)
  (PROG (|up| |mvar|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR |p1| 0)
        (COND
         ((QEQCAR |p2| 0)
          (EXIT (CONS 0 (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 98))))))))
      (EXIT
       (COND
        ((QEQCAR |p1| 0)
         (CONS 1
               (CONS (QCAR (QCDR |p2|))
                     (SPADCALL (SPADCALL |p1| (QREFELT $ 97))
                               (QCDR (QCDR |p2|)) (QREFELT $ 99)))))
        ((QEQCAR |p2| 0)
         (CONS 1
               (CONS (QCAR (QCDR |p1|))
                     (SPADCALL (QCDR (QCDR |p1|))
                               (SPADCALL |p2| (QREFELT $ 97))
                               (QREFELT $ 99)))))
        (#1='T
         (COND
          ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT $ 55))
           (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #2=(|SMP;-;3$;28|))
                (LETT |up|
                      (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                (QREFELT $ 99))
                      . #2#)
                (EXIT
                 (COND
                  ((SPADCALL |up| (QREFELT $ 21))
                   (SPADCALL |up| (QREFELT $ 22)))
                  (#1# (CONS 1 (CONS |mvar| |up|)))))))
          ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT $ 54))
           (CONS 1
                 (CONS (QCAR (QCDR |p2|))
                       (SPADCALL (SPADCALL |p1| (QREFELT $ 97))
                                 (QCDR (QCDR |p2|)) (QREFELT $ 99)))))
          (#1#
           (CONS 1
                 (CONS (QCAR (QCDR |p1|))
                       (SPADCALL (QCDR (QCDR |p1|))
                                 (SPADCALL |p2| (QREFELT $ 97))
                                 (QREFELT $ 99))))))))))))) 

(DEFUN |SMP;=;2$B;29| (|p1| |p2| $)
  (COND
   ((QEQCAR |p1| 0)
    (COND ((QEQCAR |p2| 0) (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 18)))
          (#1='T 'NIL)))
   ((QEQCAR |p2| 0) 'NIL)
   (#1#
    (COND
     ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT $ 55))
      (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|)) (QREFELT $ 101)))
     (#1# 'NIL))))) 

(DEFUN |SMP;*;3$;30| (|p1| |p2| $)
  (PROG (|up| |mvar|)
    (RETURN
     (SEQ
      (COND ((QEQCAR |p1| 0) (SPADCALL (QCDR |p1|) |p2| (QREFELT $ 95)))
            ((QEQCAR |p2| 0)
             (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #1=(|SMP;*;3$;30|))
                  (LETT |up| (SPADCALL (QCDR (QCDR |p1|)) |p2| (QREFELT $ 103))
                        . #1#)
                  (EXIT
                   (COND
                    ((SPADCALL |up| (QREFELT $ 21))
                     (SPADCALL |up| (QREFELT $ 22)))
                    (#2='T (CONS 1 (CONS |mvar| |up|)))))))
            (#2#
             (COND
              ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT $ 55))
               (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #1#)
                    (LETT |up|
                          (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                    (QREFELT $ 104))
                          . #1#)
                    (EXIT
                     (COND
                      ((SPADCALL |up| (QREFELT $ 21))
                       (SPADCALL |up| (QREFELT $ 22)))
                      (#2# (CONS 1 (CONS |mvar| |up|)))))))
              ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT $ 68))
               (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #1#)
                    (LETT |up|
                          (SPADCALL (QCDR (QCDR |p1|)) |p2| (QREFELT $ 103))
                          . #1#)
                    (EXIT
                     (COND
                      ((SPADCALL |up| (QREFELT $ 21))
                       (SPADCALL |up| (QREFELT $ 22)))
                      (#2# (CONS 1 (CONS |mvar| |up|)))))))
              (#2#
               (SEQ (LETT |mvar| (QCAR (QCDR |p2|)) . #1#)
                    (LETT |up|
                          (SPADCALL |p1| (QCDR (QCDR |p2|)) (QREFELT $ 59))
                          . #1#)
                    (EXIT
                     (COND
                      ((SPADCALL |up| (QREFELT $ 21))
                       (SPADCALL |up| (QREFELT $ 22)))
                      (#2# (CONS 1 (CONS |mvar| |up|)))))))))))))) 

(DEFUN |SMP;^;$Pi$;31| (|p| |kp| $) (SPADCALL |p| |kp| (QREFELT $ 105))) 

(DEFUN |SMP;^;$Nni$;32| (|p| |k| $)
  (PROG (|up| |mvar|)
    (RETURN
     (SEQ
      (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) |k| (QREFELT $ 108))))
            ((NULL (|SMP;moreThanOneVariable?| |p| $))
             (SPADCALL
              (SPADCALL (|SMP;univariateKnown| |p| $) |k| (QREFELT $ 109))
              (QCAR (QCDR |p|)) (QREFELT $ 52)))
            ('T
             (SEQ (LETT |mvar| (QCAR (QCDR |p|)) . #1=(|SMP;^;$Nni$;32|))
                  (LETT |up| (SPADCALL (QCDR (QCDR |p|)) |k| (QREFELT $ 110))
                        . #1#)
                  (EXIT
                   (COND
                    ((SPADCALL |up| (QREFELT $ 21))
                     (SPADCALL |up| (QREFELT $ 22)))
                    ('T (CONS 1 (CONS |mvar| |up|)))))))))))) 

(DEFUN |SMP;unitNormal;$R;33| (|p| $)
  (PROG (|a| |c| |u| |#G59| |#G58|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR |p| 0)
        (SEQ
         (PROGN
          (LETT |#G58| (SPADCALL (QCDR |p|) (QREFELT $ 112))
                . #1=(|SMP;unitNormal;$R;33|))
          (LETT |u| (QVELT |#G58| 0) . #1#)
          (LETT |c| (QVELT |#G58| 1) . #1#)
          (LETT |a| (QVELT |#G58| 2) . #1#)
          |#G58|)
         (EXIT (VECTOR (CONS 0 |u|) (CONS 0 |c|) (CONS 0 |a|)))))
       ('T
        (SEQ
         (PROGN
          (LETT |#G59| (SPADCALL (SPADCALL |p| (QREFELT $ 38)) (QREFELT $ 112))
                . #1#)
          (LETT |u| (QVELT |#G59| 0) . #1#)
          (LETT |c| (QVELT |#G59| 1) . #1#)
          (LETT |a| (QVELT |#G59| 2) . #1#)
          |#G59|)
         (EXIT
          (VECTOR (CONS 0 |u|) (SPADCALL |a| |p| (QREFELT $ 95))
                  (CONS 0 |a|)))))))))) 

(DEFUN |SMP;unitCanonical;2$;34| (|p| $)
  (PROG (|a| |c| |u| |#G64|)
    (RETURN
     (SEQ
      (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) (QREFELT $ 114))))
            ('T
             (SEQ
              (PROGN
               (LETT |#G64|
                     (SPADCALL (SPADCALL |p| (QREFELT $ 38)) (QREFELT $ 112))
                     . #1=(|SMP;unitCanonical;2$;34|))
               (LETT |u| (QVELT |#G64| 0) . #1#)
               (LETT |c| (QVELT |#G64| 1) . #1#)
               (LETT |a| (QVELT |#G64| 2) . #1#)
               |#G64|)
              (EXIT (SPADCALL |a| |p| (QREFELT $ 95)))))))))) 

(DEFUN |SMP;unit?;$B;35| (|p| $)
  (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT $ 116))) ('T 'NIL))) 

(DEFUN |SMP;associates?;2$B;36| (|p1| |p2| $)
  (COND
   ((QEQCAR |p1| 0)
    (COND ((QEQCAR |p2| 0) (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 118)))
          (#1='T 'NIL)))
   ((QEQCAR |p2| 1)
    (COND
     ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT $ 55))
      (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|)) (QREFELT $ 119)))
     (#1# 'NIL)))
   (#1# 'NIL))) 

(DEFUN |SMP;exquo;2$U;37| (|p1| |p2| $)
  (PROG (|up| |mvar| |a|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR |p1| 0)
        (COND
         ((QEQCAR |p2| 0)
          (EXIT
           (SEQ
            (LETT |a| (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 121))
                  . #1=(|SMP;exquo;2$U;37|))
            (EXIT
             (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                   (#2='T (CONS 0 (CONS 0 (QCDR |a|))))))))))))
      (EXIT
       (COND
        ((OR (SPADCALL |p1| (QREFELT $ 17))
             (SPADCALL |p2| (|spadConstant| $ 14) (QREFELT $ 102)))
         (CONS 0 |p1|))
        ('T
         (SEQ
          (COND ((QEQCAR |p1| 0) (EXIT (CONS 1 #3="failed")))
                ((QEQCAR |p2| 1)
                 (COND
                  ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                             (QREFELT $ 54))
                   (EXIT (CONS 1 #3#))))))
          (COND
           ((OR (QEQCAR |p2| 0)
                (SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                          (QREFELT $ 68)))
            (EXIT
             (SEQ
              (LETT |a|
                    (SPADCALL (QCDR (QCDR |p1|)) (SPADCALL |p2| (QREFELT $ 97))
                              (QREFELT $ 122))
                    . #1#)
              (EXIT
               (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                     (#2#
                      (CONS 0
                            (CONS 1
                                  (CONS (QCAR (QCDR |p1|)) (QCDR |a|)))))))))))
          (EXIT
           (COND
            ((SPADCALL |p1| |p2| (QREFELT $ 102))
             (CONS 0 (|spadConstant| $ 14)))
            (#2#
             (SEQ
              (LETT |a|
                    (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                              (QREFELT $ 122))
                    . #1#)
              (EXIT
               (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                     (#2#
                      (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #1#)
                           (LETT |up| (QCDR |a|) . #1#)
                           (EXIT
                            (COND
                             ((SPADCALL |up| (QREFELT $ 66))
                              (CONS 0 (SPADCALL |up| (QREFELT $ 64))))
                             (#2#
                              (CONS 0
                                    (CONS 1
                                          (CONS |mvar|
                                                |up|)))))))))))))))))))))) 

(DEFUN |SMP;exquo;2$U;38| (|p1| |p2| $)
  (PROG (|up| |mvar| |a|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR |p1| 0)
        (COND
         ((QEQCAR |p2| 0)
          (EXIT
           (SEQ
            (LETT |a| (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 121))
                  . #1=(|SMP;exquo;2$U;38|))
            (EXIT
             (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                   (#2='T (CONS 0 (CONS 0 (QCDR |a|))))))))))))
      (EXIT
       (COND
        ((OR (SPADCALL |p1| (QREFELT $ 17))
             (SPADCALL |p2| (|spadConstant| $ 14) (QREFELT $ 102)))
         (CONS 0 |p1|))
        ('T
         (SEQ
          (COND ((QEQCAR |p1| 0) (EXIT (CONS 1 #3="failed")))
                ((QEQCAR |p2| 1)
                 (COND
                  ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                             (QREFELT $ 54))
                   (EXIT (CONS 1 #3#))))))
          (COND
           ((OR (QEQCAR |p2| 0)
                (SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                          (QREFELT $ 68)))
            (EXIT
             (SEQ
              (LETT |a|
                    (SPADCALL (QCDR (QCDR |p1|)) (SPADCALL |p2| (QREFELT $ 97))
                              (QREFELT $ 122))
                    . #1#)
              (EXIT
               (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                     (#2#
                      (CONS 0
                            (CONS 1
                                  (CONS (QCAR (QCDR |p1|)) (QCDR |a|)))))))))))
          (LETT |a|
                (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                          (QREFELT $ 122))
                . #1#)
          (EXIT
           (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                 (#2#
                  (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #1#)
                       (LETT |up| (QCDR |a|) . #1#)
                       (EXIT
                        (COND
                         ((SPADCALL |up| (QREFELT $ 66))
                          (CONS 0 (SPADCALL |up| (QREFELT $ 64))))
                         (#2#
                          (CONS 0 (CONS 1 (CONS |mvar| |up|)))))))))))))))))) 

(DEFUN |SMP;map;M2$;39| (|fn| |p| $)
  (PROG (|up| |mvar|)
    (RETURN
     (SEQ
      (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) |fn|)))
            (#1='T
             (SEQ (LETT |mvar| (QCAR (QCDR |p|)) . #2=(|SMP;map;M2$;39|))
                  (LETT |up|
                        (SPADCALL (CONS #'|SMP;map;M2$;39!0| (VECTOR $ |fn|))
                                  (QCDR (QCDR |p|)) (QREFELT $ 127))
                        . #2#)
                  (EXIT
                   (COND
                    ((SPADCALL |up| (QREFELT $ 21))
                     (SPADCALL |up| (QREFELT $ 22)))
                    (#1# (CONS 1 (CONS |mvar| |up|)))))))))))) 

(DEFUN |SMP;map;M2$;39!0| (|x1| $$)
  (PROG (|fn| $)
    (LETT |fn| (QREFELT $$ 1) . #1=(|SMP;map;M2$;39|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |fn| |x1| (QREFELT $ 125)))))) 

(DEFUN |SMP;/;$R$;40| (|p| |r| $)
  (SPADCALL (CONS 0 (SPADCALL |r| (QREFELT $ 128))) |p| (QREFELT $ 70))) 

(DEFUN |SMP;content;$R;41| (|p| $)
  (PROG (|up| |c|)
    (RETURN
     (SEQ
      (COND ((QEQCAR |p| 0) (QCDR |p|))
            ('T
             (SEQ
              (LETT |c| (QCDR (|spadConstant| $ 12))
                    . #1=(|SMP;content;$R;41|))
              (LETT |up| (QCDR (QCDR |p|)) . #1#)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND
                       ((OR (SPADCALL |up| (QREFELT $ 130))
                            (SPADCALL |c| (QCDR (|spadConstant| $ 14))
                                      (QREFELT $ 18)))
                        'NIL)
                       ('T 'T)))
                     (GO G191)))
                   (SEQ
                    (LETT |c|
                          (SPADCALL |c|
                                    (SPADCALL (SPADCALL |up| (QREFELT $ 22))
                                              (QREFELT $ 131))
                                    (QREFELT $ 132))
                          . #1#)
                    (EXIT (LETT |up| (SPADCALL |up| (QREFELT $ 20)) . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |c|)))))))) 

(DEFUN |SMP;content;$VarSet$;42| (|p| |mvar| $)
  (COND ((QEQCAR |p| 0) |p|)
        ('T (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 58)) (QREFELT $ 133))))) 

(DEFUN |SMP;gcd;3$;43| (|p1| |p2| $)
  (PROG (|up| |mvar|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR |p1| 0)
        (COND
         ((QEQCAR |p2| 0)
          (CONS 0 (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 132))))
         ((SPADCALL |p1| (QREFELT $ 17)) |p2|)
         (#1='T
          (SPADCALL |p1| (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 133))
                    (QREFELT $ 135)))))
       ((QEQCAR |p2| 0)
        (COND ((SPADCALL |p2| (QREFELT $ 17)) |p1|)
              (#1#
               (SPADCALL |p2| (SPADCALL (QCDR (QCDR |p1|)) (QREFELT $ 133))
                         (QREFELT $ 135)))))
       (#1#
        (COND
         ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT $ 54))
          (SPADCALL |p1| (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 133))
                    (QREFELT $ 135)))
         ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT $ 68))
          (SPADCALL (SPADCALL (QCDR (QCDR |p1|)) (QREFELT $ 133)) |p2|
                    (QREFELT $ 135)))
         (#1#
          (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #2=(|SMP;gcd;3$;43|))
               (LETT |up|
                     (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                               (QREFELT $ 136))
                     . #2#)
               (EXIT
                (COND
                 ((SPADCALL |up| (QREFELT $ 21))
                  (SPADCALL |up| (QREFELT $ 22)))
                 (#1# (CONS 1 (CONS |mvar| |up|)))))))))))))) 

(DEFUN |SMP;gcdPolynomial;3Sup;44| (|a| |b| $)
  (PROG (|mong| #1=#:G419 |monb| |contb| |mona| |conta|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |a| (QREFELT $ 66))
        (COND ((SPADCALL |a| (QREFELT $ 67)) |b|)
              (#2='T
               (SPADCALL
                (SPADCALL (SPADCALL |a| (QREFELT $ 64))
                          (SPADCALL |b| (QREFELT $ 137)) (QREFELT $ 135))
                (QREFELT $ 138)))))
       ((SPADCALL |b| (QREFELT $ 66))
        (COND ((SPADCALL |b| (QREFELT $ 67)) |b|)
              (#2#
               (SPADCALL
                (SPADCALL (SPADCALL |b| (QREFELT $ 64))
                          (SPADCALL |a| (QREFELT $ 137)) (QREFELT $ 135))
                (QREFELT $ 138)))))
       (#2#
        (SEQ
         (LETT |conta| (SPADCALL |a| (QREFELT $ 137))
               . #3=(|SMP;gcdPolynomial;3Sup;44|))
         (LETT |mona|
               (SPADCALL |conta| (SPADCALL |a| (QREFELT $ 139)) (QREFELT $ 27))
               . #3#)
         (COND
          ((SPADCALL |mona| (|spadConstant| $ 29) (QREFELT $ 140))
           (LETT |a|
                 (PROG2 (LETT #1# (SPADCALL |a| |mona| (QREFELT $ 141)) . #3#)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 0)
                                  (|SparseUnivariatePolynomial| $) #1#))
                 . #3#)))
         (LETT |contb| (SPADCALL |b| (QREFELT $ 137)) . #3#)
         (LETT |monb|
               (SPADCALL |contb| (SPADCALL |b| (QREFELT $ 139)) (QREFELT $ 27))
               . #3#)
         (COND
          ((SPADCALL |monb| (|spadConstant| $ 29) (QREFELT $ 140))
           (LETT |b|
                 (PROG2 (LETT #1# (SPADCALL |b| |monb| (QREFELT $ 141)) . #3#)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 0)
                                  (|SparseUnivariatePolynomial| $) #1#))
                 . #3#)))
         (LETT |mong|
               (SPADCALL (SPADCALL |conta| |contb| (QREFELT $ 135))
                         (MIN (SPADCALL |mona| (QREFELT $ 62))
                              (SPADCALL |monb| (QREFELT $ 62)))
                         (QREFELT $ 27))
               . #3#)
         (EXIT
          (COND
           ((>= (SPADCALL |a| (QREFELT $ 62)) (SPADCALL |b| (QREFELT $ 62)))
            (COND
             ((NULL (QEQCAR (SPADCALL |a| |b| (QREFELT $ 141)) 1))
              (SPADCALL |mong| |b| (QREFELT $ 142)))
             (#4='T |mong|)))
           ((NULL (QEQCAR (SPADCALL |b| |a| (QREFELT $ 141)) 1))
            (SPADCALL |mong| |a| (QREFELT $ 142)))
           (#4# |mong|)))))))))) 

(DEFUN |SMP;content;$VarSet$;45| (|p| |mvar| $)
  (COND ((QEQCAR |p| 0) |p|)
        ('T
         (SPADCALL
          (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 58)) (QREFELT $ 24))
          (QREFELT $ 145))))) 

(DEFUN |SMP;gcd;3$;46| (|p1| |p2| $) (SPADCALL |p1| |p2| (QREFELT $ 146))) 

(DEFUN |SMP;gcd;L$;47| (|lp| $) (SPADCALL |lp| (QREFELT $ 145))) 

(DEFUN |SMP;gcdPolynomial;3Sup;48| (|a| |b| $)
  (SPADCALL |a| |b| (QREFELT $ 149))) 

(DEFUN |SMP;content;$VarSet$;49| (|p| |mvar| $)
  (COND ((QEQCAR |p| 0) |p|)
        ('T (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 58)) (QREFELT $ 133))))) 

(DEFUN |SMP;gcd;3$;50| (|p1| |p2| $)
  (PROG (|up| |mvar|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR |p1| 0)
        (COND
         ((QEQCAR |p2| 0)
          (CONS 0 (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 132))))
         ((SPADCALL |p1| (QREFELT $ 17)) |p2|)
         (#1='T
          (SPADCALL |p1| (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 133))
                    (QREFELT $ 135)))))
       ((QEQCAR |p2| 0)
        (COND ((SPADCALL |p2| (QREFELT $ 17)) |p1|)
              (#1#
               (SPADCALL |p2| (SPADCALL (QCDR (QCDR |p1|)) (QREFELT $ 133))
                         (QREFELT $ 135)))))
       (#1#
        (COND
         ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT $ 54))
          (SPADCALL |p1| (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 133))
                    (QREFELT $ 135)))
         ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT $ 68))
          (SPADCALL (SPADCALL (QCDR (QCDR |p1|)) (QREFELT $ 133)) |p2|
                    (QREFELT $ 135)))
         (#1#
          (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #2=(|SMP;gcd;3$;50|))
               (LETT |up|
                     (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                               (QREFELT $ 136))
                     . #2#)
               (EXIT
                (COND
                 ((SPADCALL |up| (QREFELT $ 21))
                  (SPADCALL |up| (QREFELT $ 22)))
                 (#1# (CONS 1 (CONS |mvar| |up|)))))))))))))) 

(DEFUN |SMP;gcdPolynomial;3Sup;51| (|a| |b| $)
  (PROG (|mong| #1=#:G451 |monb| |contb| |mona| |conta|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |a| (QREFELT $ 66))
        (COND ((SPADCALL |a| (QREFELT $ 67)) |b|)
              (#2='T
               (SPADCALL
                (SPADCALL (SPADCALL |a| (QREFELT $ 64))
                          (SPADCALL |b| (QREFELT $ 137)) (QREFELT $ 135))
                (QREFELT $ 138)))))
       ((SPADCALL |b| (QREFELT $ 66))
        (COND ((SPADCALL |b| (QREFELT $ 67)) |b|)
              (#2#
               (SPADCALL
                (SPADCALL (SPADCALL |b| (QREFELT $ 64))
                          (SPADCALL |a| (QREFELT $ 137)) (QREFELT $ 135))
                (QREFELT $ 138)))))
       (#2#
        (SEQ
         (LETT |conta| (SPADCALL |a| (QREFELT $ 137))
               . #3=(|SMP;gcdPolynomial;3Sup;51|))
         (LETT |mona|
               (SPADCALL |conta| (SPADCALL |a| (QREFELT $ 139)) (QREFELT $ 27))
               . #3#)
         (COND
          ((SPADCALL |mona| (|spadConstant| $ 29) (QREFELT $ 140))
           (LETT |a|
                 (PROG2 (LETT #1# (SPADCALL |a| |mona| (QREFELT $ 141)) . #3#)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 0)
                                  (|SparseUnivariatePolynomial| $) #1#))
                 . #3#)))
         (LETT |contb| (SPADCALL |b| (QREFELT $ 137)) . #3#)
         (LETT |monb|
               (SPADCALL |contb| (SPADCALL |b| (QREFELT $ 139)) (QREFELT $ 27))
               . #3#)
         (COND
          ((SPADCALL |monb| (|spadConstant| $ 29) (QREFELT $ 140))
           (LETT |b|
                 (PROG2 (LETT #1# (SPADCALL |b| |monb| (QREFELT $ 141)) . #3#)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 0)
                                  (|SparseUnivariatePolynomial| $) #1#))
                 . #3#)))
         (LETT |mong|
               (SPADCALL (SPADCALL |conta| |contb| (QREFELT $ 135))
                         (MIN (SPADCALL |mona| (QREFELT $ 62))
                              (SPADCALL |monb| (QREFELT $ 62)))
                         (QREFELT $ 27))
               . #3#)
         (EXIT
          (COND
           ((>= (SPADCALL |a| (QREFELT $ 62)) (SPADCALL |b| (QREFELT $ 62)))
            (COND
             ((NULL (QEQCAR (SPADCALL |a| |b| (QREFELT $ 141)) 1))
              (SPADCALL |mong| |b| (QREFELT $ 142)))
             (#4='T |mong|)))
           ((NULL (QEQCAR (SPADCALL |b| |a| (QREFELT $ 141)) 1))
            (SPADCALL |mong| |a| (QREFELT $ 142)))
           (#4# |mong|)))))))))) 

(DEFUN |SMP;content;$VarSet$;52| (|p| |mvar| $)
  (COND ((QEQCAR |p| 0) |p|)
        ('T (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 58)) (QREFELT $ 133))))) 

(DEFUN |SMP;gcd;3$;53| (|p1| |p2| $)
  (PROG (|up| |mvar|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR |p1| 0)
        (COND
         ((QEQCAR |p2| 0)
          (CONS 0 (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 132))))
         ((SPADCALL |p1| (QREFELT $ 17)) |p2|)
         (#1='T
          (SPADCALL |p1| (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 133))
                    (QREFELT $ 135)))))
       ((QEQCAR |p2| 0)
        (COND ((SPADCALL |p2| (QREFELT $ 17)) |p1|)
              (#1#
               (SPADCALL |p2| (SPADCALL (QCDR (QCDR |p1|)) (QREFELT $ 133))
                         (QREFELT $ 135)))))
       (#1#
        (COND
         ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT $ 54))
          (SPADCALL |p1| (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 133))
                    (QREFELT $ 135)))
         ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT $ 68))
          (SPADCALL (SPADCALL (QCDR (QCDR |p1|)) (QREFELT $ 133)) |p2|
                    (QREFELT $ 135)))
         (#1#
          (SEQ (LETT |mvar| (QCAR (QCDR |p1|)) . #2=(|SMP;gcd;3$;53|))
               (LETT |up|
                     (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                               (QREFELT $ 136))
                     . #2#)
               (EXIT
                (COND
                 ((SPADCALL |up| (QREFELT $ 21))
                  (SPADCALL |up| (QREFELT $ 22)))
                 (#1# (CONS 1 (CONS |mvar| |up|)))))))))))))) 

(DEFUN |SMP;gcdPolynomial;3Sup;54| (|a| |b| $)
  (PROG (|mong| #1=#:G479 |monb| |contb| |mona| |conta|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |a| (QREFELT $ 66))
        (COND ((SPADCALL |a| (QREFELT $ 67)) |b|)
              (#2='T
               (SPADCALL
                (SPADCALL (SPADCALL |a| (QREFELT $ 64))
                          (SPADCALL |b| (QREFELT $ 137)) (QREFELT $ 135))
                (QREFELT $ 138)))))
       ((SPADCALL |b| (QREFELT $ 66))
        (COND ((SPADCALL |b| (QREFELT $ 67)) |b|)
              (#2#
               (SPADCALL
                (SPADCALL (SPADCALL |b| (QREFELT $ 64))
                          (SPADCALL |a| (QREFELT $ 137)) (QREFELT $ 135))
                (QREFELT $ 138)))))
       (#2#
        (SEQ
         (LETT |conta| (SPADCALL |a| (QREFELT $ 137))
               . #3=(|SMP;gcdPolynomial;3Sup;54|))
         (LETT |mona|
               (SPADCALL |conta| (SPADCALL |a| (QREFELT $ 139)) (QREFELT $ 27))
               . #3#)
         (COND
          ((SPADCALL |mona| (|spadConstant| $ 29) (QREFELT $ 140))
           (LETT |a|
                 (PROG2 (LETT #1# (SPADCALL |a| |mona| (QREFELT $ 141)) . #3#)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 0)
                                  (|SparseUnivariatePolynomial| $) #1#))
                 . #3#)))
         (LETT |contb| (SPADCALL |b| (QREFELT $ 137)) . #3#)
         (LETT |monb|
               (SPADCALL |contb| (SPADCALL |b| (QREFELT $ 139)) (QREFELT $ 27))
               . #3#)
         (COND
          ((SPADCALL |monb| (|spadConstant| $ 29) (QREFELT $ 140))
           (LETT |b|
                 (PROG2 (LETT #1# (SPADCALL |b| |monb| (QREFELT $ 141)) . #3#)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 0)
                                  (|SparseUnivariatePolynomial| $) #1#))
                 . #3#)))
         (LETT |mong|
               (SPADCALL (SPADCALL |conta| |contb| (QREFELT $ 135))
                         (MIN (SPADCALL |mona| (QREFELT $ 62))
                              (SPADCALL |monb| (QREFELT $ 62)))
                         (QREFELT $ 27))
               . #3#)
         (EXIT
          (COND
           ((>= (SPADCALL |a| (QREFELT $ 62)) (SPADCALL |b| (QREFELT $ 62)))
            (COND
             ((NULL (QEQCAR (SPADCALL |a| |b| (QREFELT $ 141)) 1))
              (SPADCALL |mong| |b| (QREFELT $ 142)))
             (#4='T |mong|)))
           ((NULL (QEQCAR (SPADCALL |b| |a| (QREFELT $ 141)) 1))
            (SPADCALL |mong| |a| (QREFELT $ 142)))
           (#4# |mong|)))))))))) 

(DEFUN |SMP;coerce;$Of;55| (|p| $)
  (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT $ 151)))
        ('T
         (SPADCALL (QCDR (QCDR |p|))
                   (SPADCALL (QCAR (QCDR |p|)) (QREFELT $ 152))
                   (QREFELT $ 153))))) 

(DEFUN |SMP;coefficients;$L;56| (|p| $)
  (PROG (#1=#:G496 #2=#:G495 #3=#:G497 #4=#:G499 |p1|)
    (RETURN
     (SEQ
      (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT $ 156)))
            (#5='T
             (PROGN
              (LETT #1# NIL . #6=(|SMP;coefficients;$L;56|))
              (SEQ (LETT |p1| NIL . #6#)
                   (LETT #4# (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24)) . #6#)
                   G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |p1| (CAR #4#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #3# (SPADCALL |p1| (QREFELT $ 157)) . #6#)
                      (COND (#1# (LETT #2# (APPEND #2# #3#) . #6#))
                            ('T
                             (PROGN
                              (LETT #2# #3# . #6#)
                              (LETT #1# 'T . #6#)))))))
                   (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) (#5# NIL))))))))) 

(DEFUN |SMP;retract;$R;57| (|p| $)
  (COND ((QEQCAR |p| 0) (QCDR |p|))
        ('T (|error| "cannot retract nonconstant polynomial")))) 

(DEFUN |SMP;retractIfCan;$U;58| (|p| $)
  (COND ((QEQCAR |p| 0) (CONS 0 (QCDR |p|))) ('T (CONS 1 "failed")))) 

(DEFUN |SMP;mymerge| (|l| |m| $)
  (SEQ
   (COND ((NULL |l|) |m|) ((NULL |m|) |l|)
         ((SPADCALL (|SPADfirst| |l|) (|SPADfirst| |m|) (QREFELT $ 55))
          (COND
           ((NULL (CDR |l|))
            (SEQ (SPADCALL |l| (CDR |m|) (QREFELT $ 163)) (EXIT |l|)))
           ((NULL (CDR |m|)) |l|)
           (#1='T
            (SEQ
             (SPADCALL |l| (|SMP;mymerge| (CDR |l|) (CDR |m|) $)
                       (QREFELT $ 163))
             (EXIT |l|)))))
         ((SPADCALL (|SPADfirst| |l|) (|SPADfirst| |m|) (QREFELT $ 68))
          (COND
           ((NULL (CDR |l|))
            (SEQ (SPADCALL |l| |m| (QREFELT $ 163)) (EXIT |l|)))
           (#1#
            (SEQ (SPADCALL |l| (|SMP;mymerge| (CDR |l|) |m| $) (QREFELT $ 163))
                 (EXIT |l|)))))
         ((NULL (CDR |m|)) (SEQ (SPADCALL |m| |l| (QREFELT $ 163)) (EXIT |m|)))
         (#1#
          (SEQ (SPADCALL |m| (|SMP;mymerge| |l| (CDR |m|) $) (QREFELT $ 163))
               (EXIT |m|)))))) 

(DEFUN |SMP;variables;$L;60| (|p| $)
  (PROG (|q| |lv|)
    (RETURN
     (SEQ
      (COND ((QEQCAR |p| 0) NIL)
            ('T
             (SEQ (LETT |lv| NIL . #1=(|SMP;variables;$L;60|))
                  (LETT |q| (QCDR (QCDR |p|)) . #1#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND ((SPADCALL |q| (QREFELT $ 130)) 'NIL) ('T 'T)))
                         (GO G191)))
                       (SEQ
                        (LETT |lv|
                              (|SMP;mymerge| |lv|
                               (SPADCALL (SPADCALL |q| (QREFELT $ 22))
                                         (QREFELT $ 164))
                               $)
                              . #1#)
                        (EXIT (LETT |q| (SPADCALL |q| (QREFELT $ 20)) . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS (QCAR (QCDR |p|)) |lv|))))))))) 

(DEFUN |SMP;mainVariable;$U;61| (|p| $)
  (COND ((QEQCAR |p| 0) (CONS 1 "failed")) ('T (CONS 0 (QCAR (QCDR |p|)))))) 

(DEFUN |SMP;eval;$VarSet2$;62| (|p| |mvar| |pval| $)
  (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 58)) |pval| (QREFELT $ 167))) 

(DEFUN |SMP;eval;$VarSetR$;63| (|p| |mvar| |val| $)
  (SPADCALL (SPADCALL |p| |mvar| (QREFELT $ 58)) (CONS 0 |val|)
            (QREFELT $ 167))) 

(DEFUN |SMP;evalSortedVarlist| (|p| |Lvar| |Lpval| $)
  (PROG (|pts| |pval| |mvar|)
    (RETURN
     (SEQ
      (COND
       ((OR (QEQCAR |p| 0)
            (OR (NULL |Lvar|) (SPADCALL |Lpval| (QREFELT $ 170))))
        |p|)
       ('T
        (SEQ (LETT |mvar| (|SPADfirst| |Lvar|) . #1=(|SMP;evalSortedVarlist|))
             (EXIT
              (COND
               ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 68))
                (|SMP;evalSortedVarlist| |p| (CDR |Lvar|)
                 (SPADCALL |Lpval| '|rest| (QREFELT $ 172)) $))
               (#2='T
                (SEQ
                 (LETT |pval| (SPADCALL |Lpval| '|first| (QREFELT $ 174))
                       . #1#)
                 (LETT |pts|
                       (SPADCALL
                        (CONS #'|SMP;evalSortedVarlist!0|
                              (VECTOR $ |Lpval| |Lvar|))
                        (QCDR (QCDR |p|)) (QREFELT $ 127))
                       . #1#)
                 (EXIT
                  (COND
                   ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 55))
                    (COND
                     ((QEQCAR |pval| 0)
                      (SPADCALL |pts| (CONS 0 (QCDR |pval|)) (QREFELT $ 167)))
                     (#2# (SPADCALL |pts| |pval| (QREFELT $ 167)))))
                   (#2#
                    (SPADCALL |pts| (QCAR (QCDR |p|))
                              (QREFELT $ 69)))))))))))))))) 

(DEFUN |SMP;evalSortedVarlist!0| (|x1| $$)
  (PROG (|Lvar| |Lpval| $)
    (LETT |Lvar| (QREFELT $$ 2) . #1=(|SMP;evalSortedVarlist|))
    (LETT |Lpval| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|SMP;evalSortedVarlist| |x1| |Lvar| |Lpval| $))))) 

(DEFUN |SMP;eval;$LL$;65| (|p| |Lvar| |Lpval| $)
  (PROG (|nlpval| #1=#:G556 |mvar| #2=#:G555 |nlvar|)
    (RETURN
     (SEQ
      (COND
       ((OR (NULL (CDR |Lvar|)) (SPADCALL (ELT $ 68) |Lvar| (QREFELT $ 176)))
        (|SMP;evalSortedVarlist| |p| |Lvar| |Lpval| $))
       ('T
        (SEQ
         (LETT |nlvar| (SPADCALL (ELT $ 68) |Lvar| (QREFELT $ 177))
               . #3=(|SMP;eval;$LL$;65|))
         (LETT |nlpval|
               (COND ((SPADCALL |Lvar| |nlvar| (QREFELT $ 178)) |Lpval|)
                     ('T
                      (LETT |nlpval|
                            (PROGN
                             (LETT #2# NIL . #3#)
                             (SEQ (LETT |mvar| NIL . #3#)
                                  (LETT #1# |nlvar| . #3#) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN
                                         (LETT |mvar| (CAR #1#) . #3#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (SPADCALL |Lpval|
                                                     (SPADCALL |mvar| |Lvar|
                                                               (QREFELT $ 179))
                                                     (QREFELT $ 180))
                                           #2#)
                                          . #3#)))
                                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
                            . #3#)))
               . #3#)
         (EXIT (|SMP;evalSortedVarlist| |p| |nlvar| |nlpval| $))))))))) 

(DEFUN |SMP;eval;$LL$;66| (|p| |Lvar| |Lval| $)
  (PROG (#1=#:G560 |val| #2=#:G559)
    (RETURN
     (SEQ
      (SPADCALL |p| |Lvar|
                (PROGN
                 (LETT #2# NIL . #3=(|SMP;eval;$LL$;66|))
                 (SEQ (LETT |val| NIL . #3#) (LETT #1# |Lval| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |val| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (CONS 0 |val|) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 181)))))) 

(DEFUN |SMP;degree;$VarSetNni;67| (|p| |mvar| $)
  (COND ((QEQCAR |p| 0) 0)
        ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 55))
         (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 41)))
        ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 68)) 0)
        ('T
         (MAX
          (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 22)) |mvar|
                    (QREFELT $ 183))
          (SPADCALL (|SMP;red| |p| $) |mvar| (QREFELT $ 183)))))) 

(DEFUN |SMP;degree;$LL;68| (|p| |Lvar| $)
  (PROG (#1=#:G570 |mvar| #2=#:G569)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|SMP;degree;$LL;68|))
       (SEQ (LETT |mvar| NIL . #3#) (LETT #1# |Lvar| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |mvar| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (SPADCALL |p| |mvar| (QREFELT $ 183)) #2#)
                    . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |SMP;degree;$Ie;69| (|p| $)
  (COND ((QEQCAR |p| 0) (|spadConstant| $ 186))
        ('T
         (SPADCALL
          (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 22))
                    (QREFELT $ 187))
          (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 41))
                    (QCAR (QCDR |p|)) (QREFELT $ 188))
          (QREFELT $ 189))))) 

(DEFUN |SMP;minimumDegree;$Ie;70| (|p| $)
  (PROG (|md|)
    (RETURN
     (SEQ
      (COND ((QEQCAR |p| 0) (|spadConstant| $ 186))
            ('T
             (SEQ
              (LETT |md| (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 190))
                    |SMP;minimumDegree;$Ie;70|)
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) |md| (QREFELT $ 77))
                          (QREFELT $ 191))
                (SPADCALL |md| (QCAR (QCDR |p|)) (QREFELT $ 188))
                (QREFELT $ 189)))))))))) 

(DEFUN |SMP;minimumDegree;$VarSetNni;71| (|p| |mvar| $)
  (PROG (|p1| |md|)
    (RETURN
     (SEQ
      (COND ((QEQCAR |p| 0) 0)
            ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 55))
             (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 190)))
            (#1='T
             (SEQ
              (LETT |md|
                    (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 22))
                              |mvar| (QREFELT $ 192))
                    . #2=(|SMP;minimumDegree;$VarSetNni;71|))
              (EXIT
               (COND
                ((SPADCALL (LETT |p1| (|SMP;red| |p| $) . #2#) (QREFELT $ 17))
                 |md|)
                (#1# (MIN |md| (SPADCALL |p1| |mvar| (QREFELT $ 192))))))))))))) 

(DEFUN |SMP;minimumDegree;$LL;72| (|p| |Lvar| $)
  (PROG (#1=#:G589 |mvar| #2=#:G588)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|SMP;minimumDegree;$LL;72|))
       (SEQ (LETT |mvar| NIL . #3#) (LETT #1# |Lvar| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |mvar| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (SPADCALL |p| |mvar| (QREFELT $ 192)) #2#)
                    . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |SMP;differentiate;$VarSet$;73| (|p| |mvar| $)
  (PROG (|up|)
    (RETURN
     (SEQ
      (COND ((QEQCAR |p| 0) (|spadConstant| $ 12))
            ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT $ 55))
             (SEQ
              (LETT |up| (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 194))
                    . #1=(|SMP;differentiate;$VarSet$;73|))
              (EXIT
               (COND
                ((SPADCALL |up| (QREFELT $ 21)) (SPADCALL |up| (QREFELT $ 22)))
                (#2='T (CONS 1 (CONS |mvar| |up|)))))))
            (#2#
             (SEQ
              (LETT |up|
                    (SPADCALL
                     (CONS #'|SMP;differentiate;$VarSet$;73!0|
                           (VECTOR $ |mvar|))
                     (QCDR (QCDR |p|)) (QREFELT $ 127))
                    . #1#)
              (EXIT
               (COND
                ((SPADCALL |up| (QREFELT $ 21)) (SPADCALL |up| (QREFELT $ 22)))
                (#2# (CONS 1 (CONS (QCAR (QCDR |p|)) |up|)))))))))))) 

(DEFUN |SMP;differentiate;$VarSet$;73!0| (|x1| $$)
  (PROG (|mvar| $)
    (LETT |mvar| (QREFELT $$ 1) . #1=(|SMP;differentiate;$VarSet$;73|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| |mvar| (QREFELT $ 195)))))) 

(DEFUN |SMP;leadingCoefficient;$R;74| (|p| $)
  (COND ((QEQCAR |p| 0) (QCDR |p|))
        ('T
         (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 22))
                   (QREFELT $ 38))))) 

(DEFUN |SMP;leadingMonomial;2$;75| (|p| $)
  (COND ((QEQCAR |p| 0) |p|)
        ('T
         (SPADCALL
          (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 22))
                    (QREFELT $ 196))
          (QCAR (QCDR |p|)) (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 41))
          (QREFELT $ 56))))) 

(DEFUN |SMP;reductum;2$;76| (|p| $)
  (COND ((QEQCAR |p| 0) (|spadConstant| $ 12))
        ('T (SPADCALL |p| (SPADCALL |p| (QREFELT $ 196)) (QREFELT $ 100))))) 

(DEFUN |SMP;monomials1| (|p| |vars| |degs| |res| $)
  (PROG (|degs1| |vars1| |mon| |mon1| #1=#:G617 |var| #2=#:G618 |deg| |k1| |p1|
         #3=#:G616 |t| |v1| |tl|)
    (RETURN
     (SEQ (LETT |tl| (QCDR |p|) . #4=(|SMP;monomials1|))
          (LETT |v1| (QCAR |p|) . #4#)
          (SEQ (LETT |t| NIL . #4#) (LETT #3# |tl| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ (LETT |p1| (QCDR |t|) . #4#) (LETT |k1| (QCAR |t|) . #4#)
                    (EXIT
                     (COND
                      ((QEQCAR |p1| 0)
                       (SEQ
                        (LETT |mon|
                              (COND
                               ((SPADCALL |k1| 0 (QREFELT $ 198))
                                (CONS 1 (CONS |v1| (LIST |t|))))
                               ('T |p1|))
                              . #4#)
                        (SEQ (LETT |deg| NIL . #4#) (LETT #2# |degs| . #4#)
                             (LETT |var| NIL . #4#) (LETT #1# |vars| . #4#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |var| (CAR #1#) . #4#) NIL)
                                   (ATOM #2#)
                                   (PROGN (LETT |deg| (CAR #2#) . #4#) NIL))
                               (GO G191)))
                             (SEQ (LETT |mon1| (CONS |deg| |mon|) . #4#)
                                  (EXIT
                                   (LETT |mon|
                                         (CONS 1 (CONS |var| (LIST |mon1|)))
                                         . #4#)))
                             (LETT #1#
                                   (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #4#))
                                   . #4#)
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (LETT |res| (SPADCALL |mon| |res| (QREFELT $ 199))
                               . #4#))))
                      ('T
                       (SEQ
                        (LETT |vars1|
                              (COND
                               ((SPADCALL |k1| 0 (QREFELT $ 198))
                                (CONS |v1| |vars|))
                               ('T |vars|))
                              . #4#)
                        (LETT |degs1|
                              (COND
                               ((SPADCALL |k1| 0 (QREFELT $ 198))
                                (CONS |k1| |degs|))
                               ('T |degs|))
                              . #4#)
                        (EXIT
                         (LETT |res|
                               (|SMP;monomials1| (QCDR |p1|) |vars1| |degs1|
                                |res| $)
                               . #4#)))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |SMP;monomials;$L;78| (|p| $)
  (COND ((SPADCALL |p| (|spadConstant| $ 12) (QREFELT $ 102)) NIL)
        ((QEQCAR |p| 0) (LIST |p|))
        ('T
         (SPADCALL (|SMP;monomials1| (QCDR |p|) NIL NIL NIL $)
                   (QREFELT $ 200))))) 

(DEFUN |SparseMultivariatePolynomial| (&REST #1=#:G647)
  (PROG ()
    (RETURN
     (PROG (#2=#:G648)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|SparseMultivariatePolynomial|)
                                           '|domainEqualList|)
                . #3=(|SparseMultivariatePolynomial|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |SparseMultivariatePolynomial;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|SparseMultivariatePolynomial|))))))))))) 

(DEFUN |SparseMultivariatePolynomial;| (|#1| |#2|)
  (PROG (#1=#:G646 |pv$| #2=#:G644 #3=#:G645 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #4=(|SparseMultivariatePolynomial|))
      (LETT DV$2 (|devaluate| |#2|) . #4#)
      (LETT |dv$| (LIST '|SparseMultivariatePolynomial| DV$1 DV$2) . #4#)
      (LETT $ (GETREFV 232) . #4#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (LETT #3#
                                                (|HasCategory| |#1|
                                                               '(|GcdDomain|))
                                                . #4#)
                                          (OR #3#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #3#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #3#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|PatternMatchable|
                                                            (|Float|)))
                                           (|HasCategory| |#2|
                                                          '(|PatternMatchable|
                                                            (|Float|))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|PatternMatchable|
                                                            (|Integer|)))
                                           (|HasCategory| |#2|
                                                          '(|PatternMatchable|
                                                            (|Integer|))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Float|))))
                                           (|HasCategory| |#2|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Float|)))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Integer|))))
                                           (|HasCategory| |#2|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Integer|)))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|InputForm|)))
                                           (|HasCategory| |#2|
                                                          '(|ConvertibleTo|
                                                            (|InputForm|))))
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|canonicalUnitNormal|))
                                          (|HasCategory| |#1| '(|Comparable|))
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory| |#1|
                                                          '(|RetractableTo|
                                                            (|Fraction|
                                                             (|Integer|)))))
                                          (|HasCategory| |#1| '(|Field|))
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|CommutativeRing|))
                                                . #4#)
                                          (OR #2# #3#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #2#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                          (OR #2# #3#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))))
                      . #4#))
      (|haddProp| |$ConstructorCache| '|SparseMultivariatePolynomial|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (AND (|HasCategory| $ '(|CommutativeRing|))
           (|augmentPredVector| $ 33554432))
      (AND
       (LETT #1#
             (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                  (|HasCategory| $ '(|CharacteristicNonZero|)))
             . #4#)
       (|augmentPredVector| $ 67108864))
      (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
           (|augmentPredVector| $ 134217728))
      (AND
       (OR #3#
           (AND (|HasCategory| |#1| '(|IntegralDomain|))
                (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 268435456))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 (|SparseUnivariatePolynomial| $))
      (QSETREFV $ 9 (|Record| (|:| |v| |#2|) (|:| |ts| (QREFELT $ 8))))
      (QSETREFV $ 10 (|Union| |#1| (QREFELT $ 9)))
      (COND
       ((|testBitVector| |pv$| 2)
        (PROGN
         (QSETREFV $ 113 (CONS (|dispatchFunction| |SMP;unitNormal;$R;33|) $))
         (QSETREFV $ 115
                   (CONS (|dispatchFunction| |SMP;unitCanonical;2$;34|) $))
         (QSETREFV $ 117 (CONS (|dispatchFunction| |SMP;unit?;$B;35|) $))
         (QSETREFV $ 120
                   (CONS (|dispatchFunction| |SMP;associates?;2$B;36|) $))
         (COND
          ((|HasCategory| |#1| '(|Approximate|))
           (QSETREFV $ 123 (CONS (|dispatchFunction| |SMP;exquo;2$U;37|) $)))
          ('T
           (QSETREFV $ 123
                     (CONS (|dispatchFunction| |SMP;exquo;2$U;38|) $)))))))
      (COND
       ((|testBitVector| |pv$| 21)
        (QSETREFV $ 129 (CONS (|dispatchFunction| |SMP;/;$R$;40|) $))))
      (COND
       ((|testBitVector| |pv$| 3)
        (QSETREFV $ 131 (CONS (|dispatchFunction| |SMP;content;$R;41|) $))))
      (COND
       ((|HasCategory| |#1| '(|EuclideanDomain|))
        (COND
         ((|testBitVector| |pv$| 14)
          (COND
           ((|HasCategory| |#1| '(|FloatingPointSystem|))
            (COND
             ((|testBitVector| |pv$| 3)
              (PROGN
               (QSETREFV $ 134
                         (CONS (|dispatchFunction| |SMP;content;$VarSet$;42|)
                               $))
               (QSETREFV $ 135 (CONS (|dispatchFunction| |SMP;gcd;3$;43|) $))
               (COND
                ((|HasCategory| |#1| '(|FloatingPointSystem|))
                 (QSETREFV $ 143
                           (CONS
                            (|dispatchFunction| |SMP;gcdPolynomial;3Sup;44|)
                            $))))))))
           ('T
            (PROGN
             (QSETREFV $ 134
                       (CONS (|dispatchFunction| |SMP;content;$VarSet$;45|) $))
             (QSETREFV $ 135 (CONS (|dispatchFunction| |SMP;gcd;3$;46|) $))
             (QSETREFV $ 148 (CONS (|dispatchFunction| |SMP;gcd;L$;47|) $))
             (QSETREFV $ 143
                       (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;48|)
                             $))))))
         ((|testBitVector| |pv$| 3)
          (PROGN
           (QSETREFV $ 134
                     (CONS (|dispatchFunction| |SMP;content;$VarSet$;49|) $))
           (QSETREFV $ 135 (CONS (|dispatchFunction| |SMP;gcd;3$;50|) $))
           (COND
            ((|HasCategory| |#1| '(|FloatingPointSystem|))
             (QSETREFV $ 143
                       (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;51|)
                             $))))))))
       ((|testBitVector| |pv$| 3)
        (PROGN
         (QSETREFV $ 134
                   (CONS (|dispatchFunction| |SMP;content;$VarSet$;52|) $))
         (QSETREFV $ 135 (CONS (|dispatchFunction| |SMP;gcd;3$;53|) $))
         (COND
          ((|HasCategory| |#1| '(|FloatingPointSystem|))
           (QSETREFV $ 143
                     (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;54|)
                           $)))))))
      (COND
       ((|testBitVector| |pv$| 22)
        (QSETREFV $ 195
                  (CONS (|dispatchFunction| |SMP;differentiate;$VarSet$;73|)
                        $))))
      $)))) 

(MAKEPROP '|SparseMultivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'D '|VPoly|
              '|Rep| (0 . |Zero|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SMP;Zero;$;1|) $))
              (4 . |One|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SMP;One;$;2|) $))
              (|Boolean|) (8 . |zero?|) |SMP;zero?;$B;3| (13 . =)
              |SMP;one?;$B;4| (19 . |reductum|) (24 . |ground?|)
              (29 . |leadingCoefficient|) (|List| $$) (34 . |coefficients|)
              (|NonNegativeInteger|) |SMP;numberOfMonomials;$Nni;6|
              (39 . |monomial|) |SMP;coerce;VarSet$;7| (45 . |One|)
              (49 . |numberOfMonomials|) (54 . ~=) |SMP;monomial?;$B;8|
              |SMP;ground?;$B;16| (60 . |false|) (64 . |true|)
              (|Mapping| 15 $$) (68 . |any?|) |SMP;leadingCoefficient;$R;74|
              (|SparseUnivariatePolynomial| 6) (74 . |coerce|) (79 . |degree|)
              (84 . |monomial|) (90 . +) (|Mapping| 6 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 8 6 39) (96 . |map|)
              |SMP;univariate;$Sup;11| (102 . |ground?|)
              (107 . |leadingCoefficient|) (112 . |degree|) (117 . |reductum|)
              |SMP;multivariate;SupVarSet$;12| |SMP;+;3$;27| (122 . <)
              (128 . =) |SMP;monomial;$VarSetNni$;17|
              (|SparseUnivariatePolynomial| $) |SMP;univariate;$VarSetSup;13|
              (134 . *) (140 . +) (|SparseUnivariatePolynomial| $$)
              (146 . |degree|) (151 . |coefficient|)
              (157 . |leadingCoefficient|) (162 . |reductum|) (167 . |ground?|)
              (172 . |zero?|) (177 . >) |SMP;multivariate;SupVarSet$;15|
              |SMP;*;3$;30| (|IndexedExponents| 7) (183 . |zero?|)
              (188 . |leadingSupport|) (193 . |leadingCoefficient|)
              (198 . |reductum|) |SMP;monomial;RIe$;18| (203 . |coefficient|)
              |SMP;coefficient;$IeR;19| (|Integer|) (209 . |coerce|)
              |SMP;coerce;I$;20| |SMP;coerce;R$;21| (214 . |characteristic|)
              |SMP;characteristic;Nni;22| (|Union| $ '"failed") (218 . |recip|)
              |SMP;recip;$U;23| (223 . -) (228 . -) |SMP;-;2$;24| (233 . *)
              (239 . *) |SMP;*;I2$;25| (245 . *) |SMP;*;R2$;26| (251 . +)
              (257 . |coerce|) (262 . -) (268 . -) |SMP;-;3$;28| (274 . =)
              |SMP;=;2$B;29| (280 . *) (286 . *) |SMP;^;$Nni$;32|
              (|PositiveInteger|) |SMP;^;$Pi$;31| (292 . ^) (298 . ^) (304 . ^)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (310 . |unitNormal|) (315 . |unitNormal|) (320 . |unitCanonical|)
              (325 . |unitCanonical|) (330 . |unit?|) (335 . |unit?|)
              (340 . |associates?|) (346 . |associates?|) (352 . |associates?|)
              (358 . |exquo|) (364 . |exquo|) (370 . |exquo|) (|Mapping| 6 6)
              |SMP;map;M2$;39| (|Mapping| $$ $$) (376 . |map|) (382 . |inv|)
              (387 . /) (393 . |zero?|) (398 . |content|) (403 . |gcd|)
              (409 . |content|) (414 . |content|) (420 . |gcd|) (426 . |gcd|)
              (432 . |content|) (437 . |coerce|) (442 . |minimumDegree|)
              (447 . ~=) (453 . |exquo|) (459 . *) (465 . |gcdPolynomial|)
              (|PolynomialGcdPackage| 71 7 6 $$) (471 . |gcd|) (476 . |gcd|)
              (|List| $) (482 . |gcd|) (487 . |gcd|) (|OutputForm|)
              (493 . |coerce|) (498 . |coerce|) (503 . |outputForm|)
              |SMP;coerce;$Of;55| (|List| 6) (509 . |list|)
              |SMP;coefficients;$L;56| (514 . |nil|) |SMP;retract;$R;57|
              (|Union| 6 '"failed") |SMP;retractIfCan;$U;58| (|List| 7)
              (518 . |setrest!|) |SMP;variables;$L;60| (|Union| 7 '"failed")
              |SMP;mainVariable;$U;61| (524 . |elt|) |SMP;eval;$VarSet2$;62|
              |SMP;eval;$VarSetR$;63| (530 . |empty?|) '"rest" (535 . |elt|)
              '"first" (541 . |elt|) (|Mapping| 15 7 7) (547 . |sorted?|)
              (553 . |sort|) (559 . =) (565 . |position|) (571 . |elt|)
              |SMP;eval;$LL$;65| |SMP;eval;$LL$;66| |SMP;degree;$VarSetNni;67|
              (|List| 25) |SMP;degree;$LL;68| (577 . |Zero|)
              |SMP;degree;$Ie;69| (581 . |monomial|) (587 . +)
              (593 . |minimumDegree|) |SMP;minimumDegree;$Ie;70|
              |SMP;minimumDegree;$VarSetNni;71| |SMP;minimumDegree;$LL;72|
              (598 . |differentiate|) (603 . |differentiate|)
              |SMP;leadingMonomial;2$;75| |SMP;reductum;2$;76| (609 . >)
              (615 . |cons|) (621 . |reverse!|) |SMP;monomials;$L;78|
              (|Union| 214 '#1="failed") (|Matrix| $) (|InputForm|)
              (|Pattern| (|Float|)) (|Pattern| 79)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 79 $)
              (|Fraction| 79)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Factored| $) (|Matrix| 79)
              (|Record| (|:| |mat| 212) (|:| |vec| (|Vector| 79))) (|Vector| $)
              (|Factored| 57) (|Union| 217 '#1#) (|List| 57)
              (|Union| 209 '#2="failed") (|Union| 79 '#2#)
              (|Union| 147 '#3="failed")
              (|Record| (|:| |var| 7) (|:| |exponent| 25)) (|Union| 221 '#3#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (|List| 225)
              (|Equation| $) (|Mapping| 71 71)
              (|Record| (|:| |mat| 228) (|:| |vec| (|Vector| 6))) (|Matrix| 6)
              (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 626 |zero?| 632 |variables| 637 |univariate| 642 |unitNormal|
              653 |unitCanonical| 658 |unit?| 663 |totalDegreeSorted| 668
              |totalDegree| 674 |subtractIfCan| 685 |squareFreePolynomial| 691
              |squareFreePart| 696 |squareFree| 701
              |solveLinearPolynomialEquation| 706 |smaller?| 712 |sample| 718
              |retractIfCan| 722 |retract| 742 |resultant| 762 |reductum| 769
              |reducedSystem| 774 |recip| 796 |primitivePart| 801
              |primitiveMonomials| 812 |prime?| 817 |pomopo!| 822
              |patternMatch| 830 |one?| 844 |numberOfMonomials| 849
              |multivariate| 854 |monomials| 866 |monomial?| 871 |monomial| 876
              |monicDivide| 896 |minimumDegree| 903 |mapExponents| 920 |map|
              926 |mainVariable| 932 |leadingMonomial| 937 |leadingCoefficient|
              942 |lcmCoef| 947 |lcm| 953 |latex| 964 |isTimes| 969 |isPlus|
              974 |isExpt| 979 |hashUpdate!| 984 |hash| 990 |ground?| 995
              |ground| 1000 |gcdPolynomial| 1005 |gcd| 1011
              |factorSquareFreePolynomial| 1022 |factorPolynomial| 1027
              |factor| 1032 |exquo| 1037 |eval| 1049 |discriminant| 1103
              |differentiate| 1109 |degree| 1135 |convert| 1152 |content| 1167
              |conditionP| 1178 |coerce| 1183 |coefficients| 1213 |coefficient|
              1218 |charthRoot| 1238 |characteristic| 1243 |binomThmExpt| 1247
              |associates?| 1254 ^ 1260 |Zero| 1272 |One| 1276 D 1280 = 1306 /
              1312 - 1318 + 1329 * 1335)
           'NIL
           (CONS
            (|makeByteWordVec2| 25
                                '(0 0 1 0 1 0 5 4 0 6 3 12 23 0 0 23 6 12 13 14
                                  23 6 19 0 0 12 25 0 0 0 0 24 12 12 0 0 0 0 0
                                  0 0 0 7 8 18 0 0 0 0 0 0 0 0 0 0 0 0 25 2 9
                                  10 11 15 16 17))
            (CONS
             '#(|PolynomialCategory&| |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |FiniteAbelianMonoidRing&|
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |FullyLinearlyExplicitRingOver&| |Algebra&| NIL |Algebra&|
                |Algebra&| |PartialDifferentialRing&| NIL NIL |Module&|
                |Module&| NIL NIL |Module&| |EntireRing&| NIL |Ring&| NIL NIL
                NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL
                |AbelianMonoid&| |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&|
                NIL NIL NIL |Evalable&| |FullyRetractableTo&| |SetCategory&|
                NIL |RetractableTo&| |InnerEvalable&| |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| NIL |BasicType&| NIL NIL NIL
                NIL NIL NIL |RetractableTo&| |RetractableTo&| NIL)
             (CONS
              '#((|PolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|PolynomialFactorizationExplicit|)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 7)) (|GcdDomain|)
                 (|IntegralDomain|) (|FullyLinearlyExplicitRingOver| 6)
                 (|Algebra| $$) (|LeftOreRing|) (|Algebra| 209) (|Algebra| 6)
                 (|PartialDifferentialRing| 7) (|LinearlyExplicitRingOver| 6)
                 (|CommutativeRing|) (|Module| $$) (|Module| 209)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|EntireRing|) (|LinearlyExplicitRingOver| 79) (|Ring|)
                 (|BiModule| 6 6) (|BiModule| 209 209) (|BiModule| $$ $$)
                 (|Rng|) (|LeftModule| 6) (|RightModule| 6) (|LeftModule| $$)
                 (|RightModule| $$) (|LeftModule| 209) (|RightModule| 209)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 79) (|Comparable|) (|Evalable| $$)
                 (|FullyRetractableTo| 6) (|SetCategory|)
                 (|VariablesCommuteWithCoefficients|) (|RetractableTo| 7)
                 (|InnerEvalable| 7 $$) (|InnerEvalable| 7 6)
                 (|InnerEvalable| $$ $$) (|RetractableTo| 6) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 150) (|CommutativeStar|)
                 (|noZeroDivisors|) (|ConvertibleTo| 205) (|ConvertibleTo| 206)
                 (|ConvertibleTo| 204) (|RetractableTo| 209)
                 (|RetractableTo| 79) (|canonicalUnitNormal|))
              (|makeByteWordVec2| 231
                                  '(0 6 0 11 0 6 0 13 1 6 15 0 16 2 6 15 0 0 18
                                    1 8 0 0 20 1 8 15 0 21 1 8 2 0 22 1 8 23 0
                                    24 2 8 0 2 25 27 0 8 0 29 1 8 25 0 30 2 25
                                    15 0 0 31 0 15 0 34 0 15 0 35 2 23 15 36 0
                                    37 1 39 0 6 40 1 8 25 0 41 2 39 0 6 25 42 2
                                    39 0 0 0 43 2 45 39 44 8 46 1 39 15 0 48 1
                                    39 6 0 49 1 39 25 0 50 1 39 0 0 51 2 7 15 0
                                    0 54 2 7 15 0 0 55 2 8 0 2 0 59 2 8 0 0 0
                                    60 1 61 25 0 62 2 61 2 0 25 63 1 61 2 0 64
                                    1 61 0 0 65 1 61 15 0 66 1 61 15 0 67 2 7
                                    15 0 0 68 1 71 15 0 72 1 71 7 0 73 1 71 25
                                    0 74 1 71 0 0 75 2 8 2 0 25 77 1 6 0 79 80
                                    0 6 25 83 1 6 85 0 86 1 6 0 0 88 1 8 0 0 89
                                    2 6 0 79 0 91 2 8 0 79 0 92 2 6 0 0 0 94 2
                                    6 0 0 0 96 1 8 0 2 97 2 6 0 0 0 98 2 8 0 0
                                    0 99 2 8 15 0 0 101 2 8 0 0 2 103 2 8 0 0 0
                                    104 2 6 0 0 25 108 2 39 0 0 25 109 2 8 0 0
                                    25 110 1 6 111 0 112 1 0 111 0 113 1 6 0 0
                                    114 1 0 0 0 115 1 6 15 0 116 1 0 15 0 117 2
                                    6 15 0 0 118 2 8 15 0 0 119 2 0 15 0 0 120
                                    2 6 85 0 0 121 2 8 85 0 0 122 2 0 85 0 0
                                    123 2 8 0 126 0 127 1 6 0 0 128 2 0 0 0 6
                                    129 1 8 15 0 130 1 0 6 0 131 2 6 0 0 0 132
                                    1 8 2 0 133 2 0 0 0 7 134 2 0 0 0 0 135 2 8
                                    0 0 0 136 1 61 2 0 137 1 61 0 2 138 1 61 25
                                    0 139 2 61 15 0 0 140 2 61 85 0 0 141 2 61
                                    0 0 0 142 2 0 57 57 57 143 1 144 2 23 145 2
                                    144 2 2 2 146 1 0 0 147 148 2 144 61 61 61
                                    149 1 6 150 0 151 1 7 150 0 152 2 8 150 0
                                    150 153 1 155 0 6 156 0 23 0 158 2 162 0 0
                                    0 163 2 8 2 0 2 167 1 23 15 0 170 2 23 0 0
                                    171 172 2 23 2 0 173 174 2 162 15 175 0 176
                                    2 162 0 175 0 177 2 162 15 0 0 178 2 162 79
                                    7 0 179 2 23 2 0 79 180 0 71 0 186 2 71 0
                                    25 7 188 2 71 0 0 0 189 1 8 25 0 190 1 8 0
                                    0 194 2 0 0 0 7 195 2 25 15 0 0 198 2 23 0
                                    2 0 199 1 23 0 0 200 2 0 15 0 0 1 1 0 15 0
                                    17 1 0 162 0 164 2 0 57 0 7 58 1 0 39 0 47
                                    1 2 111 0 113 1 2 0 0 115 1 2 15 0 117 2 0
                                    25 0 162 1 1 0 25 0 1 2 0 25 0 162 1 2 0 85
                                    0 0 1 1 1 215 57 1 1 3 0 0 1 1 3 211 0 1 2
                                    1 216 217 57 1 2 18 15 0 0 1 0 0 0 1 1 15
                                    218 0 1 1 16 219 0 1 1 0 165 0 1 1 0 160 0
                                    161 1 15 209 0 1 1 16 79 0 1 1 0 7 0 1 1 0
                                    6 0 159 3 22 0 0 0 7 1 1 0 0 0 197 1 19 212
                                    203 1 2 19 213 203 214 1 2 0 227 203 214 1
                                    1 0 228 203 1 1 0 85 0 87 2 3 0 0 7 1 1 3 0
                                    0 1 1 0 147 0 1 1 1 15 0 1 4 0 0 0 6 71 0 1
                                    3 7 207 0 205 207 1 3 8 208 0 206 208 1 1 0
                                    15 0 19 1 0 25 0 26 2 0 0 57 7 69 2 0 0 39
                                    7 52 1 0 147 0 201 1 0 15 0 32 2 0 0 6 71
                                    76 3 0 0 0 7 25 56 3 0 0 0 162 184 1 3 0
                                    223 0 0 7 1 2 0 25 0 7 192 2 0 184 0 162
                                    193 1 0 71 0 191 2 0 0 226 0 1 2 0 0 124 0
                                    125 1 0 165 0 166 1 0 0 0 196 1 0 6 0 38 2
                                    3 210 0 0 1 1 3 0 147 1 2 3 0 0 0 1 1 0 229
                                    0 1 1 0 220 0 1 1 0 220 0 1 1 0 222 0 1 2 0
                                    231 231 0 1 1 0 230 0 1 1 0 15 0 33 1 0 6 0
                                    1 2 3 57 57 57 143 1 3 0 147 148 2 3 0 0 0
                                    135 1 1 215 57 1 1 1 215 57 1 1 1 211 0 1 2
                                    2 85 0 0 123 2 2 85 0 6 1 3 0 0 0 162 147
                                    181 3 0 0 0 162 155 182 3 0 0 0 7 0 168 3 0
                                    0 0 7 6 169 3 0 0 0 0 0 1 3 0 0 0 147 147 1
                                    2 0 0 0 224 1 2 0 0 0 225 1 2 22 0 0 7 1 3
                                    0 0 0 7 25 1 3 0 0 0 162 184 1 2 0 0 0 7
                                    195 2 0 0 0 162 1 1 0 71 0 187 2 0 25 0 7
                                    183 2 0 184 0 162 185 1 11 204 0 1 1 9 205
                                    0 1 1 10 206 0 1 2 3 0 0 7 134 1 3 6 0 131
                                    1 27 202 203 1 1 29 0 0 1 1 20 0 209 1 1 0
                                    0 7 28 1 0 0 6 82 1 0 0 79 81 1 0 150 0 154
                                    1 0 155 0 157 2 0 6 0 71 78 3 0 0 0 7 25 1
                                    3 0 0 0 162 184 1 1 28 85 0 1 0 0 25 84 3
                                    26 0 0 0 25 1 2 2 15 0 0 120 2 0 0 0 25 105
                                    2 0 0 0 106 107 0 0 0 12 0 0 0 14 3 0 0 0 7
                                    25 1 3 0 0 0 162 184 1 2 0 0 0 7 1 2 0 0 0
                                    162 1 2 0 15 0 0 102 2 21 0 0 6 129 1 0 0 0
                                    90 2 0 0 0 0 100 2 0 0 0 0 53 2 12 0 209 0
                                    1 2 12 0 0 209 1 2 0 0 6 0 95 2 0 0 0 6 1 2
                                    0 0 79 0 93 2 0 0 0 0 70 2 0 0 25 0 1 2 0 0
                                    106 0 1)))))
           '|lookupComplete|)) 
