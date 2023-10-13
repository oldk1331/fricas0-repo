
(/VERSIONCHECK 2) 

(DEFUN |LF;Si;2F;1| (|x| $) (SPADCALL (QREFELT $ 21) |x| (QREFELT $ 27))) 

(DEFUN |LF;Ci;2F;2| (|x| $) (SPADCALL (QREFELT $ 22) |x| (QREFELT $ 27))) 

(DEFUN |LF;Ei;2F;3| (|x| $) (SPADCALL (QREFELT $ 19) |x| (QREFELT $ 27))) 

(DEFUN |LF;erf;2F;4| (|x| $) (SPADCALL (QREFELT $ 24) |x| (QREFELT $ 27))) 

(DEFUN |LF;li;2F;5| (|x| $) (SPADCALL (QREFELT $ 20) |x| (QREFELT $ 27))) 

(DEFUN |LF;dilog;2F;6| (|x| $) (SPADCALL (QREFELT $ 23) |x| (QREFELT $ 27))) 

(DEFUN |LF;fresnelS;2F;7| (|x| $) (SPADCALL (QREFELT $ 25) |x| (QREFELT $ 27))) 

(DEFUN |LF;fresnelC;2F;8| (|x| $) (SPADCALL (QREFELT $ 26) |x| (QREFELT $ 27))) 

(DEFUN |LF;belong?;BoB;9| (|op| $) (SPADCALL |op| (QREFELT $ 8) (QREFELT $ 37))) 

