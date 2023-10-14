
(/VERSIONCHECK 2) 

(PUT '|XRPOLY;construct| '|SPADreplace| '(XLAM (|lt|) |lt|)) 

(DEFUN |XRPOLY;construct| (|lt| $) |lt|) 

(DEFUN |XRPOLY;=;2$B;2| (|p1| |p2| $)
  (COND
   ((QEQCAR |p1| 0)
    (COND ((QEQCAR |p2| 0) (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 10)))
          (#1='T 'NIL)))
   ((QEQCAR |p2| 0) 'NIL)
   (#1#
    (COND
     ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT $ 10))
      (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|)) (QREFELT $ 12)))
     (#1# 'NIL))))) 

(DEFUN |XRPOLY;monom;OfmR$;3| (|w| |r| $)
  (COND
   ((SPADCALL |r| (QCDR (|spadConstant| $ 14)) (QREFELT $ 10))
    (|spadConstant| $ 14))
   ('T (SPADCALL |r| (SPADCALL |w| (QREFELT $ 17)) (QREFELT $ 18))))) 

(DEFUN |XRPOLY;rquo;3$;4| (|p1| |p2| $)
  (PROG (|x| |a| #1=#:G156 |t| #2=#:G155)
    (RETURN
     (SEQ
      (COND ((QEQCAR |p2| 0) (SPADCALL |p1| (QCDR |p2|) (QREFELT $ 20)))
            ((QEQCAR |p1| 0)
             (SPADCALL |p1| (CONS 0 (QCAR (QCDR |p2|))) (QREFELT $ 21)))
            ('T
             (SEQ
              (LETT |x|
                    (|XRPOLY;construct|
                     (PROGN
                      (LETT #2# NIL . #3=(|XRPOLY;rquo;3$;4|))
                      (SEQ (LETT |t| NIL . #3#)
                           (LETT #1#
                                 (SPADCALL (QCDR (QCDR |p1|)) (QREFELT $ 24))
                                 . #3#)
                           G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL
                                (LETT |a|
                                      (SPADCALL (QCDR |t|) |p2| (QREFELT $ 25))
                                      . #3#)
                                (|spadConstant| $ 14) (QREFELT $ 26))
                               (LETT #2# (CONS (CONS (QCAR |t|) |a|) #2#)
                                     . #3#)))))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     $)
                    . #3#)
              (EXIT
               (|XRPOLY;simplifie|
                (CONS (SPADCALL |p1| |p2| (QREFELT $ 27)) |x|) $))))))))) 

(DEFUN |XRPOLY;trunc;$Nni$;5| (|p| |n| $)
  (PROG (|x| |lt| |r| #1=#:G166 |t| #2=#:G165 |n1| #3=#:G160)
    (RETURN
     (SEQ
      (COND
       ((OR (EQL |n| 0) (QEQCAR |p| 0)) (CONS 0 (SPADCALL |p| (QREFELT $ 28))))
       ('T
        (SEQ
         (LETT |n1|
               (PROG1 (LETT #3# (- |n| 1) . #4=(|XRPOLY;trunc;$Nni$;5|))
                 (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|) #3#))
               . #4#)
         (LETT |lt|
               (PROGN
                (LETT #2# NIL . #4#)
                (SEQ (LETT |t| NIL . #4#)
                     (LETT #1# (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24))
                           . #4#)
                     G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #4#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL
                          (LETT |r| (SPADCALL (QCDR |t|) |n1| (QREFELT $ 32))
                                . #4#)
                          (|spadConstant| $ 14) (QREFELT $ 26))
                         (LETT #2# (CONS (CONS (QCAR |t|) |r|) #2#) . #4#)))))
                     (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                     (EXIT (NREVERSE #2#))))
               . #4#)
         (LETT |x| (|XRPOLY;construct| |lt| $) . #4#)
         (EXIT
          (|XRPOLY;simplifie| (CONS (SPADCALL |p| (QREFELT $ 28)) |x|)
           $))))))))) 

(DEFUN |XRPOLY;unexpand;Xdp$;6| (|p| $)
  (PROG (|x| |r| #1=#:G176 |v| #2=#:G175 |vl|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p| (QREFELT $ 34)) (CONS 0 (SPADCALL |p| (QREFELT $ 35))))
       ('T
        (SEQ
         (LETT |vl|
               (SPADCALL (ELT $ 36) (SPADCALL |p| (QREFELT $ 38))
                         (QREFELT $ 40))
               . #3=(|XRPOLY;unexpand;Xdp$;6|))
         (LETT |x|
               (|XRPOLY;construct|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |v| NIL . #3#) (LETT #1# |vl| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL
                           (LETT |r| (SPADCALL |p| |v| (QREFELT $ 41)) . #3#)
                           (|spadConstant| $ 42) (QREFELT $ 43))
                          (LETT #2#
                                (CONS (CONS |v| (SPADCALL |r| (QREFELT $ 44)))
                                      #2#)
                                . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                $)
               . #3#)
         (EXIT (CONS 1 (CONS (SPADCALL |p| (QREFELT $ 35)) |x|)))))))))) 

(DEFUN |XRPOLY;sh;$Nni$;7| (|p| |n| $)
  (PROG (|lt| #1=#:G186 |t| #2=#:G185 |p1| |n1| #3=#:G180)
    (RETURN
     (SEQ
      (COND ((EQL |n| 0) (|spadConstant| $ 29))
            ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) |n| (QREFELT $ 45))))
            ('T
             (SEQ
              (LETT |n1|
                    (PROG1 (LETT #3# (- |n| 1) . #4=(|XRPOLY;sh;$Nni$;7|))
                      (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|) #3#))
                    . #4#)
              (LETT |p1|
                    (SPADCALL |n| (SPADCALL |p| |n1| (QREFELT $ 46))
                              (QREFELT $ 47))
                    . #4#)
              (LETT |lt|
                    (PROGN
                     (LETT #2# NIL . #4#)
                     (SEQ (LETT |t| NIL . #4#)
                          (LETT #1# (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24))
                                . #4#)
                          G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |t| (CAR #1#) . #4#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (CONS (QCAR |t|)
                                         (SPADCALL (QCDR |t|) |p1|
                                                   (QREFELT $ 48)))
                                   #2#)
                                  . #4#)))
                          (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #4#)
              (EXIT
               (CONS 1
                     (CONS
                      (QCDR
                       (SPADCALL (CONS 0 (QCAR (QCDR |p|))) |n|
                                 (QREFELT $ 49)))
                      (|XRPOLY;construct| |lt| $))))))))))) 

(DEFUN |XRPOLY;sh;3$;8| (|p1| |p2| $)
  (PROG (|y| #1=#:G195 |t| #2=#:G194 |x| #3=#:G193 #4=#:G192 |lt2| |lt1|)
    (RETURN
     (SEQ
      (COND ((QEQCAR |p1| 0) (SPADCALL (QCDR |p1|) |p2| (QREFELT $ 18)))
            ((QEQCAR |p2| 0) (SPADCALL |p1| (QCDR |p2|) (QREFELT $ 20)))
            ('T
             (SEQ
              (LETT |lt1| (SPADCALL (QCDR (QCDR |p1|)) (QREFELT $ 24))
                    . #5=(|XRPOLY;sh;3$;8|))
              (LETT |lt2| (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 24)) . #5#)
              (LETT |x|
                    (|XRPOLY;construct|
                     (PROGN
                      (LETT #4# NIL . #5#)
                      (SEQ (LETT |t| NIL . #5#) (LETT #3# |lt1| . #5#) G190
                           (COND
                            ((OR (ATOM #3#)
                                 (PROGN (LETT |t| (CAR #3#) . #5#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #4#
                                   (CONS
                                    (CONS (QCAR |t|)
                                          (SPADCALL (QCDR |t|) |p2|
                                                    (QREFELT $ 48)))
                                    #4#)
                                   . #5#)))
                           (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                           (EXIT (NREVERSE #4#))))
                     $)
                    . #5#)
              (LETT |y|
                    (|XRPOLY;construct|
                     (PROGN
                      (LETT #2# NIL . #5#)
                      (SEQ (LETT |t| NIL . #5#) (LETT #1# |lt2| . #5#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |t| (CAR #1#) . #5#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (CONS (QCAR |t|)
                                          (SPADCALL |p1| (QCDR |t|)
                                                    (QREFELT $ 48)))
                                    #2#)
                                   . #5#)))
                           (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     $)
                    . #5#)
              (EXIT
               (CONS 1
                     (CONS
                      (QCDR
                       (SPADCALL (CONS 0 (QCAR (QCDR |p1|)))
                                 (CONS 0 (QCAR (QCDR |p2|))) (QREFELT $ 21)))
                      (SPADCALL |x| |y| (QREFELT $ 50)))))))))))) 

(DEFUN |XRPOLY;RemainderList;$L;9| (|p| $)
  (COND ((QEQCAR |p| 0) NIL) ('T (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24))))) 

(DEFUN |XRPOLY;lquo;3$;10| (|p1| |p2| $)
  (COND ((QEQCAR |p2| 0) (SPADCALL |p1| |p2| (QREFELT $ 21)))
        ((QEQCAR |p1| 0)
         (CONS 0 (SPADCALL (QCDR |p1|) (QCAR (QCDR |p2|)) (QREFELT $ 54))))
        ('T
         (SPADCALL (SPADCALL |p1| (CONS 0 (QCAR (QCDR |p2|))) (QREFELT $ 21))
                   (|XRPOLY;lquo1| (SPADCALL (QCDR (QCDR |p1|)) (QREFELT $ 24))
                    (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 24)) $)
                   (QREFELT $ 55))))) 

(DEFUN |XRPOLY;lquo1| (|x| |y| $)
  (PROG (#1=#:G208)
    (RETURN
     (SEQ
      (EXIT
       (COND ((OR (NULL |x|) (NULL |y|)) (|spadConstant| $ 14))
             ('T
              (COND
               ((SPADCALL (QCAR (SPADCALL |x| '|first| (QREFELT $ 58)))
                          (QCAR (SPADCALL |y| '|first| (QREFELT $ 58)))
                          (QREFELT $ 59))
                (|XRPOLY;lquo1| |x| (CDR |y|) $))
               ((SPADCALL (QCAR (SPADCALL |x| '|first| (QREFELT $ 58)))
                          (QCAR (SPADCALL |y| '|first| (QREFELT $ 58)))
                          (QREFELT $ 60))
                (SPADCALL
                 (SPADCALL (QCDR (SPADCALL |x| '|first| (QREFELT $ 58)))
                           (QCDR (SPADCALL |y| '|first| (QREFELT $ 58)))
                           (QREFELT $ 56))
                 (|XRPOLY;lquo1| (CDR |x|) (CDR |y|) $) (QREFELT $ 55)))
               ('T
                (PROGN
                 (LETT #1# (|XRPOLY;lquo1| (CDR |x|) |y| $) |XRPOLY;lquo1|)
                 (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |XRPOLY;coef;2$R;12| (|p1| |p2| $)
  (COND
   ((QEQCAR |p1| 0)
    (QCDR
     (SPADCALL (QCDR |p1|) (CONS 0 (SPADCALL |p2| (QREFELT $ 28)))
               (QREFELT $ 18))))
   ((QEQCAR |p2| 0)
    (QCDR
     (SPADCALL (CONS 0 (QCAR (QCDR |p1|))) (CONS 0 (QCDR |p2|))
               (QREFELT $ 21))))
   ('T
    (SPADCALL
     (QCDR
      (SPADCALL (CONS 0 (QCAR (QCDR |p1|))) (CONS 0 (QCAR (QCDR |p2|)))
                (QREFELT $ 21)))
     (|XRPOLY;coef1| (SPADCALL (QCDR (QCDR |p1|)) (QREFELT $ 24))
      (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 24)) $)
     (QREFELT $ 61))))) 

(DEFUN |XRPOLY;coef1| (|x| |y| $)
  (PROG (#1=#:G217)
    (RETURN
     (SEQ
      (EXIT
       (COND ((OR (NULL |x|) (NULL |y|)) (|spadConstant| $ 15))
             ('T
              (COND
               ((SPADCALL (QCAR (SPADCALL |x| '|first| (QREFELT $ 58)))
                          (QCAR (SPADCALL |y| '|first| (QREFELT $ 58)))
                          (QREFELT $ 59))
                (|XRPOLY;coef1| |x| (CDR |y|) $))
               ((SPADCALL (QCAR (SPADCALL |x| '|first| (QREFELT $ 58)))
                          (QCAR (SPADCALL |y| '|first| (QREFELT $ 58)))
                          (QREFELT $ 60))
                (QCDR
                 (SPADCALL
                  (CONS 0
                        (SPADCALL (QCDR (SPADCALL |x| '|first| (QREFELT $ 58)))
                                  (QCDR (SPADCALL |y| '|first| (QREFELT $ 58)))
                                  (QREFELT $ 27)))
                  (CONS 0 (|XRPOLY;coef1| (CDR |x|) (CDR |y|) $))
                  (QREFELT $ 55))))
               ('T
                (PROGN
                 (LETT #1# (|XRPOLY;coef1| (CDR |x|) |y| $) |XRPOLY;coef1|)
                 (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |XRPOLY;outForm| (|p| $)
  (PROG (|le| #1=#:G225 |t| #2=#:G224)
    (RETURN
     (SEQ
      (LETT |le|
            (PROGN
             (LETT #2# NIL . #3=(|XRPOLY;outForm|))
             (SEQ (LETT |t| NIL . #3#)
                  (LETT #1# (SPADCALL |p| (QREFELT $ 24)) . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (SPADCALL (SPADCALL (QCAR |t|) (QREFELT $ 63))
                                     (SPADCALL (QCDR |t|) (QREFELT $ 64))
                                     (QREFELT $ 65))
                           #2#)
                          . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT (SPADCALL (ELT $ 66) (NREVERSE |le|) (QREFELT $ 69))))))) 

(DEFUN |XRPOLY;coerce;$Of;15| (|p| $)
  (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT $ 70)))
        ((SPADCALL (CONS 0 (QCAR (QCDR |p|))) (|spadConstant| $ 14)
                   (QREFELT $ 13))
         (|XRPOLY;outForm| (QCDR (QCDR |p|)) $))
        ('T
         (SPADCALL (SPADCALL (QCAR (QCDR |p|)) (QREFELT $ 70))
                   (|XRPOLY;outForm| (QCDR (QCDR |p|)) $) (QREFELT $ 66))))) 

(DEFUN |XRPOLY;Zero;$;16| ($) (CONS 0 (|spadConstant| $ 15))) 

(DEFUN |XRPOLY;One;$;17| ($) (CONS 0 (|spadConstant| $ 30))) 

(PUT '|XRPOLY;constant?;$B;18| '|SPADreplace| '(XLAM (|p|) (QEQCAR |p| 0))) 

(DEFUN |XRPOLY;constant?;$B;18| (|p| $) (QEQCAR |p| 0)) 

(DEFUN |XRPOLY;constant;$R;19| (|p| $)
  (COND ((QEQCAR |p| 0) (QCDR |p|)) ('T (QCAR (QCDR |p|))))) 

(DEFUN |XRPOLY;simplifie| (|p| $)
  (COND
   ((SPADCALL (QCDR |p|) (|spadConstant| $ 72) (QREFELT $ 12))
    (CONS 0 (QCAR |p|)))
   ('T (CONS 1 |p|)))) 

(DEFUN |XRPOLY;coerce;VarSet$;21| (|v| $)
  (CONS 1 (CONS (|spadConstant| $ 15) (SPADCALL |v| (QREFELT $ 73))))) 

(PUT '|XRPOLY;coerce;R$;22| '|SPADreplace| '(XLAM (|r|) (CONS 0 |r|))) 

(DEFUN |XRPOLY;coerce;R$;22| (|r| $) (CONS 0 |r|)) 

(DEFUN |XRPOLY;coerce;I$;23| (|n| $) (CONS 0 (SPADCALL |n| (QREFELT $ 77)))) 

(DEFUN |XRPOLY;coerce;Ofm$;24| (|w| $)
  (COND
   ((SPADCALL |w| (|spadConstant| $ 79) (QREFELT $ 80))
    (CONS 0 (|spadConstant| $ 30)))
   ('T
    (SPADCALL (SPADCALL |w| (QREFELT $ 81))
              (SPADCALL (SPADCALL |w| (QREFELT $ 82)) (QREFELT $ 17))
              (QREFELT $ 83))))) 

(DEFUN |XRPOLY;expand;$Xdp;25| (|p| $)
  (PROG (|ep| #1=#:G248 |t| |lt|)
    (RETURN
     (SEQ
      (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT $ 84)))
            ('T
             (SEQ
              (LETT |lt| (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24))
                    . #2=(|XRPOLY;expand;$Xdp;25|))
              (LETT |ep| (SPADCALL (QCAR (QCDR |p|)) (QREFELT $ 84)) . #2#)
              (SEQ (LETT |t| NIL . #2#) (LETT #1# |lt| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |ep|
                           (SPADCALL |ep|
                                     (SPADCALL (QCAR |t|)
                                               (SPADCALL (QCDR |t|)
                                                         (QREFELT $ 85))
                                               (QREFELT $ 86))
                                     (QREFELT $ 87))
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |ep|)))))))) 

(DEFUN |XRPOLY;-;2$;26| (|p| $)
  (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) (QREFELT $ 88))))
        ('T
         (CONS 1
               (CONS
                (QCDR (SPADCALL (CONS 0 (QCAR (QCDR |p|))) (QREFELT $ 89)))
                (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 90))))))) 

(DEFUN |XRPOLY;+;3$;27| (|p1| |p2| $)
  (SEQ
   (COND
    ((QEQCAR |p1| 0)
     (COND
      ((QEQCAR |p2| 0)
       (EXIT (CONS 0 (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 61))))))))
   (EXIT
    (COND
     ((QEQCAR |p1| 0)
      (CONS 1
            (CONS
             (QCDR (SPADCALL |p1| (CONS 0 (QCAR (QCDR |p2|))) (QREFELT $ 55)))
             (QCDR (QCDR |p2|)))))
     ((QEQCAR |p2| 0)
      (CONS 1
            (CONS
             (QCDR (SPADCALL |p2| (CONS 0 (QCAR (QCDR |p1|))) (QREFELT $ 55)))
             (QCDR (QCDR |p1|)))))
     ('T
      (|XRPOLY;simplifie|
       (CONS
        (QCDR
         (SPADCALL (CONS 0 (QCAR (QCDR |p1|))) (CONS 0 (QCAR (QCDR |p2|)))
                   (QREFELT $ 55)))
        (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|)) (QREFELT $ 50)))
       $)))))) 

(DEFUN |XRPOLY;-;3$;28| (|p1| |p2| $)
  (SEQ
   (COND
    ((QEQCAR |p1| 0)
     (COND
      ((QEQCAR |p2| 0)
       (EXIT (CONS 0 (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT $ 91))))))))
   (EXIT
    (COND
     ((QEQCAR |p1| 0)
      (CONS 1
            (CONS
             (QCDR (SPADCALL |p1| (CONS 0 (QCAR (QCDR |p2|))) (QREFELT $ 92)))
             (SPADCALL (QCDR (QCDR |p2|)) (QREFELT $ 90)))))
     ((QEQCAR |p2| 0)
      (CONS 1
            (CONS
             (QCDR (SPADCALL (CONS 0 (QCAR (QCDR |p1|))) |p2| (QREFELT $ 92)))
             (QCDR (QCDR |p1|)))))
     ('T
      (|XRPOLY;simplifie|
       (CONS
        (QCDR
         (SPADCALL (CONS 0 (QCAR (QCDR |p1|))) (CONS 0 (QCAR (QCDR |p2|)))
                   (QREFELT $ 92)))
        (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|)) (QREFELT $ 93)))
       $)))))) 

(DEFUN |XRPOLY;*;I2$;29| (|n| |p| $)
  (COND ((EQL |n| 0) (|spadConstant| $ 14))
        ((QEQCAR |p| 0) (CONS 0 (SPADCALL |n| (QCDR |p|) (QREFELT $ 94))))
        ('T
         (|XRPOLY;simplifie|
          (CONS (QCDR (SPADCALL |n| (CONS 0 (QCAR (QCDR |p|))) (QREFELT $ 95)))
                (SPADCALL |n| (QCDR (QCDR |p|)) (QREFELT $ 96)))
          $)))) 

(DEFUN |XRPOLY;*;R2$;30| (|r| |p| $)
  (COND
   ((SPADCALL |r| (QCDR (|spadConstant| $ 14)) (QREFELT $ 10))
    (|spadConstant| $ 14))
   ((QEQCAR |p| 0) (CONS 0 (SPADCALL |r| (QCDR |p|) (QREFELT $ 54))))
   ('T
    (|XRPOLY;simplifie|
     (CONS (QCDR (SPADCALL |r| (CONS 0 (QCAR (QCDR |p|))) (QREFELT $ 18)))
           (SPADCALL (CONS 0 |r|) (QCDR (QCDR |p|)) (QREFELT $ 97)))
     $)))) 

(DEFUN |XRPOLY;*;$R$;31| (|p| |r| $)
  (COND
   ((SPADCALL |r| (QCDR (|spadConstant| $ 14)) (QREFELT $ 10))
    (|spadConstant| $ 14))
   ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) |r| (QREFELT $ 54))))
   ('T
    (|XRPOLY;simplifie|
     (CONS (QCDR (SPADCALL |r| (CONS 0 (QCAR (QCDR |p|))) (QREFELT $ 18)))
           (SPADCALL (CONS 0 |r|) (QCDR (QCDR |p|)) (QREFELT $ 97)))
     $)))) 

(DEFUN |XRPOLY;*;VarSet2$;32| (|v| |p| $)
  (COND
   ((SPADCALL |p| (|spadConstant| $ 14) (QREFELT $ 13)) (|spadConstant| $ 14))
   ('T
    (CONS 1 (CONS (|spadConstant| $ 15) (SPADCALL |v| |p| (QREFELT $ 98))))))) 

(DEFUN |XRPOLY;*;3$;33| (|p1| |p2| $)
  (PROG (|y| |x|)
    (RETURN
     (SEQ
      (COND ((QEQCAR |p1| 0) (SPADCALL (QCDR |p1|) |p2| (QREFELT $ 18)))
            ((QEQCAR |p2| 0) (SPADCALL |p1| (QCDR |p2|) (QREFELT $ 20)))
            ('T
             (SEQ
              (LETT |x| (SPADCALL (QCDR (QCDR |p1|)) |p2| (QREFELT $ 99))
                    . #1=(|XRPOLY;*;3$;33|))
              (LETT |y|
                    (SPADCALL (CONS 0 (QCAR (QCDR |p1|))) (QCDR (QCDR |p2|))
                              (QREFELT $ 97))
                    . #1#)
              (EXIT
               (|XRPOLY;simplifie|
                (CONS
                 (QCDR
                  (SPADCALL (CONS 0 (QCAR (QCDR |p1|)))
                            (CONS 0 (QCAR (QCDR |p2|))) (QREFELT $ 21)))
                 (SPADCALL |x| |y| (QREFELT $ 50)))
                $))))))))) 

(DEFUN |XRPOLY;lquo;$VarSet$;34| (|p| |v| $)
  (COND ((QEQCAR |p| 0) (|spadConstant| $ 14))
        ('T (SPADCALL (QCDR (QCDR |p|)) |v| (QREFELT $ 100))))) 

(DEFUN |XRPOLY;lquo;$Ofm$;35| (|p| |w| $)
  (COND ((SPADCALL |w| (|spadConstant| $ 79) (QREFELT $ 80)) |p|)
        ('T
         (SPADCALL (SPADCALL |p| (SPADCALL |w| (QREFELT $ 81)) (QREFELT $ 101))
                   (SPADCALL |w| (QREFELT $ 82)) (QREFELT $ 102))))) 

(DEFUN |XRPOLY;rquo;$VarSet$;36| (|p| |v| $)
  (PROG (|x| |a| #1=#:G270 |t| #2=#:G269)
    (RETURN
     (SEQ
      (COND ((QEQCAR |p| 0) (|spadConstant| $ 14))
            ('T
             (SEQ
              (LETT |x|
                    (|XRPOLY;construct|
                     (PROGN
                      (LETT #2# NIL . #3=(|XRPOLY;rquo;$VarSet$;36|))
                      (SEQ (LETT |t| NIL . #3#)
                           (LETT #1#
                                 (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24))
                                 . #3#)
                           G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL
                                (LETT |a|
                                      (SPADCALL (QCDR |t|) |v| (QREFELT $ 103))
                                      . #3#)
                                (|spadConstant| $ 14) (QREFELT $ 26))
                               (LETT #2# (CONS (CONS (QCAR |t|) |a|) #2#)
                                     . #3#)))))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     $)
                    . #3#)
              (EXIT
               (|XRPOLY;simplifie|
                (CONS
                 (SPADCALL (SPADCALL (QCDR (QCDR |p|)) |v| (QREFELT $ 100))
                           (QREFELT $ 28))
                 |x|)
                $))))))))) 

(DEFUN |XRPOLY;rquo;$Ofm$;37| (|p| |w| $)
  (COND ((SPADCALL |w| (|spadConstant| $ 79) (QREFELT $ 80)) |p|)
        ('T
         (SPADCALL (SPADCALL |p| (SPADCALL |w| (QREFELT $ 82)) (QREFELT $ 104))
                   (SPADCALL |w| (QREFELT $ 81)) (QREFELT $ 103))))) 

(DEFUN |XRPOLY;coef;$OfmR;38| (|p| |w| $)
  (SPADCALL (SPADCALL |p| |w| (QREFELT $ 102)) (QREFELT $ 28))) 

(DEFUN |XRPOLY;quasiRegular?;$B;39| (|p| $)
  (COND
   ((QEQCAR |p| 0)
    (SPADCALL |p| (CONS 0 (|spadConstant| $ 15)) (QREFELT $ 13)))
   ('T
    (SPADCALL (CONS 0 (QCAR (QCDR |p|))) (CONS 0 (|spadConstant| $ 15))
              (QREFELT $ 13))))) 

(DEFUN |XRPOLY;quasiRegular;2$;40| (|p| $)
  (COND ((QEQCAR |p| 0) (|spadConstant| $ 14))
        ('T (CONS 1 (CONS (|spadConstant| $ 15) (QCDR (QCDR |p|))))))) 

(DEFUN |XRPOLY;characteristic;Nni;41| ($) (SPADCALL (QREFELT $ 108))) 

(DEFUN |XRPOLY;recip;$U;42| (|p| $)
  (COND ((QEQCAR |p| 0) (SPADCALL (CONS 0 (QCDR |p|)) (QREFELT $ 111)))
        ('T (CONS 1 "failed")))) 

(DEFUN |XRPOLY;mindeg;$Ofm;43| (|p| $)
  (PROG (#1=#:G282 #2=#:G281 #3=#:G283 #4=#:G286 |t|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR |p| 0)
        (COND
         ((SPADCALL |p| (|spadConstant| $ 14) (QREFELT $ 13))
          (|error| "XRPOLY.mindeg: zero polynomial !!"))
         (#5='T (|spadConstant| $ 79))))
       ((SPADCALL (CONS 0 (QCAR (QCDR |p|))) (|spadConstant| $ 14)
                  (QREFELT $ 26))
        (|spadConstant| $ 79))
       (#5#
        (PROGN
         (LETT #1# NIL . #6=(|XRPOLY;mindeg;$Ofm;43|))
         (SEQ (LETT |t| NIL . #6#)
              (LETT #4# (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24)) . #6#) G190
              (COND
               ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #6#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (PROGN
                 (LETT #3#
                       (SPADCALL (QCAR |t|)
                                 (SPADCALL (QCDR |t|) (QREFELT $ 112))
                                 (QREFELT $ 113))
                       . #6#)
                 (COND
                  (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 114)) . #6#))
                  ('T (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
              (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
         (COND (#1# #2#) (#5# (|IdentityError| '|min|)))))))))) 

(DEFUN |XRPOLY;maxdeg;$Ofm;44| (|p| $)
  (PROG (#1=#:G289 #2=#:G288 #3=#:G290 #4=#:G292 |t|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR |p| 0)
        (COND
         ((SPADCALL |p| (|spadConstant| $ 14) (QREFELT $ 13))
          (|error| "XRPOLY.maxdeg: zero polynomial !!"))
         (#5='T (|spadConstant| $ 79))))
       (#5#
        (PROGN
         (LETT #1# NIL . #6=(|XRPOLY;maxdeg;$Ofm;44|))
         (SEQ (LETT |t| NIL . #6#)
              (LETT #4# (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24)) . #6#) G190
              (COND
               ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #6#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (PROGN
                 (LETT #3#
                       (SPADCALL (QCAR |t|)
                                 (SPADCALL (QCDR |t|) (QREFELT $ 115))
                                 (QREFELT $ 113))
                       . #6#)
                 (COND
                  (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 116)) . #6#))
                  ('T (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
              (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
         (COND (#1# #2#) (#5# (|IdentityError| '|max|)))))))))) 

(DEFUN |XRPOLY;degree;$Nni;45| (|p| $)
  (COND
   ((SPADCALL |p| (|spadConstant| $ 14) (QREFELT $ 13))
    (|error| "XRPOLY.degree: zero polynomial !!"))
   ('T (SPADCALL (SPADCALL |p| (QREFELT $ 115)) (QREFELT $ 117))))) 

(DEFUN |XRPOLY;map;M2$;46| (|fn| |p| $)
  (PROG (|x| |a| #1=#:G300 |t| #2=#:G299)
    (RETURN
     (SEQ
      (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) |fn|)))
            ('T
             (SEQ
              (LETT |x|
                    (|XRPOLY;construct|
                     (PROGN
                      (LETT #2# NIL . #3=(|XRPOLY;map;M2$;46|))
                      (SEQ (LETT |t| NIL . #3#)
                           (LETT #1#
                                 (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24))
                                 . #3#)
                           G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL
                                (LETT |a|
                                      (SPADCALL |fn| (QCDR |t|)
                                                (QREFELT $ 120))
                                      . #3#)
                                (CONS 0 (|spadConstant| $ 15)) (QREFELT $ 26))
                               (LETT #2# (CONS (CONS (QCAR |t|) |a|) #2#)
                                     . #3#)))))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     $)
                    . #3#)
              (EXIT
               (|XRPOLY;simplifie| (CONS (SPADCALL (QCAR (QCDR |p|)) |fn|) |x|)
                $))))))))) 

(DEFUN |XRPOLY;varList;$L;47| (|p| $)
  (PROG (|lv| #1=#:G310 |t| #2=#:G309 #3=#:G303 #4=#:G302 #5=#:G304 #6=#:G308)
    (RETURN
     (SEQ
      (COND ((QEQCAR |p| 0) NIL)
            (#7='T
             (SEQ
              (LETT |lv|
                    (PROGN
                     (LETT #3# NIL . #8=(|XRPOLY;varList;$L;47|))
                     (SEQ (LETT |t| NIL . #8#)
                          (LETT #6# (SPADCALL (QCDR (QCDR |p|)) (QREFELT $ 24))
                                . #8#)
                          G190
                          (COND
                           ((OR (ATOM #6#)
                                (PROGN (LETT |t| (CAR #6#) . #8#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #5# (SPADCALL (QCDR |t|) (QREFELT $ 121))
                                   . #8#)
                             (COND
                              (#3#
                               (LETT #4# (SPADCALL #4# #5# (QREFELT $ 122))
                                     . #8#))
                              ('T
                               (PROGN
                                (LETT #4# #5# . #8#)
                                (LETT #3# 'T . #8#)))))))
                          (LETT #6# (CDR #6#) . #8#) (GO G190) G191 (EXIT NIL))
                     (COND (#3# #4#) (#7# (|IdentityError| '|setUnion|))))
                    . #8#)
              (LETT |lv|
                    (SPADCALL |lv|
                              (PROGN
                               (LETT #2# NIL . #8#)
                               (SEQ (LETT |t| NIL . #8#)
                                    (LETT #1#
                                          (SPADCALL (QCDR (QCDR |p|))
                                                    (QREFELT $ 24))
                                          . #8#)
                                    G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |t| (CAR #1#) . #8#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2# (CONS (QCAR |t|) #2#) . #8#)))
                                    (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT $ 122))
                    . #8#)
              (EXIT (SPADCALL |lv| (QREFELT $ 123)))))))))) 

(DECLAIM (NOTINLINE |XRecursivePolynomial;|)) 

(DEFUN |XRecursivePolynomial| (&REST #1=#:G315)
  (PROG ()
    (RETURN
     (PROG (#2=#:G316)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|XRecursivePolynomial|)
                                           '|domainEqualList|)
                . #3=(|XRecursivePolynomial|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |XRecursivePolynomial;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|XRecursivePolynomial|))))))))))) 

(DEFUN |XRecursivePolynomial;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|XRecursivePolynomial|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|XRecursivePolynomial| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 130) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2|
                                                         '(|noZeroDivisors|))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|XRecursivePolynomial| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8
                (|Union| |#2|
                         (|Record| (|:| |c0| |#2|)
                                   (|:| |reg| (|FreeModule| $ |#1|)))))
      (COND
       ((|testBitVector| |pv$| 2)
        (PROGN
         (QSETREFV $ 46 (CONS (|dispatchFunction| |XRPOLY;sh;$Nni$;7|) $))
         (QSETREFV $ 48 (CONS (|dispatchFunction| |XRPOLY;sh;3$;8|) $)))))
      $)))) 

(MAKEPROP '|XRecursivePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|Boolean|) (0 . =) (|FreeModule| $$ 6) (6 . =) |XRPOLY;=;2$B;2|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |XRPOLY;Zero;$;16|) $))
              (12 . |Zero|) (|OrderedFreeMonoid| 6) |XRPOLY;coerce;Ofm$;24|
              |XRPOLY;*;R2$;30| |XRPOLY;monom;OfmR$;3| |XRPOLY;*;$R$;31|
              |XRPOLY;*;3$;33| (|Record| (|:| |k| 6) (|:| |c| $$)) (|List| 22)
              (16 . |listOfTerms|) |XRPOLY;rquo;3$;4| (21 . ~=)
              |XRPOLY;coef;2$R;12| |XRPOLY;constant;$R;19|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |XRPOLY;One;$;17|) $))
              (27 . |One|) (|NonNegativeInteger|) |XRPOLY;trunc;$Nni$;5|
              (|XDistributedPolynomial| 6 7) (31 . |constant?|)
              (36 . |constant|) (41 . >) (|List| 6) (47 . |varList|)
              (|Mapping| 9 6 6) (52 . |sort|) (58 . |lquo|) (64 . |Zero|)
              (68 . ~=) |XRPOLY;unexpand;Xdp$;6| (74 . ^) (80 . |sh|) (86 . *)
              (92 . |sh|) (98 . ^) (104 . +) (|Record| (|:| |k| 6) (|:| |c| $))
              (|List| 51) |XRPOLY;RemainderList;$L;9| (110 . *)
              |XRPOLY;+;3$;27| |XRPOLY;lquo;3$;10| '"first" (116 . |elt|)
              (122 . <) (128 . =) (134 . +) (|OutputForm|) (140 . |coerce|)
              |XRPOLY;coerce;$Of;15| (145 . *) (151 . +) (|Mapping| 62 62 62)
              (|List| 62) (157 . |reduce|) (163 . |coerce|)
              |XRPOLY;constant?;$B;18| (168 . |Zero|) (172 . |coerce|)
              |XRPOLY;coerce;VarSet$;21| |XRPOLY;coerce;R$;22| (|Integer|)
              (177 . |coerce|) |XRPOLY;coerce;I$;23| (182 . |One|) (186 . =)
              (192 . |first|) (197 . |rest|) |XRPOLY;*;VarSet2$;32|
              (202 . |coerce|) |XRPOLY;expand;$Xdp;25| (207 . *) (213 . +)
              (219 . -) |XRPOLY;-;2$;26| (224 . -) (229 . -) |XRPOLY;-;3$;28|
              (235 . -) (241 . *) |XRPOLY;*;I2$;29| (247 . *) (253 . *)
              (259 . *) (265 . *) (271 . |coefficient|)
              |XRPOLY;lquo;$VarSet$;34| |XRPOLY;lquo;$Ofm$;35|
              |XRPOLY;rquo;$VarSet$;36| |XRPOLY;rquo;$Ofm$;37|
              |XRPOLY;coef;$OfmR;38| |XRPOLY;quasiRegular?;$B;39|
              |XRPOLY;quasiRegular;2$;40| (277 . |characteristic|)
              |XRPOLY;characteristic;Nni;41| (|Union| $ '"failed")
              |XRPOLY;recip;$U;42| |XRPOLY;mindeg;$Ofm;43| (281 . *)
              (287 . |min|) |XRPOLY;maxdeg;$Ofm;44| (293 . |max|)
              (299 . |length|) |XRPOLY;degree;$Nni;45| (|Mapping| 7 7)
              |XRPOLY;map;M2$;46| |XRPOLY;varList;$L;47| (304 . |setUnion|)
              (310 . |sort!|) (|Record| (|:| |k| 16) (|:| |c| 7))
              (|Union| 16 '"failed") (|PositiveInteger|) (|HashState|)
              (|String|) (|SingleInteger|))
           '#(~= 315 |zero?| 321 |varList| 326 |unexpand| 331 |trunc| 336
              |subtractIfCan| 342 |sh| 348 |sample| 360 |rquo| 364
              |retractIfCan| 382 |retract| 387 |recip| 392 |quasiRegular?| 397
              |quasiRegular| 402 |one?| 407 |monomial?| 412 |monom| 417
              |mirror| 423 |mindegTerm| 428 |mindeg| 433 |maxdeg| 438 |map| 443
              |lquo| 449 |latex| 467 |hashUpdate!| 472 |hash| 478 |expand| 483
              |degree| 488 |constant?| 493 |constant| 498 |coerce| 503 |coef|
              528 |characteristic| 540 ^ 544 |Zero| 556 |RemainderList| 560
              |One| 565 = 569 - 575 + 586 * 592)
           'NIL
           (CONS
            (|makeByteWordVec2| 2
                                '(0 0 0 2 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 1))
            (CONS
             '#(NIL NIL NIL |Algebra&| |Module&| NIL |Ring&| NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL |AbelianMonoid&| |Monoid&| NIL
                |SemiGroup&| |AbelianSemiGroup&| |SetCategory&|
                |RetractableTo&| NIL |BasicType&| NIL NIL)
             (CONS
              '#((|XPolynomialsCat| 6 7) (|XFreeAlgebra| 6 7) (|XAlgebra| 7)
                 (|Algebra| 7) (|Module| 7) (|BiModule| 7 7) (|Ring|)
                 (|LeftModule| 7) (|RightModule| 7) (|Rng|) (|LeftModule| $$)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|SetCategory|)
                 (|RetractableTo| (|OrderedFreeMonoid| 6)) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 62) (|noZeroDivisors|))
              (|makeByteWordVec2| 129
                                  '(2 7 9 0 0 10 2 11 9 0 0 12 0 7 0 15 1 11 23
                                    0 24 2 0 9 0 0 26 0 7 0 30 1 33 9 0 34 1 33
                                    7 0 35 2 6 9 0 0 36 1 33 37 0 38 2 37 0 39
                                    0 40 2 33 0 0 6 41 0 33 0 42 2 33 9 0 0 43
                                    2 7 0 0 31 45 2 0 0 0 31 46 2 0 0 31 0 47 2
                                    0 0 0 0 48 2 0 0 0 31 49 2 11 0 0 0 50 2 7
                                    0 0 0 54 2 23 22 0 57 58 2 6 9 0 0 59 2 6 9
                                    0 0 60 2 7 0 0 0 61 1 6 62 0 63 2 62 0 0 0
                                    65 2 62 0 0 0 66 2 68 62 67 0 69 1 7 62 0
                                    70 0 11 0 72 1 11 0 6 73 1 7 0 76 77 0 16 0
                                    79 2 16 9 0 0 80 1 16 6 0 81 1 16 0 0 82 1
                                    33 0 7 84 2 33 0 6 0 86 2 33 0 0 0 87 1 7 0
                                    0 88 1 11 0 0 90 2 7 0 0 0 91 2 11 0 0 0 93
                                    2 7 0 76 0 94 2 11 0 76 0 96 2 11 0 2 0 97
                                    2 11 0 6 2 98 2 11 0 0 2 99 2 11 2 0 6 100
                                    0 7 31 108 2 16 0 6 0 113 2 16 0 0 0 114 2
                                    16 0 0 0 116 1 16 31 0 117 2 37 0 0 0 122 1
                                    37 0 0 123 2 0 9 0 0 26 1 0 9 0 1 1 0 37 0
                                    121 1 0 0 33 44 2 0 0 0 31 32 2 0 110 0 0 1
                                    2 2 0 0 0 48 2 2 0 0 31 46 0 0 0 1 2 0 0 0
                                    0 25 2 0 0 0 6 103 2 0 0 0 16 104 1 0 125 0
                                    1 1 0 16 0 1 1 0 110 0 111 1 0 9 0 106 1 0
                                    0 0 107 1 0 9 0 1 1 0 9 0 1 2 0 0 16 7 19 1
                                    0 0 0 1 1 0 124 0 1 1 0 16 0 112 1 0 16 0
                                    115 2 0 0 119 0 120 2 0 0 0 16 102 2 0 0 0
                                    0 56 2 0 0 0 6 101 1 0 128 0 1 2 0 127 127
                                    0 1 1 0 129 0 1 1 0 33 0 85 1 0 31 0 118 1
                                    0 9 0 71 1 0 7 0 28 1 0 0 6 74 1 0 0 16 17
                                    1 0 0 76 78 1 0 0 7 75 1 0 62 0 64 2 0 7 0
                                    0 27 2 0 7 0 16 105 0 0 31 109 2 0 0 0 31
                                    49 2 0 0 0 126 1 0 0 0 14 1 0 52 0 53 0 0 0
                                    29 2 0 9 0 0 13 2 0 0 0 0 92 1 0 0 0 89 2 0
                                    0 0 0 55 2 0 0 6 0 83 2 0 0 7 0 18 2 0 0 0
                                    7 20 2 0 0 76 0 95 2 0 0 0 0 21 2 0 0 31 0
                                    47 2 0 0 126 0 1)))))
           '|lookupComplete|)) 
