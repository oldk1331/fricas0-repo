
(/VERSIONCHECK 2) 

(DEFUN |NSMP;PSimp| (|up| |mv| $)
  (COND ((EQL (SPADCALL |up| (QREFELT $ 12)) 0) (SPADCALL |up| (QREFELT $ 14)))
        ('T (CONS 1 (CONS |mv| |up|))))) 

(PUT '|NSMP;coerce;$Smp;2| '|SPADreplace| '(XLAM (|p|) |p|)) 

(DEFUN |NSMP;coerce;$Smp;2| (|p| $) |p|) 

(PUT '|NSMP;coerce;Smp$;3| '|SPADreplace| '(XLAM (|p|) |p|)) 

(DEFUN |NSMP;coerce;Smp$;3| (|p| $) |p|) 

(PUT '|NSMP;retractIfCan;$U;4| '|SPADreplace| '(XLAM (|p|) (CONS 0 |p|))) 

(DEFUN |NSMP;retractIfCan;$U;4| (|p| $) (CONS 0 |p|)) 

(DEFUN |NSMP;mvar;$VarSet;5| (|p| $)
  (COND
   ((QEQCAR |p| 0) (|error| " Error in mvar from NSMP : #1 has no variables."))
   ('T (QCAR (QCDR |p|))))) 

(DEFUN |NSMP;mdeg;$Nni;6| (|p| $)
  (COND ((QEQCAR |p| 0) 0) ('T (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 12))))) 

(DEFUN |NSMP;init;2$;7| (|p| $)
  (COND
   ((QEQCAR |p| 0) (|error| " Error in init from NSMP : #1 has no variables."))
   ('T (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 14))))) 

(DEFUN |NSMP;head;2$;8| (|p| $)
  (COND ((QEQCAR |p| 0) |p|)
        ('T
         (CONS 1
               (CONS (QCAR (QCDR |p|))
                     (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 22))))))) 

(DEFUN |NSMP;tail;2$;9| (|p| $)
  (PROG (|red|)
    (RETURN
     (SEQ
      (COND ((QEQCAR |p| 0) (|spadConstant| $ 13))
            (#1='T
             (SEQ
              (LETT |red| (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24))
                    |NSMP;tail;2$;9|)
              (EXIT
               (COND
                ((SPADCALL |red| (QREFELT $ 26))
                 (SPADCALL |red| (QREFELT $ 27)))
                (#1# (CONS 1 (CONS (QCAR (QCDR |p|)) |red|)))))))))))) 

(DEFUN |NSMP;iteratedInitials;$L;10| (|p| $)
  (SEQ
   (COND ((QEQCAR |p| 0) NIL)
         ('T
          (SEQ
           (LETT |p| (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 14))
                 |NSMP;iteratedInitials;$L;10|)
           (EXIT
            (SPADCALL |p| (SPADCALL |p| (QREFELT $ 30)) (QREFELT $ 32)))))))) 

(DEFUN |NSMP;localDeepestInitial| (|p| $)
  (COND ((QEQCAR |p| 0) |p|)
        ('T
         (|NSMP;localDeepestInitial|
          (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 14)) $)))) 

(DEFUN |NSMP;deepestInitial;2$;12| (|p| $)
  (COND
   ((QEQCAR |p| 0)
    (|error| "Error in deepestInitial from NSMP : #1 has no variables."))
   ('T
    (|NSMP;localDeepestInitial| (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 14))
     $)))) 

(DEFUN |NSMP;mainMonomial;2$;13| (|p| $)
  (COND
   ((SPADCALL |p| (QREFELT $ 34))
    (|error| "Error in mainMonomial from NSMP : the argument is zero"))
   ((QEQCAR |p| 0) (|spadConstant| $ 35))
   ('T
    (SPADCALL (|spadConstant| $ 35) (QCAR (QCDR |p|))
              (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 12)) (QREFELT $ 36))))) 

(DEFUN |NSMP;leastMonomial;2$;14| (|p| $)
  (COND
   ((SPADCALL |p| (QREFELT $ 34))
    (|error| "Error in leastMonomial from NSMP : the argument is zero"))
   ((QEQCAR |p| 0) (|spadConstant| $ 35))
   ('T
    (SPADCALL (|spadConstant| $ 35) (QCAR (QCDR |p|))
              (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 38)) (QREFELT $ 36))))) 

(DEFUN |NSMP;mainCoefficients;$L;15| (|p| $)
  (COND
   ((SPADCALL |p| (QREFELT $ 34))
    (|error| "Error in mainCoefficients from NSMP : the argument is zero"))
   ((QEQCAR |p| 0) (LIST |p|))
   ('T (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 40))))) 

(DEFUN |NSMP;leadingCoefficient;$VarSet$;16| (|p| |x| $)
  (PROG (|d|)
    (RETURN
     (COND ((QEQCAR |p| 0) |p|)
           ((SPADCALL (QCAR (QCDR |p|)) |x| (QREFELT $ 42))
            (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 14)))
           ((ZEROP
             (LETT |d| (SPADCALL |p| |x| (QREFELT $ 43))
                   |NSMP;leadingCoefficient;$VarSet$;16|))
            |p|)
           ('T (SPADCALL |p| |x| |d| (QREFELT $ 44))))))) 

(DEFUN |NSMP;localMonicModulo| (|a| |b| $)
  (PROG (|mM| |m|)
    (RETURN
     (SEQ
      (COND
       ((OR (QEQCAR |a| 0)
            (SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT $ 46)))
        |a|)
       ('T
        (SEQ
         (COND
          ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT $ 47))
           (LETT |m|
                 (SPADCALL (CONS #'|NSMP;localMonicModulo!0| (VECTOR $ |b|))
                           (QCDR (QCDR |a|)) (QREFELT $ 51))
                 . #1=(|NSMP;localMonicModulo|)))
          (#2='T
           (LETT |m|
                 (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|)) (QREFELT $ 52))
                 . #1#)))
         (COND
          ((SPADCALL |m| (QREFELT $ 26))
           (LETT |mM| (SPADCALL |m| (QREFELT $ 27)) . #1#))
          (#2# (LETT |mM| (CONS 1 (CONS (QCAR (QCDR |a|)) |m|)) . #1#)))
         (EXIT |mM|)))))))) 

(DEFUN |NSMP;localMonicModulo!0| (|a1| $$)
  (PROG (|b| $)
    (LETT |b| (QREFELT $$ 1) . #1=(|NSMP;localMonicModulo|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|NSMP;localMonicModulo| |a1| |b| $))))) 

(DEFUN |NSMP;monicModulo;3$;18| (|a| |b| $)
  (PROG (|mM| |rec| |r| |ib|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR |b| 0)
        (|error| "Error in monicModulo from NSMP : #2 is constant"))
       (#1='T
        (SEQ
         (LETT |ib| (SPADCALL |b| (QREFELT $ 21))
               . #2=(|NSMP;monicModulo;3$;18|))
         (COND
          ((NULL (SPADCALL |ib| (QREFELT $ 53)))
           (EXIT
            (|error| "Error in monicModulo from NSMP : #2 is not monic"))))
         (COND
          ((SPADCALL |ib| (|spadConstant| $ 35) (QREFELT $ 55))
           (LETT |mM| (|NSMP;localMonicModulo| |a| |b| $) . #2#))
          (#1#
           (SEQ (LETT |r| (SPADCALL |ib| (QREFELT $ 56)) . #2#)
                (LETT |rec| (SPADCALL |r| (QREFELT $ 58)) . #2#)
                (EXIT
                 (COND
                  ((QEQCAR |rec| 1)
                   (|error|
                    "Error in monicModulo from NSMP : #2 is not monic"))
                  ((QEQCAR |a| 0) |a|)
                  (#1#
                   (SEQ
                    (LETT |a| (SPADCALL (QCDR |rec|) |a| (QREFELT $ 59)) . #2#)
                    (LETT |b| (SPADCALL (QCDR |rec|) |b| (QREFELT $ 59)) . #2#)
                    (EXIT
                     (LETT |mM|
                           (SPADCALL |ib| (|NSMP;localMonicModulo| |a| |b| $)
                                     (QREFELT $ 60))
                           . #2#)))))))))
         (EXIT |mM|)))))))) 

(DEFUN |NSMP;prem;3$;19| (|a| |b| $)
  (PROG (#1=#:G284 |test| |delta| |term| #2=#:G271 #3=#:G287 |r| #4=#:G252
         |lcb| |db|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((QEQCAR |b| 0) (|error| "in prem$NSMP: ground? #2"))
             (#5='T
              (SEQ
               (LETT |db| (SPADCALL (QCDR (QCDR |b|)) (QREFELT $ 12))
                     . #6=(|NSMP;prem;3$;19|))
               (LETT |lcb| (SPADCALL (QCDR (QCDR |b|)) (QREFELT $ 14)) . #6#)
               (LETT |test|
                     (- (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT $ 43)) |db|)
                     . #6#)
               (LETT |delta| (MAX (+ |test| 1) 0) . #6#)
               (COND
                ((OR (QEQCAR |a| 0)
                     (SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|))
                               (QREFELT $ 46)))
                 (EXIT
                  (SPADCALL
                   (SPADCALL |lcb|
                             (PROG1 (LETT #4# |delta| . #6#)
                               (|check_subtype| (>= #4# 0)
                                                '(|NonNegativeInteger|) #4#))
                             (QREFELT $ 62))
                   |a| (QREFELT $ 60)))))
               (EXIT
                (COND
                 ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT $ 42))
                  (SEQ
                   (LETT |r|
                         (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|))
                                   (QREFELT $ 63))
                         . #6#)
                   (EXIT
                    (COND
                     ((SPADCALL |r| (QREFELT $ 26))
                      (PROGN
                       (LETT #3# (SPADCALL |r| (QREFELT $ 27)) . #6#)
                       (GO #3#)))
                     (#5# (CONS 1 (CONS (QCAR (QCDR |a|)) |r|)))))))
                 (#5#
                  (SEQ
                   (SEQ G190
                        (COND
                         ((NULL
                           (COND
                            ((OR (SPADCALL |a| (QREFELT $ 34)) (MINUSP |test|))
                             'NIL)
                            ('T 'T)))
                          (GO G191)))
                        (SEQ
                         (LETT |term|
                               (SPADCALL
                                (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT $ 45))
                                (QCAR (QCDR |b|))
                                (PROG1 (LETT #2# |test| . #6#)
                                  (|check_subtype| (>= #2# 0)
                                                   '(|NonNegativeInteger|)
                                                   #2#))
                                (QREFELT $ 36))
                               . #6#)
                         (LETT |a|
                               (SPADCALL (SPADCALL |lcb| |a| (QREFELT $ 60))
                                         (SPADCALL |term| |b| (QREFELT $ 60))
                                         (QREFELT $ 64))
                               . #6#)
                         (LETT |delta| (- |delta| 1) . #6#)
                         (EXIT
                          (LETT |test|
                                (-
                                 (SPADCALL |a| (QCAR (QCDR |b|))
                                           (QREFELT $ 43))
                                 |db|)
                                . #6#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT
                    (SPADCALL
                     (SPADCALL |lcb|
                               (PROG1 (LETT #1# |delta| . #6#)
                                 (|check_subtype| (>= #1# 0)
                                                  '(|NonNegativeInteger|) #1#))
                               (QREFELT $ 62))
                     |a| (QREFELT $ 60)))))))))))
      #3# (EXIT #3#))))) 

(DEFUN |NSMP;pquo;3$;20| (|a| |b| $)
  (PROG (|c| |cPS|)
    (RETURN
     (SEQ
      (LETT |cPS| (SPADCALL |a| |b| (QREFELT $ 67)) . #1=(|NSMP;pquo;3$;20|))
      (LETT |c| (SPADCALL (QVELT |cPS| 0) (QVELT |cPS| 1) (QREFELT $ 62))
            . #1#)
      (EXIT (SPADCALL |c| (QVELT |cPS| 2) (QREFELT $ 60))))))) 

(DEFUN |NSMP;pseudoDivide;2$R;21| (|a| |b| $)
  (PROG (|c| |cPS|)
    (RETURN
     (SEQ
      (LETT |cPS| (SPADCALL |a| |b| (QREFELT $ 67))
            . #1=(|NSMP;pseudoDivide;2$R;21|))
      (LETT |c| (SPADCALL (QVELT |cPS| 0) (QVELT |cPS| 1) (QREFELT $ 62))
            . #1#)
      (EXIT
       (CONS (SPADCALL |c| (QVELT |cPS| 2) (QREFELT $ 60))
             (SPADCALL |c| (QVELT |cPS| 3) (QREFELT $ 60)))))))) 

(DEFUN |NSMP;lazyPrem;3$;22| (|a| |b| $)
  (PROG (|test| |term| #1=#:G302 |lcb| |db|)
    (RETURN
     (SEQ
      (COND ((QEQCAR |b| 0) (|error| "in lazyPrem$NSMP: ground? #2"))
            ((OR (QEQCAR |a| 0)
                 (SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT $ 46)))
             |a|)
            ('T
             (COND
              ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT $ 42))
               (|NSMP;PSimp|
                (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|)) (QREFELT $ 71))
                (QCAR (QCDR |a|)) $))
              ('T
               (SEQ
                (LETT |db| (SPADCALL (QCDR (QCDR |b|)) (QREFELT $ 12))
                      . #2=(|NSMP;lazyPrem;3$;22|))
                (LETT |lcb| (SPADCALL (QCDR (QCDR |b|)) (QREFELT $ 14)) . #2#)
                (LETT |test|
                      (- (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT $ 43)) |db|)
                      . #2#)
                (SEQ G190
                     (COND
                      ((NULL
                        (COND
                         ((OR (SPADCALL |a| (QREFELT $ 34)) (MINUSP |test|))
                          'NIL)
                         ('T 'T)))
                       (GO G191)))
                     (SEQ
                      (LETT |term|
                            (SPADCALL
                             (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT $ 45))
                             (QCAR (QCDR |b|))
                             (PROG1 (LETT #1# |test| . #2#)
                               (|check_subtype| (>= #1# 0)
                                                '(|NonNegativeInteger|) #1#))
                             (QREFELT $ 36))
                            . #2#)
                      (LETT |a|
                            (SPADCALL (SPADCALL |lcb| |a| (QREFELT $ 60))
                                      (SPADCALL |term| |b| (QREFELT $ 60))
                                      (QREFELT $ 64))
                            . #2#)
                      (EXIT
                       (LETT |test|
                             (- (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT $ 43))
                                |db|)
                             . #2#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |a|)))))))))) 

(DEFUN |NSMP;lazyPquo;3$;23| (|a| |b| $)
  (PROG (|test| |q| |term| #1=#:G314 |lcb| |db|)
    (RETURN
     (SEQ
      (COND ((QEQCAR |b| 0) (|error| " in lazyPquo$NSMP: #2 is constant"))
            ((OR (QEQCAR |a| 0)
                 (SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT $ 46)))
             (|spadConstant| $ 13))
            ('T
             (COND
              ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT $ 42))
               (|NSMP;PSimp|
                (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|)) (QREFELT $ 73))
                (QCAR (QCDR |a|)) $))
              ('T
               (SEQ
                (LETT |db| (SPADCALL (QCDR (QCDR |b|)) (QREFELT $ 12))
                      . #2=(|NSMP;lazyPquo;3$;23|))
                (LETT |lcb| (SPADCALL (QCDR (QCDR |b|)) (QREFELT $ 14)) . #2#)
                (LETT |test|
                      (- (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT $ 43)) |db|)
                      . #2#)
                (LETT |q| (|spadConstant| $ 13) . #2#)
                (LETT |test|
                      (- (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT $ 43)) |db|)
                      . #2#)
                (SEQ G190
                     (COND
                      ((NULL
                        (COND
                         ((OR (SPADCALL |a| (QREFELT $ 34)) (MINUSP |test|))
                          'NIL)
                         ('T 'T)))
                       (GO G191)))
                     (SEQ
                      (LETT |term|
                            (SPADCALL
                             (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT $ 45))
                             (QCAR (QCDR |b|))
                             (PROG1 (LETT #1# |test| . #2#)
                               (|check_subtype| (>= #1# 0)
                                                '(|NonNegativeInteger|) #1#))
                             (QREFELT $ 36))
                            . #2#)
                      (LETT |a|
                            (SPADCALL (SPADCALL |lcb| |a| (QREFELT $ 60))
                                      (SPADCALL |term| |b| (QREFELT $ 60))
                                      (QREFELT $ 64))
                            . #2#)
                      (LETT |q|
                            (SPADCALL (SPADCALL |lcb| |q| (QREFELT $ 60))
                                      |term| (QREFELT $ 74))
                            . #2#)
                      (EXIT
                       (LETT |test|
                             (- (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT $ 43))
                                |db|)
                             . #2#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |q|)))))))))) 

(DEFUN |NSMP;lazyPseudoDivide;2$R;24| (|a| |b| $)
  (PROG (#1=#:G333 |test| |delta| |q| |term| #2=#:G329 |lcb| |db| |cgqr|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR |b| 0) (|error| " in lazyPseudoDivide$NSMP: #2 is constant"))
       ((OR (QEQCAR |a| 0)
            (SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT $ 46)))
        (VECTOR (|spadConstant| $ 35) 0 (|spadConstant| $ 13) |a|))
       ('T
        (COND
         ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT $ 42))
          (SEQ
           (LETT |cgqr|
                 (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|)) (QREFELT $ 77))
                 . #3=(|NSMP;lazyPseudoDivide;2$R;24|))
           (EXIT
            (VECTOR (QVELT |cgqr| 0) (QVELT |cgqr| 1)
                    (|NSMP;PSimp| (QVELT |cgqr| 2) (QCAR (QCDR |a|)) $)
                    (|NSMP;PSimp| (QVELT |cgqr| 3) (QCAR (QCDR |a|)) $)))))
         ('T
          (SEQ (LETT |db| (SPADCALL (QCDR (QCDR |b|)) (QREFELT $ 12)) . #3#)
               (LETT |lcb| (SPADCALL (QCDR (QCDR |b|)) (QREFELT $ 14)) . #3#)
               (LETT |test|
                     (- (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT $ 43)) |db|)
                     . #3#)
               (LETT |q| (|spadConstant| $ 13) . #3#)
               (LETT |delta| (MAX (+ |test| 1) 0) . #3#)
               (SEQ G190
                    (COND
                     ((NULL
                       (COND
                        ((OR (SPADCALL |a| (QREFELT $ 34)) (MINUSP |test|))
                         'NIL)
                        ('T 'T)))
                      (GO G191)))
                    (SEQ
                     (LETT |term|
                           (SPADCALL
                            (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT $ 45))
                            (QCAR (QCDR |b|))
                            (PROG1 (LETT #2# |test| . #3#)
                              (|check_subtype| (>= #2# 0)
                                               '(|NonNegativeInteger|) #2#))
                            (QREFELT $ 36))
                           . #3#)
                     (LETT |a|
                           (SPADCALL (SPADCALL |lcb| |a| (QREFELT $ 60))
                                     (SPADCALL |term| |b| (QREFELT $ 60))
                                     (QREFELT $ 64))
                           . #3#)
                     (LETT |q|
                           (SPADCALL (SPADCALL |lcb| |q| (QREFELT $ 60)) |term|
                                     (QREFELT $ 74))
                           . #3#)
                     (LETT |delta| (- |delta| 1) . #3#)
                     (EXIT
                      (LETT |test|
                            (- (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT $ 43))
                               |db|)
                            . #3#)))
                    NIL (GO G190) G191 (EXIT NIL))
               (EXIT
                (VECTOR |lcb|
                        (PROG1 (LETT #1# |delta| . #3#)
                          (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                           #1#))
                        |q| |a|))))))))))) 

(DEFUN |NSMP;lazyResidueClass;2$R;25| (|a| |b| $)
  (PROG (|test| |pow| |term| #1=#:G346 |db| |lrc| |lcb|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR |b| 0) (|error| " in lazyResidueClass$NSMP: #2 is constant"))
       (#2='T
        (SEQ
         (LETT |lcb| (SPADCALL (QCDR (QCDR |b|)) (QREFELT $ 14))
               . #3=(|NSMP;lazyResidueClass;2$R;25|))
         (COND
          ((OR (QEQCAR |a| 0)
               (SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT $ 46)))
           (EXIT (VECTOR |a| |lcb| 0))))
         (EXIT
          (COND
           ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT $ 42))
            (SEQ
             (LETT |lrc|
                   (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|))
                             (QREFELT $ 80))
                   . #3#)
             (EXIT
              (VECTOR (|NSMP;PSimp| (QVELT |lrc| 0) (QCAR (QCDR |a|)) $)
                      (QVELT |lrc| 1) (QVELT |lrc| 2)))))
           (#2#
            (SEQ (LETT |db| (SPADCALL (QCDR (QCDR |b|)) (QREFELT $ 12)) . #3#)
                 (LETT |test|
                       (- (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT $ 43)) |db|)
                       . #3#)
                 (LETT |pow| 0 . #3#)
                 (SEQ G190
                      (COND
                       ((NULL
                         (COND
                          ((OR (SPADCALL |a| (QREFELT $ 34)) (MINUSP |test|))
                           'NIL)
                          ('T 'T)))
                        (GO G191)))
                      (SEQ
                       (LETT |term|
                             (SPADCALL
                              (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT $ 45))
                              (QCAR (QCDR |b|))
                              (PROG1 (LETT #1# |test| . #3#)
                                (|check_subtype| (>= #1# 0)
                                                 '(|NonNegativeInteger|) #1#))
                              (QREFELT $ 36))
                             . #3#)
                       (LETT |a|
                             (SPADCALL (SPADCALL |lcb| |a| (QREFELT $ 60))
                                       (SPADCALL |term| |b| (QREFELT $ 60))
                                       (QREFELT $ 64))
                             . #3#)
                       (LETT |pow| (+ |pow| 1) . #3#)
                       (EXIT
                        (LETT |test|
                              (-
                               (SPADCALL |a| (QCAR (QCDR |b|)) (QREFELT $ 43))
                               |db|)
                              . #3#)))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT (VECTOR |a| |lcb| |pow|))))))))))))) 

(DEFUN |NSMP;exactQuo| (|x| |y| $)
  (PROG (|ex|)
    (RETURN
     (SEQ (LETT |ex| (SPADCALL |x| |y| (QREFELT $ 84)) |NSMP;exactQuo|)
          (EXIT
           (COND ((QEQCAR |ex| 0) (QCDR |ex|))
                 ('T (|error| "in exactQuotient$NSMP: bad args")))))))) 

(DEFUN |NSMP;LazardQuotient;2$Nni$;27| (|x| |y| |n| $)
  (PROG (#1=#:G363 |c| |a| #2=#:G369 #3=#:G362 |b|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((ZEROP |n|) (|error| "LazardQuotient$NSMP : n = 0"))
             ((EQL |n| 1) |x|)
             ('T
              (SEQ (LETT |a| 1 . #4=(|NSMP;LazardQuotient;2$Nni$;27|))
                   (SEQ G190
                        (COND
                         ((NULL
                           (>= |n|
                               (LETT |b| (SPADCALL 2 |a| (QREFELT $ 86))
                                     . #4#)))
                          (GO G191)))
                        (SEQ (EXIT (LETT |a| |b| . #4#))) NIL (GO G190) G191
                        (EXIT NIL))
                   (LETT |c| |x| . #4#)
                   (LETT |n|
                         (PROG1 (LETT #3# (- |n| |a|) . #4#)
                           (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|)
                                            #3#))
                         . #4#)
                   (EXIT
                    (SEQ G190 NIL
                         (SEQ
                          (EXIT
                           (COND
                            ((EQL |a| 1) (PROGN (LETT #2# |c| . #4#) (GO #2#)))
                            ('T
                             (SEQ (LETT |a| (QUOTIENT2 |a| 2) . #4#)
                                  (LETT |c|
                                        (|NSMP;exactQuo|
                                         (SPADCALL |c| |c| (QREFELT $ 60)) |y|
                                         $)
                                        . #4#)
                                  (EXIT
                                   (COND
                                    ((>= |n| |a|)
                                     (SEQ
                                      (LETT |c|
                                            (|NSMP;exactQuo|
                                             (SPADCALL |c| |x| (QREFELT $ 60))
                                             |y| $)
                                            . #4#)
                                      (EXIT
                                       (LETT |n|
                                             (PROG1
                                                 (LETT #1# (- |n| |a|) . #4#)
                                               (|check_subtype| (>= #1# 0)
                                                                '(|NonNegativeInteger|)
                                                                #1#))
                                             . #4#)))))))))))
                         NIL (GO G190) G191 (EXIT NIL)))))))
      #2# (EXIT #2#))))) 

(DEFUN |NSMP;LazardQuotient2;3$Nni$;28| (|p| |a| |b| |n| $)
  (PROG (|c| #1=#:G373)
    (RETURN
     (SEQ
      (COND ((ZEROP |n|) (|error| " in LazardQuotient2$NSMP: bad #4"))
            ((EQL |n| 1) |p|)
            ('T
             (SEQ
              (LETT |c|
                    (SPADCALL |a| |b|
                              (PROG1
                                  (LETT #1# (- |n| 1)
                                        . #2=(|NSMP;LazardQuotient2;3$Nni$;28|))
                                (|check_subtype| (>= #1# 0)
                                                 '(|NonNegativeInteger|) #1#))
                              (QREFELT $ 87))
                    . #2#)
              (EXIT
               (|NSMP;exactQuo| (SPADCALL |c| |p| (QREFELT $ 60)) |b| $))))))))) 

(DEFUN |NSMP;next_subResultant2;5$;29| (|p| |q| |z| |s| $)
  (|NSMP;PSimp|
   (SPADCALL (QCDR (QCDR |p|)) (QCDR (QCDR |q|)) (QCDR (QCDR |z|)) |s|
             (QREFELT $ 89))
   (QCAR (QCDR |p|)) $)) 

(DEFUN |NSMP;subResultantGcd;3$;30| (|a| |b| $)
  (COND
   ((OR (QEQCAR |a| 0) (QEQCAR |b| 0))
    (|error| "subResultantGcd$NSMP: one arg is constant"))
   ('T
    (COND
     ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT $ 91))
      (|error| "subResultantGcd$NSMP: mvar(#1) ~= mvar(#2)"))
     ('T
      (|NSMP;PSimp|
       (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|)) (QREFELT $ 92))
       (QCAR (QCDR |a|)) $)))))) 

(DEFUN |NSMP;halfExtendedSubResultantGcd1;2$R;31| (|a| |b| $)
  (PROG (|hesrg|)
    (RETURN
     (SEQ
      (COND
       ((OR (QEQCAR |a| 0) (QEQCAR |b| 0))
        (|error| "halfExtendedSubResultantGcd1$NSMP: one arg is constant"))
       ('T
        (COND
         ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT $ 91))
          (|error| "halfExtendedSubResultantGcd1$NSMP: mvar(#1) ~= mvar(#2)"))
         ('T
          (SEQ
           (LETT |hesrg|
                 (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|)) (QREFELT $ 95))
                 |NSMP;halfExtendedSubResultantGcd1;2$R;31|)
           (EXIT
            (CONS (|NSMP;PSimp| (QCAR |hesrg|) (QCAR (QCDR |a|)) $)
                  (|NSMP;PSimp| (QCDR |hesrg|) (QCAR (QCDR |a|)) $)))))))))))) 

(DEFUN |NSMP;halfExtendedSubResultantGcd2;2$R;32| (|a| |b| $)
  (PROG (|hesrg|)
    (RETURN
     (SEQ
      (COND
       ((OR (QEQCAR |a| 0) (QEQCAR |b| 0))
        (|error| "halfExtendedSubResultantGcd2$NSMP: one arg is constant"))
       ('T
        (COND
         ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT $ 91))
          (|error| "halfExtendedSubResultantGcd2$NSMP: mvar(#1) ~= mvar(#2)"))
         ('T
          (SEQ
           (LETT |hesrg|
                 (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|)) (QREFELT $ 98))
                 |NSMP;halfExtendedSubResultantGcd2;2$R;32|)
           (EXIT
            (CONS (|NSMP;PSimp| (QCAR |hesrg|) (QCAR (QCDR |a|)) $)
                  (|NSMP;PSimp| (QCDR |hesrg|) (QCAR (QCDR |a|)) $)))))))))))) 

(DEFUN |NSMP;extendedSubResultantGcd;2$R;33| (|a| |b| $)
  (PROG (|esrg|)
    (RETURN
     (SEQ
      (COND
       ((OR (QEQCAR |a| 0) (QEQCAR |b| 0))
        (|error| "extendedSubResultantGcd$NSMP: one arg is constant"))
       ('T
        (COND
         ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT $ 91))
          (|error| "extendedSubResultantGcd$NSMP: mvar(#1) ~= mvar(#2)"))
         ('T
          (SEQ
           (LETT |esrg|
                 (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|)) (QREFELT $ 101))
                 |NSMP;extendedSubResultantGcd;2$R;33|)
           (EXIT
            (VECTOR (|NSMP;PSimp| (QVELT |esrg| 0) (QCAR (QCDR |a|)) $)
                    (|NSMP;PSimp| (QVELT |esrg| 1) (QCAR (QCDR |a|)) $)
                    (|NSMP;PSimp| (QVELT |esrg| 2) (QCAR (QCDR |a|))
                     $)))))))))))) 

(DEFUN |NSMP;resultant;3$;34| (|a| |b| $)
  (COND
   ((OR (QEQCAR |a| 0) (QEQCAR |b| 0))
    (|error| "resultant$NSMP: one arg is constant"))
   ('T
    (COND
     ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT $ 91))
      (|error| "resultant$NSMP: mvar(#1) ~= mvar(#2)"))
     ('T (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|)) (QREFELT $ 103))))))) 

(DEFUN |NSMP;subResultantChain;2$L;35| (|a| |b| $)
  (PROG (#1=#:G419 |up| #2=#:G418)
    (RETURN
     (SEQ
      (COND
       ((OR (QEQCAR |a| 0) (QEQCAR |b| 0))
        (|error| "subResultantChain$NSMP: one arg is constant"))
       ('T
        (COND
         ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT $ 91))
          (|error| "subResultantChain$NSMP: mvar(#1) ~= mvar(#2)"))
         ('T
          (PROGN
           (LETT #2# NIL . #3=(|NSMP;subResultantChain;2$L;35|))
           (SEQ (LETT |up| NIL . #3#)
                (LETT #1#
                      (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|))
                                (QREFELT $ 105))
                      . #3#)
                G190
                (COND
                 ((OR (ATOM #1#) (PROGN (LETT |up| (CAR #1#) . #3#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (LETT #2# (CONS (|NSMP;PSimp| |up| (QCAR (QCDR |a|)) $) #2#)
                        . #3#)))
                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                (EXIT (NREVERSE #2#)))))))))))) 

(DEFUN |NSMP;lastSubResultant;3$;36| (|a| |b| $)
  (COND
   ((OR (QEQCAR |a| 0) (QEQCAR |b| 0))
    (|error| "lastSubResultant$NSMP: one arg is constant"))
   ('T
    (COND
     ((SPADCALL (QCAR (QCDR |a|)) (QCAR (QCDR |b|)) (QREFELT $ 91))
      (|error| "lastSubResultant$NSMP: mvar(#1) ~= mvar(#2)"))
     ('T
      (|NSMP;PSimp|
       (SPADCALL (QCDR (QCDR |a|)) (QCDR (QCDR |b|)) (QREFELT $ 107))
       (QCAR (QCDR |a|)) $)))))) 

(DEFUN |NSMP;exactQuotient;$R$;37| (|a| |b| $)
  (PROG ()
    (RETURN
     (COND ((SPADCALL |b| (QCDR (|spadConstant| $ 35)) (QREFELT $ 109)) |a|)
           ((QEQCAR |a| 0) (CONS 0 (SPADCALL (QCDR |a|) |b| (QREFELT $ 110))))
           ('T
            (CONS 1
                  (CONS (QCAR (QCDR |a|))
                        (SPADCALL
                         (CONS #'|NSMP;exactQuotient;$R$;37!0| (VECTOR $ |b|))
                         (QCDR (QCDR |a|)) (QREFELT $ 51))))))))) 

(DEFUN |NSMP;exactQuotient;$R$;37!0| (|a1| $$)
  (PROG (|b| $)
    (LETT |b| (QREFELT $$ 1) . #1=(|NSMP;exactQuotient;$R$;37|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |a1| |b| (QREFELT $ 111)))))) 

(DEFUN |NSMP;exactQuotient!;$R$;38| (|a| |b| $)
  (PROG ()
    (RETURN
     (SEQ
      (COND ((SPADCALL |b| (QCDR (|spadConstant| $ 35)) (QREFELT $ 109)) |a|)
            ((QEQCAR |a| 0) (CONS 0 (SPADCALL (QCDR |a|) |b| (QREFELT $ 110))))
            ('T
             (SEQ
              (PROGN
               (RPLACD #1=(QCDR |a|)
                       (SPADCALL
                        (CONS #'|NSMP;exactQuotient!;$R$;38!0| (VECTOR $ |b|))
                        (QCDR (QCDR |a|)) (QREFELT $ 51)))
               (QCDR #1#))
              (EXIT |a|)))))))) 

(DEFUN |NSMP;exactQuotient!;$R$;38!0| (|a1| $$)
  (PROG (|b| $)
    (LETT |b| (QREFELT $$ 1) . #1=(|NSMP;exactQuotient!;$R$;38|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |a1| |b| (QREFELT $ 112)))))) 

(DEFUN |NSMP;exactQuotient;$R$;39| (|a| |b| $)
  (PROG (#1=#:G435)
    (RETURN
     (COND ((SPADCALL |b| (QCDR (|spadConstant| $ 35)) (QREFELT $ 109)) |a|)
           ((QEQCAR |a| 0)
            (CONS 0
                  (PROG2
                      (LETT #1# (SPADCALL (QCDR |a|) |b| (QREFELT $ 113))
                            |NSMP;exactQuotient;$R$;39|)
                      (QCDR #1#)
                    (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))))
           ('T
            (CONS 1
                  (CONS (QCAR (QCDR |a|))
                        (SPADCALL
                         (CONS #'|NSMP;exactQuotient;$R$;39!0| (VECTOR $ |b|))
                         (QCDR (QCDR |a|)) (QREFELT $ 51))))))))) 

(DEFUN |NSMP;exactQuotient;$R$;39!0| (|a1| $$)
  (PROG (|b| $)
    (LETT |b| (QREFELT $$ 1) . #1=(|NSMP;exactQuotient;$R$;39|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |a1| |b| (QREFELT $ 111)))))) 

(DEFUN |NSMP;exactQuotient!;$R$;40| (|a| |b| $)
  (PROG (#1=#:G444)
    (RETURN
     (SEQ
      (COND ((SPADCALL |b| (QCDR (|spadConstant| $ 35)) (QREFELT $ 109)) |a|)
            ((QEQCAR |a| 0)
             (CONS 0
                   (PROG2
                       (LETT #1# (SPADCALL (QCDR |a|) |b| (QREFELT $ 113))
                             |NSMP;exactQuotient!;$R$;40|)
                       (QCDR #1#)
                     (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))))
            ('T
             (SEQ
              (PROGN
               (RPLACD #2=(QCDR |a|)
                       (SPADCALL
                        (CONS #'|NSMP;exactQuotient!;$R$;40!0| (VECTOR $ |b|))
                        (QCDR (QCDR |a|)) (QREFELT $ 51)))
               (QCDR #2#))
              (EXIT |a|)))))))) 

(DEFUN |NSMP;exactQuotient!;$R$;40!0| (|a1| $$)
  (PROG (|b| $)
    (LETT |b| (QREFELT $$ 1) . #1=(|NSMP;exactQuotient!;$R$;40|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |a1| |b| (QREFELT $ 112)))))) 

(DEFUN |NSMP;localGcd| (|r| |p| $)
  (COND ((QEQCAR |p| 0) (SPADCALL |r| (QCDR |p|) (QREFELT $ 114)))
        ('T (SPADCALL |r| (SPADCALL |p| (QREFELT $ 115)) (QREFELT $ 114))))) 

(DEFUN |NSMP;gcd;R$R;42| (|r| |p| $)
  (COND
   ((OR (SPADCALL |r| (QCDR (|spadConstant| $ 35)) (QREFELT $ 109))
        (SPADCALL |p| (QREFELT $ 34)))
    |r|)
   ('T (|NSMP;localGcd| |r| |p| $)))) 

(DEFUN |NSMP;content;$R;43| (|p| $)
  (PROG (|up| |r|)
    (RETURN
     (SEQ
      (COND ((QEQCAR |p| 0) (QCDR |p|))
            ('T
             (SEQ (LETT |up| (QCDR (QCDR |p|)) . #1=(|NSMP;content;$R;43|))
                  (LETT |r| (|spadConstant| $ 78) . #1#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND
                           ((OR (SPADCALL |up| (QREFELT $ 117))
                                (SPADCALL |r| (QCDR (|spadConstant| $ 35))
                                          (QREFELT $ 109)))
                            'NIL)
                           ('T 'T)))
                         (GO G191)))
                       (SEQ
                        (LETT |r|
                              (|NSMP;localGcd| |r|
                               (SPADCALL |up| (QREFELT $ 14)) $)
                              . #1#)
                        (EXIT
                         (LETT |up| (SPADCALL |up| (QREFELT $ 24)) . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |r|)))))))) 

(DEFUN |NSMP;primitivePart!;2$;44| (|p| $)
  (PROG (|cp|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p| (QREFELT $ 34)) |p|)
            ((QEQCAR |p| 0) (|spadConstant| $ 35))
            ('T
             (SEQ
              (LETT |cp| (SPADCALL |p| (QREFELT $ 115))
                    |NSMP;primitivePart!;2$;44|)
              (PROGN
               (RPLACD #1=(QCDR |p|)
                       (SPADCALL
                        (SPADCALL
                         (CONS #'|NSMP;primitivePart!;2$;44!0| (VECTOR $ |cp|))
                         (QCDR (QCDR |p|)) (QREFELT $ 51))
                        (QREFELT $ 118)))
               (QCDR #1#))
              (EXIT |p|)))))))) 

(DEFUN |NSMP;primitivePart!;2$;44!0| (|a1| $$)
  (PROG (|cp| $)
    (LETT |cp| (QREFELT $$ 1) . #1=(|NSMP;primitivePart!;2$;44|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |a1| |cp| (QREFELT $ 112)))))) 

(DEFUN |NewSparseMultivariatePolynomial| (&REST #1=#:G501)
  (PROG ()
    (RETURN
     (PROG (#2=#:G502)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|NewSparseMultivariatePolynomial|)
                                           '|domainEqualList|)
                . #3=(|NewSparseMultivariatePolynomial|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |NewSparseMultivariatePolynomial;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|NewSparseMultivariatePolynomial|))))))))))) 

(DEFUN |NewSparseMultivariatePolynomial;| (|#1| |#2|)
  (PROG (#1=#:G500 |pv$| #2=#:G496 #3=#:G497 #4=#:G498 #5=#:G499 $ |dv$| DV$2
         DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #6=(|NewSparseMultivariatePolynomial|))
      (LETT DV$2 (|devaluate| |#2|) . #6#)
      (LETT |dv$| (LIST '|NewSparseMultivariatePolynomial| DV$1 DV$2) . #6#)
      (LETT $ (GETREFV 166) . #6#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#1| '(|EntireRing|))
                                          (LETT #5#
                                                (|HasCategory| |#1|
                                                               '(|GcdDomain|))
                                                . #6#)
                                          (OR #5#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
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
                                          (OR
                                           (|HasCategory| |#1| '(|EntireRing|))
                                           #5#)
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
                                          (LETT #4#
                                                (|HasCategory| |#2|
                                                               '(|ConvertibleTo|
                                                                 (|Symbol|)))
                                                . #6#)
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|RetractableTo|
                                                            (|Integer|)))
                                           #4#)
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
                                          (LETT #3#
                                                (|HasCategory| |#1|
                                                               '(|CommutativeRing|))
                                                . #6#)
                                          (OR #3#
                                              (|HasCategory| |#1|
                                                             '(|EntireRing|)))
                                          (OR #3# #5#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|IntegralDomain|))
                                                . #6#)
                                          (OR #3# #5# #2#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #5# #2#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #3# #5# #2#) (OR #5# #2#)
                                          (OR #3#
                                              (|HasCategory| |#1|
                                                             '(|EntireRing|))
                                              #5# #2#)
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           #4#)
                                          (OR
                                           (AND
                                            (|HasCategory| |#1|
                                                           '(|Algebra|
                                                             (|Fraction|
                                                              (|Integer|))))
                                            #4#)
                                           (AND
                                            (|HasCategory| |#1|
                                                           '(|Algebra|
                                                             (|Integer|)))
                                            #4#
                                            (|not|
                                             (|HasCategory| |#1|
                                                            '(|Algebra|
                                                              (|Fraction|
                                                               (|Integer|)))))))
                                          (OR
                                           (AND #4#
                                                (|not|
                                                 (|HasCategory| |#1|
                                                                '(|Algebra|
                                                                  (|Fraction|
                                                                   (|Integer|)))))
                                                (|not|
                                                 (|HasCategory| |#1|
                                                                '(|Algebra|
                                                                  (|Integer|)))))
                                           (AND
                                            (|HasCategory| |#1|
                                                           '(|Algebra|
                                                             (|Integer|)))
                                            #4#
                                            (|not|
                                             (|HasCategory| |#1|
                                                            '(|Algebra|
                                                              (|Fraction|
                                                               (|Integer|)))))
                                            (|not|
                                             (|HasCategory| |#1|
                                                            '(|IntegerNumberSystem|))))
                                           (AND
                                            (|HasCategory| |#1|
                                                           '(|Algebra|
                                                             (|Fraction|
                                                              (|Integer|))))
                                            #4#
                                            (|not|
                                             (|HasCategory| |#1|
                                                            '(|QuotientFieldCategory|
                                                              (|Integer|))))))))
                      . #6#))
      (|haddProp| |$ConstructorCache| '|NewSparseMultivariatePolynomial|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (AND (|HasCategory| $ '(|CommutativeRing|))
           (|augmentPredVector| $ 17179869184))
      (AND
       (LETT #1#
             (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                  (|HasCategory| $ '(|CharacteristicNonZero|)))
             . #6#)
       (|augmentPredVector| $ 34359738368))
      (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
           (|augmentPredVector| $ 68719476736))
      (AND
       (OR (|HasCategory| |#1| '(|EntireRing|))
           (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 137438953472))
      (AND
       (OR #5#
           (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 274877906944))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 (|NewSparseUnivariatePolynomial| $))
      (QSETREFV $ 9 (|Record| (|:| |v| |#2|) (|:| |ts| (QREFELT $ 8))))
      (QSETREFV $ 10 (|Union| |#1| (QREFELT $ 9)))
      (COND
       ((|testBitVector| |pv$| 26)
        (PROGN
         (QSETREFV $ 83 (|PseudoRemainderSequence| $ (QREFELT $ 8)))
         (QSETREFV $ 87
                   (CONS (|dispatchFunction| |NSMP;LazardQuotient;2$Nni$;27|)
                         $))
         (QSETREFV $ 88
                   (CONS (|dispatchFunction| |NSMP;LazardQuotient2;3$Nni$;28|)
                         $))
         (QSETREFV $ 90
                   (CONS (|dispatchFunction| |NSMP;next_subResultant2;5$;29|)
                         $))
         (QSETREFV $ 93
                   (CONS (|dispatchFunction| |NSMP;subResultantGcd;3$;30|) $))
         (QSETREFV $ 96
                   (CONS
                    (|dispatchFunction|
                     |NSMP;halfExtendedSubResultantGcd1;2$R;31|)
                    $))
         (QSETREFV $ 99
                   (CONS
                    (|dispatchFunction|
                     |NSMP;halfExtendedSubResultantGcd2;2$R;32|)
                    $))
         (QSETREFV $ 102
                   (CONS
                    (|dispatchFunction| |NSMP;extendedSubResultantGcd;2$R;33|)
                    $))
         (QSETREFV $ 104 (CONS (|dispatchFunction| |NSMP;resultant;3$;34|) $))
         (QSETREFV $ 106
                   (CONS (|dispatchFunction| |NSMP;subResultantChain;2$L;35|)
                         $))
         (QSETREFV $ 108
                   (CONS (|dispatchFunction| |NSMP;lastSubResultant;3$;36|) $))
         (COND
          ((|HasCategory| |#1| '(|EuclideanDomain|))
           (PROGN
            (QSETREFV $ 111
                      (CONS (|dispatchFunction| |NSMP;exactQuotient;$R$;37|)
                            $))
            (QSETREFV $ 112
                      (CONS (|dispatchFunction| |NSMP;exactQuotient!;$R$;38|)
                            $))))
          ('T
           (PROGN
            (QSETREFV $ 111
                      (CONS (|dispatchFunction| |NSMP;exactQuotient;$R$;39|)
                            $))
            (QSETREFV $ 112
                      (CONS (|dispatchFunction| |NSMP;exactQuotient!;$R$;40|)
                            $))))))))
      (COND
       ((|testBitVector| |pv$| 3)
        (PROGN
         (QSETREFV $ 116 (CONS (|dispatchFunction| |NSMP;gcd;R$R;42|) $))
         (QSETREFV $ 115 (CONS (|dispatchFunction| |NSMP;content;$R;43|) $))
         (QSETREFV $ 119
                   (CONS (|dispatchFunction| |NSMP;primitivePart!;2$;44|)
                         $)))))
      $)))) 

(MAKEPROP '|NewSparseMultivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariatePolynomial| 6 7)
              (|local| |#1|) (|local| |#2|) 'D '|VPoly| '|Rep|
              (|NonNegativeInteger|) (0 . |degree|) (5 . |Zero|)
              (9 . |leadingCoefficient|) |NSMP;coerce;$Smp;2|
              |NSMP;coerce;Smp$;3| (|Union| 5 '"failed")
              |NSMP;retractIfCan;$U;4| |NSMP;mvar;$VarSet;5| |NSMP;mdeg;$Nni;6|
              |NSMP;init;2$;7| (14 . |leadingMonomial|) |NSMP;head;2$;8|
              (19 . |reductum|) (|Boolean|) (24 . |ground?|) (29 . |ground|)
              |NSMP;tail;2$;9| (|List| $) |NSMP;iteratedInitials;$L;10|
              (|List| $$) (34 . |cons|) |NSMP;deepestInitial;2$;12|
              (40 . |zero?|) (45 . |One|) (49 . |monomial|)
              |NSMP;mainMonomial;2$;13| (56 . |minimumDegree|)
              |NSMP;leastMonomial;2$;14| (61 . |coefficients|)
              |NSMP;mainCoefficients;$L;15| (66 . =) (72 . |degree|)
              (78 . |coefficient|) |NSMP;leadingCoefficient;$VarSet$;16|
              (85 . <) (91 . >) (|NewSparseUnivariatePolynomial| $$)
              (|Mapping| $$ $$)
              (|NewSparseUnivariatePolynomialFunctions2| $$ $$) (97 . |map|)
              (103 . |monicModulo|) (109 . |ground?|) (114 . |One|) (118 . =)
              (124 . |ground|) (|Union| $ '"failed") (129 . |recip|) (134 . *)
              (140 . *) |NSMP;monicModulo;3$;18| (146 . ^)
              (152 . |pseudoRemainder|) (158 . -) |NSMP;prem;3$;19|
              (|Record| (|:| |coef| $) (|:| |gap| 11) (|:| |quotient| $)
                        (|:| |remainder| $))
              |NSMP;lazyPseudoDivide;2$R;24| |NSMP;pquo;3$;20|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              |NSMP;pseudoDivide;2$R;21| (164 . |lazyPseudoRemainder|)
              |NSMP;lazyPrem;3$;22| (170 . |lazyPseudoQuotient|) (176 . +)
              |NSMP;lazyPquo;3$;23|
              (|Record| (|:| |coef| $$) (|:| |gap| 11) (|:| |quotient| $)
                        (|:| |remainder| $))
              (182 . |lazyPseudoDivide|) (188 . |Zero|)
              (|Record| (|:| |polnum| $) (|:| |polden| $$) (|:| |power| 11))
              (192 . |lazyResidueClass|)
              (|Record| (|:| |polnum| $) (|:| |polden| $) (|:| |power| 11))
              |NSMP;lazyResidueClass;2$R;25| '|packD| (198 . |exquo|)
              (|PositiveInteger|) (204 . *) (210 . |LazardQuotient|)
              (217 . |LazardQuotient2|) (225 . |next_sousResultant2|)
              (233 . |next_subResultant2|) (241 . ~=) (247 . |subResultantGcd|)
              (253 . |subResultantGcd|)
              (|Record| (|:| |gcd| $) (|:| |coef1| $))
              (259 . |halfExtendedSubResultantGcd1|)
              (265 . |halfExtendedSubResultantGcd1|)
              (|Record| (|:| |gcd| $) (|:| |coef2| $))
              (271 . |halfExtendedSubResultantGcd2|)
              (277 . |halfExtendedSubResultantGcd2|)
              (|Record| (|:| |gcd| $) (|:| |coef1| $) (|:| |coef2| $))
              (283 . |extendedSubResultantGcd|)
              (289 . |extendedSubResultantGcd|) (295 . |resultant|)
              (301 . |resultant|) (307 . |subResultantsChain|)
              (313 . |subResultantChain|) (319 . |lastSubResultant|)
              (325 . |lastSubResultant|) (331 . =) (337 . |quo|)
              (343 . |exactQuotient|) (349 . |exactQuotient!|) (355 . |exquo|)
              (361 . |gcd|) (367 . |content|) (372 . |gcd|) (378 . |zero?|)
              (383 . |unitCanonical|) (388 . |primitivePart!|)
              (|Union| 137 '#1="failed") (|Matrix| $) (|Polynomial| 132)
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 143)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 143 $)
              (|String|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Polynomial| 143) (|Polynomial| 6) (|Fraction| 143)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|SparseUnivariatePolynomial| $) (|Factored| $)
              (|Record| (|:| |mat| 138) (|:| |vec| (|Vector| 143)))
              (|Vector| $) (|Matrix| 143) (|Factored| 134) (|Union| 141 '#1#)
              (|List| 134) (|Union| 132 '#2="failed") (|Integer|)
              (|Union| 143 '#2#)
              (|Record| (|:| |coef| $) (|:| |gap| 11) (|:| |remainder| $))
              (|Union| 25 '"failed")
              (|Record| (|:| |var| 7) (|:| |exponent| 11))
              (|Union| 147 '#3="failed") (|Union| 29 '#3#)
              (|SparseUnivariatePolynomial| 6) (|List| 11) (|List| 7)
              (|Union| 7 '#2#) (|List| 6) (|Equation| $) (|List| 155)
              (|IndexedExponents| 7) (|Mapping| 6 6) (|Union| 6 '#2#)
              (|Mapping| 157 157)
              (|Record| (|:| |mat| 162) (|:| |vec| (|Vector| 6))) (|Matrix| 6)
              (|HashState|) (|OutputForm|) (|SingleInteger|))
           '#(|zero?| 393 |tail| 398 |subResultantGcd| 403 |subResultantChain|
              409 |retractIfCan| 415 |resultant| 420 |pseudoDivide| 426
              |primitivePart!| 432 |prem| 437 |pquo| 443 |next_subResultant2|
              449 |mvar| 457 |monomial| 462 |monicModulo| 469 |mdeg| 475
              |mainMonomial| 480 |mainCoefficients| 485 |leastMonomial| 490
              |leadingCoefficient| 495 |lazyResidueClass| 501
              |lazyPseudoDivide| 507 |lazyPrem| 513 |lazyPquo| 519
              |lastSubResultant| 525 |iteratedInitials| 531 |init| 536 |head|
              541 |halfExtendedSubResultantGcd2| 546
              |halfExtendedSubResultantGcd1| 552 |ground?| 558 |ground| 563
              |gcd| 568 |extendedSubResultantGcd| 574 |exquo| 580
              |exactQuotient!| 586 |exactQuotient| 592 |degree| 598
              |deepestInitial| 604 |content| 609 |coerce| 614 |coefficient| 624
              ^ 631 |Zero| 637 |One| 641 |LazardQuotient2| 645 |LazardQuotient|
              653 = 660 - 666 + 672 * 678)
           'NIL
           (CONS
            (|makeByteWordVec2| 31
                                '(0 0 0 1 0 1 0 4 28 0 30 3 10 25 0 0 27 30 10
                                  11 12 25 13 18 0 0 10 31 0 0 0 0 24 10 10 0 0
                                  0 0 0 0 0 0 5 6 17 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 29 2 7 8 9 14 15 16 20 19 19))
            (CONS
             '#(|RecursivePolynomialCategory&| |PolynomialCategory&|
                |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |FiniteAbelianMonoidRing&|
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |FullyLinearlyExplicitRingOver&| |Algebra&| NIL |Algebra&|
                |Algebra&| |PartialDifferentialRing&| NIL NIL |Module&|
                |Module&| NIL NIL |Module&| |EntireRing&| NIL |Ring&| NIL NIL
                NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL
                |AbelianMonoid&| |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&|
                NIL NIL NIL |Evalable&| |FullyRetractableTo&| |SetCategory&|
                |RetractableTo&| NIL NIL |RetractableTo&| |InnerEvalable&|
                |InnerEvalable&| |InnerEvalable&| |RetractableTo&| NIL
                |BasicType&| NIL NIL NIL NIL NIL NIL |RetractableTo&|
                |RetractableTo&| NIL NIL NIL NIL)
             (CONS
              '#((|RecursivePolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|PolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|PolynomialFactorizationExplicit|)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 7)) (|GcdDomain|)
                 (|IntegralDomain|) (|FullyLinearlyExplicitRingOver| 6)
                 (|Algebra| $$) (|LeftOreRing|) (|Algebra| 132) (|Algebra| 6)
                 (|PartialDifferentialRing| 7) (|LinearlyExplicitRingOver| 6)
                 (|CommutativeRing|) (|Module| $$) (|Module| 132)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|EntireRing|) (|LinearlyExplicitRingOver| 143) (|Ring|)
                 (|BiModule| 6 6) (|BiModule| 132 132) (|BiModule| $$ $$)
                 (|Rng|) (|LeftModule| 6) (|RightModule| 6) (|LeftModule| $$)
                 (|RightModule| $$) (|LeftModule| 132) (|RightModule| 132)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 143) (|Comparable|) (|Evalable| $$)
                 (|FullyRetractableTo| 6) (|SetCategory|)
                 (|RetractableTo| (|SparseMultivariatePolynomial| 6 7))
                 (|CoercibleTo| (|SparseMultivariatePolynomial| 6 7))
                 (|VariablesCommuteWithCoefficients|) (|RetractableTo| 7)
                 (|InnerEvalable| 7 $$) (|InnerEvalable| 7 6)
                 (|InnerEvalable| $$ $$) (|RetractableTo| 6) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 164) (|CommutativeStar|)
                 (|noZeroDivisors|) (|ConvertibleTo| 124) (|ConvertibleTo| 125)
                 (|ConvertibleTo| 123) (|RetractableTo| 132)
                 (|RetractableTo| 143) (|canonicalUnitNormal|)
                 (|ConvertibleTo| 128) (|ConvertibleTo| (|Polynomial| 6))
                 (|CoercibleTo| (|Polynomial| 6)))
              (|makeByteWordVec2| 119
                                  '(1 8 11 0 12 0 0 0 13 1 8 2 0 14 1 8 0 0 22
                                    1 8 0 0 24 1 8 25 0 26 1 8 2 0 27 2 31 0 2
                                    0 32 1 0 25 0 34 0 0 0 35 3 0 0 0 7 11 36 1
                                    8 11 0 38 1 8 31 0 40 2 7 25 0 0 42 2 0 11
                                    0 7 43 3 0 0 0 7 11 44 2 7 25 0 0 46 2 7 25
                                    0 0 47 2 50 48 49 48 51 2 8 0 0 0 52 1 0 25
                                    0 53 0 6 0 54 2 0 25 0 0 55 1 0 6 0 56 1 6
                                    57 0 58 2 0 0 6 0 59 2 0 0 0 0 60 2 0 0 0
                                    11 62 2 8 0 0 0 63 2 0 0 0 0 64 2 8 0 0 0
                                    71 2 8 0 0 0 73 2 0 0 0 0 74 2 8 76 0 0 77
                                    0 6 0 78 2 8 79 0 0 80 2 0 57 0 0 84 2 11 0
                                    85 0 86 3 0 0 0 0 11 87 4 0 0 0 0 0 11 88 4
                                    83 8 8 8 8 2 89 4 0 0 0 0 0 0 90 2 7 25 0 0
                                    91 2 8 0 0 0 92 2 0 0 0 0 93 2 8 94 0 0 95
                                    2 0 94 0 0 96 2 8 97 0 0 98 2 0 97 0 0 99 2
                                    8 100 0 0 101 2 0 100 0 0 102 2 8 2 0 0 103
                                    2 0 0 0 0 104 2 8 29 0 0 105 2 0 29 0 0 106
                                    2 8 0 0 0 107 2 0 0 0 0 108 2 6 25 0 0 109
                                    2 6 0 0 0 110 2 0 0 0 6 111 2 0 0 0 6 112 2
                                    6 57 0 0 113 2 6 0 0 0 114 1 0 6 0 115 2 0
                                    6 6 0 116 1 8 25 0 117 1 8 0 0 118 1 0 0 0
                                    119 1 0 25 0 34 1 0 0 0 28 2 26 0 0 0 93 2
                                    26 29 0 0 106 1 0 17 0 18 2 26 0 0 0 104 2
                                    0 69 0 0 70 1 3 0 0 119 2 0 0 0 0 65 2 0 0
                                    0 0 68 4 26 0 0 0 0 0 90 1 0 7 0 19 3 0 0 0
                                    7 11 36 2 0 0 0 0 61 1 0 11 0 20 1 0 0 0 37
                                    1 0 29 0 41 1 0 0 0 39 2 0 0 0 7 45 2 0 81
                                    0 0 82 2 0 66 0 0 67 2 0 0 0 0 72 2 0 0 0 0
                                    75 2 26 0 0 0 108 1 0 29 0 30 1 0 0 0 21 1
                                    0 0 0 23 2 26 97 0 0 99 2 26 94 0 0 96 1 0
                                    25 0 53 1 0 6 0 56 2 3 6 6 0 116 2 26 100 0
                                    0 102 2 38 57 0 0 84 2 26 0 0 6 112 2 26 0
                                    0 6 111 2 0 11 0 7 43 1 0 0 0 33 1 3 6 0
                                    115 1 0 0 5 16 1 0 5 0 15 3 0 0 0 7 11 44 2
                                    0 0 0 11 62 0 0 0 13 0 0 0 35 4 26 0 0 0 0
                                    11 88 3 26 0 0 0 11 87 2 0 25 0 0 55 2 0 0
                                    0 0 64 2 0 0 0 0 74 2 0 0 6 0 59 2 0 0 0 0
                                    60)))))
           '|lookupIncomplete|)) 
