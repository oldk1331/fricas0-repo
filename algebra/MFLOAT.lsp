
(/VERSIONCHECK 2) 

(DEFUN |MFLOAT;retractIfCan;$U;1| (|u| $)
  (CONS 0
        (SPADCALL (SPADCALL |u| (QREFELT $ 16))
                  (SPADCALL (SPADCALL (QREFELT $ 8) 1 (QREFELT $ 21))
                            (SPADCALL |u| (QREFELT $ 22)) (QREFELT $ 23))
                  (QREFELT $ 24)))) 

(DEFUN |MFLOAT;wholePart;$I;2| (|u| $)
  (PROG (|f| |exp| |man|)
    (RETURN
     (SEQ
      (LETT |man| (SPADCALL |u| (QREFELT $ 16)) . #1=(|MFLOAT;wholePart;$I;2|))
      (LETT |exp| (SPADCALL |u| (QREFELT $ 22)) . #1#)
      (EXIT
       (LETT |f|
             (COND
              ((SPADCALL |exp| (QREFELT $ 28))
               (* |man| (SPADCALL (QREFELT $ 8) |exp| (QREFELT $ 13))))
              ((ZEROP |exp|) |man|)
              ('T
               (SPADCALL
                (SPADCALL |man|
                          (SPADCALL (QREFELT $ 8) (- |exp|) (QREFELT $ 13))
                          (QREFELT $ 21))
                (QREFELT $ 29))))
             . #1#)))))) 

(DEFUN |MFLOAT;normalise| (|u| $)
  (PROG (|man| |exp| |q1| BBF |sgn| BB)
    (RETURN
     (SEQ (LETT |exp| (SPADCALL |u| (QREFELT $ 22)) . #1=(|MFLOAT;normalise|))
          (LETT |man| (SPADCALL |u| (QREFELT $ 16)) . #1#)
          (LETT BB (QREFELT $ 8) . #1#)
          (LETT |sgn| (SPADCALL |man| (QREFELT $ 31)) . #1#)
          (LETT |man| (ABS |man|) . #1#)
          (EXIT
           (COND ((ZEROP |man|) (CONS 0 0))
                 (#2='T
                  (SEQ
                   (COND
                    ((< |man| (QREFELT $ 14))
                     (SEQ G190
                          (COND ((NULL (< |man| (QREFELT $ 14))) (GO G191)))
                          (SEQ (LETT |exp| (- |exp| 1) . #1#)
                               (EXIT (LETT |man| (* |man| BB) . #1#)))
                          NIL (GO G190) G191 (EXIT NIL))))
                   (COND
                    ((SPADCALL |man| (QREFELT $ 14) (QREFELT $ 34))
                     (SEQ (LETT |q1| (SPADCALL |man| 1 (QREFELT $ 21)) . #1#)
                          (LETT BBF (SPADCALL BB 1 (QREFELT $ 21)) . #1#)
                          (SEQ G190
                               (COND
                                ((NULL
                                  (SPADCALL (SPADCALL |q1| (QREFELT $ 29))
                                            (QREFELT $ 14) (QREFELT $ 34)))
                                 (GO G191)))
                               (SEQ
                                (LETT |q1| (SPADCALL |q1| BBF (QREFELT $ 35))
                                      . #1#)
                                (EXIT (LETT |exp| (+ |exp| 1) . #1#)))
                               NIL (GO G190) G191 (EXIT NIL))
                          (EXIT
                           (LETT |man| (|MFLOAT;locRound| |q1| $) . #1#)))))
                   (EXIT
                    (COND
                     ((SPADCALL |sgn| (QREFELT $ 28))
                      (|MFLOAT;checkExponent| (CONS |man| |exp|) $))
                     (#2#
                      (|MFLOAT;checkExponent| (CONS (- |man|) |exp|)
                       $)))))))))))) 

(PUT '|MFLOAT;mantissa;$I;4| '|SPADreplace| 'QCAR) 

(DEFUN |MFLOAT;mantissa;$I;4| (|u| $) (QCAR |u|)) 

(PUT '|MFLOAT;exponent;$I;5| '|SPADreplace| 'QCDR) 

(DEFUN |MFLOAT;exponent;$I;5| (|u| $) (QCDR |u|)) 

(DEFUN |MFLOAT;newPower| (|base| |prec| $)
  (PROG (|power| |current| |target|)
    (RETURN
     (SEQ (LETT |power| 1 . #1=(|MFLOAT;newPower|))
          (LETT |target| (SPADCALL 10 |prec| (QREFELT $ 13)) . #1#)
          (LETT |current| (SPADCALL (QREFELT $ 36)) . #1#)
          (SEQ G190
               (COND
                ((NULL
                  (<
                   (LETT |current| (* |current| (SPADCALL (QREFELT $ 36)))
                         . #1#)
                   |target|))
                 (GO G191)))
               (SEQ (EXIT (LETT |power| (+ |power| 1) . #1#))) NIL (GO G190)
               G191 (EXIT NIL))
          (SETELT $ 11 |power|)
          (SETELT $ 14 (SPADCALL (QREFELT $ 8) (QREFELT $ 11) (QREFELT $ 13)))
          (EXIT (SPADCALL (QREFELT $ 39))))))) 

(DEFUN |MFLOAT;changeBase;2IPi$;7| (|exp| |man| |base| $)
  (PROG (|newMan| |f| |newExp| BB |sign|)
    (RETURN
     (SEQ (LETT |newExp| 0 . #1=(|MFLOAT;changeBase;2IPi$;7|))
          (LETT |f|
                (SPADCALL |man|
                          (SPADCALL (SPADCALL 2 (QREFELT $ 40)) |exp|
                                    (QREFELT $ 23))
                          (QREFELT $ 24))
                . #1#)
          (LETT |sign| (SPADCALL |f| (QREFELT $ 41)) . #1#)
          (LETT |f| (SPADCALL |f| (QREFELT $ 42)) . #1#)
          (LETT |newMan| (SPADCALL |f| (QREFELT $ 29)) . #1#)
          (EXIT
           (COND ((SPADCALL |f| (QREFELT $ 43)) (CONS 0 0))
                 ('T
                  (SEQ (LETT BB (SPADCALL (QREFELT $ 8) (QREFELT $ 40)) . #1#)
                       (COND
                        ((< |newMan| (QREFELT $ 14))
                         (SEQ G190
                              (COND
                               ((NULL (< |newMan| (QREFELT $ 14))) (GO G191)))
                              (SEQ (LETT |newExp| (- |newExp| 1) . #1#)
                                   (LETT |f| (SPADCALL |f| BB (QREFELT $ 44))
                                         . #1#)
                                   (EXIT
                                    (LETT |newMan|
                                          (SPADCALL |f| (QREFELT $ 29))
                                          . #1#)))
                              NIL (GO G190) G191 (EXIT NIL))))
                       (COND
                        ((SPADCALL |newMan| (QREFELT $ 14) (QREFELT $ 34))
                         (SEQ G190
                              (COND
                               ((NULL
                                 (SPADCALL |newMan| (QREFELT $ 14)
                                           (QREFELT $ 34)))
                                (GO G191)))
                              (SEQ (LETT |newExp| (+ |newExp| 1) . #1#)
                                   (LETT |f| (SPADCALL |f| BB (QREFELT $ 35))
                                         . #1#)
                                   (EXIT
                                    (LETT |newMan|
                                          (SPADCALL |f| (QREFELT $ 29))
                                          . #1#)))
                              NIL (GO G190) G191 (EXIT NIL))))
                       (EXIT (CONS (* |sign| |newMan|) |newExp|)))))))))) 

(DEFUN |MFLOAT;checkExponent| (|u| $)
  (PROG (|message|)
    (RETURN
     (SEQ
      (COND
       ((OR (< (SPADCALL |u| (QREFELT $ 22)) (QREFELT $ 9))
            (SPADCALL (SPADCALL |u| (QREFELT $ 22)) (QREFELT $ 10)
                      (QREFELT $ 34)))
        (SEQ
         (LETT |message|
               (SPADCALL
                (LIST "Exponent out of range: " (STRINGIMAGE (QREFELT $ 9))
                      ".." (STRINGIMAGE (QREFELT $ 10)))
                (QREFELT $ 48))
               |MFLOAT;checkExponent|)
         (EXIT (|error| (SPADCALL |message| (QREFELT $ 50))))))
       ('T |u|)))))) 

(DEFUN |MFLOAT;coerce;$Of;9| (|u| $)
  (SPADCALL (SPADCALL |u| (QREFELT $ 51)) (QREFELT $ 52))) 

(DEFUN |MFLOAT;coerce;Mi$;10| (|u| $)
  (|MFLOAT;checkExponent|
   (SPADCALL 0 (SPADCALL |u| (QREFELT $ 55)) 10 (QREFELT $ 45)) $)) 

(DEFUN |MFLOAT;coerce;$F;11| (|u| $)
  (PROG (|r| |oldDigits|)
    (RETURN
     (SEQ
      (LETT |oldDigits| (SPADCALL (QREFELT $ 7) (QREFELT $ 57))
            . #1=(|MFLOAT;coerce;$F;11|))
      (LETT |r|
            (SPADCALL (SPADCALL |u| (QREFELT $ 16))
                      (SPADCALL |u| (QREFELT $ 22)) (QREFELT $ 8)
                      (QREFELT $ 58))
            . #1#)
      (SPADCALL |oldDigits| (QREFELT $ 57)) (EXIT |r|))))) 

(DEFUN |MFLOAT;coerce;F$;12| (|u| $)
  (|MFLOAT;checkExponent|
   (SPADCALL (SPADCALL |u| (QREFELT $ 59)) (SPADCALL |u| (QREFELT $ 60))
             (SPADCALL (QREFELT $ 37)) (QREFELT $ 45))
   $)) 

(DEFUN |MFLOAT;coerce;I$;13| (|u| $)
  (|MFLOAT;checkExponent| (SPADCALL 0 |u| 10 (QREFELT $ 45)) $)) 

(DEFUN |MFLOAT;coerce;F$;14| (|u| $)
  (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT $ 63)) (QREFELT $ 64))
            (SPADCALL (SPADCALL |u| (QREFELT $ 65)) (QREFELT $ 64))
            (QREFELT $ 66))) 

(DEFUN |MFLOAT;retract;$F;15| (|u| $)
  (PROG (|value|)
    (RETURN
     (SEQ (LETT |value| (SPADCALL |u| (QREFELT $ 26)) |MFLOAT;retract;$F;15|)
          (EXIT
           (COND
            ((QEQCAR |value| 1)
             (|error| "Cannot retract to a Fraction Integer"))
            ('T (QCDR |value|)))))))) 

(DEFUN |MFLOAT;retract;$F;16| (|u| $) (SPADCALL |u| (QREFELT $ 51))) 

(DEFUN |MFLOAT;retractIfCan;$U;17| (|u| $)
  (CONS 0 (SPADCALL |u| (QREFELT $ 51)))) 

(DEFUN |MFLOAT;retractIfCan;$U;18| (|u| $)
  (PROG (|value|)
    (RETURN
     (SEQ
      (LETT |value|
            (SPADCALL (SPADCALL |u| (QREFELT $ 16))
                      (SPADCALL (SPADCALL (QREFELT $ 8) (QREFELT $ 40))
                                (SPADCALL |u| (QREFELT $ 22)) (QREFELT $ 23))
                      (QREFELT $ 24))
            |MFLOAT;retractIfCan;$U;18|)
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |value| (QREFELT $ 72)) (QREFELT $ 43))
         (CONS 0 (SPADCALL |value| (QREFELT $ 29))))
        ('T (CONS 1 "failed")))))))) 

(DEFUN |MFLOAT;retract;$I;19| (|u| $)
  (PROG (#1=#:G221 |result|)
    (RETURN
     (SEQ
      (LETT |result| (SPADCALL |u| (QREFELT $ 74))
            . #2=(|MFLOAT;retract;$I;19|))
      (EXIT
       (COND
        ((SPADCALL |result| (CONS 1 "failed") (QREFELT $ 75))
         (|error| "Not an Integer"))
        ('T
         (PROG2 (LETT #1# |result| . #2#)
             (QCDR #1#)
           (|check_union| (QEQCAR #1# 0) (|Integer|) #1#))))))))) 

(DEFUN |MFLOAT;precision;2Pi;20| (|p| $)
  (PROG (|old|)
    (RETURN
     (SEQ (LETT |old| (QREFELT $ 7) |MFLOAT;precision;2Pi;20|)
          (|MFLOAT;newPower| (QREFELT $ 8) |p| $) (SETELT $ 7 |p|)
          (EXIT |old|))))) 

(DEFUN |MFLOAT;precision;Pi;21| ($) (QREFELT $ 7)) 

(DEFUN |MFLOAT;base;2Pi;22| (|b| $)
  (PROG (|old|)
    (RETURN
     (SEQ (LETT |old| |b| |MFLOAT;base;2Pi;22|)
          (|MFLOAT;newPower| |b| (QREFELT $ 7) $) (SETELT $ 8 |b|)
          (EXIT |old|))))) 

(DEFUN |MFLOAT;base;Pi;23| ($) (QREFELT $ 8)) 

(DEFUN |MFLOAT;maximumExponent;2I;24| (|u| $)
  (PROG (|old|)
    (RETURN
     (SEQ (LETT |old| (QREFELT $ 10) |MFLOAT;maximumExponent;2I;24|)
          (SETELT $ 10 |u|) (EXIT |old|))))) 

(DEFUN |MFLOAT;maximumExponent;I;25| ($) (QREFELT $ 10)) 

(DEFUN |MFLOAT;minimumExponent;2I;26| (|u| $)
  (PROG (|old|)
    (RETURN
     (SEQ (LETT |old| (QREFELT $ 9) |MFLOAT;minimumExponent;2I;26|)
          (SETELT $ 9 |u|) (EXIT |old|))))) 

(DEFUN |MFLOAT;minimumExponent;I;27| ($) (QREFELT $ 9)) 

(PUT '|MFLOAT;Zero;$;28| '|SPADreplace| '(XLAM NIL (CONS 0 0))) 

(DEFUN |MFLOAT;Zero;$;28| ($) (CONS 0 0)) 

(DEFUN |MFLOAT;One;$;29| ($) (SPADCALL 0 1 10 (QREFELT $ 45))) 

(DEFUN |MFLOAT;zero?;$B;30| (|u| $) (SPADCALL |u| (CONS 0 0) (QREFELT $ 84))) 

(DEFUN |MFLOAT;locRound| (|x| $)
  (COND
   ((SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 72)) (QREFELT $ 42))
              (SPADCALL 1 2 (QREFELT $ 21)) (QREFELT $ 86))
    (+ (SPADCALL |x| (QREFELT $ 29)) (SPADCALL |x| (QREFELT $ 41))))
   ('T (SPADCALL |x| (QREFELT $ 29))))) 

(DEFUN |MFLOAT;recip;$U;32| (|f1| $)
  (COND ((SPADCALL |f1| (QREFELT $ 85)) (CONS 1 "failed"))
        ('T
         (CONS 0
               (|MFLOAT;normalise|
                (CONS
                 (|MFLOAT;locRound|
                  (SPADCALL
                   (SPADCALL (QREFELT $ 8) (* 2 (QREFELT $ 11)) (QREFELT $ 13))
                   (SPADCALL |f1| (QREFELT $ 16)) (QREFELT $ 21))
                  $)
                 (- (+ (SPADCALL |f1| (QREFELT $ 22)) (* 2 (QREFELT $ 11)))))
                $))))) 

(DEFUN |MFLOAT;*;3$;33| (|f1| |f2| $)
  (|MFLOAT;normalise|
   (CONS (* (SPADCALL |f1| (QREFELT $ 16)) (SPADCALL |f2| (QREFELT $ 16)))
         (+ (SPADCALL |f1| (QREFELT $ 22)) (SPADCALL |f2| (QREFELT $ 22))))
   $)) 

(DEFUN |MFLOAT;^;$F$;34| (|f1| |p| $)
  (SPADCALL (SPADCALL (SPADCALL |f1| (QREFELT $ 51)) |p| (QREFELT $ 90))
            (QREFELT $ 61))) 

(DEFUN |MFLOAT;/;3$;35| (|f1| |f2| $)
  (COND ((SPADCALL |f2| (QREFELT $ 85)) (|error| "division by zero"))
        ((SPADCALL |f1| (QREFELT $ 85)) (|spadConstant| $ 32))
        ((SPADCALL |f1| |f2| (QREFELT $ 84)) (|spadConstant| $ 17))
        ('T
         (|MFLOAT;normalise|
          (CONS
           (|MFLOAT;locRound|
            (SPADCALL
             (* (SPADCALL |f1| (QREFELT $ 16))
                (SPADCALL (QREFELT $ 8) (* 2 (QREFELT $ 11)) (QREFELT $ 13)))
             (SPADCALL |f2| (QREFELT $ 16)) (QREFELT $ 21))
            $)
           (- (SPADCALL |f1| (QREFELT $ 22))
              (+ (SPADCALL |f2| (QREFELT $ 22)) (* 2 (QREFELT $ 11)))))
          $)))) 

(DEFUN |MFLOAT;inv;2$;36| (|f1| $)
  (SPADCALL (|spadConstant| $ 17) |f1| (QREFELT $ 66))) 

(DEFUN |MFLOAT;exquo;2$U;37| (|f1| |f2| $)
  (CONS 0 (SPADCALL |f1| |f2| (QREFELT $ 66)))) 

(DEFUN |MFLOAT;divide;2$R;38| (|f1| |f2| $)
  (CONS (SPADCALL |f1| |f2| (QREFELT $ 66)) (|spadConstant| $ 32))) 

(DEFUN |MFLOAT;quo;3$;39| (|f1| |f2| $) (SPADCALL |f1| |f2| (QREFELT $ 66))) 

(DEFUN |MFLOAT;rem;3$;40| (|f1| |f2| $) (|spadConstant| $ 32)) 

(DEFUN |MFLOAT;*;I2$;41| (|u| |f1| $)
  (|MFLOAT;normalise|
   (CONS (* |u| (SPADCALL |f1| (QREFELT $ 16))) (SPADCALL |f1| (QREFELT $ 22)))
   $)) 

(DEFUN |MFLOAT;=;2$B;42| (|f1| |f2| $)
  (COND
   ((EQL (SPADCALL |f1| (QREFELT $ 16)) (SPADCALL |f2| (QREFELT $ 16)))
    (EQL (SPADCALL |f1| (QREFELT $ 22)) (SPADCALL |f2| (QREFELT $ 22))))
   ('T 'NIL))) 

(DEFUN |MFLOAT;+;3$;43| (|f1| |f2| $)
  (PROG (|e2| |e1| |m2| |m1|)
    (RETURN
     (SEQ (LETT |m1| (SPADCALL |f1| (QREFELT $ 16)) . #1=(|MFLOAT;+;3$;43|))
          (LETT |m2| (SPADCALL |f2| (QREFELT $ 16)) . #1#)
          (LETT |e1| (SPADCALL |f1| (QREFELT $ 22)) . #1#)
          (LETT |e2| (SPADCALL |f2| (QREFELT $ 22)) . #1#)
          (EXIT
           (COND
            ((SPADCALL |e1| |e2| (QREFELT $ 34))
             (COND
              ((SPADCALL |e1| (+ (+ |e2| (QREFELT $ 11)) 2) (QREFELT $ 34))
               (COND ((SPADCALL |f1| (QREFELT $ 85)) |f2|) (#2='T |f1|)))
              (#2#
               (|MFLOAT;normalise|
                (CONS (+ (* |m1| (EXPT (QREFELT $ 8) (- |e1| |e2|))) |m2|)
                      |e2|)
                $))))
            ((SPADCALL |e2| (+ (+ |e1| (QREFELT $ 11)) 2) (QREFELT $ 34))
             (COND ((SPADCALL |f2| (QREFELT $ 85)) |f1|) (#2# |f2|)))
            (#2#
             (|MFLOAT;normalise|
              (CONS (+ (* |m2| (EXPT (QREFELT $ 8) (- |e2| |e1|))) |m1|) |e1|)
              $)))))))) 

(DEFUN |MFLOAT;-;2$;44| (|f1| $)
  (CONS (- (SPADCALL |f1| (QREFELT $ 16))) (SPADCALL |f1| (QREFELT $ 22)))) 

(DEFUN |MFLOAT;-;3$;45| (|f1| |f2| $)
  (SPADCALL |f1| (SPADCALL |f2| (QREFELT $ 100)) (QREFELT $ 99))) 

(DEFUN |MFLOAT;<;2$B;46| (|f1| |f2| $)
  (PROG (|e2| |e1| |m2| |m1|)
    (RETURN
     (SEQ (LETT |m1| (SPADCALL |f1| (QREFELT $ 16)) . #1=(|MFLOAT;<;2$B;46|))
          (LETT |m2| (SPADCALL |f2| (QREFELT $ 16)) . #1#)
          (LETT |e1| (SPADCALL |f1| (QREFELT $ 22)) . #1#)
          (LETT |e2| (SPADCALL |f2| (QREFELT $ 22)) . #1#)
          (EXIT
           (COND
            ((EQL (SPADCALL |m1| (QREFELT $ 31))
                  (SPADCALL |m2| (QREFELT $ 31)))
             (COND ((< |e1| |e2|) 'T)
                   (#2='T
                    (SEQ
                     (COND ((EQL |e1| |e2|) (COND ((< |m1| |m2|) (EXIT 'T)))))
                     (EXIT 'NIL)))))
            ((EQL (SPADCALL |m1| (QREFELT $ 31)) 1) 'NIL)
            (#2#
             (SEQ
              (COND
               ((EQL (SPADCALL |m1| (QREFELT $ 31)) 0)
                (COND ((EQL (SPADCALL |m2| (QREFELT $ 31)) -1) (EXIT 'NIL)))))
              (EXIT 'T))))))))) 

(PUT '|MFLOAT;characteristic;Nni;47| '|SPADreplace| '(XLAM NIL 0)) 

(DEFUN |MFLOAT;characteristic;Nni;47| ($) 0) 

(DEFUN |MachineFloat| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G301)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|MachineFloat|)
                . #2=(|MachineFloat|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|MachineFloat|
                         (LIST (CONS NIL (CONS 1 (|MachineFloat;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#) (HREM |$ConstructorCache| '|MachineFloat|))))))))))) 

(DEFUN |MachineFloat;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|MachineFloat|) . #1=(|MachineFloat|))
      (LETT $ (GETREFV 117) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|MachineFloat| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (AND (|HasCategory| $ '(|arbitraryPrecision|)) (|augmentPredVector| $ 1))
      (AND (|not| (|HasCategory| $ '(|arbitraryExponent|)))
           (|not| (|HasCategory| $ '(|arbitraryPrecision|)))
           (|augmentPredVector| $ 2))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6
                (|Record| (|:| |mantissa| (|Integer|))
                          (|:| |exponent| (|Integer|))))
      (QSETREFV $ 7 16)
      (QSETREFV $ 8 2)
      (QSETREFV $ 9 -1021)
      (QSETREFV $ 10 1024)
      (QSETREFV $ 11 53)
      (QSETREFV $ 14 (SPADCALL (QREFELT $ 8) (QREFELT $ 11) (QREFELT $ 13)))
      $)))) 

(MAKEPROP '|MachineFloat| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| 'P 'B 'EMIN 'EMAX 'POWER
              (|PositiveInteger|) (0 . ^) 'MMAX (|Integer|)
              |MFLOAT;mantissa;$I;4|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MFLOAT;One;$;29|) $))
              (|Float|) (6 . |One|) (|Fraction| 15) (10 . /)
              |MFLOAT;exponent;$I;5| (16 . ^) (22 . *) (|Union| 20 '"failed")
              |MFLOAT;retractIfCan;$U;1| (|Boolean|) (28 . |positive?|)
              (33 . |wholePart|) |MFLOAT;wholePart;$I;2| (38 . |sign|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MFLOAT;Zero;$;28|) $))
              (43 . |Zero|) (47 . >) (53 . /) |MFLOAT;base;Pi;23| (59 . |base|)
              (|Void|) (63 . |void|) (67 . |coerce|) (72 . |sign|) (77 . |abs|)
              (82 . |zero?|) (87 . *) |MFLOAT;changeBase;2IPi$;7| (|List| $)
              (|String|) (93 . |concat|) (|OutputForm|) (98 . |coerce|)
              |MFLOAT;coerce;$F;11| (103 . |coerce|) |MFLOAT;coerce;$Of;9|
              (|MachineInteger|) (108 . |retract|) |MFLOAT;coerce;Mi$;10|
              (113 . |digits|) (118 . |float|) (125 . |exponent|)
              (130 . |mantissa|) |MFLOAT;coerce;F$;12| (135 . |coerce|)
              (140 . |numer|) |MFLOAT;coerce;I$;13| (145 . |denom|)
              |MFLOAT;/;3$;35| |MFLOAT;coerce;F$;14| |MFLOAT;retract;$F;15|
              |MFLOAT;retract;$F;16| (|Union| 18 '"failed")
              |MFLOAT;retractIfCan;$U;17| (150 . |fractionPart|)
              (|Union| 15 '"failed") |MFLOAT;retractIfCan;$U;18| (155 . =)
              |MFLOAT;retract;$I;19| |MFLOAT;precision;2Pi;20|
              |MFLOAT;precision;Pi;21| |MFLOAT;base;2Pi;22|
              |MFLOAT;maximumExponent;2I;24| |MFLOAT;maximumExponent;I;25|
              |MFLOAT;minimumExponent;2I;26| |MFLOAT;minimumExponent;I;27|
              |MFLOAT;=;2$B;42| |MFLOAT;zero?;$B;30| (161 . >=)
              (|Union| $ '"failed") |MFLOAT;recip;$U;32| |MFLOAT;*;3$;33|
              (167 . ^) |MFLOAT;^;$F$;34| |MFLOAT;inv;2$;36|
              |MFLOAT;exquo;2$U;37|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              |MFLOAT;divide;2$R;38| |MFLOAT;quo;3$;39| |MFLOAT;rem;3$;40|
              |MFLOAT;*;I2$;41| |MFLOAT;+;3$;43| |MFLOAT;-;2$;44|
              |MFLOAT;-;3$;45| |MFLOAT;<;2$B;46| (|NonNegativeInteger|)
              |MFLOAT;characteristic;Nni;47| (|PatternMatchResult| 18 $)
              (|Pattern| 18) (|DoubleFloat|) (|Factored| $)
              (|Union| 46 '#1="failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 110 '#1#)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |coef| 46) (|:| |generator| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|SingleInteger|))
           '#(~= 173 |zero?| 179 |wholePart| 184 |unitNormal| 189
              |unitCanonical| 194 |unit?| 199 |truncate| 204 |toString| 209
              |subtractIfCan| 215 |squareFreePart| 221 |squareFree| 226 |sqrt|
              231 |smaller?| 236 |sizeLess?| 242 |sign| 248 |sample| 253
              |round| 257 |retractIfCan| 262 |retract| 277 |rem| 292 |recip|
              298 |quo| 303 |principalIdeal| 309 |prime?| 314 |precision| 319
              |positive?| 328 |patternMatch| 333 |order| 340 |one?| 345
              |nthRoot| 350 |norm| 356 |negative?| 361 |multiEuclidean| 366
              |minimumExponent| 372 |min| 381 |maximumExponent| 391 |max| 400
              |mantissa| 410 |lcm| 415 |latex| 426 |inv| 431
              |increasePrecision| 436 |hash| 441 |gcdPolynomial| 446 |gcd| 452
              |fractionPart| 463 |floor| 468 |float| 473 |factor| 486
              |extendedEuclidean| 491 |exquo| 504 |expressIdealMember| 510
              |exponent| 516 |euclideanSize| 521 |divide| 526 |digits| 532
              |decreasePrecision| 541 |convert| 546 |coerce| 561
              |characteristic| 606 |changeBase| 610 |ceiling| 617 |bits| 622
              |base| 631 |associates?| 640 |abs| 646 ^ 651 |Zero| 675 |One| 679
              >= 683 > 689 = 695 <= 701 < 707 / 713 - 719 + 730 * 736)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|FloatingPointSystem&| |RealNumberSystem&| |Field&|
                |EuclideanDomain&| NIL |UniqueFactorizationDomain&| NIL
                |GcdDomain&| |DivisionRing&| |IntegralDomain&| |Algebra&|
                |Algebra&| NIL |OrderedRing&| |Module&| NIL NIL |Module&| NIL
                NIL NIL |Ring&| NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL
                NIL NIL |OrderedSet&| |AbelianMonoid&| |Monoid&| NIL NIL NIL
                |SemiGroup&| |AbelianSemiGroup&| NIL |SetCategory&|
                |RetractableTo&| NIL NIL |RadicalCategory&| |RetractableTo&|
                |RetractableTo&| NIL NIL |PartialOrder&| NIL NIL NIL NIL NIL
                |BasicType&| NIL)
             (CONS
              '#((|FloatingPointSystem|) (|RealNumberSystem|) (|Field|)
                 (|EuclideanDomain|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|FortranMachineTypeCategory|)
                 (|GcdDomain|) (|DivisionRing|) (|IntegralDomain|)
                 (|Algebra| 20) (|Algebra| $$) (|CharacteristicZero|)
                 (|OrderedRing|) (|Module| 20) (|EntireRing|)
                 (|CommutativeRing|) (|Module| $$) (|OrderedAbelianGroup|)
                 (|BiModule| 20 20) (|BiModule| $$ $$) (|Ring|)
                 (|OrderedCancellationAbelianMonoid|) (|RightModule| 20)
                 (|LeftModule| 20) (|LeftModule| $$) (|Rng|) (|RightModule| $$)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|SemiRing|) (|OrderedSet|) (|AbelianMonoid|) (|Monoid|)
                 (|SemiRng|) (|PatternMatchable| 18) (|Comparable|)
                 (|SemiGroup|) (|AbelianSemiGroup|) (|RealConstant|)
                 (|SetCategory|) (|RetractableTo| 18) (|Approximate|)
                 (|ConvertibleTo| 106) (|RadicalCategory|) (|RetractableTo| 20)
                 (|RetractableTo| 15) (|ConvertibleTo| 18)
                 (|ConvertibleTo| 107) (|PartialOrder|) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 49))
              (|makeByteWordVec2| 116
                                  '(2 12 0 0 12 13 0 18 0 19 2 20 0 15 15 21 2
                                    20 0 0 15 23 2 20 0 15 0 24 1 15 27 0 28 1
                                    20 15 0 29 1 15 15 0 31 0 18 0 33 2 15 27 0
                                    0 34 2 20 0 0 0 35 0 18 12 37 0 38 0 39 1
                                    20 0 15 40 1 20 15 0 41 1 20 0 0 42 1 20 27
                                    0 43 2 20 0 0 0 44 1 47 0 46 48 1 47 49 0
                                    50 1 18 49 0 52 1 54 15 0 55 1 18 12 12 57
                                    3 18 0 15 15 12 58 1 18 15 0 59 1 18 15 0
                                    60 1 0 0 15 62 1 20 15 0 63 1 20 15 0 65 1
                                    20 0 0 72 2 73 27 0 0 75 2 20 27 0 0 86 2
                                    18 0 0 20 90 2 0 27 0 0 1 1 0 27 0 85 1 0
                                    15 0 30 1 0 115 0 1 1 0 0 0 1 1 0 27 0 1 1
                                    0 0 0 1 2 0 47 0 103 1 2 0 87 0 0 1 1 0 0 0
                                    1 1 0 108 0 1 1 0 0 0 1 2 0 27 0 0 1 2 0 27
                                    0 0 1 1 0 15 0 1 0 0 0 1 1 0 0 0 1 1 0 70 0
                                    71 1 0 25 0 26 1 0 73 0 74 1 0 18 0 69 1 0
                                    20 0 68 1 0 15 0 76 2 0 0 0 0 97 1 0 87 0
                                    88 2 0 0 0 0 96 1 0 114 46 1 1 0 27 0 1 1 0
                                    12 12 77 0 0 12 78 1 0 27 0 1 3 0 105 0 106
                                    105 1 1 0 15 0 1 1 0 27 0 1 2 0 0 0 15 1 1
                                    0 0 0 1 1 0 27 0 1 2 0 109 46 0 1 1 0 15 15
                                    82 0 0 15 83 0 2 0 1 2 0 0 0 0 1 1 0 15 15
                                    80 0 0 15 81 0 2 0 1 2 0 0 0 0 1 1 0 15 0
                                    16 2 0 0 0 0 1 1 0 0 46 1 1 0 47 0 1 1 0 0
                                    0 92 1 1 12 15 1 1 0 116 0 1 2 0 113 113
                                    113 1 2 0 0 0 0 1 1 0 0 46 1 1 0 0 0 1 1 0
                                    0 0 1 2 0 0 15 15 1 3 0 0 15 15 12 1 1 0
                                    108 0 1 3 0 111 0 0 0 1 2 0 112 0 0 1 2 0
                                    87 0 0 93 2 0 109 46 0 1 1 0 15 0 22 1 0
                                    103 0 1 2 0 94 0 0 95 1 1 12 12 1 0 0 12 1
                                    1 1 12 15 1 1 0 106 0 1 1 0 107 0 1 1 0 18
                                    0 1 1 0 18 0 51 1 0 0 54 56 1 0 0 18 61 1 0
                                    0 20 67 1 0 0 15 64 1 0 0 20 67 1 0 0 15 64
                                    1 0 0 0 1 1 0 49 0 53 0 0 103 104 3 0 0 15
                                    15 12 45 1 0 0 0 1 1 1 12 12 1 0 0 12 1 1 0
                                    12 12 79 0 0 12 36 2 0 27 0 0 1 1 0 0 0 1 2
                                    0 0 0 20 91 2 0 0 0 15 1 2 0 0 0 103 1 2 0
                                    0 0 12 1 0 0 0 32 0 0 0 17 2 0 27 0 0 1 2 0
                                    27 0 0 1 2 0 27 0 0 84 2 0 27 0 0 1 2 0 27
                                    0 0 102 2 0 0 0 0 66 1 0 0 0 100 2 0 0 0 0
                                    101 2 0 0 0 0 99 2 0 0 0 20 1 2 0 0 20 0 1
                                    2 0 0 0 0 89 2 0 0 15 0 98 2 0 0 103 0 1 2
                                    0 0 12 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|MachineFloat| 'NILADIC T) 
