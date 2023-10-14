
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
               (|EXPR;algkernels|
                (SPADCALL (SPADCALL |args| 1 (QREFELT $ 81)) (QREFELT $ 75)) $)
               $)
              (SPADCALL |args| 2 (QREFELT $ 81)) (QREFELT $ 83)))
            (#2='T
             (SPADCALL (SPADCALL |args| (QREFELT $ 84))
                       (SPADCALL |n| (SPADCALL |args| (QREFELT $ 85))
                                 (QREFELT $ 59))
                       (QREFELT $ 83)))))))
        (#2#
         (|EXPR;reduc| (SPADCALL |x| |n| (QREFELT $ 82))
          (|EXPR;algkernels| |k| $) $)))))))) 

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

(DEFUN |EXPR;reduce;2$;29| (|x| $)
  (|EXPR;reduc| |x| (|EXPR;algkernels| (SPADCALL |x| (QREFELT $ 75)) $) $)) 

(DEFUN |EXPR;commonk| (|x| |y| $)
  (|EXPR;commonk0| (|EXPR;algkernels| (SPADCALL |x| (QREFELT $ 75)) $)
   (|EXPR;algkernels| (SPADCALL |y| (QREFELT $ 75)) $) $)) 

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
  (SPADCALL |f| (|EXPR;algkernels| (SPADCALL |f| (QREFELT $ 75)) $)
            (QREFELT $ 115))) 

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
  (SPADCALL (SPADCALL (|EXPR;alg_ker_set| |x| $) (QREFELT $ 120))
            (QREFELT $ 121))) 

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
       (|EXPR;reduc| (SPADCALL |n1| |d1| (QREFELT $ 132))
        (|EXPR;algkernels| (SPADCALL |x| (QREFELT $ 75)) $) $)))))) 

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
                      (REVERSE
                       (|EXPR;algtower|
                        (SPADCALL (|spadConstant| $ 103)
                                  (SPADCALL |x1| (QREFELT $ 101))
                                  (QREFELT $ 132))
                        $))
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
   (|EXPR;commonk0| (|EXPR;algkernels| (SPADCALL |x| (QREFELT $ 145)) $)
    (|EXPR;algkernels| (SPADCALL |y| (QREFELT $ 145)) $) $)
   $)) 

(DEFUN |EXPR;reducedSystem;MM;41| (|m| $)
  (PROG (|mm|)
    (RETURN
     (SEQ
      (LETT |mm|
            (SPADCALL
             (SPADCALL (CONS (|function| |EXPR;toprat|) $) |m| (QREFELT $ 149))
             (QREFELT $ 152))
            |EXPR;reducedSystem;MM;41|)
      (EXIT (SPADCALL |mm| (QREFELT $ 154))))))) 

(DEFUN |EXPR;reducedSystem;MVR;42| (|m| |v| $)
  (PROG (|r|)
    (RETURN
     (SEQ
      (LETT |r|
            (SPADCALL
             (SPADCALL (CONS (|function| |EXPR;toprat|) $) |m| (QREFELT $ 149))
             (SPADCALL (CONS (|function| |EXPR;toprat|) $) |v| (QREFELT $ 157))
             (QREFELT $ 160))
            |EXPR;reducedSystem;MVR;42|)
      (EXIT (SPADCALL (QCAR |r|) (QCDR |r|) (QREFELT $ 162))))))) 

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
                  ((SPADCALL |k| |y| (QREFELT $ 164))
                   (LETT |ans| (SPADCALL |k| |ans| (QREFELT $ 165)) . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |EXPR;rootOf;SupS$;44| (|x| |v| $) (SPADCALL |x| |v| (QREFELT $ 167))) 

(DEFUN |EXPR;pi;$;45| ($) (SPADCALL (QREFELT $ 170))) 

(DEFUN |EXPR;exp;2$;46| (|x| $) (SPADCALL |x| (QREFELT $ 172))) 

(DEFUN |EXPR;log;2$;47| (|x| $) (SPADCALL |x| (QREFELT $ 174))) 

(DEFUN |EXPR;sin;2$;48| (|x| $) (SPADCALL |x| (QREFELT $ 176))) 

(DEFUN |EXPR;cos;2$;49| (|x| $) (SPADCALL |x| (QREFELT $ 178))) 

(DEFUN |EXPR;tan;2$;50| (|x| $) (SPADCALL |x| (QREFELT $ 180))) 

(DEFUN |EXPR;cot;2$;51| (|x| $) (SPADCALL |x| (QREFELT $ 182))) 

(DEFUN |EXPR;sec;2$;52| (|x| $) (SPADCALL |x| (QREFELT $ 184))) 

(DEFUN |EXPR;csc;2$;53| (|x| $) (SPADCALL |x| (QREFELT $ 186))) 

(DEFUN |EXPR;asin;2$;54| (|x| $) (SPADCALL |x| (QREFELT $ 188))) 

(DEFUN |EXPR;acos;2$;55| (|x| $) (SPADCALL |x| (QREFELT $ 190))) 

(DEFUN |EXPR;atan;2$;56| (|x| $) (SPADCALL |x| (QREFELT $ 192))) 

(DEFUN |EXPR;acot;2$;57| (|x| $) (SPADCALL |x| (QREFELT $ 194))) 

(DEFUN |EXPR;asec;2$;58| (|x| $) (SPADCALL |x| (QREFELT $ 196))) 

(DEFUN |EXPR;acsc;2$;59| (|x| $) (SPADCALL |x| (QREFELT $ 198))) 

(DEFUN |EXPR;sinh;2$;60| (|x| $) (SPADCALL |x| (QREFELT $ 200))) 

(DEFUN |EXPR;cosh;2$;61| (|x| $) (SPADCALL |x| (QREFELT $ 202))) 

(DEFUN |EXPR;tanh;2$;62| (|x| $) (SPADCALL |x| (QREFELT $ 204))) 

(DEFUN |EXPR;coth;2$;63| (|x| $) (SPADCALL |x| (QREFELT $ 206))) 

(DEFUN |EXPR;sech;2$;64| (|x| $) (SPADCALL |x| (QREFELT $ 208))) 

(DEFUN |EXPR;csch;2$;65| (|x| $) (SPADCALL |x| (QREFELT $ 210))) 

(DEFUN |EXPR;asinh;2$;66| (|x| $) (SPADCALL |x| (QREFELT $ 212))) 

(DEFUN |EXPR;acosh;2$;67| (|x| $) (SPADCALL |x| (QREFELT $ 214))) 

(DEFUN |EXPR;atanh;2$;68| (|x| $) (SPADCALL |x| (QREFELT $ 216))) 

(DEFUN |EXPR;acoth;2$;69| (|x| $) (SPADCALL |x| (QREFELT $ 218))) 

(DEFUN |EXPR;asech;2$;70| (|x| $) (SPADCALL |x| (QREFELT $ 220))) 

(DEFUN |EXPR;acsch;2$;71| (|x| $) (SPADCALL |x| (QREFELT $ 222))) 

(DEFUN |EXPR;abs;2$;72| (|x| $) (SPADCALL |x| (QREFELT $ 225))) 

(DEFUN |EXPR;Gamma;2$;73| (|x| $) (SPADCALL |x| (QREFELT $ 227))) 

(DEFUN |EXPR;Gamma;3$;74| (|a| |x| $) (SPADCALL |a| |x| (QREFELT $ 229))) 

(DEFUN |EXPR;Beta;3$;75| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 231))) 

(DEFUN |EXPR;digamma;2$;76| (|x| $) (SPADCALL |x| (QREFELT $ 233))) 

(DEFUN |EXPR;polygamma;3$;77| (|k| |x| $) (SPADCALL |k| |x| (QREFELT $ 235))) 

(DEFUN |EXPR;besselJ;3$;78| (|v| |x| $) (SPADCALL |v| |x| (QREFELT $ 237))) 

(DEFUN |EXPR;besselY;3$;79| (|v| |x| $) (SPADCALL |v| |x| (QREFELT $ 239))) 

(DEFUN |EXPR;besselI;3$;80| (|v| |x| $) (SPADCALL |v| |x| (QREFELT $ 241))) 

(DEFUN |EXPR;besselK;3$;81| (|v| |x| $) (SPADCALL |v| |x| (QREFELT $ 243))) 

(DEFUN |EXPR;airyAi;2$;82| (|x| $) (SPADCALL |x| (QREFELT $ 245))) 

(DEFUN |EXPR;airyAiPrime;2$;83| (|x| $) (SPADCALL |x| (QREFELT $ 247))) 

(DEFUN |EXPR;airyBi;2$;84| (|x| $) (SPADCALL |x| (QREFELT $ 249))) 

(DEFUN |EXPR;airyBiPrime;2$;85| (|x| $) (SPADCALL |x| (QREFELT $ 251))) 

(DEFUN |EXPR;lambertW;2$;86| (|x| $) (SPADCALL |x| (QREFELT $ 253))) 

(DEFUN |EXPR;polylog;3$;87| (|s| |x| $) (SPADCALL |s| |x| (QREFELT $ 255))) 

(DEFUN |EXPR;weierstrassP;4$;88| (|g2| |g3| |x| $)
  (SPADCALL |g2| |g3| |x| (QREFELT $ 257))) 

(DEFUN |EXPR;weierstrassPPrime;4$;89| (|g2| |g3| |x| $)
  (SPADCALL |g2| |g3| |x| (QREFELT $ 259))) 

(DEFUN |EXPR;weierstrassSigma;4$;90| (|g2| |g3| |x| $)
  (SPADCALL |g2| |g3| |x| (QREFELT $ 261))) 

(DEFUN |EXPR;weierstrassZeta;4$;91| (|g2| |g3| |x| $)
  (SPADCALL |g2| |g3| |x| (QREFELT $ 263))) 

(DEFUN |EXPR;whittakerM;4$;92| (|k| |m| |z| $)
  (SPADCALL |k| |m| |z| (QREFELT $ 265))) 

(DEFUN |EXPR;whittakerW;4$;93| (|k| |m| |z| $)
  (SPADCALL |k| |m| |z| (QREFELT $ 267))) 

(DEFUN |EXPR;angerJ;3$;94| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 269))) 

(DEFUN |EXPR;weberE;3$;95| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 271))) 

(DEFUN |EXPR;struveH;3$;96| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 273))) 

(DEFUN |EXPR;struveL;3$;97| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 275))) 

(DEFUN |EXPR;hankelH1;3$;98| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 277))) 

(DEFUN |EXPR;hankelH2;3$;99| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 279))) 

(DEFUN |EXPR;lommelS1;4$;100| (|mu| |nu| |z| $)
  (SPADCALL |mu| |nu| |z| (QREFELT $ 281))) 

(DEFUN |EXPR;lommelS2;4$;101| (|mu| |nu| |z| $)
  (SPADCALL |mu| |nu| |z| (QREFELT $ 283))) 

(DEFUN |EXPR;kummerM;4$;102| (|mu| |nu| |z| $)
  (SPADCALL |mu| |nu| |z| (QREFELT $ 285))) 

(DEFUN |EXPR;kummerU;4$;103| (|mu| |nu| |z| $)
  (SPADCALL |mu| |nu| |z| (QREFELT $ 287))) 

(DEFUN |EXPR;legendreP;4$;104| (|nu| |mu| |z| $)
  (SPADCALL |nu| |mu| |z| (QREFELT $ 289))) 

