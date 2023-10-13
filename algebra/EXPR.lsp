
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

(DEFUN |EXPR;jacobiTheta;3$;118| (|q| |z| $) (SPADCALL |q| |z| (QREFELT $ 317))) 

(DEFUN |EXPR;lerchPhi;4$;119| (|z| |s| |a| $)
  (SPADCALL |z| |s| |a| (QREFELT $ 319))) 

(DEFUN |EXPR;riemannZeta;2$;120| (|z| $) (SPADCALL |z| (QREFELT $ 321))) 

(DEFUN |EXPR;hypergeometricF;2L2$;121| (|la| |lb| |x| $)
  (SPADCALL |la| |lb| |x| (QREFELT $ 323))) 

(DEFUN |EXPR;meijerG;4L2$;122| (|la| |lb| |lc| |ld| |x| $)
  (SPADCALL |la| |lb| |lc| |ld| |x| (QREFELT $ 326))) 

(DEFUN |EXPR;^;3$;123| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 329))) 

(DEFUN |EXPR;factorial;2$;124| (|x| $) (SPADCALL |x| (QREFELT $ 330))) 

(DEFUN |EXPR;binomial;3$;125| (|n| |m| $) (SPADCALL |n| |m| (QREFELT $ 332))) 

(DEFUN |EXPR;permutation;3$;126| (|n| |m| $) (SPADCALL |n| |m| (QREFELT $ 334))) 

(DEFUN |EXPR;factorials;2$;127| (|x| $) (SPADCALL |x| (QREFELT $ 336))) 

(DEFUN |EXPR;factorials;$S$;128| (|x| |n| $) (SPADCALL |x| |n| (QREFELT $ 338))) 

(DEFUN |EXPR;summation;$S$;129| (|x| |n| $) (SPADCALL |x| |n| (QREFELT $ 340))) 

(DEFUN |EXPR;summation;$Sb$;130| (|x| |s| $) (SPADCALL |x| |s| (QREFELT $ 343))) 

(DEFUN |EXPR;product;$S$;131| (|x| |n| $) (SPADCALL |x| |n| (QREFELT $ 346))) 

(DEFUN |EXPR;product;$Sb$;132| (|x| |s| $) (SPADCALL |x| |s| (QREFELT $ 348))) 

(DEFUN |EXPR;erf;2$;133| (|x| $) (SPADCALL |x| (QREFELT $ 351))) 

(DEFUN |EXPR;Ei;2$;134| (|x| $) (SPADCALL |x| (QREFELT $ 353))) 

(DEFUN |EXPR;Si;2$;135| (|x| $) (SPADCALL |x| (QREFELT $ 355))) 

(DEFUN |EXPR;Ci;2$;136| (|x| $) (SPADCALL |x| (QREFELT $ 357))) 

(DEFUN |EXPR;li;2$;137| (|x| $) (SPADCALL |x| (QREFELT $ 359))) 

(DEFUN |EXPR;dilog;2$;138| (|x| $) (SPADCALL |x| (QREFELT $ 361))) 

(DEFUN |EXPR;fresnelS;2$;139| (|x| $) (SPADCALL |x| (QREFELT $ 363))) 

(DEFUN |EXPR;fresnelC;2$;140| (|x| $) (SPADCALL |x| (QREFELT $ 365))) 

(DEFUN |EXPR;integral;$S$;141| (|x| |n| $) (SPADCALL |x| |n| (QREFELT $ 367))) 

(DEFUN |EXPR;integral;$Sb$;142| (|x| |s| $) (SPADCALL |x| |s| (QREFELT $ 369))) 

(DEFUN |EXPR;operator;2Bo;143| (|op| $)
  (PROG (|n|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |op| (QREFELT $ 371)) (SPADCALL |op| (QREFELT $ 372)))
            ((SPADCALL |op| (QREFELT $ 373)) (SPADCALL |op| (QREFELT $ 374)))
            ((SPADCALL |op| (QREFELT $ 375)) (SPADCALL |op| (QREFELT $ 376)))
            ((SPADCALL |op| (QREFELT $ 377)) (SPADCALL |op| (QREFELT $ 378)))
            ((SPADCALL |op| (QREFELT $ 379)) (SPADCALL |op| (QREFELT $ 380)))
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
              (LETT |n| (SPADCALL |op| (QREFELT $ 33)) |EXPR;operator;2Bo;143|)
              (EXIT
               (COND
                ((QEQCAR |n| 1)
                 (SPADCALL (SPADCALL |op| (QREFELT $ 29)) (QREFELT $ 34)))
                (#1#
                 (SPADCALL (SPADCALL |op| (QREFELT $ 29)) (QCDR |n|)
                           (QREFELT $ 36)))))))))))) 

(DEFUN |EXPR;reduc| (|x| |l| $)
  (PROG (|p| #1=#:G396 |k|)
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
  (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 382)) |k| (QREFELT $ 385))
            (QREFELT $ 387))) 

(DEFUN |EXPR;evl| (|p| |k| |m| $)
  (COND
   ((< (SPADCALL |p| |k| (QREFELT $ 388)) (SPADCALL |m| (QREFELT $ 389)))
    (SPADCALL |p| (QREFELT $ 382)))
   ('T
    (SPADCALL (SPADCALL (|EXPR;evl0| |p| |k| $) |m| (QREFELT $ 390))
              (SPADCALL (SPADCALL |k| (QREFELT $ 391)) (QREFELT $ 382))
              (QREFELT $ 392))))) 

