
(/VERSIONCHECK 2) 

(DEFUN |EFSTRUC;realElem| (|f| |l| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|EFSTRUC;realElem!0| (VECTOR $ |l|)) |f|
               (QREFELT $ 18))))) 

(DEFUN |EFSTRUC;realElem!0| (|k| $$)
  (PROG (|l| $)
    (LETT |l| (QREFELT $$ 1) . #1=(|EFSTRUC;realElem|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|EFSTRUC;k2Elem| |k| |l| $))))) 

(DEFUN |EFSTRUC;realElementary;FSF;2| (|f| |x| $)
  (|EFSTRUC;realElem| |f| (LIST |x|) $)) 

(DEFUN |EFSTRUC;realElementary;2F;3| (|f| $)
  (|EFSTRUC;realElem| |f| (SPADCALL |f| (QREFELT $ 22)) $)) 

(DEFUN |EFSTRUC;realLiouvillian;2F;4| (|f| $)
  (SPADCALL (CONS (|function| |EFSTRUC;k_to_liou|) $) |f| (QREFELT $ 18))) 

(DEFUN |EFSTRUC;toY| (|ker| $)
  (PROG (|func| #1=#:G233 |k| #2=#:G232)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|EFSTRUC;toY|))
       (SEQ (LETT |k| NIL . #3#) (LETT #1# |ker| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (COND
               ((SPADCALL (LETT |func| (|EFSTRUC;ktoY| |k| $) . #3#)
                          (|spadConstant| $ 25) (QREFELT $ 27))
                (LETT #2# (CONS |func| #2#) . #3#)))))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |EFSTRUC;toZ| (|ker| $)
  (PROG (|func| #1=#:G237 |k| #2=#:G236)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|EFSTRUC;toZ|))
       (SEQ (LETT |k| NIL . #3#) (LETT #1# |ker| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (COND
               ((SPADCALL (LETT |func| (|EFSTRUC;ktoZ| |k| $) . #3#)
                          (|spadConstant| $ 25) (QREFELT $ 27))
                (LETT #2# (CONS |func| #2#) . #3#)))))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |EFSTRUC;toU| (|ker| $)
  (PROG (|func| #1=#:G241 |k| #2=#:G240)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|EFSTRUC;toU|))
       (SEQ (LETT |k| NIL . #3#) (LETT #1# |ker| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (COND
               ((SPADCALL (LETT |func| (|EFSTRUC;ktoU| |k| $) . #3#)
                          (|spadConstant| $ 25) (QREFELT $ 27))
                (LETT #2# (CONS |func| #2#) . #3#)))))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |EFSTRUC;toV| (|ker| $)
  (PROG (|func| #1=#:G245 |k| #2=#:G244)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|EFSTRUC;toV|))
       (SEQ (LETT |k| NIL . #3#) (LETT #1# |ker| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (COND
               ((SPADCALL (LETT |func| (|EFSTRUC;ktoV| |k| $) . #3#)
                          (|spadConstant| $ 25) (QREFELT $ 27))
                (LETT #2# (CONS |func| #2#) . #3#)))))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |EFSTRUC;rtNormalize| (|f| $) (QVELT (|EFSTRUC;rootNormalize0| |f| $) 0)) 

(DEFUN |EFSTRUC;toR| (|ker| |x| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|EFSTRUC;toR!0| (VECTOR |x| $)) |ker| (QREFELT $ 37))))) 

(DEFUN |EFSTRUC;toR!0| (|s| $$)
  (PROG ($ |x|)
    (LETT $ (QREFELT $$ 1) . #1=(|EFSTRUC;toR|))
    (LETT |x| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (COND
       ((SPADCALL |s| '|nthRoot| (QREFELT $ 29))
        (SPADCALL (SPADCALL (SPADCALL |s| (QREFELT $ 31)) (QREFELT $ 32)) |x|
                  (QREFELT $ 33)))
       ('T (|spadConstant| $ 34))))))) 

(DEFUN |EFSTRUC;tanQ;F2F;11| (|c| |x| $)
  (PROG (#1=#:G252)
    (RETURN
     (SPADCALL
      (SPADCALL
       (SPADCALL
        (SPADCALL |x|
                  (PROG1
                      (LETT #1# (SPADCALL |c| (QREFELT $ 39))
                            |EFSTRUC;tanQ;F2F;11|)
                    (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
                  (QREFELT $ 43))
        (QREFELT $ 45))
       (QREFELT $ 47))
      (SPADCALL |c| (QREFELT $ 48)) (QREFELT $ 49))))) 

(DEFUN |EFSTRUC;tanQ;F2F;12| (|c| |x| $)
  (PROG (#1=#:G255)
    (RETURN
     (SPADCALL
      (SPADCALL
       (SPADCALL |x|
                 (PROG1
                     (LETT #1# (SPADCALL |c| (QREFELT $ 39))
                           |EFSTRUC;tanQ;F2F;12|)
                   (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
                 (QREFELT $ 43))
       (QREFELT $ 45))
      (SPADCALL |c| (QREFELT $ 48)) (QREFELT $ 49))))) 

(DEFUN |EFSTRUC;tanSum| (|c| |l| $)
  (PROG (#1=#:G262 |r| |k|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |k| (SPADCALL |c| (QREFELT $ 16) (QREFELT $ 15))
              . #2=(|EFSTRUC;tanSum|))
        (SEQ (LETT |r| (SPADCALL |k| (QREFELT $ 52)) . #2#)
             (EXIT
              (COND
               ((QEQCAR |r| 0)
                (COND
                 ((ODDP (QCDR |r|))
                  (PROGN
                   (LETT #1#
                         (SPADCALL
                          (SPADCALL (SPADCALL |l| (QREFELT $ 53))
                                    (QREFELT $ 54))
                          (QREFELT $ 14))
                         . #2#)
                   (GO #1#))))))))
        (EXIT
         (SPADCALL (CONS (SPADCALL |c| (QREFELT $ 55)) |l|) (QREFELT $ 53)))))
      #1# (EXIT #1#))))) 

(DEFUN |EFSTRUC;rootNormalize0| (|f| $)
  (PROG (#1=#:G272 #2=#:G276 |rn| |rec| |u| |i| #3=#:G277 |kk| |n| |ker|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ker|
              (SPADCALL (CONS #'|EFSTRUC;rootNormalize0!0| $)
                        (SPADCALL |f| (QREFELT $ 58)) (QREFELT $ 59))
              . #4=(|EFSTRUC;rootNormalize0|))
        (EXIT
         (COND ((NULL |ker|) (VECTOR |f| NIL NIL))
               (#5='T
                (SEQ (LETT |n| (- (LENGTH |ker|) 1) . #4#)
                     (EXIT
                      (COND ((< |n| 1) (VECTOR |f| NIL NIL))
                            (#5#
                             (SEQ
                              (SEQ
                               (EXIT
                                (SEQ (LETT |kk| NIL . #4#)
                                     (LETT #3# (CDR |ker|) . #4#)
                                     (LETT |i| 1 . #4#) G190
                                     (COND
                                      ((OR (|greater_SI| |i| |n|) (ATOM #3#)
                                           (PROGN
                                            (LETT |kk| (CAR #3#) . #4#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |u|
                                            (|EFSTRUC;rootKernelNormalize| |f|
                                             (SPADCALL |ker| |i|
                                                       (QREFELT $ 63))
                                             |kk| $)
                                            . #4#)
                                      (EXIT
                                       (COND
                                        ((QEQCAR |u| 0)
                                         (PROGN
                                          (LETT #1#
                                                (SEQ
                                                 (LETT |rec| (QCDR |u|) . #4#)
                                                 (LETT |rn|
                                                       (|EFSTRUC;rootNormalize0|
                                                        (QVELT |rec| 0) $)
                                                       . #4#)
                                                 (EXIT
                                                  (PROGN
                                                   (LETT #2#
                                                         (VECTOR (QVELT |rn| 0)
                                                                 (SPADCALL
                                                                  (QVELT |rec|
                                                                         1)
                                                                  (QVELT |rn|
                                                                         1)
                                                                  (QREFELT $
                                                                           64))
                                                                 (SPADCALL
                                                                  (QVELT |rec|
                                                                         2)
                                                                  (QVELT |rn|
                                                                         2)
                                                                  (QREFELT $
                                                                           65)))
                                                         . #4#)
                                                   (GO #2#))))
                                                . #4#)
                                          (GO #1#))))))
                                     (LETT |i|
                                           (PROG1 (|inc_SI| |i|)
                                             (LETT #3# (CDR #3#) . #4#))
                                           . #4#)
                                     (GO G190) G191 (EXIT NIL)))
                               #1# (EXIT #1#))
                              (EXIT (VECTOR |f| NIL NIL))))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |EFSTRUC;rootNormalize0!0| (|x| $)
  (COND
   ((SPADCALL |x| '|nthRoot| (QREFELT $ 29))
    (SPADCALL
     (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 31)) (QREFELT $ 32))
               (QREFELT $ 22))
     (QREFELT $ 56)))
   ('T (|spadConstant| $ 34)))) 

(DEFUN |EFSTRUC;findQRelation| (|lv| |lpar| |lk| |ker| $)
  (PROG (|u| |j| #1=#:G298 |k| |i| #2=#:G297 |var| |mat| |isconstant| #3=#:G296
         |v| |lvv| |m| #4=#:G295 |n|)
    (RETURN
     (SEQ
      (COND ((NULL |lk|) (CONS 2 'T))
            (#5='T
             (SEQ (LETT |isconstant| 'T . #6=(|EFSTRUC;findQRelation|))
                  (LETT |m| (LENGTH |lv|) . #6#) (LETT |lvv| |lv| . #6#)
                  (LETT |n| (LENGTH |lk|) . #6#)
                  (LETT |v| (MAKEARR1 |m| (|spadConstant| $ 25)) . #6#)
                  (SEQ (LETT |var| NIL . #6#) (LETT #4# |lv| . #6#)
                       (LETT |i| 1 . #6#) G190
                       (COND
                        ((OR (|greater_SI| |i| |m|) (ATOM #4#)
                             (PROGN (LETT |var| (CAR #4#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (SPADCALL |v| |i| (SPADCALL |ker| |var| (QREFELT $ 67))
                                  (QREFELT $ 69))
                        (EXIT
                         (COND
                          (|isconstant|
                           (LETT |isconstant|
                                 (SPADCALL (SPADCALL |v| |i| (QREFELT $ 70))
                                           (|spadConstant| $ 25)
                                           (QREFELT $ 33))
                                 . #6#)))))
                       (LETT |i|
                             (PROG1 (|inc_SI| |i|) (LETT #4# (CDR #4#) . #6#))
                             . #6#)
                       (GO G190) G191 (EXIT NIL))
                  (COND
                   (|isconstant|
                    (SEQ (LETT |m| (LENGTH |lpar|) . #6#)
                         (LETT |lvv| |lpar| . #6#)
                         (LETT |v| (MAKEARR1 |m| (|spadConstant| $ 25)) . #6#)
                         (EXIT
                          (SEQ (LETT |var| NIL . #6#) (LETT #3# |lpar| . #6#)
                               (LETT |i| 1 . #6#) G190
                               (COND
                                ((OR (|greater_SI| |i| |m|) (ATOM #3#)
                                     (PROGN (LETT |var| (CAR #3#) . #6#) NIL))
                                 (GO G191)))
                               (SEQ
                                (SPADCALL |v| |i|
                                          (SPADCALL |ker| |var| (QREFELT $ 67))
                                          (QREFELT $ 69))
                                (EXIT
                                 (COND
                                  (|isconstant|
                                   (LETT |isconstant|
                                         (SPADCALL
                                          (SPADCALL |v| |i| (QREFELT $ 70))
                                          (|spadConstant| $ 25) (QREFELT $ 33))
                                         . #6#)))))
                               (LETT |i|
                                     (PROG1 (|inc_SI| |i|)
                                       (LETT #3# (CDR #3#) . #6#))
                                     . #6#)
                               (GO G190) G191 (EXIT NIL))))))
                  (EXIT
                   (COND
                    (|isconstant|
                     (SEQ
                      (SPADCALL (SPADCALL |ker| (QREFELT $ 72)) (QREFELT $ 74))
                      (EXIT (|error| "Hidden constant detected"))))
                    (#5#
                     (SEQ
                      (LETT |mat|
                            (SPADCALL |m| |n| (|spadConstant| $ 25)
                                      (QREFELT $ 76))
                            . #6#)
                      (SEQ (LETT |var| NIL . #6#) (LETT #2# |lvv| . #6#)
                           (LETT |i| 1 . #6#) G190
                           (COND
                            ((OR (|greater_SI| |i| |m|) (ATOM #2#)
                                 (PROGN (LETT |var| (CAR #2#) . #6#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |k| NIL . #6#) (LETT #1# |lk| . #6#)
                                  (LETT |j| 1 . #6#) G190
                                  (COND
                                   ((OR (|greater_SI| |j| |n|) (ATOM #1#)
                                        (PROGN (LETT |k| (CAR #1#) . #6#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SPADCALL |mat| |i| |j|
                                              (SPADCALL |k| |var|
                                                        (QREFELT $ 67))
                                              (QREFELT $ 77))))
                                  (LETT |j|
                                        (PROG1 (|inc_SI| |j|)
                                          (LETT #1# (CDR #1#) . #6#))
                                        . #6#)
                                  (GO G190) G191 (EXIT NIL))))
                           (LETT |i|
                                 (PROG1 (|inc_SI| |i|)
                                   (LETT #2# (CDR #2#) . #6#))
                                 . #6#)
                           (GO G190) G191 (EXIT NIL))
                      (LETT |u| (SPADCALL |mat| |v| (QREFELT $ 80)) . #6#)
                      (EXIT
                       (COND ((QEQCAR |u| 0) (CONS 0 (QCDR |u|)))
                             (#5# (CONS 2 'T))))))))))))))) 

(DEFUN |EFSTRUC;findLinearRelation1| (|lk| |ker| $)
  (PROG (|u| |j| #1=#:G306 |k| |v| |mat| |n|)
    (RETURN
     (SEQ
      (COND ((NULL |lk|) (CONS 2 'T))
            (#2='T
             (SEQ (LETT |n| (LENGTH |lk|) . #3=(|EFSTRUC;findLinearRelation1|))
                  (LETT |mat|
                        (SPADCALL 1 |n| (|spadConstant| $ 25) (QREFELT $ 76))
                        . #3#)
                  (LETT |v| (MAKEARR1 1 |ker|) . #3#)
                  (SEQ (LETT |k| NIL . #3#) (LETT #1# |lk| . #3#)
                       (LETT |j| 1 . #3#) G190
                       (COND
                        ((OR (|greater_SI| |j| |n|) (ATOM #1#)
                             (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |k| (QREFELT $ 22)))
                           (SPADCALL |mat| 1 |j| |k| (QREFELT $ 77)))
                          ('T
                           (SPADCALL |mat| 1 |j| (|spadConstant| $ 25)
                                     (QREFELT $ 77))))))
                       (LETT |j|
                             (PROG1 (|inc_SI| |j|) (LETT #1# (CDR #1#) . #3#))
                             . #3#)
                       (GO G190) G191 (EXIT NIL))
                  (LETT |u| (SPADCALL |mat| |v| (QREFELT $ 80)) . #3#)
                  (EXIT
                   (COND ((QEQCAR |u| 0) (CONS 0 (QCDR |u|)))
                         (#2# (CONS 2 'T))))))))))) 

(DEFUN |EFSTRUC;transkers| (|x| $)
  (PROG (#1=#:G311 |k| #2=#:G310)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|EFSTRUC;transkers|))
       (SEQ (LETT |k| NIL . #3#) (LETT #1# |x| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (COND
               ((COND
                 ((SPADCALL (SPADCALL |k| (QREFELT $ 84)) (QREFELT $ 82)
                            (QREFELT $ 85))
                  'NIL)
                 ('T 'T))
                (LETT #2# (CONS |k| #2#) . #3#)))))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |EFSTRUC;ktoQ| (|ker| $)
  (PROG (|qu| |z|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |ker| '|log| (QREFELT $ 29))
        (COND
         ((|HasCategory| (QREFELT $ 7)
                         (LIST '|RetractableTo|
                               (LIST '|Fraction| '(|Integer|))))
          (EXIT
           (SEQ
            (LETT |z|
                  (SPADCALL (SPADCALL |ker| (QREFELT $ 31)) 1 (QREFELT $ 86))
                  . #1=(|EFSTRUC;ktoQ|))
            (LETT |qu| (SPADCALL |z| (QREFELT $ 88)) . #1#)
            (EXIT
             (COND ((QEQCAR |qu| 0) (QCDR |qu|))
                   ('T (|spadConstant| $ 81))))))))))
      (EXIT (|spadConstant| $ 81)))))) 

(DEFUN |EFSTRUC;toQ| (|lk| $)
  (PROG (#1=#:G323 |k| #2=#:G322)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|EFSTRUC;toQ|))
       (SEQ (LETT |k| NIL . #3#) (LETT #1# |lk| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (COND
               ((COND ((SPADCALL |k| '|log| (QREFELT $ 29)) 'T)
                      ('T (SPADCALL |k| '|exp| (QREFELT $ 29))))
                (LETT #2# (CONS (|EFSTRUC;ktoQ| |k| $) #2#) . #3#)))))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |EFSTRUC;findLinearRelation2| (|lk| |lz| |ker| $)
  (PROG (|nz| |ly| #1=#:G363 |x| #2=#:G362 #3=#:G361 #4=#:G360 |lpars1f|
         #5=#:G359 |s| #6=#:G358 |lpars1| #7=#:G357 |k| #8=#:G356 |lpars0|
         #9=#:G354 |vv| |lz1tonq| |kertond| |nd| |nq| |qratio| |fratio|
         |Fratio| #10=#:G355 |z1| |i| |m| |kerF| |u| |q| |zkers| |z|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |z| (SPADCALL (SPADCALL |ker| (QREFELT $ 31)) 1 (QREFELT $ 86))
              . #11=(|EFSTRUC;findLinearRelation2|))
        (LETT |zkers| (|EFSTRUC;transkers| (SPADCALL |z| (QREFELT $ 89)) $)
              . #11#)
        (EXIT
         (COND
          ((NULL |zkers|)
           (SEQ (LETT |q| (|EFSTRUC;ktoQ| |ker| $) . #11#)
                (COND
                 ((NULL (SPADCALL |q| (|spadConstant| $ 81) (QREFELT $ 90)))
                  (COND
                   ((NULL
                     (SPADCALL |q|
                               (SPADCALL (|spadConstant| $ 81) (QREFELT $ 91))
                               (QREFELT $ 90)))
                    (EXIT
                     (SEQ
                      (LETT |u|
                            (SPADCALL (|EFSTRUC;toQ| |lk| $) |q|
                                      (QREFELT $ 94))
                            . #11#)
                      (EXIT
                       (COND ((QEQCAR |u| 0) (CONS 0 (QCDR |u|)))
                             (#12='T (CONS 2 'T))))))))))
                (LETT |kerF| (SPADCALL |ker| (QREFELT $ 96)) . #11#)
                (COND
                 ((|domainEqual| (QREFELT $ 7) (|Expression| (QREFELT $ 6)))
                  (COND
                   ((|HasCategory| (QREFELT $ 6)
                                   (LIST '|ConvertibleTo| '(|Float|)))
                    (COND
                     ((|HasCategory| (QREFELT $ 6) '(|IntegralDomain|))
                      (COND
                       ((|HasCategory| (QREFELT $ 6) '(|OrderedSet|))
                        (EXIT
                         (SEQ (LETT |m| (LENGTH |lz|) . #11#)
                              (SEQ (LETT |i| 1 . #11#) (LETT |z1| NIL . #11#)
                                   (LETT #10# |lz| . #11#) G190
                                   (COND
                                    ((OR (ATOM #10#)
                                         (PROGN
                                          (LETT |z1| (CAR #10#) . #11#)
                                          NIL)
                                         (|greater_SI| |i| |m|))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |Fratio|
                                          (SPADCALL |kerF|
                                                    (SPADCALL |z1|
                                                              (QREFELT $ 97))
                                                    (QREFELT $ 15))
                                          . #11#)
                                    (LETT |fratio|
                                          (SPADCALL |Fratio| 20
                                                    (QREFELT $ 101))
                                          . #11#)
                                    (EXIT
                                     (COND
                                      ((QEQCAR |fratio| 0)
                                       (SEQ
                                        (LETT |qratio|
                                              (SPADCALL (QCDR |fratio|) 8
                                                        (QREFELT $ 103))
                                              . #11#)
                                        (COND
                                         ((OR
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL (QCDR |fratio|)
                                                        (SPADCALL |qratio|
                                                                  (QREFELT $
                                                                           104))
                                                        (QREFELT $ 105))
                                              (SPADCALL 1 0 10 (QREFELT $ 106))
                                              (QREFELT $ 107))
                                             (QREFELT $ 108))
                                            (SPADCALL 1 -16 10 (QREFELT $ 106))
                                            (QREFELT $ 109))
                                           (OR
                                            (SPADCALL
                                             (ABS
                                              (LETT |nq|
                                                    (SPADCALL |qratio|
                                                              (QREFELT $ 48))
                                                    . #11#))
                                             100 (QREFELT $ 110))
                                            (SPADCALL
                                             (ABS
                                              (LETT |nd|
                                                    (SPADCALL |qratio|
                                                              (QREFELT $ 39))
                                                    . #11#))
                                             100 (QREFELT $ 110))))
                                          (EXIT "iterate")))
                                        (LETT |kertond|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |ker| (QREFELT $ 31))
                                                1 (QREFELT $ 86))
                                               |nd| (QREFELT $ 111))
                                              . #11#)
                                        (EXIT
                                         (COND
                                          ((SPADCALL |nq| 0 (QREFELT $ 110))
                                           (SEQ
                                            (LETT |lz1tonq|
                                                  (SPADCALL |z1| |nq|
                                                            (QREFELT $ 111))
                                                  . #11#)
                                            (EXIT
                                             (COND
                                              ((SPADCALL |kertond| |lz1tonq|
                                                         (QREFELT $ 33))
                                               (SEQ
                                                (LETT |vv|
                                                      (SPADCALL |m|
                                                                (QREFELT $
                                                                         113))
                                                      . #11#)
                                                (QSETAREF1O |vv| |i| |qratio|
                                                            1)
                                                (EXIT
                                                 (PROGN
                                                  (LETT #9# (CONS 0 |vv|)
                                                        . #11#)
                                                  (GO #9#)))))))))
                                          ('T
                                           (SEQ
                                            (LETT |lz1tonq|
                                                  (SPADCALL |z1| (- |nq|)
                                                            (QREFELT $ 111))
                                                  . #11#)
                                            (EXIT
                                             (COND
                                              ((SPADCALL
                                                (SPADCALL |kertond| |lz1tonq|
                                                          (QREFELT $ 114))
                                                (|spadConstant| $ 61)
                                                (QREFELT $ 33))
                                               (SEQ
                                                (LETT |vv|
                                                      (SPADCALL |m|
                                                                (QREFELT $
                                                                         113))
                                                      . #11#)
                                                (QSETAREF1O |vv| |i| |qratio|
                                                            1)
                                                (EXIT
                                                 (PROGN
                                                  (LETT #9# (CONS 0 |vv|)
                                                        . #11#)
                                                  (GO #9#))))))))))))))))
                                   (LETT #10#
                                         (PROG1 (CDR #10#)
                                           (LETT |i| (|inc_SI| |i|) . #11#))
                                         . #11#)
                                   (GO G190) G191 (EXIT NIL))
                              (EXIT (CONS 2 'T))))))))))))
                (EXIT (CONS 2 'T))))
          (#12#
           (SEQ (LETT |lpars0| (|EFSTRUC;transkers| |lk| $) . #11#)
                (LETT |lpars1|
                      (PROGN
                       (LETT #8# NIL . #11#)
                       (SEQ (LETT |k| NIL . #11#) (LETT #7# |lpars0| . #11#)
                            G190
                            (COND
                             ((OR (ATOM #7#)
                                  (PROGN (LETT |k| (CAR #7#) . #11#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #8# (CONS (SPADCALL (QREFELT $ 115)) #8#)
                                    . #11#)))
                            (LETT #7# (CDR #7#) . #11#) (GO G190) G191
                            (EXIT (NREVERSE #8#))))
                      . #11#)
                (LETT |lpars1f|
                      (PROGN
                       (LETT #6# NIL . #11#)
                       (SEQ (LETT |s| NIL . #11#) (LETT #5# |lpars1| . #11#)
                            G190
                            (COND
                             ((OR (ATOM #5#)
                                  (PROGN (LETT |s| (CAR #5#) . #11#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #6#
                                    (CONS
                                     (SPADCALL (SPADCALL |s| (QREFELT $ 116))
                                               (QREFELT $ 96))
                                     #6#)
                                    . #11#)))
                            (LETT #5# (CDR #5#) . #11#) (GO G190) G191
                            (EXIT (NREVERSE #6#))))
                      . #11#)
                (COND
                 ((SPADCALL |ker| '|log| (QREFELT $ 29))
                  (SEQ
                   (LETT |ly|
                         (PROGN
                          (LETT #4# NIL . #11#)
                          (SEQ (LETT |x| NIL . #11#) (LETT #3# |lz| . #11#)
                               G190
                               (COND
                                ((OR (ATOM #3#)
                                     (PROGN (LETT |x| (CAR #3#) . #11#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #4#
                                       (CONS
                                        (SPADCALL
                                         (SPADCALL |x| |lpars0| |lpars1f|
                                                   (QREFELT $ 118))
                                         (QREFELT $ 97))
                                        #4#)
                                       . #11#)))
                               (LETT #3# (CDR #3#) . #11#) (GO G190) G191
                               (EXIT (NREVERSE #4#))))
                         . #11#)
                   (EXIT
                    (LETT |nz|
                          (SPADCALL
                           (SPADCALL |z| |lpars0| |lpars1f| (QREFELT $ 118))
                           (QREFELT $ 97))
                          . #11#))))
                 ((NULL (SPADCALL |ker| '|atan| (QREFELT $ 29)))
                  (|error|
                   "findLinearRelation2: kernel should be log or atan"))
                 ('T
                  (SEQ
                   (LETT |ly|
                         (PROGN
                          (LETT #2# NIL . #11#)
                          (SEQ (LETT |x| NIL . #11#) (LETT #1# |lz| . #11#)
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |x| (CAR #1#) . #11#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS
                                        (SPADCALL
                                         (SPADCALL |x| |lpars0| |lpars1f|
                                                   (QREFELT $ 118))
                                         (QREFELT $ 119))
                                        #2#)
                                       . #11#)))
                               (LETT #1# (CDR #1#) . #11#) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         . #11#)
                   (EXIT
                    (LETT |nz|
                          (SPADCALL
                           (SPADCALL |z| |lpars0| |lpars1f| (QREFELT $ 118))
                           (QREFELT $ 119))
                          . #11#)))))
                (EXIT (|EFSTRUC;findQRelation| NIL |lpars1| |ly| |nz| $))))))))
      #9# (EXIT #9#))))) 

(DEFUN |EFSTRUC;findRelation| (|lv| |lpar| |lk| |ker| $)
  (PROG (#1=#:G383 |x| #2=#:G382)
    (RETURN
     (SEQ
      (COND
       ((OR (SPADCALL |ker| '|log| (QREFELT $ 29))
            (SPADCALL |ker| '|exp| (QREFELT $ 29)))
        (COND
         ((NULL (SPADCALL (SPADCALL |ker| (QREFELT $ 96)) (QREFELT $ 22)))
          (COND
           ((SPADCALL |ker| '|exp| (QREFELT $ 29))
            (|EFSTRUC;findLinearRelation1| (|EFSTRUC;toY| |lk| $)
             (|EFSTRUC;ktoY| |ker| $) $))
           (#3='T
            (|EFSTRUC;findLinearRelation2| |lk| (|EFSTRUC;toZ| |lk| $) |ker|
             $))))
         (#3#
          (|EFSTRUC;findQRelation| |lv| |lpar| (|EFSTRUC;toY| |lk| $)
           (|EFSTRUC;ktoY| |ker| $) $))))
       ((OR (SPADCALL |ker| '|atan| (QREFELT $ 29))
            (SPADCALL |ker| '|tan| (QREFELT $ 29)))
        (COND
         ((NULL (SPADCALL (SPADCALL |ker| (QREFELT $ 96)) (QREFELT $ 22)))
          (COND
           ((SPADCALL |ker| '|tan| (QREFELT $ 29))
            (|EFSTRUC;findLinearRelation1| (|EFSTRUC;toU| |lk| $)
             (|EFSTRUC;ktoU| |ker| $) $))
           (#3#
            (|EFSTRUC;findLinearRelation2| |lk| (|EFSTRUC;toV| |lk| $) |ker|
             $))))
         (#3#
          (|EFSTRUC;findQRelation| |lv| |lpar| (|EFSTRUC;toU| |lk| $)
           (|EFSTRUC;ktoU| |ker| $) $))))
       ('T
        (COND
         ((SPADCALL |ker| '|nthRoot| (QREFELT $ 29))
          (|EFSTRUC;rootDep| |lk| |ker| $))
         (#3#
          (SEQ
           (COND
            ((QREFELT $ 10)
             (COND
              ((SPADCALL |ker| '|factorial| (QREFELT $ 29))
               (EXIT
                (|EFSTRUC;factdeprel|
                 (PROGN
                  (LETT #2# NIL . #4=(|EFSTRUC;findRelation|))
                  (SEQ (LETT |x| NIL . #4#) (LETT #1# |lk| . #4#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((COND
                            ((SPADCALL |x| '|factorial| (QREFELT $ 29))
                             (SPADCALL |x| |ker| (QREFELT $ 120)))
                            (#3# 'NIL))
                           (LETT #2# (CONS |x| #2#) . #4#)))))
                       (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 |ker| $))))))
           (EXIT (CONS 2 'T))))))))))) 

(DEFUN |EFSTRUC;ktoY| (|k| $)
  (COND ((SPADCALL |k| '|log| (QREFELT $ 29)) (SPADCALL |k| (QREFELT $ 96)))
        ((SPADCALL |k| '|exp| (QREFELT $ 29))
         (|SPADfirst| (SPADCALL |k| (QREFELT $ 31))))
        ('T (|spadConstant| $ 25)))) 

(DEFUN |EFSTRUC;ktoZ| (|k| $)
  (COND
   ((SPADCALL |k| '|log| (QREFELT $ 29))
    (|SPADfirst| (SPADCALL |k| (QREFELT $ 31))))
   ((SPADCALL |k| '|exp| (QREFELT $ 29)) (SPADCALL |k| (QREFELT $ 96)))
   ('T (|spadConstant| $ 25)))) 

(DEFUN |EFSTRUC;ktoU| (|k| $)
  (COND ((SPADCALL |k| '|atan| (QREFELT $ 29)) (SPADCALL |k| (QREFELT $ 96)))
        ((SPADCALL |k| '|tan| (QREFELT $ 29))
         (|SPADfirst| (SPADCALL |k| (QREFELT $ 31))))
        ('T (|spadConstant| $ 25)))) 

(DEFUN |EFSTRUC;ktoV| (|k| $)
  (COND ((SPADCALL |k| '|tan| (QREFELT $ 29)) (SPADCALL |k| (QREFELT $ 96)))
        ((SPADCALL |k| '|atan| (QREFELT $ 29))
         (|SPADfirst| (SPADCALL |k| (QREFELT $ 31))))
        ('T (|spadConstant| $ 25)))) 

(DEFUN |EFSTRUC;smp_map| (|f| |p| $)
  (SPADCALL |f| (ELT $ 121) |p| (QREFELT $ 125))) 

(DEFUN |EFSTRUC;rmap;M2F;27| (|f| |e| $)
  (SPADCALL (|EFSTRUC;smp_map| |f| (SPADCALL |e| (QREFELT $ 127)) $)
            (|EFSTRUC;smp_map| |f| (SPADCALL |e| (QREFELT $ 128)) $)
            (QREFELT $ 15))) 

(DEFUN |EFSTRUC;k2Elem0| (|k| |op| |args| $)
  (PROG (|tz2| |iez| |ez| |z|)
    (RETURN
     (SEQ (LETT |z| (|SPADfirst| |args|) . #1=(|EFSTRUC;k2Elem0|))
          (EXIT
           (COND
            ((SPADCALL |op| '|%power| (QREFELT $ 134))
             (COND ((SPADCALL |z| (QREFELT $ 135)) (|spadConstant| $ 25))
                   (#2='T
                    (SPADCALL
                     (SPADCALL (SPADCALL |args| (QREFELT $ 136))
                               (SPADCALL |z| (QREFELT $ 97)) (QREFELT $ 114))
                     (QREFELT $ 137)))))
            ((SPADCALL |op| '|cot| (QREFELT $ 134))
             (SPADCALL (SPADCALL |z| (QREFELT $ 55)) (QREFELT $ 54)))
            ((SPADCALL |op| '|acot| (QREFELT $ 134))
             (SPADCALL (SPADCALL |z| (QREFELT $ 54)) (QREFELT $ 119)))
            ((SPADCALL |op| '|asin| (QREFELT $ 134))
             (SPADCALL
              (SPADCALL |z|
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 61)
                                   (SPADCALL |z| 2 (QREFELT $ 138))
                                   (QREFELT $ 139))
                         (QREFELT $ 140))
                        (QREFELT $ 15))
              (QREFELT $ 119)))
            ((SPADCALL |op| '|acos| (QREFELT $ 134))
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL (|spadConstant| $ 61)
                          (SPADCALL |z| 2 (QREFELT $ 138)) (QREFELT $ 139))
                (QREFELT $ 140))
               |z| (QREFELT $ 15))
              (QREFELT $ 119)))
            ((SPADCALL |op| '|asec| (QREFELT $ 134))
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL |z| 2 (QREFELT $ 138)) (|spadConstant| $ 61)
                         (QREFELT $ 139))
               (QREFELT $ 140))
              (QREFELT $ 119)))
            ((SPADCALL |op| '|acsc| (QREFELT $ 134))
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL (SPADCALL |z| 2 (QREFELT $ 138))
                          (|spadConstant| $ 61) (QREFELT $ 139))
                (QREFELT $ 140))
               (QREFELT $ 54))
              (QREFELT $ 119)))
            ((SPADCALL |op| '|asinh| (QREFELT $ 134))
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL (|spadConstant| $ 61)
                          (SPADCALL |z| 2 (QREFELT $ 138)) (QREFELT $ 141))
                (QREFELT $ 140))
               |z| (QREFELT $ 141))
              (QREFELT $ 97)))
            ((SPADCALL |op| '|acosh| (QREFELT $ 134))
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL (SPADCALL |z| 2 (QREFELT $ 138))
                          (|spadConstant| $ 61) (QREFELT $ 139))
                (QREFELT $ 140))
               |z| (QREFELT $ 141))
              (QREFELT $ 97)))
            ((SPADCALL |op| '|atanh| (QREFELT $ 134))
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL |z| (|spadConstant| $ 61) (QREFELT $ 141))
                         (SPADCALL (|spadConstant| $ 61) |z| (QREFELT $ 139))
                         (QREFELT $ 15))
               (QREFELT $ 97))
              (SPADCALL 2 (QREFELT $ 13)) (QREFELT $ 15)))
            ((SPADCALL |op| '|acoth| (QREFELT $ 134))
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL |z| (|spadConstant| $ 61) (QREFELT $ 141))
                         (SPADCALL |z| (|spadConstant| $ 61) (QREFELT $ 139))
                         (QREFELT $ 15))
               (QREFELT $ 97))
              (SPADCALL 2 (QREFELT $ 13)) (QREFELT $ 15)))
            ((SPADCALL |op| '|asech| (QREFELT $ 134))
             (SPADCALL
              (SPADCALL (SPADCALL |z| (QREFELT $ 54))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| 2 (QREFELT $ 138))
                                    (QREFELT $ 54))
                          (|spadConstant| $ 61) (QREFELT $ 139))
                         (QREFELT $ 140))
                        (QREFELT $ 141))
              (QREFELT $ 97)))
            ((SPADCALL |op| '|acsch| (QREFELT $ 134))
             (SPADCALL
              (SPADCALL (SPADCALL |z| (QREFELT $ 54))
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 61)
                                   (SPADCALL (SPADCALL |z| 2 (QREFELT $ 138))
                                             (QREFELT $ 54))
                                   (QREFELT $ 141))
                         (QREFELT $ 140))
                        (QREFELT $ 141))
              (QREFELT $ 97)))
            ((OR (SPADCALL |op| '|%paren| (QREFELT $ 134))
                 (SPADCALL |op| '|%box| (QREFELT $ 134)))
             (COND ((NULL (CDR |args|)) |z|)
                   (#2# (SPADCALL |k| (QREFELT $ 96)))))
            ('T
             (SEQ
              (COND
               ((SPADCALL |op| (QREFELT $ 8) (QREFELT $ 85))
                (LETT |iez|
                      (SPADCALL
                       (LETT |ez| (SPADCALL |z| (QREFELT $ 137)) . #1#)
                       (QREFELT $ 54))
                      . #1#)))
              (EXIT
               (COND
                ((SPADCALL |op| '|sinh| (QREFELT $ 134))
                 (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 139))
                           (SPADCALL 2 (QREFELT $ 13)) (QREFELT $ 15)))
                ((SPADCALL |op| '|cosh| (QREFELT $ 134))
                 (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 141))
                           (SPADCALL 2 (QREFELT $ 13)) (QREFELT $ 15)))
                ((SPADCALL |op| '|tanh| (QREFELT $ 134))
                 (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 139))
                           (SPADCALL |ez| |iez| (QREFELT $ 141))
                           (QREFELT $ 15)))
                ((SPADCALL |op| '|coth| (QREFELT $ 134))
                 (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 141))
                           (SPADCALL |ez| |iez| (QREFELT $ 139))
                           (QREFELT $ 15)))
                ((SPADCALL |op| '|sech| (QREFELT $ 134))
                 (SPADCALL 2
                           (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 141))
                                     (QREFELT $ 54))
                           (QREFELT $ 142)))
                ((SPADCALL |op| '|csch| (QREFELT $ 134))
                 (SPADCALL 2
                           (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 139))
                                     (QREFELT $ 54))
                           (QREFELT $ 142)))
                (#2#
                 (SEQ
                  (COND
                   ((SPADCALL |op| (QREFELT $ 9) (QREFELT $ 85))
                    (LETT |tz2|
                          (SPADCALL
                           (SPADCALL |z| (SPADCALL 2 (QREFELT $ 13))
                                     (QREFELT $ 15))
                           (QREFELT $ 55))
                          . #1#)))
                  (EXIT
                   (COND
                    ((SPADCALL |op| '|sin| (QREFELT $ 134))
                     (SPADCALL (SPADCALL 2 |tz2| (QREFELT $ 142))
                               (SPADCALL (|spadConstant| $ 61)
                                         (SPADCALL |tz2| 2 (QREFELT $ 138))
                                         (QREFELT $ 141))
                               (QREFELT $ 15)))
                    ((SPADCALL |op| '|cos| (QREFELT $ 134))
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 61)
                                (SPADCALL |tz2| 2 (QREFELT $ 138))
                                (QREFELT $ 139))
                      (SPADCALL (|spadConstant| $ 61)
                                (SPADCALL |tz2| 2 (QREFELT $ 138))
                                (QREFELT $ 141))
                      (QREFELT $ 15)))
                    ((SPADCALL |op| '|sec| (QREFELT $ 134))
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 61)
                                (SPADCALL |tz2| 2 (QREFELT $ 138))
                                (QREFELT $ 141))
                      (SPADCALL (|spadConstant| $ 61)
                                (SPADCALL |tz2| 2 (QREFELT $ 138))
                                (QREFELT $ 139))
                      (QREFELT $ 15)))
                    ((SPADCALL |op| '|csc| (QREFELT $ 134))
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 61)
                                (SPADCALL |tz2| 2 (QREFELT $ 138))
                                (QREFELT $ 141))
                      (SPADCALL 2 |tz2| (QREFELT $ 142)) (QREFELT $ 15)))
                    (#2# (SPADCALL |op| |args| (QREFELT $ 144))))))))))))))))) 

(DEFUN |EFSTRUC;k_to_liou| (|k| $)
  (PROG (|dvs| #1=#:G449 |v| #2=#:G448 |vfs| #3=#:G447 #4=#:G446 |vars| |kf1|
         |args| #5=#:G445 |a| #6=#:G444 |op|)
    (RETURN
     (SEQ (LETT |op| (SPADCALL |k| (QREFELT $ 84)) . #7=(|EFSTRUC;k_to_liou|))
          (LETT |args|
                (PROGN
                 (LETT #6# NIL . #7#)
                 (SEQ (LETT |a| NIL . #7#)
                      (LETT #5# (SPADCALL |k| (QREFELT $ 31)) . #7#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |a| (CAR #5#) . #7#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6# (CONS (SPADCALL |a| (QREFELT $ 24)) #6#)
                              . #7#)))
                      (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #7#)
          (EXIT
           (COND ((NULL |args|) (SPADCALL |k| (QREFELT $ 96)))
                 ('T
                  (SEQ
                   (COND
                    ((SPADCALL |op| '|prim| (QREFELT $ 85))
                     (COND
                      ((NULL (SPADCALL |op| '|%iint| (QREFELT $ 134)))
                       (EXIT
                        (SEQ
                         (LETT |kf1| (SPADCALL |op| |args| (QREFELT $ 144))
                               . #7#)
                         (LETT |vars| (SPADCALL |kf1| (QREFELT $ 22)) . #7#)
                         (LETT |vfs|
                               (PROGN
                                (LETT #4# NIL . #7#)
                                (SEQ (LETT |v| NIL . #7#)
                                     (LETT #3# |vars| . #7#) G190
                                     (COND
                                      ((OR (ATOM #3#)
                                           (PROGN
                                            (LETT |v| (CAR #3#) . #7#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #4#
                                             (CONS
                                              (SPADCALL |v| (QREFELT $ 145))
                                              #4#)
                                             . #7#)))
                                     (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                                     (EXIT (NREVERSE #4#))))
                               . #7#)
                         (LETT |dvs|
                               (PROGN
                                (LETT #2# NIL . #7#)
                                (SEQ (LETT |v| NIL . #7#)
                                     (LETT #1# |vars| . #7#) G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN
                                            (LETT |v| (CAR #1#) . #7#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS
                                              (SPADCALL
                                               (SPADCALL |kf1| |v|
                                                         (QREFELT $ 146))
                                               (QREFELT $ 24))
                                              #2#)
                                             . #7#)))
                                     (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                                     (EXIT (NREVERSE #2#))))
                               . #7#)
                         (EXIT
                          (SPADCALL (QREFELT $ 133)
                                    (SPADCALL |vfs| |dvs| (QREFELT $ 65))
                                    (QREFELT $ 147)))))))))
                   (EXIT (|EFSTRUC;k2Elem0| |k| |op| |args| $)))))))))) 

(DEFUN |EFSTRUC;k2Elem| (|k| |l| $)
  (PROG (|args| #1=#:G454 |a| #2=#:G453 |op|)
    (RETURN
     (SEQ (LETT |op| (SPADCALL |k| (QREFELT $ 84)) . #3=(|EFSTRUC;k2Elem|))
          (LETT |args|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |a| NIL . #3#)
                      (LETT #1# (SPADCALL |k| (QREFELT $ 31)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (|EFSTRUC;realElem| |a| |l| $) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT
           (COND ((NULL |args|) (SPADCALL |k| (QREFELT $ 96)))
                 ('T (|EFSTRUC;k2Elem0| |k| |op| |args| $)))))))) 

(DEFUN |EFSTRUC;depeval| (|f| |lk| |k| |v| $)
  (COND
   ((SPADCALL |k| '|log| (QREFELT $ 29))
    (|EFSTRUC;logeval| |f| |lk| |k| |v| $))
   ((SPADCALL |k| '|exp| (QREFELT $ 29))
    (|EFSTRUC;expeval| |f| |lk| |k| |v| $))
   ((SPADCALL |k| '|tan| (QREFELT $ 29))
    (|EFSTRUC;taneval| |f| |lk| |k| |v| $))
   ((SPADCALL |k| '|atan| (QREFELT $ 29))
    (|EFSTRUC;ataneval| |f| |lk| |k| |v| $))
   ((SPADCALL |k| '|nthRoot| (QREFELT $ 29))
    (|EFSTRUC;rooteval| |f| |lk| |k|
     (SPADCALL |v| (SPADCALL |v| (QREFELT $ 148)) (QREFELT $ 149)) $))
   ('T (VECTOR |f| NIL NIL)))) 

(DEFUN |EFSTRUC;rooteval| (|f| |lk| |k| |n| $)
  (PROG (|lv| #1=#:G470 |r| #2=#:G469 |l| #3=#:G468 #4=#:G467 |nv| |m| |x|)
    (RETURN
     (SEQ
      (LETT |nv|
            (SPADCALL
             (LETT |x| (|SPADfirst| (SPADCALL |k| (QREFELT $ 31)))
                   . #5=(|EFSTRUC;rooteval|))
             (LETT |m| (SPADCALL |n| (QREFELT $ 150)) . #5#) (QREFELT $ 151))
            . #5#)
      (LETT |l|
            (PROGN
             (LETT #4# NIL . #5#)
             (SEQ (LETT |r| NIL . #5#)
                  (LETT #3# (CONS |k| (|EFSTRUC;toR| |lk| |x| $)) . #5#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |r| (CAR #3#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |r| (QREFELT $ 31))
                                  (QREFELT $ 152))
                        (QREFELT $ 153))
                       |m| (QREFELT $ 154))
                      (LETT #4# (CONS |r| #4#) . #5#)))))
                  (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            . #5#)
      (LETT |lv|
            (PROGN
             (LETT #2# NIL . #5#)
             (SEQ (LETT |r| NIL . #5#) (LETT #1# |l| . #5#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (SPADCALL |nv|
                                     (SPADCALL |n|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL |r| (QREFELT $ 31))
                                                  (QREFELT $ 152))
                                                 (QREFELT $ 153))
                                                (QREFELT $ 155))
                                               (QREFELT $ 156))
                                     (QREFELT $ 157))
                           #2#)
                          . #5#)))
                  (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #5#)
      (EXIT (VECTOR (SPADCALL |f| |l| |lv| (QREFELT $ 118)) |l| |lv|)))))) 

(DEFUN |EFSTRUC;ataneval| (|f| |lk| |k| |v| $)
  (PROG (|g| |h| |d| #1=#:G474 #2=#:G473 #3=#:G475 #4=#:G482 |i| #5=#:G483 |x|
         |s| #6=#:G480 #7=#:G481 #8=#:G479 |w|)
    (RETURN
     (SEQ
      (LETT |w| (|SPADfirst| (SPADCALL |k| (QREFELT $ 31)))
            . #9=(|EFSTRUC;ataneval|))
      (LETT |s|
            (SPADCALL
             (PROGN
              (LETT #8# NIL . #9#)
              (SEQ (LETT |x| NIL . #9#) (LETT #7# (|EFSTRUC;toV| |lk| $) . #9#)
                   (LETT |i| (SPADCALL |v| (QREFELT $ 148)) . #9#)
                   (LETT #6# (QVSIZE |v|) . #9#) G190
                   (COND
                    ((OR (> |i| #6#) (ATOM #7#)
                         (PROGN (LETT |x| (CAR #7#) . #9#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #8#
                           (CONS
                            (SPADCALL (QAREF1O |v| |i| 1) |x| (QREFELT $ 50))
                            #8#)
                           . #9#)))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT #7# (CDR #7#) . #9#))
                         . #9#)
                   (GO G190) G191 (EXIT (NREVERSE #8#))))
             (QREFELT $ 53))
            . #9#)
      (LETT |g|
            (PROGN
             (LETT #1# NIL . #9#)
             (SEQ (LETT |x| NIL . #9#) (LETT #5# (|EFSTRUC;toU| |lk| $) . #9#)
                  (LETT |i| (SPADCALL |v| (QREFELT $ 148)) . #9#)
                  (LETT #4# (QVSIZE |v|) . #9#) G190
                  (COND
                   ((OR (> |i| #4#) (ATOM #5#)
                        (PROGN (LETT |x| (CAR #5#) . #9#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #3#
                           (SPADCALL (QAREF1O |v| |i| 1) |x| (QREFELT $ 158))
                           . #9#)
                     (COND
                      (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 141)) . #9#))
                      ('T (PROGN (LETT #2# #3# . #9#) (LETT #1# 'T . #9#)))))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT #5# (CDR #5#) . #9#)) . #9#)
                  (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#10='T (|spadConstant| $ 25))))
            . #9#)
      (LETT |h|
            (COND
             ((SPADCALL
               (LETT |d|
                     (SPADCALL (|spadConstant| $ 61)
                               (SPADCALL |s| |w| (QREFELT $ 114))
                               (QREFELT $ 141))
                     . #9#)
               (QREFELT $ 135))
              (QREFELT $ 16))
             (#10#
              (SPADCALL
               (SPADCALL (SPADCALL |w| |s| (QREFELT $ 139)) |d| (QREFELT $ 15))
               (QREFELT $ 119))))
            . #9#)
      (LETT |g| (SPADCALL |g| |h| (QREFELT $ 141)) . #9#)
      (EXIT
       (VECTOR (SPADCALL |f| (LIST |k|) (LIST |g|) (QREFELT $ 118)) (LIST |k|)
               (LIST |g|))))))) 

(DEFUN |EFSTRUC;gdCoef?| (|c| |v| $)
  (PROG (#1=#:G488 #2=#:G490 #3=#:G491 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ
           (LETT |i| (SPADCALL |v| (QREFELT $ 148)) . #4=(|EFSTRUC;gdCoef?|))
           (LETT #3# (QVSIZE |v|) . #4#) G190 (COND ((> |i| #3#) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((QEQCAR
                (SPADCALL (SPADCALL (QAREF1O |v| |i| 1) |c| (QREFELT $ 156))
                          (QREFELT $ 159))
                1)
               (PROGN
                (LETT #1# (PROGN (LETT #2# 'NIL . #4#) (GO #2#)) . #4#)
                (GO #1#))))))
           (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |EFSTRUC;goodCoef| (|v| |l| |s| $)
  (PROG (#1=#:G519 #2=#:G521 |r| #3=#:G525 |i| #4=#:G526 |k| |h| |j| |h1|
         #5=#:G523 #6=#:G524 |ll| #7=#:G522)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |h| 0 . #8=(|EFSTRUC;goodCoef|)) (LETT |j| 0 . #8#)
            (LETT |ll| NIL . #8#)
            (SEQ (LETT |k| NIL . #8#) (LETT #7# |l| . #8#) G190
                 (COND
                  ((OR (ATOM #7#) (PROGN (LETT |k| (CAR #7#) . #8#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (SPADCALL |k| '|log| (QREFELT $ 29))
                         (OR (SPADCALL |k| '|exp| (QREFELT $ 29))
                             (OR (SPADCALL |k| '|tan| (QREFELT $ 29))
                                 (SPADCALL |k| '|atan| (QREFELT $ 29)))))
                     (SEQ (LETT |ll| (CONS |k| |ll|) . #8#)
                          (EXIT (LETT |h| (+ |h| 1) . #8#)))))))
                 (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
            (COND
             ((NULL
               (EQL |h| (+ (- (QVSIZE |v|) (SPADCALL |v| (QREFELT $ 148))) 1)))
              (EXIT (CONS 1 "failed"))))
            (LETT |h| 0 . #8#) (LETT |ll| (REVERSE |ll|) . #8#)
            (SEQ (LETT |k| NIL . #8#) (LETT #6# |ll| . #8#)
                 (LETT |i| (SPADCALL |v| (QREFELT $ 148)) . #8#)
                 (LETT #5# (QVSIZE |v|) . #8#) G190
                 (COND
                  ((OR (> |i| #5#) (ATOM #6#)
                       (PROGN (LETT |k| (CAR #6#) . #8#) NIL))
                   (GO G191)))
                 (SEQ (LETT |h1| (SPADCALL |k| (QREFELT $ 160)) . #8#)
                      (EXIT
                       (COND
                        ((SPADCALL |h1| |h| (QREFELT $ 161))
                         (SEQ (LETT |j| |i| . #8#)
                              (EXIT (LETT |h| |h1| . #8#)))))))
                 (LETT |i| (PROG1 (+ |i| 1) (LETT #6# (CDR #6#) . #8#)) . #8#)
                 (GO G190) G191 (EXIT NIL))
            (SEQ
             (EXIT
              (SEQ (LETT |k| NIL . #8#) (LETT #4# |ll| . #8#)
                   (LETT |i| (SPADCALL |v| (QREFELT $ 148)) . #8#)
                   (LETT #3# (QVSIZE |v|) . #8#) G190
                   (COND
                    ((OR (> |i| #3#) (ATOM #4#)
                         (PROGN (LETT |k| (CAR #4#) . #8#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |k| |s| (QREFELT $ 29))
                       (COND
                        ((>= |i| |j|)
                         (SEQ
                          (LETT |r|
                                (SPADCALL (QAREF1O |v| |i| 1) (QREFELT $ 163))
                                . #8#)
                          (EXIT
                           (COND
                            ((QEQCAR |r| 0)
                             (COND
                              ((QEQCAR (SPADCALL (QCDR |r|) (QREFELT $ 159)) 0)
                               (COND
                                ((|EFSTRUC;gdCoef?| (QAREF1O |v| |i| 1) |v| $)
                                 (PROGN
                                  (LETT #1#
                                        (PROGN
                                         (LETT #2# (CONS 0 (CONS |i| |k|))
                                               . #8#)
                                         (GO #2#))
                                        . #8#)
                                  (GO #1#))))))))))))))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT #4# (CDR #4#) . #8#))
                         . #8#)
                   (GO G190) G191 (EXIT NIL)))
             #1# (EXIT #1#))
            (EXIT (CONS 1 "failed"))))
      #2# (EXIT #2#))))) 

(DEFUN |EFSTRUC;taneval| (|f| |lk| |k| |v| $)
  (PROG (|g| #1=#:G548 |a| #2=#:G549 |x| #3=#:G547 |l| #4=#:G546 |kk| #5=#:G545
         |lv| #6=#:G544 |i| #7=#:G543 |v0| |rec| |c| #8=#:G529 #9=#:G528
         #10=#:G530 #11=#:G541 #12=#:G542 |fns| |u|)
    (RETURN
     (SEQ
      (LETT |u| (|SPADfirst| (SPADCALL |k| (QREFELT $ 31)))
            . #13=(|EFSTRUC;taneval|))
      (LETT |fns| (|EFSTRUC;toU| |lk| $) . #13#)
      (LETT |c|
            (SPADCALL |u|
                      (PROGN
                       (LETT #8# NIL . #13#)
                       (SEQ (LETT |x| NIL . #13#) (LETT #12# |fns| . #13#)
                            (LETT |i| (SPADCALL |v| (QREFELT $ 148)) . #13#)
                            (LETT #11# (QVSIZE |v|) . #13#) G190
                            (COND
                             ((OR (> |i| #11#) (ATOM #12#)
                                  (PROGN (LETT |x| (CAR #12#) . #13#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #10#
                                     (SPADCALL (QAREF1O |v| |i| 1) |x|
                                               (QREFELT $ 158))
                                     . #13#)
                               (COND
                                (#8#
                                 (LETT #9# (SPADCALL #9# #10# (QREFELT $ 141))
                                       . #13#))
                                ('T
                                 (PROGN
                                  (LETT #9# #10# . #13#)
                                  (LETT #8# 'T . #13#)))))))
                            (LETT |i|
                                  (PROG1 (+ |i| 1)
                                    (LETT #12# (CDR #12#) . #13#))
                                  . #13#)
                            (GO G190) G191 (EXIT NIL))
                       (COND (#8# #9#) (#14='T (|spadConstant| $ 25))))
                      (QREFELT $ 139))
            . #13#)
      (LETT |rec| (|EFSTRUC;goodCoef| |v| |lk| '|tan| $) . #13#)
      (EXIT
       (COND
        ((QEQCAR |rec| 1) (|EFSTRUC;tannosimp| |f| |lk| |k| |v| |fns| |c| $))
        (#14#
         (SEQ
          (LETT |v0|
                (SPADCALL
                 (SPADCALL (QAREF1O |v| (QCAR (QCDR |rec|)) 1) (QREFELT $ 164))
                 (QREFELT $ 150))
                . #13#)
          (LETT |lv|
                (PROGN
                 (LETT #7# NIL . #13#)
                 (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 148)) . #13#)
                      (LETT #6# (QVSIZE |v|) . #13#) G190
                      (COND ((> |i| #6#) (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |i| (QCAR (QCDR |rec|)) (QREFELT $ 154))
                          (LETT #7# (CONS (QAREF1O |v| |i| 1) #7#) . #13#)))))
                      (LETT |i| (+ |i| 1) . #13#) (GO G190) G191
                      (EXIT (NREVERSE #7#))))
                . #13#)
          (LETT |l|
                (PROGN
                 (LETT #5# NIL . #13#)
                 (SEQ (LETT |kk| NIL . #13#) (LETT #4# |lk| . #13#) G190
                      (COND
                       ((OR (ATOM #4#)
                            (PROGN (LETT |kk| (CAR #4#) . #13#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |kk| (QCDR (QCDR |rec|)) (QREFELT $ 120))
                          (LETT #5# (CONS |kk| #5#) . #13#)))))
                      (LETT #4# (CDR #4#) . #13#) (GO G190) G191
                      (EXIT (NREVERSE #5#))))
                . #13#)
          (LETT |g|
                (|EFSTRUC;tanSum|
                 (SPADCALL (SPADCALL |v0| |c| (QREFELT $ 165)) (QREFELT $ 14))
                 (CONS
                  (SPADCALL (SPADCALL |k| (QREFELT $ 96)) |v0| (QREFELT $ 49))
                  (PROGN
                   (LETT #3# NIL . #13#)
                   (SEQ (LETT |x| NIL . #13#)
                        (LETT #2# (|EFSTRUC;toV| |l| $) . #13#)
                        (LETT |a| NIL . #13#) (LETT #1# |lv| . #13#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |a| (CAR #1#) . #13#) NIL)
                              (ATOM #2#)
                              (PROGN (LETT |x| (CAR #2#) . #13#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #3#
                                (CONS
                                 (SPADCALL |x|
                                           (-
                                            (SPADCALL
                                             (SPADCALL |a| |v0|
                                                       (QREFELT $ 166))
                                             (QREFELT $ 150)))
                                           (QREFELT $ 49))
                                 #3#)
                                . #13#)))
                        (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #13#))
                              . #13#)
                        (GO G190) G191 (EXIT (NREVERSE #3#)))))
                 $)
                . #13#)
          (EXIT
           (VECTOR
            (SPADCALL |f| (LIST (QCDR (QCDR |rec|))) (LIST |g|)
                      (QREFELT $ 118))
            (LIST (QCDR (QCDR |rec|))) (LIST |g|))))))))))) 

(DEFUN |EFSTRUC;tannosimp| (|f| |lk| |k| |v| |fns| |c| $)
  (PROG (|h| |i| #1=#:G582 |x| #2=#:G581 |lk1| |newtan| #3=#:G579 #4=#:G580 |t|
         #5=#:G578 |li| #6=#:G577 #7=#:G576 #8=#:G575 |newt| #9=#:G574 |u|
         #10=#:G573 |dd| |d| |cd| #11=#:G572 #12=#:G571 #13=#:G570 #14=#:G569
         |n|)
    (RETURN
     (SEQ (LETT |n| (QVSIZE |v|) . #15=(|EFSTRUC;tannosimp|))
          (LETT |lk|
                (PROGN
                 (LETT #14# NIL . #15#)
                 (SEQ (LETT |x| NIL . #15#) (LETT #13# |lk| . #15#) G190
                      (COND
                       ((OR (ATOM #13#)
                            (PROGN (LETT |x| (CAR #13#) . #15#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((COND ((SPADCALL |x| '|tan| (QREFELT $ 29)) 'T)
                                (#16='T (SPADCALL |x| '|atan| (QREFELT $ 29))))
                          (LETT #14# (CONS |x| #14#) . #15#)))))
                      (LETT #13# (CDR #13#) . #15#) (GO G190) G191
                      (EXIT (NREVERSE #14#))))
                . #15#)
          (LETT |lk1|
                (PROGN
                 (LETT #12# NIL . #15#)
                 (SEQ (LETT |i| 1 . #15#) (LETT |x| NIL . #15#)
                      (LETT #11# |lk| . #15#) G190
                      (COND
                       ((OR (ATOM #11#)
                            (PROGN (LETT |x| (CAR #11#) . #15#) NIL)
                            (|greater_SI| |i| |n|))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((COND
                           ((SPADCALL (QAREF1O |v| |i| 1)
                                      (|spadConstant| $ 167) (QREFELT $ 90))
                            'NIL)
                           (#16# 'T))
                          (LETT #12# (CONS |x| #12#) . #15#)))))
                      (LETT #11#
                            (PROG1 (CDR #11#) (LETT |i| (|inc_SI| |i|) . #15#))
                            . #15#)
                      (GO G190) G191 (EXIT (NREVERSE #12#))))
                . #15#)
          (EXIT
           (COND
            ((SPADCALL (CONS #'|EFSTRUC;tannosimp!0| $) |lk1| (QREFELT $ 168))
             (SEQ
              (LETT |dd|
                    (SPADCALL
                     (LETT |d|
                           (QCDR
                            (LETT |cd| (SPADCALL |v| (QREFELT $ 171)) . #15#))
                           . #15#)
                     (QREFELT $ 13))
                    . #15#)
              (LETT |newt|
                    (PROGN
                     (LETT #10# NIL . #15#)
                     (SEQ (LETT |i| 1 . #15#) (LETT |u| NIL . #15#)
                          (LETT #9# |fns| . #15#) G190
                          (COND
                           ((OR (ATOM #9#)
                                (PROGN (LETT |u| (CAR #9#) . #15#) NIL)
                                (|greater_SI| |i| |n|))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((COND
                               ((SPADCALL (QAREF1O |v| |i| 1)
                                          (|spadConstant| $ 167)
                                          (QREFELT $ 90))
                                'NIL)
                               (#16# 'T))
                              (LETT #10#
                                    (CONS
                                     (SPADCALL
                                      (SPADCALL |u| |dd| (QREFELT $ 15))
                                      (QREFELT $ 55))
                                     #10#)
                                    . #15#)))))
                          (LETT #9#
                                (PROG1 (CDR #9#)
                                  (LETT |i| (|inc_SI| |i|) . #15#))
                                . #15#)
                          (GO G190) G191 (EXIT (NREVERSE #10#))))
                    . #15#)
              (LETT |newtan|
                    (PROGN
                     (LETT #8# NIL . #15#)
                     (SEQ (LETT |t| NIL . #15#) (LETT #7# |newt| . #15#) G190
                          (COND
                           ((OR (ATOM #7#)
                                (PROGN (LETT |t| (CAR #7#) . #15#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #8#
                                  (CONS (SPADCALL |t| |d| (QREFELT $ 49)) #8#)
                                  . #15#)))
                          (LETT #7# (CDR #7#) . #15#) (GO G190) G191
                          (EXIT (NREVERSE #8#))))
                    . #15#)
              (LETT |li|
                    (PROGN
                     (LETT #6# NIL . #15#)
                     (SEQ (LETT |i| 1 . #15#) G190
                          (COND ((|greater_SI| |i| |n|) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((COND
                               ((SPADCALL (QAREF1O |v| |i| 1)
                                          (|spadConstant| $ 167)
                                          (QREFELT $ 90))
                                'NIL)
                               (#16# 'T))
                              (LETT #6# (CONS |i| #6#) . #15#)))))
                          (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                          (EXIT (NREVERSE #6#))))
                    . #15#)
              (LETT |h|
                    (|EFSTRUC;tanSum| |c|
                     (PROGN
                      (LETT #5# NIL . #15#)
                      (SEQ (LETT |t| NIL . #15#) (LETT #4# |newt| . #15#)
                           (LETT |i| NIL . #15#) (LETT #3# |li| . #15#) G190
                           (COND
                            ((OR (ATOM #3#)
                                 (PROGN (LETT |i| (CAR #3#) . #15#) NIL)
                                 (ATOM #4#)
                                 (PROGN (LETT |t| (CAR #4#) . #15#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #5#
                                   (CONS
                                    (SPADCALL |t| (QAREF1O (QCAR |cd|) |i| 1)
                                              (QREFELT $ 49))
                                    #5#)
                                   . #15#)))
                           (LETT #3#
                                 (PROG1 (CDR #3#) (LETT #4# (CDR #4#) . #15#))
                                 . #15#)
                           (GO G190) G191 (EXIT (NREVERSE #5#))))
                     $)
                    . #15#)
              (LETT |newtan| (CONS |h| |newtan|) . #15#)
              (LETT |lk1| (CONS |k| |lk1|) . #15#)
              (EXIT
               (VECTOR (SPADCALL |f| |lk1| |newtan| (QREFELT $ 118)) |lk1|
                       |newtan|))))
            (#16#
             (SEQ
              (LETT |h|
                    (|EFSTRUC;tanSum| |c|
                     (PROGN
                      (LETT #2# NIL . #15#)
                      (SEQ (LETT |x| NIL . #15#)
                           (LETT #1# (|EFSTRUC;toV| |lk| $) . #15#)
                           (LETT |i| 1 . #15#) G190
                           (COND
                            ((OR (|greater_SI| |i| |n|) (ATOM #1#)
                                 (PROGN (LETT |x| (CAR #1#) . #15#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (SPADCALL (QAREF1O |v| |i| 1) |x|
                                              (QREFELT $ 50))
                                    #2#)
                                   . #15#)))
                           (LETT |i|
                                 (PROG1 (|inc_SI| |i|)
                                   (LETT #1# (CDR #1#) . #15#))
                                 . #15#)
                           (GO G190) G191 (EXIT (NREVERSE #2#))))
                     $)
                    . #15#)
              (EXIT
               (VECTOR (SPADCALL |f| (LIST |k|) (LIST |h|) (QREFELT $ 118))
                       (LIST |k|) (LIST |h|))))))))))) 

(DEFUN |EFSTRUC;tannosimp!0| (|x| $) (SPADCALL |x| '|tan| (QREFELT $ 29))) 

(DEFUN |EFSTRUC;expnosimp| (|f| |lk| |k| |v| |fns| |g| $)
  (PROG (|h| #1=#:G679 #2=#:G678 #3=#:G680 #4=#:G695 |i| #5=#:G696 |y| |newexp|
         |lk1| #6=#:G636 #7=#:G635 #8=#:G637 #9=#:G693 #10=#:G694 |e| |li|
         #11=#:G692 #12=#:G691 #13=#:G690 |newe| #14=#:G689 #15=#:G688 |dd| |d|
         |cd| #16=#:G687 |x| #17=#:G686 #18=#:G685 #19=#:G684 |n|)
    (RETURN
     (SEQ (LETT |n| (QVSIZE |v|) . #20=(|EFSTRUC;expnosimp|))
          (LETT |lk|
                (PROGN
                 (LETT #19# NIL . #20#)
                 (SEQ (LETT |x| NIL . #20#) (LETT #18# |lk| . #20#) G190
                      (COND
                       ((OR (ATOM #18#)
                            (PROGN (LETT |x| (CAR #18#) . #20#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((COND ((SPADCALL |x| '|exp| (QREFELT $ 29)) 'T)
                                (#21='T (SPADCALL |x| '|log| (QREFELT $ 29))))
                          (LETT #19# (CONS |x| #19#) . #20#)))))
                      (LETT #18# (CDR #18#) . #20#) (GO G190) G191
                      (EXIT (NREVERSE #19#))))
                . #20#)
          (LETT |lk1|
                (PROGN
                 (LETT #17# NIL . #20#)
                 (SEQ (LETT |i| 1 . #20#) (LETT |x| NIL . #20#)
                      (LETT #16# |lk| . #20#) G190
                      (COND
                       ((OR (ATOM #16#)
                            (PROGN (LETT |x| (CAR #16#) . #20#) NIL)
                            (|greater_SI| |i| |n|))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((COND
                           ((SPADCALL (QAREF1O |v| |i| 1)
                                      (|spadConstant| $ 167) (QREFELT $ 90))
                            'NIL)
                           (#21# 'T))
                          (LETT #17# (CONS |x| #17#) . #20#)))))
                      (LETT #16#
                            (PROG1 (CDR #16#) (LETT |i| (|inc_SI| |i|) . #20#))
                            . #20#)
                      (GO G190) G191 (EXIT (NREVERSE #17#))))
                . #20#)
          (EXIT
           (COND
            ((SPADCALL (CONS #'|EFSTRUC;expnosimp!0| $) |lk1| (QREFELT $ 168))
             (SEQ
              (LETT |dd|
                    (SPADCALL
                     (LETT |d|
                           (QCDR
                            (LETT |cd| (SPADCALL |v| (QREFELT $ 171)) . #20#))
                           . #20#)
                     (QREFELT $ 13))
                    . #20#)
              (LETT |newe|
                    (PROGN
                     (LETT #15# NIL . #20#)
                     (SEQ (LETT |i| 1 . #20#) (LETT |y| NIL . #20#)
                          (LETT #14# |fns| . #20#) G190
                          (COND
                           ((OR (ATOM #14#)
                                (PROGN (LETT |y| (CAR #14#) . #20#) NIL)
                                (|greater_SI| |i| |n|))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((COND
                               ((SPADCALL (QAREF1O |v| |i| 1)
                                          (|spadConstant| $ 167)
                                          (QREFELT $ 90))
                                'NIL)
                               (#21# 'T))
                              (LETT #15#
                                    (CONS
                                     (SPADCALL
                                      (SPADCALL |y| |dd| (QREFELT $ 15))
                                      (QREFELT $ 137))
                                     #15#)
                                    . #20#)))))
                          (LETT #14#
                                (PROG1 (CDR #14#)
                                  (LETT |i| (|inc_SI| |i|) . #20#))
                                . #20#)
                          (GO G190) G191 (EXIT (NREVERSE #15#))))
                    . #20#)
              (LETT |newexp|
                    (PROGN
                     (LETT #13# NIL . #20#)
                     (SEQ (LETT |e| NIL . #20#) (LETT #12# |newe| . #20#) G190
                          (COND
                           ((OR (ATOM #12#)
                                (PROGN (LETT |e| (CAR #12#) . #20#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #13#
                                  (CONS (SPADCALL |e| |d| (QREFELT $ 111))
                                        #13#)
                                  . #20#)))
                          (LETT #12# (CDR #12#) . #20#) (GO G190) G191
                          (EXIT (NREVERSE #13#))))
                    . #20#)
              (LETT |li|
                    (PROGN
                     (LETT #11# NIL . #20#)
                     (SEQ (LETT |i| 1 . #20#) G190
                          (COND ((|greater_SI| |i| |n|) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((COND
                               ((SPADCALL (QAREF1O |v| |i| 1)
                                          (|spadConstant| $ 167)
                                          (QREFELT $ 90))
                                'NIL)
                               (#21# 'T))
                              (LETT #11# (CONS |i| #11#) . #20#)))))
                          (LETT |i| (|inc_SI| |i|) . #20#) (GO G190) G191
                          (EXIT (NREVERSE #11#))))
                    . #20#)
              (LETT |h|
                    (SPADCALL
                     (PROGN
                      (LETT #6# NIL . #20#)
                      (SEQ (LETT |e| NIL . #20#) (LETT #10# |newe| . #20#)
                           (LETT |i| NIL . #20#) (LETT #9# |li| . #20#) G190
                           (COND
                            ((OR (ATOM #9#)
                                 (PROGN (LETT |i| (CAR #9#) . #20#) NIL)
                                 (ATOM #10#)
                                 (PROGN (LETT |e| (CAR #10#) . #20#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #8#
                                    (SPADCALL |e| (QAREF1O (QCAR |cd|) |i| 1)
                                              (QREFELT $ 111))
                                    . #20#)
                              (COND
                               (#6#
                                (LETT #7# (SPADCALL #7# #8# (QREFELT $ 114))
                                      . #20#))
                               ('T
                                (PROGN
                                 (LETT #7# #8# . #20#)
                                 (LETT #6# 'T . #20#)))))))
                           (LETT #9#
                                 (PROG1 (CDR #9#)
                                   (LETT #10# (CDR #10#) . #20#))
                                 . #20#)
                           (GO G190) G191 (EXIT NIL))
                      (COND (#6# #7#) (#21# (|spadConstant| $ 61))))
                     |g| (QREFELT $ 114))
                    . #20#)
              (LETT |lk1| (CONS |k| |lk1|) . #20#)
              (LETT |newexp| (CONS |h| |newexp|) . #20#)
              (EXIT
               (VECTOR (SPADCALL |f| |lk1| |newexp| (QREFELT $ 118)) |lk1|
                       |newexp|))))
            (#21#
             (SEQ
              (LETT |h|
                    (SPADCALL
                     (PROGN
                      (LETT #1# NIL . #20#)
                      (SEQ (LETT |y| NIL . #20#) (LETT #5# |fns| . #20#)
                           (LETT |i| (SPADCALL |v| (QREFELT $ 148)) . #20#)
                           (LETT #4# (QVSIZE |v|) . #20#) G190
                           (COND
                            ((OR (> |i| #4#) (ATOM #5#)
                                 (PROGN (LETT |y| (CAR #5#) . #20#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #3#
                                    (SPADCALL (SPADCALL |y| (QREFELT $ 137))
                                              (QAREF1O |v| |i| 1)
                                              (QREFELT $ 157))
                                    . #20#)
                              (COND
                               (#1#
                                (LETT #2# (SPADCALL #2# #3# (QREFELT $ 114))
                                      . #20#))
                               ('T
                                (PROGN
                                 (LETT #2# #3# . #20#)
                                 (LETT #1# 'T . #20#)))))))
                           (LETT |i|
                                 (PROG1 (+ |i| 1) (LETT #5# (CDR #5#) . #20#))
                                 . #20#)
                           (GO G190) G191 (EXIT NIL))
                      (COND (#1# #2#) (#21# (|spadConstant| $ 61))))
                     |g| (QREFELT $ 114))
                    . #20#)
              (EXIT
               (VECTOR (SPADCALL |f| (LIST |k|) (LIST |h|) (QREFELT $ 118))
                       (LIST |k|) (LIST |h|))))))))))) 

(DEFUN |EFSTRUC;expnosimp!0| (|x| $) (SPADCALL |x| '|exp| (QREFELT $ 29))) 

(DEFUN |EFSTRUC;logeval| (|f| |lk| |k| |v| $)
  (PROG (|g| #1=#:G709 #2=#:G708 #3=#:G710 #4=#:G717 |i| #5=#:G718 |x| |c|
         #6=#:G700 #7=#:G699 #8=#:G701 #9=#:G715 #10=#:G716 |dd| #11=#:G714
         #12=#:G713 |z|)
    (RETURN
     (SEQ
      (LETT |z| (|SPADfirst| (SPADCALL |k| (QREFELT $ 31)))
            . #13=(|EFSTRUC;logeval|))
      (LETT |dd|
            (SPADCALL
             (PROGN
              (LETT #12# NIL . #13#)
              (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 148)) . #13#)
                   (LETT #11# (QVSIZE |v|) . #13#) G190
                   (COND ((> |i| #11#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #12#
                           (CONS (SPADCALL (QAREF1O |v| |i| 1) (QREFELT $ 39))
                                 #12#)
                           . #13#)))
                   (LETT |i| (+ |i| 1) . #13#) (GO G190) G191
                   (EXIT (NREVERSE #12#))))
             (QREFELT $ 172))
            . #13#)
      (LETT |c|
            (SPADCALL (SPADCALL |z| |dd| (QREFELT $ 111))
                      (PROGN
                       (LETT #6# NIL . #13#)
                       (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 148)) . #13#)
                            (LETT #10# (QVSIZE |v|) . #13#)
                            (LETT |x| NIL . #13#)
                            (LETT #9# (|EFSTRUC;toZ| |lk| $) . #13#) G190
                            (COND
                             ((OR (ATOM #9#)
                                  (PROGN (LETT |x| (CAR #9#) . #13#) NIL)
                                  (> |i| #10#))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #8#
                                     (SPADCALL |x|
                                               (SPADCALL |dd|
                                                         (QAREF1O |v| |i| 1)
                                                         (QREFELT $ 173))
                                               (QREFELT $ 157))
                                     . #13#)
                               (COND
                                (#6#
                                 (LETT #7# (SPADCALL #7# #8# (QREFELT $ 114))
                                       . #13#))
                                ('T
                                 (PROGN
                                  (LETT #7# #8# . #13#)
                                  (LETT #6# 'T . #13#)))))))
                            (LETT #9#
                                  (PROG1 (CDR #9#) (LETT |i| (+ |i| 1) . #13#))
                                  . #13#)
                            (GO G190) G191 (EXIT NIL))
                       (COND (#6# #7#) (#14='T (|spadConstant| $ 61))))
                      (QREFELT $ 15))
            . #13#)
      (LETT |g|
            (SPADCALL
             (PROGN
              (LETT #1# NIL . #13#)
              (SEQ (LETT |x| NIL . #13#)
                   (LETT #5# (|EFSTRUC;toY| |lk| $) . #13#)
                   (LETT |i| (SPADCALL |v| (QREFELT $ 148)) . #13#)
                   (LETT #4# (QVSIZE |v|) . #13#) G190
                   (COND
                    ((OR (> |i| #4#) (ATOM #5#)
                         (PROGN (LETT |x| (CAR #5#) . #13#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #3#
                            (SPADCALL (QAREF1O |v| |i| 1) |x| (QREFELT $ 158))
                            . #13#)
                      (COND
                       (#1#
                        (LETT #2# (SPADCALL #2# #3# (QREFELT $ 141)) . #13#))
                       ('T
                        (PROGN (LETT #2# #3# . #13#) (LETT #1# 'T . #13#)))))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT #5# (CDR #5#) . #13#))
                         . #13#)
                   (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) (#14# (|spadConstant| $ 25))))
             (SPADCALL (SPADCALL |c| (QREFELT $ 97))
                       (SPADCALL (SPADCALL |dd| (QREFELT $ 174))
                                 (QREFELT $ 121))
                       (QREFELT $ 15))
             (QREFELT $ 141))
            . #13#)
      (EXIT
       (VECTOR (SPADCALL |f| (LIST |k|) (LIST |g|) (QREFELT $ 118)) (LIST |k|)
               (LIST |g|))))))) 

(DEFUN |EFSTRUC;rischNormalize;FLR;40| (|f| |vars| $)
  (PROG (#1=#:G728 |rn| #2=#:G724 |rec| |c| |klist| |i| #3=#:G729 |kk| |n|
         |pars| |funs| |lk|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |lk| (SPADCALL |f| (QREFELT $ 58))
              . #4=(|EFSTRUC;rischNormalize;FLR;40|))
        (LETT |funs| |lk| . #4#)
        (LETT |pars| (SPADCALL |f| (QREFELT $ 22)) . #4#)
        (LETT |pars| (SPADCALL |pars| |vars| (QREFELT $ 175)) . #4#)
        (EXIT
         (COND ((NULL |funs|) (VECTOR |f| NIL NIL))
               ('T
                (SEQ (LETT |n| (LENGTH |funs|) . #4#)
                     (SEQ (LETT |kk| NIL . #4#) (LETT #3# (CDR |funs|) . #4#)
                          (LETT |i| 1 . #4#) G190
                          (COND
                           ((OR (|greater_SI| |i| |n|) (ATOM #3#)
                                (PROGN (LETT |kk| (CAR #3#) . #4#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ
                             (LETT |klist| (SPADCALL |funs| |i| (QREFELT $ 63))
                                   . #4#)
                             (SEQ
                              (LETT |c|
                                    (|EFSTRUC;findRelation| |vars| |pars|
                                     |klist| |kk| $)
                                    . #4#)
                              (EXIT
                               (COND
                                ((QEQCAR |c| 0)
                                 (COND
                                  ((NULL (SPADCALL (CDR |c|) (QREFELT $ 176)))
                                   (PROGN
                                    (LETT #2#
                                          (SEQ
                                           (LETT |rec|
                                                 (|EFSTRUC;depeval| |f| |klist|
                                                  |kk| (CDR |c|) $)
                                                 . #4#)
                                           (LETT |rn|
                                                 (SPADCALL (QVELT |rec| 0)
                                                           |vars|
                                                           (QREFELT $ 178))
                                                 . #4#)
                                           (EXIT
                                            (PROGN
                                             (LETT #1#
                                                   (VECTOR (QVELT |rn| 0)
                                                           (SPADCALL
                                                            (QVELT |rec| 1)
                                                            (QVELT |rn| 1)
                                                            (QREFELT $ 64))
                                                           (SPADCALL
                                                            (QVELT |rec| 2)
                                                            (QVELT |rn| 2)
                                                            (QREFELT $ 65)))
                                                   . #4#)
                                             (GO #1#))))
                                          . #4#)
                                    (GO #2#))))))))
                             (EXIT
                              (COND
                               ((QEQCAR |c| 1)
                                (SEQ
                                 (LETT |rn|
                                       (SPADCALL
                                        (SPADCALL |f| (LIST |kk|)
                                                  (LIST (CDR |c|))
                                                  (QREFELT $ 118))
                                        |vars| (QREFELT $ 178))
                                       . #4#)
                                 (EXIT
                                  (PROGN
                                   (LETT #1#
                                         (VECTOR (QVELT |rn| 0)
                                                 (CONS |kk| (QVELT |rn| 1))
                                                 (CONS (CDR |c|)
                                                       (QVELT |rn| 2)))
                                         . #4#)
                                   (GO #1#)))))))))
                           #2# (EXIT #2#))
                          (LETT |i|
                                (PROG1 (|inc_SI| |i|)
                                  (LETT #3# (CDR #3#) . #4#))
                                . #4#)
                          (GO G190) G191 (EXIT NIL))
                     (EXIT (VECTOR |f| NIL NIL))))))))
      #1# (EXIT #1#))))) 

(DEFUN |EFSTRUC;rischNormalize;FSR;41| (|f| |v| $)
  (SPADCALL |f| (LIST |v|) (QREFELT $ 178))) 

(DEFUN |EFSTRUC;rootNormalize;FKF;42| (|f| |k| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (LETT |u|
            (|EFSTRUC;rootKernelNormalize| |f|
             (|EFSTRUC;toR| (SPADCALL |f| (QREFELT $ 58))
              (|SPADfirst| (SPADCALL |k| (QREFELT $ 31))) $)
             |k| $)
            |EFSTRUC;rootNormalize;FKF;42|)
      (EXIT (COND ((QEQCAR |u| 1) |f|) ('T (QVELT (QCDR |u|) 0)))))))) 

(DEFUN |EFSTRUC;rootKernelNormalize| (|f| |l| |k| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (|EFSTRUC;rootDep| |l| |k| $) |EFSTRUC;rootKernelNormalize|)
      (EXIT
       (COND
        ((QEQCAR |c| 0)
         (CONS 0
               (|EFSTRUC;rooteval| |f| |l| |k|
                (SPADCALL (CDR |c|) (SPADCALL (CDR |c|) (QREFELT $ 148))
                          (QREFELT $ 149))
                $)))
        ('T (CONS 1 "failed")))))))) 

(DEFUN |EFSTRUC;localnorm| (|f| $) (QVELT (SPADCALL |f| NIL (QREFELT $ 178)) 0)) 

(DEFUN |EFSTRUC;validExponential;LFSU;45| (|twr| |eta| |x| $)
  (PROG (#1=#:G781 #2=#:G780 #3=#:G782 #4=#:G793 |i| #5=#:G794 |yy| |g|
         #6=#:G754 #7=#:G753 #8=#:G755 #9=#:G791 #10=#:G792 |v| |c| #11=#:G790
         |fns| #12=#:G789)
    (RETURN
     (SEQ
      (LETT |c|
            (SPADCALL
             (SPADCALL
              (PROGN
               (LETT #12# NIL . #13=(|EFSTRUC;validExponential;LFSU;45|))
               (SEQ (LETT |g| NIL . #13#)
                    (LETT #11# (LETT |fns| (|EFSTRUC;toY| |twr| $) . #13#)
                          . #13#)
                    G190
                    (COND
                     ((OR (ATOM #11#) (PROGN (LETT |g| (CAR #11#) . #13#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #12# (CONS (SPADCALL |g| |x| (QREFELT $ 67)) #12#)
                            . #13#)))
                    (LETT #11# (CDR #11#) . #13#) (GO G190) G191
                    (EXIT (NREVERSE #12#))))
              (QREFELT $ 181))
             (SPADCALL |eta| |x| (QREFELT $ 67)) (QREFELT $ 182))
            . #13#)
      (EXIT
       (COND ((QEQCAR |c| 1) (CONS 1 "failed"))
             (#14='T
              (SEQ (LETT |v| (QCDR |c|) . #13#)
                   (LETT |g|
                         (SPADCALL |eta|
                                   (PROGN
                                    (LETT #6# NIL . #13#)
                                    (SEQ (LETT |yy| NIL . #13#)
                                         (LETT #10# |fns| . #13#)
                                         (LETT |i|
                                               (SPADCALL |v| (QREFELT $ 148))
                                               . #13#)
                                         (LETT #9# (QVSIZE |v|) . #13#) G190
                                         (COND
                                          ((OR (> |i| #9#) (ATOM #10#)
                                               (PROGN
                                                (LETT |yy| (CAR #10#) . #13#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (PROGN
                                            (LETT #8#
                                                  (SPADCALL (QAREF1O |v| |i| 1)
                                                            |yy|
                                                            (QREFELT $ 158))
                                                  . #13#)
                                            (COND
                                             (#6#
                                              (LETT #7#
                                                    (SPADCALL #7# #8#
                                                              (QREFELT $ 141))
                                                    . #13#))
                                             ('T
                                              (PROGN
                                               (LETT #7# #8# . #13#)
                                               (LETT #6# 'T . #13#)))))))
                                         (LETT |i|
                                               (PROG1 (+ |i| 1)
                                                 (LETT #10# (CDR #10#) . #13#))
                                               . #13#)
                                         (GO G190) G191 (EXIT NIL))
                                    (COND (#6# #7#)
                                          (#14# (|spadConstant| $ 25))))
                                   (QREFELT $ 139))
                         . #13#)
                   (EXIT
                    (CONS 0
                          (SPADCALL
                           (PROGN
                            (LETT #1# NIL . #13#)
                            (SEQ (LETT |yy| NIL . #13#) (LETT #5# |fns| . #13#)
                                 (LETT |i| (SPADCALL |v| (QREFELT $ 148))
                                       . #13#)
                                 (LETT #4# (QVSIZE |v|) . #13#) G190
                                 (COND
                                  ((OR (> |i| #4#) (ATOM #5#)
                                       (PROGN
                                        (LETT |yy| (CAR #5#) . #13#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #3#
                                          (SPADCALL
                                           (SPADCALL |yy| (QREFELT $ 137))
                                           (QAREF1O |v| |i| 1) (QREFELT $ 157))
                                          . #13#)
                                    (COND
                                     (#1#
                                      (LETT #2#
                                            (SPADCALL #2# #3# (QREFELT $ 114))
                                            . #13#))
                                     ('T
                                      (PROGN
                                       (LETT #2# #3# . #13#)
                                       (LETT #1# 'T . #13#)))))))
                                 (LETT |i|
                                       (PROG1 (+ |i| 1)
                                         (LETT #5# (CDR #5#) . #13#))
                                       . #13#)
                                 (GO G190) G191 (EXIT NIL))
                            (COND (#1# #2#) (#14# (|spadConstant| $ 61))))
                           (SPADCALL |g| (QREFELT $ 137))
                           (QREFELT $ 114)))))))))))) 

(DEFUN |EFSTRUC;irootDep;KU;46| (|k| $)
  (PROG (|nv| |nk| |nr| |nf| |pr| |n| #1=#:G795)
    (RETURN
     (SEQ
      (LETT |n|
            (PROG1
                (LETT #1#
                      (SPADCALL
                       (SPADCALL (SPADCALL |k| (QREFELT $ 31)) (QREFELT $ 152))
                       (QREFELT $ 153))
                      . #2=(|EFSTRUC;irootDep;KU;46|))
              (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
            . #2#)
      (LETT |pr|
            (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 31))) |n|
                      (QREFELT $ 187))
            . #2#)
      (COND
       ((SPADCALL (QVELT |pr| 1) (|spadConstant| $ 61) (QREFELT $ 33))
        (COND
         ((NULL (EQL (QVELT |pr| 0) |n|))
          (EXIT
           (COND
            ((EQL (QVELT |pr| 0) 1)
             (CONS 1 (SPADCALL (QVELT |pr| 1) (QVELT |pr| 2) (QREFELT $ 114))))
            (#3='T
             (SEQ (LETT |nf| (SPADCALL (QVELT |pr| 0) (QREFELT $ 13)) . #2#)
                  (LETT |nr| (QVELT |pr| 2) . #2#)
                  (LETT |nk|
                        (SPADCALL (SPADCALL |k| (QREFELT $ 84))
                                  (LIST |nr| |nf|) (QREFELT $ 147))
                        . #2#)
                  (LETT |nv| (SPADCALL (QVELT |pr| 1) |nk| (QREFELT $ 114))
                        . #2#)
                  (EXIT (CONS 1 |nv|)))))))))
       (#3#
        (EXIT
         (COND
          ((EQL (QVELT |pr| 0) 1)
           (CONS 1 (SPADCALL (QVELT |pr| 1) (QVELT |pr| 2) (QREFELT $ 114))))
          (#3#
           (SEQ (LETT |nf| (SPADCALL (QVELT |pr| 0) (QREFELT $ 13)) . #2#)
                (LETT |nr| (QVELT |pr| 2) . #2#)
                (LETT |nk|
                      (SPADCALL (SPADCALL |k| (QREFELT $ 84)) (LIST |nr| |nf|)
                                (QREFELT $ 147))
                      . #2#)
                (LETT |nv| (SPADCALL (QVELT |pr| 1) |nk| (QREFELT $ 114))
                      . #2#)
                (EXIT (CONS 1 |nv|))))))))
      (EXIT (CONS 2 'T)))))) 

(DEFUN |EFSTRUC;irootDep;KU;47| (|k| $) (CONS 2 'T)) 

(DEFUN |EFSTRUC;rootDep| (|ker| |k| $)
  (PROG (#1=#:G831 #2=#:G830 #3=#:G832 #4=#:G835 |r|)
    (RETURN
     (SEQ
      (COND
       ((NULL
         (LETT |ker|
               (|EFSTRUC;toR| |ker| (|SPADfirst| (SPADCALL |k| (QREFELT $ 31)))
                $)
               . #5=(|EFSTRUC;rootDep|)))
        (SPADCALL |k| (QREFELT $ 189)))
       (#6='T
        (CONS 0
              (MAKEARR1 1
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL |k| (QREFELT $ 31))
                                     (QREFELT $ 152))
                           (QREFELT $ 153))
                          (PROGN
                           (LETT #1# NIL . #5#)
                           (SEQ (LETT |r| NIL . #5#) (LETT #4# |ker| . #5#)
                                G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |r| (CAR #4#) . #5#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #3#
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |r| (QREFELT $ 31))
                                           (QREFELT $ 152))
                                          (QREFELT $ 153))
                                         . #5#)
                                   (COND
                                    (#1#
                                     (LETT #2#
                                           (SPADCALL #2# #3# (QREFELT $ 190))
                                           . #5#))
                                    ('T
                                     (PROGN
                                      (LETT #2# #3# . #5#)
                                      (LETT #1# 'T . #5#)))))))
                                (LETT #4# (CDR #4#) . #5#) (GO G190) G191
                                (EXIT NIL))
                           (COND (#1# #2#) (#6# 1)))
                          (QREFELT $ 190))
                         (QREFELT $ 155)))))))))) 

(DEFUN |EFSTRUC;expeval| (|f| |lk| |k| |v| $)
  (PROG (|h| #1=#:G847 #2=#:G846 #3=#:G848 #4=#:G858 |a| #5=#:G859 |z| |l|
         #6=#:G857 |kk| #7=#:G856 |lv| #8=#:G855 |i| #9=#:G854 |v0| |rec| |g|
         #10=#:G838 #11=#:G837 #12=#:G839 #13=#:G852 #14=#:G853 |fns| |y|)
    (RETURN
     (SEQ
      (LETT |y| (|SPADfirst| (SPADCALL |k| (QREFELT $ 31)))
            . #15=(|EFSTRUC;expeval|))
      (LETT |fns| (|EFSTRUC;toY| |lk| $) . #15#)
      (LETT |g|
            (SPADCALL |y|
                      (PROGN
                       (LETT #10# NIL . #15#)
                       (SEQ (LETT |z| NIL . #15#) (LETT #14# |fns| . #15#)
                            (LETT |i| (SPADCALL |v| (QREFELT $ 148)) . #15#)
                            (LETT #13# (QVSIZE |v|) . #15#) G190
                            (COND
                             ((OR (> |i| #13#) (ATOM #14#)
                                  (PROGN (LETT |z| (CAR #14#) . #15#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #12#
                                     (SPADCALL (QAREF1O |v| |i| 1) |z|
                                               (QREFELT $ 158))
                                     . #15#)
                               (COND
                                (#10#
                                 (LETT #11#
                                       (SPADCALL #11# #12# (QREFELT $ 141))
                                       . #15#))
                                ('T
                                 (PROGN
                                  (LETT #11# #12# . #15#)
                                  (LETT #10# 'T . #15#)))))))
                            (LETT |i|
                                  (PROG1 (+ |i| 1)
                                    (LETT #14# (CDR #14#) . #15#))
                                  . #15#)
                            (GO G190) G191 (EXIT NIL))
                       (COND (#10# #11#) (#16='T (|spadConstant| $ 25))))
                      (QREFELT $ 139))
            . #15#)
      (LETT |rec| (|EFSTRUC;goodCoef| |v| |lk| '|exp| $) . #15#)
      (EXIT
       (COND
        ((QEQCAR |rec| 1)
         (|EFSTRUC;expnosimp| |f| |lk| |k| |v| |fns|
          (SPADCALL |g| (QREFELT $ 137)) $))
        (#16#
         (SEQ
          (LETT |v0|
                (SPADCALL
                 (SPADCALL (QAREF1O |v| (QCAR (QCDR |rec|)) 1) (QREFELT $ 164))
                 (QREFELT $ 150))
                . #15#)
          (LETT |lv|
                (PROGN
                 (LETT #9# NIL . #15#)
                 (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 148)) . #15#)
                      (LETT #8# (QVSIZE |v|) . #15#) G190
                      (COND ((> |i| #8#) (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |i| (QCAR (QCDR |rec|)) (QREFELT $ 154))
                          (LETT #9# (CONS (QAREF1O |v| |i| 1) #9#) . #15#)))))
                      (LETT |i| (+ |i| 1) . #15#) (GO G190) G191
                      (EXIT (NREVERSE #9#))))
                . #15#)
          (LETT |l|
                (PROGN
                 (LETT #7# NIL . #15#)
                 (SEQ (LETT |kk| NIL . #15#) (LETT #6# |lk| . #15#) G190
                      (COND
                       ((OR (ATOM #6#)
                            (PROGN (LETT |kk| (CAR #6#) . #15#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |kk| (QCDR (QCDR |rec|)) (QREFELT $ 120))
                          (LETT #7# (CONS |kk| #7#) . #15#)))))
                      (LETT #6# (CDR #6#) . #15#) (GO G190) G191
                      (EXIT (NREVERSE #7#))))
                . #15#)
          (LETT |h|
                (PROGN
                 (LETT #1# NIL . #15#)
                 (SEQ (LETT |z| NIL . #15#)
                      (LETT #5# (|EFSTRUC;toY| |l| $) . #15#)
                      (LETT |a| NIL . #15#) (LETT #4# |lv| . #15#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |a| (CAR #4#) . #15#) NIL)
                            (ATOM #5#) (PROGN (LETT |z| (CAR #5#) . #15#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #3#
                               (SPADCALL (SPADCALL |z| (QREFELT $ 137))
                                         (-
                                          (SPADCALL
                                           (SPADCALL |a| |v0| (QREFELT $ 166))
                                           (QREFELT $ 150)))
                                         (QREFELT $ 111))
                               . #15#)
                         (COND
                          (#1#
                           (LETT #2# (SPADCALL #2# #3# (QREFELT $ 114))
                                 . #15#))
                          ('T
                           (PROGN
                            (LETT #2# #3# . #15#)
                            (LETT #1# 'T . #15#)))))))
                      (LETT #4# (PROG1 (CDR #4#) (LETT #5# (CDR #5#) . #15#))
                            . #15#)
                      (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) (#16# (|spadConstant| $ 61))))
                . #15#)
          (LETT |h|
                (SPADCALL
                 (SPADCALL |h|
                           (SPADCALL
                            (SPADCALL (SPADCALL |v0| |g| (QREFELT $ 165))
                                      (QREFELT $ 14))
                            (QREFELT $ 137))
                           (QREFELT $ 114))
                 (SPADCALL (SPADCALL |k| (QREFELT $ 96)) |v0| (QREFELT $ 111))
                 (QREFELT $ 114))
                . #15#)
          (EXIT
           (VECTOR
            (SPADCALL |f| (LIST (QCDR (QCDR |rec|))) (LIST |h|)
                      (QREFELT $ 118))
            (LIST (QCDR (QCDR |rec|))) (LIST |h|))))))))))) 

(DEFUN |EFSTRUC;normalize;2F;50| (|f| $)
  (|EFSTRUC;rtNormalize|
   (|EFSTRUC;localnorm|
    (SPADCALL (SPADCALL |f| (QREFELT $ 23)) (QREFELT $ 191)) $)
   $)) 

(DEFUN |EFSTRUC;normalize;FSF;51| (|f| |x| $)
  (|EFSTRUC;rtNormalize|
   (QVELT
    (SPADCALL (SPADCALL (SPADCALL |f| |x| (QREFELT $ 20)) |x| (QREFELT $ 193))
              |x| (QREFELT $ 179))
    0)
   $)) 

(DEFUN |EFSTRUC;factdeprel| (|l| |k| $)
  (PROG (#1=#:G897 #2=#:G900 #3=#:G895 #4=#:G894 #5=#:G896 #6=#:G902 |i| |r|
         |m| #7=#:G901 |x| #8=#:G899 |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (EXIT
         (SEQ
          (SEQ
           (LETT |r|
                 (SPADCALL
                  (LETT |n| (|SPADfirst| (SPADCALL |k| (QREFELT $ 31)))
                        . #9=(|EFSTRUC;factdeprel|))
                  (QREFELT $ 52))
                 . #9#)
           (EXIT
            (COND
             ((QEQCAR |r| 0)
              (COND
               ((SPADCALL (QCDR |r|) 0 (QREFELT $ 110))
                (PROGN
                 (LETT #8#
                       (CONS 1
                             (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 195))
                                       (QREFELT $ 13)))
                       . #9#)
                 (GO #8#))))))))
          (SEQ (LETT |x| NIL . #9#) (LETT #7# |l| . #9#) G190
               (COND
                ((OR (ATOM #7#) (PROGN (LETT |x| (CAR #7#) . #9#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |m| (|SPADfirst| (SPADCALL |x| (QREFELT $ 31))) . #9#)
                  (LETT |r|
                        (SPADCALL (SPADCALL |n| |m| (QREFELT $ 139))
                                  (QREFELT $ 52))
                        . #9#)
                  (EXIT
                   (COND
                    ((QEQCAR |r| 0)
                     (PROGN
                      (LETT #1#
                            (COND
                             ((SPADCALL (QCDR |r|) 0 (QREFELT $ 110))
                              (PROGN
                               (LETT #2#
                                     (CONS 1
                                           (SPADCALL
                                            (PROGN
                                             (LETT #3# NIL . #9#)
                                             (SEQ (LETT |i| 1 . #9#)
                                                  (LETT #6# (QCDR |r|) . #9#)
                                                  G190
                                                  (COND
                                                   ((|greater_SI| |i| #6#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (PROGN
                                                     (LETT #5#
                                                           (SPADCALL |m|
                                                                     (SPADCALL
                                                                      |i|
                                                                      (QREFELT
                                                                       $ 13))
                                                                     (QREFELT $
                                                                              141))
                                                           . #9#)
                                                     (COND
                                                      (#3#
                                                       (LETT #4#
                                                             (SPADCALL #4# #5#
                                                                       (QREFELT
                                                                        $ 114))
                                                             . #9#))
                                                      ('T
                                                       (PROGN
                                                        (LETT #4# #5# . #9#)
                                                        (LETT #3# 'T
                                                              . #9#)))))))
                                                  (LETT |i| (|inc_SI| |i|)
                                                        . #9#)
                                                  (GO G190) G191 (EXIT NIL))
                                             (COND (#3# #4#)
                                                   ('T (|spadConstant| $ 61))))
                                            (SPADCALL |x| (QREFELT $ 96))
                                            (QREFELT $ 114)))
                                     . #9#)
                               (GO #2#)))
                             ('T (|error| "bad order of factorials")))
                            . #9#)
                      (GO #1#)))))))
                #1# (EXIT #1#))
               (LETT #7# (CDR #7#) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS 2 'T))))
        #8# (EXIT #8#)))
      #2# (EXIT #2#))))) 

(DEFUN |EFSTRUC;normalize;2F;53| (|f| $)
  (|EFSTRUC;rtNormalize| (|EFSTRUC;localnorm| (SPADCALL |f| (QREFELT $ 23)) $)
   $)) 

(DEFUN |EFSTRUC;normalize;FSF;54| (|f| |x| $)
  (|EFSTRUC;rtNormalize|
   (QVELT (SPADCALL (SPADCALL |f| |x| (QREFELT $ 20)) |x| (QREFELT $ 179)) 0)
   $)) 

(DEFUN |ElementaryFunctionStructurePackage| (&REST #1=#:G906)
  (PROG ()
    (RETURN
     (PROG (#2=#:G907)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ElementaryFunctionStructurePackage|)
                                           '|domainEqualList|)
                . #3=(|ElementaryFunctionStructurePackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |ElementaryFunctionStructurePackage;|)
                         #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|ElementaryFunctionStructurePackage|))))))))))) 

(DEFUN |ElementaryFunctionStructurePackage;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|ElementaryFunctionStructurePackage|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|ElementaryFunctionStructurePackage| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 196) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ElementaryFunctionStructurePackage|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 '|htrig|)
      (QSETREFV $ 9 '|trig|)
      (QSETREFV $ 10 (|HasCategory| |#2| '(|CombinatorialOpsCategory|)))
      (QSETREFV $ 16
                (SPADCALL (SPADCALL (QREFELT $ 11))
                          (SPADCALL (SPADCALL 2 (QREFELT $ 13)) (QREFELT $ 14))
                          (QREFELT $ 15)))
      (COND
       ((|HasCategory| |#1| '(|GcdDomain|))
        (QSETREFV $ 50 (CONS (|dispatchFunction| |EFSTRUC;tanQ;F2F;11|) $)))
       ('T
        (QSETREFV $ 50 (CONS (|dispatchFunction| |EFSTRUC;tanQ;F2F;12|) $))))
      (QSETREFV $ 82 '|%alg|)
      (QSETREFV $ 133
                (SPADCALL (SPADCALL '|%iint| (QREFELT $ 130)) (QREFELT $ 132)))
      (COND
       ((|HasCategory| |#1| '(|GcdDomain|))
        (PROGN
         (QSETREFV $ 189
                   (CONS (|dispatchFunction| |EFSTRUC;irootDep;KU;46|) $))))
       ('T
        (QSETREFV $ 189
                  (CONS (|dispatchFunction| |EFSTRUC;irootDep;KU;47|) $))))
      (COND
       ((|HasCategory| |#2| '(|CombinatorialOpsCategory|))
        (PROGN
         (QSETREFV $ 192
                   (CONS (|dispatchFunction| |EFSTRUC;normalize;2F;50|) $))
         (QSETREFV $ 194
                   (CONS (|dispatchFunction| |EFSTRUC;normalize;FSF;51|) $))))
       ('T
        (PROGN
         (QSETREFV $ 192
                   (CONS (|dispatchFunction| |EFSTRUC;normalize;2F;53|) $))
         (QSETREFV $ 194
                   (CONS (|dispatchFunction| |EFSTRUC;normalize;FSF;54|) $)))))
      $)))) 

(MAKEPROP '|ElementaryFunctionStructurePackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'HTRIG
              'TRIG '|comb?| (0 . |pi|) (|Integer|) (4 . |coerce|) (9 . -)
              (14 . /) '|mpiover2| (|Mapping| 7 28) |EFSTRUC;rmap;M2F;27|
              (|Symbol|) |EFSTRUC;realElementary;FSF;2| (|List| 19)
              (20 . |variables|) |EFSTRUC;realElementary;2F;3|
              |EFSTRUC;realLiouvillian;2F;4| (25 . |Zero|) (|Boolean|)
              (29 . ~=) (|Kernel| 7) (35 . |is?|) (|List| 7) (41 . |argument|)
              (46 . |first|) (51 . =) (57 . |false|) (|Mapping| 26 28)
              (|List| 28) (61 . |select|) (|Fraction| 12) (67 . |denom|)
              (|SparseUnivariatePolynomial| 7) (|PositiveInteger|)
              (|TangentExpansions| 7) (72 . |tanAn|)
              (|SparseUnivariatePolynomial| $) (78 . |zeroOf|)
              (|AlgebraicManipulations| 6 7) (83 . |rootSimp|) (88 . |numer|)
              (93 . |tanNa|) (99 . |tanQ|) (|Union| 12 '#1="failed")
              (105 . |retractIfCan|) (110 . |tanSum|) (115 . |inv|)
              (120 . |tan|) (125 . |empty?|) (|List| 95) (130 . |tower|)
              (135 . |select!|) (141 . |One|) (145 . |One|)
              (|NonNegativeInteger|) (149 . |first|) (155 . |concat|)
              (161 . |concat|) (167 . |Zero|) (171 . |differentiate|)
              (|Vector| 7) (177 . |setelt|) (184 . |elt|) (|OutputForm|)
              (190 . |coerce|) (|Void|) (195 . |print|) (|Matrix| 7)
              (200 . |new|) (207 . |setelt|) (|Union| 112 '"failed")
              (|IntegerLinearDependence| 7) (215 . |solveLinearlyOverQ|)
              (221 . |One|) 'ALGOP (|BasicOperator|) (225 . |operator|)
              (230 . |has?|) (236 . |elt|) (|Union| 38 '#1#)
              (242 . |retractIfCan|) (247 . |kernels|) (252 . =) (258 . -)
              (|List| 38) (|MultiplicativeDependence|) (263 . |logDependenceQ|)
              (|Kernel| $) (269 . |coerce|) (274 . |log|)
              (|Union| 102 '"failed") (|Expression| 6) (|Numeric| 6)
              (279 . |numericIfCan|) (|Float|) (285 . |rationalApproximation|)
              (291 . |coerce|) (296 . /) (302 . |float|) (309 . -)
              (315 . |abs|) (320 . >) (326 . >) (332 . ^) (|Vector| 38)
              (338 . |zero|) (343 . *) (349 . |new|) (353 . |kernel|)
              (|List| $) (358 . |eval|) (365 . |atan|) (370 . ~=)
              (376 . |coerce|) (|Mapping| 7 6)
              (|SparseMultivariatePolynomial| 6 28)
              (|PolynomialCategoryLifting| (|IndexedExponents| 28) 28 6 123 7)
              (381 . |map|) (|SparseMultivariatePolynomial| 6 95)
              (388 . |numer|) (393 . |denom|) (|CommonOperators|)
              (398 . |operator|) (|LiouvillianFunction| 6 7) (403 . |operator|)
              '|opint| (408 . |is?|) (414 . |zero?|) (419 . |last|)
              (424 . |exp|) (429 . ^) (435 . -) (441 . |sqrt|) (446 . +)
              (452 . *) (458 . |One|) (462 . |elt|) (468 . |coerce|) (473 . D)
              (479 . |kernel|) (485 . |minIndex|) (490 . |elt|)
              (496 . |retract|) (501 . |nthRoot|) (507 . |second|)
              (512 . |retract|) (517 . ~=) (523 . |coerce|) (528 . /) (534 . ^)
              (540 . *) (546 . |retractIfCan|) (551 . |height|) (556 . >)
              (|Union| $ '"failed") (562 . |recip|) (567 . |inv|) (572 . *)
              (578 . *) (584 . |Zero|) (588 . |every?|)
              (|Record| (|:| |num| (|Vector| 12)) (|:| |den| 12))
              (|InnerCommonDenominator| 12 38 (|Vector| 12) 112)
              (594 . |splitDenominator|) (599 . |lcm|) (604 . *)
              (610 . |coerce|) (615 . |setDifference|) (621 . |empty?|)
              (|Record| (|:| |func| 7) (|:| |kers| 36) (|:| |vals| 30))
              |EFSTRUC;rischNormalize;FLR;40| |EFSTRUC;rischNormalize;FSR;41|
              |EFSTRUC;rootNormalize;FKF;42| (626 . |construct|)
              (631 . |solveLinearlyOverQ|) (|Union| 7 '"failed")
              |EFSTRUC;validExponential;LFSU;45|
              (|Record| (|:| |exponent| 62) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 28) 28 6 123 7)
              (637 . |froot|)
              (|Union| (|:| |vec| 112) (|:| |func| 7) (|:| |fail| 26))
              (643 . |irootDep|) (648 . |lcm|) (654 . |factorials|)
              (659 . |normalize|) (664 . |factorials|) (670 . |normalize|)
              (676 . |factorial|))
           '#(|validExponential| 681 |tanQ| 688 |rootNormalize| 694 |rmap| 700
              |rischNormalize| 706 |realLiouvillian| 718 |realElementary| 723
              |normalize| 734 |irootDep| 745)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 195
                                                 '(0 7 0 11 1 7 0 12 13 1 7 0 0
                                                   14 2 7 0 0 0 15 1 7 21 0 22
                                                   0 7 0 25 2 7 26 0 0 27 2 28
                                                   26 0 19 29 1 28 30 0 31 1 30
                                                   7 0 32 2 7 26 0 0 33 0 26 0
                                                   34 2 36 0 35 0 37 1 38 12 0
                                                   39 2 42 40 7 41 43 1 7 0 44
                                                   45 1 46 7 7 47 1 38 12 0 48
                                                   2 42 7 7 12 49 2 0 7 38 7 50
                                                   1 7 51 0 52 1 42 7 30 53 1 7
                                                   0 0 54 1 7 0 0 55 1 21 26 0
                                                   56 1 7 57 0 58 2 36 0 35 0
                                                   59 0 6 0 60 0 7 0 61 2 36 0
                                                   0 62 63 2 36 0 0 0 64 2 30 0
                                                   0 0 65 0 6 0 66 2 7 0 0 19
                                                   67 3 68 7 0 12 7 69 2 68 7 0
                                                   12 70 1 7 71 0 72 1 71 73 0
                                                   74 3 75 0 62 62 7 76 4 75 7
                                                   0 12 12 7 77 2 79 78 75 68
                                                   80 0 38 0 81 1 28 83 0 84 2
                                                   83 26 0 19 85 2 30 7 0 12 86
                                                   1 7 87 0 88 1 7 57 0 89 2 38
                                                   26 0 0 90 1 38 0 0 91 2 93
                                                   78 92 38 94 1 7 0 95 96 1 7
                                                   0 0 97 2 100 98 99 41 101 2
                                                   102 38 0 62 103 1 102 0 38
                                                   104 2 102 0 0 0 105 3 102 0
                                                   12 12 41 106 2 102 0 0 0 107
                                                   1 102 0 0 108 2 102 26 0 0
                                                   109 2 12 26 0 0 110 2 7 0 0
                                                   12 111 1 112 0 62 113 2 7 0
                                                   0 0 114 0 19 0 115 1 28 0 19
                                                   116 3 7 0 0 57 117 118 1 7 0
                                                   0 119 2 28 26 0 0 120 1 7 0
                                                   6 121 3 124 7 17 122 123 125
                                                   1 7 126 0 127 1 7 126 0 128
                                                   1 129 83 19 130 1 131 83 83
                                                   132 2 83 26 0 19 134 1 7 26
                                                   0 135 1 30 7 0 136 1 7 0 0
                                                   137 2 7 0 0 41 138 2 7 0 0 0
                                                   139 1 7 0 0 140 2 7 0 0 0
                                                   141 2 7 0 41 0 142 0 123 0
                                                   143 2 7 0 83 117 144 1 7 0
                                                   19 145 2 7 0 0 19 146 2 7 0
                                                   83 117 147 1 112 12 0 148 2
                                                   112 38 0 12 149 1 38 12 0
                                                   150 2 7 0 0 12 151 1 30 7 0
                                                   152 1 7 12 0 153 2 12 26 0 0
                                                   154 1 38 0 12 155 2 38 0 0 0
                                                   156 2 7 0 0 38 157 2 7 0 38
                                                   0 158 1 38 51 0 159 1 28 62
                                                   0 160 2 62 26 0 0 161 1 38
                                                   162 0 163 1 38 0 0 164 2 7 0
                                                   12 0 165 2 38 0 0 12 166 0
                                                   38 0 167 2 36 26 35 0 168 1
                                                   170 169 112 171 1 12 0 117
                                                   172 2 38 0 12 0 173 1 6 0 12
                                                   174 2 21 0 0 0 175 1 112 26
                                                   0 176 1 68 0 30 181 2 79 78
                                                   68 7 182 2 186 185 7 62 187
                                                   1 0 188 28 189 2 12 0 0 0
                                                   190 1 7 0 0 191 1 0 7 7 192
                                                   2 7 0 0 19 193 2 0 7 7 19
                                                   194 1 12 0 0 195 3 0 183 36
                                                   7 19 184 2 0 7 38 7 50 2 0 7
                                                   7 28 180 2 0 7 17 7 18 2 0
                                                   177 7 19 179 2 0 177 7 21
                                                   178 1 0 7 7 24 1 0 7 7 23 2
                                                   0 7 7 19 20 1 0 7 7 192 2 0
                                                   7 7 19 194 1 0 188 28
                                                   189)))))
           '|lookupComplete|)) 