(DEFUN |LF;isi| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 39)) (|spadConstant| $ 40))
        ('T (SPADCALL (QREFELT $ 21) |x| (QREFELT $ 41))))) 

(DEFUN |LF;ici| (|x| $) (SPADCALL (QREFELT $ 22) |x| (QREFELT $ 41))) 

(DEFUN |LF;ierf| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 39)) (|spadConstant| $ 40))
        ('T (SPADCALL (QREFELT $ 24) |x| (QREFELT $ 41))))) 

(DEFUN |LF;ili2| (|x| $)
  (COND
   ((SPADCALL |x| (|spadConstant| $ 43) (QREFELT $ 44)) (|spadConstant| $ 40))
   ('T (SPADCALL (QREFELT $ 23) |x| (QREFELT $ 41))))) 

(DEFUN |LF;ifis| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 39)) (|spadConstant| $ 40))
        ('T (SPADCALL (QREFELT $ 25) |x| (QREFELT $ 41))))) 

(DEFUN |LF;ific| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 39)) (|spadConstant| $ 40))
        ('T (SPADCALL (QREFELT $ 26) |x| (QREFELT $ 41))))) 

(DEFUN |LF;integrand| (|l| $)
  (SPADCALL (|SPADfirst| |l|)
            (SPADCALL (SPADCALL |l| (QREFELT $ 46)) (QREFELT $ 48))
            (SPADCALL |l| (QREFELT $ 49)) (QREFELT $ 50))) 

(DEFUN |LF;integral;FSF;17| (|f| |x| $)
  (PROG (|k|)
    (RETURN
     (SPADCALL (QREFELT $ 16)
               (LIST
                (SPADCALL |f|
                          (LETT |k| (SPADCALL |x| (QREFELT $ 52))
                                |LF;integral;FSF;17|)
                          (QREFELT $ 12) (QREFELT $ 50))
                (QREFELT $ 12) (SPADCALL |k| (QREFELT $ 53)))
               (QREFELT $ 55))))) 

(DEFUN |LF;iint| (|l| $)
  (COND ((SPADCALL (|SPADfirst| |l|) (QREFELT $ 39)) (|spadConstant| $ 40))
        ('T (SPADCALL (QREFELT $ 16) |l| (QREFELT $ 57))))) 

(DEFUN |LF;ddint| (|l| $)
  (SPADCALL
   (SPADCALL (SPADCALL (|LF;integrand| |l| $) (QREFELT $ 59))
             (SPADCALL (SPADCALL '|d| (QREFELT $ 60))
                       (SPADCALL (SPADCALL |l| (QREFELT $ 49)) (QREFELT $ 59))
                       (QREFELT $ 61))
             (QREFELT $ 62))
   (SPADCALL (SPADCALL (CDR |l|) (QREFELT $ 49)) (QREFELT $ 59))
   (SPADCALL (SPADCALL (CDR (CDR |l|)) (QREFELT $ 49)) (QREFELT $ 59))
   (QREFELT $ 63))) 

(DEFUN |LF;eqint| (|k1| |k2| $)
  (PROG (|res| #1=#:G172 |a2| |a1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |a1| (SPADCALL |k1| (QREFELT $ 64)) . #2=(|LF;eqint|))
            (LETT |a2| (SPADCALL |k2| (QREFELT $ 64)) . #2#)
            (LETT |res|
                  (SPADCALL (SPADCALL |k1| (QREFELT $ 65))
                            (SPADCALL |k2| (QREFELT $ 65)) (QREFELT $ 66))
                  . #2#)
            (COND ((NULL |res|) (PROGN (LETT #1# |res| . #2#) (GO #1#))))
            (LETT |res| (SPADCALL |a1| |a2| (QREFELT $ 67)) . #2#)
            (COND (|res| (PROGN (LETT #1# |res| . #2#) (GO #1#))))
            (EXIT
             (LETT |res|
                   (COND
                    ((SPADCALL (SPADCALL |a1| 3 (QREFELT $ 69))
                               (SPADCALL |a2| 3 (QREFELT $ 69)) (QREFELT $ 44))
                     (SPADCALL
                      (SPADCALL (SPADCALL |a1| 1 (QREFELT $ 69))
                                (LIST
                                 (SPADCALL (SPADCALL |a1| 2 (QREFELT $ 69))
                                           (QREFELT $ 48)))
                                (LIST (SPADCALL |a2| 2 (QREFELT $ 69)))
                                (QREFELT $ 71))
                      (SPADCALL |a2| 1 (QREFELT $ 69)) (QREFELT $ 44)))
                    ('T 'NIL))
                   . #2#))))
      #1# (EXIT #1#))))) 

(DEFUN |LF;dvint| (|l| |x| $)
  (PROG (|k|)
    (RETURN
     (SEQ
      (LETT |k| (SPADCALL (SPADCALL |l| (QREFELT $ 46)) (QREFELT $ 48))
            |LF;dvint|)
      (EXIT
       (SPADCALL
        (SPADCALL (SPADCALL (SPADCALL |l| (QREFELT $ 49)) |x| (QREFELT $ 72))
                  (|LF;integrand| |l| $) (QREFELT $ 73))
        (SPADCALL (QREFELT $ 16)
                  (LIST (SPADCALL (|SPADfirst| |l|) |x| (QREFELT $ 72))
                        (SPADCALL |l| (QREFELT $ 46))
                        (SPADCALL |l| (QREFELT $ 49)))
                  (QREFELT $ 55))
        (QREFELT $ 74))))))) 

(DEFUN |LF;iiint| (|l| $)
  (PROG (|lval| |n| |nu|)
    (RETURN
     (SEQ
      (LETT |nu| (SPADCALL (LENGTH |l|) 2 (QREFELT $ 77)) . #1=(|LF;iiint|))
      (EXIT
       (COND ((QEQCAR |nu| 1) (|error| "impossible"))
             (#2='T
              (SEQ (LETT |n| (QCDR |nu|) . #1#)
                   (LETT |lval| (SPADCALL |l| |n| (QREFELT $ 78)) . #1#)
                   (EXIT
                    (COND
                     ((SPADCALL (ELT $ 39) |lval| (QREFELT $ 80))
                      (|spadConstant| $ 40))
                     (#2#
                      (SPADCALL (QREFELT $ 17) |l| (QREFELT $ 57))))))))))))) 

(DEFUN |LF;dviint| (|l| |v| $)
  (PROG (|m| |lv| #1=#:G190 |vf| #2=#:G189 |lvf| |n| |nu|)
    (RETURN
     (SEQ
      (LETT |nu| (SPADCALL (LENGTH |l|) 2 (QREFELT $ 77)) . #3=(|LF;dviint|))
      (EXIT
       (COND ((QEQCAR |nu| 1) (|error| "impossible"))
             (#4='T
              (SEQ (LETT |n| (QCDR |nu|) . #3#)
                   (LETT |lvf| (SPADCALL |l| |n| (QREFELT $ 81)) . #3#)
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
                                       (CONS (SPADCALL |vf| (QREFELT $ 82))
                                             #2#)
                                       . #3#)))
                               (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         . #3#)
                   (LETT |m| (SPADCALL |v| |lv| (QREFELT $ 84)) . #3#)
                   (EXIT
                    (COND ((EQL |m| 0) (|spadConstant| $ 40))
                          (#4#
                           (SPADCALL |l| (+ |n| |m|) (QREFELT $ 69))))))))))))) 

(DEFUN |LF;dvdint| (|l| |x| $)
  (PROG (|g| |f| |h| |k| |d| |y|)
    (RETURN
     (SEQ
      (COND
       ((EQUAL |x|
               (SPADCALL
                (LETT |y| (SPADCALL |l| (QREFELT $ 49)) . #1=(|LF;dvdint|))
                (QREFELT $ 82)))
        (|spadConstant| $ 40))
       ('T
        (SEQ
         (LETT |k|
               (SPADCALL (LETT |d| (SPADCALL |l| (QREFELT $ 46)) . #1#)
                         (QREFELT $ 48))
               . #1#)
         (EXIT
          (SPADCALL
           (SPADCALL
            (SPADCALL
             (SPADCALL
              (LETT |h| (SPADCALL (CDR (CDR |l|)) (QREFELT $ 49)) . #1#) |x|
              (QREFELT $ 72))
             (SPADCALL (LETT |f| (|SPADfirst| |l|) . #1#) |k| |h|
                       (QREFELT $ 50))
             (QREFELT $ 73))
            (SPADCALL
             (SPADCALL (LETT |g| (SPADCALL (CDR |l|) (QREFELT $ 49)) . #1#) |x|
                       (QREFELT $ 72))
             (SPADCALL |f| |k| |g| (QREFELT $ 50)) (QREFELT $ 73))
            (QREFELT $ 86))
           (SPADCALL (QREFELT $ 18)
                     (LIST (SPADCALL |f| |x| (QREFELT $ 72)) |d| |y| |g| |h|)
                     (QREFELT $ 55))
           (QREFELT $ 74)))))))))) 

(DEFUN |LF;integral;FSbF;25| (|f| |s| $)
  (PROG (|x|)
    (RETURN
     (SEQ
      (LETT |x| (SPADCALL (SPADCALL |s| (QREFELT $ 88)) (QREFELT $ 52))
            |LF;integral;FSbF;25|)
      (EXIT
       (SPADCALL (QREFELT $ 18)
                 (LIST (SPADCALL |f| |x| (QREFELT $ 12) (QREFELT $ 50))
                       (QREFELT $ 12) (SPADCALL |x| (QREFELT $ 53))
                       (SPADCALL (SPADCALL |s| (QREFELT $ 90)) (QREFELT $ 91))
                       (SPADCALL (SPADCALL |s| (QREFELT $ 90)) (QREFELT $ 92)))
                 (QREFELT $ 55))))))) 

(DEFUN |LF;ili| (|x| $)
  (COND
   ((SPADCALL |x| (|spadConstant| $ 43) (QREFELT $ 44))
    (|error| "Invalid argument"))
   ((SPADCALL |x| '|exp| (QREFELT $ 94))
    (SPADCALL
     (|SPADfirst| (SPADCALL (SPADCALL |x| (QREFELT $ 48)) (QREFELT $ 64)))
     (QREFELT $ 30)))
   ('T (SPADCALL (QREFELT $ 20) |x| (QREFELT $ 41))))) 

(DEFUN |LF;iei| (|x| $)
  (COND
   ((SPADCALL |x| (|spadConstant| $ 40) (QREFELT $ 44))
    (|error| "Invalid argument"))
   ((SPADCALL |x| '|log| (QREFELT $ 94))
    (SPADCALL
     (|SPADfirst| (SPADCALL (SPADCALL |x| (QREFELT $ 48)) (QREFELT $ 64)))
     (QREFELT $ 32)))
   ('T (SPADCALL (QREFELT $ 19) |x| (QREFELT $ 41))))) 

(DEFUN |LF;operator;2Bo;28| (|op| $)
  (COND ((SPADCALL |op| '|integral| (QREFELT $ 95)) (QREFELT $ 16))
        ((SPADCALL |op| '|%iint| (QREFELT $ 95)) (QREFELT $ 17))
        ((SPADCALL |op| '|%defint| (QREFELT $ 95)) (QREFELT $ 18))
        ((SPADCALL |op| '|Ei| (QREFELT $ 95)) (QREFELT $ 19))
        ((SPADCALL |op| '|Si| (QREFELT $ 95)) (QREFELT $ 21))
        ((SPADCALL |op| '|Ci| (QREFELT $ 95)) (QREFELT $ 22))
        ((SPADCALL |op| '|li| (QREFELT $ 95)) (QREFELT $ 20))
        ((SPADCALL |op| '|erf| (QREFELT $ 95)) (QREFELT $ 24))
        ((SPADCALL |op| '|dilog| (QREFELT $ 95)) (QREFELT $ 23))
        ((SPADCALL |op| '|fresnelC| (QREFELT $ 95)) (QREFELT $ 25))
        ((SPADCALL |op| '|fresnelS| (QREFELT $ 95)) (QREFELT $ 26))
        ('T (|error| "Not a Liouvillian operator")))) 

(DEFUN |LF;pint| (|l| $)
  (SPADCALL (CONS (SPADCALL '|integral| (QREFELT $ 118)) |l|) (QREFELT $ 119))) 

(DEFUN |LF;inint| (|l| $)
  (PROG (|r2|)
    (RETURN
     (SEQ
      (LETT |r2|
            (SPADCALL
             (LIST (SPADCALL '|::| (QREFELT $ 118))
                   (SPADCALL (SPADCALL |l| (QREFELT $ 49)) (QREFELT $ 120))
                   (SPADCALL '|Symbol| (QREFELT $ 118)))
             (QREFELT $ 119))
            |LF;inint|)
      (EXIT
       (|LF;pint| (LIST (SPADCALL (|LF;integrand| |l| $) (QREFELT $ 120)) |r2|)
        $)))))) 

(DEFUN |LF;indint| (|l| $)
  (|LF;pint|
   (LIST (SPADCALL (|LF;integrand| |l| $) (QREFELT $ 120))
         (SPADCALL
          (CONS (SPADCALL '= (QREFELT $ 118))
                (LIST (SPADCALL (SPADCALL |l| (QREFELT $ 49)) (QREFELT $ 120))
                      (SPADCALL
                       (CONS (SPADCALL 'SEGMENT (QREFELT $ 118))
                             (LIST
                              (SPADCALL (SPADCALL (CDR |l|) (QREFELT $ 49))
                                        (QREFELT $ 120))
                              (SPADCALL
                               (SPADCALL (CDR (CDR |l|)) (QREFELT $ 49))
                               (QREFELT $ 120))))
                       (QREFELT $ 119))))
          (QREFELT $ 119)))
   $)) 

(DEFUN |LiouvillianFunction| (&REST #1=#:G264)
  (PROG ()
    (RETURN
     (PROG (#2=#:G265)
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
      (LETT $ (GETREFV 121) . #1#)
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
      (QSETREFV $ 23 (SPADCALL '|dilog| (QREFELT $ 15)))
      (QSETREFV $ 24 (SPADCALL '|erf| (QREFELT $ 15)))
      (QSETREFV $ 25 (SPADCALL '|fresnelS| (QREFELT $ 15)))
      (QSETREFV $ 26 (SPADCALL '|fresnelC| (QREFELT $ 15)))
      (SPADCALL (QREFELT $ 19) (CONS (|function| |LF;iei|) $) (QREFELT $ 99))
      (SPADCALL (QREFELT $ 20) (CONS (|function| |LF;ili|) $) (QREFELT $ 99))
      (SPADCALL (QREFELT $ 21) (CONS (|function| |LF;isi|) $) (QREFELT $ 99))
      (SPADCALL (QREFELT $ 22) (CONS (|function| |LF;ici|) $) (QREFELT $ 99))
      (SPADCALL (QREFELT $ 24) (CONS (|function| |LF;ierf|) $) (QREFELT $ 99))
      (SPADCALL (QREFELT $ 23) (CONS (|function| |LF;ili2|) $) (QREFELT $ 99))
      (SPADCALL (QREFELT $ 25) (CONS (|function| |LF;ifis|) $) (QREFELT $ 99))
      (SPADCALL (QREFELT $ 26) (CONS (|function| |LF;ific|) $) (QREFELT $ 99))
      (SPADCALL (QREFELT $ 16) (CONS (|function| |LF;iint|) $) (QREFELT $ 101))
      (SPADCALL (QREFELT $ 17) (CONS (|function| |LF;iiint|) $)
                (QREFELT $ 101))
      (SPADCALL (QREFELT $ 21) (CONS #'|LiouvillianFunction!0| $)
                (QREFELT $ 104))
      (SPADCALL (QREFELT $ 22) (CONS #'|LiouvillianFunction!1| $)
                (QREFELT $ 104))
      (SPADCALL (QREFELT $ 19) (CONS #'|LiouvillianFunction!2| $)
                (QREFELT $ 104))
      (SPADCALL (QREFELT $ 20) (CONS #'|LiouvillianFunction!3| $)
                (QREFELT $ 104))
      (SPADCALL (QREFELT $ 24) (CONS #'|LiouvillianFunction!4| $)
                (QREFELT $ 104))
      (SPADCALL (QREFELT $ 23) (CONS #'|LiouvillianFunction!5| $)
                (QREFELT $ 104))
      (SPADCALL (QREFELT $ 25) (CONS #'|LiouvillianFunction!6| $)
                (QREFELT $ 104))
      (SPADCALL (QREFELT $ 26) (CONS #'|LiouvillianFunction!7| $)
                (QREFELT $ 104))
      (SPADCALL (QREFELT $ 16) '|%specialEqual|
                (CONS (|function| |LF;eqint|) $) (QREFELT $ 116))
      (SPADCALL (QREFELT $ 16) '|%specialDiff| (CONS (|function| |LF;dvint|) $)
                (QREFELT $ 116))
      (SPADCALL (QREFELT $ 17) '|%specialDiff|
                (CONS (|function| |LF;dviint|) $) (QREFELT $ 116))
      (SPADCALL (QREFELT $ 18) '|%specialDiff|
                (CONS (|function| |LF;dvdint|) $) (QREFELT $ 116))
      (SPADCALL (QREFELT $ 18) '|%specialDisp| (CONS (|function| |LF;ddint|) $)
                (QREFELT $ 116))
      (COND
       ((|HasCategory| |#1| '(|ConvertibleTo| (|InputForm|)))
        (PROGN
         (SPADCALL (QREFELT $ 16) '|%specialInput|
                   (CONS (|function| |LF;inint|) $) (QREFELT $ 116))
         (SPADCALL (QREFELT $ 18) '|%specialInput|
                   (CONS (|function| |LF;indint|) $) (QREFELT $ 116)))))
      $)))) 

(DEFUN |LiouvillianFunction!7| (|z1| $)
  (SPADCALL (SPADCALL |z1| 2 (QREFELT $ 110)) (QREFELT $ 105))) 

(DEFUN |LiouvillianFunction!6| (|z1| $)
  (SPADCALL (SPADCALL |z1| 2 (QREFELT $ 110)) (QREFELT $ 102))) 

(DEFUN |LiouvillianFunction!5| (|z1| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 107))
            (SPADCALL (|spadConstant| $ 43) |z1| (QREFELT $ 86))
            (QREFELT $ 103))) 

(DEFUN |LiouvillianFunction!4| (|z1| $)
  (SPADCALL
   (SPADCALL 2
             (SPADCALL
              (SPADCALL (SPADCALL |z1| 2 (QREFELT $ 110)) (QREFELT $ 111))
              (QREFELT $ 106))
             (QREFELT $ 112))
   (SPADCALL (SPADCALL (QREFELT $ 113)) (QREFELT $ 114)) (QREFELT $ 103))) 

(DEFUN |LiouvillianFunction!3| (|z1| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 107)) (QREFELT $ 108))) 

(DEFUN |LiouvillianFunction!2| (|z1| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 106)) |z1| (QREFELT $ 103))) 

(DEFUN |LiouvillianFunction!1| (|z1| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 105)) |z1| (QREFELT $ 103))) 

(DEFUN |LiouvillianFunction!0| (|z1| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 102)) |z1| (QREFELT $ 103))) 

(MAKEPROP '|LiouvillianFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'PRIM
              (|Symbol|) (0 . |new|) (4 . |coerce|) '|dummy| (|BasicOperator|)
              (|CommonOperators|) (9 . |operator|) '|opint| '|opiint| '|opdint|
              '|opei| '|opli| '|opsi| '|opci| '|opli2| '|operf| '|opfis|
              '|opfic| (14 . |elt|) |LF;Si;2F;1| |LF;Ci;2F;2| |LF;Ei;2F;3|
              |LF;erf;2F;4| |LF;li;2F;5| |LF;dilog;2F;6| |LF;fresnelS;2F;7|
              |LF;fresnelC;2F;8| (|Boolean|) (20 . |has?|) |LF;belong?;BoB;9|
              (26 . |zero?|) (31 . |Zero|) (35 . |kernel|) (41 . |One|)
              (45 . |One|) (49 . =) (|List| 7) (55 . |second|) (|Kernel| $)
              (60 . |retract|) (65 . |third|) (70 . |eval|) (|Kernel| 7)
              (77 . |kernel|) (82 . |coerce|) (|List| $) (87 . |elt|)
              |LF;integral;FSF;17| (93 . |kernel|) (|OutputForm|)
              (99 . |coerce|) (104 . |coerce|) (109 . |hconcat|) (115 . *)
              (121 . |int|) (128 . |argument|) (133 . |operator|) (138 . =)
              (144 . =) (|Integer|) (150 . |elt|) (|List| 47) (156 . |subst|)
              (163 . |differentiate|) (169 . *) (175 . +) (|Union| $ '"failed")
              (|NonNegativeInteger|) (181 . |exquo|) (187 . |rest|)
              (|Mapping| 36 7) (193 . |every?|) (199 . |first|)
              (205 . |retract|) (|List| 9) (210 . |position|) (216 . |Zero|)
              (220 . -) (|SegmentBinding| 7) (226 . |variable|) (|Segment| 7)
              (231 . |segment|) (236 . |lo|) (241 . |hi|) |LF;integral;FSbF;25|
              (246 . |is?|) (252 . |is?|) |LF;operator;2Bo;28| (|Mapping| 7 7)
              (|BasicOperatorFunctions1| 7) (258 . |evaluate|) (|Mapping| 7 45)
              (264 . |evaluate|) (270 . |sin|) (275 . /) (281 . |derivative|)
              (287 . |cos|) (292 . |exp|) (297 . |log|) (302 . |inv|)
              (|PositiveInteger|) (307 . ^) (313 . -) (318 . *) (324 . |pi|)
              (328 . |sqrt|) (|None|) (333 . |setProperty|) (|InputForm|)
              (340 . |convert|) (345 . |convert|) (350 . |convert|))
           '#(|operator| 355 |li| 360 |integral| 365 |fresnelS| 377 |fresnelC|
              382 |erf| 387 |dilog| 392 |belong?| 397 |Si| 402 |Ei| 407 |Ci|
              412)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 120
                                                 '(0 9 0 10 1 7 0 9 11 1 14 13
                                                   9 15 2 7 0 13 0 27 2 13 36 0
                                                   9 37 1 7 36 0 39 0 7 0 40 2
                                                   7 0 13 0 41 0 6 0 42 0 7 0
                                                   43 2 7 36 0 0 44 1 45 7 0 46
                                                   1 7 47 0 48 1 45 7 0 49 3 7
                                                   0 0 47 0 50 1 51 0 9 52 1 7
                                                   0 47 53 2 7 0 13 54 55 2 7 0
                                                   13 54 57 1 7 58 0 59 1 9 58
                                                   0 60 2 58 0 0 0 61 2 58 0 0
                                                   0 62 3 58 0 0 0 0 63 1 51 45
                                                   0 64 1 51 13 0 65 2 13 36 0
                                                   0 66 2 45 36 0 0 67 2 45 7 0
                                                   68 69 3 7 0 0 70 54 71 2 7 0
                                                   0 9 72 2 7 0 0 0 73 2 7 0 0
                                                   0 74 2 76 75 0 0 77 2 45 0 0
                                                   76 78 2 45 36 79 0 80 2 45 0
                                                   0 76 81 1 7 9 0 82 2 83 68 9
                                                   0 84 0 6 0 85 2 7 0 0 0 86 1
                                                   87 9 0 88 1 87 89 0 90 1 89
                                                   7 0 91 1 89 7 0 92 2 7 36 0
                                                   9 94 2 13 36 0 9 95 2 98 13
                                                   13 97 99 2 98 13 13 100 101
                                                   1 7 0 0 102 2 7 0 0 0 103 2
                                                   98 13 13 97 104 1 7 0 0 105
                                                   1 7 0 0 106 1 7 0 0 107 1 7
                                                   0 0 108 2 7 0 0 109 110 1 7
                                                   0 0 111 2 7 0 109 0 112 0 7
                                                   0 113 1 7 0 0 114 3 13 0 0 9
                                                   115 116 1 9 117 0 118 1 117
                                                   0 54 119 1 7 117 0 120 1 0
                                                   13 13 96 1 0 7 7 32 2 0 7 7
                                                   87 93 2 0 7 7 9 56 1 0 7 7
                                                   34 1 0 7 7 35 1 0 7 7 31 1 0
                                                   7 7 33 1 0 36 13 38 1 0 7 7
                                                   28 1 0 7 7 30 1 0 7 7
                                                   29)))))
           '|lookupComplete|)) 