(DEFUN |EXPR;noalg?| (|p| $)
  (PROG (#1=#:G404)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ G190
             (COND
              ((NULL (SPADCALL |p| (|spadConstant| $ 393) (QREFELT $ 394)))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((NULL
                  (NULL
                   (|EXPR;algkernels|
                    (SPADCALL (SPADCALL |p| (QREFELT $ 395)) (QREFELT $ 75))
                    $)))
                 (PROGN (LETT #1# 'NIL . #2=(|EXPR;noalg?|)) (GO #1#)))
                ('T (LETT |p| (SPADCALL |p| (QREFELT $ 396)) . #2#)))))
             NIL (GO G190) G191 (EXIT NIL))
        (EXIT 'T)))
      #1# (EXIT #1#))))) 

(DEFUN |EXPR;gcdPolynomial;3Sup;148| (|p| |q| $)
  (SEQ
   (COND
    ((|EXPR;noalg?| |p| $)
     (COND ((|EXPR;noalg?| |q| $) (EXIT (SPADCALL |p| |q| (QREFELT $ 397)))))))
   (EXIT (SPADCALL |p| |q| (QREFELT $ 399))))) 

(DEFUN |EXPR;factorPolynomial;SupF;149| (|x| $)
  (PROG (|uf|)
    (RETURN
     (SEQ
      (LETT |uf| (SPADCALL |x| (QREFELT $ 403))
            |EXPR;factorPolynomial;SupF;149|)
      (EXIT |uf|))))) 

(DEFUN |EXPR;squareFreePolynomial;SupF;150| (|x| $)
  (PROG (|uf|)
    (RETURN
     (SEQ
      (LETT |uf| (SPADCALL |x| (QREFELT $ 406))
            |EXPR;squareFreePolynomial;SupF;150|)
      (EXIT |uf|))))) 

(DEFUN |EXPR;coerce;An$;151| (|x| $)
  (SPADCALL (SPADCALL |x| (|spadConstant| $ 409) (QREFELT $ 410))
            (QREFELT $ 104))) 

(DEFUN |EXPR;^;$F$;152| (|x| |r| $) (SPADCALL |x| |r| (QREFELT $ 414))) 

(DEFUN |EXPR;minPoly;KSup;153| (|k| $) (SPADCALL |k| (QREFELT $ 416))) 

(DEFUN |EXPR;definingPolynomial;2$;154| (|x| $) (SPADCALL |x| (QREFELT $ 417))) 

(DEFUN |EXPR;retract;$F;155| (|x| $) (SPADCALL |x| (QREFELT $ 419))) 

(DEFUN |EXPR;retractIfCan;$U;156| (|x| $) (SPADCALL |x| (QREFELT $ 421))) 

(DEFUN |EXPR;coerce;An$;157| (|x| $)
  (SPADCALL (|EXPR;smp2expr| (SPADCALL |x| (QREFELT $ 423)) $)
            (|EXPR;smp2expr| (SPADCALL |x| (QREFELT $ 424)) $) (QREFELT $ 69))) 

(DEFUN |EXPR;k2expr| (|k| $) (SPADCALL (ELT $ 412) |k| (QREFELT $ 428))) 

(DEFUN |EXPR;smp2expr| (|p| $)
  (SPADCALL (CONS (|function| |EXPR;k2expr|) $) (ELT $ 61) |p| (QREFELT $ 433))) 

(DEFUN |EXPR;retractIfCan;$U;160| (|x| $)
  (PROG (#1=#:G431 |d| |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |n| (|EXPR;smp2an| (SPADCALL |x| (QREFELT $ 99)) $)
               . #2=(|EXPR;retractIfCan;$U;160|))
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
                             (SPADCALL (QCDR |n|) (QCDR |d|) (QREFELT $ 434)))
                       . #2#)
                 (GO #1#))))))))))
        (EXIT (CONS 1 "failed"))))
      #1# (EXIT #1#))))) 

(DEFUN |EXPR;R2AN| (|r| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (LETT |u| (SPADCALL (SPADCALL |r| (QREFELT $ 437)) (QREFELT $ 72))
            |EXPR;R2AN|)
      (EXIT
       (COND ((QEQCAR |u| 0) (CONS 0 (SPADCALL (QCDR |u|) (QREFELT $ 438))))
             ('T (CONS 1 "failed")))))))) 

(DEFUN |EXPR;k2an| (|k| $)
  (PROG (|arg| #1=#:G466 |a| #2=#:G467 |x| |eq| |eqa| |ccu| |cc| |a1| |s1|
         |s1u| |k1| |k1u| |a2| |args| |op|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((NULL
          (SPADCALL
           (LETT |op| (SPADCALL |k| (QREFELT $ 31)) . #3=(|EXPR;k2an|))
           (QREFELT $ 439)))
         (CONS 1 "failed"))
        ('T
         (COND
          ((SPADCALL |op| '|rootOf| (QREFELT $ 440))
           (SEQ (LETT |args| (SPADCALL |k| (QREFELT $ 79)) . #3#)
                (LETT |a2| (SPADCALL |args| 2 (QREFELT $ 81)) . #3#)
                (LETT |k1u| (SPADCALL |a2| (QREFELT $ 19)) . #3#)
                (EXIT
                 (COND ((QEQCAR |k1u| 1) (CONS 1 "failed"))
                       (#4='T
                        (SEQ (LETT |k1| (QCDR |k1u|) . #3#)
                             (LETT |s1u| (SPADCALL |a2| (QREFELT $ 442)) . #3#)
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
                                              (QREFELT $ 443))
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
                                                    (|spadConstant| $ 445)
                                                    . #3#)
                                              (SEQ G190
                                                   (COND
                                                    ((NULL
                                                      (SPADCALL |eq|
                                                                (|spadConstant|
                                                                 $ 446)
                                                                (QREFELT $
                                                                         447)))
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
                                                                             436))
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
                                                                           448))
                                                                         (QREFELT
                                                                          $
                                                                          449))
                                                                        (QREFELT
                                                                         $
                                                                         450))
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
                                                                        451))))))))))))))))))
          (#4#
           (SEQ (LETT |arg| NIL . #3#)
                (SEQ (LETT |x| NIL . #3#)
                     (LETT #2# (SPADCALL |k| (QREFELT $ 79)) . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ (LETT |a| (SPADCALL |x| (QREFELT $ 436)) . #3#)
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
                       (SPADCALL (SPADCALL |op| (QREFELT $ 452))
                                 (NREVERSE |arg|) (QREFELT $ 453))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |EXPR;smp2an| (|p| $)
  (PROG (|c| |up| |ans| #1=#:G481 |t| |k| |x1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |x1| (SPADCALL |p| (QREFELT $ 455)) . #2=(|EXPR;smp2an|))
            (EXIT
             (COND
              ((QEQCAR |x1| 1) (|EXPR;R2AN| (SPADCALL |p| (QREFELT $ 456)) $))
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
                        (SEQ (LETT |ans| (|spadConstant| $ 457) . #2#)
                             (SEQ G190
                                  (COND
                                   ((NULL
                                     (COND
                                      ((SPADCALL |up| (QREFELT $ 458)) 'NIL)
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
                                                                            448))
                                                                  (QREFELT $
                                                                           459))
                                                                 (QREFELT $
                                                                          460))
                                                       (QREFELT $ 461))
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
                                                              461))))))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |EXPR;convert;$If;164| (|x| $) (SPADCALL |x| (QREFELT $ 463))) 

(DEFUN |EXPR;eval;$Bo$S$;165| (|f| |op| |g| |x| $)
  (SPADCALL |f| (LIST |op|) (LIST |g|) |x| (QREFELT $ 466))) 

(DEFUN |EXPR;eval;$LLS$;166| (|f| |ls| |lg| |x| $)
  (PROG (|res| #1=#:G512 |g| #2=#:G511 |nlg| #3=#:G510 #4=#:G509
         |lbackwardSubs| #5=#:G507 |i| #6=#:G508 |j| #7=#:G506 |lforwardSubs|
         #8=#:G504 #9=#:G505 #10=#:G503 |ns| #11=#:G502 #12=#:G501 #13=#:G500
         #14=#:G499 |lsd| |lsym| |llsym| #15=#:G498 #16=#:G497)
    (RETURN
     (SEQ
      (LETT |llsym|
            (PROGN
             (LETT #16# NIL . #17=(|EXPR;eval;$LLS$;166|))
             (SEQ (LETT |g| NIL . #17#) (LETT #15# |lg| . #17#) G190
                  (COND
                   ((OR (ATOM #15#) (PROGN (LETT |g| (CAR #15#) . #17#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #16# (CONS (SPADCALL |g| (QREFELT $ 468)) #16#)
                          . #17#)))
                  (LETT #15# (CDR #15#) . #17#) (GO G190) G191
                  (EXIT (NREVERSE #16#))))
            . #17#)
      (LETT |lsym|
            (SPADCALL (SPADCALL |llsym| (QREFELT $ 469)) (QREFELT $ 470))
            . #17#)
      (LETT |lsd| (SPADCALL (ELT $ 471) |lsym| (QREFELT $ 473)) . #17#)
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
                                 (CONS (SPADCALL |g| |x| (QREFELT $ 475)) #14#)
                                 . #17#)))
                         (LETT #13# (CDR #13#) . #17#) (GO G190) G191
                         (EXIT (NREVERSE #14#))))
                   (QREFELT $ 478)))
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
                        (LETT #12# (CONS (SPADCALL (QREFELT $ 479)) #12#)
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
                               (SPADCALL (SPADCALL |i| (QREFELT $ 480))
                                         (SPADCALL |j| (QREFELT $ 480))
                                         (QREFELT $ 482))
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
                               (SPADCALL (SPADCALL |j| (QREFELT $ 480))
                                         (SPADCALL |i| (QREFELT $ 480))
                                         (QREFELT $ 482))
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
                               (SPADCALL |g| |lforwardSubs| (QREFELT $ 484))
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
                                         (SPADCALL |g| |x| (QREFELT $ 475))
                                         #2#)
                                        . #17#)))
                                (LETT #1# (CDR #1#) . #17#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 478))
                . #17#)
          (EXIT (SPADCALL |res| |lbackwardSubs| (QREFELT $ 484))))))))))) 

(DEFUN |EXPR;patternMatch;$P2Pmr;167| (|x| |p| |l| $)
  (SPADCALL |x| |p| |l| (QREFELT $ 488))) 

(DEFUN |EXPR;patternMatch;$P2Pmr;168| (|x| |p| |l| $)
  (SPADCALL |x| |p| |l| (QREFELT $ 494))) 

(DEFUN |EXPR;Zero;$;169| ($) (|spadConstant| $ 46)) 

(DEFUN |EXPR;One;$;170| ($) (|spadConstant| $ 48)) 

(DEFUN |EXPR;-;2$;171| (|x| $) (SPADCALL |x| (QREFELT $ 55))) 

(DEFUN |EXPR;*;I2$;172| (|n| |x| $) (SPADCALL |n| |x| (QREFELT $ 58))) 

(DEFUN |EXPR;*;3$;173| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 62))) 

(DEFUN |EXPR;+;3$;174| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 64))) 

(DEFUN |EXPR;=;2$B;175| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 51))) 

(DEFUN |EXPR;smaller?;2$B;176| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 94))) 

(PUT '|EXPR;numer;$Smp;177| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |EXPR;numer;$Smp;177| (|x| $) |x|) 

(PUT '|EXPR;coerce;Smp$;178| '|SPADreplace| '(XLAM (|p|) |p|)) 

(DEFUN |EXPR;coerce;Smp$;178| (|p| $) |p|) 

(DEFUN |EXPR;coerce;P$;179| (|p| $) (|EXPR;poly_to_MP| |p| $)) 

(DEFUN |EXPR;reducedSystem;MM;180| (|m| $) (SPADCALL |m| (QREFELT $ 497))) 

(DEFUN |EXPR;reducedSystem;MVR;181| (|m| |v| $)
  (SPADCALL |m| |v| (QREFELT $ 498))) 

(DEFUN |EXPR;convert;$If;182| (|x| $) (SPADCALL |x| (QREFELT $ 463))) 

(DEFUN |EXPR;kintmatch| (|k| |p| |l| $) (SPADCALL |k| |p| |l| (QREFELT $ 500))) 

(DEFUN |EXPR;patternMatch;$P2Pmr;184| (|x| |p| |l| $)
  (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kintmatch|) $) (QREFELT $ 504))) 

(DEFUN |EXPR;kfltmatch| (|k| |p| |l| $) (SPADCALL |k| |p| |l| (QREFELT $ 506))) 

(DEFUN |EXPR;patternMatch;$P2Pmr;186| (|x| |p| |l| $)
  (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kfltmatch|) $) (QREFELT $ 510))) 

(DEFUN |EXPR;Zero;$;187| ($) (|spadConstant| $ 46)) 

(DEFUN |EXPR;+;3$;188| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 64))) 

(DEFUN |EXPR;=;2$B;189| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 51))) 

(DEFUN |EXPR;smaller?;2$B;190| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 94))) 

(DEFUN |EXPR;coerce;K$;191| (|k| $) (SPADCALL |k| (QREFELT $ 511))) 

(DEFUN |EXPR;kernels;$L;192| (|x| $)
  (PROG (#1=#:G549 |f| #2=#:G548)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|EXPR;kernels;$L;192|))
       (SEQ (LETT |f| NIL . #3#)
            (LETT #1# (SPADCALL |x| (QREFELT $ 514)) . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ (EXIT (LETT #2# (CONS (QCAR |f|) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |EXPR;coerce;R$;193| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 515)) (|spadConstant| $ 47))
        ('T (SPADCALL (SPADCALL |x| (QREFELT $ 516)) (QREFELT $ 142))))) 

(DEFUN |EXPR;retract;$R;194| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 54)) (|spadConstant| $ 87))
        ('T (|EXPR;retNotUnit| |x| $)))) 

(DEFUN |EXPR;coerce;$Of;195| (|x| $) (SPADCALL |x| (QREFELT $ 519))) 

(DEFUN |EXPR;kereval| (|k| |lk| |lv| $)
  (PROG ()
    (RETURN
     (SPADCALL |lk| |lv| |k| (CONS #'|EXPR;kereval!1| (VECTOR |lk| |lv| $))
               (QREFELT $ 525))))) 

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
                   (QREFELT $ 522)))))))) 

(DEFUN |EXPR;kereval!0| (|x1| $$)
  (PROG (|lk| |lv| $)
    (LETT |lk| (QREFELT $$ 2) NIL)
    (LETT |lv| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x1| |lk| |lv| (QREFELT $ 521)))))) 

(DEFUN |EXPR;subeval| (|k| |lk| |lv| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL |lk| |lv| |k| (CONS #'|EXPR;subeval!0| (VECTOR |lv| |lk| $))
                (QREFELT $ 525)))))) 

(DEFUN |EXPR;subeval!0| (|x| $$)
  (PROG ($ |lk| |lv|)
    (LETT $ (QREFELT $$ 2) . #1=(|EXPR;subeval|))
    (LETT |lk| (QREFELT $$ 1) . #1#)
    (LETT |lv| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G573 |a| #3=#:G572)
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
                                   (SPADCALL |a| |lk| |lv| (QREFELT $ 526))
                                   #3#)
                                  NIL)))
                          (LETT #2# (CDR #2#) NIL) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    (QREFELT $ 527))))))))) 

(DEFUN |EXPR;isPlus;$U;198| (|x| $)
  (PROG (#1=#:G588 |t| #2=#:G587 |l|)
    (RETURN
     (SEQ
      (COND
       ((OR
         (NULL
          (LETT |l| (SPADCALL |x| (QREFELT $ 514))
                . #3=(|EXPR;isPlus;$U;198|)))
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
                             (SPADCALL (QCDR |t|) (QCAR |t|) (QREFELT $ 528))
                             #2#)
                            . #3#)))
                    (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#))))))))))) 

(DEFUN |EXPR;isMult;$U;199| (|x| $)
  (PROG (|t| |l|)
    (RETURN
     (SEQ
      (COND
       ((OR
         (NULL
          (LETT |l| (SPADCALL |x| (QREFELT $ 514))
                . #1=(|EXPR;isMult;$U;199|)))
         (NULL (NULL (CDR |l|))))
        (CONS 1 "failed"))
       ('T
        (SEQ (LETT |t| (SPADCALL |l| (QREFELT $ 531)) . #1#)
             (EXIT (CONS 0 (CONS (QCDR |t|) (QCAR |t|))))))))))) 

(DEFUN |EXPR;eval;$LL$;200| (|x| |lk| |lv| $)
  (PROG (#1=#:G604 #2=#:G603 #3=#:G605 #4=#:G607 |t|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|EXPR;eval;$LL$;200|))
       (SEQ (LETT |t| NIL . #5#)
            (LETT #4# (SPADCALL |x| (QREFELT $ 514)) . #5#) G190
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

(DEFUN |EXPR;subst;$LL$;201| (|x| |lk| |lv| $)
  (PROG (#1=#:G610 #2=#:G609 #3=#:G611 #4=#:G613 |t|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|EXPR;subst;$LL$;201|))
       (SEQ (LETT |t| NIL . #5#)
            (LETT #4# (SPADCALL |x| (QREFELT $ 514)) . #5#) G190
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

(DEFUN |EXPR;retractIfCan;$U;202| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 54)) (CONS 0 (|spadConstant| $ 87)))
        ('T (|EXPR;retNotUnitIfCan| |x| $)))) 

(DEFUN |EXPR;-;2$;203| (|x| $) (SPADCALL |x| (QREFELT $ 55))) 

(DEFUN |EXPR;smaller?;2$B;204| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 94))) 

(DEFUN |EXPR;=;2$B;205| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 51))) 

(PUT '|EXPR;coerce;K$;206| '|SPADreplace| '(XLAM (|k|) |k|)) 

(DEFUN |EXPR;coerce;K$;206| (|k| $) |k|) 

(PUT '|EXPR;kernels;$L;207| '|SPADreplace| 'LIST) 

(DEFUN |EXPR;kernels;$L;207| (|x| $) (LIST |x|)) 

(DEFUN |EXPR;coerce;R$;208| (|x| $) (SPADCALL |x| (QREFELT $ 516))) 

(DEFUN |EXPR;retract;$R;209| (|x| $) (|EXPR;retNotUnit| |x| $)) 

(DEFUN |EXPR;retractIfCan;$U;210| (|x| $) (|EXPR;retNotUnitIfCan| |x| $)) 

(DEFUN |EXPR;coerce;$Of;211| (|x| $) (SPADCALL |x| (QREFELT $ 519))) 

(DEFUN |EXPR;eval;$LL$;212| (|x| |lk| |lv| $)
  (PROG ()
    (RETURN
     (SPADCALL |lk| |lv| |x|
               (CONS #'|EXPR;eval;$LL$;212!1| (VECTOR |lk| |lv| $))
               (QREFELT $ 525))))) 

(DEFUN |EXPR;eval;$LL$;212!1| (|x1| $$)
  (PROG ($ |lv| |lk|)
    (LETT $ (QREFELT $$ 2) . #1=(|EXPR;eval;$LL$;212|))
    (LETT |lv| (QREFELT $$ 1) . #1#)
    (LETT |lk| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (SPADCALL (CONS #'|EXPR;eval;$LL$;212!0| (VECTOR $ |lv| |lk|)) |x1|
                   (QREFELT $ 522)))))))) 

(DEFUN |EXPR;eval;$LL$;212!0| (|x2| $$)
  (PROG (|lk| |lv| $)
    (LETT |lk| (QREFELT $$ 2) NIL)
    (LETT |lv| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x2| |lk| |lv| (QREFELT $ 521)))))) 

(DEFUN |EXPR;subst;$LL$;213| (|x| |lk| |lv| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL |lk| |lv| |x|
                (CONS #'|EXPR;subst;$LL$;213!0| (VECTOR |lv| |lk| $))
                (QREFELT $ 525)))))) 

(DEFUN |EXPR;subst;$LL$;213!0| (|x1| $$)
  (PROG ($ |lk| |lv|)
    (LETT $ (QREFELT $$ 2) . #1=(|EXPR;subst;$LL$;213|))
    (LETT |lk| (QREFELT $$ 1) . #1#)
    (LETT |lv| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G649 |a| #3=#:G648)
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
                                   (SPADCALL |a| |lk| |lv| (QREFELT $ 526))
                                   #3#)
                                  NIL)))
                          (LETT #2# (CDR #2#) NIL) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    (QREFELT $ 527))))))))) 

(DEFUN |EXPR;convert;$If;214| (|x| $) (SPADCALL |x| (QREFELT $ 463))) 

(DEFUN |Expression| (#1=#:G688)
  (PROG ()
    (RETURN
     (PROG (#2=#:G689)
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
  (PROG (|pv$| #1=#:G683 #2=#:G684 #3=#:G685 #4=#:G686 #5=#:G687 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #6=(|Expression|))
      (LETT |dv$| (LIST '|Expression| DV$1) . #6#)
      (LETT $ (GETREFV 564) . #6#)
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
                      (CONS (|dispatchFunction| |EXPR;jacobiTheta;3$;118|) $))
            (QSETREFV $ 320
                      (CONS (|dispatchFunction| |EXPR;lerchPhi;4$;119|) $))
            (QSETREFV $ 322
                      (CONS (|dispatchFunction| |EXPR;riemannZeta;2$;120|) $))
            (COND
             ((|testBitVector| |pv$| 31)
              (PROGN
               (QSETREFV $ 325
                         (CONS
                          (|dispatchFunction| |EXPR;hypergeometricF;2L2$;121|)
                          (|getDomainView| $ '(|RetractableTo| (|Integer|)))))
               (QSETREFV $ 327
                         (CONS (|dispatchFunction| |EXPR;meijerG;4L2$;122|)
                               (|getDomainView| $
                                                '(|RetractableTo|
                                                  (|Integer|))))))))
            (QSETREFV $ 83 (CONS (|dispatchFunction| |EXPR;^;3$;123|) $))
            (QSETREFV $ 331
                      (CONS (|dispatchFunction| |EXPR;factorial;2$;124|) $))
            (QSETREFV $ 333
                      (CONS (|dispatchFunction| |EXPR;binomial;3$;125|) $))
            (QSETREFV $ 335
                      (CONS (|dispatchFunction| |EXPR;permutation;3$;126|) $))
            (QSETREFV $ 337
                      (CONS (|dispatchFunction| |EXPR;factorials;2$;127|) $))
            (QSETREFV $ 339
                      (CONS (|dispatchFunction| |EXPR;factorials;$S$;128|) $))
            (QSETREFV $ 341
                      (CONS (|dispatchFunction| |EXPR;summation;$S$;129|) $))
            (QSETREFV $ 345
                      (CONS (|dispatchFunction| |EXPR;summation;$Sb$;130|) $))
            (QSETREFV $ 347
                      (CONS (|dispatchFunction| |EXPR;product;$S$;131|) $))
            (QSETREFV $ 349
                      (CONS (|dispatchFunction| |EXPR;product;$Sb$;132|) $))
            (QSETREFV $ 352 (CONS (|dispatchFunction| |EXPR;erf;2$;133|) $))
            (QSETREFV $ 354 (CONS (|dispatchFunction| |EXPR;Ei;2$;134|) $))
            (QSETREFV $ 356 (CONS (|dispatchFunction| |EXPR;Si;2$;135|) $))
            (QSETREFV $ 358 (CONS (|dispatchFunction| |EXPR;Ci;2$;136|) $))
            (QSETREFV $ 360 (CONS (|dispatchFunction| |EXPR;li;2$;137|) $))
            (QSETREFV $ 362 (CONS (|dispatchFunction| |EXPR;dilog;2$;138|) $))
            (QSETREFV $ 364
                      (CONS (|dispatchFunction| |EXPR;fresnelS;2$;139|) $))
            (QSETREFV $ 366
                      (CONS (|dispatchFunction| |EXPR;fresnelC;2$;140|) $))
            (QSETREFV $ 368
                      (CONS (|dispatchFunction| |EXPR;integral;$S$;141|) $))
            (QSETREFV $ 370
                      (CONS (|dispatchFunction| |EXPR;integral;$Sb$;142|) $))
            (QSETREFV $ 37
                      (CONS (|dispatchFunction| |EXPR;operator;2Bo;143|) $))
            (COND
             ((|HasCategory| |#1| '(|GcdDomain|))
              (PROGN
               (QSETREFV $ 400
                         (CONS
                          (|dispatchFunction| |EXPR;gcdPolynomial;3Sup;148|)
                          $))
               (QSETREFV $ 405
                         (CONS
                          (|dispatchFunction| |EXPR;factorPolynomial;SupF;149|)
                          $))
               (QSETREFV $ 407
                         (CONS
                          (|dispatchFunction|
                           |EXPR;squareFreePolynomial;SupF;150|)
                          $)))))
            (COND
             ((|domainEqual| |#1| (|AlgebraicNumber|))
              (QSETREFV $ 412
                        (CONS (|dispatchFunction| |EXPR;coerce;An$;151|) $))))
            (COND
             ((|testBitVector| |pv$| 14)
              (PROGN
               (QSETREFV $ 415 (CONS (|dispatchFunction| |EXPR;^;$F$;152|) $))
               (QSETREFV $ 138
                         (CONS (|dispatchFunction| |EXPR;minPoly;KSup;153|) $))
               (QSETREFV $ 418
                         (CONS
                          (|dispatchFunction| |EXPR;definingPolynomial;2$;154|)
                          $))
               (QSETREFV $ 420
                         (CONS (|dispatchFunction| |EXPR;retract;$F;155|) $))
               (QSETREFV $ 72
                         (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;156|)
                               $))
               (COND ((|domainEqual| |#1| (|AlgebraicNumber|)))
                     ('T
                      (PROGN
                       (QSETREFV $ 412
                                 (CONS
                                  (|dispatchFunction| |EXPR;coerce;An$;157|)
                                  $))
                       (QSETREFV $ 436
                                 (CONS
                                  (|dispatchFunction|
                                   |EXPR;retractIfCan;$U;160|)
                                  $))))))))
            (COND
             ((|testBitVector| |pv$| 9)
              (PROGN
               (QSETREFV $ 464
                         (CONS (|dispatchFunction| |EXPR;convert;$If;164|) $))
               (QSETREFV $ 467
                         (CONS (|dispatchFunction| |EXPR;eval;$Bo$S$;165|) $))
               (QSETREFV $ 466
                         (CONS (|dispatchFunction| |EXPR;eval;$LLS$;166|)
                               $)))))
            (COND
             ((|testBitVector| |pv$| 13)
              (QSETREFV $ 490
                        (CONS
                         (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;167|)
                         $))))
            (COND
             ((|testBitVector| |pv$| 12)
              (QSETREFV $ 496
                        (CONS
                         (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;168|)
                         $))))))
          ('T
           (PROGN
            (SETELT $ 45 (|SparseMultivariatePolynomial| |#1| (|Kernel| $)))
            (QSETREFV $ 47
                      (CONS #'|makeSpadConstant|
                            (LIST (|dispatchFunction| |EXPR;Zero;$;169|) $
                                  47)))
            (QSETREFV $ 49
                      (CONS #'|makeSpadConstant|
                            (LIST (|dispatchFunction| |EXPR;One;$;170|) $ 49)))
            (QSETREFV $ 56 (CONS (|dispatchFunction| |EXPR;-;2$;171|) $))
            (QSETREFV $ 59 (CONS (|dispatchFunction| |EXPR;*;I2$;172|) $))
            (QSETREFV $ 63 (CONS (|dispatchFunction| |EXPR;*;3$;173|) $))
            (QSETREFV $ 65 (CONS (|dispatchFunction| |EXPR;+;3$;174|) $))
            (QSETREFV $ 96 (CONS (|dispatchFunction| |EXPR;=;2$B;175|) $))
            (QSETREFV $ 95
                      (CONS (|dispatchFunction| |EXPR;smaller?;2$B;176|) $))
            (QSETREFV $ 99 (CONS (|dispatchFunction| |EXPR;numer;$Smp;177|) $))
            (QSETREFV $ 104
                      (CONS (|dispatchFunction| |EXPR;coerce;Smp$;178|) $))
            (QSETREFV $ 106 (CONS (|dispatchFunction| |EXPR;coerce;P$;179|) $))
            (QSETREFV $ 155
                      (CONS (|dispatchFunction| |EXPR;reducedSystem;MM;180|)
                            $))
            (QSETREFV $ 163
                      (CONS (|dispatchFunction| |EXPR;reducedSystem;MVR;181|)
                            $))
            (COND
             ((|testBitVector| |pv$| 9)
              (QSETREFV $ 464
                        (CONS (|dispatchFunction| |EXPR;convert;$If;182|) $))))
            (COND
             ((|testBitVector| |pv$| 13)
              (PROGN
               (QSETREFV $ 490
                         (CONS
                          (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;184|)
                          $)))))
            (COND
             ((|testBitVector| |pv$| 12)
              (PROGN
               (QSETREFV $ 496
                         (CONS
                          (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;186|)
                          $))))))))))
       ((|HasCategory| |#1| '(|AbelianMonoid|))
        (PROGN
         (SETELT $ 45 (|FreeAbelianGroup| (|Kernel| $)))
         (QSETREFV $ 47
                   (CONS #'|makeSpadConstant|
                         (LIST (|dispatchFunction| |EXPR;Zero;$;187|) $ 47)))
         (QSETREFV $ 65 (CONS (|dispatchFunction| |EXPR;+;3$;188|) $))
         (QSETREFV $ 96 (CONS (|dispatchFunction| |EXPR;=;2$B;189|) $))
         (QSETREFV $ 95 (CONS (|dispatchFunction| |EXPR;smaller?;2$B;190|) $))
         (QSETREFV $ 142 (CONS (|dispatchFunction| |EXPR;coerce;K$;191|) $))
         (QSETREFV $ 75 (CONS (|dispatchFunction| |EXPR;kernels;$L;192|) $))
         (QSETREFV $ 437 (CONS (|dispatchFunction| |EXPR;coerce;R$;193|) $))
         (QSETREFV $ 517 (CONS (|dispatchFunction| |EXPR;retract;$R;194|) $))
         (QSETREFV $ 520 (CONS (|dispatchFunction| |EXPR;coerce;$Of;195|) $))
         (QSETREFV $ 530 (CONS (|dispatchFunction| |EXPR;isPlus;$U;198|) $))
         (QSETREFV $ 534 (CONS (|dispatchFunction| |EXPR;isMult;$U;199|) $))
         (QSETREFV $ 521 (CONS (|dispatchFunction| |EXPR;eval;$LL$;200|) $))
         (QSETREFV $ 526 (CONS (|dispatchFunction| |EXPR;subst;$LL$;201|) $))
         (QSETREFV $ 535
                   (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;202|) $))
         (COND
          ((|testBitVector| |pv$| 19)
           (QSETREFV $ 56 (CONS (|dispatchFunction| |EXPR;-;2$;203|) $))))))
       ('T
        (PROGN
         (SETELT $ 45 (|Kernel| $))
         (QSETREFV $ 95 (CONS (|dispatchFunction| |EXPR;smaller?;2$B;204|) $))
         (QSETREFV $ 96 (CONS (|dispatchFunction| |EXPR;=;2$B;205|) $))
         (QSETREFV $ 142 (CONS (|dispatchFunction| |EXPR;coerce;K$;206|) $))
         (QSETREFV $ 75 (CONS (|dispatchFunction| |EXPR;kernels;$L;207|) $))
         (QSETREFV $ 437 (CONS (|dispatchFunction| |EXPR;coerce;R$;208|) $))
         (QSETREFV $ 517 (CONS (|dispatchFunction| |EXPR;retract;$R;209|) $))
         (QSETREFV $ 535
                   (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;210|) $))
         (QSETREFV $ 520 (CONS (|dispatchFunction| |EXPR;coerce;$Of;211|) $))
         (QSETREFV $ 521 (CONS (|dispatchFunction| |EXPR;eval;$LL$;212|) $))
         (QSETREFV $ 526 (CONS (|dispatchFunction| |EXPR;subst;$LL$;213|) $))
         (COND
          ((|testBitVector| |pv$| 9)
           (QSETREFV $ 464
                     (CONS (|dispatchFunction| |EXPR;convert;$If;214|) $)))))))
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
              (|Union| 413 '#1#) (220 . |retractIfCan|) (225 . |number?|)
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
              (|PolynomialCategoryQuotientFunctions| 408 15 6 41 $$)
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
              (1440 . |jacobiTheta|) (1446 . |jacobiTheta|) (1452 . |lerchPhi|)
              (1459 . |lerchPhi|) (1466 . |riemannZeta|) (1471 . |riemannZeta|)
              (1476 . |hypergeometricF|) (|List| $) (1483 . |hypergeometricF|)
              (1490 . |meijerG|) (1499 . |meijerG|)
              (|CombinatorialFunction| 6 $$) (1508 . ^) (1514 . |factorial|)
              (1519 . |factorial|) (1524 . |binomial|) (1530 . |binomial|)
              (1536 . |permutation|) (1542 . |permutation|)
              (1548 . |factorials|) (1553 . |factorials|) (1558 . |factorials|)
              (1564 . |factorials|) (1570 . |summation|) (1576 . |summation|)
              (|SegmentBinding| $$) (1582 . |summation|) (|SegmentBinding| $)
              (1588 . |summation|) (1594 . |product|) (1600 . |product|)
              (1606 . |product|) (1612 . |product|)
              (|LiouvillianFunction| 6 $$) (1618 . |erf|) (1623 . |erf|)
              (1628 . |Ei|) (1633 . |Ei|) (1638 . |Si|) (1643 . |Si|)
              (1648 . |Ci|) (1653 . |Ci|) (1658 . |li|) (1663 . |li|)
              (1668 . |dilog|) (1673 . |dilog|) (1678 . |fresnelS|)
              (1683 . |fresnelS|) (1688 . |fresnelC|) (1693 . |fresnelC|)
              (1698 . |integral|) (1704 . |integral|) (1710 . |integral|)
              (1716 . |integral|) (1722 . |belong?|) (1727 . |operator|)
              (1732 . |belong?|) (1737 . |operator|) (1742 . |belong?|)
              (1747 . |operator|) (1752 . |belong?|) (1757 . |operator|)
              (1762 . |belong?|) (1767 . |operator|) (|Fraction| 41)
              (1772 . |coerce|) (|Fraction| 386)
              (|PolynomialCategoryQuotientFunctions| 408 15 6 41 381)
              (1777 . |univariate|) (|SparseUnivariatePolynomial| 381)
              (1783 . |numer|) (1788 . |degree|) (1794 . |degree|)
              (1799 . |rem|) (1805 . |coerce|) (1810 . |elt|) (1816 . |Zero|)
              (1820 . ~=) (1826 . |leadingCoefficient|) (1831 . |reductum|)
              (1836 . |gcdPolynomial|) (|GcdDomain&| $$)
              (1842 . |gcdPolynomial|) (1848 . |gcdPolynomial|)
              (|Factored| 386) (|SupFractionFactorizer| 408 15 6 41)
              (1854 . |factor|) (|Factored| 124) (1859 . |factorPolynomial|)
              (1864 . |squareFree|) (1869 . |squareFreePolynomial|)
              (|IndexedExponents| 15) (1874 . |Zero|) (1878 . |monomial|)
              (|AlgebraicNumber|) (1884 . |coerce|) (|Fraction| 57) (1889 . ^)
              (1895 . ^) (1901 . |minPoly|) (1906 . |definingPolynomial|)
              (1911 . |definingPolynomial|) (1916 . |retract|)
              (1921 . |retract|) (1926 . |retractIfCan|)
              (|SparseMultivariatePolynomial| 57 12) (1931 . |numer|)
              (1936 . |denom|) (|Mapping| $$ 411) (|Kernel| 411)
              (|ExpressionSpaceFunctions2| 411 $$) (1941 . |map|)
              (|Mapping| $$ 426) (|Mapping| $$ 57)
              (|SparseMultivariatePolynomial| 57 426)
              (|PolynomialCategoryLifting| (|IndexedExponents| 426) 426 57 431
                                           $$)
              (1947 . |map|) (1954 . /) (|Union| 411 '"failed")
              (1960 . |retractIfCan|) (1965 . |coerce|) (1970 . |coerce|)
              (1975 . |belong?|) (1980 . |is?|) (|Union| 27 '#1#)
              (1986 . |retractIfCan|) (1991 . ~=)
              (|SparseUnivariatePolynomial| 411) (1997 . |Zero|)
              (2001 . |Zero|) (2005 . ~=) (2011 . |degree|) (2016 . |monomial|)
              (2022 . +) (2028 . |rootOf|) (2034 . |operator|) (2039 . |elt|)
              (|Union| 15 '"failed") (2045 . |mainVariable|)
              (2050 . |leadingCoefficient|) (2055 . |Zero|) (2059 . |ground?|)
              (2064 . ^) (2070 . *) (2076 . +) (|InputForm|) (2082 . |convert|)
              (2087 . |convert|) (|List| 10) (2092 . |eval|) (2100 . |eval|)
              (2108 . |variables|) (2113 . |concat|)
              (2118 . |removeDuplicates|) (2123 . |scripted?|) (|Mapping| 9 27)
              (2128 . |select|) (|MakeUnaryCompiledFunction| $$ $$ $$)
              (2134 . |compiledFunction|) (|Mapping| $ $) (|List| 476)
              (2140 . |eval|) (2147 . |new|) (2151 . |coerce|) (|Equation| $$)
              (2156 . =) (|List| 561) (2162 . |subst|)
              (|PatternMatchResult| 57 $$) (|Pattern| 57)
              (|PatternMatchFunctionSpace| 57 6 $$) (2168 . |patternMatch|)
              (|PatternMatchResult| 57 $) (2175 . |patternMatch|)
              (|PatternMatchResult| (|Float|) $$) (|Pattern| (|Float|))
              (|PatternMatchFunctionSpace| (|Float|) 6 $$)
              (2182 . |patternMatch|) (|PatternMatchResult| (|Float|) $)
              (2189 . |patternMatch|) (2196 . |reducedSystem|)
              (2201 . |reducedSystem|) (|PatternMatchKernel| 57 $$)
              (2207 . |patternMatch|) (|PatternMatchResult| 57 45)
              (|Mapping| 501 15 486 501)
              (|PatternMatchPolynomialCategory| 57 408 15 6 45)
              (2214 . |patternMatch|) (|PatternMatchKernel| (|Float|) $$)
              (2222 . |patternMatch|) (|PatternMatchResult| (|Float|) 45)
              (|Mapping| 507 15 492 507)
              (|PatternMatchPolynomialCategory| (|Float|) 408 15 6 45)
              (2229 . |patternMatch|) (2237 . |coerce|)
              (|Record| (|:| |gen| 15) (|:| |exp| 57)) (|List| 512)
              (2242 . |terms|) (2247 . |zero?|) (2252 . |constantKernel|)
              (2257 . |retract|) (|OutputForm|) (2262 . |coerce|)
              (2267 . |coerce|) (2272 . |eval|) (2279 . |map|)
              (|Mapping| $$ 15) (|ListToMap| 15 $$) (2285 . |match|)
              (2293 . |subst|) (2300 . |kernel|) (2306 . *)
              (|Union| 324 '#2="failed") (2312 . |isPlus|) (2317 . |first|)
              (|Record| (|:| |coef| 57) (|:| |var| 12)) (|Union| 532 '#2#)
              (2322 . |isMult|) (2327 . |retractIfCan|) (|Matrix| 57)
              (|Record| (|:| |mat| 536) (|:| |vec| (|Vector| 57)))
              (|Union| $ '"failed") (|Factored| $) (|Polynomial| 541)
              (|Fraction| 6) (|Fraction| 124) (|Fraction| 540)
              (|Union| 107 '#1#) (|Polynomial| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |coef| 324) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 549 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Union| 57 '#1#) (|Record| (|:| |var| 12) (|:| |exponent| 57))
              (|Union| 553 '#2#) (|Record| (|:| |val| $) (|:| |exponent| 57))
              (|Union| 555 '#2#) (|List| 35) (|Mapping| $ 324) (|List| 558)
              (|Union| 105 '#1#) (|Equation| $) (|SingleInteger|) (|String|))
           '#(~= 2332 |zerosOf| 2338 |zeroOf| 2365 |zero?| 2392 |whittakerW|
              2397 |whittakerM| 2404 |weierstrassZeta| 2411 |weierstrassSigma|
              2418 |weierstrassPPrime| 2425 |weierstrassP| 2432 |weberE| 2439
              |variables| 2445 |univariate| 2450 |unitNormal| 2456
              |unitCanonical| 2461 |unit?| 2466 |tower| 2471 |tanh| 2476 |tan|
              2481 |summation| 2486 |subtractIfCan| 2498 |subst| 2504 |struveL|
              2523 |struveH| 2529 |squareFreePolynomial| 2535 |squareFreePart|
              2540 |squareFree| 2545 |sqrt| 2550 |smaller?| 2555 |sizeLess?|
              2561 |sinh| 2567 |sin| 2572 |simplifyPower| 2577
              |setSimplifyDenomsFlag| 2583 |sech| 2588 |sec| 2593 |sample| 2598
              |rootsOf| 2602 |rootOf| 2629 |riemannZeta| 2656 |retractIfCan|
              2661 |retract| 2701 |rem| 2741 |reducedSystem| 2747 |reduce| 2769
              |recip| 2774 |quo| 2779 |product| 2785 |principalIdeal| 2797
              |prime?| 2802 |polylog| 2807 |polygamma| 2813 |pi| 2819
              |permutation| 2823 |patternMatch| 2829 |paren| 2843 |operators|
              2853 |operator| 2858 |one?| 2863 |odd?| 2868 |numerator| 2873
              |numer| 2878 |number?| 2883 |nthRoot| 2888 |multiEuclidean| 2894
              |minPoly| 2900 |meijerG| 2905 |map| 2914 |mainKernel| 2920
              |lommelS2| 2925 |lommelS1| 2932 |log| 2939 |li| 2944 |lerchPhi|
              2949 |legendreQ| 2956 |legendreP| 2963 |lcm| 2970 |latex| 2981
              |lambertW| 2986 |kummerU| 2991 |kummerM| 2998 |kernels| 3005
              |kernel| 3010 |kelvinKer| 3022 |kelvinKei| 3028 |kelvinBer| 3034
              |kelvinBei| 3040 |jacobiZeta| 3046 |jacobiTheta| 3052 |jacobiSn|
              3058 |jacobiDn| 3064 |jacobiCn| 3070 |isTimes| 3076 |isPower|
              3081 |isPlus| 3086 |isMult| 3091 |isExpt| 3096 |is?| 3113 |inv|
              3125 |integral| 3130 |hypergeometricF| 3142 |height| 3149 |hash|
              3154 |hankelH2| 3159 |hankelH1| 3165 |ground?| 3171 |ground| 3176
              |getSimplifyDenomsFlag| 3181 |gcdPolynomial| 3185 |gcd| 3191
              |fresnelS| 3202 |fresnelC| 3207 |freeOf?| 3212 |factorials| 3224
              |factorial| 3235 |factorPolynomial| 3240 |factor| 3245
              |extendedEuclidean| 3250 |exquo| 3263 |expressIdealMember| 3269
              |exp| 3275 |even?| 3280 |eval| 3285 |euclideanSize| 3446 |erf|
              3451 |elt| 3456 |ellipticPi| 3552 |ellipticK| 3559 |ellipticF|
              3564 |ellipticE| 3570 |divide| 3581 |distribute| 3587 |dilog|
              3598 |digamma| 3603 |differentiate| 3608 |denominator| 3634
              |denom| 3639 |definingPolynomial| 3644 |csch| 3649 |csc| 3654
              |coth| 3659 |cot| 3664 |cosh| 3669 |cos| 3674 |convert| 3679
              |conjugate| 3699 |commutator| 3705 |coerce| 3711 |charthRoot|
              3781 |characteristic| 3786 |box| 3790 |binomial| 3800 |besselY|
              3806 |besselK| 3812 |besselJ| 3818 |besselI| 3824 |belong?| 3830
              |atanh| 3835 |atan| 3840 |associates?| 3845 |asinh| 3851 |asin|
              3856 |asech| 3861 |asec| 3866 |applyQuote| 3871 |angerJ| 3907
              |airyBiPrime| 3913 |airyBi| 3918 |airyAiPrime| 3923 |airyAi| 3928
              |acsch| 3933 |acsc| 3938 |acoth| 3943 |acot| 3948 |acosh| 3953
              |acos| 3958 |abs| 3963 ^ 3968 |Zero| 3998 |Si| 4002 |One| 4007
              |Gamma| 4011 |Ei| 4022 D 4027 |Ci| 4053 |Beta| 4058 = 4064 / 4070
              - 4082 + 4093 * 4099)
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
                 (|Algebra| $$) (|Algebra| 413) (|Algebra| 6)
                 (|FullyLinearlyExplicitRingOver| 6) (|Module| $$)
                 (|EntireRing|) (|Module| 413) (|Module| 6)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|LinearlyExplicitRingOver| 6) (|LinearlyExplicitRingOver| 57)
                 (|CommutativeRing|) (|PartialDifferentialRing| 27)
                 (|BiModule| $$ $$) (|BiModule| 413 413) (|BiModule| 6 6)
                 (|Ring|) (|RightModule| $$) (|LeftModule| 413)
                 (|RightModule| 413) (|LeftModule| $$) (|LeftModule| 6)
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
                 (|CoercibleTo| 518) (|RetractableTo| 413)
                 (|RetractableTo| (|Fraction| (|Polynomial| 6)))
                 (|CommutativeStar|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|RetractableTo| (|Polynomial| 6))
                 (|ConvertibleTo| 462) (|ConvertibleTo| 492)
                 (|ConvertibleTo| 486) (|RetractableTo| 57)
                 (|RetractableTo| 411) (|SpecialFunctionCategory|)
                 (|PrimitiveFunctionCategory|)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|)
                 (|CombinatorialFunctionCategory|) (|unitsKnown|)
                 (|RadicalCategory|))
              (|makeByteWordVec2| 563
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
                                    2 224 2 2 2 317 2 0 0 0 0 318 3 224 2 2 2 2
                                    319 3 0 0 0 0 0 320 1 224 2 2 321 1 0 0 0
                                    322 3 224 2 78 78 2 323 3 0 0 324 324 0 325
                                    5 224 2 78 78 78 78 2 326 5 0 0 324 324 324
                                    324 0 327 2 328 2 2 2 329 1 328 2 2 330 1 0
                                    0 0 331 2 328 2 2 2 332 2 0 0 0 0 333 2 328
                                    2 2 2 334 2 0 0 0 0 335 1 328 2 2 336 1 0 0
                                    0 337 2 328 2 2 27 338 2 0 0 0 27 339 2 328
                                    2 2 27 340 2 0 0 0 27 341 2 328 2 2 342 343
                                    2 0 0 0 344 345 2 328 2 2 27 346 2 0 0 0 27
                                    347 2 328 2 2 342 348 2 0 0 0 344 349 1 350
                                    2 2 351 1 0 0 0 352 1 350 2 2 353 1 0 0 0
                                    354 1 350 2 2 355 1 0 0 0 356 1 350 2 2 357
                                    1 0 0 0 358 1 350 2 2 359 1 0 0 0 360 1 350
                                    2 2 361 1 0 0 0 362 1 350 2 2 363 1 0 0 0
                                    364 1 350 2 2 365 1 0 0 0 366 2 350 2 2 27
                                    367 2 0 0 0 27 368 2 350 2 2 342 369 2 0 0
                                    0 344 370 1 166 9 10 371 1 166 10 10 372 1
                                    169 9 10 373 1 169 10 10 374 1 328 9 10 375
                                    1 328 10 10 376 1 350 9 10 377 1 350 10 10
                                    378 1 224 9 10 379 1 224 10 10 380 1 381 0
                                    41 382 2 384 383 381 15 385 1 383 386 0 387
                                    2 41 35 0 15 388 1 139 35 0 389 2 139 0 0 0
                                    390 1 41 0 15 391 2 386 381 0 381 392 0 139
                                    0 393 2 139 9 0 0 394 1 139 2 0 395 1 139 0
                                    0 396 2 45 124 124 124 397 2 398 124 124
                                    124 399 2 0 124 124 124 400 1 402 401 386
                                    403 1 0 404 124 405 1 402 401 386 406 1 0
                                    404 124 407 0 408 0 409 2 41 0 6 408 410 1
                                    0 0 411 412 2 166 2 2 413 414 2 0 0 0 413
                                    415 1 166 139 15 416 1 166 2 2 417 1 0 0 0
                                    418 1 45 413 0 419 1 0 413 0 420 1 45 71 0
                                    421 1 411 422 0 423 1 411 422 0 424 2 427 2
                                    425 426 428 3 432 2 429 430 431 433 2 411 0
                                    0 0 434 1 0 435 0 436 1 0 0 6 437 1 411 0
                                    413 438 1 411 9 10 439 2 10 9 0 27 440 1 0
                                    441 0 442 2 41 9 0 0 443 0 444 0 445 0 126
                                    0 446 2 126 9 0 0 447 1 126 35 0 448 2 444
                                    0 411 35 449 2 444 0 0 0 450 2 411 0 124 27
                                    451 1 411 10 10 452 2 411 0 10 324 453 1 41
                                    454 0 455 1 41 6 0 456 0 411 0 457 1 126 9
                                    0 458 2 411 0 0 35 459 2 411 0 0 0 460 2
                                    411 0 0 0 461 1 45 462 0 463 1 0 462 0 464
                                    4 0 0 0 465 324 27 466 4 0 0 0 10 0 27 467
                                    1 0 38 0 468 1 38 0 324 469 1 38 0 0 470 1
                                    27 9 0 471 2 38 0 472 0 473 2 474 147 2 27
                                    475 3 0 0 0 465 477 478 0 27 0 479 1 0 0 27
                                    480 2 481 0 2 2 482 2 0 0 0 483 484 3 487
                                    485 2 486 485 488 3 0 489 0 486 489 490 3
                                    493 491 2 492 491 494 3 0 495 0 492 495 496
                                    1 45 153 151 497 2 45 161 151 159 498 3 499
                                    485 15 486 485 500 4 503 501 45 486 501 502
                                    504 3 505 491 15 492 491 506 4 509 507 45
                                    492 507 508 510 1 45 0 15 511 1 45 513 0
                                    514 1 6 9 0 515 1 16 15 6 516 1 0 6 0 517 1
                                    45 518 0 519 1 0 518 0 520 3 0 0 0 74 324
                                    521 2 0 0 476 12 522 4 524 2 42 78 15 523
                                    525 3 0 0 0 74 324 526 2 0 0 10 324 527 2
                                    45 0 57 15 528 1 0 529 0 530 1 513 512 0
                                    531 1 0 533 0 534 1 0 14 0 535 2 0 9 0 0
                                    122 2 1 324 0 27 1 1 1 324 0 1 2 1 324 124
                                    27 1 1 1 324 545 1 1 1 324 124 1 2 1 0 0 27
                                    1 1 1 0 0 1 2 1 0 124 27 1 1 1 0 545 1 1 1
                                    0 124 1 1 25 9 0 54 3 1 0 0 0 0 268 3 1 0 0
                                    0 0 266 3 1 0 0 0 0 264 3 1 0 0 0 0 262 3 1
                                    0 0 0 0 260 3 1 0 0 0 0 258 2 1 0 0 0 272 1
                                    0 38 0 468 2 1 542 0 12 1 1 1 546 0 1 1 1 0
                                    0 1 1 1 9 0 1 1 0 74 0 1 1 1 0 0 205 1 1 0
                                    0 181 2 1 0 0 27 341 2 1 0 0 344 345 2 19
                                    538 0 0 1 3 0 0 0 74 324 526 2 0 0 0 561 1
                                    2 0 0 0 483 484 2 1 0 0 0 276 2 1 0 0 0 274
                                    1 30 404 124 407 1 1 0 0 1 1 1 539 0 1 1 1
                                    0 0 1 2 0 9 0 0 95 2 1 9 0 0 1 1 1 0 0 201
                                    1 1 0 0 177 2 1 0 0 57 86 1 1 9 9 134 1 1 0
                                    0 209 1 1 0 0 185 0 29 0 1 2 1 324 0 27 1 1
                                    1 324 0 1 1 1 324 124 1 2 1 324 124 27 1 1
                                    1 324 545 1 2 1 0 0 27 1 1 1 0 0 1 1 1 0
                                    124 1 2 1 0 124 27 168 1 1 0 545 1 1 1 0 0
                                    322 1 15 435 0 436 1 16 71 0 72 1 1 544 0 1
                                    1 14 552 0 1 1 5 560 0 1 1 0 14 0 535 1 0
                                    441 0 442 1 0 18 0 19 1 15 411 0 1 1 16 413
                                    0 420 1 1 107 0 1 1 14 57 0 1 1 5 105 0 1 1
                                    0 6 0 517 1 0 27 0 1 1 0 12 0 13 2 1 0 0 0
                                    1 1 24 536 151 1 2 24 537 151 159 1 1 5 153
                                    151 155 2 5 161 151 159 163 1 1 0 0 111 1
                                    27 538 0 1 2 1 0 0 0 1 2 1 0 0 27 347 2 1 0
                                    0 344 349 1 1 547 324 1 1 1 9 0 1 2 1 0 0 0
                                    256 2 1 0 0 0 236 0 1 0 171 2 1 0 0 0 335 3
                                    12 495 0 492 495 496 3 13 489 0 486 489 490
                                    1 0 0 0 1 1 0 0 324 1 1 0 465 0 1 1 0 10 10
                                    37 1 27 9 0 52 1 31 9 0 1 1 5 0 0 88 1 5 98
                                    0 99 1 1 9 0 73 2 1 0 0 57 1 2 1 529 324 0
                                    1 1 32 124 12 138 5 33 0 324 324 324 324 0
                                    327 2 0 0 476 12 522 1 0 18 0 1 3 1 0 0 0 0
                                    284 3 1 0 0 0 0 282 1 1 0 0 175 1 1 0 0 360
                                    3 1 0 0 0 0 320 3 1 0 0 0 0 292 3 1 0 0 0 0
                                    290 1 1 0 324 1 2 1 0 0 0 1 1 0 563 0 1 1 1
                                    0 0 254 3 1 0 0 0 0 288 3 1 0 0 0 0 286 1 0
                                    74 0 75 2 0 0 10 0 1 2 0 0 10 324 527 2 1 0
                                    0 0 300 2 1 0 0 0 298 2 1 0 0 0 296 2 1 0 0
                                    0 294 2 1 0 0 0 1 2 1 0 0 0 318 2 1 0 0 0
                                    312 2 1 0 0 0 316 2 1 0 0 0 314 1 27 529 0
                                    1 1 5 556 0 1 1 25 529 0 530 1 25 533 0 534
                                    2 5 554 0 10 1 2 5 554 0 27 1 1 27 554 0 1
                                    2 0 9 0 27 76 2 0 9 0 10 1 1 23 0 0 1 2 1 0
                                    0 27 368 2 1 0 0 344 370 3 33 0 324 324 0
                                    325 1 0 35 0 1 1 0 562 0 1 2 1 0 0 0 280 2
                                    1 0 0 0 278 1 0 9 0 70 1 0 6 0 1 0 1 9 133
                                    2 1 124 124 124 400 1 1 0 324 1 2 1 0 0 0 1
                                    1 1 0 0 364 1 1 0 0 366 2 0 9 0 27 1 2 0 9
                                    0 0 1 2 1 0 0 27 339 1 1 0 0 337 1 1 0 0
                                    331 1 30 404 124 405 1 1 539 0 1 3 1 550 0
                                    0 0 1 2 1 551 0 0 1 2 1 538 0 0 1 2 1 529
                                    324 0 1 1 1 0 0 173 1 31 9 0 1 2 9 0 0 38 1
                                    2 9 0 0 27 1 1 9 0 0 1 4 9 0 0 465 324 27
                                    466 4 9 0 0 10 0 27 467 4 5 0 0 38 557 559
                                    1 4 5 0 0 38 557 477 1 4 5 0 0 27 35 558 1
                                    4 5 0 0 27 35 476 1 3 0 0 0 10 476 1 3 0 0
                                    0 465 559 1 3 0 0 0 10 558 1 3 0 0 0 465
                                    477 478 3 0 0 0 27 558 1 3 0 0 0 27 476 1 3
                                    0 0 0 38 477 1 3 0 0 0 38 559 1 3 0 0 0 0 0
                                    1 3 0 0 0 324 324 1 2 0 0 0 561 1 3 0 0 0
                                    74 324 521 2 0 0 0 483 1 3 0 0 0 12 0 1 1 1
                                    35 0 1 1 1 0 0 352 10 0 0 10 0 0 0 0 0 0 0
                                    0 0 1 2 0 0 10 324 1 9 0 0 10 0 0 0 0 0 0 0
                                    0 1 7 0 0 10 0 0 0 0 0 0 1 8 0 0 10 0 0 0 0
                                    0 0 0 1 5 0 0 10 0 0 0 0 1 6 0 0 10 0 0 0 0
                                    0 1 4 0 0 10 0 0 0 1 2 0 0 10 0 1 3 0 0 10
                                    0 0 1 3 1 0 0 0 0 310 1 1 0 0 302 2 1 0 0 0
                                    308 1 1 0 0 304 2 1 0 0 0 306 2 1 548 0 0 1
                                    2 0 0 0 0 1 1 0 0 0 1 1 1 0 0 362 1 1 0 0
                                    234 3 5 0 0 38 557 1 2 5 0 0 38 1 3 5 0 0
                                    27 35 1 2 5 0 0 27 1 1 1 0 0 89 1 1 98 0
                                    101 1 32 0 0 418 1 1 0 0 211 1 1 0 0 187 1
                                    1 0 0 207 1 1 0 0 183 1 1 0 0 203 1 1 0 0
                                    179 1 9 462 0 464 1 10 492 0 1 1 11 486 0 1
                                    1 1 0 539 1 2 8 0 0 0 1 2 8 0 0 0 1 1 15 0
                                    411 412 1 22 0 413 1 1 21 0 57 61 1 1 0 540
                                    1 1 1 0 541 1 1 1 0 543 1 1 1 0 107 110 1 1
                                    0 0 1 1 5 0 98 104 1 5 0 105 106 1 0 0 6
                                    437 1 0 0 27 480 1 0 0 12 142 1 0 518 0 520
                                    1 3 538 0 1 0 5 35 1 1 0 0 0 1 1 0 0 324 1
                                    2 1 0 0 0 333 2 1 0 0 0 240 2 1 0 0 0 244 2
                                    1 0 0 0 238 2 1 0 0 0 242 1 0 9 10 11 1 1 0
                                    0 217 1 1 0 0 193 2 1 9 0 0 1 1 1 0 0 213 1
                                    1 0 0 189 1 1 0 0 221 1 1 0 0 197 5 0 0 27
                                    0 0 0 0 1 2 0 0 27 324 1 4 0 0 27 0 0 0 1 2
                                    0 0 27 0 1 3 0 0 27 0 0 1 2 1 0 0 0 270 1 1
                                    0 0 252 1 1 0 0 250 1 1 0 0 248 1 1 0 0 246
                                    1 1 0 0 223 1 1 0 0 199 1 1 0 0 219 1 1 0 0
                                    195 1 1 0 0 215 1 1 0 0 191 1 1 0 0 226 2
                                    23 0 0 57 91 2 1 0 0 0 83 2 1 0 0 413 415 2
                                    27 0 0 35 90 2 27 0 0 92 93 0 25 0 47 1 1 0
                                    0 356 0 27 0 49 1 1 0 0 228 2 1 0 0 0 230 1
                                    1 0 0 354 3 5 0 0 27 35 1 3 5 0 0 38 557 1
                                    2 5 0 0 38 1 2 5 0 0 27 1 1 1 0 0 358 2 1 0
                                    0 0 232 2 0 9 0 0 96 2 23 0 0 0 69 2 1 0 98
                                    98 146 1 19 0 0 56 2 19 0 0 0 67 2 25 0 0 0
                                    65 2 19 0 57 0 59 2 25 0 35 0 1 2 25 0 92 0
                                    1 2 2 0 0 6 1 2 2 0 6 0 1 2 1 0 413 0 1 2 1
                                    0 0 413 1 2 27 0 0 0 63)))))
           '|lookupComplete|)) 
