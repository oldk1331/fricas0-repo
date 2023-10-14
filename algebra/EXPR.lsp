
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
  (PROG (|vl2| #1=#:G201 |z| #2=#:G200 |vl1| |ps|)
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

(DEFUN |EXPR;=;2$B;23| (|x| |y| $)
  (SPADCALL (SPADCALL |x| |y| (QREFELT $ 67)) (|spadConstant| $ 46)
            (QREFELT $ 51))) 

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
  (PROG (|ak1| #1=#:G264 |k1| |arg| |resl| |needed| #2=#:G263 #3=#:G262
         #4=#:G261 |k| |ak| #5=#:G260)
    (RETURN
     (SEQ (LETT |resl| NIL . #6=(|EXPR;alg_ker_set|)) (LETT |ak1| NIL . #6#)
          (SEQ (LETT |k| NIL . #6#)
               (LETT #5# (SPADCALL |x| (QREFELT $ 75)) . #6#) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |k| (CAR #5#) . #6#) NIL))
                 (GO G191)))
               (SEQ
                (COND
                 ((NULL (SPADCALL |k| '|nthRoot| (QREFELT $ 116)))
                  (COND
                   ((NULL (SPADCALL |k| '|rootOf| (QREFELT $ 116)))
                    (EXIT "iterate")))))
                (EXIT (LETT |ak1| (SPADCALL |k| |ak1| (QREFELT $ 117)) . #6#)))
               (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
          (SEQ G190
               (COND ((NULL (COND ((NULL |ak1|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ (LETT |ak| |ak1| . #6#) (LETT |ak1| NIL . #6#)
                    (EXIT
                     (SEQ (LETT |k| NIL . #6#) (LETT #4# |ak| . #6#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |k| (CAR #4#) . #6#) NIL))
                            (GO G191)))
                          (SEQ (LETT |needed| 'T . #6#)
                               (SEQ (LETT |k1| NIL . #6#)
                                    (LETT #3# |resl| . #6#) G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN
                                           (LETT |k1| (CAR #3#) . #6#)
                                           NIL)
                                          (NULL |needed|))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((EQ |k1| |k|)
                                        (LETT |needed| 'NIL . #6#)))))
                                    (LETT #3# (CDR #3#) . #6#) (GO G190) G191
                                    (EXIT NIL))
                               (SEQ (LETT |k1| NIL . #6#)
                                    (LETT #2# |resl| . #6#) G190
                                    (COND
                                     ((OR (ATOM #2#)
                                          (PROGN
                                           (LETT |k1| (CAR #2#) . #6#)
                                           NIL)
                                          (NULL |needed|))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL |k1| |k| (QREFELT $ 118))
                                        (LETT |needed| 'NIL . #6#)))))
                                    (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT
                                (COND
                                 (|needed|
                                  (SEQ
                                   (LETT |resl|
                                         (SPADCALL |k| |resl| (QREFELT $ 117))
                                         . #6#)
                                   (LETT |ak1|
                                         (SPADCALL |k| |ak1| (QREFELT $ 117))
                                         . #6#)
                                   (LETT |arg| (SPADCALL |k| (QREFELT $ 79))
                                         . #6#)
                                   (EXIT
                                    (SEQ (LETT |k1| NIL . #6#)
                                         (LETT #1#
                                               (SPADCALL
                                                (SPADCALL |arg| 1
                                                          (QREFELT $ 81))
                                                (QREFELT $ 75))
                                               . #6#)
                                         G190
                                         (COND
                                          ((OR (ATOM #1#)
                                               (PROGN
                                                (LETT |k1| (CAR #1#) . #6#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (COND
                                            ((OR
                                              (SPADCALL |k1| '|nthRoot|
                                                        (QREFELT $ 116))
                                              (SPADCALL |k1| '|rootOf|
                                                        (QREFELT $ 116)))
                                             (LETT |ak1|
                                                   (SPADCALL |k1| |ak1|
                                                             (QREFELT $ 117))
                                                   . #6#)))))
                                         (LETT #1# (CDR #1#) . #6#) (GO G190)
                                         G191 (EXIT NIL)))))
                                 ('T "iterate"))))
                          (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                          (EXIT NIL))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |resl|))))) 

(DEFUN |EXPR;algtower| (|x| $)
  (NREVERSE (SPADCALL (|EXPR;alg_ker_set| |x| $) (QREFELT $ 119)))) 

(DEFUN |EXPR;simple_root| (|r| $)
  (PROG (|a| |al|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |r| '|nthRoot| (QREFELT $ 116))
        (SEQ
         (LETT |al| (SPADCALL |r| (QREFELT $ 79)) . #1=(|EXPR;simple_root|))
         (EXIT
          (COND
           ((SPADCALL (SPADCALL |al| 2 (QREFELT $ 81))
                      (SPADCALL 2 (QREFELT $ 61)) (QREFELT $ 120))
            'NIL)
           (#2='T
            (SEQ (LETT |a| (SPADCALL |al| 1 (QREFELT $ 81)) . #1#)
                 (EXIT
                  (COND
                   ((SPADCALL
                     (LENGTH
                      (|EXPR;algkernels| (SPADCALL |a| (QREFELT $ 75)) $))
                     0 (QREFELT $ 121))
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
      (LETT |dp| (SPADCALL (SPADCALL |x| (QREFELT $ 101)) |r| (QREFELT $ 123))
            . #1#)
      (LETT |n0| (SPADCALL |x| (QREFELT $ 99)) . #1#)
      (LETT |c1| (SPADCALL |dp| (QREFELT $ 125)) . #1#)
      (LETT |c0| (SPADCALL (SPADCALL |dp| (QREFELT $ 126)) (QREFELT $ 125))
            . #1#)
      (LETT |n1|
            (SPADCALL |dn|
                      (SPADCALL (SPADCALL |c0| |n0| (QREFELT $ 127))
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| $ 103) |r| 1
                                            (QREFELT $ 128))
                                  |c1| (QREFELT $ 127))
                                 |n0| (QREFELT $ 127))
                                (QREFELT $ 129))
                      (QREFELT $ 127))
            . #1#)
      (LETT |d1|
            (SPADCALL
             (SPADCALL (SPADCALL |c0| |c0| (QREFELT $ 127)) |dn|
                       (QREFELT $ 127))
             (SPADCALL (SPADCALL |an| |c1| (QREFELT $ 127)) |c1|
                       (QREFELT $ 127))
             (QREFELT $ 129))
            . #1#)
      (EXIT
       (|EXPR;reduc| (SPADCALL |n1| |d1| (QREFELT $ 130)) (LIST |r|) $)))))) 

(PUT '|EXPR;getSimplifyDenomsFlag;B;37| '|SPADreplace|
     '(XLAM NIL |algreduc_flag|)) 

(DEFUN |EXPR;getSimplifyDenomsFlag;B;37| ($) |algreduc_flag|) 

(DEFUN |EXPR;setSimplifyDenomsFlag;2B;38| (|x| $)
  (PROG (|res|)
    (RETURN
     (SEQ
      (LETT |res| (SPADCALL (QREFELT $ 131))
            |EXPR;setSimplifyDenomsFlag;2B;38|)
      (SETF |algreduc_flag| |x|) (EXIT |res|))))) 

(DEFUN |EXPR;algreduc| (|x| |ckl| $)
  (PROG (|x1| |q| #1=#:G285 |k| |sas| #2=#:G284 |r| |akl|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |x1| (|EXPR;reduc| |x| |ckl| $) . #3=(|EXPR;algreduc|))
            (EXIT
             (COND
              ((SPADCALL (QREFELT $ 131))
               (SEQ
                (LETT |akl|
                      (|EXPR;algtower|
                       (SPADCALL (|spadConstant| $ 103)
                                 (SPADCALL |x1| (QREFELT $ 101))
                                 (QREFELT $ 130))
                       $)
                      . #3#)
                (EXIT
                 (COND ((EQL (LENGTH |akl|) 0) |x1|)
                       (#4='T
                        (SEQ
                         (COND
                          ((EQL (LENGTH |akl|) 1)
                           (SEQ
                            (LETT |r| (SPADCALL |akl| 1 (QREFELT $ 133)) . #3#)
                            (EXIT
                             (COND
                              ((|EXPR;simple_root| |r| $)
                               (PROGN
                                (LETT #2# (|EXPR;root_reduce| |x| |r| $) . #3#)
                                (GO #2#))))))))
                         (LETT |sas| (SPADCALL (QREFELT $ 135)) . #3#)
                         (SEQ (LETT |k| NIL . #3#) (LETT #1# |akl| . #3#) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (LETT |q|
                                     (SPADCALL |x1| |k|
                                               (SPADCALL |k| (QREFELT $ 136))
                                               (QREFELT $ 139))
                                     . #3#)
                               (EXIT
                                (LETT |x1|
                                      (SPADCALL
                                       (SPADCALL |q| |sas|
                                                 (SPADCALL |k| (QREFELT $ 140))
                                                 (QREFELT $ 141))
                                       (QREFELT $ 142))
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT (|EXPR;reduc| |x1| |akl| $))))))))
              (#4# |x1|)))))
      #2# (EXIT #2#))))) 

(DEFUN |EXPR;/;2Smp$;40| (|x| |y| $)
  (|EXPR;reduc| (SPADCALL |x| |y| (QREFELT $ 130))
   (|EXPR;commonk| (SPADCALL |x| (|spadConstant| $ 103) (QREFELT $ 130))
    (SPADCALL |y| (|spadConstant| $ 103) (QREFELT $ 130)) $)
   $)) 

(DEFUN |EXPR;reducedSystem;MM;41| (|m| $)
  (PROG (|mm|)
    (RETURN
     (SEQ
      (LETT |mm|
            (SPADCALL
             (SPADCALL (CONS (|function| |EXPR;toprat|) $) |m| (QREFELT $ 146))
             (QREFELT $ 149))
            |EXPR;reducedSystem;MM;41|)
      (EXIT (SPADCALL |mm| (QREFELT $ 151))))))) 

(DEFUN |EXPR;reducedSystem;MVR;42| (|m| |v| $)
  (PROG (|r|)
    (RETURN
     (SEQ
      (LETT |r|
            (SPADCALL
             (SPADCALL (CONS (|function| |EXPR;toprat|) $) |m| (QREFELT $ 146))
             (SPADCALL (CONS (|function| |EXPR;toprat|) $) |v| (QREFELT $ 154))
             (QREFELT $ 157))
            |EXPR;reducedSystem;MVR;42|)
      (EXIT (SPADCALL (QCAR |r|) (QCDR |r|) (QREFELT $ 159))))))) 

(DEFUN |EXPR;commonk0| (|x| |y| $)
  (PROG (|ans| #1=#:G300 |k|)
    (RETURN
     (SEQ (LETT |ans| NIL . #2=(|EXPR;commonk0|))
          (SEQ (LETT |k| NIL . #2#) (LETT #1# (NREVERSE |x|) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |k| |y| (QREFELT $ 161))
                   (LETT |ans| (SPADCALL |k| |ans| (QREFELT $ 162)) . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |EXPR;rootOf;SupS$;44| (|x| |v| $) (SPADCALL |x| |v| (QREFELT $ 164))) 

(DEFUN |EXPR;pi;$;45| ($) (SPADCALL (QREFELT $ 167))) 

(DEFUN |EXPR;exp;2$;46| (|x| $) (SPADCALL |x| (QREFELT $ 169))) 

(DEFUN |EXPR;log;2$;47| (|x| $) (SPADCALL |x| (QREFELT $ 171))) 

(DEFUN |EXPR;sin;2$;48| (|x| $) (SPADCALL |x| (QREFELT $ 173))) 

(DEFUN |EXPR;cos;2$;49| (|x| $) (SPADCALL |x| (QREFELT $ 175))) 

(DEFUN |EXPR;tan;2$;50| (|x| $) (SPADCALL |x| (QREFELT $ 177))) 

(DEFUN |EXPR;cot;2$;51| (|x| $) (SPADCALL |x| (QREFELT $ 179))) 

(DEFUN |EXPR;sec;2$;52| (|x| $) (SPADCALL |x| (QREFELT $ 181))) 

(DEFUN |EXPR;csc;2$;53| (|x| $) (SPADCALL |x| (QREFELT $ 183))) 

(DEFUN |EXPR;asin;2$;54| (|x| $) (SPADCALL |x| (QREFELT $ 185))) 

(DEFUN |EXPR;acos;2$;55| (|x| $) (SPADCALL |x| (QREFELT $ 187))) 

(DEFUN |EXPR;atan;2$;56| (|x| $) (SPADCALL |x| (QREFELT $ 189))) 

(DEFUN |EXPR;acot;2$;57| (|x| $) (SPADCALL |x| (QREFELT $ 191))) 

(DEFUN |EXPR;asec;2$;58| (|x| $) (SPADCALL |x| (QREFELT $ 193))) 

(DEFUN |EXPR;acsc;2$;59| (|x| $) (SPADCALL |x| (QREFELT $ 195))) 

(DEFUN |EXPR;sinh;2$;60| (|x| $) (SPADCALL |x| (QREFELT $ 197))) 

(DEFUN |EXPR;cosh;2$;61| (|x| $) (SPADCALL |x| (QREFELT $ 199))) 

(DEFUN |EXPR;tanh;2$;62| (|x| $) (SPADCALL |x| (QREFELT $ 201))) 

(DEFUN |EXPR;coth;2$;63| (|x| $) (SPADCALL |x| (QREFELT $ 203))) 

(DEFUN |EXPR;sech;2$;64| (|x| $) (SPADCALL |x| (QREFELT $ 205))) 

(DEFUN |EXPR;csch;2$;65| (|x| $) (SPADCALL |x| (QREFELT $ 207))) 

(DEFUN |EXPR;asinh;2$;66| (|x| $) (SPADCALL |x| (QREFELT $ 209))) 

(DEFUN |EXPR;acosh;2$;67| (|x| $) (SPADCALL |x| (QREFELT $ 211))) 

(DEFUN |EXPR;atanh;2$;68| (|x| $) (SPADCALL |x| (QREFELT $ 213))) 

(DEFUN |EXPR;acoth;2$;69| (|x| $) (SPADCALL |x| (QREFELT $ 215))) 

(DEFUN |EXPR;asech;2$;70| (|x| $) (SPADCALL |x| (QREFELT $ 217))) 

(DEFUN |EXPR;acsch;2$;71| (|x| $) (SPADCALL |x| (QREFELT $ 219))) 

(DEFUN |EXPR;abs;2$;72| (|x| $) (SPADCALL |x| (QREFELT $ 222))) 

(DEFUN |EXPR;Gamma;2$;73| (|x| $) (SPADCALL |x| (QREFELT $ 224))) 

(DEFUN |EXPR;Gamma;3$;74| (|a| |x| $) (SPADCALL |a| |x| (QREFELT $ 226))) 

(DEFUN |EXPR;Beta;3$;75| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 228))) 

(DEFUN |EXPR;digamma;2$;76| (|x| $) (SPADCALL |x| (QREFELT $ 230))) 

(DEFUN |EXPR;polygamma;3$;77| (|k| |x| $) (SPADCALL |k| |x| (QREFELT $ 232))) 

(DEFUN |EXPR;besselJ;3$;78| (|v| |x| $) (SPADCALL |v| |x| (QREFELT $ 234))) 

(DEFUN |EXPR;besselY;3$;79| (|v| |x| $) (SPADCALL |v| |x| (QREFELT $ 236))) 

(DEFUN |EXPR;besselI;3$;80| (|v| |x| $) (SPADCALL |v| |x| (QREFELT $ 238))) 

(DEFUN |EXPR;besselK;3$;81| (|v| |x| $) (SPADCALL |v| |x| (QREFELT $ 240))) 

(DEFUN |EXPR;airyAi;2$;82| (|x| $) (SPADCALL |x| (QREFELT $ 242))) 

(DEFUN |EXPR;airyAiPrime;2$;83| (|x| $) (SPADCALL |x| (QREFELT $ 244))) 

(DEFUN |EXPR;airyBi;2$;84| (|x| $) (SPADCALL |x| (QREFELT $ 246))) 

(DEFUN |EXPR;airyBiPrime;2$;85| (|x| $) (SPADCALL |x| (QREFELT $ 248))) 

(DEFUN |EXPR;lambertW;2$;86| (|x| $) (SPADCALL |x| (QREFELT $ 250))) 

(DEFUN |EXPR;polylog;3$;87| (|s| |x| $) (SPADCALL |s| |x| (QREFELT $ 252))) 

(DEFUN |EXPR;weierstrassP;4$;88| (|g2| |g3| |x| $)
  (SPADCALL |g2| |g3| |x| (QREFELT $ 254))) 

(DEFUN |EXPR;weierstrassPPrime;4$;89| (|g2| |g3| |x| $)
  (SPADCALL |g2| |g3| |x| (QREFELT $ 256))) 

(DEFUN |EXPR;weierstrassSigma;4$;90| (|g2| |g3| |x| $)
  (SPADCALL |g2| |g3| |x| (QREFELT $ 258))) 

(DEFUN |EXPR;weierstrassZeta;4$;91| (|g2| |g3| |x| $)
  (SPADCALL |g2| |g3| |x| (QREFELT $ 260))) 

(DEFUN |EXPR;whittakerM;4$;92| (|k| |m| |z| $)
  (SPADCALL |k| |m| |z| (QREFELT $ 262))) 

(DEFUN |EXPR;whittakerW;4$;93| (|k| |m| |z| $)
  (SPADCALL |k| |m| |z| (QREFELT $ 264))) 

(DEFUN |EXPR;angerJ;3$;94| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 266))) 

(DEFUN |EXPR;weberE;3$;95| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 268))) 

(DEFUN |EXPR;struveH;3$;96| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 270))) 

(DEFUN |EXPR;struveL;3$;97| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 272))) 

(DEFUN |EXPR;hankelH1;3$;98| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 274))) 

(DEFUN |EXPR;hankelH2;3$;99| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 276))) 

(DEFUN |EXPR;lommelS1;4$;100| (|mu| |nu| |z| $)
  (SPADCALL |mu| |nu| |z| (QREFELT $ 278))) 

(DEFUN |EXPR;lommelS2;4$;101| (|mu| |nu| |z| $)
  (SPADCALL |mu| |nu| |z| (QREFELT $ 280))) 

(DEFUN |EXPR;kummerM;4$;102| (|mu| |nu| |z| $)
  (SPADCALL |mu| |nu| |z| (QREFELT $ 282))) 

(DEFUN |EXPR;kummerU;4$;103| (|mu| |nu| |z| $)
  (SPADCALL |mu| |nu| |z| (QREFELT $ 284))) 

(DEFUN |EXPR;legendreP;4$;104| (|nu| |mu| |z| $)
  (SPADCALL |nu| |mu| |z| (QREFELT $ 286))) 

(DEFUN |EXPR;legendreQ;4$;105| (|nu| |mu| |z| $)
  (SPADCALL |nu| |mu| |z| (QREFELT $ 288))) 

(DEFUN |EXPR;kelvinBei;3$;106| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 290))) 

(DEFUN |EXPR;kelvinBer;3$;107| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 292))) 

(DEFUN |EXPR;kelvinKei;3$;108| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 294))) 

(DEFUN |EXPR;kelvinKer;3$;109| (|v| |z| $) (SPADCALL |v| |z| (QREFELT $ 296))) 

(DEFUN |EXPR;ellipticK;2$;110| (|m| $) (SPADCALL |m| (QREFELT $ 298))) 

(DEFUN |EXPR;ellipticE;2$;111| (|m| $) (SPADCALL |m| (QREFELT $ 300))) 

(DEFUN |EXPR;ellipticE;3$;112| (|z| |m| $) (SPADCALL |z| |m| (QREFELT $ 302))) 

(DEFUN |EXPR;ellipticF;3$;113| (|z| |m| $) (SPADCALL |z| |m| (QREFELT $ 304))) 

(DEFUN |EXPR;ellipticPi;4$;114| (|z| |n| |m| $)
  (SPADCALL |z| |n| |m| (QREFELT $ 306))) 

(DEFUN |EXPR;jacobiSn;3$;115| (|z| |m| $) (SPADCALL |z| |m| (QREFELT $ 308))) 

(DEFUN |EXPR;jacobiCn;3$;116| (|z| |m| $) (SPADCALL |z| |m| (QREFELT $ 310))) 

(DEFUN |EXPR;jacobiDn;3$;117| (|z| |m| $) (SPADCALL |z| |m| (QREFELT $ 312))) 

(DEFUN |EXPR;jacobiZeta;3$;118| (|z| |m| $) (SPADCALL |z| |m| (QREFELT $ 314))) 

(DEFUN |EXPR;jacobiTheta;3$;119| (|q| |z| $) (SPADCALL |q| |z| (QREFELT $ 316))) 

(DEFUN |EXPR;lerchPhi;4$;120| (|z| |s| |a| $)
  (SPADCALL |z| |s| |a| (QREFELT $ 318))) 

(DEFUN |EXPR;riemannZeta;2$;121| (|z| $) (SPADCALL |z| (QREFELT $ 320))) 

(DEFUN |EXPR;hypergeometricF;2L2$;122| (|la| |lb| |x| $)
  (SPADCALL |la| |lb| |x| (QREFELT $ 322))) 

(DEFUN |EXPR;meijerG;4L2$;123| (|la| |lb| |lc| |ld| |x| $)
  (SPADCALL |la| |lb| |lc| |ld| |x| (QREFELT $ 325))) 

(DEFUN |EXPR;^;3$;124| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 328))) 

(DEFUN |EXPR;factorial;2$;125| (|x| $) (SPADCALL |x| (QREFELT $ 329))) 

(DEFUN |EXPR;binomial;3$;126| (|n| |m| $) (SPADCALL |n| |m| (QREFELT $ 331))) 

(DEFUN |EXPR;permutation;3$;127| (|n| |m| $) (SPADCALL |n| |m| (QREFELT $ 333))) 

(DEFUN |EXPR;factorials;2$;128| (|x| $) (SPADCALL |x| (QREFELT $ 335))) 

(DEFUN |EXPR;factorials;$S$;129| (|x| |n| $) (SPADCALL |x| |n| (QREFELT $ 337))) 

(DEFUN |EXPR;summation;$S$;130| (|x| |n| $) (SPADCALL |x| |n| (QREFELT $ 339))) 

(DEFUN |EXPR;summation;$Sb$;131| (|x| |s| $) (SPADCALL |x| |s| (QREFELT $ 342))) 

(DEFUN |EXPR;product;$S$;132| (|x| |n| $) (SPADCALL |x| |n| (QREFELT $ 345))) 

(DEFUN |EXPR;product;$Sb$;133| (|x| |s| $) (SPADCALL |x| |s| (QREFELT $ 347))) 

(DEFUN |EXPR;erf;2$;134| (|x| $) (SPADCALL |x| (QREFELT $ 350))) 

(DEFUN |EXPR;Ei;2$;135| (|x| $) (SPADCALL |x| (QREFELT $ 352))) 

(DEFUN |EXPR;Si;2$;136| (|x| $) (SPADCALL |x| (QREFELT $ 354))) 

(DEFUN |EXPR;Ci;2$;137| (|x| $) (SPADCALL |x| (QREFELT $ 356))) 

(DEFUN |EXPR;Shi;2$;138| (|x| $) (SPADCALL |x| (QREFELT $ 358))) 

(DEFUN |EXPR;Chi;2$;139| (|x| $) (SPADCALL |x| (QREFELT $ 360))) 

(DEFUN |EXPR;li;2$;140| (|x| $) (SPADCALL |x| (QREFELT $ 362))) 

(DEFUN |EXPR;dilog;2$;141| (|x| $) (SPADCALL |x| (QREFELT $ 364))) 

(DEFUN |EXPR;fresnelS;2$;142| (|x| $) (SPADCALL |x| (QREFELT $ 366))) 

(DEFUN |EXPR;fresnelC;2$;143| (|x| $) (SPADCALL |x| (QREFELT $ 368))) 

(DEFUN |EXPR;integral;$S$;144| (|x| |n| $) (SPADCALL |x| |n| (QREFELT $ 370))) 

(DEFUN |EXPR;integral;$Sb$;145| (|x| |s| $) (SPADCALL |x| |s| (QREFELT $ 372))) 

(DEFUN |EXPR;operator;2Bo;146| (|op| $)
  (PROG (|n|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |op| (QREFELT $ 374)) (SPADCALL |op| (QREFELT $ 375)))
            ((SPADCALL |op| (QREFELT $ 376)) (SPADCALL |op| (QREFELT $ 377)))
            ((SPADCALL |op| (QREFELT $ 378)) (SPADCALL |op| (QREFELT $ 379)))
            ((SPADCALL |op| (QREFELT $ 380)) (SPADCALL |op| (QREFELT $ 381)))
            ((SPADCALL |op| (QREFELT $ 382)) (SPADCALL |op| (QREFELT $ 383)))
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
  (PROG (|p| #1=#:G421 |k|)
    (RETURN
     (SEQ
      (SEQ (LETT |k| NIL . #2=(|EXPR;reduc|)) (LETT #1# |l| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ (LETT |p| (SPADCALL |k| (QREFELT $ 136)) . #2#)
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
  (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 385)) |k| (QREFELT $ 388))
            (QREFELT $ 390))) 

(DEFUN |EXPR;evl| (|p| |k| |m| $)
  (COND
   ((< (SPADCALL |p| |k| (QREFELT $ 391)) (SPADCALL |m| (QREFELT $ 392)))
    (SPADCALL |p| (QREFELT $ 385)))
   ('T
    (SPADCALL (SPADCALL (|EXPR;evl0| |p| |k| $) |m| (QREFELT $ 393))
              (SPADCALL (SPADCALL |k| (QREFELT $ 394)) (QREFELT $ 385))
              (QREFELT $ 395))))) 

(DEFUN |EXPR;noalg?| (|p| $)
  (PROG (#1=#:G429)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ G190
             (COND
              ((NULL (SPADCALL |p| (|spadConstant| $ 396) (QREFELT $ 397)))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((NULL
                  (NULL
                   (|EXPR;algkernels|
                    (SPADCALL (SPADCALL |p| (QREFELT $ 398)) (QREFELT $ 75))
                    $)))
                 (PROGN (LETT #1# 'NIL . #2=(|EXPR;noalg?|)) (GO #1#)))
                ('T (LETT |p| (SPADCALL |p| (QREFELT $ 399)) . #2#)))))
             NIL (GO G190) G191 (EXIT NIL))
        (EXIT 'T)))
      #1# (EXIT #1#))))) 

(DEFUN |EXPR;gcdPolynomial;3Sup;151| (|p| |q| $)
  (SEQ
   (COND
    ((|EXPR;noalg?| |p| $)
     (COND ((|EXPR;noalg?| |q| $) (EXIT (SPADCALL |p| |q| (QREFELT $ 400)))))))
   (EXIT (SPADCALL |p| |q| (QREFELT $ 402))))) 

(DEFUN |EXPR;factorPolynomial;SupF;152| (|x| $)
  (PROG (|uf|)
    (RETURN
     (SEQ
      (LETT |uf| (SPADCALL |x| (QREFELT $ 406))
            |EXPR;factorPolynomial;SupF;152|)
      (EXIT |uf|))))) 

(DEFUN |EXPR;squareFreePolynomial;SupF;153| (|x| $)
  (PROG (|uf|)
    (RETURN
     (SEQ
      (LETT |uf| (SPADCALL |x| (QREFELT $ 409))
            |EXPR;squareFreePolynomial;SupF;153|)
      (EXIT |uf|))))) 

(DEFUN |EXPR;coerce;An$;154| (|x| $)
  (SPADCALL (SPADCALL |x| (|spadConstant| $ 412) (QREFELT $ 413))
            (QREFELT $ 104))) 

(DEFUN |EXPR;^;$F$;155| (|x| |r| $) (SPADCALL |x| |r| (QREFELT $ 417))) 

(DEFUN |EXPR;minPoly;KSup;156| (|k| $) (SPADCALL |k| (QREFELT $ 419))) 

(DEFUN |EXPR;definingPolynomial;2$;157| (|x| $) (SPADCALL |x| (QREFELT $ 420))) 

(DEFUN |EXPR;retract;$F;158| (|x| $) (SPADCALL |x| (QREFELT $ 422))) 

(DEFUN |EXPR;retractIfCan;$U;159| (|x| $) (SPADCALL |x| (QREFELT $ 424))) 

(DEFUN |EXPR;coerce;An$;160| (|x| $)
  (SPADCALL (|EXPR;smp2expr| (SPADCALL |x| (QREFELT $ 426)) $)
            (|EXPR;smp2expr| (SPADCALL |x| (QREFELT $ 427)) $) (QREFELT $ 69))) 

(DEFUN |EXPR;k2expr| (|k| $) (SPADCALL (ELT $ 415) |k| (QREFELT $ 431))) 

(DEFUN |EXPR;smp2expr| (|p| $)
  (SPADCALL (CONS (|function| |EXPR;k2expr|) $) (ELT $ 61) |p| (QREFELT $ 436))) 

(DEFUN |EXPR;retractIfCan;$U;163| (|x| $)
  (PROG (#1=#:G456 |d| |n|)
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
                             (SPADCALL (QCDR |n|) (QCDR |d|) (QREFELT $ 437)))
                       . #2#)
                 (GO #1#))))))))))
        (EXIT (CONS 1 "failed"))))
      #1# (EXIT #1#))))) 

(DEFUN |EXPR;R2AN| (|r| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (LETT |u| (SPADCALL (SPADCALL |r| (QREFELT $ 440)) (QREFELT $ 72))
            |EXPR;R2AN|)
      (EXIT
       (COND ((QEQCAR |u| 0) (CONS 0 (SPADCALL (QCDR |u|) (QREFELT $ 441))))
             ('T (CONS 1 "failed")))))))) 

(DEFUN |EXPR;k2an| (|k| $)
  (PROG (|arg| #1=#:G491 |a| #2=#:G492 |x| |eq| |eqa| |ccu| |cc| |a1| |s1|
         |s1u| |k1| |k1u| |a2| |args| |op|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((NULL
          (SPADCALL
           (LETT |op| (SPADCALL |k| (QREFELT $ 31)) . #3=(|EXPR;k2an|))
           (QREFELT $ 442)))
         (CONS 1 "failed"))
        ('T
         (COND
          ((SPADCALL |op| '|rootOf| (QREFELT $ 443))
           (SEQ (LETT |args| (SPADCALL |k| (QREFELT $ 79)) . #3#)
                (LETT |a2| (SPADCALL |args| 2 (QREFELT $ 81)) . #3#)
                (LETT |k1u| (SPADCALL |a2| (QREFELT $ 19)) . #3#)
                (EXIT
                 (COND ((QEQCAR |k1u| 1) (CONS 1 "failed"))
                       (#4='T
                        (SEQ (LETT |k1| (QCDR |k1u|) . #3#)
                             (LETT |s1u| (SPADCALL |a2| (QREFELT $ 445)) . #3#)
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
                                              (QREFELT $ 446))
                                             (|error|
                                              "Bad argument to rootOf"))
                                            (#4#
                                             (SEQ
                                              (LETT |eq|
                                                    (SPADCALL
                                                     (SPADCALL |a1|
                                                               (QREFELT $ 99))
                                                     |k1| (QREFELT $ 123))
                                                    . #3#)
                                              (LETT |eqa|
                                                    (|spadConstant| $ 448)
                                                    . #3#)
                                              (SEQ G190
                                                   (COND
                                                    ((NULL
                                                      (SPADCALL |eq|
                                                                (|spadConstant|
                                                                 $ 449)
                                                                (QREFELT $
                                                                         450)))
                                                     (GO G191)))
                                                   (SEQ
                                                    (LETT |cc|
                                                          (SPADCALL
                                                           (SPADCALL |eq|
                                                                     (QREFELT $
                                                                              125))
                                                           (QREFELT $ 104))
                                                          . #3#)
                                                    (LETT |ccu|
                                                          (SPADCALL |cc|
                                                                    (QREFELT $
                                                                             439))
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
                                                                           451))
                                                                         (QREFELT
                                                                          $
                                                                          452))
                                                                        (QREFELT
                                                                         $
                                                                         453))
                                                              . #3#)
                                                        (EXIT
                                                         (LETT |eq|
                                                               (SPADCALL |eq|
                                                                         (QREFELT
                                                                          $
                                                                          126))
                                                               . #3#)))))))
                                                   NIL (GO G190) G191
                                                   (EXIT NIL))
                                              (EXIT
                                               (CONS 0
                                                     (SPADCALL |eqa| |s1|
                                                               (QREFELT $
                                                                        454))))))))))))))))))
          (#4#
           (SEQ (LETT |arg| NIL . #3#)
                (SEQ (LETT |x| NIL . #3#)
                     (LETT #2# (SPADCALL |k| (QREFELT $ 79)) . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ (LETT |a| (SPADCALL |x| (QREFELT $ 439)) . #3#)
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
                       (SPADCALL (SPADCALL |op| (QREFELT $ 455))
                                 (NREVERSE |arg|) (QREFELT $ 456))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |EXPR;smp2an| (|p| $)
  (PROG (|c| |up| |ans| #1=#:G506 |t| |k| |x1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |x1| (SPADCALL |p| (QREFELT $ 458)) . #2=(|EXPR;smp2an|))
            (EXIT
             (COND
              ((QEQCAR |x1| 1) (|EXPR;R2AN| (SPADCALL |p| (QREFELT $ 459)) $))
              (#3='T
               (SEQ
                (LETT |up|
                      (SPADCALL |p| (LETT |k| (QCDR |x1|) . #2#)
                                (QREFELT $ 123))
                      . #2#)
                (LETT |t| (|EXPR;k2an| |k| $) . #2#)
                (EXIT
                 (COND ((QEQCAR |t| 1) (CONS 1 "failed"))
                       (#3#
                        (SEQ (LETT |ans| (|spadConstant| $ 460) . #2#)
                             (SEQ G190
                                  (COND
                                   ((NULL
                                     (COND
                                      ((SPADCALL |up| (QREFELT $ 461)) 'NIL)
                                      ('T 'T)))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |c|
                                         (|EXPR;smp2an|
                                          (SPADCALL |up| (QREFELT $ 125)) $)
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
                                                                            451))
                                                                  (QREFELT $
                                                                           462))
                                                                 (QREFELT $
                                                                          463))
                                                       (QREFELT $ 464))
                                             . #2#)
                                       (EXIT
                                        (LETT |up|
                                              (SPADCALL |up| (QREFELT $ 126))
                                              . #2#)))))))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (LETT |c|
                                   (|EXPR;smp2an|
                                    (SPADCALL |up| (QREFELT $ 125)) $)
                                   . #2#)
                             (EXIT
                              (COND ((QEQCAR |c| 1) (CONS 1 "failed"))
                                    (#3#
                                     (CONS 0
                                           (SPADCALL |ans| (QCDR |c|)
                                                     (QREFELT $
                                                              464))))))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |EXPR;convert;$If;167| (|x| $) (SPADCALL |x| (QREFELT $ 466))) 

(DEFUN |EXPR;eval;$Bo$S$;168| (|f| |op| |g| |x| $)
  (SPADCALL |f| (LIST |op|) (LIST |g|) |x| (QREFELT $ 469))) 

(DEFUN |EXPR;eval;$LLS$;169| (|f| |ls| |lg| |x| $)
  (PROG (|res| #1=#:G537 |g| #2=#:G536 |nlg| #3=#:G535 #4=#:G534
         |lbackwardSubs| #5=#:G532 |i| #6=#:G533 |j| #7=#:G531 |lforwardSubs|
         #8=#:G529 #9=#:G530 #10=#:G528 |ns| #11=#:G527 #12=#:G526 #13=#:G525
         #14=#:G524 |lsd| |lsym| |llsym| #15=#:G523 #16=#:G522)
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
                    (LETT #16# (CONS (SPADCALL |g| (QREFELT $ 471)) #16#)
                          . #17#)))
                  (LETT #15# (CDR #15#) . #17#) (GO G190) G191
                  (EXIT (NREVERSE #16#))))
            . #17#)
      (LETT |lsym|
            (SPADCALL (SPADCALL |llsym| (QREFELT $ 472)) (QREFELT $ 473))
            . #17#)
      (LETT |lsd| (SPADCALL (ELT $ 474) |lsym| (QREFELT $ 476)) . #17#)
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
                                 (CONS (SPADCALL |g| |x| (QREFELT $ 478)) #14#)
                                 . #17#)))
                         (LETT #13# (CDR #13#) . #17#) (GO G190) G191
                         (EXIT (NREVERSE #14#))))
                   (QREFELT $ 481)))
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
                        (LETT #12# (CONS (SPADCALL (QREFELT $ 482)) #12#)
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
                               (SPADCALL (SPADCALL |i| (QREFELT $ 483))
                                         (SPADCALL |j| (QREFELT $ 483))
                                         (QREFELT $ 485))
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
                               (SPADCALL (SPADCALL |j| (QREFELT $ 483))
                                         (SPADCALL |i| (QREFELT $ 483))
                                         (QREFELT $ 485))
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
                               (SPADCALL |g| |lforwardSubs| (QREFELT $ 487))
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
                                         (SPADCALL |g| |x| (QREFELT $ 478))
                                         #2#)
                                        . #17#)))
                                (LETT #1# (CDR #1#) . #17#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 481))
                . #17#)
          (EXIT (SPADCALL |res| |lbackwardSubs| (QREFELT $ 487))))))))))) 

(DEFUN |EXPR;patternMatch;$P2Pmr;170| (|x| |p| |l| $)
  (SPADCALL |x| |p| |l| (QREFELT $ 491))) 

(DEFUN |EXPR;patternMatch;$P2Pmr;171| (|x| |p| |l| $)
  (SPADCALL |x| |p| |l| (QREFELT $ 497))) 

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

(DEFUN |EXPR;reducedSystem;MM;183| (|m| $) (SPADCALL |m| (QREFELT $ 500))) 

(DEFUN |EXPR;reducedSystem;MVR;184| (|m| |v| $)
  (SPADCALL |m| |v| (QREFELT $ 501))) 

(DEFUN |EXPR;convert;$If;185| (|x| $) (SPADCALL |x| (QREFELT $ 466))) 

(DEFUN |EXPR;kintmatch| (|k| |p| |l| $) (SPADCALL |k| |p| |l| (QREFELT $ 503))) 

(DEFUN |EXPR;patternMatch;$P2Pmr;187| (|x| |p| |l| $)
  (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kintmatch|) $) (QREFELT $ 507))) 

(DEFUN |EXPR;kfltmatch| (|k| |p| |l| $) (SPADCALL |k| |p| |l| (QREFELT $ 509))) 

(DEFUN |EXPR;patternMatch;$P2Pmr;189| (|x| |p| |l| $)
  (SPADCALL |x| |p| |l| (CONS (|function| |EXPR;kfltmatch|) $) (QREFELT $ 513))) 

(DEFUN |EXPR;Zero;$;190| ($) (|spadConstant| $ 46)) 

(DEFUN |EXPR;+;3$;191| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 64))) 

(DEFUN |EXPR;=;2$B;192| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 51))) 

(DEFUN |EXPR;smaller?;2$B;193| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 94))) 

(DEFUN |EXPR;coerce;K$;194| (|k| $) (SPADCALL |k| (QREFELT $ 514))) 

(DEFUN |EXPR;kernels;$L;195| (|x| $)
  (PROG (#1=#:G574 |f| #2=#:G573)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|EXPR;kernels;$L;195|))
       (SEQ (LETT |f| NIL . #3#)
            (LETT #1# (SPADCALL |x| (QREFELT $ 517)) . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ (EXIT (LETT #2# (CONS (QCAR |f|) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |EXPR;coerce;R$;196| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 518)) (|spadConstant| $ 47))
        ('T (SPADCALL (SPADCALL |x| (QREFELT $ 519)) (QREFELT $ 140))))) 

(DEFUN |EXPR;retract;$R;197| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 54)) (|spadConstant| $ 87))
        ('T (|EXPR;retNotUnit| |x| $)))) 

(DEFUN |EXPR;coerce;$Of;198| (|x| $) (SPADCALL |x| (QREFELT $ 522))) 

(DEFUN |EXPR;kereval| (|k| |lk| |lv| $)
  (PROG ()
    (RETURN
     (SPADCALL |lk| |lv| |k| (CONS #'|EXPR;kereval!1| (VECTOR |lk| |lv| $))
               (QREFELT $ 528))))) 

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
                   (QREFELT $ 525)))))))) 

(DEFUN |EXPR;kereval!0| (|x1| $$)
  (PROG (|lk| |lv| $)
    (LETT |lk| (QREFELT $$ 2) NIL)
    (LETT |lv| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x1| |lk| |lv| (QREFELT $ 524)))))) 

(DEFUN |EXPR;subeval| (|k| |lk| |lv| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL |lk| |lv| |k| (CONS #'|EXPR;subeval!0| (VECTOR |lv| |lk| $))
                (QREFELT $ 528)))))) 

(DEFUN |EXPR;subeval!0| (|x| $$)
  (PROG ($ |lk| |lv|)
    (LETT $ (QREFELT $$ 2) . #1=(|EXPR;subeval|))
    (LETT |lk| (QREFELT $$ 1) . #1#)
    (LETT |lv| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G598 |a| #3=#:G597)
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
                                   (SPADCALL |a| |lk| |lv| (QREFELT $ 529))
                                   #3#)
                                  NIL)))
                          (LETT #2# (CDR #2#) NIL) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    (QREFELT $ 530))))))))) 

(DEFUN |EXPR;isPlus;$U;201| (|x| $)
  (PROG (#1=#:G613 |t| #2=#:G612 |l|)
    (RETURN
     (SEQ
      (COND
       ((OR
         (NULL
          (LETT |l| (SPADCALL |x| (QREFELT $ 517))
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
                             (SPADCALL (QCDR |t|) (QCAR |t|) (QREFELT $ 531))
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
          (LETT |l| (SPADCALL |x| (QREFELT $ 517))
                . #1=(|EXPR;isMult;$U;202|)))
         (NULL (NULL (CDR |l|))))
        (CONS 1 "failed"))
       ('T
        (SEQ (LETT |t| (SPADCALL |l| (QREFELT $ 534)) . #1#)
             (EXIT (CONS 0 (CONS (QCDR |t|) (QCAR |t|))))))))))) 

(DEFUN |EXPR;eval;$LL$;203| (|x| |lk| |lv| $)
  (PROG (#1=#:G629 #2=#:G628 #3=#:G630 #4=#:G632 |t|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|EXPR;eval;$LL$;203|))
       (SEQ (LETT |t| NIL . #5#)
            (LETT #4# (SPADCALL |x| (QREFELT $ 517)) . #5#) G190
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
  (PROG (#1=#:G635 #2=#:G634 #3=#:G636 #4=#:G638 |t|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|EXPR;subst;$LL$;204|))
       (SEQ (LETT |t| NIL . #5#)
            (LETT #4# (SPADCALL |x| (QREFELT $ 517)) . #5#) G190
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

(DEFUN |EXPR;coerce;R$;211| (|x| $) (SPADCALL |x| (QREFELT $ 519))) 

(DEFUN |EXPR;retract;$R;212| (|x| $) (|EXPR;retNotUnit| |x| $)) 

(DEFUN |EXPR;retractIfCan;$U;213| (|x| $) (|EXPR;retNotUnitIfCan| |x| $)) 

(DEFUN |EXPR;coerce;$Of;214| (|x| $) (SPADCALL |x| (QREFELT $ 522))) 

(DEFUN |EXPR;eval;$LL$;215| (|x| |lk| |lv| $)
  (PROG ()
    (RETURN
     (SPADCALL |lk| |lv| |x|
               (CONS #'|EXPR;eval;$LL$;215!1| (VECTOR |lk| |lv| $))
               (QREFELT $ 528))))) 

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
                   (QREFELT $ 525)))))))) 

(DEFUN |EXPR;eval;$LL$;215!0| (|x2| $$)
  (PROG (|lk| |lv| $)
    (LETT |lk| (QREFELT $$ 2) NIL)
    (LETT |lv| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x2| |lk| |lv| (QREFELT $ 524)))))) 

(DEFUN |EXPR;subst;$LL$;216| (|x| |lk| |lv| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL |lk| |lv| |x|
                (CONS #'|EXPR;subst;$LL$;216!0| (VECTOR |lv| |lk| $))
                (QREFELT $ 528)))))) 

(DEFUN |EXPR;subst;$LL$;216!0| (|x1| $$)
  (PROG ($ |lk| |lv|)
    (LETT $ (QREFELT $$ 2) . #1=(|EXPR;subst;$LL$;216|))
    (LETT |lk| (QREFELT $$ 1) . #1#)
    (LETT |lv| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G674 |a| #3=#:G673)
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
                                   (SPADCALL |a| |lk| |lv| (QREFELT $ 529))
                                   #3#)
                                  NIL)))
                          (LETT #2# (CDR #2#) NIL) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    (QREFELT $ 530))))))))) 

(DEFUN |EXPR;convert;$If;217| (|x| $) (SPADCALL |x| (QREFELT $ 466))) 

(DEFUN |Expression| (#1=#:G714)
  (PROG ()
    (RETURN
     (PROG (#2=#:G715)
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
  (PROG (|pv$| #1=#:G709 #2=#:G710 #3=#:G711 #4=#:G712 #5=#:G713 $ |dv$| DV$1)
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
            (QSETREFV $ 131
                      (CONS
                       (|dispatchFunction| |EXPR;getSimplifyDenomsFlag;B;37|)
                       $))
            (QSETREFV $ 132
                      (CONS
                       (|dispatchFunction| |EXPR;setSimplifyDenomsFlag;2B;38|)
                       $))
            (QSETREFV $ 143 (CONS (|dispatchFunction| |EXPR;/;2Smp$;40|) $))
            (QSETREFV $ 152
                      (CONS (|dispatchFunction| |EXPR;reducedSystem;MM;41|) $))
            (QSETREFV $ 160
                      (CONS (|dispatchFunction| |EXPR;reducedSystem;MVR;42|)
                            $))
            (QSETREFV $ 165
                      (CONS (|dispatchFunction| |EXPR;rootOf;SupS$;44|) $))
            (QSETREFV $ 168 (CONS (|dispatchFunction| |EXPR;pi;$;45|) $))
            (QSETREFV $ 170 (CONS (|dispatchFunction| |EXPR;exp;2$;46|) $))
            (QSETREFV $ 172 (CONS (|dispatchFunction| |EXPR;log;2$;47|) $))
            (QSETREFV $ 174 (CONS (|dispatchFunction| |EXPR;sin;2$;48|) $))
            (QSETREFV $ 176 (CONS (|dispatchFunction| |EXPR;cos;2$;49|) $))
            (QSETREFV $ 178 (CONS (|dispatchFunction| |EXPR;tan;2$;50|) $))
            (QSETREFV $ 180 (CONS (|dispatchFunction| |EXPR;cot;2$;51|) $))
            (QSETREFV $ 182 (CONS (|dispatchFunction| |EXPR;sec;2$;52|) $))
            (QSETREFV $ 184 (CONS (|dispatchFunction| |EXPR;csc;2$;53|) $))
            (QSETREFV $ 186 (CONS (|dispatchFunction| |EXPR;asin;2$;54|) $))
            (QSETREFV $ 188 (CONS (|dispatchFunction| |EXPR;acos;2$;55|) $))
            (QSETREFV $ 190 (CONS (|dispatchFunction| |EXPR;atan;2$;56|) $))
            (QSETREFV $ 192 (CONS (|dispatchFunction| |EXPR;acot;2$;57|) $))
            (QSETREFV $ 194 (CONS (|dispatchFunction| |EXPR;asec;2$;58|) $))
            (QSETREFV $ 196 (CONS (|dispatchFunction| |EXPR;acsc;2$;59|) $))
            (QSETREFV $ 198 (CONS (|dispatchFunction| |EXPR;sinh;2$;60|) $))
            (QSETREFV $ 200 (CONS (|dispatchFunction| |EXPR;cosh;2$;61|) $))
            (QSETREFV $ 202 (CONS (|dispatchFunction| |EXPR;tanh;2$;62|) $))
            (QSETREFV $ 204 (CONS (|dispatchFunction| |EXPR;coth;2$;63|) $))
            (QSETREFV $ 206 (CONS (|dispatchFunction| |EXPR;sech;2$;64|) $))
            (QSETREFV $ 208 (CONS (|dispatchFunction| |EXPR;csch;2$;65|) $))
            (QSETREFV $ 210 (CONS (|dispatchFunction| |EXPR;asinh;2$;66|) $))
            (QSETREFV $ 212 (CONS (|dispatchFunction| |EXPR;acosh;2$;67|) $))
            (QSETREFV $ 214 (CONS (|dispatchFunction| |EXPR;atanh;2$;68|) $))
            (QSETREFV $ 216 (CONS (|dispatchFunction| |EXPR;acoth;2$;69|) $))
            (QSETREFV $ 218 (CONS (|dispatchFunction| |EXPR;asech;2$;70|) $))
            (QSETREFV $ 220 (CONS (|dispatchFunction| |EXPR;acsch;2$;71|) $))
            (QSETREFV $ 223 (CONS (|dispatchFunction| |EXPR;abs;2$;72|) $))
            (QSETREFV $ 225 (CONS (|dispatchFunction| |EXPR;Gamma;2$;73|) $))
            (QSETREFV $ 227 (CONS (|dispatchFunction| |EXPR;Gamma;3$;74|) $))
            (QSETREFV $ 229 (CONS (|dispatchFunction| |EXPR;Beta;3$;75|) $))
            (QSETREFV $ 231 (CONS (|dispatchFunction| |EXPR;digamma;2$;76|) $))
            (QSETREFV $ 233
                      (CONS (|dispatchFunction| |EXPR;polygamma;3$;77|) $))
            (QSETREFV $ 235 (CONS (|dispatchFunction| |EXPR;besselJ;3$;78|) $))
            (QSETREFV $ 237 (CONS (|dispatchFunction| |EXPR;besselY;3$;79|) $))
            (QSETREFV $ 239 (CONS (|dispatchFunction| |EXPR;besselI;3$;80|) $))
            (QSETREFV $ 241 (CONS (|dispatchFunction| |EXPR;besselK;3$;81|) $))
            (QSETREFV $ 243 (CONS (|dispatchFunction| |EXPR;airyAi;2$;82|) $))
            (QSETREFV $ 245
                      (CONS (|dispatchFunction| |EXPR;airyAiPrime;2$;83|) $))
            (QSETREFV $ 247 (CONS (|dispatchFunction| |EXPR;airyBi;2$;84|) $))
            (QSETREFV $ 249
                      (CONS (|dispatchFunction| |EXPR;airyBiPrime;2$;85|) $))
            (QSETREFV $ 251
                      (CONS (|dispatchFunction| |EXPR;lambertW;2$;86|) $))
            (QSETREFV $ 253 (CONS (|dispatchFunction| |EXPR;polylog;3$;87|) $))
            (QSETREFV $ 255
                      (CONS (|dispatchFunction| |EXPR;weierstrassP;4$;88|) $))
            (QSETREFV $ 257
                      (CONS (|dispatchFunction| |EXPR;weierstrassPPrime;4$;89|)
                            $))
            (QSETREFV $ 259
                      (CONS (|dispatchFunction| |EXPR;weierstrassSigma;4$;90|)
                            $))
            (QSETREFV $ 261
                      (CONS (|dispatchFunction| |EXPR;weierstrassZeta;4$;91|)
                            $))
            (QSETREFV $ 263
                      (CONS (|dispatchFunction| |EXPR;whittakerM;4$;92|) $))
            (QSETREFV $ 265
                      (CONS (|dispatchFunction| |EXPR;whittakerW;4$;93|) $))
            (QSETREFV $ 267 (CONS (|dispatchFunction| |EXPR;angerJ;3$;94|) $))
            (QSETREFV $ 269 (CONS (|dispatchFunction| |EXPR;weberE;3$;95|) $))
            (QSETREFV $ 271 (CONS (|dispatchFunction| |EXPR;struveH;3$;96|) $))
            (QSETREFV $ 273 (CONS (|dispatchFunction| |EXPR;struveL;3$;97|) $))
            (QSETREFV $ 275
                      (CONS (|dispatchFunction| |EXPR;hankelH1;3$;98|) $))
            (QSETREFV $ 277
                      (CONS (|dispatchFunction| |EXPR;hankelH2;3$;99|) $))
            (QSETREFV $ 279
                      (CONS (|dispatchFunction| |EXPR;lommelS1;4$;100|) $))
            (QSETREFV $ 281
                      (CONS (|dispatchFunction| |EXPR;lommelS2;4$;101|) $))
            (QSETREFV $ 283
                      (CONS (|dispatchFunction| |EXPR;kummerM;4$;102|) $))
            (QSETREFV $ 285
                      (CONS (|dispatchFunction| |EXPR;kummerU;4$;103|) $))
            (QSETREFV $ 287
                      (CONS (|dispatchFunction| |EXPR;legendreP;4$;104|) $))
            (QSETREFV $ 289
                      (CONS (|dispatchFunction| |EXPR;legendreQ;4$;105|) $))
            (QSETREFV $ 291
                      (CONS (|dispatchFunction| |EXPR;kelvinBei;3$;106|) $))
            (QSETREFV $ 293
                      (CONS (|dispatchFunction| |EXPR;kelvinBer;3$;107|) $))
            (QSETREFV $ 295
                      (CONS (|dispatchFunction| |EXPR;kelvinKei;3$;108|) $))
            (QSETREFV $ 297
                      (CONS (|dispatchFunction| |EXPR;kelvinKer;3$;109|) $))
            (QSETREFV $ 299
                      (CONS (|dispatchFunction| |EXPR;ellipticK;2$;110|) $))
            (QSETREFV $ 301
                      (CONS (|dispatchFunction| |EXPR;ellipticE;2$;111|) $))
            (QSETREFV $ 303
                      (CONS (|dispatchFunction| |EXPR;ellipticE;3$;112|) $))
            (QSETREFV $ 305
                      (CONS (|dispatchFunction| |EXPR;ellipticF;3$;113|) $))
            (QSETREFV $ 307
                      (CONS (|dispatchFunction| |EXPR;ellipticPi;4$;114|) $))
            (QSETREFV $ 309
                      (CONS (|dispatchFunction| |EXPR;jacobiSn;3$;115|) $))
            (QSETREFV $ 311
                      (CONS (|dispatchFunction| |EXPR;jacobiCn;3$;116|) $))
            (QSETREFV $ 313
                      (CONS (|dispatchFunction| |EXPR;jacobiDn;3$;117|) $))
            (QSETREFV $ 315
                      (CONS (|dispatchFunction| |EXPR;jacobiZeta;3$;118|) $))
            (QSETREFV $ 317
                      (CONS (|dispatchFunction| |EXPR;jacobiTheta;3$;119|) $))
            (QSETREFV $ 319
                      (CONS (|dispatchFunction| |EXPR;lerchPhi;4$;120|) $))
            (QSETREFV $ 321
                      (CONS (|dispatchFunction| |EXPR;riemannZeta;2$;121|) $))
            (COND
             ((|testBitVector| |pv$| 31)
              (PROGN
               (QSETREFV $ 324
                         (CONS
                          (|dispatchFunction| |EXPR;hypergeometricF;2L2$;122|)
                          (|getDomainView| $ '(|RetractableTo| (|Integer|)))))
               (QSETREFV $ 326
                         (CONS (|dispatchFunction| |EXPR;meijerG;4L2$;123|)
                               (|getDomainView| $
                                                '(|RetractableTo|
                                                  (|Integer|))))))))
            (QSETREFV $ 83 (CONS (|dispatchFunction| |EXPR;^;3$;124|) $))
            (QSETREFV $ 330
                      (CONS (|dispatchFunction| |EXPR;factorial;2$;125|) $))
            (QSETREFV $ 332
                      (CONS (|dispatchFunction| |EXPR;binomial;3$;126|) $))
            (QSETREFV $ 334
                      (CONS (|dispatchFunction| |EXPR;permutation;3$;127|) $))
            (QSETREFV $ 336
                      (CONS (|dispatchFunction| |EXPR;factorials;2$;128|) $))
            (QSETREFV $ 338
                      (CONS (|dispatchFunction| |EXPR;factorials;$S$;129|) $))
            (QSETREFV $ 340
                      (CONS (|dispatchFunction| |EXPR;summation;$S$;130|) $))
            (QSETREFV $ 344
                      (CONS (|dispatchFunction| |EXPR;summation;$Sb$;131|) $))
            (QSETREFV $ 346
                      (CONS (|dispatchFunction| |EXPR;product;$S$;132|) $))
            (QSETREFV $ 348
                      (CONS (|dispatchFunction| |EXPR;product;$Sb$;133|) $))
            (QSETREFV $ 351 (CONS (|dispatchFunction| |EXPR;erf;2$;134|) $))
            (QSETREFV $ 353 (CONS (|dispatchFunction| |EXPR;Ei;2$;135|) $))
            (QSETREFV $ 355 (CONS (|dispatchFunction| |EXPR;Si;2$;136|) $))
            (QSETREFV $ 357 (CONS (|dispatchFunction| |EXPR;Ci;2$;137|) $))
            (QSETREFV $ 359 (CONS (|dispatchFunction| |EXPR;Shi;2$;138|) $))
            (QSETREFV $ 361 (CONS (|dispatchFunction| |EXPR;Chi;2$;139|) $))
            (QSETREFV $ 363 (CONS (|dispatchFunction| |EXPR;li;2$;140|) $))
            (QSETREFV $ 365 (CONS (|dispatchFunction| |EXPR;dilog;2$;141|) $))
            (QSETREFV $ 367
                      (CONS (|dispatchFunction| |EXPR;fresnelS;2$;142|) $))
            (QSETREFV $ 369
                      (CONS (|dispatchFunction| |EXPR;fresnelC;2$;143|) $))
            (QSETREFV $ 371
                      (CONS (|dispatchFunction| |EXPR;integral;$S$;144|) $))
            (QSETREFV $ 373
                      (CONS (|dispatchFunction| |EXPR;integral;$Sb$;145|) $))
            (QSETREFV $ 37
                      (CONS (|dispatchFunction| |EXPR;operator;2Bo;146|) $))
            (COND
             ((|HasCategory| |#1| '(|GcdDomain|))
              (PROGN
               (QSETREFV $ 403
                         (CONS
                          (|dispatchFunction| |EXPR;gcdPolynomial;3Sup;151|)
                          $))
               (QSETREFV $ 408
                         (CONS
                          (|dispatchFunction| |EXPR;factorPolynomial;SupF;152|)
                          $))
               (QSETREFV $ 410
                         (CONS
                          (|dispatchFunction|
                           |EXPR;squareFreePolynomial;SupF;153|)
                          $)))))
            (COND
             ((|domainEqual| |#1| (|AlgebraicNumber|))
              (QSETREFV $ 415
                        (CONS (|dispatchFunction| |EXPR;coerce;An$;154|) $))))
            (COND
             ((|testBitVector| |pv$| 14)
              (PROGN
               (QSETREFV $ 418 (CONS (|dispatchFunction| |EXPR;^;$F$;155|) $))
               (QSETREFV $ 136
                         (CONS (|dispatchFunction| |EXPR;minPoly;KSup;156|) $))
               (QSETREFV $ 421
                         (CONS
                          (|dispatchFunction| |EXPR;definingPolynomial;2$;157|)
                          $))
               (QSETREFV $ 423
                         (CONS (|dispatchFunction| |EXPR;retract;$F;158|) $))
               (QSETREFV $ 72
                         (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;159|)
                               $))
               (COND ((|domainEqual| |#1| (|AlgebraicNumber|)))
                     ('T
                      (PROGN
                       (QSETREFV $ 415
                                 (CONS
                                  (|dispatchFunction| |EXPR;coerce;An$;160|)
                                  $))
                       (QSETREFV $ 439
                                 (CONS
                                  (|dispatchFunction|
                                   |EXPR;retractIfCan;$U;163|)
                                  $))))))))
            (COND
             ((|testBitVector| |pv$| 9)
              (PROGN
               (QSETREFV $ 467
                         (CONS (|dispatchFunction| |EXPR;convert;$If;167|) $))
               (QSETREFV $ 470
                         (CONS (|dispatchFunction| |EXPR;eval;$Bo$S$;168|) $))
               (QSETREFV $ 469
                         (CONS (|dispatchFunction| |EXPR;eval;$LLS$;169|)
                               $)))))
            (COND
             ((|testBitVector| |pv$| 13)
              (QSETREFV $ 493
                        (CONS
                         (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;170|)
                         $))))
            (COND
             ((|testBitVector| |pv$| 12)
              (QSETREFV $ 499
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
            (QSETREFV $ 152
                      (CONS (|dispatchFunction| |EXPR;reducedSystem;MM;183|)
                            $))
            (QSETREFV $ 160
                      (CONS (|dispatchFunction| |EXPR;reducedSystem;MVR;184|)
                            $))
            (COND
             ((|testBitVector| |pv$| 9)
              (QSETREFV $ 467
                        (CONS (|dispatchFunction| |EXPR;convert;$If;185|) $))))
            (COND
             ((|testBitVector| |pv$| 13)
              (PROGN
               (QSETREFV $ 493
                         (CONS
                          (|dispatchFunction| |EXPR;patternMatch;$P2Pmr;187|)
                          $)))))
            (COND
             ((|testBitVector| |pv$| 12)
              (PROGN
               (QSETREFV $ 499
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
         (QSETREFV $ 140 (CONS (|dispatchFunction| |EXPR;coerce;K$;194|) $))
         (QSETREFV $ 75 (CONS (|dispatchFunction| |EXPR;kernels;$L;195|) $))
         (QSETREFV $ 440 (CONS (|dispatchFunction| |EXPR;coerce;R$;196|) $))
         (QSETREFV $ 520 (CONS (|dispatchFunction| |EXPR;retract;$R;197|) $))
         (QSETREFV $ 523 (CONS (|dispatchFunction| |EXPR;coerce;$Of;198|) $))
         (QSETREFV $ 533 (CONS (|dispatchFunction| |EXPR;isPlus;$U;201|) $))
         (QSETREFV $ 537 (CONS (|dispatchFunction| |EXPR;isMult;$U;202|) $))
         (QSETREFV $ 524 (CONS (|dispatchFunction| |EXPR;eval;$LL$;203|) $))
         (QSETREFV $ 529 (CONS (|dispatchFunction| |EXPR;subst;$LL$;204|) $))
         (QSETREFV $ 538
                   (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;205|) $))
         (COND
          ((|testBitVector| |pv$| 19)
           (QSETREFV $ 56 (CONS (|dispatchFunction| |EXPR;-;2$;206|) $))))))
       ('T
        (PROGN
         (SETELT $ 45 (|Kernel| $))
         (QSETREFV $ 95 (CONS (|dispatchFunction| |EXPR;smaller?;2$B;207|) $))
         (QSETREFV $ 96 (CONS (|dispatchFunction| |EXPR;=;2$B;208|) $))
         (QSETREFV $ 140 (CONS (|dispatchFunction| |EXPR;coerce;K$;209|) $))
         (QSETREFV $ 75 (CONS (|dispatchFunction| |EXPR;kernels;$L;210|) $))
         (QSETREFV $ 440 (CONS (|dispatchFunction| |EXPR;coerce;R$;211|) $))
         (QSETREFV $ 520 (CONS (|dispatchFunction| |EXPR;retract;$R;212|) $))
         (QSETREFV $ 538
                   (CONS (|dispatchFunction| |EXPR;retractIfCan;$U;213|) $))
         (QSETREFV $ 523 (CONS (|dispatchFunction| |EXPR;coerce;$Of;214|) $))
         (QSETREFV $ 524 (CONS (|dispatchFunction| |EXPR;eval;$LL$;215|) $))
         (QSETREFV $ 529 (CONS (|dispatchFunction| |EXPR;subst;$LL$;216|) $))
         (COND
          ((|testBitVector| |pv$| 9)
           (QSETREFV $ 467
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
              (|Union| 416 '#1#) (220 . |retractIfCan|) (225 . |number?|)
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
              (|AlgebraicManipulations| 6 $$) (400 . |ratDenom|) (406 . |is?|)
              (412 . |cons|) (418 . =) (424 . |sort!|) (429 . ~=) (435 . >)
              (|SparseUnivariatePolynomial| $) (441 . |univariate|)
              (|SparseUnivariatePolynomial| 41) (447 . |leadingCoefficient|)
              (452 . |reductum|) (457 . *) (463 . |monomial|) (470 . -)
              (476 . /) (482 . |getSimplifyDenomsFlag|)
              (486 . |setSimplifyDenomsFlag|) (491 . |elt|)
              (|SingletonAsOrderedSet|) (497 . |create|) (501 . |minPoly|)
              (|SparseUnivariatePolynomial| $$)
              (|PolynomialCategoryQuotientFunctions| 411 15 6 41 $$)
              (506 . |univariate|) (513 . |coerce|) (518 . |eval|)
              (525 . |retract|) (530 . /) (|Mapping| $$ $$) (|Matrix| $$)
              (536 . |map|) (|Matrix| 41) (|Matrix| $) (542 . |reducedSystem|)
              (|Matrix| 6) (547 . |reducedSystem|) (552 . |reducedSystem|)
              (|Vector| $$) (557 . |map|)
              (|Record| (|:| |mat| 147) (|:| |vec| (|Vector| 41))) (|Vector| $)
              (563 . |reducedSystem|)
              (|Record| (|:| |mat| 150) (|:| |vec| (|Vector| 6)))
              (569 . |reducedSystem|) (575 . |reducedSystem|) (581 . |member?|)
              (587 . |concat|) (|AlgebraicFunction| 6 $$) (593 . |rootOf|)
              (599 . |rootOf|) (|ElementaryFunction| 6 $$) (605 . |pi|)
              (609 . |pi|) (613 . |exp|) (618 . |exp|) (623 . |log|)
              (628 . |log|) (633 . |sin|) (638 . |sin|) (643 . |cos|)
              (648 . |cos|) (653 . |tan|) (658 . |tan|) (663 . |cot|)
              (668 . |cot|) (673 . |sec|) (678 . |sec|) (683 . |csc|)
              (688 . |csc|) (693 . |asin|) (698 . |asin|) (703 . |acos|)
              (708 . |acos|) (713 . |atan|) (718 . |atan|) (723 . |acot|)
              (728 . |acot|) (733 . |asec|) (738 . |asec|) (743 . |acsc|)
              (748 . |acsc|) (753 . |sinh|) (758 . |sinh|) (763 . |cosh|)
              (768 . |cosh|) (773 . |tanh|) (778 . |tanh|) (783 . |coth|)
              (788 . |coth|) (793 . |sech|) (798 . |sech|) (803 . |csch|)
              (808 . |csch|) (813 . |asinh|) (818 . |asinh|) (823 . |acosh|)
              (828 . |acosh|) (833 . |atanh|) (838 . |atanh|) (843 . |acoth|)
              (848 . |acoth|) (853 . |asech|) (858 . |asech|) (863 . |acsch|)
              (868 . |acsch|) (|FunctionalSpecialFunction| 6 $$) (873 . |abs|)
              (878 . |abs|) (883 . |Gamma|) (888 . |Gamma|) (893 . |Gamma|)
              (899 . |Gamma|) (905 . |Beta|) (911 . |Beta|) (917 . |digamma|)
              (922 . |digamma|) (927 . |polygamma|) (933 . |polygamma|)
              (939 . |besselJ|) (945 . |besselJ|) (951 . |besselY|)
              (957 . |besselY|) (963 . |besselI|) (969 . |besselI|)
              (975 . |besselK|) (981 . |besselK|) (987 . |airyAi|)
              (992 . |airyAi|) (997 . |airyAiPrime|) (1002 . |airyAiPrime|)
              (1007 . |airyBi|) (1012 . |airyBi|) (1017 . |airyBiPrime|)
              (1022 . |airyBiPrime|) (1027 . |lambertW|) (1032 . |lambertW|)
              (1037 . |polylog|) (1043 . |polylog|) (1049 . |weierstrassP|)
              (1056 . |weierstrassP|) (1063 . |weierstrassPPrime|)
              (1070 . |weierstrassPPrime|) (1077 . |weierstrassSigma|)
              (1084 . |weierstrassSigma|) (1091 . |weierstrassZeta|)
              (1098 . |weierstrassZeta|) (1105 . |whittakerM|)
              (1112 . |whittakerM|) (1119 . |whittakerW|) (1126 . |whittakerW|)
              (1133 . |angerJ|) (1139 . |angerJ|) (1145 . |weberE|)
              (1151 . |weberE|) (1157 . |struveH|) (1163 . |struveH|)
              (1169 . |struveL|) (1175 . |struveL|) (1181 . |hankelH1|)
              (1187 . |hankelH1|) (1193 . |hankelH2|) (1199 . |hankelH2|)
              (1205 . |lommelS1|) (1212 . |lommelS1|) (1219 . |lommelS2|)
              (1226 . |lommelS2|) (1233 . |kummerM|) (1240 . |kummerM|)
              (1247 . |kummerU|) (1254 . |kummerU|) (1261 . |legendreP|)
              (1268 . |legendreP|) (1275 . |legendreQ|) (1282 . |legendreQ|)
              (1289 . |kelvinBei|) (1295 . |kelvinBei|) (1301 . |kelvinBer|)
              (1307 . |kelvinBer|) (1313 . |kelvinKei|) (1319 . |kelvinKei|)
              (1325 . |kelvinKer|) (1331 . |kelvinKer|) (1337 . |ellipticK|)
              (1342 . |ellipticK|) (1347 . |ellipticE|) (1352 . |ellipticE|)
              (1357 . |ellipticE|) (1363 . |ellipticE|) (1369 . |ellipticF|)
              (1375 . |ellipticF|) (1381 . |ellipticPi|) (1388 . |ellipticPi|)
              (1395 . |jacobiSn|) (1401 . |jacobiSn|) (1407 . |jacobiCn|)
              (1413 . |jacobiCn|) (1419 . |jacobiDn|) (1425 . |jacobiDn|)
              (1431 . |jacobiZeta|) (1437 . |jacobiZeta|)
              (1443 . |jacobiTheta|) (1449 . |jacobiTheta|) (1455 . |lerchPhi|)
              (1462 . |lerchPhi|) (1469 . |riemannZeta|) (1474 . |riemannZeta|)
              (1479 . |hypergeometricF|) (|List| $) (1486 . |hypergeometricF|)
              (1493 . |meijerG|) (1502 . |meijerG|)
              (|CombinatorialFunction| 6 $$) (1511 . ^) (1517 . |factorial|)
              (1522 . |factorial|) (1527 . |binomial|) (1533 . |binomial|)
              (1539 . |permutation|) (1545 . |permutation|)
              (1551 . |factorials|) (1556 . |factorials|) (1561 . |factorials|)
              (1567 . |factorials|) (1573 . |summation|) (1579 . |summation|)
              (|SegmentBinding| $$) (1585 . |summation|) (|SegmentBinding| $)
              (1591 . |summation|) (1597 . |product|) (1603 . |product|)
              (1609 . |product|) (1615 . |product|)
              (|LiouvillianFunction| 6 $$) (1621 . |erf|) (1626 . |erf|)
              (1631 . |Ei|) (1636 . |Ei|) (1641 . |Si|) (1646 . |Si|)
              (1651 . |Ci|) (1656 . |Ci|) (1661 . |Shi|) (1666 . |Shi|)
              (1671 . |Chi|) (1676 . |Chi|) (1681 . |li|) (1686 . |li|)
              (1691 . |dilog|) (1696 . |dilog|) (1701 . |fresnelS|)
              (1706 . |fresnelS|) (1711 . |fresnelC|) (1716 . |fresnelC|)
              (1721 . |integral|) (1727 . |integral|) (1733 . |integral|)
              (1739 . |integral|) (1745 . |belong?|) (1750 . |operator|)
              (1755 . |belong?|) (1760 . |operator|) (1765 . |belong?|)
              (1770 . |operator|) (1775 . |belong?|) (1780 . |operator|)
              (1785 . |belong?|) (1790 . |operator|) (|Fraction| 41)
              (1795 . |coerce|) (|Fraction| 389)
              (|PolynomialCategoryQuotientFunctions| 411 15 6 41 384)
              (1800 . |univariate|) (|SparseUnivariatePolynomial| 384)
              (1806 . |numer|) (1811 . |degree|) (1817 . |degree|)
              (1822 . |rem|) (1828 . |coerce|) (1833 . |elt|) (1839 . |Zero|)
              (1843 . ~=) (1849 . |leadingCoefficient|) (1854 . |reductum|)
              (1859 . |gcdPolynomial|) (|GcdDomain&| $$)
              (1865 . |gcdPolynomial|) (1871 . |gcdPolynomial|)
              (|Factored| 389) (|SupFractionFactorizer| 411 15 6 41)
              (1877 . |factor|) (|Factored| 122) (1882 . |factorPolynomial|)
              (1887 . |squareFree|) (1892 . |squareFreePolynomial|)
              (|IndexedExponents| 15) (1897 . |Zero|) (1901 . |monomial|)
              (|AlgebraicNumber|) (1907 . |coerce|) (|Fraction| 57) (1912 . ^)
              (1918 . ^) (1924 . |minPoly|) (1929 . |definingPolynomial|)
              (1934 . |definingPolynomial|) (1939 . |retract|)
              (1944 . |retract|) (1949 . |retractIfCan|)
              (|SparseMultivariatePolynomial| 57 12) (1954 . |numer|)
              (1959 . |denom|) (|Mapping| $$ 414) (|Kernel| 414)
              (|ExpressionSpaceFunctions2| 414 $$) (1964 . |map|)
              (|Mapping| $$ 429) (|Mapping| $$ 57)
              (|SparseMultivariatePolynomial| 57 429)
              (|PolynomialCategoryLifting| (|IndexedExponents| 429) 429 57 434
                                           $$)
              (1970 . |map|) (1977 . /) (|Union| 414 '"failed")
              (1983 . |retractIfCan|) (1988 . |coerce|) (1993 . |coerce|)
              (1998 . |belong?|) (2003 . |is?|) (|Union| 27 '#1#)
              (2009 . |retractIfCan|) (2014 . ~=)
              (|SparseUnivariatePolynomial| 414) (2020 . |Zero|)
              (2024 . |Zero|) (2028 . ~=) (2034 . |degree|) (2039 . |monomial|)
              (2045 . +) (2051 . |rootOf|) (2057 . |operator|) (2062 . |elt|)
              (|Union| 15 '"failed") (2068 . |mainVariable|)
              (2073 . |leadingCoefficient|) (2078 . |Zero|) (2082 . |ground?|)
              (2087 . ^) (2093 . *) (2099 . +) (|InputForm|) (2105 . |convert|)
              (2110 . |convert|) (|List| 10) (2115 . |eval|) (2123 . |eval|)
              (2131 . |variables|) (2136 . |concat|)
              (2141 . |removeDuplicates|) (2146 . |scripted?|) (|Mapping| 9 27)
              (2151 . |select|) (|MakeUnaryCompiledFunction| $$ $$ $$)
              (2157 . |compiledFunction|) (|Mapping| $ $) (|List| 479)
              (2163 . |eval|) (2170 . |new|) (2174 . |coerce|) (|Equation| $$)
              (2179 . =) (|List| 565) (2185 . |subst|)
              (|PatternMatchResult| 57 $$) (|Pattern| 57)
              (|PatternMatchFunctionSpace| 57 6 $$) (2191 . |patternMatch|)
              (|PatternMatchResult| 57 $) (2198 . |patternMatch|)
              (|PatternMatchResult| (|Float|) $$) (|Pattern| (|Float|))
              (|PatternMatchFunctionSpace| (|Float|) 6 $$)
              (2205 . |patternMatch|) (|PatternMatchResult| (|Float|) $)
              (2212 . |patternMatch|) (2219 . |reducedSystem|)
              (2224 . |reducedSystem|) (|PatternMatchKernel| 57 $$)
              (2230 . |patternMatch|) (|PatternMatchResult| 57 45)
              (|Mapping| 504 15 489 504)
              (|PatternMatchPolynomialCategory| 57 411 15 6 45)
              (2237 . |patternMatch|) (|PatternMatchKernel| (|Float|) $$)
              (2245 . |patternMatch|) (|PatternMatchResult| (|Float|) 45)
              (|Mapping| 510 15 495 510)
              (|PatternMatchPolynomialCategory| (|Float|) 411 15 6 45)
              (2252 . |patternMatch|) (2260 . |coerce|)
              (|Record| (|:| |gen| 15) (|:| |exp| 57)) (|List| 515)
              (2265 . |terms|) (2270 . |zero?|) (2275 . |constantKernel|)
              (2280 . |retract|) (|OutputForm|) (2285 . |coerce|)
              (2290 . |coerce|) (2295 . |eval|) (2302 . |map|)
              (|Mapping| $$ 15) (|ListToMap| 15 $$) (2308 . |match|)
              (2316 . |subst|) (2323 . |kernel|) (2329 . *)
              (|Union| 323 '#2="failed") (2335 . |isPlus|) (2340 . |first|)
              (|Record| (|:| |coef| 57) (|:| |var| 12)) (|Union| 535 '#2#)
              (2345 . |isMult|) (2350 . |retractIfCan|) (|Matrix| 57)
              (|Record| (|:| |mat| 539) (|:| |vec| (|Vector| 57)))
              (|Union| $ '"failed") (|Factored| $) (|Polynomial| 544)
              (|Fraction| 6) (|Fraction| 122) (|Fraction| 543)
              (|Union| 107 '#1#) (|Polynomial| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |coef| 323) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 553 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Union| 57 '#1#) (|Record| (|:| |var| 12) (|:| |exponent| 57))
              (|Union| 557 '#2#) (|Record| (|:| |val| $) (|:| |exponent| 57))
              (|Union| 559 '#2#) (|List| 35) (|Mapping| $ 323) (|List| 562)
              (|Union| 105 '#1#) (|Equation| $) (|String|) (|SingleInteger|)
              (|HashState|))
           '#(~= 2355 |zerosOf| 2361 |zeroOf| 2388 |zero?| 2415 |whittakerW|
              2420 |whittakerM| 2427 |weierstrassZeta| 2434 |weierstrassSigma|
              2441 |weierstrassPPrime| 2448 |weierstrassP| 2455 |weberE| 2462
              |variables| 2468 |univariate| 2473 |unitNormal| 2479
              |unitCanonical| 2484 |unit?| 2489 |tower| 2494 |tanh| 2499 |tan|
              2504 |summation| 2509 |subtractIfCan| 2521 |subst| 2527 |struveL|
              2546 |struveH| 2552 |squareFreePolynomial| 2558 |squareFreePart|
              2563 |squareFree| 2568 |sqrt| 2573 |smaller?| 2578 |sizeLess?|
              2584 |sinh| 2590 |sin| 2595 |simplifyPower| 2600
              |setSimplifyDenomsFlag| 2606 |sech| 2611 |sec| 2616 |sample| 2621
              |rootsOf| 2625 |rootOf| 2652 |riemannZeta| 2679 |retractIfCan|
              2684 |retract| 2724 |rem| 2764 |reducedSystem| 2770 |reduce| 2792
              |recip| 2797 |quo| 2802 |product| 2808 |principalIdeal| 2820
              |prime?| 2825 |polylog| 2830 |polygamma| 2836 |pi| 2842
              |permutation| 2846 |patternMatch| 2852 |paren| 2866 |operators|
              2876 |operator| 2881 |one?| 2886 |odd?| 2891 |numerator| 2896
              |numer| 2901 |number?| 2906 |nthRoot| 2911 |multiEuclidean| 2917
              |minPoly| 2923 |meijerG| 2928 |map| 2937 |mainKernel| 2943
              |lommelS2| 2948 |lommelS1| 2955 |log| 2962 |li| 2967 |lerchPhi|
              2972 |legendreQ| 2979 |legendreP| 2986 |lcmCoef| 2993 |lcm| 2999
              |latex| 3010 |lambertW| 3015 |kummerU| 3020 |kummerM| 3027
              |kernels| 3034 |kernel| 3039 |kelvinKer| 3051 |kelvinKei| 3057
              |kelvinBer| 3063 |kelvinBei| 3069 |jacobiZeta| 3075 |jacobiTheta|
              3081 |jacobiSn| 3087 |jacobiDn| 3093 |jacobiCn| 3099 |isTimes|
              3105 |isPower| 3110 |isPlus| 3115 |isMult| 3120 |isExpt| 3125
              |is?| 3142 |inv| 3154 |integral| 3159 |hypergeometricF| 3171
              |height| 3178 |hashUpdate!| 3183 |hash| 3189 |hankelH2| 3194
              |hankelH1| 3200 |ground?| 3206 |ground| 3211
              |getSimplifyDenomsFlag| 3216 |gcdPolynomial| 3220 |gcd| 3226
              |fresnelS| 3237 |fresnelC| 3242 |freeOf?| 3247 |factorials| 3259
              |factorial| 3270 |factorPolynomial| 3275 |factor| 3280
              |extendedEuclidean| 3285 |exquo| 3298 |expressIdealMember| 3304
              |exp| 3310 |even?| 3315 |eval| 3320 |euclideanSize| 3481 |erf|
              3486 |elt| 3491 |ellipticPi| 3587 |ellipticK| 3594 |ellipticF|
              3599 |ellipticE| 3605 |divide| 3616 |distribute| 3622 |dilog|
              3633 |digamma| 3638 |differentiate| 3643 |denominator| 3669
              |denom| 3674 |definingPolynomial| 3679 |csch| 3684 |csc| 3689
              |coth| 3694 |cot| 3699 |cosh| 3704 |cos| 3709 |convert| 3714
              |conjugate| 3734 |commutator| 3740 |coerce| 3746 |charthRoot|
              3816 |characteristic| 3821 |box| 3825 |binomial| 3835 |besselY|
              3841 |besselK| 3847 |besselJ| 3853 |besselI| 3859 |belong?| 3865
              |atanh| 3870 |atan| 3875 |associates?| 3880 |asinh| 3886 |asin|
              3891 |asech| 3896 |asec| 3901 |applyQuote| 3906 |angerJ| 3942
              |airyBiPrime| 3948 |airyBi| 3953 |airyAiPrime| 3958 |airyAi| 3963
              |acsch| 3968 |acsc| 3973 |acoth| 3978 |acot| 3983 |acosh| 3988
              |acos| 3993 |abs| 3998 ^ 4003 |Zero| 4033 |Si| 4037 |Shi| 4042
              |One| 4047 |Gamma| 4051 |Ei| 4062 D 4067 |Ci| 4093 |Chi| 4098
              |Beta| 4103 = 4109 / 4115 - 4127 + 4138 * 4144)
           'NIL
           (CONS
            (|makeByteWordVec2| 28
                                '(1 0 1 1 1 1 1 1 1 1 1 1 1 2 5 1 1 1 2 3 4 5 7
                                  1 5 1 1 2 18 1 1 1 6 2 2 18 20 8 5 20 0 0 5
                                  28 26 0 12 13 1 28 26 0 0 0 0 1 1 0 0 0 0 0 0
                                  0 0 16 1 1 1 1 1 5 9 10 11 14 15 1 1 1 1 1 1
                                  1 1 17 1))
            (CONS
             '#(|AlgebraicallyClosedFunctionSpace&| |FunctionSpace&|
                |AlgebraicallyClosedField&| |Field&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |GcdDomain&| |DivisionRing&|
                NIL |Algebra&| NIL |Algebra&| |Algebra&|
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
                 (|Algebra| $$) (|LeftOreRing|) (|Algebra| 416) (|Algebra| 6)
                 (|FullyLinearlyExplicitRingOver| 6) (|Module| $$)
                 (|EntireRing|) (|Module| 416) (|Module| 6)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|LinearlyExplicitRingOver| 6) (|LinearlyExplicitRingOver| 57)
                 (|CommutativeRing|) (|PartialDifferentialRing| 27)
                 (|BiModule| $$ $$) (|BiModule| 416 416) (|BiModule| 6 6)
                 (|Ring|) (|RightModule| $$) (|LeftModule| 416)
                 (|RightModule| 416) (|LeftModule| $$) (|LeftModule| 6)
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
                 (|CoercibleTo| 521) (|RetractableTo| 416)
                 (|RetractableTo| (|Fraction| (|Polynomial| 6)))
                 (|CommutativeStar|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|RetractableTo| (|Polynomial| 6))
                 (|ConvertibleTo| 465) (|ConvertibleTo| 495)
                 (|ConvertibleTo| 489) (|RetractableTo| 57)
                 (|RetractableTo| 414) (|SpecialFunctionCategory|)
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
                                    2 2 42 115 2 15 9 0 27 116 2 42 0 15 0 117
                                    2 15 9 0 0 118 1 42 0 0 119 2 0 9 0 0 120 2
                                    35 9 0 0 121 2 41 122 0 15 123 1 124 41 0
                                    125 1 124 0 0 126 2 41 0 0 0 127 3 41 0 0
                                    15 35 128 2 41 0 0 0 129 2 45 0 41 41 130 0
                                    0 9 131 1 0 9 9 132 2 42 15 0 57 133 0 134
                                    0 135 1 0 122 12 136 3 138 137 2 15 137 139
                                    1 0 0 12 140 3 137 0 0 134 2 141 1 137 2 0
                                    142 2 0 0 98 98 143 2 145 0 144 0 146 1 45
                                    147 148 149 1 41 150 148 151 1 0 150 148
                                    152 2 153 0 144 0 154 2 45 155 148 156 157
                                    2 41 158 148 156 159 2 0 158 148 156 160 2
                                    42 9 15 0 161 2 42 0 15 0 162 2 163 2 137
                                    27 164 2 0 0 122 27 165 0 166 2 167 0 0 0
                                    168 1 166 2 2 169 1 0 0 0 170 1 166 2 2 171
                                    1 0 0 0 172 1 166 2 2 173 1 0 0 0 174 1 166
                                    2 2 175 1 0 0 0 176 1 166 2 2 177 1 0 0 0
                                    178 1 166 2 2 179 1 0 0 0 180 1 166 2 2 181
                                    1 0 0 0 182 1 166 2 2 183 1 0 0 0 184 1 166
                                    2 2 185 1 0 0 0 186 1 166 2 2 187 1 0 0 0
                                    188 1 166 2 2 189 1 0 0 0 190 1 166 2 2 191
                                    1 0 0 0 192 1 166 2 2 193 1 0 0 0 194 1 166
                                    2 2 195 1 0 0 0 196 1 166 2 2 197 1 0 0 0
                                    198 1 166 2 2 199 1 0 0 0 200 1 166 2 2 201
                                    1 0 0 0 202 1 166 2 2 203 1 0 0 0 204 1 166
                                    2 2 205 1 0 0 0 206 1 166 2 2 207 1 0 0 0
                                    208 1 166 2 2 209 1 0 0 0 210 1 166 2 2 211
                                    1 0 0 0 212 1 166 2 2 213 1 0 0 0 214 1 166
                                    2 2 215 1 0 0 0 216 1 166 2 2 217 1 0 0 0
                                    218 1 166 2 2 219 1 0 0 0 220 1 221 2 2 222
                                    1 0 0 0 223 1 221 2 2 224 1 0 0 0 225 2 221
                                    2 2 2 226 2 0 0 0 0 227 2 221 2 2 2 228 2 0
                                    0 0 0 229 1 221 2 2 230 1 0 0 0 231 2 221 2
                                    2 2 232 2 0 0 0 0 233 2 221 2 2 2 234 2 0 0
                                    0 0 235 2 221 2 2 2 236 2 0 0 0 0 237 2 221
                                    2 2 2 238 2 0 0 0 0 239 2 221 2 2 2 240 2 0
                                    0 0 0 241 1 221 2 2 242 1 0 0 0 243 1 221 2
                                    2 244 1 0 0 0 245 1 221 2 2 246 1 0 0 0 247
                                    1 221 2 2 248 1 0 0 0 249 1 221 2 2 250 1 0
                                    0 0 251 2 221 2 2 2 252 2 0 0 0 0 253 3 221
                                    2 2 2 2 254 3 0 0 0 0 0 255 3 221 2 2 2 2
                                    256 3 0 0 0 0 0 257 3 221 2 2 2 2 258 3 0 0
                                    0 0 0 259 3 221 2 2 2 2 260 3 0 0 0 0 0 261
                                    3 221 2 2 2 2 262 3 0 0 0 0 0 263 3 221 2 2
                                    2 2 264 3 0 0 0 0 0 265 2 221 2 2 2 266 2 0
                                    0 0 0 267 2 221 2 2 2 268 2 0 0 0 0 269 2
                                    221 2 2 2 270 2 0 0 0 0 271 2 221 2 2 2 272
                                    2 0 0 0 0 273 2 221 2 2 2 274 2 0 0 0 0 275
                                    2 221 2 2 2 276 2 0 0 0 0 277 3 221 2 2 2 2
                                    278 3 0 0 0 0 0 279 3 221 2 2 2 2 280 3 0 0
                                    0 0 0 281 3 221 2 2 2 2 282 3 0 0 0 0 0 283
                                    3 221 2 2 2 2 284 3 0 0 0 0 0 285 3 221 2 2
                                    2 2 286 3 0 0 0 0 0 287 3 221 2 2 2 2 288 3
                                    0 0 0 0 0 289 2 221 2 2 2 290 2 0 0 0 0 291
                                    2 221 2 2 2 292 2 0 0 0 0 293 2 221 2 2 2
                                    294 2 0 0 0 0 295 2 221 2 2 2 296 2 0 0 0 0
                                    297 1 221 2 2 298 1 0 0 0 299 1 221 2 2 300
                                    1 0 0 0 301 2 221 2 2 2 302 2 0 0 0 0 303 2
                                    221 2 2 2 304 2 0 0 0 0 305 3 221 2 2 2 2
                                    306 3 0 0 0 0 0 307 2 221 2 2 2 308 2 0 0 0
                                    0 309 2 221 2 2 2 310 2 0 0 0 0 311 2 221 2
                                    2 2 312 2 0 0 0 0 313 2 221 2 2 2 314 2 0 0
                                    0 0 315 2 221 2 2 2 316 2 0 0 0 0 317 3 221
                                    2 2 2 2 318 3 0 0 0 0 0 319 1 221 2 2 320 1
                                    0 0 0 321 3 221 2 78 78 2 322 3 0 0 323 323
                                    0 324 5 221 2 78 78 78 78 2 325 5 0 0 323
                                    323 323 323 0 326 2 327 2 2 2 328 1 327 2 2
                                    329 1 0 0 0 330 2 327 2 2 2 331 2 0 0 0 0
                                    332 2 327 2 2 2 333 2 0 0 0 0 334 1 327 2 2
                                    335 1 0 0 0 336 2 327 2 2 27 337 2 0 0 0 27
                                    338 2 327 2 2 27 339 2 0 0 0 27 340 2 327 2
                                    2 341 342 2 0 0 0 343 344 2 327 2 2 27 345
                                    2 0 0 0 27 346 2 327 2 2 341 347 2 0 0 0
                                    343 348 1 349 2 2 350 1 0 0 0 351 1 349 2 2
                                    352 1 0 0 0 353 1 349 2 2 354 1 0 0 0 355 1
                                    349 2 2 356 1 0 0 0 357 1 349 2 2 358 1 0 0
                                    0 359 1 349 2 2 360 1 0 0 0 361 1 349 2 2
                                    362 1 0 0 0 363 1 349 2 2 364 1 0 0 0 365 1
                                    349 2 2 366 1 0 0 0 367 1 349 2 2 368 1 0 0
                                    0 369 2 349 2 2 27 370 2 0 0 0 27 371 2 349
                                    2 2 341 372 2 0 0 0 343 373 1 163 9 10 374
                                    1 163 10 10 375 1 166 9 10 376 1 166 10 10
                                    377 1 327 9 10 378 1 327 10 10 379 1 349 9
                                    10 380 1 349 10 10 381 1 221 9 10 382 1 221
                                    10 10 383 1 384 0 41 385 2 387 386 384 15
                                    388 1 386 389 0 390 2 41 35 0 15 391 1 137
                                    35 0 392 2 137 0 0 0 393 1 41 0 15 394 2
                                    389 384 0 384 395 0 137 0 396 2 137 9 0 0
                                    397 1 137 2 0 398 1 137 0 0 399 2 45 122
                                    122 122 400 2 401 122 122 122 402 2 0 122
                                    122 122 403 1 405 404 389 406 1 0 407 122
                                    408 1 405 404 389 409 1 0 407 122 410 0 411
                                    0 412 2 41 0 6 411 413 1 0 0 414 415 2 163
                                    2 2 416 417 2 0 0 0 416 418 1 163 137 15
                                    419 1 163 2 2 420 1 0 0 0 421 1 45 416 0
                                    422 1 0 416 0 423 1 45 71 0 424 1 414 425 0
                                    426 1 414 425 0 427 2 430 2 428 429 431 3
                                    435 2 432 433 434 436 2 414 0 0 0 437 1 0
                                    438 0 439 1 0 0 6 440 1 414 0 416 441 1 414
                                    9 10 442 2 10 9 0 27 443 1 0 444 0 445 2 41
                                    9 0 0 446 0 447 0 448 0 124 0 449 2 124 9 0
                                    0 450 1 124 35 0 451 2 447 0 414 35 452 2
                                    447 0 0 0 453 2 414 0 122 27 454 1 414 10
                                    10 455 2 414 0 10 323 456 1 41 457 0 458 1
                                    41 6 0 459 0 414 0 460 1 124 9 0 461 2 414
                                    0 0 35 462 2 414 0 0 0 463 2 414 0 0 0 464
                                    1 45 465 0 466 1 0 465 0 467 4 0 0 0 468
                                    323 27 469 4 0 0 0 10 0 27 470 1 0 38 0 471
                                    1 38 0 323 472 1 38 0 0 473 1 27 9 0 474 2
                                    38 0 475 0 476 2 477 144 2 27 478 3 0 0 0
                                    468 480 481 0 27 0 482 1 0 0 27 483 2 484 0
                                    2 2 485 2 0 0 0 486 487 3 490 488 2 489 488
                                    491 3 0 492 0 489 492 493 3 496 494 2 495
                                    494 497 3 0 498 0 495 498 499 1 45 150 148
                                    500 2 45 158 148 156 501 3 502 488 15 489
                                    488 503 4 506 504 45 489 504 505 507 3 508
                                    494 15 495 494 509 4 512 510 45 495 510 511
                                    513 1 45 0 15 514 1 45 516 0 517 1 6 9 0
                                    518 1 16 15 6 519 1 0 6 0 520 1 45 521 0
                                    522 1 0 521 0 523 3 0 0 0 74 323 524 2 0 0
                                    479 12 525 4 527 2 42 78 15 526 528 3 0 0 0
                                    74 323 529 2 0 0 10 323 530 2 45 0 57 15
                                    531 1 0 532 0 533 1 516 515 0 534 1 0 536 0
                                    537 1 0 14 0 538 2 0 9 0 0 120 2 1 323 0 27
                                    1 1 1 323 0 1 2 1 323 122 27 1 1 1 323 548
                                    1 1 1 323 122 1 2 1 0 0 27 1 1 1 0 0 1 2 1
                                    0 122 27 1 1 1 0 548 1 1 1 0 122 1 1 25 9 0
                                    54 3 1 0 0 0 0 265 3 1 0 0 0 0 263 3 1 0 0
                                    0 0 261 3 1 0 0 0 0 259 3 1 0 0 0 0 257 3 1
                                    0 0 0 0 255 2 1 0 0 0 269 1 0 38 0 471 2 1
                                    545 0 12 1 1 1 549 0 1 1 1 0 0 1 1 1 9 0 1
                                    1 0 74 0 1 1 1 0 0 202 1 1 0 0 178 2 1 0 0
                                    27 340 2 1 0 0 343 344 2 19 541 0 0 1 3 0 0
                                    0 74 323 529 2 0 0 0 486 487 2 0 0 0 565 1
                                    2 1 0 0 0 273 2 1 0 0 0 271 1 30 407 122
                                    410 1 1 0 0 1 1 1 542 0 1 1 1 0 0 1 2 0 9 0
                                    0 95 2 1 9 0 0 1 1 1 0 0 198 1 1 0 0 174 2
                                    1 0 0 57 86 1 1 9 9 132 1 1 0 0 206 1 1 0 0
                                    182 0 29 0 1 2 1 323 0 27 1 1 1 323 0 1 1 1
                                    323 122 1 2 1 323 122 27 1 1 1 323 548 1 2
                                    1 0 0 27 1 1 1 0 0 1 1 1 0 122 1 2 1 0 122
                                    27 165 1 1 0 548 1 1 1 0 0 321 1 15 438 0
                                    439 1 16 71 0 72 1 1 547 0 1 1 14 556 0 1 1
                                    5 564 0 1 1 0 14 0 538 1 0 444 0 445 1 0 18
                                    0 19 1 15 414 0 1 1 16 416 0 423 1 1 107 0
                                    1 1 14 57 0 1 1 5 105 0 1 1 0 6 0 520 1 0
                                    27 0 1 1 0 12 0 13 2 1 0 0 0 1 1 24 539 148
                                    1 2 24 540 148 156 1 1 5 150 148 152 2 5
                                    158 148 156 160 1 1 0 0 111 1 27 541 0 1 2
                                    1 0 0 0 1 2 1 0 0 27 346 2 1 0 0 343 348 1
                                    1 551 323 1 1 1 9 0 1 2 1 0 0 0 253 2 1 0 0
                                    0 233 0 1 0 168 2 1 0 0 0 334 3 12 498 0
                                    495 498 499 3 13 492 0 489 492 493 1 0 0
                                    323 1 1 0 0 0 1 1 0 468 0 1 1 0 10 10 37 1
                                    27 9 0 52 1 31 9 0 1 1 5 0 0 88 1 5 98 0 99
                                    1 1 9 0 73 2 1 0 0 57 1 2 1 532 323 0 1 1
                                    32 122 12 136 5 33 0 323 323 323 323 0 326
                                    2 0 0 479 12 525 1 0 18 0 1 3 1 0 0 0 0 281
                                    3 1 0 0 0 0 279 1 1 0 0 172 1 1 0 0 363 3 1
                                    0 0 0 0 319 3 1 0 0 0 0 289 3 1 0 0 0 0 287
                                    2 1 550 0 0 1 1 1 0 323 1 2 1 0 0 0 1 1 0
                                    566 0 1 1 1 0 0 251 3 1 0 0 0 0 285 3 1 0 0
                                    0 0 283 1 0 74 0 75 2 0 0 10 323 530 2 0 0
                                    10 0 1 2 1 0 0 0 297 2 1 0 0 0 295 2 1 0 0
                                    0 293 2 1 0 0 0 291 2 1 0 0 0 315 2 1 0 0 0
                                    317 2 1 0 0 0 309 2 1 0 0 0 313 2 1 0 0 0
                                    311 1 27 532 0 1 1 5 560 0 1 1 25 532 0 533
                                    1 25 536 0 537 2 5 558 0 10 1 2 5 558 0 27
                                    1 1 27 558 0 1 2 0 9 0 27 76 2 0 9 0 10 1 1
                                    23 0 0 1 2 1 0 0 27 371 2 1 0 0 343 373 3
                                    33 0 323 323 0 324 1 0 35 0 1 2 0 568 568 0
                                    1 1 0 567 0 1 2 1 0 0 0 277 2 1 0 0 0 275 1
                                    0 9 0 70 1 0 6 0 1 0 1 9 131 2 1 122 122
                                    122 403 1 1 0 323 1 2 1 0 0 0 1 1 1 0 0 367
                                    1 1 0 0 369 2 0 9 0 27 1 2 0 9 0 0 1 2 1 0
                                    0 27 338 1 1 0 0 336 1 1 0 0 330 1 30 407
                                    122 408 1 1 542 0 1 3 1 554 0 0 0 1 2 1 555
                                    0 0 1 2 1 541 0 0 1 2 1 532 323 0 1 1 1 0 0
                                    170 1 31 9 0 1 2 9 0 0 38 1 2 9 0 0 27 1 1
                                    9 0 0 1 4 9 0 0 468 323 27 469 4 9 0 0 10 0
                                    27 470 4 5 0 0 38 561 563 1 4 5 0 0 38 561
                                    480 1 4 5 0 0 27 35 562 1 4 5 0 0 27 35 479
                                    1 3 0 0 0 10 562 1 3 0 0 0 10 479 1 3 0 0 0
                                    468 480 481 3 0 0 0 468 563 1 3 0 0 0 27
                                    479 1 3 0 0 0 38 563 1 3 0 0 0 27 562 1 3 0
                                    0 0 38 480 1 3 0 0 0 323 323 1 2 0 0 0 565
                                    1 3 0 0 0 0 0 1 2 0 0 0 486 1 3 0 0 0 12 0
                                    1 3 0 0 0 74 323 524 1 1 35 0 1 1 1 0 0 351
                                    2 0 0 10 323 1 9 0 0 10 0 0 0 0 0 0 0 0 1
                                    10 0 0 10 0 0 0 0 0 0 0 0 0 1 8 0 0 10 0 0
                                    0 0 0 0 0 1 6 0 0 10 0 0 0 0 0 1 7 0 0 10 0
                                    0 0 0 0 0 1 4 0 0 10 0 0 0 1 5 0 0 10 0 0 0
                                    0 1 3 0 0 10 0 0 1 2 0 0 10 0 1 3 1 0 0 0 0
                                    307 1 1 0 0 299 2 1 0 0 0 305 2 1 0 0 0 303
                                    1 1 0 0 301 2 1 552 0 0 1 1 0 0 0 1 2 0 0 0
                                    0 1 1 1 0 0 365 1 1 0 0 231 3 5 0 0 38 561
                                    1 2 5 0 0 38 1 3 5 0 0 27 35 1 2 5 0 0 27 1
                                    1 1 0 0 89 1 1 98 0 101 1 32 0 0 421 1 1 0
                                    0 208 1 1 0 0 184 1 1 0 0 204 1 1 0 0 180 1
                                    1 0 0 200 1 1 0 0 176 1 9 465 0 467 1 10
                                    495 0 1 1 11 489 0 1 1 1 0 542 1 2 8 0 0 0
                                    1 2 8 0 0 0 1 1 15 0 414 415 1 22 0 416 1 1
                                    21 0 57 61 1 1 0 543 1 1 1 0 544 1 1 1 0
                                    546 1 1 1 0 107 110 1 1 0 0 1 1 5 0 98 104
                                    1 5 0 105 106 1 0 0 6 440 1 0 0 27 483 1 0
                                    0 12 140 1 0 521 0 523 1 3 541 0 1 0 5 35 1
                                    1 0 0 323 1 1 0 0 0 1 2 1 0 0 0 332 2 1 0 0
                                    0 237 2 1 0 0 0 241 2 1 0 0 0 235 2 1 0 0 0
                                    239 1 0 9 10 11 1 1 0 0 214 1 1 0 0 190 2 1
                                    9 0 0 1 1 1 0 0 210 1 1 0 0 186 1 1 0 0 218
                                    1 1 0 0 194 2 0 0 27 323 1 4 0 0 27 0 0 0 1
                                    5 0 0 27 0 0 0 0 1 3 0 0 27 0 0 1 2 0 0 27
                                    0 1 2 1 0 0 0 267 1 1 0 0 249 1 1 0 0 247 1
                                    1 0 0 245 1 1 0 0 243 1 1 0 0 220 1 1 0 0
                                    196 1 1 0 0 216 1 1 0 0 192 1 1 0 0 212 1 1
                                    0 0 188 1 1 0 0 223 2 23 0 0 57 91 2 1 0 0
                                    0 83 2 1 0 0 416 418 2 27 0 0 35 90 2 27 0
                                    0 92 93 0 25 0 47 1 1 0 0 355 1 1 0 0 359 0
                                    27 0 49 1 1 0 0 225 2 1 0 0 0 227 1 1 0 0
                                    353 3 5 0 0 27 35 1 3 5 0 0 38 561 1 2 5 0
                                    0 38 1 2 5 0 0 27 1 1 1 0 0 357 1 1 0 0 361
                                    2 1 0 0 0 229 2 0 9 0 0 96 2 23 0 0 0 69 2
                                    1 0 98 98 143 2 19 0 0 0 67 1 19 0 0 56 2
                                    25 0 0 0 65 2 19 0 57 0 59 2 25 0 35 0 1 2
                                    25 0 92 0 1 2 2 0 0 6 1 2 2 0 6 0 1 2 1 0 0
                                    416 1 2 1 0 416 0 1 2 27 0 0 0 63)))))
           '|lookupComplete|)) 
