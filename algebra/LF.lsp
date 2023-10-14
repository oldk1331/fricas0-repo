
(/VERSIONCHECK 2) 

(DEFUN |LF;Si;2F;1| (|x| $) (SPADCALL (QREFELT $ 21) |x| (QREFELT $ 29))) 

(DEFUN |LF;Ci;2F;2| (|x| $) (SPADCALL (QREFELT $ 22) |x| (QREFELT $ 29))) 

(DEFUN |LF;Shi;2F;3| (|x| $) (SPADCALL (QREFELT $ 23) |x| (QREFELT $ 29))) 

(DEFUN |LF;Chi;2F;4| (|x| $) (SPADCALL (QREFELT $ 24) |x| (QREFELT $ 29))) 

(DEFUN |LF;Ei;2F;5| (|x| $) (SPADCALL (QREFELT $ 19) |x| (QREFELT $ 29))) 

(DEFUN |LF;erf;2F;6| (|x| $) (SPADCALL (QREFELT $ 26) |x| (QREFELT $ 29))) 

(DEFUN |LF;li;2F;7| (|x| $) (SPADCALL (QREFELT $ 20) |x| (QREFELT $ 29))) 

(DEFUN |LF;dilog;2F;8| (|x| $) (SPADCALL (QREFELT $ 25) |x| (QREFELT $ 29))) 

(DEFUN |LF;fresnelS;2F;9| (|x| $) (SPADCALL (QREFELT $ 27) |x| (QREFELT $ 29))) 

(DEFUN |LF;fresnelC;2F;10| (|x| $) (SPADCALL (QREFELT $ 28) |x| (QREFELT $ 29))) 

(DEFUN |LF;belong?;BoB;11| (|op| $)
  (SPADCALL |op| (QREFELT $ 8) (QREFELT $ 41))) 