(DEFUN |EXPR;legendreQ;4$;105| (|nu| |mu| |z| $)
  (SPADCALL |nu| |mu| |z| (QREFELT $ 291))) 

(DEFUN |EXPR;kelvinBei;3$;106| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 293))) 

(DEFUN |EXPR;kelvinBer;3$;107| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 295))) 

(DEFUN |EXPR;kelvinKei;3$;108| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 297))) 

(DEFUN |EXPR;kelvinKer;3$;109| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 299))) 

(DEFUN |EXPR;ellipticK;2$;110| (|m| $) (SPADCALL |m| (QREFELT $ 301))) 

(DEFUN |EXPR;ellipticE;2$;111| (|m| $) (SPADCALL |m| (QREFELT $ 303))) 

(DEFUN |EXPR;ellipticE;3$;112| (|z| |m| $) (SPADCALL |z| |m| (QREFELT $ 305))) 

(DEFUN |EXPR;ellipticF;3$;113| (|z| |m| $) (SPADCALL |z| |m| (QREFELT $ 307))) 

(DEFUN |EXPR;ellipticPi;4$;114| (|z| |n| |m| $)
  (SPADCALL |z| |n| |m| (QREFELT $ 309))) 

(DEFUN |EXPR;jacobiSn;3$;115| (|z| |m| $) (SPADCALL |z| |m| (QREFELT $ 311))) 

(DEFUN |EXPR;jacobiCn;3$;116| (|z| |m| $) (SPADCALL |z| |m| (QREFELT $ 313))) 

(DEFUN |EXPR;jacobiDn;3$;117| (|z| |m| $) (SPADCALL |z| |m| (QREFELT $ 315))) 

(DEFUN |EXPR;jacobiZeta;3$;118| (|z| |m| $) (SPADCALL |z| |m| (QREFELT $ 317))) 

(DEFUN |EXPR;jacobiTheta;3$;119| (|q| |z| $) (SPADCALL |q| |z| (QREFELT $ 319))) 

(DEFUN |EXPR;lerchPhi;4$;120| (|z| |s| |a| $)
  (SPADCALL |z| |s| |a| (QREFELT $ 321))) 

(DEFUN |EXPR;riemannZeta;2$;121| (|z| $) (SPADCALL |z| (QREFELT $ 323))) 

(DEFUN |EXPR;hypergeometricF;2L2$;122| (|la| |lb| |x| $)
  (SPADCALL |la| |lb| |x| (QREFELT $ 325))) 

(DEFUN |EXPR;meijerG;4L2$;123| (|la| |lb| |lc| |ld| |x| $)
  (SPADCALL |la| |lb| |lc| |ld| |x| (QREFELT $ 328))) 

(DEFUN |EXPR;^;3$;124| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 331))) 

(DEFUN |EXPR;factorial;2$;125| (|x| $) (SPADCALL |x| (QREFELT $ 332))) 

(DEFUN |EXPR;binomial;3$;126| (|n| |m| $) (SPADCALL |n| |m| (QREFELT $ 334))) 

(DEFUN |EXPR;permutation;3$;127| (|n| |m| $) (SPADCALL |n| |m| (QREFELT $ 336))) 

(DEFUN |EXPR;factorials;2$;128| (|x| $) (SPADCALL |x| (QREFELT $ 338))) 

(DEFUN |EXPR;factorials;$S$;129| (|x| |n| $) (SPADCALL |x| |n| (QREFELT $ 340))) 

(DEFUN |EXPR;summation;$S$;130| (|x| |n| $) (SPADCALL |x| |n| (QREFELT $ 342))) 

(DEFUN |EXPR;summation;$Sb$;131| (|x| |s| $) (SPADCALL |x| |s| (QREFELT $ 345))) 

(DEFUN |EXPR;product;$S$;132| (|x| |n| $) (SPADCALL |x| |n| (QREFELT $ 348))) 

(DEFUN |EXPR;product;$Sb$;133| (|x| |s| $) (SPADCALL |x| |s| (QREFELT $ 350))) 

(DEFUN |EXPR;erf;2$;134| (|x| $) (SPADCALL |x| (QREFELT $ 353))) 

(DEFUN |EXPR;Ei;2$;135| (|x| $) (SPADCALL |x| (QREFELT $ 355))) 

(DEFUN |EXPR;Si;2$;136| (|x| $) (SPADCALL |x| (QREFELT $ 357))) 

(DEFUN |EXPR;Ci;2$;137| (|x| $) (SPADCALL |x| (QREFELT $ 359))) 

(DEFUN |EXPR;Shi;2$;138| (|x| $) (SPADCALL |x| (QREFELT $ 361))) 

(DEFUN |EXPR;Chi;2$;139| (|x| $) (SPADCALL |x| (QREFELT $ 363))) 

(DEFUN |EXPR;li;2$;140| (|x| $) (SPADCALL |x| (QREFELT $ 365))) 

(DEFUN |EXPR;dilog;2$;141| (|x| $) (SPADCALL |x| (QREFELT $ 367))) 

(DEFUN |EXPR;fresnelS;2$;142| (|x| $) (SPADCALL |x| (QREFELT $ 369))) 

(DEFUN |EXPR;fresnelC;2$;143| (|x| $) (SPADCALL |x| (QREFELT $ 371))) 

(DEFUN |EXPR;integral;$S$;144| (|x| |n| $) (SPADCALL |x| |n| (QREFELT $ 373))) 

(DEFUN |EXPR;integral;$Sb$;145| (|x| |s| $) (SPADCALL |x| |s| (QREFELT $ 375))) 

(DEFUN |EXPR;operator;2Bo;146| (|op| $)
  (PROG (|n|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |op| (QREFELT $ 377)) (SPADCALL |op| (QREFELT $ 378)))
            ((SPADCALL |op| (QREFELT $ 379)) (SPADCALL |op| (QREFELT $ 380)))
            ((SPADCALL |op| (QREFELT $ 381)) (SPADCALL |op| (QREFELT $ 382)))
            ((SPADCALL |op| (QREFELT $ 383)) (SPADCALL |op| (QREFELT $ 384)))
            ((SPADCALL |op| (QREFELT $ 385)) (SPADCALL |op| (QREFELT $ 386)))
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
  (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 388)) |k| (QREFELT $ 391))
            (QREFELT $ 393))) 

(DEFUN |EXPR;evl| (|p| |k| |m| $)
  (COND
   ((< (SPADCALL |p| |k| (QREFELT $ 394)) (SPADCALL |m| (QREFELT $ 395)))
    (SPADCALL |p| (QREFELT $ 388)))
   ('T
    (SPADCALL (SPADCALL (|EXPR;evl0| |p| |k| $) |m| (QREFELT $ 396))
              (SPADCALL (SPADCALL |k| (QREFELT $ 397)) (QREFELT $ 388))
              (QREFELT $ 398))))) 

