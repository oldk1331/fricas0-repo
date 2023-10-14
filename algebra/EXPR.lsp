
(/VERSIONCHECK 2) 

(PUT '|EXPR;belong?;BoB;1| '|SPADreplace| '(XLAM (|op|) 'T)) 

(DEFUN |EXPR;belong?;BoB;1| (|op| $) 'T) 

(DEFUN |EXPR;retNotUnit| (|x| $)
  (PROG (|u| |k|)
    (RETURN
     (SEQ
      (LETT |u|
            (SPADCALL
             (LETT |k| (SPADCALL |x| (QREFELT $ 13)) . #1=(|EXPR;retNotUnit|))
             (QREFELT $ 17))
            . #1#)
      (EXIT
       (COND ((QEQCAR |u| 0) (QCDR |u|)) ('T (|error| "Not retractable")))))))) 

(DEFUN |EXPR;retNotUnitIfCan| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 19)) |EXPR;retNotUnitIfCan|)
          (EXIT
           (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                 ('T (SPADCALL (QCDR |r|) (QREFELT $ 17))))))))) 

(DEFUN |EXPR;operator;2Bo;4| (|op| $)
  (PROG (|n|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |op| (QREFELT $ 21)) (SPADCALL |op| (QREFELT $ 22)))
            ((SPADCALL |op| (QREFELT $ 24)) (SPADCALL |op| (QREFELT $ 25)))
            (#1='T
             (SEQ
              (COND
               ((SPADCALL |op| (QREFELT $ 26))
                (COND
                 ((SPADCALL |op| (QREFELT $ 7) (QREFELT $ 28))
                  (EXIT
                   (SPADCALL
                    (SPADCALL (SPADCALL |op| (QREFELT $ 29)) (QREFELT $ 30))
                    (QREFELT $ 31)))))))
              (LETT |n| (SPADCALL |op| (QREFELT $ 33)) |EXPR;operator;2Bo;4|)
              (EXIT
               (COND
                ((QEQCAR |n| 1)
                 (SPADCALL (SPADCALL |op| (QREFELT $ 29)) (QREFELT $ 34)))
                (#1#
                 (SPADCALL (SPADCALL |op| (QREFELT $ 29)) (QCDR |n|)
                           (QREFELT $ 36)))))))))))) 

(DEFUN |EXPR;poly_to_MP| (|p| $)
  (PROG (|vl2| #1=#:G195 |z| #2=#:G194 |vl1| |ps|)
    (RETURN
     (SEQ (LETT |ps| |p| . #3=(|EXPR;poly_to_MP|))
          (LETT |vl1| (SPADCALL |ps| (QREFELT $ 40)) . #3#)
          (LETT |vl2|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |z| NIL . #3#) (LETT #1# |vl1| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |z| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |z| (QREFELT $ 30)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT (SPADCALL |ps| |vl1| |vl2| (QREFELT $ 44))))))) 

(DEFUN |EXPR;Zero;$;6| ($) (|spadConstant| $ 46)) 

(DEFUN |EXPR;One;$;7| ($) (|spadConstant| $ 48)) 

(DEFUN |EXPR;one?;$B;8| (|x| $)
  (SPADCALL |x| (|spadConstant| $ 49) (QREFELT $ 51))) 

(DEFUN |EXPR;zero?;$B;9| (|x| $) (SPADCALL |x| (QREFELT $ 53))) 

(DEFUN |EXPR;-;2$;10| (|x| $) (SPADCALL |x| (QREFELT $ 55))) 

(DEFUN |EXPR;*;I2$;11| (|n| |x| $) (SPADCALL |n| |x| (QREFELT $ 58))) 

(DEFUN |EXPR;coerce;I$;12| (|n| $) (SPADCALL |n| (QREFELT $ 60))) 

(DEFUN |EXPR;*;3$;13| (|x| |y| $)
  (|EXPR;algreduc| (SPADCALL |x| |y| (QREFELT $ 62)) (|EXPR;commonk| |x| |y| $)
   $)) 

(DEFUN |EXPR;+;3$;14| (|x| |y| $)
  (|EXPR;algreduc| (SPADCALL |x| |y| (QREFELT $ 64)) (|EXPR;commonk| |x| |y| $)
   $)) 

(DEFUN |EXPR;-;3$;15| (|x| |y| $)
  (|EXPR;algreduc| (SPADCALL |x| |y| (QREFELT $ 66)) (|EXPR;commonk| |x| |y| $)
   $)) 

(DEFUN |EXPR;/;3$;16| (|x| |y| $)
  (|EXPR;algreduc| (SPADCALL |x| |y| (QREFELT $ 68)) (|EXPR;commonk| |x| |y| $)
   $)) 

(DEFUN |EXPR;number?;$B;17| (|x| $)
  (COND
   ((|HasCategory| (QREFELT $ 6) (LIST '|RetractableTo| '(|Integer|)))
    (COND ((SPADCALL |x| (QREFELT $ 70)) 'T)
          (#1='T (QEQCAR (SPADCALL |x| (QREFELT $ 72)) 0))))
   (#1# (SPADCALL |x| (QREFELT $ 70))))) 

(DEFUN |EXPR;simplifyPower;$I$;18| (|x| |n| $)
  (PROG (|args| |k|)
    (RETURN
     (SEQ
      (LETT |k| (SPADCALL |x| (QREFELT $ 75))
            . #1=(|EXPR;simplifyPower;$I$;18|))
      (EXIT
       (COND
        ((SPADCALL |x| '|%power| (QREFELT $ 76))
         (SEQ
          (LETT |args| (SPADCALL (SPADCALL |k| (QREFELT $ 77)) (QREFELT $ 79))
                . #1#)
          (COND
           ((NULL (EQL (SPADCALL |args| (QREFELT $ 80)) 2))
            (EXIT (|error| "Too many arguments to ^"))))
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |args| 1 (QREFELT $ 81)) (QREFELT $ 73))
             (SPADCALL
              (|EXPR;reduc|
               (SPADCALL (SPADCALL |args| 1 (QREFELT $ 81)) |n| (QREFELT $ 82))
               (|EXPR;algtower| (SPADCALL |args| 1 (QREFELT $ 81)) $) $)
              (SPADCALL |args| 2 (QREFELT $ 81)) (QREFELT $ 83)))
            (#2='T
             (SPADCALL (SPADCALL |args| (QREFELT $ 84))
                       (SPADCALL |n| (SPADCALL |args| (QREFELT $ 85))
                                 (QREFELT $ 59))
                       (QREFELT $ 83)))))))
        (#2#
         (|EXPR;reduc| (SPADCALL |x| |n| (QREFELT $ 82))
          (|EXPR;algtower| |x| $) $)))))))) 

(DEFUN |EXPR;^;$Nni$;19| (|x| |n| $)
  (COND ((EQL |n| 0) (|spadConstant| $ 49)) ((EQL |n| 1) |x|)
        ('T
         (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 88)) |n| (QREFELT $ 86))
                   (SPADCALL (SPADCALL |x| (QREFELT $ 89)) |n| (QREFELT $ 86))
                   (QREFELT $ 69))))) 

(DEFUN |EXPR;^;$I$;20| (|x| |n| $)
  (COND ((EQL |n| 0) (|spadConstant| $ 49)) ((EQL |n| 1) |x|)
        (#1='T
         (COND
          ((EQL |n| -1) (SPADCALL (|spadConstant| $ 49) |x| (QREFELT $ 69)))
          (#1#
           (SPADCALL
            (SPADCALL (SPADCALL |x| (QREFELT $ 88)) |n| (QREFELT $ 86))
            (SPADCALL (SPADCALL |x| (QREFELT $ 89)) |n| (QREFELT $ 86))
            (QREFELT $ 69))))))) 

(DEFUN |EXPR;^;$Pi$;21| (|x| |n| $)
  (COND ((EQL |n| 1) |x|)
        ('T
         (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 88)) |n| (QREFELT $ 86))
                   (SPADCALL (SPADCALL |x| (QREFELT $ 89)) |n| (QREFELT $ 86))
                   (QREFELT $ 69))))) 

(DEFUN |EXPR;smaller?;2$B;22| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 94))) 

(DEFUN |EXPR;=;2$B;23| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 51))) 

(DEFUN |EXPR;numer;$Smp;24| (|x| $) (SPADCALL |x| (QREFELT $ 97))) 

(DEFUN |EXPR;denom;$Smp;25| (|x| $) (SPADCALL |x| (QREFELT $ 100))) 

(DEFUN |EXPR;coerce;Smp$;26| (|p| $) (CONS |p| (|spadConstant| $ 103))) 

(DEFUN |EXPR;coerce;P$;27| (|p| $)
  (PROG (|en|)
    (RETURN
     (SEQ (LETT |en| (|EXPR;poly_to_MP| |p| $) |EXPR;coerce;P$;27|)
          (EXIT (CONS |en| (|spadConstant| $ 103))))))) 

(DEFUN |EXPR;coerce;F$;28| (|pq| $)
  (PROG (|ed| |en|)
    (RETURN
     (SEQ
      (LETT |en| (|EXPR;poly_to_MP| (SPADCALL |pq| (QREFELT $ 108)) $)
            . #1=(|EXPR;coerce;F$;28|))
      (LETT |ed| (|EXPR;poly_to_MP| (SPADCALL |pq| (QREFELT $ 109)) $) . #1#)
      (EXIT (CONS |en| |ed|)))))) 

(DEFUN |EXPR;reduce;2$;29| (|x| $) (|EXPR;reduc| |x| (|EXPR;algtower| |x| $) $)) 

(DEFUN |EXPR;commonk| (|x| |y| $)
  (|EXPR;commonk0| (|EXPR;algtower| |x| $) (|EXPR;algtower| |y| $) $)) 

(DEFUN |EXPR;algkernels| (|l| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|EXPR;algkernels!0| (VECTOR (QREFELT $ 8) $)) |l|
               (QREFELT $ 113))))) 

(DEFUN |EXPR;algkernels!0| (|x| $$)
  (PROG ($ ALGOP)
    (LETT $ (QREFELT $$ 1) . #1=(|EXPR;algkernels|))
    (LETT ALGOP (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL (SPADCALL |x| (QREFELT $ 31)) ALGOP (QREFELT $ 28)))))) 

(DEFUN |EXPR;toprat| (|f| $)
  (SPADCALL |f| (|EXPR;algtower| |f| $) (QREFELT $ 115))) 

(DEFUN |EXPR;alg_ker_set| (|x| $)
  (PROG (|res| |ka| |arg| #1=#:G242 |k| |ak|)
    (RETURN
     (SEQ
      (LETT |ak| (|EXPR;algkernels| (SPADCALL |x| (QREFELT $ 75)) $)
            . #2=(|EXPR;alg_ker_set|))
      (LETT |res| (SPADCALL |ak| (QREFELT $ 117)) . #2#)
      (SEQ (LETT |k| NIL . #2#) (LETT #1# |ak| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ (LETT |arg| (SPADCALL |k| (QREFELT $ 79)) . #2#)
                (LETT |ka|
                      (COND
                       ((OR (SPADCALL |k| '|nthRoot| (QREFELT $ 118))
                            (SPADCALL |k| '|rootOf| (QREFELT $ 118)))
                        (|EXPR;alg_ker_set| (SPADCALL |arg| 1 (QREFELT $ 81))
                         $))
                       ('T (|error| "alg_ker_set: Unknown algebraic kernel")))
                      . #2#)
                (EXIT
                 (LETT |res| (SPADCALL |res| |ka| (QREFELT $ 119)) . #2#)))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |EXPR;algtower| (|x| $)
  (NREVERSE
   (SPADCALL (SPADCALL (|EXPR;alg_ker_set| |x| $) (QREFELT $ 120))
             (QREFELT $ 121)))) 

(DEFUN |EXPR;simple_root| (|r| $)
  (PROG (|a| |al|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |r| '|nthRoot| (QREFELT $ 118))
        (SEQ
         (LETT |al| (SPADCALL |r| (QREFELT $ 79)) . #1=(|EXPR;simple_root|))
         (EXIT
          (COND
           ((SPADCALL (SPADCALL |al| 2 (QREFELT $ 81))
                      (SPADCALL 2 (QREFELT $ 61)) (QREFELT $ 122))
            'NIL)
           (#2='T
            (SEQ (LETT |a| (SPADCALL |al| 1 (QREFELT $ 81)) . #1#)
                 (EXIT
                  (COND
                   ((SPADCALL
                     (LENGTH
                      (|EXPR;algkernels| (SPADCALL |a| (QREFELT $ 75)) $))
                     0 (QREFELT $ 123))
                    'NIL)
                   (#2# 'T)))))))))
       (#2# 'NIL)))))) 

(DEFUN |EXPR;root_reduce| (|x| |r| $)
  (PROG (|d1| |n1| |c0| |c1| |n0| |dp| |dn| |an| |a|)
    (RETURN
     (SEQ
      (LETT |a| (SPADCALL (SPADCALL |r| (QREFELT $ 79)) 1 (QREFELT $ 81))
            . #1=(|EXPR;root_reduce|))
      (LETT |an| (SPADCALL |a| (QREFELT $ 99)) . #1#)
      (LETT |dn| (SPADCALL |a| (QREFELT $ 101)) . #1#)
      (LETT |dp| (SPADCALL (SPADCALL |x| (QREFELT $ 101)) |r| (QREFELT $ 125))
            . #1#)
      (LETT |n0| (SPADCALL |x| (QREFELT $ 99)) . #1#)
      (LETT |c1| (SPADCALL |dp| (QREFELT $ 127)) . #1#)
      (LETT |c0| (SPADCALL (SPADCALL |dp| (QREFELT $ 128)) (QREFELT $ 127))
            . #1#)
      (LETT |n1|
            (SPADCALL |dn|
                      (SPADCALL (SPADCALL |c0| |n0| (QREFELT $ 129))
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| $ 103) |r| 1
                                            (QREFELT $ 130))
                                  |c1| (QREFELT $ 129))
                                 |n0| (QREFELT $ 129))
                                (QREFELT $ 131))
                      (QREFELT $ 129))
            . #1#)
      (LETT |d1|
            (SPADCALL
             (SPADCALL (SPADCALL |c0| |c0| (QREFELT $ 129)) |dn|
                       (QREFELT $ 129))
             (SPADCALL (SPADCALL |an| |c1| (QREFELT $ 129)) |c1|
                       (QREFELT $ 129))
             (QREFELT $ 131))
            . #1#)
      (EXIT
       (|EXPR;reduc| (SPADCALL |n1| |d1| (QREFELT $ 132)) (LIST |r|) $)))))) 

(PUT '|EXPR;getSimplifyDenomsFlag;B;37| '|SPADreplace|
     '(XLAM NIL |algreduc_flag|)) 

(DEFUN |EXPR;getSimplifyDenomsFlag;B;37| ($) |algreduc_flag|) 

(DEFUN |EXPR;setSimplifyDenomsFlag;2B;38| (|x| $)
  (PROG (|res|)
    (RETURN
     (SEQ
      (LETT |res| (SPADCALL (QREFELT $ 133))
            |EXPR;setSimplifyDenomsFlag;2B;38|)
      (SETF |algreduc_flag| |x|) (EXIT |res|))))) 

(DEFUN |EXPR;algreduc| (|x| |ckl| $)
  (PROG (|x1| |q| #1=#:G263 |k| |sas| #2=#:G262 |r| |akl|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |x1| (|EXPR;reduc| |x| |ckl| $) . #3=(|EXPR;algreduc|))
            (EXIT
             (COND
              ((SPADCALL (QREFELT $ 133))
               (SEQ
                (LETT |akl|
                      (|EXPR;algtower|
                       (SPADCALL (|spadConstant| $ 103)
                                 (SPADCALL |x1| (QREFELT $ 101))
                                 (QREFELT $ 132))
                       $)
                      . #3#)
                (EXIT
                 (COND ((EQL (LENGTH |akl|) 0) |x1|)
                       (#4='T
                        (SEQ
                         (COND
                          ((EQL (LENGTH |akl|) 1)
                           (SEQ
                            (LETT |r| (SPADCALL |akl| 1 (QREFELT $ 135)) . #3#)
                            (EXIT
                             (COND
                              ((|EXPR;simple_root| |r| $)
                               (PROGN
                                (LETT #2# (|EXPR;root_reduce| |x| |r| $) . #3#)
                                (GO #2#))))))))
                         (LETT |sas| (SPADCALL (QREFELT $ 137)) . #3#)
                         (SEQ (LETT |k| NIL . #3#) (LETT #1# |akl| . #3#) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (LETT |q|
                                     (SPADCALL |x1| |k|
                                               (SPADCALL |k| (QREFELT $ 138))
                                               (QREFELT $ 141))
                                     . #3#)
                               (EXIT
                                (LETT |x1|
                                      (SPADCALL
                                       (SPADCALL |q| |sas|
                                                 (SPADCALL |k| (QREFELT $ 142))
                                                 (QREFELT $ 143))
                                       (QREFELT $ 144))
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT (|EXPR;reduc| |x1| |akl| $))))))))
              (#4# |x1|)))))
      #2# (EXIT #2#))))) 

(DEFUN |EXPR;/;2Smp$;40| (|x| |y| $)
  (|EXPR;reduc| (SPADCALL |x| |y| (QREFELT $ 132))
   (|EXPR;commonk| (SPADCALL |x| (|spadConstant| $ 103) (QREFELT $ 132))
    (SPADCALL |y| (|spadConstant| $ 103) (QREFELT $ 132)) $)
   $)) 

(DEFUN |EXPR;reducedSystem;MM;41| (|m| $)
  (PROG (|mm|)
    (RETURN
     (SEQ
      (LETT |mm|
            (SPADCALL
             (SPADCALL (CONS (|function| |EXPR;toprat|) $) |m| (QREFELT $ 148))
             (QREFELT $ 151))
            |EXPR;reducedSystem;MM;41|)
      (EXIT (SPADCALL |mm| (QREFELT $ 153))))))) 

(DEFUN |EXPR;reducedSystem;MVR;42| (|m| |v| $)
  (PROG (|r|)
    (RETURN
     (SEQ
      (LETT |r|
            (SPADCALL
             (SPADCALL (CONS (|function| |EXPR;toprat|) $) |m| (QREFELT $ 148))
             (SPADCALL (CONS (|function| |EXPR;toprat|) $) |v| (QREFELT $ 156))
             (QREFELT $ 159))
            |EXPR;reducedSystem;MVR;42|)
      (EXIT (SPADCALL (QCAR |r|) (QCDR |r|) (QREFELT $ 161))))))) 

(DEFUN |EXPR;commonk0| (|x| |y| $)
  (PROG (|ans| #1=#:G278 |k|)
    (RETURN
     (SEQ (LETT |ans| NIL . #2=(|EXPR;commonk0|))
          (SEQ (LETT |k| NIL . #2#) (LETT #1# (NREVERSE |x|) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |k| |y| (QREFELT $ 163))
                   (LETT |ans| (SPADCALL |k| |ans| (QREFELT $ 164)) . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |EXPR;rootOf;SupS$;44| (|x| |v| $) (SPADCALL |x| |v| (QREFELT $ 166))) 

(DEFUN |EXPR;pi;$;45| ($) (SPADCALL (QREFELT $ 169))) 

(DEFUN |EXPR;exp;2$;46| (|x| $) (SPADCALL |x| (QREFELT $ 171))) 

(DEFUN |EXPR;log;2$;47| (|x| $) (SPADCALL |x| (QREFELT $ 173))) 

(DEFUN |EXPR;sin;2$;48| (|x| $) (SPADCALL |x| (QREFELT $ 175))) 

(DEFUN |EXPR;cos;2$;49| (|x| $) (SPADCALL |x| (QREFELT $ 177))) 

(DEFUN |EXPR;tan;2$;50| (|x| $) (SPADCALL |x| (QREFELT $ 179))) 

(DEFUN |EXPR;cot;2$;51| (|x| $) (SPADCALL |x| (QREFELT $ 181))) 

(DEFUN |EXPR;sec;2$;52| (|x| $) (SPADCALL |x| (QREFELT $ 183))) 

(DEFUN |EXPR;csc;2$;53| (|x| $) (SPADCALL |x| (QREFELT $ 185))) 

(DEFUN |EXPR;asin;2$;54| (|x| $) (SPADCALL |x| (QREFELT $ 187))) 

(DEFUN |EXPR;acos;2$;55| (|x| $) (SPADCALL |x| (QREFELT $ 189))) 

(DEFUN |EXPR;atan;2$;56| (|x| $) (SPADCALL |x| (QREFELT $ 191))) 

(DEFUN |EXPR;acot;2$;57| (|x| $) (SPADCALL |x| (QREFELT $ 193))) 

(DEFUN |EXPR;asec;2$;58| (|x| $) (SPADCALL |x| (QREFELT $ 195))) 

(DEFUN |EXPR;acsc;2$;59| (|x| $) (SPADCALL |x| (QREFELT $ 197))) 

(DEFUN |EXPR;sinh;2$;60| (|x| $) (SPADCALL |x| (QREFELT $ 199))) 

(DEFUN |EXPR;cosh;2$;61| (|x| $) (SPADCALL |x| (QREFELT $ 201))) 

(DEFUN |EXPR;tanh;2$;62| (|x| $) (SPADCALL |x| (QREFELT $ 203))) 

(DEFUN |EXPR;coth;2$;63| (|x| $) (SPADCALL |x| (QREFELT $ 205))) 

(DEFUN |EXPR;sech;2$;64| (|x| $) (SPADCALL |x| (QREFELT $ 207))) 

(DEFUN |EXPR;csch;2$;65| (|x| $) (SPADCALL |x| (QREFELT $ 209))) 

(DEFUN |EXPR;asinh;2$;66| (|x| $) (SPADCALL |x| (QREFELT $ 211))) 

(DEFUN |EXPR;acosh;2$;67| (|x| $) (SPADCALL |x| (QREFELT $ 213))) 

(DEFUN |EXPR;atanh;2$;68| (|x| $) (SPADCALL |x| (QREFELT $ 215))) 

(DEFUN |EXPR;acoth;2$;69| (|x| $) (SPADCALL |x| (QREFELT $ 217))) 

(DEFUN |EXPR;asech;2$;70| (|x| $) (SPADCALL |x| (QREFELT $ 219))) 

(DEFUN |EXPR;acsch;2$;71| (|x| $) (SPADCALL |x| (QREFELT $ 221))) 

(DEFUN |EXPR;abs;2$;72| (|x| $) (SPADCALL |x| (QREFELT $ 224))) 

(DEFUN |EXPR;Gamma;2$;73| (|x| $) (SPADCALL |x| (QREFELT $ 226))) 

(DEFUN |EXPR;Gamma;3$;74| (|a| |x| $) (SPADCALL |a| |x| (QREFELT $ 228))) 

(DEFUN |EXPR;Beta;3$;75| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 230))) 

(DEFUN |EXPR;digamma;2$;76| (|x| $) (SPADCALL |x| (QREFELT $ 232))) 

(DEFUN |EXPR;polygamma;3$;77| (|k| |x| $) (SPADCALL |k| |x| (QREFELT $ 234))) 

(DEFUN |EXPR;besselJ;3$;78| (|v| |x| $) (SPADCALL |v| |x| (QREFELT $ 236))) 

(DEFUN |EXPR;besselY;3$;79| (|v| |x| $) (SPADCALL |v| |x| (QREFELT $ 238))) 

(DEFUN |EXPR;besselI;3$;80| (|v| |x| $) (SPADCALL |v| |x| (QREFELT $ 240))) 

(DEFUN |EXPR;besselK;3$;81| (|v| |x| $) (SPADCALL |v| |x| (QREFELT $ 242))) 

(DEFUN |EXPR;airyAi;2$;82| (|x| $) (SPADCALL |x| (QREFELT $ 244))) 

(DEFUN |EXPR;airyAiPrime;2$;83| (|x| $) (SPADCALL |x| (QREFELT $ 246))) 

(DEFUN |EXPR;airyBi;2$;84| (|x| $) (SPADCALL |x| (QREFELT $ 248))) 

(DEFUN |EXPR;airyBiPrime;2$;85| (|x| $) (SPADCALL |x| (QREFELT $ 250))) 

(DEFUN |EXPR;lambertW;2$;86| (|x| $) (SPADCALL |x| (QREFELT $ 252))) 

(DEFUN |EXPR;polylog;3$;87| (|s| |x| $) (SPADCALL |s| |x| (QREFELT $ 254))) 

(DEFUN |EXPR;weierstrassP;4$;88| (|g2| |g3| |x| $)
  (SPADCALL |g2| |g3| |x| (QREFELT $ 256))) 

(DEFUN |EXPR;weierstrassPPrime;4$;89| (|g2| |g3| |x| $)
  (SPADCALL |g2| |g3| |x| (QREFELT $ 258))) 

(DEFUN |EXPR;weierstrassSigma;4$;90| (|g2| |g3| |x| $)
  (SPADCALL |g2| |g3| |x| (QREFELT $ 260))) 

(DEFUN |EXPR;weierstrassZeta;4$;91| (|g2| |g3| |x| $)
  (SPADCALL |g2| |g3| |x| (QREFELT $ 262))) 

(DEFUN |EXPR;whittakerM;4$;92| (|k| |m| |z| $)
  (SPADCALL |k| |m| |z| (QREFELT $ 264))) 

(DEFUN |EXPR;whittakerW;4$;93| (|k| |m| |z| $)
  (SPADCALL |k| |m| |z| (QREFELT $ 266))) 

(DEFUN |EXPR;angerJ;3$;94| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 268))) 

(DEFUN |EXPR;weberE;3$;95| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 270))) 

(DEFUN |EXPR;struveH;3$;96| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 272))) 

(DEFUN |EXPR;struveL;3$;97| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 274))) 

(DEFUN |EXPR;hankelH1;3$;98| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 276))) 

(DEFUN |EXPR;hankelH2;3$;99| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 278))) 

(DEFUN |EXPR;lommelS1;4$;100| (|mu| |nu| |z| $)
  (SPADCALL |mu| |nu| |z| (QREFELT $ 280))) 

(DEFUN |EXPR;lommelS2;4$;101| (|mu| |nu| |z| $)
  (SPADCALL |mu| |nu| |z| (QREFELT $ 282))) 

(DEFUN |EXPR;kummerM;4$;102| (|mu| |nu| |z| $)
  (SPADCALL |mu| |nu| |z| (QREFELT $ 284))) 

(DEFUN |EXPR;kummerU;4$;103| (|mu| |nu| |z| $)
  (SPADCALL |mu| |nu| |z| (QREFELT $ 286))) 

(DEFUN |EXPR;legendreP;4$;104| (|nu| |mu| |z| $)
  (SPADCALL |nu| |mu| |z| (QREFELT $ 288))) 

(DEFUN |EXPR;legendreQ;4$;105| (|nu| |mu| |z| $)
  (SPADCALL |nu| |mu| |z| (QREFELT $ 290))) 

(DEFUN |EXPR;kelvinBei;3$;106| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 292))) 

(DEFUN |EXPR;kelvinBer;3$;107| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 294))) 

(DEFUN |EXPR;kelvinKei;3$;108| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 296))) 

(DEFUN |EXPR;kelvinKer;3$;109| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 298))) 

(DEFUN |EXPR;ellipticK;2$;110| (|m| $) (SPADCALL |m| (QREFELT $ 300))) 

(DEFUN |EXPR;ellipticE;2$;111| (|m| $) (SPADCALL |m| (QREFELT $ 302))) 

(DEFUN |EXPR;ellipticE;3$;112| (|z| |m| $) (SPADCALL |z| |m| (QREFELT $ 304))) 

(DEFUN |EXPR;ellipticF;3$;113| (|z| |m| $) (SPADCALL |z| |m| (QREFELT $ 306))) 

(DEFUN |EXPR;ellipticPi;4$;114| (|z| |n| |m| $)
  (SPADCALL |z| |n| |m| (QREFELT $ 308))) 

(DEFUN |EXPR;jacobiSn;3$;115| (|z| |m| $) (SPADCALL |z| |m| (QREFELT $ 310))) 

(DEFUN |EXPR;jacobiCn;3$;116| (|z| |m| $) (SPADCALL |z| |m| (QREFELT $ 312))) 

(DEFUN |EXPR;jacobiDn;3$;117| (|z| |m| $) (SPADCALL |z| |m| (QREFELT $ 314))) 

(DEFUN |EXPR;jacobiZeta;3$;118| (|z| |m| $) (SPADCALL |z| |m| (QREFELT $ 316))) 

(DEFUN |EXPR;jacobiTheta;3$;119| (|q| |z| $) (SPADCALL |q| |z| (QREFELT $ 318))) 

(DEFUN |EXPR;lerchPhi;4$;120| (|z| |s| |a| $)
  (SPADCALL |z| |s| |a| (QREFELT $ 320))) 

(DEFUN |EXPR;riemannZeta;2$;121| (|z| $) (SPADCALL |z| (QREFELT $ 322))) 

(DEFUN |EXPR;hypergeometricF;2L2$;122| (|la| |lb| |x| $)
  (SPADCALL |la| |lb| |x| (QREFELT $ 324))) 

(DEFUN |EXPR;meijerG;4L2$;123| (|la| |lb| |lc| |ld| |x| $)
  (SPADCALL |la| |lb| |lc| |ld| |x| (QREFELT $ 327))) 

(DEFUN |EXPR;^;3$;124| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 330))) 

(DEFUN |EXPR;factorial;2$;125| (|x| $) (SPADCALL |x| (QREFELT $ 331))) 

(DEFUN |EXPR;binomial;3$;126| (|n| |m| $) (SPADCALL |n| |m| (QREFELT $ 333))) 

(DEFUN |EXPR;permutation;3$;127| (|n| |m| $) (SPADCALL |n| |m| (QREFELT $ 335))) 

(DEFUN |EXPR;factorials;2$;128| (|x| $) (SPADCALL |x| (QREFELT $ 337))) 

(DEFUN |EXPR;factorials;$S$;129| (|x| |n| $) (SPADCALL |x| |n| (QREFELT $ 339))) 

(DEFUN |EXPR;summation;$S$;130| (|x| |n| $) (SPADCALL |x| |n| (QREFELT $ 341))) 

(DEFUN |EXPR;summation;$Sb$;131| (|x| |s| $) (SPADCALL |x| |s| (QREFELT $ 344))) 

(DEFUN |EXPR;product;$S$;132| (|x| |n| $) (SPADCALL |x| |n| (QREFELT $ 347))) 

(DEFUN |EXPR;product;$Sb$;133| (|x| |s| $) (SPADCALL |x| |s| (QREFELT $ 349))) 

(DEFUN |EXPR;erf;2$;134| (|x| $) (SPADCALL |x| (QREFELT $ 352))) 

(DEFUN |EXPR;Ei;2$;135| (|x| $) (SPADCALL |x| (QREFELT $ 354))) 

(DEFUN |EXPR;Si;2$;136| (|x| $) (SPADCALL |x| (QREFELT $ 356))) 

(DEFUN |EXPR;Ci;2$;137| (|x| $) (SPADCALL |x| (QREFELT $ 358))) 

(DEFUN |EXPR;Shi;2$;138| (|x| $) (SPADCALL |x| (QREFELT $ 360))) 

(DEFUN |EXPR;Chi;2$;139| (|x| $) (SPADCALL |x| (QREFELT $ 362))) 

(DEFUN |EXPR;li;2$;140| (|x| $) (SPADCALL |x| (QREFELT $ 364))) 

(DEFUN |EXPR;dilog;2$;141| (|x| $) (SPADCALL |x| (QREFELT $ 366))) 

(DEFUN |EXPR;fresnelS;2$;142| (|x| $) (SPADCALL |x| (QREFELT $ 368))) 

(DEFUN |EXPR;fresnelC;2$;143| (|x| $) (SPADCALL |x| (QREFELT $ 370))) 

(DEFUN |EXPR;integral;$S$;144| (|x| |n| $) (SPADCALL |x| |n| (QREFELT $ 372))) 

(DEFUN |EXPR;integral;$Sb$;145| (|x| |s| $) (SPADCALL |x| |s| (QREFELT $ 374))) 

(DEFUN |EXPR;operator;2Bo;146| (|op| $)
  (PROG (|n|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |op| (QREFELT $ 376)) (SPADCALL |op| (QREFELT $ 377)))
            ((SPADCALL |op| (QREFELT $ 378)) (SPADCALL |op| (QREFELT $ 379)))
            ((SPADCALL |op| (QREFELT $ 380)) (SPADCALL |op| (QREFELT $ 381)))
            ((SPADCALL |op| (QREFELT $ 382)) (SPADCALL |op| (QREFELT $ 383)))
            ((SPADCALL |op| (QREFELT $ 384)) (SPADCALL |op| (QREFELT $ 385)))
            ((SPADCALL |op| (QREFELT $ 21)) (SPADCALL |op| (QREFELT $ 22)))
            ((SPADCALL |op| (QREFELT $ 24)) (SPADCALL |op| (QREFELT $ 25)))
            (#1='T
             (SEQ
              (COND
               ((SPADCALL |op| (QREFELT $ 26))
                (COND
                 ((SPADCALL |op| (QREFELT $ 7) (QREFELT $ 28))
                  (EXIT
                   (SPADCALL
                    (SPADCALL (SPADCALL |op| (QREFELT $ 29)) (QREFELT $ 30))
                    (QREFELT $ 31)))))))
              (LETT |n| (SPADCALL |op| (QREFELT $ 33)) |EXPR;operator;2Bo;146|)
              (EXIT
               (COND
                ((QEQCAR |n| 1)
                 (SPADCALL (SPADCALL |op| (QREFELT $ 29)) (QREFELT $ 34)))
                (#1#
                 (SPADCALL (SPADCALL |op| (QREFELT $ 29)) (QCDR |n|)
                           (QREFELT $ 36)))))))))))) 

(DEFUN |EXPR;reduc| (|x| |l| $)
  (PROG (|p| #1=#:G399 |k|)
    (RETURN
     (SEQ
      (SEQ (LETT |k| NIL . #2=(|EXPR;reduc|)) (LETT #1# |l| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ (LETT |p| (SPADCALL |k| (QREFELT $ 138)) . #2#)
                (EXIT
                 (LETT |x|
                       (SPADCALL
                        (|EXPR;evl| (SPADCALL |x| (QREFELT $ 99)) |k| |p| $)
                        (|EXPR;evl| (SPADCALL |x| (QREFELT $ 101)) |k| |p| $)
                        (QREFELT $ 68))
                       . #2#)))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |x|))))) 

(DEFUN |EXPR;evl0| (|p| |k| $)
  (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 387)) |k| (QREFELT $ 390))
            (QREFELT $ 392))) 

(DEFUN |EXPR;evl| (|p| |k| |m| $)
  (COND
   ((< (SPADCALL |p| |k| (QREFELT $ 393)) (SPADCALL |m| (QREFELT $ 394)))
    (SPADCALL |p| (QREFELT $ 387)))
   ('T
    (SPADCALL (SPADCALL (|EXPR;evl0| |p| |k| $) |m| (QREFELT $ 395))
              (SPADCALL (SPADCALL |k| (QREFELT $ 396)) (QREFELT $ 387))
              (QREFELT $ 397))))) 

(DEFUN |EXPR;noalg?| (|p| $)
  (PROG (#1=#:G407)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ G190
             (COND
              ((NULL (SPADCALL |p| (|spadConstant| $ 398) (QREFELT $ 399)))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((NULL
                  (NULL
                   (|EXPR;algkernels|
                    (SPADCALL (SPADCALL |p| (QREFELT $ 400)) (QREFELT $ 75))
                    $)))
                 (PROGN (LETT #1# 'NIL . #2=(|EXPR;noalg?|)) (GO #1#)))
                ('T (LETT |p| (SPADCALL |p| (QREFELT $ 401)) . #2#)))))
             NIL (GO G190) G191 (EXIT NIL))
        (EXIT 'T)))
      #1# (EXIT #1#))))) 

(DEFUN |EXPR;gcdPolynomial;3Sup;151| (|p| |q| $)
  (SEQ
   (COND
    ((|EXPR;noalg?| |p| $)
     (COND ((|EXPR;noalg?| |q| $) (EXIT (SPADCALL |p| |q| (QREFELT $ 402)))))))
   (EXIT (SPADCALL |p| |q| (QREFELT $ 404))))) 

(DEFUN |EXPR;factorPolynomial;SupF;152| (|x| $)
  (PROG (|uf|)
    (RETURN
     (SEQ
      (LETT |uf| (SPADCALL |x| (QREFELT $ 408))
            |EXPR;factorPolynomial;SupF;152|)
      (EXIT |uf|))))) 

(DEFUN |EXPR;squareFreePolynomial;SupF;153| (|x| $)
  (PROG (|uf|)
    (RETURN
     (SEQ
      (LETT |uf| (SPADCALL |x| (QREFELT $ 411))
            |EXPR;squareFreePolynomial;SupF;153|)
      (EXIT |uf|))))) 

(DEFUN |EXPR;coerce;An$;154| (|x| $)
  (SPADCALL (SPADCALL |x| (|spadConstant| $ 414) (QREFELT $ 415))
            (QREFELT $ 104))) 

(DEFUN |EXPR;^;$F$;155| (|x| |r| $) (SPADCALL |x| |r| (QREFELT $ 419))) 

(DEFUN |EXPR;minPoly;KSup;156| (|k| $) (SPADCALL |k| (QREFELT $ 421))) 

(DEFUN |EXPR;definingPolynomial;2$;157| (|x| $) (SPADCALL |x| (QREFELT $ 422))) 

(DEFUN |EXPR;retract;$F;158| (|x| $) (SPADCALL |x| (QREFELT $ 424))) 

(DEFUN |EXPR;retractIfCan;$U;159| (|x| $) (SPADCALL |x| (QREFELT $ 426))) 

(DEFUN |EXPR;coerce;An$;160| (|x| $)
  (SPADCALL (|EXPR;smp2expr| (SPADCALL |x| (QREFELT $ 428)) $)
            (|EXPR;smp2expr| (SPADCALL |x| (QREFELT $ 429)) $) (QREFELT $ 69))) 

(DEFUN |EXPR;k2expr| (|k| $) (SPADCALL (ELT $ 417) |k| (QREFELT $ 433))) 

(DEFUN |EXPR;smp2expr| (|p| $)
  (SPADCALL (CONS (|function| |EXPR;k2expr|) $) (ELT $ 61) |p| (QREFELT $ 438))) 

(DEFUN |EXPR;retractIfCan;$U;163| (|x| $)
  (PROG (#1=#:G434 |d| |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |n| (|EXPR;smp2an| (SPADCALL |x| (QREFELT $ 99)) $)
               . #2=(|EXPR;retractIfCan;$U;163|))
         (EXIT
          (COND
           ((QEQCAR |n| 0)
            (SEQ
             (LETT |d| (|EXPR;smp2an| (SPADCALL |x| (QREFELT $ 101)) $) . #2#)
             (EXIT
              (COND
               ((QEQCAR |d| 0)
                (PROGN
                 (LETT #1#
                       (CONS 0
                             (SPADCALL (QCDR |n|) (QCDR |d|) (QREFELT $ 439)))
                       . #2#)
                 (GO #1#))))))))))
        (EXIT (CONS 1 "failed"))))
      #1# (EXIT #1#))))) 

(DEFUN |EXPR;R2AN| (|r| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (LETT |u| (SPADCALL (SPADCALL |r| (QREFELT $ 442)) (QREFELT $ 72))
            |EXPR;R2AN|)
      (EXIT
       (COND ((QEQCAR |u| 0) (CONS 0 (SPADCALL (QCDR |u|) (QREFELT $ 443))))
             ('T (CONS 1 "failed")))))))) 

(DEFUN |EXPR;k2an| (|k| $)
  (PROG (|arg| #1=#:G469 |a| #2=#:G470 |x| |eq| |eqa| |ccu| |cc| |a1| |s1|
         |s1u| |k1| |k1u| |a2| |args| |op|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((NULL
          (SPADCALL
           (LETT |op| (SPADCALL |k| (QREFELT $ 31)) . #3=(|EXPR;k2an|))
           (QREFELT $ 444)))
         (CONS 1 "failed"))
        ('T
         (COND
          ((SPADCALL |op| '|rootOf| (QREFELT $ 445))
           (SEQ (LETT |args| (SPADCALL |k| (QREFELT $ 79)) . #3#)
                (LETT |a2| (SPADCALL |args| 2 (QREFELT $ 81)) . #3#)
                (LETT |k1u| (SPADCALL |a2| (QREFELT $ 19)) . #3#)
                (EXIT
                 (COND ((QEQCAR |k1u| 1) (CONS 1 "failed"))
                       (#4='T
                        (SEQ (LETT |k1| (QCDR |k1u|) . #3#)
                             (LETT |s1u| (SPADCALL |a2| (QREFELT $ 447)) . #3#)
                             (EXIT
                              (COND ((QEQCAR |s1u| 1) (CONS 1 "failed"))
                                    (#4#
                                     (SEQ (LETT |s1| (QCDR |s1u|) . #3#)
                                          (LETT |a1|
                                                (SPADCALL |args| 1
                                                          (QREFELT $ 81))
                                                . #3#)
                                          (EXIT
                                           (COND
                                            ((SPADCALL
                                              (SPADCALL |a1| (QREFELT $ 101))
                                              (|spadConstant| $ 103)
                                              (QREFELT $ 448))
                                             (|error|
                                              "Bad argument to rootOf"))
                                            (#4#
                                             (SEQ
                                              (LETT |eq|
                                                    (SPADCALL
                                                     (SPADCALL |a1|
                                                               (QREFELT $ 99))
                                                     |k1| (QREFELT $ 125))
                                                    . #3#)
                                              (LETT |eqa|
                                                    (|spadConstant| $ 450)
                                                    . #3#)
                                              (SEQ G190
                                                   (COND
                                                    ((NULL
                                                      (SPADCALL |eq|
                                                                (|spadConstant|
                                                                 $ 451)
                                                                (QREFELT $
                                                                         452)))
                                                     (GO G191)))
                                                   (SEQ
                                                    (LETT |cc|
                                                          (SPADCALL
                                                           (SPADCALL |eq|
                                                                     (QREFELT $
                                                                              127))
                                                           (QREFELT $ 104))
                                                          . #3#)
                                                    (LETT |ccu|
                                                          (SPADCALL |cc|
                                                                    (QREFELT $
                                                                             441))
                                                          . #3#)
                                                    (EXIT
                                                     (COND
                                                      ((QEQCAR |ccu| 1)
                                                       (PROGN
                                                        (LETT #1#
                                                              (CONS 1 "failed")
                                                              . #3#)
                                                        (GO #1#)))
                                                      ('T
                                                       (SEQ
                                                        (LETT |eqa|
                                                              (SPADCALL |eqa|
                                                                        (SPADCALL
                                                                         (QCDR
                                                                          |ccu|)
                                                                         (SPADCALL
                                                                          |eq|
                                                                          (QREFELT
                                                                           $
                                                                           453))
                                                                         (QREFELT
                                                                          $
                                                                          454))
                                                                        (QREFELT
                                                                         $
                                                                         455))
                                                              . #3#)
                                                        (EXIT
                                                         (LETT |eq|
                                                               (SPADCALL |eq|
                                                                         (QREFELT
                                                                          $
                                                                          128))
                                                               . #3#)))))))
                                                   NIL (GO G190) G191
                                                   (EXIT NIL))
                                              (EXIT
                                               (CONS 0
                                                     (SPADCALL |eqa| |s1|
                                                               (QREFELT $
                                                                        456))))))))))))))))))
          (#4#
           (SEQ (LETT |arg| NIL . #3#)
                (SEQ (LETT |x| NIL . #3#)
                     (LETT #2# (SPADCALL |k| (QREFELT $ 79)) . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ (LETT |a| (SPADCALL |x| (QREFELT $ 441)) . #3#)
                          (EXIT
                           (COND
                            ((QEQCAR |a| 1)
                             (PROGN
                              (LETT #1# (CONS 1 "failed") . #3#)
                              (GO #1#)))
                            ('T (LETT |arg| (CONS (QCDR |a|) |arg|) . #3#)))))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (CONS 0
                       (SPADCALL (SPADCALL |op| (QREFELT $ 457))
                                 (NREVERSE |arg|) (QREFELT $ 458))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |EXPR;smp2an| (|p| $)
  (PROG (|c| |up| |ans| #1=#:G484 |t| |k| |x1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |x1| (SPADCALL |p| (QREFELT $ 460)) . #2=(|EXPR;smp2an|))
            (EXIT
             (COND
              ((QEQCAR |x1| 1) (|EXPR;R2AN| (SPADCALL |p| (QREFELT $ 461)) $))
              (#3='T
               (SEQ
                (LETT |up|
                      (SPADCALL |p| (LETT |k| (QCDR |x1|) . #2#)
                                (QREFELT $ 125))
                      . #2#)
                (LETT |t| (|EXPR;k2an| |k| $) . #2#)
                (EXIT
                 (COND ((QEQCAR |t| 1) (CONS 1 "failed"))
                       (#3#
                        (SEQ (LETT |ans| (|spadConstant| $ 462) . #2#)
                             (SEQ G190
                                  (COND
                                   ((NULL
                                     (COND
                                      ((SPADCALL |up| (QREFELT $ 463)) 'NIL)
                                      ('T 'T)))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |c|
                                         (|EXPR;smp2an|
                                          (SPADCALL |up| (QREFELT $ 127)) $)
                                         . #2#)
                                   (EXIT
                                    (COND
                                     ((QEQCAR |c| 1)
                                      (PROGN
                                       (LETT #1# (CONS 1 "failed") . #2#)
                                       (GO #1#)))
                                     ('T
                                      (SEQ
                                       (LETT |ans|
                                             (SPADCALL |ans|
                                                       (SPADCALL (QCDR |c|)
                                                                 (SPADCALL
                                                                  (QCDR |t|)
                                                                  (SPADCALL
                                                                   |up|
                                                                   (QREFELT $
                                                                            453))
                                                                  (QREFELT $
                                                                           464))
                                                                 (QREFELT $
                                                                          465))
                                                       (QREFELT $ 466))
                                             . #2#)
                                       (EXIT
                                        (LETT |up|
                                              (SPADCALL |up| (QREFELT $ 128))
                                              . #2#)))))))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (LETT |c|
                                   (|EXPR;smp2an|
                                    (SPADCALL |up| (QREFELT $ 127)) $)
                                   . #2#)
                             (EXIT
                              (COND ((QEQCAR |c| 1) (CONS 1 "failed"))
                                    (#3#
                                     (CONS 0
                                           (SPADCALL |ans| (QCDR |c|)
                                                     (QREFELT $
                                                              466))))))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |EXPR;convert;$If;167| (|x| $) (SPADCALL |x| (QREFELT $ 468))) 

(DEFUN |EXPR;eval;$Bo$S$;168| (|f| |op| |g| |x| $)
  (SPADCALL |f| (LIST |op|) (LIST |g|) |x| (QREFELT $ 471))) 

(DEFUN |EXPR;eval;$LLS$;169| (|f| |ls| |lg| |x| $)
  (PROG (|res| #1=#:G515 |g| #2=#:G514 |nlg| #3=#:G513 #4=#:G512
         |lbackwardSubs| #5=#:G510 |i| #6=#:G511 |j| #7=#:G509 |lforwardSubs|
         #8=#:G507 #9=#:G508 #10=#:G506 |ns| #11=#:G505 #12=#:G504 #13=#:G503
         #14=#:G502 |lsd| |lsym| |llsym| #15=#:G501 #16=#:G500)
    (RETURN
     (SEQ
      (LETT |llsym|
            (PROGN
             (LETT #16# NIL . #17=(|EXPR;eval;$LLS$;169|))
             (SEQ (LETT |g| NIL . #17#) (LETT #15# |lg| . #17#) G190
                  (COND
                   ((OR (ATOM #15#) (PROGN (LETT |g| (CAR #15#) . #17#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #16# (CONS (SPADCALL |g| (QREFELT $ 473)) #16#)
                          . #17#)))
                  (LETT #15# (CDR #15#) . #17#) (GO G190) G191
                  (EXIT (NREVERSE #16#))))
            . #17#)
      (LETT |lsym|
            (SPADCALL (SPADCALL |llsym| (QREFELT $ 474)) (QREFELT $ 475))
            . #17#)
      (LETT |lsd| (SPADCALL (ELT $ 476) |lsym| (QREFELT $ 478)) . #17#)
      (EXIT
       (COND
        ((NULL |lsd|)
         (SPADCALL |f| |ls|
                   (PROGN
                    (LETT #14# NIL . #17#)
                    (SEQ (LETT |g| NIL . #17#) (LETT #13# |lg| . #17#) G190
                         (COND
                          ((OR (ATOM #13#)
                               (PROGN (LETT |g| (CAR #13#) . #17#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #14#
                                 (CONS (SPADCALL |g| |x| (QREFELT $ 480)) #14#)
                                 . #17#)))
                         (LETT #13# (CDR #13#) . #17#) (GO G190) G191
                         (EXIT (NREVERSE #14#))))
                   (QREFELT $ 483)))
        ('T
         (SEQ
          (LETT |ns|
                (PROGN
                 (LETT #12# NIL . #17#)
                 (SEQ (LETT |i| NIL . #17#) (LETT #11# |lsd| . #17#) G190
                      (COND
                       ((OR (ATOM #11#)
                            (PROGN (LETT |i| (CAR #11#) . #17#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #12# (CONS (SPADCALL (QREFELT $ 484)) #12#)
                              . #17#)))
                      (LETT #11# (CDR #11#) . #17#) (GO G190) G191
                      (EXIT (NREVERSE #12#))))
                . #17#)
          (LETT |lforwardSubs|
                (PROGN
                 (LETT #10# NIL . #17#)
                 (SEQ (LETT |j| NIL . #17#) (LETT #9# |ns| . #17#)
                      (LETT |i| NIL . #17#) (LETT #8# |lsd| . #17#) G190
                      (COND
                       ((OR (ATOM #8#) (PROGN (LETT |i| (CAR #8#) . #17#) NIL)
                            (ATOM #9#) (PROGN (LETT |j| (CAR #9#) . #17#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #10#
                              (CONS
                               (SPADCALL (SPADCALL |i| (QREFELT $ 485))
                                         (SPADCALL |j| (QREFELT $ 485))
                                         (QREFELT $ 487))
                               #10#)
                              . #17#)))
                      (LETT #8# (PROG1 (CDR #8#) (LETT #9# (CDR #9#) . #17#))
                            . #17#)
                      (GO G190) G191 (EXIT (NREVERSE #10#))))
                . #17#)
          (LETT |lbackwardSubs|
                (PROGN
                 (LETT #7# NIL . #17#)
                 (SEQ (LETT |j| NIL . #17#) (LETT #6# |ns| . #17#)
                      (LETT |i| NIL . #17#) (LETT #5# |lsd| . #17#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |i| (CAR #5#) . #17#) NIL)
                            (ATOM #6#) (PROGN (LETT |j| (CAR #6#) . #17#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #7#
                              (CONS
                               (SPADCALL (SPADCALL |j| (QREFELT $ 485))
                                         (SPADCALL |i| (QREFELT $ 485))
                                         (QREFELT $ 487))
                               #7#)
                              . #17#)))
                      (LETT #5# (PROG1 (CDR #5#) (LETT #6# (CDR #6#) . #17#))
                            . #17#)
                      (GO G190) G191 (EXIT (NREVERSE #7#))))
                . #17#)
          (LETT |nlg|
                (PROGN
                 (LETT #4# NIL . #17#)
                 (SEQ (LETT |g| NIL . #17#) (LETT #3# |lg| . #17#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |g| (CAR #3#) . #17#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (SPADCALL |g| |lforwardSubs| (QREFELT $ 489))
                               #4#)
                              . #17#)))
                      (LETT #3# (CDR #3#) . #17#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #17#)
          (LETT |res|
                (SPADCALL |f| |ls|
                          (PROGN
                           (LETT #2# NIL . #17#)
                           (SEQ (LETT |g| NIL . #17#) (LETT #1# |nlg| . #17#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |g| (CAR #1#) . #17#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (SPADCALL |g| |x| (QREFELT $ 480))
                                         #2#)
                                        . #17#)))
                                (LETT #1# (CDR #1#) . #17#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 483))
                . #17#)
          (EXIT (SPADCALL |res| |lbackwardSubs| (QREFELT $ 489))))))))))) 

(DEFUN |EXPR;patternMatch;$P2Pmr;170| (|x| |p| |l| $)
  (SPADCALL |x| |p| |l| (QREFELT $ 493))) 

(DEFUN |EXPR;patternMatch;$P2Pmr;171| (|x| |p| |l| $)
  (SPADCALL |x| |p| |l| (QREFELT $ 499))) 

(DEFUN |EXPR;Zero;$;172| ($) (|spadConstant| $ 46)) 

(DEFUN |EXPR;One;$;173| ($) (|spadConstant| $ 48)) 

(DEFUN |EXPR;-;2$;174| (|x| $) (SPADCALL |x| (QREFELT $ 55))) 

(DEFUN |EXPR;*;I2$;175| (|n| |x| $) (SPADCALL |n| |x| (QREFELT $ 58))) 

(DEFUN |EXPR;*;3$;176| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 62))) 

(DEFUN |EXPR;+;3$;177| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 64))) 

(DEFUN |EXPR;=;2$B;178| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 51))) 

(DEFUN |EXPR;smaller?;2$B;179| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 94))) 

(PUT '|EXPR;numer;$Smp;180| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |EXPR;numer;$Smp;180| (|x| $) |x|) 

(PUT '|EXPR;coerce;Smp$;181| '|SPADreplace| '(XLAM (|p|) |p|)) 

(DEFUN |EXPR;coerce;Smp$;181| (|p| $) |p|) 

(DEFUN |EXPR;coerce;P$;182| (|p| $) (|EXPR;poly_to_MP| |p| $)) 

(DEFUN |EXPR;reducedSystem;MM;183| (|m| $) (SPADCALL |m| (QREFELT $ 502))) 

(DEFUN |EXPR;reducedSystem;MVR;184| (|m| |v| $)
  (SPADCALL |m| |v| (QREFELT $ 503))) 

(DEFUN |EXPR;convert;$If;185| (|x| $) (SPADCALL |x| (QREFELT $ 468))) 

(DEFUN |EXPR;kintmatch| (|k| |p| |l| $) (SPADCALL |k| |p| |l| (QREFELT $ 505))) 

(DEFUN |EXPR;patternMatch;$P2Pmr;187| (|x| |p| |l| $)
  (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kintmatch|) $) (QREFELT $ 509))) 

(DEFUN |EXPR;kfltmatch| (|k| |p| |l| $) (SPADCALL |k| |p| |l| (QREFELT $ 511))) 

(DEFUN |EXPR;patternMatch;$P2Pmr;189| (|x| |p| |l| $)
  (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kfltmatch|) $) (QREFELT $ 515))) 

(DEFUN |EXPR;Zero;$;190| ($) (|spadConstant| $ 46)) 

(DEFUN |EXPR;+;3$;191| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 64))) 

(DEFUN |EXPR;=;2$B;192| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 51))) 

(DEFUN |EXPR;smaller?;2$B;193| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 94))) 

(DEFUN |EXPR;coerce;K$;194| (|k| $) (SPADCALL |k| (QREFELT $ 516))) 

(DEFUN |EXPR;kernels;$L;195| (|x| $)
  (PROG (#1=#:G552 |f| #2=#:G551)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|EXPR;kernels;$L;195|))
       (SEQ (LETT |f| NIL . #3#)
            (LETT #1# (SPADCALL |x| (QREFELT $ 519)) . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ (EXIT (LETT #2# (CONS (QCAR |f|) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |EXPR;coerce;R$;196| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 520)) (|spadConstant| $ 47))
        ('T (SPADCALL (SPADCALL |x| (QREFELT $ 521)) (QREFELT $ 142))))) 

(DEFUN |EXPR;retract;$R;197| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 54)) (|spadConstant| $ 87))
        ('T (|EXPR;retNotUnit| |x| $)))) 

(DEFUN |EXPR;coerce;$Of;198| (|x| $) (SPADCALL |x| (QREFELT $ 524))) 

(DEFUN |EXPR;kereval| (|k| |lk| |lv| $)
  (PROG ()
    (RETURN
     (SPADCALL |lk| |lv| |k| (CONS #'|EXPR;kereval!1| (VECTOR |lk| |lv| $))
               (QREFELT $ 530))))) 

(DEFUN |EXPR;kereval!1| (|x2| $$)
  (PROG ($ |lv| |lk|)
    (LETT $ (QREFELT $$ 2) . #1=(|EXPR;kereval|))
    (LETT |lv| (QREFELT $$ 1) . #1#)
    (LETT |lk| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (SPADCALL (CONS #'|EXPR;kereval!0| (VECTOR $ |lv| |lk|)) |x2|
                   (QREFELT $ 527)))))))) 

(DEFUN |EXPR;kereval!0| (|x1| $$)
  (PROG (|lk| |lv| $)
    (LETT |lk| (QREFELT $$ 2) NIL)
    (LETT |lv| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x1| |lk| |lv| (QREFELT $ 526)))))) 

(DEFUN |EXPR;subeval| (|k| |lk| |lv| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL |lk| |lv| |k| (CONS #'|EXPR;subeval!0| (VECTOR |lv| |lk| $))
                (QREFELT $ 530)))))) 

(DEFUN |EXPR;subeval!0| (|x| $$)
  (PROG ($ |lk| |lv|)
    (LETT $ (QREFELT $$ 2) . #1=(|EXPR;subeval|))
    (LETT |lk| (QREFELT $$ 1) . #1#)
    (LETT |lv| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G576 |a| #3=#:G575)
        (RETURN
         (SEQ
          (SPADCALL (SPADCALL |x| (QREFELT $ 31))
                    (PROGN
                     (LETT #3# NIL NIL)
                     (SEQ (LETT |a| NIL NIL)
                          (LETT #2# (SPADCALL |x| (QREFELT $ 79)) NIL) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |a| (CAR #2#) NIL) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS
                                   (SPADCALL |a| |lk| |lv| (QREFELT $ 531))
                                   #3#)
                                  NIL)))
                          (LETT #2# (CDR #2#) NIL) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    (QREFELT $ 532))))))))) 

(DEFUN |EXPR;isPlus;$U;201| (|x| $)
  (PROG (#1=#:G591 |t| #2=#:G590 |l|)
    (RETURN
     (SEQ
      (COND
       ((OR
         (NULL
          (LETT |l| (SPADCALL |x| (QREFELT $ 519))
                . #3=(|EXPR;isPlus;$U;201|)))
         (NULL (CDR |l|)))
        (CONS 1 "failed"))
       ('T
        (CONS 0
              (PROGN
               (LETT #2# NIL . #3#)
               (SEQ (LETT |t| NIL . #3#) (LETT #1# |l| . #3#) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2#
                            (CONS
                             (SPADCALL (QCDR |t|) (QCAR |t|) (QREFELT $ 533))
                             #2#)
                            . #3#)))
                    (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#))))))))))) 

(DEFUN |EXPR;isMult;$U;202| (|x| $)
  (PROG (|t| |l|)
    (RETURN
     (SEQ
      (COND
       ((OR
         (NULL
          (LETT |l| (SPADCALL |x| (QREFELT $ 519))
                . #1=(|EXPR;isMult;$U;202|)))
         (NULL (NULL (CDR |l|))))
        (CONS 1 "failed"))
       ('T
        (SEQ (LETT |t| (SPADCALL |l| (QREFELT $ 536)) . #1#)
             (EXIT (CONS 0 (CONS (QCDR |t|) (QCAR |t|))))))))))) 

(DEFUN |EXPR;eval;$LL$;203| (|x| |lk| |lv| $)
  (PROG (#1=#:G607 #2=#:G606 #3=#:G608 #4=#:G610 |t|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|EXPR;eval;$LL$;203|))
       (SEQ (LETT |t| NIL . #5#)
            (LETT #4# (SPADCALL |x| (QREFELT $ 519)) . #5#) G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3#
                     (SPADCALL (QCDR |t|)
                               (|EXPR;kereval| (QCAR |t|) |lk| |lv| $)
                               (QREFELT $ 58))
                     . #5#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 65)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 47)))))))) 

(DEFUN |EXPR;subst;$LL$;204| (|x| |lk| |lv| $)
  (PROG (#1=#:G613 #2=#:G612 #3=#:G614 #4=#:G616 |t|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|EXPR;subst;$LL$;204|))
       (SEQ (LETT |t| NIL . #5#)
            (LETT #4# (SPADCALL |x| (QREFELT $ 519)) . #5#) G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3#
                     (SPADCALL (QCDR |t|)
                               (|EXPR;subeval| (QCAR |t|) |lk| |lv| $)
                               (QREFELT $ 58))
                     . #5#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 65)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 47)))))))) 

(DEFUN |EXPR;retractIfCan;$U;205| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 54)) (CONS 0 (|spadConstant| $ 87)))
        ('T (|EXPR;retNotUnitIfCan| |x| $)))) 

(DEFUN |EXPR;-;2$;206| (|x| $) (SPADCALL |x| (QREFELT $ 55))) 

(DEFUN |EXPR;smaller?;2$B;207| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 94))) 

(DEFUN |EXPR;=;2$B;208| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 51))) 

(PUT '|EXPR;coerce;K$;209| '|SPADreplace| '(XLAM (|k|) |k|)) 

(DEFUN |EXPR;coerce;K$;209| (|k| $) |k|) 

(PUT '|EXPR;kernels;$L;210| '|SPADreplace| 'LIST) 

(DEFUN |EXPR;kernels;$L;210| (|x| $) (LIST |x|)) 

(DEFUN |EXPR;coerce;R$;211| (|x| $) (SPADCALL |x| (QREFELT $ 521))) 

(DEFUN |EXPR;retract;$R;212| (|x| $) (|EXPR;retNotUnit| |x| $)) 

(DEFUN |EXPR;retractIfCan;$U;213| (|x| $) (|EXPR;retNotUnitIfCan| |x| $)) 

(DEFUN |EXPR;coerce;$Of;214| (|x| $) (SPADCALL |x| (QREFELT $ 524))) 

(DEFUN |EXPR;eval;$LL$;215| (|x| |lk| |lv| $)
  (PROG ()
    (RETURN
     (SPADCALL |lk| |lv| |x|
               (CONS #'|EXPR;eval;$LL$;215!1| (VECTOR |lk| |lv| $))
               (QREFELT $ 530))))) 

(DEFUN |EXPR;eval;$LL$;215!1| (|x1| $$)
  (PROG ($ |lv| |lk|)
    (LETT $ (QREFELT $$ 2) . #1=(|EXPR;eval;$LL$;215|))
    (LETT |lv| (QREFELT $$ 1) . #1#)
    (LETT |lk| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (SPADCALL (CONS #'|EXPR;eval;$LL$;215!0| (VECTOR $ |lv| |lk|)) |x1|
                   (QREFELT $ 527)))))))) 

(DEFUN |EXPR;eval;$LL$;215!0| (|x2| $$)
  (PROG (|lk| |lv| $)
    (LETT |lk| (QREFELT $$ 2) NIL)
    (LETT |lv| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x2| |lk| |lv| (QREFELT $ 526)))))) 

(DEFUN |EXPR;subst;$LL$;216| (|x| |lk| |lv| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL |lk| |lv| |x|
                (CONS #'|EXPR;subst;$LL$;216!0| (VECTOR |lv| |lk| $))
                (QREFELT $ 530)))))) 

(DEFUN |EXPR;subst;$LL$;216!0| (|x1| $$)
  (PROG ($ |lk| |lv|)
    (LETT $ (QREFELT $$ 2) . #1=(|EXPR;subst;$LL$;216|))
    (LETT |lk| (QREFELT $$ 1) . #1#)
    (LETT |lv| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G652 |a| #3=#:G651)
        (RETURN
         (SEQ
          (SPADCALL (SPADCALL |x1| (QREFELT $ 31))
                    (PROGN
                     (LETT #3# NIL NIL)
                     (SEQ (LETT |a| NIL NIL)
                          (LETT #2# (SPADCALL |x1| (QREFELT $ 79)) NIL) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |a| (CAR #2#) NIL) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS
                                   (SPADCALL |a| |lk| |lv| (QREFELT $ 531))
                                   #3#)
                                  NIL)))
                          (LETT #2# (CDR #2#) NIL) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    (QREFELT $ 532))))))))) 

(DEFUN |EXPR;convert;$If;217| (|x| $) (SPADCALL |x| (QREFELT $ 468))) 

(DEFUN |Expression| (#1=#:G691)
  (PROG ()
    (RETURN
     (PROG (#2=#:G692)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|Expression|)
                                           '|domainEqualList|)
                . #3=(|Expression|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|Expression;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|Expression|))))))))))) 

(DEFUN |Expression;| (|#1|)
  (PROG (|pv$| #1=#:G686 #2=#:G687 #3=#:G688 #4=#:G689 #5=#:G690 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #6=(|Expression|))
      (LETT |dv$| (LIST '|Expression| DV$1) . #6#)
      (LETT $ (GETREFV 569) . #6#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (LETT #5#
                                                (|HasCategory| |#1| '(|Ring|))
                                                . #6#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           #5#)
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1| '(|Group|))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (LETT #4#
                                                (AND
                                                 (|HasCategory| |#1|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#1|
                                                                '(|IntegralDomain|)))
                                                . #6#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|RetractableTo|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           #4#)
                                          (OR (|HasCategory| |#1| '(|Group|))
                                              #5#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|LinearlyExplicitRingOver|
                                                            (|Integer|)))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           (|HasCategory| |#1|
                                                          '(|CommutativeRing|))
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           #5#)
                                          (LETT #3#
                                                (|HasCategory| |#1|
                                                               '(|AbelianGroup|))
                                                . #6#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|LinearlyExplicitRingOver|
                                                            (|Integer|)))
                                           #3#
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           (|HasCategory| |#1|
                                                          '(|CommutativeRing|))
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           #5#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|RetractableTo|
                                                            (|Integer|)))
                                           #5#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|RetractableTo|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|)))
                                          (OR (|HasCategory| |#1| '(|Group|))
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|LinearlyExplicitRingOver|
                                                            (|Integer|)))
                                           #5#)
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|AbelianSemiGroup|))
                                                . #6#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|LinearlyExplicitRingOver|
                                                            (|Integer|)))
                                           #3# #2#
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           (|HasCategory| |#1|
                                                          '(|CommutativeRing|))
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           #5#)
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|SemiGroup|))
                                                . #6#)
                                          (OR (|HasCategory| |#1| '(|Group|))
                                              #1#)
                                          (OR #2# #1#)
                                          (AND
                                           (|HasCategory| |#1| '(|GcdDomain|))
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|)))))
                      . #6#))
      (|haddProp| |$ConstructorCache| '|Expression| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|RetractableTo| (|Integer|)))
           (|augmentPredVector| $ 1073741824))
      (AND (|HasCategory| $ '(|Ring|)) (|augmentPredVector| $ 2147483648))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| $ '(|RetractableTo| (|Integer|)))
           (|augmentPredVector| $ 4294967296))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 '|%symbol|)
      (QSETREFV $ 8 '|%alg|)
      (COND ((|testBitVector| |pv$| 1))
            ('T
             (QSETREFV $ 37
                       (CONS (|dispatchFunction| |EXPR;operator;2Bo;4|) $))))
      (COND
       ((|testBitVector| |pv$| 5)
        (PROGN
         (COND
          ((|testBitVector| |pv$| 1)
           (PROGN
            (QSETREFV $ 45
                      (|Fraction|
                       (|SparseMultivariatePolynomial| |#1| (|Kernel| $))))
            (QSETREFV $ 47
                      (CONS #'|makeSpadConstant|
                            (LIST (|dispatchFunction| |EXPR;Zero;$;6|) $ 47)))
            (QSETREFV $ 49
                      (CONS #'|makeSpadConstant|
                            (LIST (|dispatchFunction| |EXPR;One;$;7|) $ 49)))
            (QSETREFV $ 52 (CONS (|dispatchFunction| |EXPR;one?;$B;8|) $))
            (QSETREFV $ 54 (CONS (|dispatchFunction| |EXPR;zero?;$B;9|) $))
            (QSETREFV $ 56 (CONS (|dispatchFunction| |EXPR;-;2$;10|) $))
            (QSETREFV $ 59 (CONS (|dispatchFunction| |EXPR;*;I2$;11|) $))
            (QSETREFV $ 61 (CONS (|dispatchFunction| |EXPR;coerce;I$;12|) $))
            (QSETREFV $ 63 (CONS (|dispatchFunction| |EXPR;*;3$;13|) $))
            (QSETREFV $ 65 (CONS (|dispatchFunction| |EXPR;+;3$;14|) $))
            (QSETREFV $ 67 (CONS (|dispatchFunction| |EXPR;-;3$;15|) $))
            (QSETREFV $ 69 (CONS (|dispatchFunction| |EXPR;/;3$;16|) $))
            (QSETREFV $ 73 (CONS (|dispatchFunction| |EXPR;number?;$B;17|) $))
            (QSETREFV $ 86
                      (CONS (|dispatchFunction| |EXPR;simplifyPower;$I$;18|)
                            $))
            (QSETREFV $ 90 (CONS (|dispatchFunction| |EXPR;^;$Nni$;19|) $))
            (QSETREFV $ 91 (CONS (|dispatchFunction| |EXPR;^;$I$;20|) $))
            (QSETREFV $ 93 (CONS (|dispatchFunction| |EXPR;^;$Pi$;21|) $))
            (QSETREFV $ 95
                      (CONS (|dispatchFunction| |EXPR;smaller?;2$B;22|) $))
            (QSETREFV $ 96 (CONS (|dispatchFunction| |EXPR;=;2$B;23|) $))
            (QSETREFV $ 99 (CONS (|dispatchFunction| |EXPR;numer;$Smp;24|) $))
            (QSETREFV $ 101 (CONS (|dispatchFunction| |EXPR;denom;$Smp;25|) $))
            (QSETREFV $ 102
                      (|Record|
                       (|:| |num|
                            (|SparseMultivariatePolynomial| |#1| (|Kernel| $)))
                       (|:| |den|
                            (|SparseMultivariatePolynomial| |#1|
                                                            (|Kernel| $)))))
            (QSETREFV $ 104
                      (CONS (|dispatchFunction| |EXPR;coerce;Smp$;26|) $))
            (QSETREFV $ 106 (CONS (|dispatchFunction| |EXPR;coerce;P$;27|) $))
            (QSETREFV $ 110 (CONS (|dispatchFunction| |EXPR;coerce;F$;28|) $))
            (QSETREFV $ 111 (CONS (|dispatchFunction| |EXPR;reduce;2$;29|) $))
            (DEFVAR |algreduc_flag| 'NIL)
            (QSETREFV $ 133
                      (CONS
                       (|dispatchFunction| |EXPR;getSimplifyDenomsFlag;B;37|)
                       $))
            (QSETREFV $ 134
                      (CONS
                       (|dispatchFunction| |EXPR;setSimplifyDenomsFlag;2B;38|)
                       $))
            (QSETREFV $ 145 (CONS (|dispatchFunction| |EXPR;/;2Smp$;40|) $))
            (QSETREFV $ 154
                      (CONS (|dispatchFunction| |EXPR;reducedSystem;MM;41|) $))
            (QSETREFV $ 162
                      (CONS (|dispatchFunction| |EXPR;reducedSystem;MVR;42|)
                            $))
            (QSETREFV $ 167
                      (CONS (|dispatchFunction| |EXPR;rootOf;SupS$;44|) $))
            (QSETREFV $ 170 (CONS (|dispatchFunction| |EXPR;pi;$;45|) $))
            (QSETREFV $ 172 (CONS (|dispatchFunction| |EXPR;exp;2$;46|) $))
            (QSETREFV $ 174 (CONS (|dispatchFunction| |EXPR;log;2$;47|) $))
            (QSETREFV $ 176 (CONS (|dispatchFunction| |EXPR;sin;2$;48|) $))
            (QSETREFV $ 178 (CONS (|dispatchFunction| |EXPR;cos;2$;49|) $))
            (QSETREFV $ 180 (CONS (|dispatchFunction| |EXPR;tan;2$;50|) $))
            (QSETREFV $ 182 (CONS (|dispatchFunction| |EXPR;cot;2$;51|) $))
            (QSETREFV $ 184 (CONS (|dispatchFunction| |EXPR;sec;2$;52|) $))
            (QSETREFV $ 186 (CONS (|dispatchFunction| |EXPR;csc;2$;53|) $))
            (QSETREFV $ 188 (CONS (|dispatchFunction| |EXPR;asin;2$;54|) $))
            (QSETREFV $ 190 (CONS (|dispatchFunction| |EXPR;acos;2$;55|) $))
            (QSETREFV $ 192 (CONS (|dispatchFunction| |EXPR;atan;2$;56|) $))
            (QSETREFV $ 194 (CONS (|dispatchFunction| |EXPR;acot;2$;57|) $))
            (QSETREFV $ 196 (CONS (|dispatchFunction| |EXPR;asec;2$;58|) $))
            (QSETREFV $ 198 (CONS (|dispatchFunction| |EXPR;acsc;2$;59|) $))
            (QSETREFV $ 200 (CONS (|dispatchFunction| |EXPR;sinh;2$;60|) $))
            (QSETREFV $ 202 (CONS (|dispatchFunction| |EXPR;cosh;2$;61|) $))
            (QSETREFV $ 204 (CONS (|dispatchFunction| |EXPR;tanh;2$;62|) $))
            (QSETREFV $ 206 (CONS (|dispatchFunction| |EXPR;coth;2$;63|) $))
            (QSETREFV $ 208 (CONS (|dispatchFunction| |EXPR;sech;2$;64|) $))
            (QSETREFV $ 210 (CONS (|dispatchFunction| |EXPR;csch;2$;65|) $))
            (QSETREFV $ 212 (CONS (|dispatchFunction| |EXPR;asinh;2$;66|) $))
            (QSETREFV $ 214 (CONS (|dispatchFunction| |EXPR;acosh;2$;67|) $))
            (QSETREFV $ 216 (CONS (|dispatchFunction| |EXPR;atanh;2$;68|) $))
            (QSETREFV $ 218 (CONS (|dispatchFunction| |EXPR;acoth;2$;69|) $))
            (QSETREFV $ 220 (CONS (|dispatchFunction| |EXPR;asech;2$;70|) $))
            (QSETREFV $ 222 (CONS (|dispatchFunction| |EXPR;acsch;2$;71|) $))
            (QSETREFV $ 225 (CONS (|dispatchFunction| |EXPR;abs;2$;72|) $))
            (QSETREFV $ 227 (CONS (|dispatchFunction| |EXPR;Gamma;2$;73|) $))
            (QSETREFV $ 229 (CONS (|dispatchFunction| |EXPR;Gamma;3$;74|) $))
            (QSETREFV $ 231 (CONS (|dispatchFunction| |EXPR;Beta;3$;75|) $))
            (QSETREFV $ 233 (CONS (|dispatchFunction| |EXPR;digamma;2$;76|) $))
            (QSETREFV $ 235
                      (CONS (|dispatchFunction| |EXPR;polygamma;3$;77|) $))
            (QSETREFV $ 237 (CONS (|dispatchFunction| |EXPR;besselJ;3$;78|) $))
            (QSETREFV $ 239 (CONS (|dispatchFunction| |EXPR;besselY;3$;79|) $))
            (QSETREFV $ 241 (CONS (|dispatchFunction| |EXPR;besselI;3$;80|) $))
            (QSETREFV $ 243 (CONS (|dispatchFunction| |EXPR;besselK;3$;81|) $))
            (QSETREFV $ 245 (CONS (|dispatchFunction| |EXPR;airyAi;2$;82|) $))
            (QSETREFV $ 247
                      (CONS (|dispatchFunction| |EXPR;airyAiPrime;2$;83|) $))
            (QSETREFV $ 249 (CONS (|dispatchFunction| |EXPR;airyBi;2$;84|) $))
            (QSETREFV $ 251
                      (CONS (|dispatchFunction| |EXPR;airyBiPrime;2$;85|) $))
            (QSETREFV $ 253
                      (CONS (|dispatchFunction| |EXPR;lambertW;2$;86|) $))
            (QSETREFV $ 255 (CONS (|dispatchFunction| |EXPR;polylog;3$;87|) $))
            (QSETREFV $ 257
                      (CONS (|dispatchFunction| |EXPR;weierstrassP;4$;88|) $))
            (QSETREFV $ 259
                      (CONS (|dispatchFunction| |EXPR;weierstrassPPrime;4$;89|)
                            $))
            (QSETREFV $ 261
                      (CONS (|dispatchFunction| |EXPR;weierstrassSigma;4$;90|)
                            $))
            (QSETREFV $ 263
                      (CONS (|dispatchFunction| |EXPR;weierstrassZeta;4$;91|)
                            $))
            (QSETREFV $ 265
                      (CONS (|dispatchFunction| |EXPR;whittakerM;4$;92|) $))
            (QSETREFV $ 267
                      (CONS (|dispatchFunction| |EXPR;whittakerW;4$;93|) $))
            (QSETREFV $ 269 (CONS (|dispatchFunction| |EXPR;angerJ;3$;94|) $))
            (QSETREFV $ 271 (CONS (|dispatchFunction| |EXPR;weberE;3$;95|) $))
            (QSETREFV $ 273 (CONS (|dispatchFunction| |EXPR;struveH;3$;96|) $))
            (QSETREFV $ 275 (CONS (|dispatchFunction| |EXPR;struveL;3$;97|) $))
            (QSETREFV $ 277
                      (CONS (|dispatchFunction| |EXPR;hankelH1;3$;98|) $))
            (QSETREFV $ 279
                      (CONS (|dispatchFunction| |EXPR;hankelH2;3$;99|) $))
            (QSETREFV $ 281
                      (CONS (|dispatchFunction| |EXPR;lommelS1;4$;100|) $))
            (QSETREFV $ 283
                      (CONS (|dispatchFunction| |EXPR;lommelS2;4$;101|) $))
            (QSETREFV $ 285
                      (CONS (|dispatchFunction| |EXPR;kummerM;4$;102|) $))
            (QSETREFV $ 287
                      (CONS (|dispatchFunction| |EXPR;kummerU;4$;103|) $))
            (QSETREFV $ 289
                      (CONS (|dispatchFunction| |EXPR;legendreP;4$;104|) $))
            (QSETREFV $ 291
                      (CONS (|dispatchFunction| |EXPR;legendreQ;4$;105|) $))
            (QSETREFV $ 293
                      (CONS (|dispatchFunction| |EXPR;kelvinBei;3$;106|) $))
            (QSETREFV $ 295
                      (CONS (|dispatchFunction| |EXPR;kelvinBer;3$;107|) $))
            (QSETREFV $ 297
                      (CONS (|dispatchFunction| |EXPR;kelvinKei;3$;108|) $))
            (QSETREFV $ 299
                      (CONS (|dispatchFunction| |EXPR;kelvinKer;3$;109|) $))
            (QSETREFV $ 301
                      (CONS (|dispatchFunction| |EXPR;ellipticK;2$;110|) $))
            (QSETREFV $ 303
                      (CONS (|dispatchFunction| |EXPR;ellipticE;2$;111|) $))
            (QSETREFV $ 305
                      (CONS (|dispatchFunction| |EXPR;ellipticE;3$;112|) $))
            (QSETREFV $ 307
                      (CONS (|dispatchFunction| |EXPR;ellipticF;3$;113|) $))
            (QSETREFV $ 309
                      (CONS (|dispatchFunction| |EXPR;ellipticPi;4$;114|) $))
            (QSETREFV $ 311
                      (CONS (|dispatchFunction| |EXPR;jacobiSn;3$;115|) $))
            (QSETREFV $ 313
                      (CONS (|dispatchFunction| |EXPR;jacobiCn;3$;116|) $))
            (QSETREFV $ 315
                      (CONS (|dispatchFunction| |EXPR;jacobiDn;3$;117|) $))
            (QSETREFV $ 317
                      (CONS (|dispatchFunction| |EXPR;jacobiZeta;3$;118|) $))
            (QSETREFV $ 319
                      (CONS (|dispatchFunction| |EXPR;jacobiTheta;3$;119|) $))
            (QSETREFV $ 321
                      (CONS (|dispatchFunction| |EXPR;lerchPhi;4$;120|) $))
            (QSETREFV $ 323
                      (CONS (|dispatchFunction| |EXPR;riemannZeta;2$;121|) $))
            (COND
             ((|testBitVector| |pv$| 31)
              (PROGN
               (QSETREFV $ 326
                         (CONS
                          (|dispatchFunction| |EXPR;hypergeometricF;2L2$;122|)
                          (|getDomainView| $ '(|RetractableTo| (|Integer|)))))
               (QSETREFV $ 328
                         (CONS (|dispatchFunction| |EXPR;meijerG;4L2$;123|)
                               (|getDomainView| $
                                                '(|RetractableTo|
                                                  (|Integer|))))))))
            (QSETREFV $ 83 (CONS (|dispatchFunction| |EXPR;^;3$;124|) $))
            (QSETREFV $ 332
                      (CONS (|dispatchFunction| |EXPR;factorial;2$;125|) $))
            (QSETREFV $ 334
                      (CONS (|dispatchFunction| |EXPR;binomial;3$;126|) $))
            (QSETREFV $ 336
                      (CONS (|dispatchFunction| |EXPR;permutation;3$;127|) $))
            (QSETREFV $ 338
                      (CONS (|dispatchFunction| |EXPR;factorials;2$;128|) $))
            (QSETREFV $ 340
                      (CONS (|dispatchFunction| |EXPR;factorials;$S$;129|) $))
            (QSETREFV $ 342
                      (CONS (|dispatchFunction| |EXPR;summation;$S$;130|) $))
            (QSETREFV $ 346
                      (CONS (|dispatchFunction| |EXPR;summation;$Sb$;131|) $))
            (QSETREFV $ 348
                      (CONS (|dispatchFunction| |EXPR;product;$S$;132|) $))
            (QSETREFV $ 350
                      (CONS (|dispatchFunction| |EXPR;product;$Sb$;133|) $))
            (QSETREFV $ 353 (CONS (|dispatchFunction| |EXPR;erf;2$;134|) $))
            (QSETREFV $ 355 (CONS (|dispatchFunction| |EXPR;Ei;2$;135|) $))
            (QSETREFV $ 357 (CONS (|dispatchFunction| |EXPR;Si;2$;136|) $))
            (QSETREFV $ 359 (CONS (|dispatchFunction| |EXPR;Ci;2$;137|) $))
            (QSETREFV $ 361 (CONS (|dispatchFunction| |EXPR;Shi;2$;138|) $))
            (QSETREFV $ 363 (CONS (|dispatchFunction| |EXPR;Chi;2$;139|) $))
            (QSETREFV $ 365 (CONS (|dispatchFunction| |EXPR;li;2$;140|) $))
            (QSETREFV $ 367 (CONS (|dispatchFunction| |EXPR;dilog;2$;141|) $))
            (QSETREFV $ 369
                      (CONS (|dispatchFunction| |EXPR;fresnelS;2$;142|) $))
            (QSETREFV $ 371
                      (CONS (|dispatchFunction| |EXPR;fresnelC;2$;143|) $))
            (QSETREFV $ 373
                      (CONS (|dispatchFunction| |EXPR;integral;$S$;144|) $))
            (QSETREFV $ 375
                      (CONS (|dispatchFunction| |EXPR;integral;$Sb$;145|) $))
            (QSETREFV $ 37
                      (CONS (|dispatchFunction| |EXPR;operator;2Bo;146|) $))
            (COND
             ((|HasCategory| |#1| '(|GcdDomain|))
              (PROGN
               (QSETREFV $ 405
                         (CONS
                          (|dispatchFunction| |EXPR;gcdPolynomial;3Sup;151|)
                          $))
               (QSETREFV $ 410
                         (CONS
                          (|dispatchFunction| |EXPR;factorPolynomial;SupF;152|)
                          $))
               (QSETREFV $ 412
                         (CONS
                          (|dispatchFunction|
                           |EXPR;squareFreePolynomial;SupF;153|)
                          $)))))
            (COND
             ((|domainEqual| |#1| (|AlgebraicNumber|))
              (QSETREFV $ 417
                        (CONS (|dispatchFunction| |EXPR;coerce;An$;154|) $))))
            (COND
             ((|testBitVector| |pv$| 14)
              (PROGN
               (QSETREFV $ 420 (CONS (|dispatchFunction| |EXPR;^;$F$;155|) $))
               (QSETREFV $ 138
                         (CONS (|dispatchFunction| |EXPR;minPoly;KSup;156|) $))
               (QSETREFV $ 423
                         (CONS
                          (|dispatchFunction| |EXPR;definingPolynomial;2$;157|)
                          $))
               (QSETREFV $ 425
                         (CONS (|dispatchFunction| |EXPR;retract;$F;158|) $))
               (QSETREFV $ 72
                         (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;159|)
                               $))
               (COND ((|domainEqual| |#1| (|AlgebraicNumber|)))
                     ('T
                      (PROGN
                       (QSETREFV $ 417
                                 (CONS
                                  (|dispatchFunction| |EXPR;coerce;An$;160|)
                                  $))
                       (QSETREFV $ 441
                                 (CONS
                                  (|dispatchFunction|
                                   |EXPR;retractIfCan;$U;163|)
                                  $))))))))
            (COND
             ((|testBitVector| |pv$| 9)
              (PROGN
               (QSETREFV $ 469
                         (CONS (|dispatchFunction| |EXPR;convert;$If;167|) $))
               (QSETREFV $ 472
                         (CONS (|dispatchFunction| |EXPR;eval;$Bo$S$;168|) $))
               (QSETREFV $ 471
                         (CONS (|dispatchFunction| |EXPR;eval;$LLS$;169|)
                               $)))))
            (COND
             ((|testBitVector| |pv$| 13)
              (QSETREFV $ 495
                        (CONS
                         (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;170|)
                         $))))
            (COND
             ((|testBitVector| |pv$| 12)
              (QSETREFV $ 501
                        (CONS
                         (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;171|)
                         $))))))
          ('T
           (PROGN
            (SETELT $ 45 (|SparseMultivariatePolynomial| |#1| (|Kernel| $)))
            (QSETREFV $ 47
                      (CONS #'|makeSpadConstant|
                            (LIST (|dispatchFunction| |EXPR;Zero;$;172|) $
                                  47)))
            (QSETREFV $ 49
                      (CONS #'|makeSpadConstant|
                            (LIST (|dispatchFunction| |EXPR;One;$;173|) $ 49)))
            (QSETREFV $ 56 (CONS (|dispatchFunction| |EXPR;-;2$;174|) $))
            (QSETREFV $ 59 (CONS (|dispatchFunction| |EXPR;*;I2$;175|) $))
            (QSETREFV $ 63 (CONS (|dispatchFunction| |EXPR;*;3$;176|) $))
            (QSETREFV $ 65 (CONS (|dispatchFunction| |EXPR;+;3$;177|) $))
            (QSETREFV $ 96 (CONS (|dispatchFunction| |EXPR;=;2$B;178|) $))
            (QSETREFV $ 95
                      (CONS (|dispatchFunction| |EXPR;smaller?;2$B;179|) $))
            (QSETREFV $ 99 (CONS (|dispatchFunction| |EXPR;numer;$Smp;180|) $))
            (QSETREFV $ 104
                      (CONS (|dispatchFunction| |EXPR;coerce;Smp$;181|) $))
            (QSETREFV $ 106 (CONS (|dispatchFunction| |EXPR;coerce;P$;182|) $))
            (QSETREFV $ 154
                      (CONS (|dispatchFunction| |EXPR;reducedSystem;MM;183|)
                            $))
            (QSETREFV $ 162
                      (CONS (|dispatchFunction| |EXPR;reducedSystem;MVR;184|)
                            $))
            (COND
             ((|testBitVector| |pv$| 9)
              (QSETREFV $ 469
                        (CONS (|dispatchFunction| |EXPR;convert;$If;185|) $))))
            (COND
             ((|testBitVector| |pv$| 13)
              (PROGN
               (QSETREFV $ 495
                         (CONS
                          (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;187|)
                          $)))))
            (COND
             ((|testBitVector| |pv$| 12)
              (PROGN
               (QSETREFV $ 501
                         (CONS
                          (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;189|)
                          $))))))))))
       ((|HasCategory| |#1| '(|AbelianMonoid|))
        (PROGN
         (SETELT $ 45 (|FreeAbelianGroup| (|Kernel| $)))
         (QSETREFV $ 47
                   (CONS #'|makeSpadConstant|
                         (LIST (|dispatchFunction| |EXPR;Zero;$;190|) $ 47)))
         (QSETREFV $ 65 (CONS (|dispatchFunction| |EXPR;+;3$;191|) $))
         (QSETREFV $ 96 (CONS (|dispatchFunction| |EXPR;=;2$B;192|) $))
         (QSETREFV $ 95 (CONS (|dispatchFunction| |EXPR;smaller?;2$B;193|) $))
         (QSETREFV $ 142 (CONS (|dispatchFunction| |EXPR;coerce;K$;194|) $))
         (QSETREFV $ 75 (CONS (|dispatchFunction| |EXPR;kernels;$L;195|) $))
         (QSETREFV $ 442 (CONS (|dispatchFunction| |EXPR;coerce;R$;196|) $))
         (QSETREFV $ 522 (CONS (|dispatchFunction| |EXPR;retract;$R;197|) $))
         (QSETREFV $ 525 (CONS (|dispatchFunction| |EXPR;coerce;$Of;198|) $))
         (QSETREFV $ 535 (CONS (|dispatchFunction| |EXPR;isPlus;$U;201|) $))
         (QSETREFV $ 539 (CONS (|dispatchFunction| |EXPR;isMult;$U;202|) $))
         (QSETREFV $ 526 (CONS (|dispatchFunction| |EXPR;eval;$LL$;203|) $))
         (QSETREFV $ 531 (CONS (|dispatchFunction| |EXPR;subst;$LL$;204|) $))
         (QSETREFV $ 540
                   (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;205|) $))
         (COND
          ((|testBitVector| |pv$| 19)
           (QSETREFV $ 56 (CONS (|dispatchFunction| |EXPR;-;2$;206|) $))))))
       ('T
        (PROGN
         (SETELT $ 45 (|Kernel| $))
         (QSETREFV $ 95 (CONS (|dispatchFunction| |EXPR;smaller?;2$B;207|) $))
         (QSETREFV $ 96 (CONS (|dispatchFunction| |EXPR;=;2$B;208|) $))
         (QSETREFV $ 142 (CONS (|dispatchFunction| |EXPR;coerce;K$;209|) $))
         (QSETREFV $ 75 (CONS (|dispatchFunction| |EXPR;kernels;$L;210|) $))
         (QSETREFV $ 442 (CONS (|dispatchFunction| |EXPR;coerce;R$;211|) $))
         (QSETREFV $ 522 (CONS (|dispatchFunction| |EXPR;retract;$R;212|) $))
         (QSETREFV $ 540
                   (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;213|) $))
         (QSETREFV $ 525 (CONS (|dispatchFunction| |EXPR;coerce;$Of;214|) $))
         (QSETREFV $ 526 (CONS (|dispatchFunction| |EXPR;eval;$LL$;215|) $))
         (QSETREFV $ 531 (CONS (|dispatchFunction| |EXPR;subst;$LL$;216|) $))
         (COND
          ((|testBitVector| |pv$| 9)
           (QSETREFV $ 469
                     (CONS (|dispatchFunction| |EXPR;convert;$If;217|) $)))))))
      $)))) 

(MAKEPROP '|Expression| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) 'SYMBOL 'ALGOP (|Boolean|)
              (|BasicOperator|) |EXPR;belong?;BoB;1| (|Kernel| $)
              (0 . |retract|) (|Union| 6 '"failed") (|Kernel| $$)
              (|KernelFunctions2| 6 $$) (5 . |constantIfCan|)
              (|Union| 12 '#1="failed") (10 . |retractIfCan|)
              (|FunctionSpace&| $$ 6) (15 . |belong?|) (20 . |operator|)
              (|ExpressionSpace&| $$) (25 . |belong?|) (30 . |operator|)
              (35 . |nullary?|) (|Symbol|) (40 . |has?|) (46 . |name|)
              (51 . |kernel|) (56 . |operator|) (|Union| 35 '"failed")
              (61 . |arity|) (66 . |operator|) (|NonNegativeInteger|)
              (71 . |operator|) (77 . |operator|) (|List| 27)
              (|SparseMultivariatePolynomial| 6 27) (82 . |variables|)
              (|SparseMultivariatePolynomial| 6 15) (|List| 15)
              (|SparsePolynomialCoercionHelpers| 6 27 15)
              (87 . |remap_variables|) '|Rep| (94 . |Zero|) (98 . |Zero|)
              (102 . |One|) (106 . |One|) (110 . |One|) (114 . =)
              (120 . |one?|) (125 . |zero?|) (130 . |zero?|) (135 . -)
              (140 . -) (|Integer|) (145 . *) (151 . *) (157 . |coerce|)
              (162 . |coerce|) (167 . *) (173 . *) (179 . +) (185 . +)
              (191 . -) (197 . -) (203 . /) (209 . /) (215 . |ground?|)
              (|Union| 418 '#1#) (220 . |retractIfCan|) (225 . |number?|)
              (|List| 12) (230 . |kernels|) (235 . |is?|) (241 . |first|)
              (|List| $$) (246 . |argument|) (251 . |#|) (256 . |elt|)
              (262 . ^) (268 . ^) (274 . |first|) (279 . |second|)
              (284 . |simplifyPower|) (290 . |Zero|) (294 . |numerator|)
              (299 . |denominator|) (304 . ^) (310 . ^) (|PositiveInteger|)
              (316 . ^) (322 . |smaller?|) (328 . |smaller?|) (334 . =)
              (340 . |numer|) (|SparseMultivariatePolynomial| 6 12)
              (345 . |numer|) (350 . |denom|) (355 . |denom|) 'EREP
              (360 . |One|) (364 . |coerce|) (|Polynomial| 6) (369 . |coerce|)
              (|Fraction| 105) (374 . |numer|) (379 . |denom|) (384 . |coerce|)
              (389 . |reduce|) (|Mapping| 9 15) (394 . |select!|)
              (|AlgebraicManipulations| 6 $$) (400 . |ratDenom|) (|Set| 15)
              (406 . |brace|) (411 . |is?|) (417 . |union|) (423 . |parts|)
              (428 . |sort!|) (433 . ~=) (439 . >)
              (|SparseUnivariatePolynomial| $) (445 . |univariate|)
              (|SparseUnivariatePolynomial| 41) (451 . |leadingCoefficient|)
              (456 . |reductum|) (461 . *) (467 . |monomial|) (474 . -)
              (480 . /) (486 . |getSimplifyDenomsFlag|)
              (490 . |setSimplifyDenomsFlag|) (495 . |elt|)
              (|SingletonAsOrderedSet|) (501 . |create|) (505 . |minPoly|)
              (|SparseUnivariatePolynomial| $$)
              (|PolynomialCategoryQuotientFunctions| 413 15 6 41 $$)
              (510 . |univariate|) (517 . |coerce|) (522 . |eval|)
              (529 . |retract|) (534 . /) (|Mapping| $$ $$) (|Matrix| $$)
              (540 . |map|) (|Matrix| 41) (|Matrix| $) (546 . |reducedSystem|)
              (|Matrix| 6) (551 . |reducedSystem|) (556 . |reducedSystem|)
              (|Vector| $$) (561 . |map|)
              (|Record| (|:| |mat| 149) (|:| |vec| (|Vector| 41))) (|Vector| $)
              (567 . |reducedSystem|)
              (|Record| (|:| |mat| 152) (|:| |vec| (|Vector| 6)))
              (573 . |reducedSystem|) (579 . |reducedSystem|) (585 . |member?|)
              (591 . |concat|) (|AlgebraicFunction| 6 $$) (597 . |rootOf|)
              (603 . |rootOf|) (|ElementaryFunction| 6 $$) (609 . |pi|)
              (613 . |pi|) (617 . |exp|) (622 . |exp|) (627 . |log|)
              (632 . |log|) (637 . |sin|) (642 . |sin|) (647 . |cos|)
              (652 . |cos|) (657 . |tan|) (662 . |tan|) (667 . |cot|)
              (672 . |cot|) (677 . |sec|) (682 . |sec|) (687 . |csc|)
              (692 . |csc|) (697 . |asin|) (702 . |asin|) (707 . |acos|)
              (712 . |acos|) (717 . |atan|) (722 . |atan|) (727 . |acot|)
              (732 . |acot|) (737 . |asec|) (742 . |asec|) (747 . |acsc|)
              (752 . |acsc|) (757 . |sinh|) (762 . |sinh|) (767 . |cosh|)
              (772 . |cosh|) (777 . |tanh|) (782 . |tanh|) (787 . |coth|)
              (792 . |coth|) (797 . |sech|) (802 . |sech|) (807 . |csch|)
              (812 . |csch|) (817 . |asinh|) (822 . |asinh|) (827 . |acosh|)
              (832 . |acosh|) (837 . |atanh|) (842 . |atanh|) (847 . |acoth|)
              (852 . |acoth|) (857 . |asech|) (862 . |asech|) (867 . |acsch|)
              (872 . |acsch|) (|FunctionalSpecialFunction| 6 $$) (877 . |abs|)
              (882 . |abs|) (887 . |Gamma|) (892 . |Gamma|) (897 . |Gamma|)
              (903 . |Gamma|) (909 . |Beta|) (915 . |Beta|) (921 . |digamma|)
              (926 . |digamma|) (931 . |polygamma|) (937 . |polygamma|)
              (943 . |besselJ|) (949 . |besselJ|) (955 . |besselY|)
              (961 . |besselY|) (967 . |besselI|) (973 . |besselI|)
              (979 . |besselK|) (985 . |besselK|) (991 . |airyAi|)
              (996 . |airyAi|) (1001 . |airyAiPrime|) (1006 . |airyAiPrime|)
              (1011 . |airyBi|) (1016 . |airyBi|) (1021 . |airyBiPrime|)
              (1026 . |airyBiPrime|) (1031 . |lambertW|) (1036 . |lambertW|)
              (1041 . |polylog|) (1047 . |polylog|) (1053 . |weierstrassP|)
              (1060 . |weierstrassP|) (1067 . |weierstrassPPrime|)
              (1074 . |weierstrassPPrime|) (1081 . |weierstrassSigma|)
              (1088 . |weierstrassSigma|) (1095 . |weierstrassZeta|)
              (1102 . |weierstrassZeta|) (1109 . |whittakerM|)
              (1116 . |whittakerM|) (1123 . |whittakerW|) (1130 . |whittakerW|)
              (1137 . |angerJ|) (1143 . |angerJ|) (1149 . |weberE|)
              (1155 . |weberE|) (1161 . |struveH|) (1167 . |struveH|)
              (1173 . |struveL|) (1179 . |struveL|) (1185 . |hankelH1|)
              (1191 . |hankelH1|) (1197 . |hankelH2|) (1203 . |hankelH2|)
              (1209 . |lommelS1|) (1216 . |lommelS1|) (1223 . |lommelS2|)
              (1230 . |lommelS2|) (1237 . |kummerM|) (1244 . |kummerM|)
              (1251 . |kummerU|) (1258 . |kummerU|) (1265 . |legendreP|)
              (1272 . |legendreP|) (1279 . |legendreQ|) (1286 . |legendreQ|)
              (1293 . |kelvinBei|) (1299 . |kelvinBei|) (1305 . |kelvinBer|)
              (1311 . |kelvinBer|) (1317 . |kelvinKei|) (1323 . |kelvinKei|)
              (1329 . |kelvinKer|) (1335 . |kelvinKer|) (1341 . |ellipticK|)
              (1346 . |ellipticK|) (1351 . |ellipticE|) (1356 . |ellipticE|)
              (1361 . |ellipticE|) (1367 . |ellipticE|) (1373 . |ellipticF|)
              (1379 . |ellipticF|) (1385 . |ellipticPi|) (1392 . |ellipticPi|)
              (1399 . |jacobiSn|) (1405 . |jacobiSn|) (1411 . |jacobiCn|)
              (1417 . |jacobiCn|) (1423 . |jacobiDn|) (1429 . |jacobiDn|)
              (1435 . |jacobiZeta|) (1441 . |jacobiZeta|)
              (1447 . |jacobiTheta|) (1453 . |jacobiTheta|) (1459 . |lerchPhi|)
              (1466 . |lerchPhi|) (1473 . |riemannZeta|) (1478 . |riemannZeta|)
              (1483 . |hypergeometricF|) (|List| $) (1490 . |hypergeometricF|)
              (1497 . |meijerG|) (1506 . |meijerG|)
              (|CombinatorialFunction| 6 $$) (1515 . ^) (1521 . |factorial|)
              (1526 . |factorial|) (1531 . |binomial|) (1537 . |binomial|)
              (1543 . |permutation|) (1549 . |permutation|)
              (1555 . |factorials|) (1560 . |factorials|) (1565 . |factorials|)
              (1571 . |factorials|) (1577 . |summation|) (1583 . |summation|)
              (|SegmentBinding| $$) (1589 . |summation|) (|SegmentBinding| $)
              (1595 . |summation|) (1601 . |product|) (1607 . |product|)
              (1613 . |product|) (1619 . |product|)
              (|LiouvillianFunction| 6 $$) (1625 . |erf|) (1630 . |erf|)
              (1635 . |Ei|) (1640 . |Ei|) (1645 . |Si|) (1650 . |Si|)
              (1655 . |Ci|) (1660 . |Ci|) (1665 . |Shi|) (1670 . |Shi|)
              (1675 . |Chi|) (1680 . |Chi|) (1685 . |li|) (1690 . |li|)
              (1695 . |dilog|) (1700 . |dilog|) (1705 . |fresnelS|)
              (1710 . |fresnelS|) (1715 . |fresnelC|) (1720 . |fresnelC|)
              (1725 . |integral|) (1731 . |integral|) (1737 . |integral|)
              (1743 . |integral|) (1749 . |belong?|) (1754 . |operator|)
              (1759 . |belong?|) (1764 . |operator|) (1769 . |belong?|)
              (1774 . |operator|) (1779 . |belong?|) (1784 . |operator|)
              (1789 . |belong?|) (1794 . |operator|) (|Fraction| 41)
              (1799 . |coerce|) (|Fraction| 391)
              (|PolynomialCategoryQuotientFunctions| 413 15 6 41 386)
              (1804 . |univariate|) (|SparseUnivariatePolynomial| 386)
              (1810 . |numer|) (1815 . |degree|) (1821 . |degree|)
              (1826 . |rem|) (1832 . |coerce|) (1837 . |elt|) (1843 . |Zero|)
              (1847 . ~=) (1853 . |leadingCoefficient|) (1858 . |reductum|)
              (1863 . |gcdPolynomial|) (|GcdDomain&| $$)
              (1869 . |gcdPolynomial|) (1875 . |gcdPolynomial|)
              (|Factored| 391) (|SupFractionFactorizer| 413 15 6 41)
              (1881 . |factor|) (|Factored| 124) (1886 . |factorPolynomial|)
              (1891 . |squareFree|) (1896 . |squareFreePolynomial|)
              (|IndexedExponents| 15) (1901 . |Zero|) (1905 . |monomial|)
              (|AlgebraicNumber|) (1911 . |coerce|) (|Fraction| 57) (1916 . ^)
              (1922 . ^) (1928 . |minPoly|) (1933 . |definingPolynomial|)
              (1938 . |definingPolynomial|) (1943 . |retract|)
              (1948 . |retract|) (1953 . |retractIfCan|)
              (|SparseMultivariatePolynomial| 57 12) (1958 . |numer|)
              (1963 . |denom|) (|Mapping| $$ 416) (|Kernel| 416)
              (|ExpressionSpaceFunctions2| 416 $$) (1968 . |map|)
              (|Mapping| $$ 431) (|Mapping| $$ 57)
              (|SparseMultivariatePolynomial| 57 431)
              (|PolynomialCategoryLifting| (|IndexedExponents| 431) 431 57 436
                                           $$)
              (1974 . |map|) (1981 . /) (|Union| 416 '"failed")
              (1987 . |retractIfCan|) (1992 . |coerce|) (1997 . |coerce|)
              (2002 . |belong?|) (2007 . |is?|) (|Union| 27 '#1#)
              (2013 . |retractIfCan|) (2018 . ~=)
              (|SparseUnivariatePolynomial| 416) (2024 . |Zero|)
              (2028 . |Zero|) (2032 . ~=) (2038 . |degree|) (2043 . |monomial|)
              (2049 . +) (2055 . |rootOf|) (2061 . |operator|) (2066 . |elt|)
              (|Union| 15 '"failed") (2072 . |mainVariable|)
              (2077 . |leadingCoefficient|) (2082 . |Zero|) (2086 . |ground?|)
              (2091 . ^) (2097 . *) (2103 . +) (|InputForm|) (2109 . |convert|)
              (2114 . |convert|) (|List| 10) (2119 . |eval|) (2127 . |eval|)
              (2135 . |variables|) (2140 . |concat|)
              (2145 . |removeDuplicates|) (2150 . |scripted?|) (|Mapping| 9 27)
              (2155 . |select|) (|MakeUnaryCompiledFunction| $$ $$ $$)
              (2161 . |compiledFunction|) (|Mapping| $ $) (|List| 481)
              (2167 . |eval|) (2174 . |new|) (2178 . |coerce|) (|Equation| $$)
              (2183 . =) (|List| 566) (2189 . |subst|)
              (|PatternMatchResult| 57 $$) (|Pattern| 57)
              (|PatternMatchFunctionSpace| 57 6 $$) (2195 . |patternMatch|)
              (|PatternMatchResult| 57 $) (2202 . |patternMatch|)
              (|PatternMatchResult| (|Float|) $$) (|Pattern| (|Float|))
              (|PatternMatchFunctionSpace| (|Float|) 6 $$)
              (2209 . |patternMatch|) (|PatternMatchResult| (|Float|) $)
              (2216 . |patternMatch|) (2223 . |reducedSystem|)
              (2228 . |reducedSystem|) (|PatternMatchKernel| 57 $$)
              (2234 . |patternMatch|) (|PatternMatchResult| 57 45)
              (|Mapping| 506 15 491 506)
              (|PatternMatchPolynomialCategory| 57 413 15 6 45)
              (2241 . |patternMatch|) (|PatternMatchKernel| (|Float|) $$)
              (2249 . |patternMatch|) (|PatternMatchResult| (|Float|) 45)
              (|Mapping| 512 15 497 512)
              (|PatternMatchPolynomialCategory| (|Float|) 413 15 6 45)
              (2256 . |patternMatch|) (2264 . |coerce|)
              (|Record| (|:| |gen| 15) (|:| |exp| 57)) (|List| 517)
              (2269 . |terms|) (2274 . |zero?|) (2279 . |constantKernel|)
              (2284 . |retract|) (|OutputForm|) (2289 . |coerce|)
              (2294 . |coerce|) (2299 . |eval|) (2306 . |map|)
              (|Mapping| $$ 15) (|ListToMap| 15 $$) (2312 . |match|)
              (2320 . |subst|) (2327 . |kernel|) (2333 . *)
              (|Union| 325 '#2="failed") (2339 . |isPlus|) (2344 . |first|)
              (|Record| (|:| |coef| 57) (|:| |var| 12)) (|Union| 537 '#2#)
              (2349 . |isMult|) (2354 . |retractIfCan|) (|Matrix| 57)
              (|Record| (|:| |mat| 541) (|:| |vec| (|Vector| 57)))
              (|Union| $ '"failed") (|Factored| $) (|Fraction| 6)
              (|Fraction| 547) (|Polynomial| 545) (|Fraction| 124)
              (|Union| 107 '#1#) (|Polynomial| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |coef| 325) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 554 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Union| 57 '#1#) (|Record| (|:| |var| 12) (|:| |exponent| 57))
              (|Union| 558 '#2#) (|List| 35)
              (|Record| (|:| |val| $) (|:| |exponent| 57)) (|Union| 561 '#2#)
              (|Mapping| $ 325) (|List| 563) (|Union| 105 '#1#) (|Equation| $)
              (|SingleInteger|) (|String|))
           '#(~= 2359 |zerosOf| 2365 |zeroOf| 2392 |zero?| 2419 |whittakerW|
              2424 |whittakerM| 2431 |weierstrassZeta| 2438 |weierstrassSigma|
              2445 |weierstrassPPrime| 2452 |weierstrassP| 2459 |weberE| 2466
              |variables| 2472 |univariate| 2477 |unitNormal| 2483
              |unitCanonical| 2488 |unit?| 2493 |tower| 2498 |tanh| 2503 |tan|
              2508 |summation| 2513 |subtractIfCan| 2525 |subst| 2531 |struveL|
              2550 |struveH| 2556 |squareFreePolynomial| 2562 |squareFreePart|
              2567 |squareFree| 2572 |sqrt| 2577 |smaller?| 2582 |sizeLess?|
              2588 |sinh| 2594 |sin| 2599 |simplifyPower| 2604
              |setSimplifyDenomsFlag| 2610 |sech| 2615 |sec| 2620 |sample| 2625
              |rootsOf| 2629 |rootOf| 2656 |riemannZeta| 2683 |retractIfCan|
              2688 |retract| 2728 |rem| 2768 |reducedSystem| 2774 |reduce| 2796
              |recip| 2801 |quo| 2806 |product| 2812 |principalIdeal| 2824
              |prime?| 2829 |polylog| 2834 |polygamma| 2840 |pi| 2846
              |permutation| 2850 |patternMatch| 2856 |paren| 2870 |operators|
              2880 |operator| 2885 |one?| 2890 |odd?| 2895 |numerator| 2900
              |numer| 2905 |number?| 2910 |nthRoot| 2915 |multiEuclidean| 2921
              |minPoly| 2927 |meijerG| 2932 |map| 2941 |mainKernel| 2947
              |lommelS2| 2952 |lommelS1| 2959 |log| 2966 |li| 2971 |lerchPhi|
              2976 |legendreQ| 2983 |legendreP| 2990 |lcm| 2997 |latex| 3008
              |lambertW| 3013 |kummerU| 3018 |kummerM| 3025 |kernels| 3032
              |kernel| 3037 |kelvinKer| 3049 |kelvinKei| 3055 |kelvinBer| 3061
              |kelvinBei| 3067 |jacobiZeta| 3073 |jacobiTheta| 3079 |jacobiSn|
              3085 |jacobiDn| 3091 |jacobiCn| 3097 |isTimes| 3103 |isPower|
              3108 |isPlus| 3113 |isMult| 3118 |isExpt| 3123 |is?| 3140 |inv|
              3152 |integral| 3157 |hypergeometricF| 3169 |height| 3176 |hash|
              3181 |hankelH2| 3186 |hankelH1| 3192 |ground?| 3198 |ground| 3203
              |getSimplifyDenomsFlag| 3208 |gcdPolynomial| 3212 |gcd| 3218
              |fresnelS| 3229 |fresnelC| 3234 |freeOf?| 3239 |factorials| 3251
              |factorial| 3262 |factorPolynomial| 3267 |factor| 3272
              |extendedEuclidean| 3277 |exquo| 3290 |expressIdealMember| 3296
              |exp| 3302 |even?| 3307 |eval| 3312 |euclideanSize| 3473 |erf|
              3478 |elt| 3483 |ellipticPi| 3579 |ellipticK| 3586 |ellipticF|
              3591 |ellipticE| 3597 |divide| 3608 |distribute| 3614 |dilog|
              3625 |digamma| 3630 |differentiate| 3635 |denominator| 3661
              |denom| 3666 |definingPolynomial| 3671 |csch| 3676 |csc| 3681
              |coth| 3686 |cot| 3691 |cosh| 3696 |cos| 3701 |convert| 3706
              |conjugate| 3726 |commutator| 3732 |coerce| 3738 |charthRoot|
              3808 |characteristic| 3813 |box| 3817 |binomial| 3827 |besselY|
              3833 |besselK| 3839 |besselJ| 3845 |besselI| 3851 |belong?| 3857
              |atanh| 3862 |atan| 3867 |associates?| 3872 |asinh| 3878 |asin|
              3883 |asech| 3888 |asec| 3893 |applyQuote| 3898 |angerJ| 3934
              |airyBiPrime| 3940 |airyBi| 3945 |airyAiPrime| 3950 |airyAi| 3955
              |acsch| 3960 |acsc| 3965 |acoth| 3970 |acot| 3975 |acosh| 3980
              |acos| 3985 |abs| 3990 ^ 3995 |Zero| 4025 |Si| 4029 |Shi| 4034
              |One| 4039 |Gamma| 4043 |Ei| 4054 D 4059 |Ci| 4085 |Chi| 4090
              |Beta| 4095 = 4101 / 4107 - 4119 + 4130 * 4136)
           'NIL
           (CONS
            (|makeByteWordVec2| 28
                                '(1 0 1 1 1 1 1 1 1 1 1 1 2 5 1 1 1 2 3 4 5 7 1
                                  5 1 1 2 18 1 1 1 6 2 2 18 20 8 5 20 0 0 5 28
                                  26 0 12 13 1 28 26 0 0 0 0 1 1 0 0 0 0 0 0 0
                                  0 16 1 1 1 1 1 5 9 10 11 14 15 1 1 1 1 1 1 1
                                  1 17 1))
            (CONS
             '#(|AlgebraicallyClosedFunctionSpace&| |FunctionSpace&|
                |AlgebraicallyClosedField&| |Field&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |GcdDomain&| |DivisionRing&|
                NIL |Algebra&| |Algebra&| |Algebra&|
                |FullyLinearlyExplicitRingOver&| |Module&| |EntireRing&|
                |Module&| |Module&| NIL NIL NIL NIL NIL
                |PartialDifferentialRing&| NIL NIL NIL |Ring&| NIL NIL NIL NIL
                NIL NIL NIL |AbelianGroup&| |Group&| NIL NIL |ExpressionSpace&|
                NIL NIL |Monoid&| |AbelianMonoid&| NIL NIL NIL NIL |SemiGroup&|
                |AbelianSemiGroup&| |SetCategory&| |FullyRetractableTo&| NIL
                |Evalable&| |TranscendentalFunctionCategory&| NIL |BasicType&|
                |RetractableTo&| NIL |RetractableTo&| |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| NIL |RetractableTo&|
                |RetractableTo&| NIL NIL NIL NIL |RetractableTo&| NIL NIL NIL
                |RetractableTo&| |RetractableTo&| NIL NIL
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                NIL NIL |RadicalCategory&|)
             (CONS
              '#((|AlgebraicallyClosedFunctionSpace| 6) (|FunctionSpace| 6)
                 (|AlgebraicallyClosedField|) (|Field|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|DivisionRing|) (|IntegralDomain|)
                 (|Algebra| $$) (|Algebra| 418) (|Algebra| 6)
                 (|FullyLinearlyExplicitRingOver| 6) (|Module| $$)
                 (|EntireRing|) (|Module| 418) (|Module| 6)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|LinearlyExplicitRingOver| 6) (|LinearlyExplicitRingOver| 57)
                 (|CommutativeRing|) (|PartialDifferentialRing| 27)
                 (|BiModule| $$ $$) (|BiModule| 418 418) (|BiModule| 6 6)
                 (|Ring|) (|RightModule| $$) (|LeftModule| 418)
                 (|RightModule| 418) (|LeftModule| $$) (|LeftModule| 6)
                 (|RightModule| 6) (|Rng|) (|AbelianGroup|) (|Group|)
                 (|SemiRing|) (|CancellationAbelianMonoid|) (|ExpressionSpace|)
                 (|FullyPatternMatchable| 6) (|SemiRng|) (|Monoid|)
                 (|AbelianMonoid|) (|Comparable|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 57)
                 (|LiouvillianFunctionCategory|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|SetCategory|) (|FullyRetractableTo| 6)
                 (|Patternable| 6) (|Evalable| $$)
                 (|TranscendentalFunctionCategory|)
                 (|CombinatorialOpsCategory|) (|BasicType|) (|RetractableTo| 6)
                 (|Type|) (|RetractableTo| 27) (|InnerEvalable| $$ $$)
                 (|InnerEvalable| 15 $$) (|RetractableTo| 15)
                 (|CoercibleTo| 523) (|RetractableTo| 418)
                 (|RetractableTo| (|Fraction| (|Polynomial| 6)))
                 (|CommutativeStar|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|RetractableTo| (|Polynomial| 6))
                 (|ConvertibleTo| 467) (|ConvertibleTo| 497)
                 (|ConvertibleTo| 491) (|RetractableTo| 57)
                 (|RetractableTo| 416) (|SpecialFunctionCategory|)
                 (|PrimitiveFunctionCategory|)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|)
                 (|CombinatorialFunctionCategory|) (|unitsKnown|)
                 (|RadicalCategory|))
              (|makeByteWordVec2| 568
                                  '(1 0 12 0 13 1 16 14 15 17 1 0 18 0 19 1 20
                                    9 10 21 1 20 10 10 22 1 23 9 10 24 1 23 10
                                    10 25 1 10 9 0 26 2 10 9 0 27 28 1 10 27 0
                                    29 1 15 0 27 30 1 15 10 0 31 1 10 32 0 33 1
                                    10 0 27 34 2 10 0 27 35 36 1 0 10 10 37 1
                                    39 38 0 40 3 43 41 39 38 42 44 0 45 0 46 0
                                    0 0 47 0 45 0 48 0 0 0 49 0 6 0 50 2 45 9 0
                                    0 51 1 0 9 0 52 1 45 9 0 53 1 0 9 0 54 1 45
                                    0 0 55 1 0 0 0 56 2 45 0 57 0 58 2 0 0 57 0
                                    59 1 45 0 57 60 1 0 0 57 61 2 45 0 0 0 62 2
                                    0 0 0 0 63 2 45 0 0 0 64 2 0 0 0 0 65 2 45
                                    0 0 0 66 2 0 0 0 0 67 2 45 0 0 0 68 2 0 0 0
                                    0 69 1 0 9 0 70 1 0 71 0 72 1 0 9 0 73 1 0
                                    74 0 75 2 0 9 0 27 76 1 42 15 0 77 1 15 78
                                    0 79 1 78 35 0 80 2 78 2 0 57 81 2 45 0 0
                                    57 82 2 0 0 0 0 83 1 78 2 0 84 1 78 2 0 85
                                    2 0 0 0 57 86 0 6 0 87 1 0 0 0 88 1 0 0 0
                                    89 2 0 0 0 35 90 2 0 0 0 57 91 2 0 0 0 92
                                    93 2 45 9 0 0 94 2 0 9 0 0 95 2 0 9 0 0 96
                                    1 45 41 0 97 1 0 98 0 99 1 45 41 0 100 1 0
                                    98 0 101 0 41 0 103 1 0 0 98 104 1 0 0 105
                                    106 1 107 105 0 108 1 107 105 0 109 1 0 0
                                    107 110 1 0 0 0 111 2 42 0 112 0 113 2 114
                                    2 2 42 115 1 116 0 42 117 2 15 9 0 27 118 2
                                    116 0 0 0 119 1 116 42 0 120 1 42 0 0 121 2
                                    0 9 0 0 122 2 35 9 0 0 123 2 41 124 0 15
                                    125 1 126 41 0 127 1 126 0 0 128 2 41 0 0 0
                                    129 3 41 0 0 15 35 130 2 41 0 0 0 131 2 45
                                    0 41 41 132 0 0 9 133 1 0 9 9 134 2 42 15 0
                                    57 135 0 136 0 137 1 0 124 12 138 3 140 139
                                    2 15 139 141 1 0 0 12 142 3 139 0 0 136 2
                                    143 1 139 2 0 144 2 0 0 98 98 145 2 147 0
                                    146 0 148 1 45 149 150 151 1 41 152 150 153
                                    1 0 152 150 154 2 155 0 146 0 156 2 45 157
                                    150 158 159 2 41 160 150 158 161 2 0 160
                                    150 158 162 2 42 9 15 0 163 2 42 0 15 0 164
                                    2 165 2 139 27 166 2 0 0 124 27 167 0 168 2
                                    169 0 0 0 170 1 168 2 2 171 1 0 0 0 172 1
                                    168 2 2 173 1 0 0 0 174 1 168 2 2 175 1 0 0
                                    0 176 1 168 2 2 177 1 0 0 0 178 1 168 2 2
                                    179 1 0 0 0 180 1 168 2 2 181 1 0 0 0 182 1
                                    168 2 2 183 1 0 0 0 184 1 168 2 2 185 1 0 0
                                    0 186 1 168 2 2 187 1 0 0 0 188 1 168 2 2
                                    189 1 0 0 0 190 1 168 2 2 191 1 0 0 0 192 1
                                    168 2 2 193 1 0 0 0 194 1 168 2 2 195 1 0 0
                                    0 196 1 168 2 2 197 1 0 0 0 198 1 168 2 2
                                    199 1 0 0 0 200 1 168 2 2 201 1 0 0 0 202 1
                                    168 2 2 203 1 0 0 0 204 1 168 2 2 205 1 0 0
                                    0 206 1 168 2 2 207 1 0 0 0 208 1 168 2 2
                                    209 1 0 0 0 210 1 168 2 2 211 1 0 0 0 212 1
                                    168 2 2 213 1 0 0 0 214 1 168 2 2 215 1 0 0
                                    0 216 1 168 2 2 217 1 0 0 0 218 1 168 2 2
                                    219 1 0 0 0 220 1 168 2 2 221 1 0 0 0 222 1
                                    223 2 2 224 1 0 0 0 225 1 223 2 2 226 1 0 0
                                    0 227 2 223 2 2 2 228 2 0 0 0 0 229 2 223 2
                                    2 2 230 2 0 0 0 0 231 1 223 2 2 232 1 0 0 0
                                    233 2 223 2 2 2 234 2 0 0 0 0 235 2 223 2 2
                                    2 236 2 0 0 0 0 237 2 223 2 2 2 238 2 0 0 0
                                    0 239 2 223 2 2 2 240 2 0 0 0 0 241 2 223 2
                                    2 2 242 2 0 0 0 0 243 1 223 2 2 244 1 0 0 0
                                    245 1 223 2 2 246 1 0 0 0 247 1 223 2 2 248
                                    1 0 0 0 249 1 223 2 2 250 1 0 0 0 251 1 223
                                    2 2 252 1 0 0 0 253 2 223 2 2 2 254 2 0 0 0
                                    0 255 3 223 2 2 2 2 256 3 0 0 0 0 0 257 3
                                    223 2 2 2 2 258 3 0 0 0 0 0 259 3 223 2 2 2
                                    2 260 3 0 0 0 0 0 261 3 223 2 2 2 2 262 3 0
                                    0 0 0 0 263 3 223 2 2 2 2 264 3 0 0 0 0 0
                                    265 3 223 2 2 2 2 266 3 0 0 0 0 0 267 2 223
                                    2 2 2 268 2 0 0 0 0 269 2 223 2 2 2 270 2 0
                                    0 0 0 271 2 223 2 2 2 272 2 0 0 0 0 273 2
                                    223 2 2 2 274 2 0 0 0 0 275 2 223 2 2 2 276
                                    2 0 0 0 0 277 2 223 2 2 2 278 2 0 0 0 0 279
                                    3 223 2 2 2 2 280 3 0 0 0 0 0 281 3 223 2 2
                                    2 2 282 3 0 0 0 0 0 283 3 223 2 2 2 2 284 3
                                    0 0 0 0 0 285 3 223 2 2 2 2 286 3 0 0 0 0 0
                                    287 3 223 2 2 2 2 288 3 0 0 0 0 0 289 3 223
                                    2 2 2 2 290 3 0 0 0 0 0 291 2 223 2 2 2 292
                                    2 0 0 0 0 293 2 223 2 2 2 294 2 0 0 0 0 295
                                    2 223 2 2 2 296 2 0 0 0 0 297 2 223 2 2 2
                                    298 2 0 0 0 0 299 1 223 2 2 300 1 0 0 0 301
                                    1 223 2 2 302 1 0 0 0 303 2 223 2 2 2 304 2
                                    0 0 0 0 305 2 223 2 2 2 306 2 0 0 0 0 307 3
                                    223 2 2 2 2 308 3 0 0 0 0 0 309 2 223 2 2 2
                                    310 2 0 0 0 0 311 2 223 2 2 2 312 2 0 0 0 0
                                    313 2 223 2 2 2 314 2 0 0 0 0 315 2 223 2 2
                                    2 316 2 0 0 0 0 317 2 223 2 2 2 318 2 0 0 0
                                    0 319 3 223 2 2 2 2 320 3 0 0 0 0 0 321 1
                                    223 2 2 322 1 0 0 0 323 3 223 2 78 78 2 324
                                    3 0 0 325 325 0 326 5 223 2 78 78 78 78 2
                                    327 5 0 0 325 325 325 325 0 328 2 329 2 2 2
                                    330 1 329 2 2 331 1 0 0 0 332 2 329 2 2 2
                                    333 2 0 0 0 0 334 2 329 2 2 2 335 2 0 0 0 0
                                    336 1 329 2 2 337 1 0 0 0 338 2 329 2 2 27
                                    339 2 0 0 0 27 340 2 329 2 2 27 341 2 0 0 0
                                    27 342 2 329 2 2 343 344 2 0 0 0 345 346 2
                                    329 2 2 27 347 2 0 0 0 27 348 2 329 2 2 343
                                    349 2 0 0 0 345 350 1 351 2 2 352 1 0 0 0
                                    353 1 351 2 2 354 1 0 0 0 355 1 351 2 2 356
                                    1 0 0 0 357 1 351 2 2 358 1 0 0 0 359 1 351
                                    2 2 360 1 0 0 0 361 1 351 2 2 362 1 0 0 0
                                    363 1 351 2 2 364 1 0 0 0 365 1 351 2 2 366
                                    1 0 0 0 367 1 351 2 2 368 1 0 0 0 369 1 351
                                    2 2 370 1 0 0 0 371 2 351 2 2 27 372 2 0 0
                                    0 27 373 2 351 2 2 343 374 2 0 0 0 345 375
                                    1 165 9 10 376 1 165 10 10 377 1 168 9 10
                                    378 1 168 10 10 379 1 329 9 10 380 1 329 10
                                    10 381 1 351 9 10 382 1 351 10 10 383 1 223
                                    9 10 384 1 223 10 10 385 1 386 0 41 387 2
                                    389 388 386 15 390 1 388 391 0 392 2 41 35
                                    0 15 393 1 139 35 0 394 2 139 0 0 0 395 1
                                    41 0 15 396 2 391 386 0 386 397 0 139 0 398
                                    2 139 9 0 0 399 1 139 2 0 400 1 139 0 0 401
                                    2 45 124 124 124 402 2 403 124 124 124 404
                                    2 0 124 124 124 405 1 407 406 391 408 1 0
                                    409 124 410 1 407 406 391 411 1 0 409 124
                                    412 0 413 0 414 2 41 0 6 413 415 1 0 0 416
                                    417 2 165 2 2 418 419 2 0 0 0 418 420 1 165
                                    139 15 421 1 165 2 2 422 1 0 0 0 423 1 45
                                    418 0 424 1 0 418 0 425 1 45 71 0 426 1 416
                                    427 0 428 1 416 427 0 429 2 432 2 430 431
                                    433 3 437 2 434 435 436 438 2 416 0 0 0 439
                                    1 0 440 0 441 1 0 0 6 442 1 416 0 418 443 1
                                    416 9 10 444 2 10 9 0 27 445 1 0 446 0 447
                                    2 41 9 0 0 448 0 449 0 450 0 126 0 451 2
                                    126 9 0 0 452 1 126 35 0 453 2 449 0 416 35
                                    454 2 449 0 0 0 455 2 416 0 124 27 456 1
                                    416 10 10 457 2 416 0 10 325 458 1 41 459 0
                                    460 1 41 6 0 461 0 416 0 462 1 126 9 0 463
                                    2 416 0 0 35 464 2 416 0 0 0 465 2 416 0 0
                                    0 466 1 45 467 0 468 1 0 467 0 469 4 0 0 0
                                    470 325 27 471 4 0 0 0 10 0 27 472 1 0 38 0
                                    473 1 38 0 325 474 1 38 0 0 475 1 27 9 0
                                    476 2 38 0 477 0 478 2 479 146 2 27 480 3 0
                                    0 0 470 482 483 0 27 0 484 1 0 0 27 485 2
                                    486 0 2 2 487 2 0 0 0 488 489 3 492 490 2
                                    491 490 493 3 0 494 0 491 494 495 3 498 496
                                    2 497 496 499 3 0 500 0 497 500 501 1 45
                                    152 150 502 2 45 160 150 158 503 3 504 490
                                    15 491 490 505 4 508 506 45 491 506 507 509
                                    3 510 496 15 497 496 511 4 514 512 45 497
                                    512 513 515 1 45 0 15 516 1 45 518 0 519 1
                                    6 9 0 520 1 16 15 6 521 1 0 6 0 522 1 45
                                    523 0 524 1 0 523 0 525 3 0 0 0 74 325 526
                                    2 0 0 481 12 527 4 529 2 42 78 15 528 530 3
                                    0 0 0 74 325 531 2 0 0 10 325 532 2 45 0 57
                                    15 533 1 0 534 0 535 1 518 517 0 536 1 0
                                    538 0 539 1 0 14 0 540 2 0 9 0 0 122 2 1
                                    325 0 27 1 1 1 325 0 1 1 1 325 124 1 2 1
                                    325 124 27 1 1 1 325 550 1 2 1 0 0 27 1 1 1
                                    0 0 1 1 1 0 124 1 2 1 0 124 27 1 1 1 0 550
                                    1 1 25 9 0 54 3 1 0 0 0 0 267 3 1 0 0 0 0
                                    265 3 1 0 0 0 0 263 3 1 0 0 0 0 261 3 1 0 0
                                    0 0 259 3 1 0 0 0 0 257 2 1 0 0 0 271 1 0
                                    38 0 473 2 1 548 0 12 1 1 1 551 0 1 1 1 0 0
                                    1 1 1 9 0 1 1 0 74 0 1 1 1 0 0 204 1 1 0 0
                                    180 2 1 0 0 345 346 2 1 0 0 27 342 2 19 543
                                    0 0 1 3 0 0 0 74 325 531 2 0 0 0 566 1 2 0
                                    0 0 488 489 2 1 0 0 0 275 2 1 0 0 0 273 1
                                    30 409 124 412 1 1 0 0 1 1 1 544 0 1 1 1 0
                                    0 1 2 0 9 0 0 95 2 1 9 0 0 1 1 1 0 0 200 1
                                    1 0 0 176 2 1 0 0 57 86 1 1 9 9 134 1 1 0 0
                                    208 1 1 0 0 184 0 29 0 1 2 1 325 0 27 1 1 1
                                    325 0 1 2 1 325 124 27 1 1 1 325 124 1 1 1
                                    325 550 1 2 1 0 0 27 1 1 1 0 0 1 2 1 0 124
                                    27 167 1 1 0 550 1 1 1 0 124 1 1 1 0 0 323
                                    1 15 440 0 441 1 16 71 0 72 1 1 549 0 1 1
                                    14 557 0 1 1 5 565 0 1 1 0 14 0 540 1 0 446
                                    0 447 1 0 18 0 19 1 15 416 0 1 1 16 418 0
                                    425 1 1 107 0 1 1 14 57 0 1 1 5 105 0 1 1 0
                                    6 0 522 1 0 27 0 1 1 0 12 0 13 2 1 0 0 0 1
                                    1 24 541 150 1 2 24 542 150 158 1 2 5 160
                                    150 158 162 1 5 152 150 154 1 1 0 0 111 1
                                    27 543 0 1 2 1 0 0 0 1 2 1 0 0 345 350 2 1
                                    0 0 27 348 1 1 552 325 1 1 1 9 0 1 2 1 0 0
                                    0 255 2 1 0 0 0 235 0 1 0 170 2 1 0 0 0 336
                                    3 12 500 0 497 500 501 3 13 494 0 491 494
                                    495 1 0 0 0 1 1 0 0 325 1 1 0 470 0 1 1 0
                                    10 10 37 1 27 9 0 52 1 31 9 0 1 1 5 0 0 88
                                    1 5 98 0 99 1 1 9 0 73 2 1 0 0 57 1 2 1 534
                                    325 0 1 1 32 124 12 138 5 33 0 325 325 325
                                    325 0 328 2 0 0 481 12 527 1 0 18 0 1 3 1 0
                                    0 0 0 283 3 1 0 0 0 0 281 1 1 0 0 174 1 1 0
                                    0 365 3 1 0 0 0 0 321 3 1 0 0 0 0 291 3 1 0
                                    0 0 0 289 1 1 0 325 1 2 1 0 0 0 1 1 0 568 0
                                    1 1 1 0 0 253 3 1 0 0 0 0 287 3 1 0 0 0 0
                                    285 1 0 74 0 75 2 0 0 10 0 1 2 0 0 10 325
                                    532 2 1 0 0 0 299 2 1 0 0 0 297 2 1 0 0 0
                                    295 2 1 0 0 0 293 2 1 0 0 0 317 2 1 0 0 0
                                    319 2 1 0 0 0 311 2 1 0 0 0 315 2 1 0 0 0
                                    313 1 27 534 0 1 1 5 562 0 1 1 25 534 0 535
                                    1 25 538 0 539 2 5 559 0 27 1 2 5 559 0 10
                                    1 1 27 559 0 1 2 0 9 0 27 76 2 0 9 0 10 1 1
                                    23 0 0 1 2 1 0 0 27 373 2 1 0 0 345 375 3
                                    33 0 325 325 0 326 1 0 35 0 1 1 0 567 0 1 2
                                    1 0 0 0 279 2 1 0 0 0 277 1 0 9 0 70 1 0 6
                                    0 1 0 1 9 133 2 1 124 124 124 405 1 1 0 325
                                    1 2 1 0 0 0 1 1 1 0 0 369 1 1 0 0 371 2 0 9
                                    0 27 1 2 0 9 0 0 1 1 1 0 0 338 2 1 0 0 27
                                    340 1 1 0 0 332 1 30 409 124 410 1 1 544 0
                                    1 3 1 555 0 0 0 1 2 1 556 0 0 1 2 1 543 0 0
                                    1 2 1 534 325 0 1 1 1 0 0 172 1 31 9 0 1 2
                                    9 0 0 27 1 2 9 0 0 38 1 4 9 0 0 10 0 27 472
                                    1 9 0 0 1 4 9 0 0 470 325 27 471 4 5 0 0 38
                                    560 482 1 4 5 0 0 38 560 564 1 4 5 0 0 27
                                    35 481 1 4 5 0 0 27 35 563 1 3 0 0 0 10 481
                                    1 3 0 0 0 470 564 1 3 0 0 0 10 563 1 3 0 0
                                    0 470 482 483 3 0 0 0 27 563 1 3 0 0 0 27
                                    481 1 3 0 0 0 38 482 1 3 0 0 0 38 564 1 3 0
                                    0 0 0 0 1 3 0 0 0 325 325 1 2 0 0 0 566 1 3
                                    0 0 0 74 325 526 2 0 0 0 488 1 3 0 0 0 12 0
                                    1 1 1 35 0 1 1 1 0 0 353 10 0 0 10 0 0 0 0
                                    0 0 0 0 0 1 2 0 0 10 325 1 9 0 0 10 0 0 0 0
                                    0 0 0 0 1 7 0 0 10 0 0 0 0 0 0 1 8 0 0 10 0
                                    0 0 0 0 0 0 1 5 0 0 10 0 0 0 0 1 6 0 0 10 0
                                    0 0 0 0 1 4 0 0 10 0 0 0 1 2 0 0 10 0 1 3 0
                                    0 10 0 0 1 3 1 0 0 0 0 309 1 1 0 0 301 2 1
                                    0 0 0 307 2 1 0 0 0 305 1 1 0 0 303 2 1 553
                                    0 0 1 2 0 0 0 0 1 1 0 0 0 1 1 1 0 0 367 1 1
                                    0 0 233 3 5 0 0 27 35 1 3 5 0 0 38 560 1 2
                                    5 0 0 38 1 2 5 0 0 27 1 1 1 0 0 89 1 1 98 0
                                    101 1 32 0 0 423 1 1 0 0 210 1 1 0 0 186 1
                                    1 0 0 206 1 1 0 0 182 1 1 0 0 202 1 1 0 0
                                    178 1 9 467 0 469 1 10 497 0 1 1 11 491 0 1
                                    1 1 0 544 1 2 8 0 0 0 1 2 8 0 0 0 1 1 15 0
                                    416 417 1 22 0 418 1 1 21 0 57 61 1 1 0 545
                                    1 1 1 0 546 1 1 1 0 547 1 1 1 0 107 110 1 1
                                    0 0 1 1 5 0 98 104 1 5 0 105 106 1 0 0 6
                                    442 1 0 0 27 485 1 0 0 12 142 1 0 523 0 525
                                    1 3 543 0 1 0 5 35 1 1 0 0 0 1 1 0 0 325 1
                                    2 1 0 0 0 334 2 1 0 0 0 239 2 1 0 0 0 243 2
                                    1 0 0 0 237 2 1 0 0 0 241 1 0 9 10 11 1 1 0
                                    0 216 1 1 0 0 192 2 1 9 0 0 1 1 1 0 0 212 1
                                    1 0 0 188 1 1 0 0 220 1 1 0 0 196 5 0 0 27
                                    0 0 0 0 1 2 0 0 27 325 1 4 0 0 27 0 0 0 1 2
                                    0 0 27 0 1 3 0 0 27 0 0 1 2 1 0 0 0 269 1 1
                                    0 0 251 1 1 0 0 249 1 1 0 0 247 1 1 0 0 245
                                    1 1 0 0 222 1 1 0 0 198 1 1 0 0 218 1 1 0 0
                                    194 1 1 0 0 214 1 1 0 0 190 1 1 0 0 225 2
                                    23 0 0 57 91 2 1 0 0 0 83 2 1 0 0 418 420 2
                                    27 0 0 35 90 2 27 0 0 92 93 0 25 0 47 1 1 0
                                    0 357 1 1 0 0 361 0 27 0 49 1 1 0 0 227 2 1
                                    0 0 0 229 1 1 0 0 355 3 5 0 0 38 560 1 3 5
                                    0 0 27 35 1 2 5 0 0 27 1 2 5 0 0 38 1 1 1 0
                                    0 359 1 1 0 0 363 2 1 0 0 0 231 2 0 9 0 0
                                    96 2 23 0 0 0 69 2 1 0 98 98 145 1 19 0 0
                                    56 2 19 0 0 0 67 2 25 0 0 0 65 2 19 0 57 0
                                    59 2 25 0 35 0 1 2 25 0 92 0 1 2 2 0 6 0 1
                                    2 2 0 0 6 1 2 1 0 418 0 1 2 1 0 0 418 1 2
                                    27 0 0 0 63)))))
           '|lookupComplete|)) 