(DEFUN |LF;isi| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 43)) (|spadConstant| $ 44))
        ('T (SPADCALL (QREFELT $ 21) |x| (QREFELT $ 45))))) 

(DEFUN |LF;ici| (|x| $) (SPADCALL (QREFELT $ 22) |x| (QREFELT $ 45))) 

(DEFUN |LF;ishi| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 43)) (|spadConstant| $ 44))
        ('T (SPADCALL (QREFELT $ 23) |x| (QREFELT $ 45))))) 

(DEFUN |LF;ichi| (|x| $) (SPADCALL (QREFELT $ 24) |x| (QREFELT $ 45))) 

(DEFUN |LF;ierf| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 43)) (|spadConstant| $ 44))
        ('T (SPADCALL (QREFELT $ 26) |x| (QREFELT $ 45))))) 

(DEFUN |LF;ili2| (|x| $)
  (COND
   ((SPADCALL |x| (|spadConstant| $ 47) (QREFELT $ 48)) (|spadConstant| $ 44))
   ('T (SPADCALL (QREFELT $ 25) |x| (QREFELT $ 45))))) 

(DEFUN |LF;ifis| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 43)) (|spadConstant| $ 44))
        ('T (SPADCALL (QREFELT $ 27) |x| (QREFELT $ 45))))) 

(DEFUN |LF;ific| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 43)) (|spadConstant| $ 44))
        ('T (SPADCALL (QREFELT $ 28) |x| (QREFELT $ 45))))) 

(DEFUN |LF;integrand| (|l| $)
  (SPADCALL (|SPADfirst| |l|)
            (SPADCALL (SPADCALL |l| (QREFELT $ 50)) (QREFELT $ 52))
            (SPADCALL |l| (QREFELT $ 53)) (QREFELT $ 54))) 

(DEFUN |LF;integral;FSF;21| (|f| |x| $)
  (PROG (|k|)
    (RETURN
     (SPADCALL (QREFELT $ 16)
               (LIST
                (SPADCALL |f|
                          (LETT |k| (SPADCALL |x| (QREFELT $ 56))
                                |LF;integral;FSF;21|)
                          (QREFELT $ 12) (QREFELT $ 54))
                (QREFELT $ 12) (SPADCALL |k| (QREFELT $ 57)))
               (QREFELT $ 59))))) 

(DEFUN |LF;iint| (|l| $)
  (COND ((SPADCALL (|SPADfirst| |l|) (QREFELT $ 43)) (|spadConstant| $ 44))
        ('T (SPADCALL (QREFELT $ 16) |l| (QREFELT $ 61))))) 

(DEFUN |LF;ddint| (|l| $)
  (SPADCALL
   (SPADCALL (SPADCALL (|LF;integrand| |l| $) (QREFELT $ 63))
             (SPADCALL (SPADCALL '|d| (QREFELT $ 64))
                       (SPADCALL (SPADCALL |l| (QREFELT $ 53)) (QREFELT $ 63))
                       (QREFELT $ 65))
             (QREFELT $ 66))
   (SPADCALL (SPADCALL (CDR |l|) (QREFELT $ 53)) (QREFELT $ 63))
   (SPADCALL (SPADCALL (CDR (CDR |l|)) (QREFELT $ 53)) (QREFELT $ 63))
   (QREFELT $ 67))) 

(DEFUN |LF;eqint| (|k1| |k2| $)
  (PROG (|res| #1=#:G158 |a2| |a1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |a1| (SPADCALL |k1| (QREFELT $ 68)) . #2=(|LF;eqint|))
            (LETT |a2| (SPADCALL |k2| (QREFELT $ 68)) . #2#)
            (LETT |res|
                  (SPADCALL (SPADCALL |k1| (QREFELT $ 69))
                            (SPADCALL |k2| (QREFELT $ 69)) (QREFELT $ 70))
                  . #2#)
            (COND ((NULL |res|) (PROGN (LETT #1# |res| . #2#) (GO #1#))))
            (LETT |res| (SPADCALL |a1| |a2| (QREFELT $ 71)) . #2#)
            (COND (|res| (PROGN (LETT #1# |res| . #2#) (GO #1#))))
            (EXIT
             (LETT |res|
                   (COND
                    ((SPADCALL (SPADCALL |a1| 3 (QREFELT $ 73))
                               (SPADCALL |a2| 3 (QREFELT $ 73)) (QREFELT $ 48))
                     (SPADCALL
                      (SPADCALL (SPADCALL |a1| 1 (QREFELT $ 73))
                                (LIST
                                 (SPADCALL (SPADCALL |a1| 2 (QREFELT $ 73))
                                           (QREFELT $ 52)))
                                (LIST (SPADCALL |a2| 2 (QREFELT $ 73)))
                                (QREFELT $ 75))
                      (SPADCALL |a2| 1 (QREFELT $ 73)) (QREFELT $ 48)))
                    ('T 'NIL))
                   . #2#))))
      #1# (EXIT #1#))))) 

(DEFUN |LF;dvint| (|l| |x| $)
  (PROG (|k|)
    (RETURN
     (SEQ
      (LETT |k| (SPADCALL (SPADCALL |l| (QREFELT $ 50)) (QREFELT $ 52))
            |LF;dvint|)
      (EXIT
       (SPADCALL
        (SPADCALL (SPADCALL (SPADCALL |l| (QREFELT $ 53)) |x| (QREFELT $ 76))
                  (|LF;integrand| |l| $) (QREFELT $ 77))
        (SPADCALL (QREFELT $ 16)
                  (LIST (SPADCALL (|SPADfirst| |l|) |x| (QREFELT $ 76))
                        (SPADCALL |l| (QREFELT $ 50))
                        (SPADCALL |l| (QREFELT $ 53)))
                  (QREFELT $ 59))
        (QREFELT $ 78))))))) 

(DEFUN |LF;iiint| (|l| $)
  (PROG (|lval| |n| |nu|)
    (RETURN
     (SEQ
      (LETT |nu| (SPADCALL (LENGTH |l|) 2 (QREFELT $ 81)) . #1=(|LF;iiint|))
      (EXIT
       (COND ((QEQCAR |nu| 1) (|error| "impossible"))
             (#2='T
              (SEQ (LETT |n| (QCDR |nu|) . #1#)
                   (LETT |lval| (SPADCALL |l| |n| (QREFELT $ 82)) . #1#)
                   (EXIT
                    (COND
                     ((SPADCALL (ELT $ 43) |lval| (QREFELT $ 84))
                      (|spadConstant| $ 44))
                     (#2#
                      (SPADCALL (QREFELT $ 17) |l| (QREFELT $ 61))))))))))))) 

(DEFUN |LF;dviint| (|l| |v| $)
  (PROG (|m| |lv| #1=#:G176 |vf| #2=#:G175 |lvf| |n| |nu|)
    (RETURN
     (SEQ
      (LETT |nu| (SPADCALL (LENGTH |l|) 2 (QREFELT $ 81)) . #3=(|LF;dviint|))
      (EXIT
       (COND ((QEQCAR |nu| 1) (|error| "impossible"))
             (#4='T
              (SEQ (LETT |n| (QCDR |nu|) . #3#)
                   (LETT |lvf| (SPADCALL |l| |n| (QREFELT $ 85)) . #3#)
                   (LETT |lv|
                         (PROGN
                          (LETT #2# NIL . #3#)
                          (SEQ (LETT |vf| NIL . #3#) (LETT #1# |lvf| . #3#)
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |vf| (CAR #1#) . #3#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS (SPADCALL |vf| (QREFELT $ 86))
                                             #2#)
                                       . #3#)))
                               (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         . #3#)
                   (LETT |m| (SPADCALL |v| |lv| (QREFELT $ 88)) . #3#)
                   (EXIT
                    (COND ((EQL |m| 0) (|spadConstant| $ 44))
                          (#4#
                           (SPADCALL |l| (+ |n| |m|) (QREFELT $ 73))))))))))))) 

(DEFUN |LF;dvdint| (|l| |x| $)
  (PROG (|g| |f| |h| |k| |d| |y|)
    (RETURN
     (SEQ
      (COND
       ((EQUAL |x|
               (SPADCALL
                (LETT |y| (SPADCALL |l| (QREFELT $ 53)) . #1=(|LF;dvdint|))
                (QREFELT $ 86)))
        (|spadConstant| $ 44))
       ('T
        (SEQ
         (LETT |k|
               (SPADCALL (LETT |d| (SPADCALL |l| (QREFELT $ 50)) . #1#)
                         (QREFELT $ 52))
               . #1#)
         (EXIT
          (SPADCALL
           (SPADCALL
            (SPADCALL
             (SPADCALL
              (LETT |h| (SPADCALL (CDR (CDR |l|)) (QREFELT $ 53)) . #1#) |x|
              (QREFELT $ 76))
             (SPADCALL (LETT |f| (|SPADfirst| |l|) . #1#) |k| |h|
                       (QREFELT $ 54))
             (QREFELT $ 77))
            (SPADCALL
             (SPADCALL (LETT |g| (SPADCALL (CDR |l|) (QREFELT $ 53)) . #1#) |x|
                       (QREFELT $ 76))
             (SPADCALL |f| |k| |g| (QREFELT $ 54)) (QREFELT $ 77))
            (QREFELT $ 90))
           (SPADCALL (QREFELT $ 18)
                     (LIST (SPADCALL |f| |x| (QREFELT $ 76)) |d| |y| |g| |h|)
                     (QREFELT $ 59))
           (QREFELT $ 78)))))))))) 

(DEFUN |LF;integral;FSbF;29| (|f| |s| $)
  (PROG (|x|)
    (RETURN
     (SEQ
      (LETT |x| (SPADCALL (SPADCALL |s| (QREFELT $ 92)) (QREFELT $ 56))
            |LF;integral;FSbF;29|)
      (EXIT
       (SPADCALL (QREFELT $ 18)
                 (LIST (SPADCALL |f| |x| (QREFELT $ 12) (QREFELT $ 54))
                       (QREFELT $ 12) (SPADCALL |x| (QREFELT $ 57))
                       (SPADCALL (SPADCALL |s| (QREFELT $ 94)) (QREFELT $ 95))
                       (SPADCALL (SPADCALL |s| (QREFELT $ 94)) (QREFELT $ 96)))
                 (QREFELT $ 59))))))) 

(DEFUN |LF;ili| (|x| $)
  (COND
   ((SPADCALL |x| (|spadConstant| $ 47) (QREFELT $ 48))
    (|error| "Invalid argument"))
   ((SPADCALL |x| '|exp| (QREFELT $ 98))
    (SPADCALL
     (|SPADfirst| (SPADCALL (SPADCALL |x| (QREFELT $ 52)) (QREFELT $ 68)))
     (QREFELT $ 34)))
   ('T (SPADCALL (QREFELT $ 20) |x| (QREFELT $ 45))))) 

(DEFUN |LF;iei| (|x| $)
  (COND
   ((SPADCALL |x| (|spadConstant| $ 44) (QREFELT $ 48))
    (|error| "Invalid argument"))
   ((SPADCALL |x| '|log| (QREFELT $ 98))
    (SPADCALL
     (|SPADfirst| (SPADCALL (SPADCALL |x| (QREFELT $ 52)) (QREFELT $ 68)))
     (QREFELT $ 36)))
   ('T (SPADCALL (QREFELT $ 19) |x| (QREFELT $ 45))))) 

(DEFUN |LF;operator;2Bo;32| (|op| $)
  (COND ((SPADCALL |op| '|integral| (QREFELT $ 99)) (QREFELT $ 16))
        ((SPADCALL |op| '|%iint| (QREFELT $ 99)) (QREFELT $ 17))
        ((SPADCALL |op| '|%defint| (QREFELT $ 99)) (QREFELT $ 18))
        ((SPADCALL |op| '|Ei| (QREFELT $ 99)) (QREFELT $ 19))
        ((SPADCALL |op| '|Si| (QREFELT $ 99)) (QREFELT $ 21))
        ((SPADCALL |op| '|Ci| (QREFELT $ 99)) (QREFELT $ 22))
        ((SPADCALL |op| '|Shi| (QREFELT $ 99)) (QREFELT $ 23))
        ((SPADCALL |op| '|Chi| (QREFELT $ 99)) (QREFELT $ 24))
        ((SPADCALL |op| '|li| (QREFELT $ 99)) (QREFELT $ 20))
        ((SPADCALL |op| '|erf| (QREFELT $ 99)) (QREFELT $ 26))
        ((SPADCALL |op| '|dilog| (QREFELT $ 99)) (QREFELT $ 25))
        ((SPADCALL |op| '|fresnelC| (QREFELT $ 99)) (QREFELT $ 27))
        ((SPADCALL |op| '|fresnelS| (QREFELT $ 99)) (QREFELT $ 28))
        ('T (|error| "Not a Liouvillian operator")))) 

(DEFUN |LF;pint| (|l| $)
  (SPADCALL (CONS (SPADCALL '|integral| (QREFELT $ 125)) |l|) (QREFELT $ 126))) 

(DEFUN |LF;inint| (|l| $)
  (PROG (|r2|)
    (RETURN
     (SEQ
      (LETT |r2|
            (SPADCALL
             (LIST (SPADCALL '|::| (QREFELT $ 125))
                   (SPADCALL (SPADCALL |l| (QREFELT $ 53)) (QREFELT $ 127))
                   (SPADCALL '|Symbol| (QREFELT $ 125)))
             (QREFELT $ 126))
            |LF;inint|)
      (EXIT
       (|LF;pint| (LIST (SPADCALL (|LF;integrand| |l| $) (QREFELT $ 127)) |r2|)
        $)))))) 

(DEFUN |LF;indint| (|l| $)
  (|LF;pint|
   (LIST (SPADCALL (|LF;integrand| |l| $) (QREFELT $ 127))
         (SPADCALL
          (CONS (SPADCALL '= (QREFELT $ 125))
                (LIST (SPADCALL (SPADCALL |l| (QREFELT $ 53)) (QREFELT $ 127))
                      (SPADCALL
                       (CONS (SPADCALL 'SEGMENT (QREFELT $ 125))
                             (LIST
                              (SPADCALL (SPADCALL (CDR |l|) (QREFELT $ 53))
                                        (QREFELT $ 127))
                              (SPADCALL
                               (SPADCALL (CDR (CDR |l|)) (QREFELT $ 53))
                               (QREFELT $ 127))))
                       (QREFELT $ 126))))
          (QREFELT $ 126)))
   $)) 

(DECLAIM (NOTINLINE |LiouvillianFunction;|)) 

(DEFUN |LiouvillianFunction| (&REST #1=#:G258)
  (PROG ()
    (RETURN
     (PROG (#2=#:G259)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|LiouvillianFunction|)
                                           '|domainEqualList|)
                . #3=(|LiouvillianFunction|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |LiouvillianFunction;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|LiouvillianFunction|))))))))))) 

(DEFUN |LiouvillianFunction;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|LiouvillianFunction|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|LiouvillianFunction| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 128) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|LiouvillianFunction| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 '|prim|)
      (QSETREFV $ 12 (SPADCALL (SPADCALL (QREFELT $ 10)) (QREFELT $ 11)))
      (QSETREFV $ 16 (SPADCALL '|integral| (QREFELT $ 15)))
      (QSETREFV $ 17 (SPADCALL '|%iint| (QREFELT $ 15)))
      (QSETREFV $ 18 (SPADCALL '|%defint| (QREFELT $ 15)))
      (QSETREFV $ 19 (SPADCALL '|Ei| (QREFELT $ 15)))
      (QSETREFV $ 20 (SPADCALL '|li| (QREFELT $ 15)))
      (QSETREFV $ 21 (SPADCALL '|Si| (QREFELT $ 15)))
      (QSETREFV $ 22 (SPADCALL '|Ci| (QREFELT $ 15)))
      (QSETREFV $ 23 (SPADCALL '|Shi| (QREFELT $ 15)))
      (QSETREFV $ 24 (SPADCALL '|Chi| (QREFELT $ 15)))
      (QSETREFV $ 25 (SPADCALL '|dilog| (QREFELT $ 15)))
      (QSETREFV $ 26 (SPADCALL '|erf| (QREFELT $ 15)))
      (QSETREFV $ 27 (SPADCALL '|fresnelS| (QREFELT $ 15)))
      (QSETREFV $ 28 (SPADCALL '|fresnelC| (QREFELT $ 15)))
      (SPADCALL (QREFELT $ 19) (CONS (|function| |LF;iei|) $) (QREFELT $ 103))
      (SPADCALL (QREFELT $ 20) (CONS (|function| |LF;ili|) $) (QREFELT $ 103))
      (SPADCALL (QREFELT $ 21) (CONS (|function| |LF;isi|) $) (QREFELT $ 103))
      (SPADCALL (QREFELT $ 22) (CONS (|function| |LF;ici|) $) (QREFELT $ 103))
      (SPADCALL (QREFELT $ 23) (CONS (|function| |LF;ishi|) $) (QREFELT $ 103))
      (SPADCALL (QREFELT $ 24) (CONS (|function| |LF;ichi|) $) (QREFELT $ 103))
      (SPADCALL (QREFELT $ 26) (CONS (|function| |LF;ierf|) $) (QREFELT $ 103))
      (SPADCALL (QREFELT $ 25) (CONS (|function| |LF;ili2|) $) (QREFELT $ 103))
      (SPADCALL (QREFELT $ 27) (CONS (|function| |LF;ifis|) $) (QREFELT $ 103))
      (SPADCALL (QREFELT $ 28) (CONS (|function| |LF;ific|) $) (QREFELT $ 103))
      (SPADCALL (QREFELT $ 16) (CONS (|function| |LF;iint|) $) (QREFELT $ 105))
      (SPADCALL (QREFELT $ 17) (CONS (|function| |LF;iiint|) $)
                (QREFELT $ 105))
      (SPADCALL (QREFELT $ 21) (CONS #'|LiouvillianFunction!0| $)
                (QREFELT $ 108))
      (SPADCALL (QREFELT $ 22) (CONS #'|LiouvillianFunction!1| $)
                (QREFELT $ 108))
      (SPADCALL (QREFELT $ 23) (CONS #'|LiouvillianFunction!2| $)
                (QREFELT $ 108))
      (SPADCALL (QREFELT $ 24) (CONS #'|LiouvillianFunction!3| $)
                (QREFELT $ 108))
      (SPADCALL (QREFELT $ 19) (CONS #'|LiouvillianFunction!4| $)
                (QREFELT $ 108))
      (SPADCALL (QREFELT $ 20) (CONS #'|LiouvillianFunction!5| $)
                (QREFELT $ 108))
      (SPADCALL (QREFELT $ 26) (CONS #'|LiouvillianFunction!6| $)
                (QREFELT $ 108))
      (SPADCALL (QREFELT $ 25) (CONS #'|LiouvillianFunction!7| $)
                (QREFELT $ 108))
      (SPADCALL (QREFELT $ 27) (CONS #'|LiouvillianFunction!8| $)
                (QREFELT $ 108))
      (SPADCALL (QREFELT $ 28) (CONS #'|LiouvillianFunction!9| $)
                (QREFELT $ 108))
      (SPADCALL (QREFELT $ 16) '|%specialEqual|
                (CONS (|function| |LF;eqint|) $) (QREFELT $ 123))
      (SPADCALL (QREFELT $ 16) '|%specialDiff| (CONS (|function| |LF;dvint|) $)
                (QREFELT $ 123))
      (SPADCALL (QREFELT $ 17) '|%specialDiff|
                (CONS (|function| |LF;dviint|) $) (QREFELT $ 123))
      (SPADCALL (QREFELT $ 18) '|%specialDiff|
                (CONS (|function| |LF;dvdint|) $) (QREFELT $ 123))
      (SPADCALL (QREFELT $ 18) '|%specialDisp| (CONS (|function| |LF;ddint|) $)
                (QREFELT $ 123))
      (COND
       ((|HasCategory| |#1| '(|ConvertibleTo| (|InputForm|)))
        (PROGN
         (SPADCALL (QREFELT $ 16) '|%specialInput|
                   (CONS (|function| |LF;inint|) $) (QREFELT $ 123))
         (SPADCALL (QREFELT $ 18) '|%specialInput|
                   (CONS (|function| |LF;indint|) $) (QREFELT $ 123)))))
      $)))) 

(DEFUN |LiouvillianFunction!9| (|z1| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (SPADCALL (QREFELT $ 119)) (SPADCALL |z1| 2 (QREFELT $ 116))
              (QREFELT $ 77))
    (SPADCALL 2 (QREFELT $ 121)) (QREFELT $ 107))
   (QREFELT $ 109))) 

(DEFUN |LiouvillianFunction!8| (|z1| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (SPADCALL (QREFELT $ 119)) (SPADCALL |z1| 2 (QREFELT $ 116))
              (QREFELT $ 77))
    (SPADCALL 2 (QREFELT $ 121)) (QREFELT $ 107))
   (QREFELT $ 106))) 

(DEFUN |LiouvillianFunction!7| (|z1| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 113))
            (SPADCALL (|spadConstant| $ 47) |z1| (QREFELT $ 90))
            (QREFELT $ 107))) 

(DEFUN |LiouvillianFunction!6| (|z1| $)
  (SPADCALL
   (SPADCALL 2
             (SPADCALL
              (SPADCALL (SPADCALL |z1| 2 (QREFELT $ 116)) (QREFELT $ 117))
              (QREFELT $ 112))
             (QREFELT $ 118))
   (SPADCALL (SPADCALL (QREFELT $ 119)) (QREFELT $ 120)) (QREFELT $ 107))) 

(DEFUN |LiouvillianFunction!5| (|z1| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 113)) (QREFELT $ 114))) 

(DEFUN |LiouvillianFunction!4| (|z1| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 112)) |z1| (QREFELT $ 107))) 

(DEFUN |LiouvillianFunction!3| (|z1| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 111)) |z1| (QREFELT $ 107))) 

(DEFUN |LiouvillianFunction!2| (|z1| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 110)) |z1| (QREFELT $ 107))) 

(DEFUN |LiouvillianFunction!1| (|z1| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 109)) |z1| (QREFELT $ 107))) 

(DEFUN |LiouvillianFunction!0| (|z1| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 106)) |z1| (QREFELT $ 107))) 

(MAKEPROP '|LiouvillianFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'PRIM
              (|Symbol|) (0 . |new|) (4 . |coerce|) '|dummy| (|BasicOperator|)
              (|CommonOperators|) (9 . |operator|) '|opint| '|opiint| '|opdint|
              '|opei| '|opli| '|opsi| '|opci| '|opshi| '|opchi| '|opli2|
              '|operf| '|opfis| '|opfic| (14 . |elt|) |LF;Si;2F;1| |LF;Ci;2F;2|
              |LF;Shi;2F;3| |LF;Chi;2F;4| |LF;Ei;2F;5| |LF;erf;2F;6|
              |LF;li;2F;7| |LF;dilog;2F;8| |LF;fresnelS;2F;9|
              |LF;fresnelC;2F;10| (|Boolean|) (20 . |has?|) |LF;belong?;BoB;11|
              (26 . |zero?|) (31 . |Zero|) (35 . |kernel|) (41 . |One|)
              (45 . |One|) (49 . =) (|List| 7) (55 . |second|) (|Kernel| $)
              (60 . |retract|) (65 . |third|) (70 . |eval|) (|Kernel| 7)
              (77 . |kernel|) (82 . |coerce|) (|List| $) (87 . |elt|)
              |LF;integral;FSF;21| (93 . |kernel|) (|OutputForm|)
              (99 . |coerce|) (104 . |coerce|) (109 . |hconcat|) (115 . *)
              (121 . |int|) (128 . |argument|) (133 . |operator|) (138 . =)
              (144 . =) (|Integer|) (150 . |elt|) (|List| 51) (156 . |subst|)
              (163 . |differentiate|) (169 . *) (175 . +) (|Union| $ '"failed")
              (|NonNegativeInteger|) (181 . |exquo|) (187 . |rest|)
              (|Mapping| 40 7) (193 . |every?|) (199 . |first|)
              (205 . |retract|) (|List| 9) (210 . |position|) (216 . |Zero|)
              (220 . -) (|SegmentBinding| 7) (226 . |variable|) (|Segment| 7)
              (231 . |segment|) (236 . |lo|) (241 . |hi|) |LF;integral;FSbF;29|
              (246 . |is?|) (252 . |is?|) |LF;operator;2Bo;32| (|Mapping| 7 7)
              (|BasicOperatorFunctions1| 7) (258 . |evaluate|) (|Mapping| 7 49)
              (264 . |evaluate|) (270 . |sin|) (275 . /) (281 . |derivative|)
              (287 . |cos|) (292 . |sinh|) (297 . |cosh|) (302 . |exp|)
              (307 . |log|) (312 . |inv|) (|PositiveInteger|) (317 . ^)
              (323 . -) (328 . *) (334 . |pi|) (338 . |sqrt|) (343 . |coerce|)
              (|None|) (348 . |setProperty|) (|InputForm|) (355 . |convert|)
              (360 . |convert|) (365 . |convert|))
           '#(|operator| 370 |li| 375 |integral| 380 |fresnelS| 392 |fresnelC|
              397 |erf| 402 |dilog| 407 |belong?| 412 |Si| 417 |Shi| 422 |Ei|
              427 |Ci| 432 |Chi| 437)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 127
                                                 '(0 9 0 10 1 7 0 9 11 1 14 13
                                                   9 15 2 7 0 13 0 29 2 13 40 0
                                                   9 41 1 7 40 0 43 0 7 0 44 2
                                                   7 0 13 0 45 0 6 0 46 0 7 0
                                                   47 2 7 40 0 0 48 1 49 7 0 50
                                                   1 7 51 0 52 1 49 7 0 53 3 7
                                                   0 0 51 0 54 1 55 0 9 56 1 7
                                                   0 51 57 2 7 0 13 58 59 2 7 0
                                                   13 58 61 1 7 62 0 63 1 9 62
                                                   0 64 2 62 0 0 0 65 2 62 0 0
                                                   0 66 3 62 0 0 0 0 67 1 55 49
                                                   0 68 1 55 13 0 69 2 13 40 0
                                                   0 70 2 49 40 0 0 71 2 49 7 0
                                                   72 73 3 7 0 0 74 58 75 2 7 0
                                                   0 9 76 2 7 0 0 0 77 2 7 0 0
                                                   0 78 2 80 79 0 0 81 2 49 0 0
                                                   80 82 2 49 40 83 0 84 2 49 0
                                                   0 80 85 1 7 9 0 86 2 87 72 9
                                                   0 88 0 6 0 89 2 7 0 0 0 90 1
                                                   91 9 0 92 1 91 93 0 94 1 93
                                                   7 0 95 1 93 7 0 96 2 7 40 0
                                                   9 98 2 13 40 0 9 99 2 102 13
                                                   13 101 103 2 102 13 13 104
                                                   105 1 7 0 0 106 2 7 0 0 0
                                                   107 2 102 13 13 101 108 1 7
                                                   0 0 109 1 7 0 0 110 1 7 0 0
                                                   111 1 7 0 0 112 1 7 0 0 113
                                                   1 7 0 0 114 2 7 0 0 115 116
                                                   1 7 0 0 117 2 7 0 115 0 118
                                                   0 7 0 119 1 7 0 0 120 1 7 0
                                                   72 121 3 13 0 0 9 122 123 1
                                                   9 124 0 125 1 124 0 58 126 1
                                                   7 124 0 127 1 0 13 13 100 1
                                                   0 7 7 36 2 0 7 7 91 97 2 0 7
                                                   7 9 60 1 0 7 7 38 1 0 7 7 39
                                                   1 0 7 7 35 1 0 7 7 37 1 0 40
                                                   13 42 1 0 7 7 30 1 0 7 7 32
                                                   1 0 7 7 34 1 0 7 7 31 1 0 7
                                                   7 33)))))
           '|lookupComplete|)) 