(DEFUN |EXPR;noalg?| (|p| $)
  (PROG (#1=#:G407)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ G190
             (COND
              ((NULL (SPADCALL |p| (|spadConstant| $ 399) (QREFELT $ 400)))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((NULL
                  (NULL
                   (|EXPR;algkernels|
                    (SPADCALL (SPADCALL |p| (QREFELT $ 401)) (QREFELT $ 75))
                    $)))
                 (PROGN (LETT #1# 'NIL . #2=(|EXPR;noalg?|)) (GO #1#)))
                ('T (LETT |p| (SPADCALL |p| (QREFELT $ 402)) . #2#)))))
             NIL (GO G190) G191 (EXIT NIL))
        (EXIT 'T)))
      #1# (EXIT #1#))))) 

(DEFUN |EXPR;gcdPolynomial;3Sup;151| (|p| |q| $)
  (SEQ
   (COND
    ((|EXPR;noalg?| |p| $)
     (COND ((|EXPR;noalg?| |q| $) (EXIT (SPADCALL |p| |q| (QREFELT $ 403)))))))
   (EXIT (SPADCALL |p| |q| (QREFELT $ 405))))) 

(DEFUN |EXPR;factorPolynomial;SupF;152| (|x| $)
  (PROG (|uf|)
    (RETURN
     (SEQ
      (LETT |uf| (SPADCALL |x| (QREFELT $ 409))
            |EXPR;factorPolynomial;SupF;152|)
      (EXIT |uf|))))) 

(DEFUN |EXPR;squareFreePolynomial;SupF;153| (|x| $)
  (PROG (|uf|)
    (RETURN
     (SEQ
      (LETT |uf| (SPADCALL |x| (QREFELT $ 412))
            |EXPR;squareFreePolynomial;SupF;153|)
      (EXIT |uf|))))) 

(DEFUN |EXPR;coerce;An$;154| (|x| $)
  (SPADCALL (SPADCALL |x| (|spadConstant| $ 415) (QREFELT $ 416))
            (QREFELT $ 104))) 

(DEFUN |EXPR;^;$F$;155| (|x| |r| $) (SPADCALL |x| |r| (QREFELT $ 420))) 

(DEFUN |EXPR;minPoly;KSup;156| (|k| $) (SPADCALL |k| (QREFELT $ 422))) 

(DEFUN |EXPR;definingPolynomial;2$;157| (|x| $) (SPADCALL |x| (QREFELT $ 423))) 

(DEFUN |EXPR;retract;$F;158| (|x| $) (SPADCALL |x| (QREFELT $ 425))) 

(DEFUN |EXPR;retractIfCan;$U;159| (|x| $) (SPADCALL |x| (QREFELT $ 427))) 

(DEFUN |EXPR;coerce;An$;160| (|x| $)
  (SPADCALL (|EXPR;smp2expr| (SPADCALL |x| (QREFELT $ 429)) $)
            (|EXPR;smp2expr| (SPADCALL |x| (QREFELT $ 430)) $) (QREFELT $ 69))) 

(DEFUN |EXPR;k2expr| (|k| $) (SPADCALL (ELT $ 418) |k| (QREFELT $ 434))) 

(DEFUN |EXPR;smp2expr| (|p| $)
  (SPADCALL (CONS (|function| |EXPR;k2expr|) $) (ELT $ 61) |p| (QREFELT $ 439))) 

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
                             (SPADCALL (QCDR |n|) (QCDR |d|) (QREFELT $ 440)))
                       . #2#)
                 (GO #1#))))))))))
        (EXIT (CONS 1 "failed"))))
      #1# (EXIT #1#))))) 

(DEFUN |EXPR;R2AN| (|r| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (LETT |u| (SPADCALL (SPADCALL |r| (QREFELT $ 443)) (QREFELT $ 72))
            |EXPR;R2AN|)
      (EXIT
       (COND ((QEQCAR |u| 0) (CONS 0 (SPADCALL (QCDR |u|) (QREFELT $ 444))))
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
           (QREFELT $ 445)))
         (CONS 1 "failed"))
        ('T
         (COND
          ((SPADCALL |op| '|rootOf| (QREFELT $ 446))
           (SEQ (LETT |args| (SPADCALL |k| (QREFELT $ 79)) . #3#)
                (LETT |a2| (SPADCALL |args| 2 (QREFELT $ 81)) . #3#)
                (LETT |k1u| (SPADCALL |a2| (QREFELT $ 19)) . #3#)
                (EXIT
                 (COND ((QEQCAR |k1u| 1) (CONS 1 "failed"))
                       (#4='T
                        (SEQ (LETT |k1| (QCDR |k1u|) . #3#)
                             (LETT |s1u| (SPADCALL |a2| (QREFELT $ 448)) . #3#)
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
                                              (QREFELT $ 449))
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
                                                    (|spadConstant| $ 451)
                                                    . #3#)
                                              (SEQ G190
                                                   (COND
                                                    ((NULL
                                                      (SPADCALL |eq|
                                                                (|spadConstant|
                                                                 $ 452)
                                                                (QREFELT $
                                                                         453)))
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
                                                                             442))
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
                                                                           454))
                                                                         (QREFELT
                                                                          $
                                                                          455))
                                                                        (QREFELT
                                                                         $
                                                                         456))
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
                                                                        457))))))))))))))))))
          (#4#
           (SEQ (LETT |arg| NIL . #3#)
                (SEQ (LETT |x| NIL . #3#)
                     (LETT #2# (SPADCALL |k| (QREFELT $ 79)) . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ (LETT |a| (SPADCALL |x| (QREFELT $ 442)) . #3#)
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
                       (SPADCALL (SPADCALL |op| (QREFELT $ 458))
                                 (NREVERSE |arg|) (QREFELT $ 459))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |EXPR;smp2an| (|p| $)
  (PROG (|c| |up| |ans| #1=#:G484 |t| |k| |x1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |x1| (SPADCALL |p| (QREFELT $ 461)) . #2=(|EXPR;smp2an|))
            (EXIT
             (COND
              ((QEQCAR |x1| 1) (|EXPR;R2AN| (SPADCALL |p| (QREFELT $ 462)) $))
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
                        (SEQ (LETT |ans| (|spadConstant| $ 463) . #2#)
                             (SEQ G190
                                  (COND
                                   ((NULL
                                     (COND
                                      ((SPADCALL |up| (QREFELT $ 464)) 'NIL)
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
                                                                            454))
                                                                  (QREFELT $
                                                                           465))
                                                                 (QREFELT $
                                                                          466))
                                                       (QREFELT $ 467))
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
                                                              467))))))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |EXPR;convert;$If;167| (|x| $) (SPADCALL |x| (QREFELT $ 469))) 

(DEFUN |EXPR;eval;$Bo$S$;168| (|f| |op| |g| |x| $)
  (SPADCALL |f| (LIST |op|) (LIST |g|) |x| (QREFELT $ 472))) 

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
                    (LETT #16# (CONS (SPADCALL |g| (QREFELT $ 474)) #16#)
                          . #17#)))
                  (LETT #15# (CDR #15#) . #17#) (GO G190) G191
                  (EXIT (NREVERSE #16#))))
            . #17#)
      (LETT |lsym|
            (SPADCALL (SPADCALL |llsym| (QREFELT $ 475)) (QREFELT $ 476))
            . #17#)
      (LETT |lsd| (SPADCALL (ELT $ 477) |lsym| (QREFELT $ 479)) . #17#)
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
                                 (CONS (SPADCALL |g| |x| (QREFELT $ 481)) #14#)
                                 . #17#)))
                         (LETT #13# (CDR #13#) . #17#) (GO G190) G191
                         (EXIT (NREVERSE #14#))))
                   (QREFELT $ 484)))
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
                        (LETT #12# (CONS (SPADCALL (QREFELT $ 485)) #12#)
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
                               (SPADCALL (SPADCALL |i| (QREFELT $ 486))
                                         (SPADCALL |j| (QREFELT $ 486))
                                         (QREFELT $ 488))
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
                               (SPADCALL (SPADCALL |j| (QREFELT $ 486))
                                         (SPADCALL |i| (QREFELT $ 486))
                                         (QREFELT $ 488))
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
                               (SPADCALL |g| |lforwardSubs| (QREFELT $ 490))
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
                                         (SPADCALL |g| |x| (QREFELT $ 481))
                                         #2#)
                                        . #17#)))
                                (LETT #1# (CDR #1#) . #17#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 484))
                . #17#)
          (EXIT (SPADCALL |res| |lbackwardSubs| (QREFELT $ 490))))))))))) 

(DEFUN |EXPR;patternMatch;$P2Pmr;170| (|x| |p| |l| $)
  (SPADCALL |x| |p| |l| (QREFELT $ 494))) 

(DEFUN |EXPR;patternMatch;$P2Pmr;171| (|x| |p| |l| $)
  (SPADCALL |x| |p| |l| (QREFELT $ 500))) 

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

(DEFUN |EXPR;reducedSystem;MM;183| (|m| $) (SPADCALL |m| (QREFELT $ 503))) 

(DEFUN |EXPR;reducedSystem;MVR;184| (|m| |v| $)
  (SPADCALL |m| |v| (QREFELT $ 504))) 

(DEFUN |EXPR;convert;$If;185| (|x| $) (SPADCALL |x| (QREFELT $ 469))) 

(DEFUN |EXPR;kintmatch| (|k| |p| |l| $) (SPADCALL |k| |p| |l| (QREFELT $ 506))) 

(DEFUN |EXPR;patternMatch;$P2Pmr;187| (|x| |p| |l| $)
  (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kintmatch|) $) (QREFELT $ 510))) 

(DEFUN |EXPR;kfltmatch| (|k| |p| |l| $) (SPADCALL |k| |p| |l| (QREFELT $ 512))) 

(DEFUN |EXPR;patternMatch;$P2Pmr;189| (|x| |p| |l| $)
  (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kfltmatch|) $) (QREFELT $ 516))) 

(DEFUN |EXPR;Zero;$;190| ($) (|spadConstant| $ 46)) 

(DEFUN |EXPR;+;3$;191| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 64))) 

(DEFUN |EXPR;=;2$B;192| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 51))) 

(DEFUN |EXPR;smaller?;2$B;193| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 94))) 

(DEFUN |EXPR;coerce;K$;194| (|k| $) (SPADCALL |k| (QREFELT $ 517))) 

(DEFUN |EXPR;kernels;$L;195| (|x| $)
  (PROG (#1=#:G552 |f| #2=#:G551)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|EXPR;kernels;$L;195|))
       (SEQ (LETT |f| NIL . #3#)
            (LETT #1# (SPADCALL |x| (QREFELT $ 520)) . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ (EXIT (LETT #2# (CONS (QCAR |f|) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |EXPR;coerce;R$;196| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 521)) (|spadConstant| $ 47))
        ('T (SPADCALL (SPADCALL |x| (QREFELT $ 522)) (QREFELT $ 142))))) 

(DEFUN |EXPR;retract;$R;197| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 54)) (|spadConstant| $ 87))
        ('T (|EXPR;retNotUnit| |x| $)))) 

(DEFUN |EXPR;coerce;$Of;198| (|x| $) (SPADCALL |x| (QREFELT $ 525))) 

(DEFUN |EXPR;kereval| (|k| |lk| |lv| $)
  (PROG ()
    (RETURN
     (SPADCALL |lk| |lv| |k| (CONS #'|EXPR;kereval!1| (VECTOR |lk| |lv| $))
               (QREFELT $ 531))))) 

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
                   (QREFELT $ 528)))))))) 

(DEFUN |EXPR;kereval!0| (|x1| $$)
  (PROG (|lk| |lv| $)
    (LETT |lk| (QREFELT $$ 2) NIL)
    (LETT |lv| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x1| |lk| |lv| (QREFELT $ 527)))))) 

