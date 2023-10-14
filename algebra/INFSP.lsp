
(DEFUN |INFSP;numeric| (|r| $)
  (PROG (|gr|)
    (RETURN
     (SEQ
      (COND
       ((|domainEqual| (QREFELT $ 6) (|Integer|))
        (COND
         ((|domainEqual| (QREFELT $ 7) (|Float|))
          (SPADCALL |r| (QREFELT $ 11)))
         ((|domainEqual| (QREFELT $ 7) (|Fraction| (|Integer|)))
          (SPADCALL |r| (QREFELT $ 13)))
         ((|domainEqual| (QREFELT $ 7) (|Complex| (|Float|)))
          (SPADCALL |r| (QREFELT $ 15)))
         ((|domainEqual| (QREFELT $ 7) (|Complex| (|Fraction| (|Integer|))))
          (SPADCALL |r| (QREFELT $ 17)))))
       ((|domainEqual| (QREFELT $ 6) (|Complex| (|Integer|)))
        (SEQ (LETT |gr| |r| |INFSP;numeric|)
             (EXIT
              (COND
               ((|domainEqual| (QREFELT $ 7)
                               (|Complex| (|Fraction| (|Integer|))))
                (SPADCALL
                 (SPADCALL (SPADCALL |gr| (QREFELT $ 19)) (QREFELT $ 13))
                 (SPADCALL (SPADCALL |gr| (QREFELT $ 20)) (QREFELT $ 13))
                 (QREFELT $ 21)))
               ((|domainEqual| (QREFELT $ 7) (|Complex| (|Float|)))
                (SPADCALL |gr| (QREFELT $ 22)))))))
       ('T (|error| "case not handled"))))))) 

(DEFUN |INFSP;makeEq;LLL;2| (|nres| |lv| $)
  (PROG (#1=#:G118 |x| #2=#:G119 |r| #3=#:G117)
    (RETURN
     (SEQ
      (PROGN
       (LETT #3# NIL . #4=(|INFSP;makeEq;LLL;2|))
       (SEQ (LETT |r| NIL . #4#) (LETT #2# |nres| . #4#) (LETT |x| NIL . #4#)
            (LETT #1# |lv| . #4#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #4#) NIL) (ATOM #2#)
                  (PROGN (LETT |r| (CAR #2#) . #4#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #3#
                    (CONS
                     (SPADCALL (SPADCALL |x| (QREFELT $ 25))
                               (SPADCALL |r| (QREFELT $ 26)) (QREFELT $ 28))
                     #3#)
                    . #4#)))
            (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #4#)) . #4#)
            (GO G190) G191 (EXIT (NREVERSE #3#)))))))) 

(DEFUN |INFSP;evaluate| (|pol| |xvar| |zvar| |z| $)
  (PROG (|upol| |rpp|)
    (RETURN
     (SEQ
      (LETT |rpp|
            (SPADCALL (CONS (|function| |INFSP;numeric|) $) |pol|
                      (QREFELT $ 36))
            . #1=(|INFSP;evaluate|))
      (LETT |rpp| (SPADCALL |rpp| |zvar| |z| (QREFELT $ 37)) . #1#)
      (LETT |upol| (SPADCALL |rpp| |xvar| (QREFELT $ 39)) . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL (SPADCALL (SPADCALL |upol| 0 (QREFELT $ 44)) (QREFELT $ 45))
                  (QREFELT $ 46))
        (SPADCALL (SPADCALL |upol| (QREFELT $ 47)) (QREFELT $ 46))
        (QREFELT $ 48))))))) 

(DEFUN |INFSP;myConvert| (|eps| $)
  (COND ((|domainEqual| (QREFELT $ 8) (|Fraction| (|Integer|))) |eps|)
        ((|domainEqual| (QREFELT $ 8) (|Float|))
         (SPADCALL |eps| (QREFELT $ 49))))) 

(DEFUN |INFSP;innerSolve1;PParL;5| (|pol| |eps| $)
  (SPADCALL (SPADCALL |pol| (QREFELT $ 51)) |eps| (QREFELT $ 52))) 

(DEFUN |INFSP;innerSolve1;SupParL;6| (|upol| |eps| $)
  (PROG (#1=#:G135 |x| #2=#:G134 |z| #3=#:G133 #4=#:G132)
    (RETURN
     (SEQ
      (COND
       ((|domainEqual| (QREFELT $ 6) (|Complex| (|Integer|)))
        (COND
         ((OR (|domainEqual| (QREFELT $ 8) (|Fraction| (|Integer|)))
              (|domainEqual| (QREFELT $ 8) (|Float|)))
          (EXIT (SPADCALL |upol| |eps| (QREFELT $ 56)))))))
      (EXIT
       (COND
        ((|domainEqual| (QREFELT $ 6) (|Integer|))
         (COND
          ((|domainEqual| (QREFELT $ 7) (|Float|))
           (SEQ
            (LETT |z|
                  (SPADCALL |upol| (|INFSP;myConvert| |eps| $) (QREFELT $ 61))
                  . #5=(|INFSP;innerSolve1;SupParL;6|))
            (EXIT
             (PROGN
              (LETT #4# NIL . #5#)
              (SEQ (LETT |x| NIL . #5#) (LETT #3# |z| . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #4#
                           (CONS
                            (SPADCALL
                             (SPADCALL (SPADCALL 1 2 (QREFELT $ 63))
                                       (SPADCALL (QCAR |x|) (QCDR |x|)
                                                 (QREFELT $ 64))
                                       (QREFELT $ 65))
                             (QREFELT $ 66))
                            #4#)
                           . #5#)))
                   (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                   (EXIT (NREVERSE #4#)))))))
          ((|domainEqual| (QREFELT $ 7) (|Fraction| (|Integer|)))
           (SEQ
            (LETT |z|
                  (SPADCALL |upol| (|INFSP;myConvert| |eps| $) (QREFELT $ 61))
                  . #5#)
            (EXIT
             (PROGN
              (LETT #2# NIL . #5#)
              (SEQ (LETT |x| NIL . #5#) (LETT #1# |z| . #5#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #2#
                           (CONS
                            (SPADCALL (SPADCALL 1 2 (QREFELT $ 63))
                                      (SPADCALL (QCAR |x|) (QCDR |x|)
                                                (QREFELT $ 67))
                                      (QREFELT $ 68))
                            #2#)
                           . #5#)))
                   (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                   (EXIT (NREVERSE #2#)))))))
          (#6='T (|error| "improper arguments to INFSP"))))
        (#6# (|error| "improper arguments to INFSP")))))))) 

(DEFUN |INFSP;K_to_CI| (|x| $)
  (COND
   ((|domainEqual| (QREFELT $ 6) (|Integer|))
    (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 13)) (QREFELT $ 70))
              (|spadConstant| $ 71) (QREFELT $ 73)))
   ((|domainEqual| (QREFELT $ 6) (|Complex| (|Integer|)))
    (SPADCALL
     (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 19)) (QREFELT $ 13))
               (QREFELT $ 70))
     (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 20)) (QREFELT $ 13))
               (QREFELT $ 70))
     (QREFELT $ 73)))
   ('T (|error| "improper arguments to INFSP")))) 

(DEFUN |INFSP;F_to_CI| (|x| $)
  (COND
   ((|domainEqual| (QREFELT $ 7) (|Float|))
    (SPADCALL (SPADCALL |x| (QREFELT $ 74)) (|spadConstant| $ 71)
              (QREFELT $ 73)))
   ((|domainEqual| (QREFELT $ 7) (|Fraction| (|Integer|)))
    (SPADCALL (SPADCALL |x| (QREFELT $ 70)) (|spadConstant| $ 71)
              (QREFELT $ 73)))
   ((|domainEqual| (QREFELT $ 7) (|Complex| (|Float|)))
    (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 75)) (QREFELT $ 74))
              (SPADCALL (SPADCALL |x| (QREFELT $ 76)) (QREFELT $ 74))
              (QREFELT $ 73)))
   ((|domainEqual| (QREFELT $ 7) (|Complex| (|Fraction| (|Integer|))))
    (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 77)) (QREFELT $ 70))
              (SPADCALL (SPADCALL |x| (QREFELT $ 78)) (QREFELT $ 70))
              (QREFELT $ 73)))
   ('T (|error| "improper arguments to INFSP")))) 

(DEFUN |INFSP;F_to_CI1| (|x| |eps| $)
  (PROG (|fuzz| |fuzz1|)
    (RETURN
     (SEQ
      (LETT |fuzz1|
            (SPADCALL (SPADCALL |eps| (QREFELT $ 79)) |eps| (QREFELT $ 80))
            . #1=(|INFSP;F_to_CI1|))
      (LETT |fuzz|
            (COND
             ((OR (|domainEqual| (QREFELT $ 7) (|Float|))
                  (|domainEqual| (QREFELT $ 7) (|Fraction| (|Integer|))))
              (SPADCALL |fuzz1| (|spadConstant| $ 71) (QREFELT $ 73)))
             ((OR (|domainEqual| (QREFELT $ 7) (|Complex| (|Float|)))
                  (|domainEqual| (QREFELT $ 7)
                                 (|Complex| (|Fraction| (|Integer|)))))
              (SPADCALL |fuzz1| |fuzz1| (QREFELT $ 73)))
             ('T (|error| "improper arguments to INFSP")))
            . #1#)
      (EXIT (SPADCALL (|INFSP;F_to_CI| |x| $) |fuzz| (QREFELT $ 81))))))) 

(DEFUN |INFSP;iF_to_Float| (|x| $)
  (SPADCALL
   (SPADCALL (SPADCALL |x| (QREFELT $ 82)) (SPADCALL |x| (QREFELT $ 83))
             (QREFELT $ 84))
   2 (QREFELT $ 85))) 

(DEFUN |INFSP;iF_to_RN| (|x| $)
  (PROG (|bx| |ex| |mx| |fx|)
    (RETURN
     (SEQ (LETT |fx| (|INFSP;iF_to_Float| |x| $) . #1=(|INFSP;iF_to_RN|))
          (LETT |mx| (SPADCALL |fx| (QREFELT $ 86)) . #1#)
          (LETT |ex| (SPADCALL |fx| (QREFELT $ 87)) . #1#)
          (LETT |bx| (SPADCALL (QREFELT $ 89)) . #1#)
          (EXIT
           (SPADCALL |mx|
                     (SPADCALL (SPADCALL |bx| (QREFELT $ 13)) |ex|
                               (QREFELT $ 90))
                     (QREFELT $ 91))))))) 

(DEFUN |INFSP;CI_to_F| (|x| $)
  (PROG (|ix| |rx|)
    (RETURN
     (SEQ (LETT |rx| (SPADCALL |x| (QREFELT $ 92)) . #1=(|INFSP;CI_to_F|))
          (LETT |ix| (SPADCALL |x| (QREFELT $ 93)) . #1#)
          (EXIT
           (COND
            ((|domainEqual| (QREFELT $ 7) (|Float|))
             (|INFSP;iF_to_Float| |rx| $))
            ((|domainEqual| (QREFELT $ 7) (|Complex| (|Float|)))
             (SPADCALL (|INFSP;iF_to_Float| |rx| $)
                       (|INFSP;iF_to_Float| |ix| $) (QREFELT $ 94)))
            ((|domainEqual| (QREFELT $ 7) (|Fraction| (|Integer|)))
             (|INFSP;iF_to_RN| |rx| $))
            ((|domainEqual| (QREFELT $ 7) (|Complex| (|Fraction| (|Integer|))))
             (SPADCALL (|INFSP;iF_to_RN| |rx| $) (|INFSP;iF_to_RN| |ix| $)
                       (QREFELT $ 21)))
            ('T (|error| "improper arguments to INFSP")))))))) 

(DEFUN |INFSP;ieval0| (|pol| |xvar| |zvar| |z| $)
  (PROG (|iden| |upol| |rpp|)
    (RETURN
     (SEQ
      (LETT |rpp|
            (SPADCALL (CONS (|function| |INFSP;K_to_CI|) $) |pol|
                      (QREFELT $ 98))
            . #1=(|INFSP;ieval0|))
      (LETT |rpp| (SPADCALL |rpp| |zvar| |z| (QREFELT $ 99)) . #1#)
      (LETT |upol| (SPADCALL |rpp| |xvar| (QREFELT $ 100)) . #1#)
      (LETT |iden|
            (SPADCALL
             (SPADCALL (SPADCALL |upol| (QREFELT $ 102)) (QREFELT $ 103))
             (QREFELT $ 105))
            . #1#)
      (EXIT
       (COND ((QEQCAR |iden| 1) (CONS 1 "failed"))
             ('T
              (CONS 0
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |upol| 0 (QREFELT $ 106))
                                (QREFELT $ 107))
                      (QREFELT $ 103))
                     (QCDR |iden|) (QREFELT $ 108)))))))))) 

(DEFUN |INFSP;ieval| (|pol| |xvar| |zvar| |z| |eps| $)
  (PROG (|nz|)
    (RETURN
     (SEQ (LETT |nz| (|INFSP;F_to_CI1| |z| |eps| $) |INFSP;ieval|)
          (EXIT (|INFSP;ieval0| |pol| |xvar| |zvar| |nz| $)))))) 

(DEFUN |INFSP;findGenZeros| (|lp| |rlvar| |eps| $)
  (PROG (|ebits| |etol| #1=#:G169 |sol| |sol1| #2=#:G161 |ok| |ppi| |pp|
         #3=#:G171 |pol| #4=#:G172 |xvar| #5=#:G170 |z| |lz| |nfeps| |neps|
         |obits| |feps| |rlp| |zvar| |f|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |rlp| (REVERSE |lp|) . #6=(|INFSP;findGenZeros|))
            (LETT |f| (|SPADfirst| |rlp|) . #6#)
            (LETT |zvar| (|SPADfirst| |rlvar|) . #6#)
            (LETT |rlp| (CDR |rlp|) . #6#) (LETT |etol| 10000 . #6#)
            (LETT |feps|
                  (COND ((|domainEqual| (QREFELT $ 8) (|Float|)) |eps|)
                        ((|domainEqual| (QREFELT $ 8) (|Fraction| (|Integer|)))
                         (SPADCALL |eps| (QREFELT $ 109))))
                  . #6#)
            (LETT |neps|
                  (SPADCALL (SPADCALL 1 4 (QREFELT $ 63)) |eps|
                            (QREFELT $ 112))
                  . #6#)
            (LETT |nfeps|
                  (LETT |feps|
                        (SPADCALL (SPADCALL 1 4 (QREFELT $ 63)) |feps|
                                  (QREFELT $ 113))
                        . #6#)
                  . #6#)
            (LETT |obits| (SPADCALL (QREFELT $ 114)) . #6#)
            (LETT |ebits| 100 . #6#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ (SPADCALL (+ |obits| |ebits|) (QREFELT $ 115))
                       (LETT |neps|
                             (SPADCALL (SPADCALL 1 |etol| (QREFELT $ 63))
                                       |neps| (QREFELT $ 112))
                             . #6#)
                       (LETT |nfeps|
                             (SPADCALL (SPADCALL 1 |etol| (QREFELT $ 63))
                                       |nfeps| (QREFELT $ 113))
                             . #6#)
                       (LETT |lz| (SPADCALL |f| |neps| (QREFELT $ 53)) . #6#)
                       (LETT |ok| 'T . #6#) (LETT |sol| NIL . #6#)
                       (SEQ (LETT |z| NIL . #6#) (LETT #5# |lz| . #6#) G190
                            (COND
                             ((OR (ATOM #5#)
                                  (PROGN (LETT |z| (CAR #5#) . #6#) NIL)
                                  (NULL |ok|))
                              (GO G191)))
                            (SEQ
                             (LETT |sol1|
                                   (LIST
                                    (|INFSP;CI_to_F|
                                     (|INFSP;F_to_CI1| |z| |feps| $) $))
                                   . #6#)
                             (SEQ
                              (EXIT
                               (SEQ (LETT |xvar| NIL . #6#)
                                    (LETT #4# (CDR |rlvar|) . #6#)
                                    (LETT |pol| NIL . #6#)
                                    (LETT #3# |rlp| . #6#) G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN
                                           (LETT |pol| (CAR #3#) . #6#)
                                           NIL)
                                          (ATOM #4#)
                                          (PROGN
                                           (LETT |xvar| (CAR #4#) . #6#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (LETT |pp|
                                           (|INFSP;ieval| |pol| |xvar| |zvar|
                                            |z| |nfeps| $)
                                           . #6#)
                                     (EXIT
                                      (COND
                                       ((QEQCAR |pp| 1)
                                        (SEQ (LETT |ok| 'NIL . #6#)
                                             (EXIT
                                              (PROGN
                                               (LETT #2# |$NoValue| . #6#)
                                               (GO #2#)))))
                                       ('T
                                        (SEQ (LETT |ppi| (QCDR |pp|) . #6#)
                                             (COND
                                              ((OR
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL |ppi|
                                                            (QREFELT $ 92))
                                                  (QREFELT $ 116))
                                                 |feps| (QREFELT $ 118))
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL |ppi|
                                                            (QREFELT $ 93))
                                                  (QREFELT $ 116))
                                                 |feps| (QREFELT $ 118)))
                                               (EXIT
                                                (SEQ (LETT |ok| 'NIL . #6#)
                                                     (EXIT
                                                      (PROGN
                                                       (LETT #2# |$NoValue|
                                                             . #6#)
                                                       (GO #2#)))))))
                                             (EXIT
                                              (LETT |sol1|
                                                    (CONS
                                                     (|INFSP;CI_to_F| |ppi| $)
                                                     |sol1|)
                                                    . #6#)))))))
                                    (LETT #3#
                                          (PROG1 (CDR #3#)
                                            (LETT #4# (CDR #4#) . #6#))
                                          . #6#)
                                    (GO G190) G191 (EXIT NIL)))
                              #2# (EXIT #2#))
                             (EXIT (LETT |sol| (CONS |sol1| |sol|) . #6#)))
                            (LETT #5# (CDR #5#) . #6#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (COND
                         (|ok|
                          (SEQ (SPADCALL |obits| (QREFELT $ 115))
                               (EXIT
                                (PROGN
                                 (LETT #1# (REVERSE |sol|) . #6#)
                                 (GO #1#)))))
                         ('T
                          (SEQ
                           (LETT |etol| (SPADCALL |etol| 2 (QREFELT $ 119))
                                 . #6#)
                           (EXIT (LETT |ebits| (* 2 |ebits|) . #6#)))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |INFSP;oldCoord| (|numres| |lval| $)
  (PROG (#1=#:G174 #2=#:G173 #3=#:G175 #4=#:G178 |n| #5=#:G179 |nr| |rnumres|)
    (RETURN
     (SEQ (LETT |rnumres| (REVERSE |numres|) . #6=(|INFSP;oldCoord|))
          (SPADCALL |rnumres| '|first|
                    (SPADCALL (|SPADfirst| |rnumres|)
                              (PROGN
                               (LETT #1# NIL . #6#)
                               (SEQ (LETT |nr| NIL . #6#)
                                    (LETT #5# (CDR |rnumres|) . #6#)
                                    (LETT |n| NIL . #6#)
                                    (LETT #4# |lval| . #6#) G190
                                    (COND
                                     ((OR (ATOM #4#)
                                          (PROGN
                                           (LETT |n| (CAR #4#) . #6#)
                                           NIL)
                                          (ATOM #5#)
                                          (PROGN
                                           (LETT |nr| (CAR #5#) . #6#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #3#
                                             (SPADCALL |n| |nr|
                                                       (QREFELT $ 120))
                                             . #6#)
                                       (COND
                                        (#1#
                                         (LETT #2#
                                               (SPADCALL #2# #3#
                                                         (QREFELT $ 67))
                                               . #6#))
                                        ('T
                                         (PROGN
                                          (LETT #2# #3# . #6#)
                                          (LETT #1# 'T . #6#)))))))
                                    (LETT #4#
                                          (PROG1 (CDR #4#)
                                            (LETT #5# (CDR #5#) . #6#))
                                          . #6#)
                                    (GO G190) G191 (EXIT NIL))
                               (COND (#1# #2#) ('T (|spadConstant| $ 41))))
                              (QREFELT $ 67))
                    (QREFELT $ 122))
          (EXIT (REVERSE |rnumres|)))))) 

(DEFUN |INFSP;innerSolve2| (|lp| |lv| |eps| $)
  (PROG (|p1| |p0| |vec| |up2| |up1| |mainvar|)
    (RETURN
     (SEQ (LETT |mainvar| (|SPADfirst| |lv|) . #1=(|INFSP;innerSolve2|))
          (LETT |up1|
                (SPADCALL (SPADCALL |lp| 1 (QREFELT $ 124)) |mainvar|
                          (QREFELT $ 125))
                . #1#)
          (LETT |up2|
                (SPADCALL (SPADCALL |lp| 2 (QREFELT $ 124)) |mainvar|
                          (QREFELT $ 125))
                . #1#)
          (LETT |vec| (SPADCALL |up1| |up2| (QREFELT $ 129)) . #1#)
          (LETT |p0|
                (SPADCALL (SPADCALL (QAREF1 |vec| 0) |mainvar| (QREFELT $ 130))
                          (QREFELT $ 131))
                . #1#)
          (LETT |p1|
                (SPADCALL (SPADCALL (QAREF1 |vec| 1) |mainvar| (QREFELT $ 130))
                          |mainvar| (QREFELT $ 132))
                . #1#)
          (COND
           ((OR (SPADCALL |p1| (QREFELT $ 133))
                (SPADCALL
                 (SPADCALL |p0|
                           (SPADCALL (SPADCALL |p1| |mainvar| (QREFELT $ 125))
                                     (QREFELT $ 137))
                           (QREFELT $ 138))
                 (|spadConstant| $ 139) (QREFELT $ 140)))
            (EXIT
             (SPADCALL (CONS (|spadConstant| $ 134) |lp|) NIL |lv| |eps|
                       (QREFELT $ 136)))))
          (EXIT
           (|INFSP;findGenZeros| (LIST |p1| |p0|) (REVERSE |lv|) |eps| $)))))) 

(DEFUN |INFSP;innerSolve;2LLParL;18| (|lp| |ld| |lv| |eps| $)
  (PROG (|result| #1=#:G328 |r| #2=#:G327 |lris| |lgen1| #3=#:G326 |pf|
         #4=#:G325 |neps| |lnorm| |laval| #5=#:G324 |i| #6=#:G323 |lval| |lgen|
         |genRecord| #7=#:G322 |gres| |partRes| #8=#:G321 #9=#:G277 #10=#:G276
         #11=#:G278 #12=#:G320 |res| |listG| #13=#:G319 #14=#:G318 #15=#:G317
         |pr| #16=#:G316 #17=#:G272 |listGen| #18=#:G198 #19=#:G197 #20=#:G199
         #21=#:G270 #22=#:G269 #23=#:G271 #24=#:G315 #25=#:G103 #26=#:G314 |f|
         |res1| #27=#:G313 |rrlvv| |rlv| #28=#:G192 #29=#:G191 #30=#:G193
         #31=#:G312 |fq| #32=#:G311 #33=#:G310 |gb| |lq| #34=#:G309 |q1|
         #35=#:G308 |dmp| DP |lvv| #36=#:G186 #37=#:G307 |vv| #38=#:G306 OV
         |lnp| #39=#:G305 |p| #40=#:G304)
    (RETURN
     (SEQ
      (LETT |lnp|
            (PROGN
             (LETT #40# NIL . #41=(|INFSP;innerSolve;2LLParL;18|))
             (SEQ (LETT |p| NIL . #41#) (LETT #39# |lp| . #41#) G190
                  (COND
                   ((OR (ATOM #39#) (PROGN (LETT |p| (CAR #39#) . #41#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #40#
                          (CONS
                           (SPADCALL |p|
                                     (|compiledLookupCheck| '|pToDmp|
                                                            (LIST
                                                             (LIST
                                                              '|DistributedMultivariatePolynomial|
                                                              |lv|
                                                              (|devaluate|
                                                               (ELT $ 6)))
                                                             (LIST
                                                              '|Polynomial|
                                                              (|devaluate|
                                                               (ELT $ 6))))
                                                            (|PolToPol| |lv|
                                                                        (ELT $
                                                                             6))))
                           #40#)
                          . #41#)))
                  (LETT #39# (CDR #39#) . #41#) (GO G190) G191
                  (EXIT (NREVERSE #40#))))
            . #41#)
      (LETT OV (|OrderedVariableList| |lv|) . #41#)
      (LETT |lvv|
            (PROGN
             (LETT #38# NIL . #41#)
             (SEQ (LETT |vv| NIL . #41#) (LETT #37# |lv| . #41#) G190
                  (COND
                   ((OR (ATOM #37#) (PROGN (LETT |vv| (CAR #37#) . #41#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #38#
                          (CONS
                           (PROG2
                               (LETT #36#
                                     (SPADCALL |vv|
                                               (|compiledLookupCheck|
                                                '|variable|
                                                (LIST
                                                 (LIST '|Union| '$ '"failed")
                                                 (LIST '|Symbol|))
                                                OV))
                                     . #41#)
                               (QCDR #36#)
                             (|check_union| (QEQCAR #36# 0) OV #36#))
                           #38#)
                          . #41#)))
                  (LETT #37# (CDR #37#) . #41#) (GO G190) G191
                  (EXIT (NREVERSE #38#))))
            . #41#)
      (LETT DP (|DirectProduct| (LENGTH |lv|) (|NonNegativeInteger|)) . #41#)
      (LETT |dmp| (|DistributedMultivariatePolynomial| |lv| (QREFELT $ 6))
            . #41#)
      (LETT |lq| NIL . #41#)
      (COND
       ((SPADCALL |ld| NIL (QREFELT $ 141))
        (LETT |lq|
              (PROGN
               (LETT #35# NIL . #41#)
               (SEQ (LETT |q1| NIL . #41#) (LETT #34# |ld| . #41#) G190
                    (COND
                     ((OR (ATOM #34#)
                          (PROGN (LETT |q1| (CAR #34#) . #41#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #35#
                            (CONS
                             (SPADCALL |q1|
                                       (|compiledLookupCheck| '|pToDmp|
                                                              (LIST
                                                               (LIST
                                                                '|DistributedMultivariatePolynomial|
                                                                |lv|
                                                                (|devaluate|
                                                                 (ELT $ 6)))
                                                               (LIST
                                                                '|Polynomial|
                                                                (|devaluate|
                                                                 (ELT $ 6))))
                                                              (|PolToPol| |lv|
                                                                          (ELT
                                                                           $
                                                                           6))))
                             #35#)
                            . #41#)))
                    (LETT #34# (CDR #34#) . #41#) (GO G190) G191
                    (EXIT (NREVERSE #35#))))
              . #41#)))
      (LETT |partRes|
            (SPADCALL |lnp| |lvv|
                      (|compiledLookupCheck| '|groebSolve|
                                             (LIST
                                              (LIST '|List|
                                                    (LIST '|List|
                                                          (LIST
                                                           '|DistributedMultivariatePolynomial|
                                                           |lv|
                                                           (|devaluate|
                                                            (ELT $ 6)))))
                                              (LIST '|List|
                                                    (LIST
                                                     '|DistributedMultivariatePolynomial|
                                                     |lv|
                                                     (|devaluate| (ELT $ 6))))
                                              (LIST '|List|
                                                    (LIST
                                                     '|OrderedVariableList|
                                                     |lv|)))
                                             (|GroebnerSolve| |lv| (ELT $ 6)
                                                              (ELT $ 6))))
            . #41#)
      (EXIT
       (COND
        ((SPADCALL |partRes|
                   (SPADCALL NIL
                             (|compiledLookupCheck| '|list|
                                                    (LIST '$
                                                          (LIST '|List|
                                                                (LIST
                                                                 '|DistributedMultivariatePolynomial|
                                                                 |lv|
                                                                 (|devaluate|
                                                                  (ELT $ 6)))))
                                                    (|List|
                                                     (|List|
                                                      (|DistributedMultivariatePolynomial|
                                                       |lv| (ELT $ 6))))))
                   (|compiledLookupCheck| '= (LIST (LIST '|Boolean|) '$ '$)
                                          (|List|
                                           (|List|
                                            (|DistributedMultivariatePolynomial|
                                             |lv| (ELT $ 6))))))
         NIL)
        (#42='T
         (SEQ
          (COND
           ((SPADCALL |lq| NIL
                      (|compiledLookupCheck| '~= (LIST (LIST '|Boolean|) '$ '$)
                                             (|List| |dmp|)))
            (SEQ
             (LETT |gb|
                   (|GroebnerInternalPackage| (QREFELT $ 6)
                                              (|DirectProduct| (LENGTH |lv|)
                                                               (|NonNegativeInteger|))
                                              OV |dmp|)
                   . #41#)
             (EXIT
              (LETT |partRes|
                    (PROGN
                     (LETT #33# NIL . #41#)
                     (SEQ (LETT |pr| NIL . #41#) (LETT #32# |partRes| . #41#)
                          G190
                          (COND
                           ((OR (ATOM #32#)
                                (PROGN (LETT |pr| (CAR #32#) . #41#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((PROGN
                               (LETT #28# NIL . #41#)
                               (SEQ (LETT |fq| NIL . #41#)
                                    (LETT #31# |lq| . #41#) G190
                                    (COND
                                     ((OR (ATOM #31#)
                                          (PROGN
                                           (LETT |fq| (CAR #31#) . #41#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #30#
                                             (SPADCALL
                                              (SPADCALL |fq| |pr|
                                                        (|compiledLookupCheck|
                                                         '|redPol|
                                                         (LIST
                                                          (|devaluate| |dmp|)
                                                          (|devaluate| |dmp|)
                                                          (LIST '|List|
                                                                (|devaluate|
                                                                 |dmp|)))
                                                         |gb|))
                                              (SPADCALL
                                               (|compiledLookupCheck| '|Zero|
                                                                      (LIST '$)
                                                                      (|DistributedMultivariatePolynomial|
                                                                       |lv|
                                                                       (ELT $
                                                                            6))))
                                              (|compiledLookupCheck| '~=
                                                                     (LIST
                                                                      (LIST
                                                                       '|Boolean|)
                                                                      '$ '$)
                                                                     (|DistributedMultivariatePolynomial|
                                                                      |lv|
                                                                      (ELT $
                                                                           6))))
                                             . #41#)
                                       (COND
                                        (#28#
                                         (LETT #29#
                                               (COND (#29# #30#) ('T 'NIL))
                                               . #41#))
                                        ('T
                                         (PROGN
                                          (LETT #29# #30# . #41#)
                                          (LETT #28# 'T . #41#)))))))
                                    (LETT #31# (CDR #31#) . #41#) (GO G190)
                                    G191 (EXIT NIL))
                               (COND (#28# #29#) (#42# 'T)))
                              (LETT #33# (CONS |pr| #33#) . #41#)))))
                          (LETT #32# (CDR #32#) . #41#) (GO G190) G191
                          (EXIT (NREVERSE #33#))))
                    . #41#)))))
          (LETT |rlv| (REVERSE |lv|) . #41#)
          (LETT |rrlvv| (CDR (REVERSE |lvv|)) . #41#)
          (LETT |listGen| NIL . #41#)
          (SEQ (LETT |res| NIL . #41#) (LETT #27# |partRes| . #41#) G190
               (COND
                ((OR (ATOM #27#) (PROGN (LETT |res| (CAR #27#) . #41#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |res1| (CDR (REVERSE |res|)) . #41#)
                      (EXIT
                       (COND
                        ((PROGN
                          (LETT #18# NIL . #41#)
                          (SEQ (LETT |f| NIL . #41#) (LETT #26# |res1| . #41#)
                               G190
                               (COND
                                ((OR (ATOM #26#)
                                     (PROGN (LETT |f| (CAR #26#) . #41#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (PROGN
                                  (LETT #20#
                                        (EQL
                                         (PROGN
                                          (LETT #21# NIL . #41#)
                                          (SEQ (LETT #25# NIL . #41#)
                                               (LETT #24#
                                                     (SPADCALL |f| |rrlvv|
                                                               (|compiledLookupCheck|
                                                                '|degree|
                                                                (LIST
                                                                 (LIST '|List|
                                                                       (LIST
                                                                        '|NonNegativeInteger|))
                                                                 '$
                                                                 (LIST '|List|
                                                                       (LIST
                                                                        '|OrderedVariableList|
                                                                        |lv|)))
                                                                (|DistributedMultivariatePolynomial|
                                                                 |lv|
                                                                 (ELT $ 6))))
                                                     . #41#)
                                               G190
                                               (COND
                                                ((OR (ATOM #24#)
                                                     (PROGN
                                                      (LETT #25# (CAR #24#)
                                                            . #41#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (PROGN
                                                  (LETT #23# #25# . #41#)
                                                  (COND
                                                   (#21#
                                                    (LETT #22# (MAX #22# #23#)
                                                          . #41#))
                                                   ('T
                                                    (PROGN
                                                     (LETT #22# #23# . #41#)
                                                     (LETT #21# 'T
                                                           . #41#)))))))
                                               (LETT #24# (CDR #24#) . #41#)
                                               (GO G190) G191 (EXIT NIL))
                                          (COND (#21# #22#)
                                                ('T (|IdentityError| '|max|))))
                                         1)
                                        . #41#)
                                  (COND
                                   (#18#
                                    (LETT #19# (COND (#19# #20#) ('T 'NIL))
                                          . #41#))
                                   ('T
                                    (PROGN
                                     (LETT #19# #20# . #41#)
                                     (LETT #18# 'T . #41#)))))))
                               (LETT #26# (CDR #26#) . #41#) (GO G190) G191
                               (EXIT NIL))
                          (COND (#18# #19#) ('T 'T)))
                         (PROGN
                          (LETT #17#
                                (LETT |listGen| (CONS |res| |listGen|) . #41#)
                                . #41#)
                          (GO #17#)))))))
                #17# (EXIT #17#))
               (LETT #27# (CDR #27#) . #41#) (GO G190) G191 (EXIT NIL))
          (LETT |result| NIL . #41#)
          (COND
           ((SPADCALL |listGen| NIL
                      (|compiledLookupCheck| '~= (LIST (LIST '|Boolean|) '$ '$)
                                             (|List| (|List| |dmp|))))
            (SEQ
             (LETT |listG|
                   (PROGN
                    (LETT #16# NIL . #41#)
                    (SEQ (LETT |pr| NIL . #41#) (LETT #15# |listGen| . #41#)
                         G190
                         (COND
                          ((OR (ATOM #15#)
                               (PROGN (LETT |pr| (CAR #15#) . #41#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #16#
                                 (CONS
                                  (PROGN
                                   (LETT #14# NIL . #41#)
                                   (SEQ (LETT |pf| NIL . #41#)
                                        (LETT #13# |pr| . #41#) G190
                                        (COND
                                         ((OR (ATOM #13#)
                                              (PROGN
                                               (LETT |pf| (CAR #13#) . #41#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #14#
                                                (CONS
                                                 (SPADCALL |pf|
                                                           (|compiledLookupCheck|
                                                            '|dmpToP|
                                                            (LIST
                                                             (LIST
                                                              '|Polynomial|
                                                              (|devaluate|
                                                               (ELT $ 6)))
                                                             (LIST
                                                              '|DistributedMultivariatePolynomial|
                                                              |lv|
                                                              (|devaluate|
                                                               (ELT $ 6))))
                                                            (|PolToPol| |lv|
                                                                        (ELT $
                                                                             6))))
                                                 #14#)
                                                . #41#)))
                                        (LETT #13# (CDR #13#) . #41#) (GO G190)
                                        G191 (EXIT (NREVERSE #14#))))
                                  #16#)
                                 . #41#)))
                         (LETT #15# (CDR #15#) . #41#) (GO G190) G191
                         (EXIT (NREVERSE #16#))))
                   . #41#)
             (LETT |result|
                   (PROGN
                    (LETT #9# NIL . #41#)
                    (SEQ (LETT |res| NIL . #41#) (LETT #12# |listG| . #41#)
                         G190
                         (COND
                          ((OR (ATOM #12#)
                               (PROGN (LETT |res| (CAR #12#) . #41#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (PROGN
                            (LETT #11#
                                  (|INFSP;findGenZeros| |res| |rlv| |eps| $)
                                  . #41#)
                            (COND (#9# (LETT #10# (APPEND #10# #11#) . #41#))
                                  ('T
                                   (PROGN
                                    (LETT #10# #11# . #41#)
                                    (LETT #9# 'T . #41#)))))))
                         (LETT #12# (CDR #12#) . #41#) (GO G190) G191
                         (EXIT NIL))
                    (COND (#9# #10#) (#42# NIL)))
                   . #41#)
             (EXIT
              (SEQ (LETT |gres| NIL . #41#) (LETT #8# |listGen| . #41#) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |gres| (CAR #8#) . #41#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |partRes|
                           (SPADCALL |partRes|
                                     (SPADCALL |gres| |partRes|
                                               (|compiledLookupCheck|
                                                '|position|
                                                (LIST (LIST '|Integer|)
                                                      (LIST '|List|
                                                            (LIST
                                                             '|DistributedMultivariatePolynomial|
                                                             |lv|
                                                             (|devaluate|
                                                              (ELT $ 6))))
                                                      '$)
                                                (|List|
                                                 (|List|
                                                  (|DistributedMultivariatePolynomial|
                                                   |lv| (ELT $ 6))))))
                                     (|compiledLookupCheck| '|delete|
                                                            (LIST '$ '$
                                                                  (LIST
                                                                   '|Integer|))
                                                            (|List|
                                                             (|List|
                                                              (|DistributedMultivariatePolynomial|
                                                               |lv|
                                                               (ELT $ 6))))))
                           . #41#)))
                   (LETT #8# (CDR #8#) . #41#) (GO G190) G191 (EXIT NIL))))))
          (SEQ (LETT |gres| NIL . #41#) (LETT #7# |partRes| . #41#) G190
               (COND
                ((OR (ATOM #7#) (PROGN (LETT |gres| (CAR #7#) . #41#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |genRecord|
                      (SPADCALL |gres| |lvv|
                                (|compiledLookupCheck| '|genericPosition|
                                                       (LIST
                                                        (LIST '|Record|
                                                              (LIST '|:|
                                                                    '|dpolys|
                                                                    (LIST
                                                                     '|List|
                                                                     (LIST
                                                                      '|DistributedMultivariatePolynomial|
                                                                      |lv|
                                                                      (|devaluate|
                                                                       (ELT $
                                                                            6)))))
                                                              (LIST '|:|
                                                                    '|coords|
                                                                    (LIST
                                                                     '|List|
                                                                     (LIST
                                                                      '|Integer|))))
                                                        (LIST '|List|
                                                              (LIST
                                                               '|DistributedMultivariatePolynomial|
                                                               |lv|
                                                               (|devaluate|
                                                                (ELT $ 6))))
                                                        (LIST '|List|
                                                              (LIST
                                                               '|OrderedVariableList|
                                                               |lv|)))
                                                       (|GroebnerSolve| |lv|
                                                                        (ELT $
                                                                             6)
                                                                        (ELT $
                                                                             6))))
                      . #41#)
                (LETT |lgen| (QCAR |genRecord|) . #41#)
                (LETT |lval| (QCDR |genRecord|) . #41#)
                (LETT |laval|
                      (PROGN
                       (LETT #6# NIL . #41#)
                       (SEQ (LETT |i| NIL . #41#) (LETT #5# |lval| . #41#) G190
                            (COND
                             ((OR (ATOM #5#)
                                  (PROGN (LETT |i| (CAR #5#) . #41#) NIL))
                              (GO G191)))
                            (SEQ (EXIT (LETT #6# (CONS (ABS |i|) #6#) . #41#)))
                            (LETT #5# (CDR #5#) . #41#) (GO G190) G191
                            (EXIT (NREVERSE #6#))))
                      . #41#)
                (LETT |lnorm| (SPADCALL (ELT $ 143) |laval| (QREFELT $ 146))
                      . #41#)
                (LETT |neps|
                      (SPADCALL (SPADCALL 1 (+ 1 |lnorm|) (QREFELT $ 63)) |eps|
                                (QREFELT $ 112))
                      . #41#)
                (LETT |lgen1|
                      (PROGN
                       (LETT #4# NIL . #41#)
                       (SEQ (LETT |pf| NIL . #41#) (LETT #3# |lgen| . #41#)
                            G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |pf| (CAR #3#) . #41#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #4#
                                    (CONS
                                     (SPADCALL |pf|
                                               (|compiledLookupCheck| '|dmpToP|
                                                                      (LIST
                                                                       (LIST
                                                                        '|Polynomial|
                                                                        (|devaluate|
                                                                         (ELT $
                                                                              6)))
                                                                       (LIST
                                                                        '|DistributedMultivariatePolynomial|
                                                                        |lv|
                                                                        (|devaluate|
                                                                         (ELT $
                                                                              6))))
                                                                      (|PolToPol|
                                                                       |lv|
                                                                       (ELT $
                                                                            6))))
                                     #4#)
                                    . #41#)))
                            (LETT #3# (CDR #3#) . #41#) (GO G190) G191
                            (EXIT (NREVERSE #4#))))
                      . #41#)
                (LETT |lris| (|INFSP;findGenZeros| |lgen1| |rlv| |neps| $)
                      . #41#)
                (EXIT
                 (LETT |result|
                       (APPEND
                        (PROGN
                         (LETT #2# NIL . #41#)
                         (SEQ (LETT |r| NIL . #41#) (LETT #1# |lris| . #41#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |r| (CAR #1#) . #41#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (|INFSP;oldCoord| |r| |lval| $)
                                            #2#)
                                      . #41#)))
                              (LETT #1# (CDR #1#) . #41#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        |result|)
                       . #41#)))
               (LETT #7# (CDR #7#) . #41#) (GO G190) G191 (EXIT NIL))
          (EXIT |result|))))))))) 

(DECLAIM (NOTINLINE |InnerNumericFloatSolvePackage;|)) 

(DEFUN |InnerNumericFloatSolvePackage| (&REST #1=#:G329)
  (PROG ()
    (RETURN
     (PROG (#2=#:G330)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|InnerNumericFloatSolvePackage|)
                                           '|domainEqualList|)
                . #3=(|InnerNumericFloatSolvePackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |InnerNumericFloatSolvePackage;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|InnerNumericFloatSolvePackage|))))))))))) 

(DEFUN |InnerNumericFloatSolvePackage;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|InnerNumericFloatSolvePackage|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|InnerNumericFloatSolvePackage| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 150) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|InnerNumericFloatSolvePackage|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|InnerNumericFloatSolvePackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Integer|) (|Float|) (0 . |coerce|)
              (|Fraction| 9) (5 . |coerce|) (|Complex| 10) (10 . |coerce|)
              (|Complex| 12) (15 . |coerce|) (|Complex| 9) (20 . |real|)
              (25 . |imag|) (30 . |complex|) (36 . |convert|) (|Symbol|)
              (|Polynomial| 7) (41 . |coerce|) (46 . |coerce|) (|Equation| 24)
              (51 . |equation|) (|List| 27) (|List| 7) (|List| 23)
              |INFSP;makeEq;LLL;2| (|Mapping| 7 6) (|Polynomial| 6)
              (|PolynomialFunctions2| 6 7) (57 . |map|) (63 . |eval|)
              (|SparseUnivariatePolynomial| $) (70 . |univariate|)
              (76 . |Zero|) (80 . |Zero|) (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 24) (84 . |coefficient|) (90 . -)
              (95 . |retract|) (100 . |leadingCoefficient|) (105 . /)
              (111 . |retract|) (|SparseUnivariatePolynomial| 6)
              (116 . |univariate|) |INFSP;innerSolve1;SupParL;6|
              |INFSP;innerSolve1;PParL;5| (|List| (|Complex| 8))
              (|ComplexRootPackage| 50 8) (121 . |complexZeros|)
              (|Record| (|:| |left| 12) (|:| |right| 12)) (|List| 57)
              (|SparseUnivariatePolynomial| 9) (|RealZeroPackage| 59)
              (127 . |realZeros|) (133 . |One|) (137 . /) (143 . +) (149 . *)
              (155 . |convert|) (160 . +) (166 . *) (|Interval| 10)
              (172 . |interval|) (177 . |Zero|) (|Complex| 69)
              (181 . |complex|) (187 . |interval|) (192 . |real|)
              (197 . |imag|) (202 . |real|) (207 . |imag|) (212 . -)
              (217 . |interval|) (223 . +) (229 . |sup|) (234 . |inf|)
              (239 . +) (245 . /) (251 . |mantissa|) (256 . |exponent|)
              (|PositiveInteger|) (261 . |base|) (265 . ^) (271 . *)
              (277 . |real|) (282 . |imag|) (287 . |complex|) (|Polynomial| 72)
              (|Mapping| 72 6) (|PolynomialFunctions2| 6 72) (293 . |map|)
              (299 . |eval|) (306 . |univariate|)
              (|SparseUnivariatePolynomial| 95) (312 . |leadingCoefficient|)
              (317 . |retract|) (|Union| $ '"failed") (322 . |recip|)
              (327 . |coefficient|) (333 . -) (338 . *) (344 . |coerce|)
              (349 . |One|) (353 . |One|) (357 . *) (363 . *) (369 . |bits|)
              (373 . |bits|) (378 . |width|) (|Boolean|) (383 . >) (389 . ^)
              (395 . *) '"first" (401 . |setelt|) (|List| 34) (408 . |elt|)
              (414 . |univariate|) (|PrimitiveArray| 127)
              (|SparseUnivariatePolynomial| 34) (|SubResultantPackage| 34 127)
              (420 . |subresultantVector|) (426 . |multivariate|)
              (432 . |primitivePart|) (437 . |primitivePart|) (443 . |zero?|)
              (448 . |Zero|) (|List| 30) |INFSP;innerSolve;2LLParL;18|
              (452 . |leadingCoefficient|) (457 . |gcd|) (463 . |One|)
              (467 . ~=) (473 . ~=) (479 . +) (485 . +) (|Mapping| 9 9 9)
              (|List| 9) (491 . |reduce|) (497 . |One|) (501 . |One|)
              (505 . |One|))
           '#(|makeEq| 509 |innerSolve1| 515 |innerSolve| 527) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 149
                                                 '(1 10 0 9 11 1 12 0 9 13 1 14
                                                   0 9 15 1 16 0 9 17 1 18 9 0
                                                   19 1 18 9 0 20 2 16 0 12 12
                                                   21 1 18 14 0 22 1 24 0 23 25
                                                   1 24 0 7 26 2 27 0 24 24 28
                                                   2 35 24 33 34 36 3 24 0 0 23
                                                   7 37 2 24 38 0 23 39 0 6 0
                                                   40 0 7 0 41 2 43 24 0 42 44
                                                   1 24 0 0 45 1 24 7 0 46 1 43
                                                   24 0 47 2 7 0 0 0 48 1 10 12
                                                   0 49 1 34 50 0 51 2 55 54 50
                                                   8 56 2 60 58 59 12 61 0 7 0
                                                   62 2 12 0 9 9 63 2 12 0 0 0
                                                   64 2 12 0 0 0 65 1 12 10 0
                                                   66 2 7 0 0 0 67 2 7 0 0 0 68
                                                   1 69 0 12 70 0 69 0 71 2 72
                                                   0 69 69 73 1 69 0 10 74 1 14
                                                   10 0 75 1 14 10 0 76 1 16 12
                                                   0 77 1 16 12 0 78 1 10 0 0
                                                   79 2 69 0 10 10 80 2 72 0 0
                                                   0 81 1 69 10 0 82 1 69 10 0
                                                   83 2 10 0 0 0 84 2 10 0 0 9
                                                   85 1 10 9 0 86 1 10 9 0 87 0
                                                   10 88 89 2 12 0 0 9 90 2 12
                                                   0 9 0 91 1 72 69 0 92 1 72
                                                   69 0 93 2 14 0 10 10 94 2 97
                                                   95 96 34 98 3 95 0 0 23 72
                                                   99 2 95 38 0 23 100 1 101 95
                                                   0 102 1 95 72 0 103 1 72 104
                                                   0 105 2 101 95 0 42 106 1 95
                                                   0 0 107 2 72 0 0 0 108 1 10
                                                   0 12 109 0 6 0 110 0 8 0 111
                                                   2 8 0 12 0 112 2 10 0 12 0
                                                   113 0 10 88 114 1 10 88 88
                                                   115 1 69 10 0 116 2 10 117 0
                                                   0 118 2 9 0 0 88 119 2 7 0 9
                                                   0 120 3 30 7 0 121 7 122 2
                                                   123 34 0 9 124 2 34 38 0 23
                                                   125 2 128 126 127 127 129 2
                                                   34 0 38 23 130 1 34 0 0 131
                                                   2 34 0 0 23 132 1 34 117 0
                                                   133 0 34 0 134 1 127 34 0
                                                   137 2 34 0 0 0 138 0 34 0
                                                   139 2 34 117 0 0 140 2 123
                                                   117 0 0 141 2 42 0 0 0 142 2
                                                   9 0 0 0 143 2 145 9 144 0
                                                   146 0 12 0 147 0 72 0 148 0
                                                   10 0 149 2 0 29 30 31 32 2 0
                                                   30 34 8 53 2 0 30 50 8 52 4
                                                   0 135 123 123 31 8 136)))))
           '|lookupComplete|)) 