(DEFUN |EXPR;subeval| (|k| |lk| |lv| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL |lk| |lv| |k| (CONS #'|EXPR;subeval!0| (VECTOR |lv| |lk| $))
                (QREFELT $ 531)))))) 

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
                                   (SPADCALL |a| |lk| |lv| (QREFELT $ 532))
                                   #3#)
                                  NIL)))
                          (LETT #2# (CDR #2#) NIL) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    (QREFELT $ 533))))))))) 

(DEFUN |EXPR;isPlus;$U;201| (|x| $)
  (PROG (#1=#:G591 |t| #2=#:G590 |l|)
    (RETURN
     (SEQ
      (COND
       ((OR
         (NULL
          (LETT |l| (SPADCALL |x| (QREFELT $ 520))
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
                             (SPADCALL (QCDR |t|) (QCAR |t|) (QREFELT $ 534))
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
          (LETT |l| (SPADCALL |x| (QREFELT $ 520))
                . #1=(|EXPR;isMult;$U;202|)))
         (NULL (NULL (CDR |l|))))
        (CONS 1 "failed"))
       ('T
        (SEQ (LETT |t| (SPADCALL |l| (QREFELT $ 537)) . #1#)
             (EXIT (CONS 0 (CONS (QCDR |t|) (QCAR |t|))))))))))) 

(DEFUN |EXPR;eval;$LL$;203| (|x| |lk| |lv| $)
  (PROG (#1=#:G607 #2=#:G606 #3=#:G608 #4=#:G610 |t|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|EXPR;eval;$LL$;203|))
       (SEQ (LETT |t| NIL . #5#)
            (LETT #4# (SPADCALL |x| (QREFELT $ 520)) . #5#) G190
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
            (LETT #4# (SPADCALL |x| (QREFELT $ 520)) . #5#) G190
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

(DEFUN |EXPR;coerce;R$;211| (|x| $) (SPADCALL |x| (QREFELT $ 522))) 

(DEFUN |EXPR;retract;$R;212| (|x| $) (|EXPR;retNotUnit| |x| $)) 

(DEFUN |EXPR;retractIfCan;$U;213| (|x| $) (|EXPR;retNotUnitIfCan| |x| $)) 

(DEFUN |EXPR;coerce;$Of;214| (|x| $) (SPADCALL |x| (QREFELT $ 525))) 

(DEFUN |EXPR;eval;$LL$;215| (|x| |lk| |lv| $)
  (PROG ()
    (RETURN
     (SPADCALL |lk| |lv| |x|
               (CONS #'|EXPR;eval;$LL$;215!1| (VECTOR |lk| |lv| $))
               (QREFELT $ 531))))) 

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
                   (QREFELT $ 528)))))))) 

(DEFUN |EXPR;eval;$LL$;215!0| (|x2| $$)
  (PROG (|lk| |lv| $)
    (LETT |lk| (QREFELT $$ 2) NIL)
    (LETT |lv| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x2| |lk| |lv| (QREFELT $ 527)))))) 

(DEFUN |EXPR;subst;$LL$;216| (|x| |lk| |lv| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL |lk| |lv| |x|
                (CONS #'|EXPR;subst;$LL$;216!0| (VECTOR |lv| |lk| $))
                (QREFELT $ 531)))))) 

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
                                   (SPADCALL |a| |lk| |lv| (QREFELT $ 532))
                                   #3#)
                                  NIL)))
                          (LETT #2# (CDR #2#) NIL) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    (QREFELT $ 533))))))))) 

(DEFUN |EXPR;convert;$If;217| (|x| $) (SPADCALL |x| (QREFELT $ 469))) 

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
      (LETT $ (GETREFV 570) . #6#)
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
            (QSETREFV $ 146 (CONS (|dispatchFunction| |EXPR;/;2Smp$;40|) $))
            (QSETREFV $ 155
                      (CONS (|dispatchFunction| |EXPR;reducedSystem;MM;41|) $))
            (QSETREFV $ 163
                      (CONS (|dispatchFunction| |EXPR;reducedSystem;MVR;42|)
                            $))
            (QSETREFV $ 168
                      (CONS (|dispatchFunction| |EXPR;rootOf;SupS$;44|) $))
            (QSETREFV $ 171 (CONS (|dispatchFunction| |EXPR;pi;$;45|) $))
            (QSETREFV $ 173 (CONS (|dispatchFunction| |EXPR;exp;2$;46|) $))
            (QSETREFV $ 175 (CONS (|dispatchFunction| |EXPR;log;2$;47|) $))
            (QSETREFV $ 177 (CONS (|dispatchFunction| |EXPR;sin;2$;48|) $))
            (QSETREFV $ 179 (CONS (|dispatchFunction| |EXPR;cos;2$;49|) $))
            (QSETREFV $ 181 (CONS (|dispatchFunction| |EXPR;tan;2$;50|) $))
            (QSETREFV $ 183 (CONS (|dispatchFunction| |EXPR;cot;2$;51|) $))
            (QSETREFV $ 185 (CONS (|dispatchFunction| |EXPR;sec;2$;52|) $))
            (QSETREFV $ 187 (CONS (|dispatchFunction| |EXPR;csc;2$;53|) $))
            (QSETREFV $ 189 (CONS (|dispatchFunction| |EXPR;asin;2$;54|) $))
            (QSETREFV $ 191 (CONS (|dispatchFunction| |EXPR;acos;2$;55|) $))
            (QSETREFV $ 193 (CONS (|dispatchFunction| |EXPR;atan;2$;56|) $))
            (QSETREFV $ 195 (CONS (|dispatchFunction| |EXPR;acot;2$;57|) $))
            (QSETREFV $ 197 (CONS (|dispatchFunction| |EXPR;asec;2$;58|) $))
            (QSETREFV $ 199 (CONS (|dispatchFunction| |EXPR;acsc;2$;59|) $))
            (QSETREFV $ 201 (CONS (|dispatchFunction| |EXPR;sinh;2$;60|) $))
            (QSETREFV $ 203 (CONS (|dispatchFunction| |EXPR;cosh;2$;61|) $))
            (QSETREFV $ 205 (CONS (|dispatchFunction| |EXPR;tanh;2$;62|) $))
            (QSETREFV $ 207 (CONS (|dispatchFunction| |EXPR;coth;2$;63|) $))
            (QSETREFV $ 209 (CONS (|dispatchFunction| |EXPR;sech;2$;64|) $))
            (QSETREFV $ 211 (CONS (|dispatchFunction| |EXPR;csch;2$;65|) $))
            (QSETREFV $ 213 (CONS (|dispatchFunction| |EXPR;asinh;2$;66|) $))
            (QSETREFV $ 215 (CONS (|dispatchFunction| |EXPR;acosh;2$;67|) $))
            (QSETREFV $ 217 (CONS (|dispatchFunction| |EXPR;atanh;2$;68|) $))
            (QSETREFV $ 219 (CONS (|dispatchFunction| |EXPR;acoth;2$;69|) $))
            (QSETREFV $ 221 (CONS (|dispatchFunction| |EXPR;asech;2$;70|) $))
            (QSETREFV $ 223 (CONS (|dispatchFunction| |EXPR;acsch;2$;71|) $))
            (QSETREFV $ 226 (CONS (|dispatchFunction| |EXPR;abs;2$;72|) $))
            (QSETREFV $ 228 (CONS (|dispatchFunction| |EXPR;Gamma;2$;73|) $))
            (QSETREFV $ 230 (CONS (|dispatchFunction| |EXPR;Gamma;3$;74|) $))
            (QSETREFV $ 232 (CONS (|dispatchFunction| |EXPR;Beta;3$;75|) $))
            (QSETREFV $ 234 (CONS (|dispatchFunction| |EXPR;digamma;2$;76|) $))
            (QSETREFV $ 236
                      (CONS (|dispatchFunction| |EXPR;polygamma;3$;77|) $))
            (QSETREFV $ 238 (CONS (|dispatchFunction| |EXPR;besselJ;3$;78|) $))
            (QSETREFV $ 240 (CONS (|dispatchFunction| |EXPR;besselY;3$;79|) $))
            (QSETREFV $ 242 (CONS (|dispatchFunction| |EXPR;besselI;3$;80|) $))
            (QSETREFV $ 244 (CONS (|dispatchFunction| |EXPR;besselK;3$;81|) $))
            (QSETREFV $ 246 (CONS (|dispatchFunction| |EXPR;airyAi;2$;82|) $))
            (QSETREFV $ 248
                      (CONS (|dispatchFunction| |EXPR;airyAiPrime;2$;83|) $))
            (QSETREFV $ 250 (CONS (|dispatchFunction| |EXPR;airyBi;2$;84|) $))
            (QSETREFV $ 252
                      (CONS (|dispatchFunction| |EXPR;airyBiPrime;2$;85|) $))
            (QSETREFV $ 254
                      (CONS (|dispatchFunction| |EXPR;lambertW;2$;86|) $))
            (QSETREFV $ 256 (CONS (|dispatchFunction| |EXPR;polylog;3$;87|) $))
            (QSETREFV $ 258
                      (CONS (|dispatchFunction| |EXPR;weierstrassP;4$;88|) $))
            (QSETREFV $ 260
                      (CONS (|dispatchFunction| |EXPR;weierstrassPPrime;4$;89|)
                            $))
            (QSETREFV $ 262
                      (CONS (|dispatchFunction| |EXPR;weierstrassSigma;4$;90|)
                            $))
            (QSETREFV $ 264
                      (CONS (|dispatchFunction| |EXPR;weierstrassZeta;4$;91|)
                            $))
            (QSETREFV $ 266
                      (CONS (|dispatchFunction| |EXPR;whittakerM;4$;92|) $))
            (QSETREFV $ 268
                      (CONS (|dispatchFunction| |EXPR;whittakerW;4$;93|) $))
            (QSETREFV $ 270 (CONS (|dispatchFunction| |EXPR;angerJ;3$;94|) $))
            (QSETREFV $ 272 (CONS (|dispatchFunction| |EXPR;weberE;3$;95|) $))
            (QSETREFV $ 274 (CONS (|dispatchFunction| |EXPR;struveH;3$;96|) $))
            (QSETREFV $ 276 (CONS (|dispatchFunction| |EXPR;struveL;3$;97|) $))
            (QSETREFV $ 278
                      (CONS (|dispatchFunction| |EXPR;hankelH1;3$;98|) $))
            (QSETREFV $ 280
                      (CONS (|dispatchFunction| |EXPR;hankelH2;3$;99|) $))
            (QSETREFV $ 282
                      (CONS (|dispatchFunction| |EXPR;lommelS1;4$;100|) $))
            (QSETREFV $ 284
                      (CONS (|dispatchFunction| |EXPR;lommelS2;4$;101|) $))
            (QSETREFV $ 286
                      (CONS (|dispatchFunction| |EXPR;kummerM;4$;102|) $))
            (QSETREFV $ 288
                      (CONS (|dispatchFunction| |EXPR;kummerU;4$;103|) $))
            (QSETREFV $ 290
                      (CONS (|dispatchFunction| |EXPR;legendreP;4$;104|) $))
            (QSETREFV $ 292
                      (CONS (|dispatchFunction| |EXPR;legendreQ;4$;105|) $))
            (QSETREFV $ 294
                      (CONS (|dispatchFunction| |EXPR;kelvinBei;3$;106|) $))
            (QSETREFV $ 296
                      (CONS (|dispatchFunction| |EXPR;kelvinBer;3$;107|) $))
            (QSETREFV $ 298
                      (CONS (|dispatchFunction| |EXPR;kelvinKei;3$;108|) $))
            (QSETREFV $ 300
                      (CONS (|dispatchFunction| |EXPR;kelvinKer;3$;109|) $))
            (QSETREFV $ 302
                      (CONS (|dispatchFunction| |EXPR;ellipticK;2$;110|) $))
            (QSETREFV $ 304
                      (CONS (|dispatchFunction| |EXPR;ellipticE;2$;111|) $))
            (QSETREFV $ 306
                      (CONS (|dispatchFunction| |EXPR;ellipticE;3$;112|) $))
            (QSETREFV $ 308
                      (CONS (|dispatchFunction| |EXPR;ellipticF;3$;113|) $))
            (QSETREFV $ 310
                      (CONS (|dispatchFunction| |EXPR;ellipticPi;4$;114|) $))
            (QSETREFV $ 312
                      (CONS (|dispatchFunction| |EXPR;jacobiSn;3$;115|) $))
            (QSETREFV $ 314
                      (CONS (|dispatchFunction| |EXPR;jacobiCn;3$;116|) $))
            (QSETREFV $ 316
                      (CONS (|dispatchFunction| |EXPR;jacobiDn;3$;117|) $))
            (QSETREFV $ 318
                      (CONS (|dispatchFunction| |EXPR;jacobiZeta;3$;118|) $))
            (QSETREFV $ 320
                      (CONS (|dispatchFunction| |EXPR;jacobiTheta;3$;119|) $))
            (QSETREFV $ 322
                      (CONS (|dispatchFunction| |EXPR;lerchPhi;4$;120|) $))
            (QSETREFV $ 324
                      (CONS (|dispatchFunction| |EXPR;riemannZeta;2$;121|) $))
            (COND
             ((|testBitVector| |pv$| 31)
              (PROGN
               (QSETREFV $ 327
                         (CONS
                          (|dispatchFunction| |EXPR;hypergeometricF;2L2$;122|)
                          (|getDomainView| $ '(|RetractableTo| (|Integer|)))))
               (QSETREFV $ 329
                         (CONS (|dispatchFunction| |EXPR;meijerG;4L2$;123|)
                               (|getDomainView| $
                                                '(|RetractableTo|
                                                  (|Integer|))))))))
            (QSETREFV $ 83 (CONS (|dispatchFunction| |EXPR;^;3$;124|) $))
            (QSETREFV $ 333
                      (CONS (|dispatchFunction| |EXPR;factorial;2$;125|) $))
            (QSETREFV $ 335
                      (CONS (|dispatchFunction| |EXPR;binomial;3$;126|) $))
            (QSETREFV $ 337
                      (CONS (|dispatchFunction| |EXPR;permutation;3$;127|) $))
            (QSETREFV $ 339
                      (CONS (|dispatchFunction| |EXPR;factorials;2$;128|) $))
            (QSETREFV $ 341
                      (CONS (|dispatchFunction| |EXPR;factorials;$S$;129|) $))
            (QSETREFV $ 343
                      (CONS (|dispatchFunction| |EXPR;summation;$S$;130|) $))
            (QSETREFV $ 347
                      (CONS (|dispatchFunction| |EXPR;summation;$Sb$;131|) $))
            (QSETREFV $ 349
                      (CONS (|dispatchFunction| |EXPR;product;$S$;132|) $))
            (QSETREFV $ 351
                      (CONS (|dispatchFunction| |EXPR;product;$Sb$;133|) $))
            (QSETREFV $ 354 (CONS (|dispatchFunction| |EXPR;erf;2$;134|) $))
            (QSETREFV $ 356 (CONS (|dispatchFunction| |EXPR;Ei;2$;135|) $))
            (QSETREFV $ 358 (CONS (|dispatchFunction| |EXPR;Si;2$;136|) $))
            (QSETREFV $ 360 (CONS (|dispatchFunction| |EXPR;Ci;2$;137|) $))
            (QSETREFV $ 362 (CONS (|dispatchFunction| |EXPR;Shi;2$;138|) $))
            (QSETREFV $ 364 (CONS (|dispatchFunction| |EXPR;Chi;2$;139|) $))
            (QSETREFV $ 366 (CONS (|dispatchFunction| |EXPR;li;2$;140|) $))
            (QSETREFV $ 368 (CONS (|dispatchFunction| |EXPR;dilog;2$;141|) $))
            (QSETREFV $ 370
                      (CONS (|dispatchFunction| |EXPR;fresnelS;2$;142|) $))
            (QSETREFV $ 372
                      (CONS (|dispatchFunction| |EXPR;fresnelC;2$;143|) $))
            (QSETREFV $ 374
                      (CONS (|dispatchFunction| |EXPR;integral;$S$;144|) $))
            (QSETREFV $ 376
                      (CONS (|dispatchFunction| |EXPR;integral;$Sb$;145|) $))
            (QSETREFV $ 37
                      (CONS (|dispatchFunction| |EXPR;operator;2Bo;146|) $))
            (COND
             ((|HasCategory| |#1| '(|GcdDomain|))
              (PROGN
               (QSETREFV $ 406
                         (CONS
                          (|dispatchFunction| |EXPR;gcdPolynomial;3Sup;151|)
                          $))
               (QSETREFV $ 411
                         (CONS
                          (|dispatchFunction| |EXPR;factorPolynomial;SupF;152|)
                          $))
               (QSETREFV $ 413
                         (CONS
                          (|dispatchFunction|
                           |EXPR;squareFreePolynomial;SupF;153|)
                          $)))))
            (COND
             ((|domainEqual| |#1| (|AlgebraicNumber|))
              (QSETREFV $ 418
                        (CONS (|dispatchFunction| |EXPR;coerce;An$;154|) $))))
            (COND
             ((|testBitVector| |pv$| 14)
              (PROGN
               (QSETREFV $ 421 (CONS (|dispatchFunction| |EXPR;^;$F$;155|) $))
               (QSETREFV $ 138
                         (CONS (|dispatchFunction| |EXPR;minPoly;KSup;156|) $))
               (QSETREFV $ 424
                         (CONS
                          (|dispatchFunction| |EXPR;definingPolynomial;2$;157|)
                          $))
               (QSETREFV $ 426
                         (CONS (|dispatchFunction| |EXPR;retract;$F;158|) $))
               (QSETREFV $ 72
                         (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;159|)
                               $))
               (COND ((|domainEqual| |#1| (|AlgebraicNumber|)))
                     ('T
                      (PROGN
                       (QSETREFV $ 418
                                 (CONS
                                  (|dispatchFunction| |EXPR;coerce;An$;160|)
                                  $))
                       (QSETREFV $ 442
                                 (CONS
                                  (|dispatchFunction|
                                   |EXPR;retractIfCan;$U;163|)
                                  $))))))))
            (COND
             ((|testBitVector| |pv$| 9)
              (PROGN
               (QSETREFV $ 470
                         (CONS (|dispatchFunction| |EXPR;convert;$If;167|) $))
               (QSETREFV $ 473
                         (CONS (|dispatchFunction| |EXPR;eval;$Bo$S$;168|) $))
               (QSETREFV $ 472
                         (CONS (|dispatchFunction| |EXPR;eval;$LLS$;169|)
                               $)))))
            (COND
             ((|testBitVector| |pv$| 13)
              (QSETREFV $ 496
                        (CONS
                         (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;170|)
                         $))))
            (COND
             ((|testBitVector| |pv$| 12)
              (QSETREFV $ 502
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
            (QSETREFV $ 155
                      (CONS (|dispatchFunction| |EXPR;reducedSystem;MM;183|)
                            $))
            (QSETREFV $ 163
                      (CONS (|dispatchFunction| |EXPR;reducedSystem;MVR;184|)
                            $))
            (COND
             ((|testBitVector| |pv$| 9)
              (QSETREFV $ 470
                        (CONS (|dispatchFunction| |EXPR;convert;$If;185|) $))))
            (COND
             ((|testBitVector| |pv$| 13)
              (PROGN
               (QSETREFV $ 496
                         (CONS
                          (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;187|)
                          $)))))
            (COND
             ((|testBitVector| |pv$| 12)
              (PROGN
               (QSETREFV $ 502
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
         (QSETREFV $ 443 (CONS (|dispatchFunction| |EXPR;coerce;R$;196|) $))
         (QSETREFV $ 523 (CONS (|dispatchFunction| |EXPR;retract;$R;197|) $))
         (QSETREFV $ 526 (CONS (|dispatchFunction| |EXPR;coerce;$Of;198|) $))
         (QSETREFV $ 536 (CONS (|dispatchFunction| |EXPR;isPlus;$U;201|) $))
         (QSETREFV $ 540 (CONS (|dispatchFunction| |EXPR;isMult;$U;202|) $))
         (QSETREFV $ 527 (CONS (|dispatchFunction| |EXPR;eval;$LL$;203|) $))
         (QSETREFV $ 532 (CONS (|dispatchFunction| |EXPR;subst;$LL$;204|) $))
         (QSETREFV $ 541
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
         (QSETREFV $ 443 (CONS (|dispatchFunction| |EXPR;coerce;R$;211|) $))
         (QSETREFV $ 523 (CONS (|dispatchFunction| |EXPR;retract;$R;212|) $))
         (QSETREFV $ 541
                   (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;213|) $))
         (QSETREFV $ 526 (CONS (|dispatchFunction| |EXPR;coerce;$Of;214|) $))
         (QSETREFV $ 527 (CONS (|dispatchFunction| |EXPR;eval;$LL$;215|) $))
         (QSETREFV $ 532 (CONS (|dispatchFunction| |EXPR;subst;$LL$;216|) $))
         (COND
          ((|testBitVector| |pv$| 9)
           (QSETREFV $ 470
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
              (|Union| 419 '#1#) (220 . |retractIfCan|) (225 . |number?|)
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
              (|PolynomialCategoryQuotientFunctions| 414 15 6 41 $$)
              (510 . |univariate|) (517 . |coerce|) (522 . |eval|)
              (529 . |retract|) (534 . |variables|) (539 . /) (|Mapping| $$ $$)
              (|Matrix| $$) (545 . |map|) (|Matrix| 41) (|Matrix| $)
              (551 . |reducedSystem|) (|Matrix| 6) (556 . |reducedSystem|)
              (561 . |reducedSystem|) (|Vector| $$) (566 . |map|)
              (|Record| (|:| |mat| 150) (|:| |vec| (|Vector| 41))) (|Vector| $)
              (572 . |reducedSystem|)
              (|Record| (|:| |mat| 153) (|:| |vec| (|Vector| 6)))
              (578 . |reducedSystem|) (584 . |reducedSystem|) (590 . |member?|)
              (596 . |concat|) (|AlgebraicFunction| 6 $$) (602 . |rootOf|)
              (608 . |rootOf|) (|ElementaryFunction| 6 $$) (614 . |pi|)
              (618 . |pi|) (622 . |exp|) (627 . |exp|) (632 . |log|)
              (637 . |log|) (642 . |sin|) (647 . |sin|) (652 . |cos|)
              (657 . |cos|) (662 . |tan|) (667 . |tan|) (672 . |cot|)
              (677 . |cot|) (682 . |sec|) (687 . |sec|) (692 . |csc|)
              (697 . |csc|) (702 . |asin|) (707 . |asin|) (712 . |acos|)
              (717 . |acos|) (722 . |atan|) (727 . |atan|) (732 . |acot|)
              (737 . |acot|) (742 . |asec|) (747 . |asec|) (752 . |acsc|)
              (757 . |acsc|) (762 . |sinh|) (767 . |sinh|) (772 . |cosh|)
              (777 . |cosh|) (782 . |tanh|) (787 . |tanh|) (792 . |coth|)
              (797 . |coth|) (802 . |sech|) (807 . |sech|) (812 . |csch|)
              (817 . |csch|) (822 . |asinh|) (827 . |asinh|) (832 . |acosh|)
              (837 . |acosh|) (842 . |atanh|) (847 . |atanh|) (852 . |acoth|)
              (857 . |acoth|) (862 . |asech|) (867 . |asech|) (872 . |acsch|)
              (877 . |acsch|) (|FunctionalSpecialFunction| 6 $$) (882 . |abs|)
              (887 . |abs|) (892 . |Gamma|) (897 . |Gamma|) (902 . |Gamma|)
              (908 . |Gamma|) (914 . |Beta|) (920 . |Beta|) (926 . |digamma|)
              (931 . |digamma|) (936 . |polygamma|) (942 . |polygamma|)
              (948 . |besselJ|) (954 . |besselJ|) (960 . |besselY|)
              (966 . |besselY|) (972 . |besselI|) (978 . |besselI|)
              (984 . |besselK|) (990 . |besselK|) (996 . |airyAi|)
              (1001 . |airyAi|) (1006 . |airyAiPrime|) (1011 . |airyAiPrime|)
              (1016 . |airyBi|) (1021 . |airyBi|) (1026 . |airyBiPrime|)
              (1031 . |airyBiPrime|) (1036 . |lambertW|) (1041 . |lambertW|)
              (1046 . |polylog|) (1052 . |polylog|) (1058 . |weierstrassP|)
              (1065 . |weierstrassP|) (1072 . |weierstrassPPrime|)
              (1079 . |weierstrassPPrime|) (1086 . |weierstrassSigma|)
              (1093 . |weierstrassSigma|) (1100 . |weierstrassZeta|)
              (1107 . |weierstrassZeta|) (1114 . |whittakerM|)
              (1121 . |whittakerM|) (1128 . |whittakerW|) (1135 . |whittakerW|)
              (1142 . |angerJ|) (1148 . |angerJ|) (1154 . |weberE|)
              (1160 . |weberE|) (1166 . |struveH|) (1172 . |struveH|)
              (1178 . |struveL|) (1184 . |struveL|) (1190 . |hankelH1|)
              (1196 . |hankelH1|) (1202 . |hankelH2|) (1208 . |hankelH2|)
              (1214 . |lommelS1|) (1221 . |lommelS1|) (1228 . |lommelS2|)
              (1235 . |lommelS2|) (1242 . |kummerM|) (1249 . |kummerM|)
              (1256 . |kummerU|) (1263 . |kummerU|) (1270 . |legendreP|)
              (1277 . |legendreP|) (1284 . |legendreQ|) (1291 . |legendreQ|)
              (1298 . |kelvinBei|) (1304 . |kelvinBei|) (1310 . |kelvinBer|)
              (1316 . |kelvinBer|) (1322 . |kelvinKei|) (1328 . |kelvinKei|)
              (1334 . |kelvinKer|) (1340 . |kelvinKer|) (1346 . |ellipticK|)
              (1351 . |ellipticK|) (1356 . |ellipticE|) (1361 . |ellipticE|)
              (1366 . |ellipticE|) (1372 . |ellipticE|) (1378 . |ellipticF|)
              (1384 . |ellipticF|) (1390 . |ellipticPi|) (1397 . |ellipticPi|)
              (1404 . |jacobiSn|) (1410 . |jacobiSn|) (1416 . |jacobiCn|)
              (1422 . |jacobiCn|) (1428 . |jacobiDn|) (1434 . |jacobiDn|)
              (1440 . |jacobiZeta|) (1446 . |jacobiZeta|)
              (1452 . |jacobiTheta|) (1458 . |jacobiTheta|) (1464 . |lerchPhi|)
              (1471 . |lerchPhi|) (1478 . |riemannZeta|) (1483 . |riemannZeta|)
              (1488 . |hypergeometricF|) (|List| $) (1495 . |hypergeometricF|)
              (1502 . |meijerG|) (1511 . |meijerG|)
              (|CombinatorialFunction| 6 $$) (1520 . ^) (1526 . |factorial|)
              (1531 . |factorial|) (1536 . |binomial|) (1542 . |binomial|)
              (1548 . |permutation|) (1554 . |permutation|)
              (1560 . |factorials|) (1565 . |factorials|) (1570 . |factorials|)
              (1576 . |factorials|) (1582 . |summation|) (1588 . |summation|)
              (|SegmentBinding| $$) (1594 . |summation|) (|SegmentBinding| $)
              (1600 . |summation|) (1606 . |product|) (1612 . |product|)
              (1618 . |product|) (1624 . |product|)
              (|LiouvillianFunction| 6 $$) (1630 . |erf|) (1635 . |erf|)
              (1640 . |Ei|) (1645 . |Ei|) (1650 . |Si|) (1655 . |Si|)
              (1660 . |Ci|) (1665 . |Ci|) (1670 . |Shi|) (1675 . |Shi|)
              (1680 . |Chi|) (1685 . |Chi|) (1690 . |li|) (1695 . |li|)
              (1700 . |dilog|) (1705 . |dilog|) (1710 . |fresnelS|)
              (1715 . |fresnelS|) (1720 . |fresnelC|) (1725 . |fresnelC|)
              (1730 . |integral|) (1736 . |integral|) (1742 . |integral|)
              (1748 . |integral|) (1754 . |belong?|) (1759 . |operator|)
              (1764 . |belong?|) (1769 . |operator|) (1774 . |belong?|)
              (1779 . |operator|) (1784 . |belong?|) (1789 . |operator|)
              (1794 . |belong?|) (1799 . |operator|) (|Fraction| 41)
              (1804 . |coerce|) (|Fraction| 392)
              (|PolynomialCategoryQuotientFunctions| 414 15 6 41 387)
              (1809 . |univariate|) (|SparseUnivariatePolynomial| 387)
              (1815 . |numer|) (1820 . |degree|) (1826 . |degree|)
              (1831 . |rem|) (1837 . |coerce|) (1842 . |elt|) (1848 . |Zero|)
              (1852 . ~=) (1858 . |leadingCoefficient|) (1863 . |reductum|)
              (1868 . |gcdPolynomial|) (|GcdDomain&| $$)
              (1874 . |gcdPolynomial|) (1880 . |gcdPolynomial|)
              (|Factored| 392) (|SupFractionFactorizer| 414 15 6 41)
              (1886 . |factor|) (|Factored| 124) (1891 . |factorPolynomial|)
              (1896 . |squareFree|) (1901 . |squareFreePolynomial|)
              (|IndexedExponents| 15) (1906 . |Zero|) (1910 . |monomial|)
              (|AlgebraicNumber|) (1916 . |coerce|) (|Fraction| 57) (1921 . ^)
              (1927 . ^) (1933 . |minPoly|) (1938 . |definingPolynomial|)
              (1943 . |definingPolynomial|) (1948 . |retract|)
              (1953 . |retract|) (1958 . |retractIfCan|)
              (|SparseMultivariatePolynomial| 57 12) (1963 . |numer|)
              (1968 . |denom|) (|Mapping| $$ 417) (|Kernel| 417)
              (|ExpressionSpaceFunctions2| 417 $$) (1973 . |map|)
              (|Mapping| $$ 432) (|Mapping| $$ 57)
              (|SparseMultivariatePolynomial| 57 432)
              (|PolynomialCategoryLifting| (|IndexedExponents| 432) 432 57 437
                                           $$)
              (1979 . |map|) (1986 . /) (|Union| 417 '"failed")
              (1992 . |retractIfCan|) (1997 . |coerce|) (2002 . |coerce|)
              (2007 . |belong?|) (2012 . |is?|) (|Union| 27 '#1#)
              (2018 . |retractIfCan|) (2023 . ~=)
              (|SparseUnivariatePolynomial| 417) (2029 . |Zero|)
              (2033 . |Zero|) (2037 . ~=) (2043 . |degree|) (2048 . |monomial|)
              (2054 . +) (2060 . |rootOf|) (2066 . |operator|) (2071 . |elt|)
              (|Union| 15 '"failed") (2077 . |mainVariable|)
              (2082 . |leadingCoefficient|) (2087 . |Zero|) (2091 . |ground?|)
              (2096 . ^) (2102 . *) (2108 . +) (|InputForm|) (2114 . |convert|)
              (2119 . |convert|) (|List| 10) (2124 . |eval|) (2132 . |eval|)
              (2140 . |variables|) (2145 . |concat|)
              (2150 . |removeDuplicates|) (2155 . |scripted?|) (|Mapping| 9 27)
              (2160 . |select|) (|MakeUnaryCompiledFunction| $$ $$ $$)
              (2166 . |compiledFunction|) (|Mapping| $ $) (|List| 482)
              (2172 . |eval|) (2179 . |new|) (2183 . |coerce|) (|Equation| $$)
              (2188 . =) (|List| 567) (2194 . |subst|)
              (|PatternMatchResult| 57 $$) (|Pattern| 57)
              (|PatternMatchFunctionSpace| 57 6 $$) (2200 . |patternMatch|)
              (|PatternMatchResult| 57 $) (2207 . |patternMatch|)
              (|PatternMatchResult| (|Float|) $$) (|Pattern| (|Float|))
              (|PatternMatchFunctionSpace| (|Float|) 6 $$)
              (2214 . |patternMatch|) (|PatternMatchResult| (|Float|) $)
              (2221 . |patternMatch|) (2228 . |reducedSystem|)
              (2233 . |reducedSystem|) (|PatternMatchKernel| 57 $$)
              (2239 . |patternMatch|) (|PatternMatchResult| 57 45)
              (|Mapping| 507 15 492 507)
              (|PatternMatchPolynomialCategory| 57 414 15 6 45)
              (2246 . |patternMatch|) (|PatternMatchKernel| (|Float|) $$)
              (2254 . |patternMatch|) (|PatternMatchResult| (|Float|) 45)
              (|Mapping| 513 15 498 513)
              (|PatternMatchPolynomialCategory| (|Float|) 414 15 6 45)
              (2261 . |patternMatch|) (2269 . |coerce|)
              (|Record| (|:| |gen| 15) (|:| |exp| 57)) (|List| 518)
              (2274 . |terms|) (2279 . |zero?|) (2284 . |constantKernel|)
              (2289 . |retract|) (|OutputForm|) (2294 . |coerce|)
              (2299 . |coerce|) (2304 . |eval|) (2311 . |map|)
              (|Mapping| $$ 15) (|ListToMap| 15 $$) (2317 . |match|)
              (2325 . |subst|) (2332 . |kernel|) (2338 . *)
              (|Union| 326 '#2="failed") (2344 . |isPlus|) (2349 . |first|)
              (|Record| (|:| |coef| 57) (|:| |var| 12)) (|Union| 538 '#2#)
              (2354 . |isMult|) (2359 . |retractIfCan|) (|Matrix| 57)
              (|Record| (|:| |mat| 542) (|:| |vec| (|Vector| 57)))
              (|Union| $ '"failed") (|Factored| $) (|Fraction| 6)
              (|Fraction| 548) (|Polynomial| 546) (|Fraction| 124)
              (|Union| 107 '#1#) (|Polynomial| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |coef| 326) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 555 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Union| 57 '#1#) (|Record| (|:| |var| 12) (|:| |exponent| 57))
              (|Union| 559 '#2#) (|List| 35)
              (|Record| (|:| |val| $) (|:| |exponent| 57)) (|Union| 562 '#2#)
              (|Mapping| $ 326) (|List| 564) (|Union| 105 '#1#) (|Equation| $)
              (|SingleInteger|) (|String|))
           '#(~= 2364 |zerosOf| 2370 |zeroOf| 2397 |zero?| 2424 |whittakerW|
              2429 |whittakerM| 2436 |weierstrassZeta| 2443 |weierstrassSigma|
              2450 |weierstrassPPrime| 2457 |weierstrassP| 2464 |weberE| 2471
              |variables| 2477 |univariate| 2482 |unitNormal| 2488
              |unitCanonical| 2493 |unit?| 2498 |tower| 2503 |tanh| 2508 |tan|
              2513 |summation| 2518 |subtractIfCan| 2530 |subst| 2536 |struveL|
              2555 |struveH| 2561 |squareFreePolynomial| 2567 |squareFreePart|
              2572 |squareFree| 2577 |sqrt| 2582 |smaller?| 2587 |sizeLess?|
              2593 |sinh| 2599 |sin| 2604 |simplifyPower| 2609
              |setSimplifyDenomsFlag| 2615 |sech| 2620 |sec| 2625 |sample| 2630
              |rootsOf| 2634 |rootOf| 2661 |riemannZeta| 2688 |retractIfCan|
              2693 |retract| 2733 |rem| 2773 |reducedSystem| 2779 |reduce| 2801
              |recip| 2806 |quo| 2811 |product| 2817 |principalIdeal| 2829
              |prime?| 2834 |polylog| 2839 |polygamma| 2845 |pi| 2851
              |permutation| 2855 |patternMatch| 2861 |paren| 2875 |operators|
              2885 |operator| 2890 |one?| 2895 |odd?| 2900 |numerator| 2905
              |numer| 2910 |number?| 2915 |nthRoot| 2920 |multiEuclidean| 2926
              |minPoly| 2932 |meijerG| 2937 |map| 2946 |mainKernel| 2952
              |lommelS2| 2957 |lommelS1| 2964 |log| 2971 |li| 2976 |lerchPhi|
              2981 |legendreQ| 2988 |legendreP| 2995 |lcm| 3002 |latex| 3013
              |lambertW| 3018 |kummerU| 3023 |kummerM| 3030 |kernels| 3037
              |kernel| 3042 |kelvinKer| 3054 |kelvinKei| 3060 |kelvinBer| 3066
              |kelvinBei| 3072 |jacobiZeta| 3078 |jacobiTheta| 3084 |jacobiSn|
              3090 |jacobiDn| 3096 |jacobiCn| 3102 |isTimes| 3108 |isPower|
              3113 |isPlus| 3118 |isMult| 3123 |isExpt| 3128 |is?| 3145 |inv|
              3157 |integral| 3162 |hypergeometricF| 3174 |height| 3181 |hash|
              3186 |hankelH2| 3191 |hankelH1| 3197 |ground?| 3203 |ground| 3208
              |getSimplifyDenomsFlag| 3213 |gcdPolynomial| 3217 |gcd| 3223
              |fresnelS| 3234 |fresnelC| 3239 |freeOf?| 3244 |factorials| 3256
              |factorial| 3267 |factorPolynomial| 3272 |factor| 3277
              |extendedEuclidean| 3282 |exquo| 3295 |expressIdealMember| 3301
              |exp| 3307 |even?| 3312 |eval| 3317 |euclideanSize| 3478 |erf|
              3483 |elt| 3488 |ellipticPi| 3584 |ellipticK| 3591 |ellipticF|
              3596 |ellipticE| 3602 |divide| 3613 |distribute| 3619 |dilog|
              3630 |digamma| 3635 |differentiate| 3640 |denominator| 3666
              |denom| 3671 |definingPolynomial| 3676 |csch| 3681 |csc| 3686
              |coth| 3691 |cot| 3696 |cosh| 3701 |cos| 3706 |convert| 3711
              |conjugate| 3731 |commutator| 3737 |coerce| 3743 |charthRoot|
              3813 |characteristic| 3818 |box| 3822 |binomial| 3832 |besselY|
              3838 |besselK| 3844 |besselJ| 3850 |besselI| 3856 |belong?| 3862
              |atanh| 3867 |atan| 3872 |associates?| 3877 |asinh| 3883 |asin|
              3888 |asech| 3893 |asec| 3898 |applyQuote| 3903 |angerJ| 3939
              |airyBiPrime| 3945 |airyBi| 3950 |airyAiPrime| 3955 |airyAi| 3960
              |acsch| 3965 |acsc| 3970 |acoth| 3975 |acot| 3980 |acosh| 3985
              |acos| 3990 |abs| 3995 ^ 4000 |Zero| 4030 |Si| 4034 |Shi| 4039
              |One| 4044 |Gamma| 4048 |Ei| 4059 D 4064 |Ci| 4090 |Chi| 4095
              |Beta| 4100 = 4106 / 4112 - 4124 + 4135 * 4141)
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
                |IntegralDomain&| |Algebra&| |Algebra&| |Algebra&|
                |FullyLinearlyExplicitRingOver&| |Module&| NIL |Module&|
                |Module&| NIL NIL NIL NIL NIL |PartialDifferentialRing&| NIL
                NIL NIL |Ring&| NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&|
                |Group&| NIL NIL |ExpressionSpace&| NIL NIL |Monoid&|
                |AbelianMonoid&| NIL NIL NIL NIL |SemiGroup&|
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
                 (|Algebra| $$) (|Algebra| 419) (|Algebra| 6)
                 (|FullyLinearlyExplicitRingOver| 6) (|Module| $$)
                 (|EntireRing|) (|Module| 419) (|Module| 6)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|LinearlyExplicitRingOver| 6) (|LinearlyExplicitRingOver| 57)
                 (|CommutativeRing|) (|PartialDifferentialRing| 27)
                 (|BiModule| $$ $$) (|BiModule| 419 419) (|BiModule| 6 6)
                 (|Ring|) (|RightModule| $$) (|LeftModule| 419)
                 (|RightModule| 419) (|LeftModule| $$) (|LeftModule| 6)
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
                 (|CoercibleTo| 524) (|RetractableTo| 419)
                 (|RetractableTo| (|Fraction| (|Polynomial| 6)))
                 (|CommutativeStar|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|RetractableTo| (|Polynomial| 6))
                 (|ConvertibleTo| 468) (|ConvertibleTo| 498)
                 (|ConvertibleTo| 492) (|RetractableTo| 57)
                 (|RetractableTo| 417) (|SpecialFunctionCategory|)
                 (|PrimitiveFunctionCategory|)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|)
                 (|CombinatorialFunctionCategory|) (|unitsKnown|)
                 (|RadicalCategory|))
              (|makeByteWordVec2| 569
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
                                    143 1 139 2 0 144 1 41 42 0 145 2 0 0 98 98
                                    146 2 148 0 147 0 149 1 45 150 151 152 1 41
                                    153 151 154 1 0 153 151 155 2 156 0 147 0
                                    157 2 45 158 151 159 160 2 41 161 151 159
                                    162 2 0 161 151 159 163 2 42 9 15 0 164 2
                                    42 0 15 0 165 2 166 2 139 27 167 2 0 0 124
                                    27 168 0 169 2 170 0 0 0 171 1 169 2 2 172
                                    1 0 0 0 173 1 169 2 2 174 1 0 0 0 175 1 169
                                    2 2 176 1 0 0 0 177 1 169 2 2 178 1 0 0 0
                                    179 1 169 2 2 180 1 0 0 0 181 1 169 2 2 182
                                    1 0 0 0 183 1 169 2 2 184 1 0 0 0 185 1 169
                                    2 2 186 1 0 0 0 187 1 169 2 2 188 1 0 0 0
                                    189 1 169 2 2 190 1 0 0 0 191 1 169 2 2 192
                                    1 0 0 0 193 1 169 2 2 194 1 0 0 0 195 1 169
                                    2 2 196 1 0 0 0 197 1 169 2 2 198 1 0 0 0
                                    199 1 169 2 2 200 1 0 0 0 201 1 169 2 2 202
                                    1 0 0 0 203 1 169 2 2 204 1 0 0 0 205 1 169
                                    2 2 206 1 0 0 0 207 1 169 2 2 208 1 0 0 0
                                    209 1 169 2 2 210 1 0 0 0 211 1 169 2 2 212
                                    1 0 0 0 213 1 169 2 2 214 1 0 0 0 215 1 169
                                    2 2 216 1 0 0 0 217 1 169 2 2 218 1 0 0 0
                                    219 1 169 2 2 220 1 0 0 0 221 1 169 2 2 222
                                    1 0 0 0 223 1 224 2 2 225 1 0 0 0 226 1 224
                                    2 2 227 1 0 0 0 228 2 224 2 2 2 229 2 0 0 0
                                    0 230 2 224 2 2 2 231 2 0 0 0 0 232 1 224 2
                                    2 233 1 0 0 0 234 2 224 2 2 2 235 2 0 0 0 0
                                    236 2 224 2 2 2 237 2 0 0 0 0 238 2 224 2 2
                                    2 239 2 0 0 0 0 240 2 224 2 2 2 241 2 0 0 0
                                    0 242 2 224 2 2 2 243 2 0 0 0 0 244 1 224 2
                                    2 245 1 0 0 0 246 1 224 2 2 247 1 0 0 0 248
                                    1 224 2 2 249 1 0 0 0 250 1 224 2 2 251 1 0
                                    0 0 252 1 224 2 2 253 1 0 0 0 254 2 224 2 2
                                    2 255 2 0 0 0 0 256 3 224 2 2 2 2 257 3 0 0
                                    0 0 0 258 3 224 2 2 2 2 259 3 0 0 0 0 0 260
                                    3 224 2 2 2 2 261 3 0 0 0 0 0 262 3 224 2 2
                                    2 2 263 3 0 0 0 0 0 264 3 224 2 2 2 2 265 3
                                    0 0 0 0 0 266 3 224 2 2 2 2 267 3 0 0 0 0 0
                                    268 2 224 2 2 2 269 2 0 0 0 0 270 2 224 2 2
                                    2 271 2 0 0 0 0 272 2 224 2 2 2 273 2 0 0 0
                                    0 274 2 224 2 2 2 275 2 0 0 0 0 276 2 224 2
                                    2 2 277 2 0 0 0 0 278 2 224 2 2 2 279 2 0 0
                                    0 0 280 3 224 2 2 2 2 281 3 0 0 0 0 0 282 3
                                    224 2 2 2 2 283 3 0 0 0 0 0 284 3 224 2 2 2
                                    2 285 3 0 0 0 0 0 286 3 224 2 2 2 2 287 3 0
                                    0 0 0 0 288 3 224 2 2 2 2 289 3 0 0 0 0 0
                                    290 3 224 2 2 2 2 291 3 0 0 0 0 0 292 2 224
                                    2 2 2 293 2 0 0 0 0 294 2 224 2 2 2 295 2 0
                                    0 0 0 296 2 224 2 2 2 297 2 0 0 0 0 298 2
                                    224 2 2 2 299 2 0 0 0 0 300 1 224 2 2 301 1
                                    0 0 0 302 1 224 2 2 303 1 0 0 0 304 2 224 2
                                    2 2 305 2 0 0 0 0 306 2 224 2 2 2 307 2 0 0
                                    0 0 308 3 224 2 2 2 2 309 3 0 0 0 0 0 310 2
                                    224 2 2 2 311 2 0 0 0 0 312 2 224 2 2 2 313
                                    2 0 0 0 0 314 2 224 2 2 2 315 2 0 0 0 0 316
                                    2 224 2 2 2 317 2 0 0 0 0 318 2 224 2 2 2
                                    319 2 0 0 0 0 320 3 224 2 2 2 2 321 3 0 0 0
                                    0 0 322 1 224 2 2 323 1 0 0 0 324 3 224 2
                                    78 78 2 325 3 0 0 326 326 0 327 5 224 2 78
                                    78 78 78 2 328 5 0 0 326 326 326 326 0 329
                                    2 330 2 2 2 331 1 330 2 2 332 1 0 0 0 333 2
                                    330 2 2 2 334 2 0 0 0 0 335 2 330 2 2 2 336
                                    2 0 0 0 0 337 1 330 2 2 338 1 0 0 0 339 2
                                    330 2 2 27 340 2 0 0 0 27 341 2 330 2 2 27
                                    342 2 0 0 0 27 343 2 330 2 2 344 345 2 0 0
                                    0 346 347 2 330 2 2 27 348 2 0 0 0 27 349 2
                                    330 2 2 344 350 2 0 0 0 346 351 1 352 2 2
                                    353 1 0 0 0 354 1 352 2 2 355 1 0 0 0 356 1
                                    352 2 2 357 1 0 0 0 358 1 352 2 2 359 1 0 0
                                    0 360 1 352 2 2 361 1 0 0 0 362 1 352 2 2
                                    363 1 0 0 0 364 1 352 2 2 365 1 0 0 0 366 1
                                    352 2 2 367 1 0 0 0 368 1 352 2 2 369 1 0 0
                                    0 370 1 352 2 2 371 1 0 0 0 372 2 352 2 2
                                    27 373 2 0 0 0 27 374 2 352 2 2 344 375 2 0
                                    0 0 346 376 1 166 9 10 377 1 166 10 10 378
                                    1 169 9 10 379 1 169 10 10 380 1 330 9 10
                                    381 1 330 10 10 382 1 352 9 10 383 1 352 10
                                    10 384 1 224 9 10 385 1 224 10 10 386 1 387
                                    0 41 388 2 390 389 387 15 391 1 389 392 0
                                    393 2 41 35 0 15 394 1 139 35 0 395 2 139 0
                                    0 0 396 1 41 0 15 397 2 392 387 0 387 398 0
                                    139 0 399 2 139 9 0 0 400 1 139 2 0 401 1
                                    139 0 0 402 2 45 124 124 124 403 2 404 124
                                    124 124 405 2 0 124 124 124 406 1 408 407
                                    392 409 1 0 410 124 411 1 408 407 392 412 1
                                    0 410 124 413 0 414 0 415 2 41 0 6 414 416
                                    1 0 0 417 418 2 166 2 2 419 420 2 0 0 0 419
                                    421 1 166 139 15 422 1 166 2 2 423 1 0 0 0
                                    424 1 45 419 0 425 1 0 419 0 426 1 45 71 0
                                    427 1 417 428 0 429 1 417 428 0 430 2 433 2
                                    431 432 434 3 438 2 435 436 437 439 2 417 0
                                    0 0 440 1 0 441 0 442 1 0 0 6 443 1 417 0
                                    419 444 1 417 9 10 445 2 10 9 0 27 446 1 0
                                    447 0 448 2 41 9 0 0 449 0 450 0 451 0 126
                                    0 452 2 126 9 0 0 453 1 126 35 0 454 2 450
                                    0 417 35 455 2 450 0 0 0 456 2 417 0 124 27
                                    457 1 417 10 10 458 2 417 0 10 326 459 1 41
                                    460 0 461 1 41 6 0 462 0 417 0 463 1 126 9
                                    0 464 2 417 0 0 35 465 2 417 0 0 0 466 2
                                    417 0 0 0 467 1 45 468 0 469 1 0 468 0 470
                                    4 0 0 0 471 326 27 472 4 0 0 0 10 0 27 473
                                    1 0 38 0 474 1 38 0 326 475 1 38 0 0 476 1
                                    27 9 0 477 2 38 0 478 0 479 2 480 147 2 27
                                    481 3 0 0 0 471 483 484 0 27 0 485 1 0 0 27
                                    486 2 487 0 2 2 488 2 0 0 0 489 490 3 493
                                    491 2 492 491 494 3 0 495 0 492 495 496 3
                                    499 497 2 498 497 500 3 0 501 0 498 501 502
                                    1 45 153 151 503 2 45 161 151 159 504 3 505
                                    491 15 492 491 506 4 509 507 45 492 507 508
                                    510 3 511 497 15 498 497 512 4 515 513 45
                                    498 513 514 516 1 45 0 15 517 1 45 519 0
                                    520 1 6 9 0 521 1 16 15 6 522 1 0 6 0 523 1
                                    45 524 0 525 1 0 524 0 526 3 0 0 0 74 326
                                    527 2 0 0 482 12 528 4 530 2 42 78 15 529
                                    531 3 0 0 0 74 326 532 2 0 0 10 326 533 2
                                    45 0 57 15 534 1 0 535 0 536 1 519 518 0
                                    537 1 0 539 0 540 1 0 14 0 541 2 0 9 0 0
                                    122 2 1 326 0 27 1 1 1 326 0 1 1 1 326 124
                                    1 2 1 326 124 27 1 1 1 326 551 1 2 1 0 0 27
                                    1 1 1 0 0 1 1 1 0 124 1 2 1 0 124 27 1 1 1
                                    0 551 1 1 25 9 0 54 3 1 0 0 0 0 268 3 1 0 0
                                    0 0 266 3 1 0 0 0 0 264 3 1 0 0 0 0 262 3 1
                                    0 0 0 0 260 3 1 0 0 0 0 258 2 1 0 0 0 272 1
                                    0 38 0 474 2 1 549 0 12 1 1 1 552 0 1 1 1 0
                                    0 1 1 1 9 0 1 1 0 74 0 1 1 1 0 0 205 1 1 0
                                    0 181 2 1 0 0 346 347 2 1 0 0 27 343 2 19
                                    544 0 0 1 3 0 0 0 74 326 532 2 0 0 0 567 1
                                    2 0 0 0 489 490 2 1 0 0 0 276 2 1 0 0 0 274
                                    1 30 410 124 413 1 1 0 0 1 1 1 545 0 1 1 1
                                    0 0 1 2 0 9 0 0 95 2 1 9 0 0 1 1 1 0 0 201
                                    1 1 0 0 177 2 1 0 0 57 86 1 1 9 9 134 1 1 0
                                    0 209 1 1 0 0 185 0 29 0 1 2 1 326 0 27 1 1
                                    1 326 0 1 2 1 326 124 27 1 1 1 326 124 1 1
                                    1 326 551 1 2 1 0 0 27 1 1 1 0 0 1 2 1 0
                                    124 27 168 1 1 0 551 1 1 1 0 124 1 1 1 0 0
                                    324 1 15 441 0 442 1 16 71 0 72 1 1 550 0 1
                                    1 14 558 0 1 1 5 566 0 1 1 0 14 0 541 1 0
                                    447 0 448 1 0 18 0 19 1 15 417 0 1 1 16 419
                                    0 426 1 1 107 0 1 1 14 57 0 1 1 5 105 0 1 1
                                    0 6 0 523 1 0 27 0 1 1 0 12 0 13 2 1 0 0 0
                                    1 1 24 542 151 1 2 24 543 151 159 1 2 5 161
                                    151 159 163 1 5 153 151 155 1 1 0 0 111 1
                                    27 544 0 1 2 1 0 0 0 1 2 1 0 0 346 351 2 1
                                    0 0 27 349 1 1 553 326 1 1 1 9 0 1 2 1 0 0
                                    0 256 2 1 0 0 0 236 0 1 0 171 2 1 0 0 0 337
                                    3 12 501 0 498 501 502 3 13 495 0 492 495
                                    496 1 0 0 0 1 1 0 0 326 1 1 0 471 0 1 1 0
                                    10 10 37 1 27 9 0 52 1 31 9 0 1 1 5 0 0 88
                                    1 5 98 0 99 1 1 9 0 73 2 1 0 0 57 1 2 1 535
                                    326 0 1 1 32 124 12 138 5 33 0 326 326 326
                                    326 0 329 2 0 0 482 12 528 1 0 18 0 1 3 1 0
                                    0 0 0 284 3 1 0 0 0 0 282 1 1 0 0 175 1 1 0
                                    0 366 3 1 0 0 0 0 322 3 1 0 0 0 0 292 3 1 0
                                    0 0 0 290 1 1 0 326 1 2 1 0 0 0 1 1 0 569 0
                                    1 1 1 0 0 254 3 1 0 0 0 0 288 3 1 0 0 0 0
                                    286 1 0 74 0 75 2 0 0 10 0 1 2 0 0 10 326
                                    533 2 1 0 0 0 300 2 1 0 0 0 298 2 1 0 0 0
                                    296 2 1 0 0 0 294 2 1 0 0 0 318 2 1 0 0 0
                                    320 2 1 0 0 0 312 2 1 0 0 0 316 2 1 0 0 0
                                    314 1 27 535 0 1 1 5 563 0 1 1 25 535 0 536
                                    1 25 539 0 540 2 5 560 0 27 1 2 5 560 0 10
                                    1 1 27 560 0 1 2 0 9 0 27 76 2 0 9 0 10 1 1
                                    23 0 0 1 2 1 0 0 27 374 2 1 0 0 346 376 3
                                    33 0 326 326 0 327 1 0 35 0 1 1 0 568 0 1 2
                                    1 0 0 0 280 2 1 0 0 0 278 1 0 9 0 70 1 0 6
                                    0 1 0 1 9 133 2 1 124 124 124 406 1 1 0 326
                                    1 2 1 0 0 0 1 1 1 0 0 370 1 1 0 0 372 2 0 9
                                    0 27 1 2 0 9 0 0 1 1 1 0 0 339 2 1 0 0 27
                                    341 1 1 0 0 333 1 30 410 124 411 1 1 545 0
                                    1 3 1 556 0 0 0 1 2 1 557 0 0 1 2 1 544 0 0
                                    1 2 1 535 326 0 1 1 1 0 0 173 1 31 9 0 1 2
                                    9 0 0 27 1 2 9 0 0 38 1 4 9 0 0 10 0 27 473
                                    1 9 0 0 1 4 9 0 0 471 326 27 472 4 5 0 0 38
                                    561 483 1 4 5 0 0 38 561 565 1 4 5 0 0 27
                                    35 482 1 4 5 0 0 27 35 564 1 3 0 0 0 10 482
                                    1 3 0 0 0 471 565 1 3 0 0 0 10 564 1 3 0 0
                                    0 471 483 484 3 0 0 0 27 564 1 3 0 0 0 27
                                    482 1 3 0 0 0 38 483 1 3 0 0 0 38 565 1 3 0
                                    0 0 0 0 1 3 0 0 0 326 326 1 2 0 0 0 567 1 3
                                    0 0 0 74 326 527 2 0 0 0 489 1 3 0 0 0 12 0
                                    1 1 1 35 0 1 1 1 0 0 354 10 0 0 10 0 0 0 0
                                    0 0 0 0 0 1 2 0 0 10 326 1 9 0 0 10 0 0 0 0
                                    0 0 0 0 1 7 0 0 10 0 0 0 0 0 0 1 8 0 0 10 0
                                    0 0 0 0 0 0 1 5 0 0 10 0 0 0 0 1 6 0 0 10 0
                                    0 0 0 0 1 4 0 0 10 0 0 0 1 2 0 0 10 0 1 3 0
                                    0 10 0 0 1 3 1 0 0 0 0 310 1 1 0 0 302 2 1
                                    0 0 0 308 2 1 0 0 0 306 1 1 0 0 304 2 1 554
                                    0 0 1 2 0 0 0 0 1 1 0 0 0 1 1 1 0 0 368 1 1
                                    0 0 234 3 5 0 0 27 35 1 3 5 0 0 38 561 1 2
                                    5 0 0 38 1 2 5 0 0 27 1 1 1 0 0 89 1 1 98 0
                                    101 1 32 0 0 424 1 1 0 0 211 1 1 0 0 187 1
                                    1 0 0 207 1 1 0 0 183 1 1 0 0 203 1 1 0 0
                                    179 1 9 468 0 470 1 10 498 0 1 1 11 492 0 1
                                    1 1 0 545 1 2 8 0 0 0 1 2 8 0 0 0 1 1 15 0
                                    417 418 1 22 0 419 1 1 21 0 57 61 1 1 0 546
                                    1 1 1 0 547 1 1 1 0 548 1 1 1 0 107 110 1 1
                                    0 0 1 1 5 0 98 104 1 5 0 105 106 1 0 0 6
                                    443 1 0 0 27 486 1 0 0 12 142 1 0 524 0 526
                                    1 3 544 0 1 0 5 35 1 1 0 0 0 1 1 0 0 326 1
                                    2 1 0 0 0 335 2 1 0 0 0 240 2 1 0 0 0 244 2
                                    1 0 0 0 238 2 1 0 0 0 242 1 0 9 10 11 1 1 0
                                    0 217 1 1 0 0 193 2 1 9 0 0 1 1 1 0 0 213 1
                                    1 0 0 189 1 1 0 0 221 1 1 0 0 197 5 0 0 27
                                    0 0 0 0 1 2 0 0 27 326 1 4 0 0 27 0 0 0 1 2
                                    0 0 27 0 1 3 0 0 27 0 0 1 2 1 0 0 0 270 1 1
                                    0 0 252 1 1 0 0 250 1 1 0 0 248 1 1 0 0 246
                                    1 1 0 0 223 1 1 0 0 199 1 1 0 0 219 1 1 0 0
                                    195 1 1 0 0 215 1 1 0 0 191 1 1 0 0 226 2
                                    23 0 0 57 91 2 1 0 0 0 83 2 1 0 0 419 421 2
                                    27 0 0 35 90 2 27 0 0 92 93 0 25 0 47 1 1 0
                                    0 358 1 1 0 0 362 0 27 0 49 1 1 0 0 228 2 1
                                    0 0 0 230 1 1 0 0 356 3 5 0 0 38 561 1 3 5
                                    0 0 27 35 1 2 5 0 0 27 1 2 5 0 0 38 1 1 1 0
                                    0 360 1 1 0 0 364 2 1 0 0 0 232 2 0 9 0 0
                                    96 2 23 0 0 0 69 2 1 0 98 98 146 1 19 0 0
                                    56 2 19 0 0 0 67 2 25 0 0 0 65 2 19 0 57 0
                                    59 2 25 0 35 0 1 2 25 0 92 0 1 2 2 0 6 0 1
                                    2 2 0 0 6 1 2 1 0 419 0 1 2 1 0 0 419 1 2
                                    27 0 0 0 63)))))
           '|lookupComplete|)) 
