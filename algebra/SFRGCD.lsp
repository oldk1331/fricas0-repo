
(/VERSIONCHECK 2) 

(DEFUN |SFRGCD;startTableGcd!;3SV;1| (|ok| |ko| |domainName| $)
  (SEQ (SPADCALL (QREFELT $ 15)) (SPADCALL |ok| |ko| (QREFELT $ 17))
       (SPADCALL |domainName| (QREFELT $ 18)) (EXIT (SPADCALL (QREFELT $ 19))))) 

(DEFUN |SFRGCD;stopTableGcd!;V;2| ($)
  (SEQ (COND ((SPADCALL (QREFELT $ 22)) (SPADCALL (QREFELT $ 23))))
       (EXIT (SPADCALL (QREFELT $ 24))))) 

(DEFUN |SFRGCD;startTableInvSet!;3SV;3| (|ok| |ko| |domainName| $)
  (SEQ (SPADCALL (QREFELT $ 28)) (SPADCALL |ok| |ko| (QREFELT $ 29))
       (SPADCALL |domainName| (QREFELT $ 30)) (EXIT (SPADCALL (QREFELT $ 19))))) 

(DEFUN |SFRGCD;stopTableInvSet!;V;4| ($)
  (SEQ (COND ((SPADCALL (QREFELT $ 32)) (SPADCALL (QREFELT $ 33))))
       (EXIT (SPADCALL (QREFELT $ 34))))) 

(DEFUN |SFRGCD;stoseInvertible?;PTSB;5| (|p| |ts| $)
  (PROG (#1=#:G219 #2=#:G224 |g| #3=#:G226 |gwt| |lgwt| |ts_v-| |ts_v|
         #4=#:G215 #5=#:G211 #6=#:G225 |bwt| |toCheck| |v| |q|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |q| (SPADCALL (SPADCALL |p| |ts| (QREFELT $ 36)) (QREFELT $ 37))
              . #7=(|SFRGCD;stoseInvertible?;PTSB;5|))
        (EXIT
         (COND ((SPADCALL |q| (QREFELT $ 38)) 'NIL)
               ((SPADCALL |q| |ts| (QREFELT $ 39)) 'T)
               ('T
                (SEQ (LETT |v| (SPADCALL |q| (QREFELT $ 40)) . #7#)
                     (COND
                      ((NULL (SPADCALL |v| |ts| (QREFELT $ 41)))
                       (EXIT
                        (SEQ
                         (LETT |toCheck| (SPADCALL |p| |ts| (QREFELT $ 44))
                               . #7#)
                         (SEQ
                          (EXIT
                           (SEQ (LETT |bwt| NIL . #7#)
                                (LETT #6# |toCheck| . #7#) G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |bwt| (CAR #6#) . #7#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((|BooleanEquality| (QCAR |bwt|) 'NIL)
                                    (PROGN
                                     (LETT #5#
                                           (PROGN
                                            (LETT #2# 'NIL . #7#)
                                            (GO #2#))
                                           . #7#)
                                     (GO #5#))))))
                                (LETT #6# (CDR #6#) . #7#) (GO G190) G191
                                (EXIT NIL)))
                          #5# (EXIT #5#))
                         (EXIT (PROGN (LETT #2# 'T . #7#) (GO #2#)))))))
                     (LETT |ts_v|
                           (PROG2
                               (LETT #4# (SPADCALL |ts| |v| (QREFELT $ 46))
                                     . #7#)
                               (QCDR #4#)
                             (|check_union| (QEQCAR #4# 0) (QREFELT $ 9) #4#))
                           . #7#)
                     (LETT |ts_v-| (SPADCALL |ts| |v| (QREFELT $ 47)) . #7#)
                     (LETT |lgwt|
                           (SPADCALL |ts_v| |q| |ts_v-| 'NIL 'T (QREFELT $ 49))
                           . #7#)
                     (SEQ (LETT |gwt| NIL . #7#) (LETT #3# |lgwt| . #7#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |gwt| (CAR #3#) . #7#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |g| (QCAR |gwt|) . #7#)
                                 (EXIT
                                  (COND
                                   ((NULL (SPADCALL |g| (QREFELT $ 50)))
                                    (COND
                                     ((SPADCALL (SPADCALL |g| (QREFELT $ 40))
                                                |v| (QREFELT $ 51))
                                      (PROGN
                                       (LETT #1#
                                             (PROGN
                                              (LETT #2# 'NIL . #7#)
                                              (GO #2#))
                                             . #7#)
                                       (GO #1#)))))))))
                           #1# (EXIT #1#))
                          (LETT #3# (CDR #3#) . #7#) (GO G190) G191 (EXIT NIL))
                     (EXIT 'T)))))))
      #2# (EXIT #2#))))) 

(DEFUN |SFRGCD;stosePrepareSubResAlgo;2PTSL;6| (|p1| |p2| |ts| $)
  (PROG (|toSee| |toSave| |newp2| |s| #1=#:G231 |p3| #2=#:G244 |bwt| |lbwt|
         |lpwt| |v|)
    (RETURN
     (SEQ
      (LETT |toSee| (LIST (CONS (LIST |p1| |p2|) |ts|))
            . #3=(|SFRGCD;stosePrepareSubResAlgo;2PTSL;6|))
      (LETT |toSave| NIL . #3#) (LETT |v| (SPADCALL |p1| (QREFELT $ 40)) . #3#)
      (SEQ G190 (COND ((NULL (COND ((NULL |toSee|) 'NIL) ('T 'T))) (GO G191)))
           (SEQ (LETT |lpwt| (|SPADfirst| |toSee|) . #3#)
                (LETT |toSee| (CDR |toSee|) . #3#)
                (LETT |p1| (SPADCALL (QCAR |lpwt|) 1 (QREFELT $ 55)) . #3#)
                (LETT |p2| (SPADCALL (QCAR |lpwt|) 2 (QREFELT $ 55)) . #3#)
                (LETT |ts| (QCDR |lpwt|) . #3#)
                (LETT |lbwt|
                      (SPADCALL (SPADCALL |p2| |v| (QREFELT $ 56)) |ts|
                                (QREFELT $ 44))
                      . #3#)
                (EXIT
                 (SEQ (LETT |bwt| NIL . #3#) (LETT #2# |lbwt| . #3#) G190
                      (COND
                       ((OR (ATOM #2#)
                            (PROGN (LETT |bwt| (CAR #2#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (COND
                        ((|BooleanEquality| (QCAR |bwt|) 'T)
                         (COND
                          ((SPADCALL (SPADCALL |p2| |v| (QREFELT $ 58)) 0
                                     (QREFELT $ 59))
                           (EXIT
                            (SEQ
                             (LETT |p3|
                                   (SPADCALL |p1|
                                             (SPADCALL |p2| (QREFELT $ 60))
                                             (QREFELT $ 61))
                                   . #3#)
                             (LETT |s|
                                   (SPADCALL (SPADCALL |p2| (QREFELT $ 62))
                                             (PROG1
                                                 (LETT #1#
                                                       (-
                                                        (SPADCALL |p1|
                                                                  (QREFELT $
                                                                           63))
                                                        (SPADCALL |p2|
                                                                  (QREFELT $
                                                                           63)))
                                                       . #3#)
                                               (|check_subtype| (>= #1# 0)
                                                                '(|NonNegativeInteger|)
                                                                #1#))
                                             (QREFELT $ 64))
                                   . #3#)
                             (EXIT
                              (LETT |toSave|
                                    (CONS
                                     (CONS (LIST |p2| |p3| |s|) (QCDR |bwt|))
                                     |toSave|)
                                    . #3#))))))))
                       (LETT |newp2|
                             (SPADCALL
                              (SPADCALL |p2| (QCDR |bwt|) (QREFELT $ 36))
                              (QREFELT $ 37))
                             . #3#)
                       (EXIT
                        (COND
                         ((|BooleanEquality| (QCAR |bwt|) 'T)
                          (LETT |toSave|
                                (CONS
                                 (CONS
                                  (LIST |p2| (|spadConstant| $ 65)
                                        (|spadConstant| $ 66))
                                  (QCDR |bwt|))
                                 |toSave|)
                                . #3#))
                         ((SPADCALL |newp2| (QREFELT $ 38))
                          (LETT |toSave|
                                (CONS
                                 (CONS
                                  (LIST |p1| (|spadConstant| $ 65)
                                        (|spadConstant| $ 66))
                                  (QCDR |bwt|))
                                 |toSave|)
                                . #3#))
                         ('T
                          (LETT |toSee|
                                (CONS (CONS (LIST |p1| |newp2|) (QCDR |bwt|))
                                      |toSee|)
                                . #3#)))))
                      (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT |toSave|))))) 

(DEFUN |SFRGCD;stoseIntegralLastSubResultant;2PTSL;7| (|p1| |p2| |ts| $)
  (PROG (|ex| |gi1i2| |lsr|)
    (RETURN
     (SEQ
      (LETT |lsr| (SPADCALL |p1| |p2| (QREFELT $ 70))
            . #1=(|SFRGCD;stoseIntegralLastSubResultant;2PTSL;7|))
      (EXIT
       (COND
        ((OR (SPADCALL |lsr| (QREFELT $ 50))
             (SPADCALL (SPADCALL |lsr| (QREFELT $ 40))
                       (SPADCALL |p1| (QREFELT $ 40)) (QREFELT $ 71)))
         (LIST (CONS |lsr| |ts|)))
        ('T
         (SEQ
          (LETT |gi1i2|
                (SPADCALL (SPADCALL |p1| (QREFELT $ 62))
                          (SPADCALL |p2| (QREFELT $ 62)) (QREFELT $ 72))
                . #1#)
          (LETT |ex|
                (SPADCALL (SPADCALL |gi1i2| |lsr| (QREFELT $ 73))
                          (SPADCALL |lsr| (QREFELT $ 62)) (QREFELT $ 75))
                . #1#)
          (EXIT
           (COND ((QEQCAR |ex| 1) (LIST (CONS |lsr| |ts|)))
                 ('T (LIST (CONS (QCDR |ex|) |ts|))))))))))))) 

(DEFUN |SFRGCD;stoseInternalLastSubResultant;2PTS2BL;8|
       (|p1| |p2| |ts| |b1| |b2| $)
  (PROG (|toSave| |toSee| |s| #1=#:G261 |p3| #2=#:G266 |e| |k|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |k| (VECTOR |p1| |p2| |ts| |b2|)
              . #3=(|SFRGCD;stoseInternalLastSubResultant;2PTS2BL;8|))
        (LETT |e| (SPADCALL |k| (QREFELT $ 78)) . #3#)
        (EXIT
         (COND ((QEQCAR |e| 0) (QCDR |e|))
               ((SPADCALL |ts| (QREFELT $ 79))
                (SEQ
                 (LETT |toSave| (SPADCALL |p1| |p2| |ts| (QREFELT $ 76)) . #3#)
                 (SPADCALL |k| |toSave| (QREFELT $ 80))
                 (EXIT (PROGN (LETT #2# |toSave| . #3#) (GO #2#)))))
               (#4='T
                (SEQ
                 (COND
                  (|b1|
                   (SEQ
                    (LETT |p3|
                          (SPADCALL |p1| (SPADCALL |p2| (QREFELT $ 60))
                                    (QREFELT $ 61))
                          . #3#)
                    (LETT |s|
                          (SPADCALL (SPADCALL |p2| (QREFELT $ 62))
                                    (PROG1
                                        (LETT #1#
                                              (- (SPADCALL |p1| (QREFELT $ 63))
                                                 (SPADCALL |p2|
                                                           (QREFELT $ 63)))
                                              . #3#)
                                      (|check_subtype| (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       #1#))
                                    (QREFELT $ 64))
                          . #3#)
                    (EXIT
                     (LETT |toSee| (LIST (CONS (LIST |p2| |p3| |s|) |ts|))
                           . #3#))))
                  (#4#
                   (LETT |toSee| (SPADCALL |p1| |p2| |ts| (QREFELT $ 69))
                         . #3#)))
                 (LETT |toSave|
                       (SPADCALL |toSee| (SPADCALL |p1| (QREFELT $ 40)) |b2|
                                 (QREFELT $ 81))
                       . #3#)
                 (SPADCALL |k| |toSave| (QREFELT $ 80)) (EXIT |toSave|)))))))
      #2# (EXIT #2#))))) 

(DEFUN |SFRGCD;stoseInternalLastSubResultant;LVBL;9| (|llpwt| |v| |b2| $)
  (PROG (#1=#:G290 |lpwt| |s| |p2| |p1| |#G38| |#G37| |toReturn| #2=#:G289 |p3|
         |delta| #3=#:G277 |toSee| #4=#:G286 #5=#:G288 |bwt| |lbwt| |ts|
         #6=#:G287)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |toReturn| NIL
              . #7=(|SFRGCD;stoseInternalLastSubResultant;LVBL;9|))
        (SEQ G190
             (COND ((NULL (COND ((NULL |llpwt|) 'NIL) ('T 'T))) (GO G191)))
             (SEQ (LETT |toSee| |llpwt| . #7#) (LETT |llpwt| NIL . #7#)
                  (SEQ (LETT |lpwt| NIL . #7#) (LETT #6# |toSee| . #7#) G190
                       (COND
                        ((OR (ATOM #6#)
                             (PROGN (LETT |lpwt| (CAR #6#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |p1| (SPADCALL (QCAR |lpwt|) 1 (QREFELT $ 55))
                              . #7#)
                        (LETT |p2| (SPADCALL (QCAR |lpwt|) 2 (QREFELT $ 55))
                              . #7#)
                        (LETT |s| (SPADCALL (QCAR |lpwt|) 3 (QREFELT $ 55))
                              . #7#)
                        (LETT |ts| (QCDR |lpwt|) . #7#)
                        (LETT |lbwt|
                              (SPADCALL (SPADCALL |p2| |v| (QREFELT $ 56)) |ts|
                                        (QREFELT $ 44))
                              . #7#)
                        (EXIT
                         (SEQ (LETT |bwt| NIL . #7#) (LETT #5# |lbwt| . #7#)
                              G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |bwt| (CAR #5#) . #7#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((|BooleanEquality| (QCAR |bwt|) 'NIL)
                                  (SEQ
                                   (LETT |toReturn|
                                         (CONS (CONS |p1| (QCDR |bwt|))
                                               |toReturn|)
                                         . #7#)
                                   (EXIT
                                    (COND
                                     (|b2|
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL |p1| |v| (QREFELT $ 58))
                                         (QREFELT $ 82))
                                        (PROGN
                                         (LETT #4# |toReturn| . #7#)
                                         (GO #4#)))))))))
                                 ('T
                                  (LETT |llpwt|
                                        (CONS
                                         (CONS (LIST |p1| |p2| |s|)
                                               (QCDR |bwt|))
                                         |llpwt|)
                                        . #7#)))))
                              (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                              (EXIT NIL))))
                       (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND ((NULL |llpwt|) "leave")
                         ('T
                          (SEQ (LETT |toSee| |llpwt| . #7#)
                               (LETT |llpwt| NIL . #7#)
                               (LETT |lpwt| (|SPADfirst| |toSee|) . #7#)
                               (LETT |toSee| (CDR |toSee|) . #7#)
                               (LETT |p1|
                                     (SPADCALL (QCAR |lpwt|) 1 (QREFELT $ 55))
                                     . #7#)
                               (LETT |p2|
                                     (SPADCALL (QCAR |lpwt|) 2 (QREFELT $ 55))
                                     . #7#)
                               (LETT |s|
                                     (SPADCALL (QCAR |lpwt|) 3 (QREFELT $ 55))
                                     . #7#)
                               (LETT |delta|
                                     (PROG1
                                         (LETT #3#
                                               (-
                                                (SPADCALL |p1| (QREFELT $ 63))
                                                (SPADCALL |p2| |v|
                                                          (QREFELT $ 58)))
                                               . #7#)
                                       (|check_subtype| (>= #3# 0)
                                                        '(|NonNegativeInteger|)
                                                        #3#))
                                     . #7#)
                               (LETT |p3|
                                     (SPADCALL |p2|
                                               (SPADCALL |p2| |v|
                                                         (QREFELT $ 56))
                                               |s| |delta| (QREFELT $ 83))
                                     . #7#)
                               (EXIT
                                (COND
                                 ((ZEROP (SPADCALL |p3| |v| (QREFELT $ 58)))
                                  (SEQ
                                   (LETT |toReturn|
                                         (CONS (CONS |p3| (QCDR |lpwt|))
                                               |toReturn|)
                                         . #7#)
                                   (EXIT
                                    (SEQ (LETT |lpwt| NIL . #7#)
                                         (LETT #2# |toSee| . #7#) G190
                                         (COND
                                          ((OR (ATOM #2#)
                                               (PROGN
                                                (LETT |lpwt| (CAR #2#) . #7#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |toReturn|
                                                 (CONS
                                                  (CONS |p3| (QCDR |lpwt|))
                                                  |toReturn|)
                                                 . #7#)))
                                         (LETT #2# (CDR #2#) . #7#) (GO G190)
                                         G191 (EXIT NIL)))))
                                 ('T
                                  (SEQ
                                   (PROGN
                                    (LETT |#G37| |p3| . #7#)
                                    (LETT |#G38|
                                          (SPADCALL |p1| |p2| |p3| |s|
                                                    (QREFELT $ 84))
                                          . #7#)
                                    (LETT |p1| |#G37| . #7#)
                                    (LETT |p2| |#G38| . #7#))
                                   (LETT |s| (SPADCALL |p1| |v| (QREFELT $ 56))
                                         . #7#)
                                   (LETT |llpwt|
                                         (CONS
                                          (CONS (LIST |p1| |p2| |s|)
                                                (QCDR |lpwt|))
                                          |llpwt|)
                                         . #7#)
                                   (EXIT
                                    (SEQ (LETT |lpwt| NIL . #7#)
                                         (LETT #1# |toSee| . #7#) G190
                                         (COND
                                          ((OR (ATOM #1#)
                                               (PROGN
                                                (LETT |lpwt| (CAR #1#) . #7#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |llpwt|
                                                 (CONS
                                                  (CONS (LIST |p1| |p2| |s|)
                                                        (QCDR |lpwt|))
                                                  |llpwt|)
                                                 . #7#)))
                                         (LETT #1# (CDR #1#) . #7#) (GO G190)
                                         G191 (EXIT NIL))))))))))))
             NIL (GO G190) G191 (EXIT NIL))
        (EXIT |toReturn|)))
      #4# (EXIT #4#))))) 

(DEFUN |SFRGCD;stoseLastSubResultant;2PTSL;10| (|p1| |p2| |ts| $)
  (PROG (|#G45| |#G44|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p1| (QREFELT $ 50))
        (|error| "in stoseLastSubResultantElseSplit$SFRGCD  : bad #1"))
       ((OR (SPADCALL |p2| (QREFELT $ 50))
            (NULL
             (SPADCALL (SPADCALL |p2| (QREFELT $ 40))
                       (SPADCALL |p1| (QREFELT $ 40)) (QREFELT $ 51))))
        (|error| "in stoseLastSubResultantElseSplit$SFRGCD : bad #2"))
       ((OR (SPADCALL (SPADCALL |p1| (QREFELT $ 40)) |ts| (QREFELT $ 41))
            (NULL (SPADCALL |p1| |ts| (QREFELT $ 85))))
        (|error| "in stoseLastSubResultantElseSplit$SFRGCD : bad #1"))
       ((NULL (SPADCALL |p2| |ts| (QREFELT $ 85)))
        (|error| "in stoseLastSubResultantElseSplit$SFRGCD : bad #2"))
       ('T
        (SEQ
         (COND
          ((SPADCALL |p1| |ts| (QREFELT $ 86))
           (COND
            ((SPADCALL |p2| |ts| (QREFELT $ 86))
             (EXIT (SPADCALL |p1| |p2| |ts| (QREFELT $ 76)))))))
         (COND
          ((< (SPADCALL |p1| (QREFELT $ 63)) (SPADCALL |p2| (QREFELT $ 63)))
           (SEQ
            (PROGN
             (LETT |#G44| |p2| . #1=(|SFRGCD;stoseLastSubResultant;2PTSL;10|))
             (LETT |#G45| |p1| . #1#)
             (LETT |p1| |#G44| . #1#)
             (LETT |p2| |#G45| . #1#))
            (EXIT
             (COND
              ((ODDP (SPADCALL |p1| (QREFELT $ 63)))
               (COND
                ((ODDP (SPADCALL |p2| (QREFELT $ 63)))
                 (LETT |p2| (SPADCALL |p2| (QREFELT $ 60)) . #1#)))))))))
         (EXIT (SPADCALL |p1| |p2| |ts| 'NIL 'NIL (QREFELT $ 49)))))))))) 

(DEFUN |SFRGCD;stoseSquareFreePart_wip| (|p| |ts| $)
  (PROG (|lpwt| |sfp| |g| |us| #1=#:G313 |gwt| |lgwt| |q| |v|)
    (RETURN
     (SEQ
      (COND ((EQL (SPADCALL |p| (QREFELT $ 63)) 1) (LIST (CONS |p| |ts|)))
            ('T
             (SEQ
              (LETT |v| (SPADCALL |p| (QREFELT $ 40))
                    . #2=(|SFRGCD;stoseSquareFreePart_wip|))
              (LETT |q|
                    (SPADCALL (SPADCALL |p| |v| (QREFELT $ 89)) (QREFELT $ 90))
                    . #2#)
              (LETT |lgwt| (SPADCALL |p| |q| |ts| 'T 'NIL (QREFELT $ 49))
                    . #2#)
              (LETT |lpwt| NIL . #2#)
              (SEQ (LETT |gwt| NIL . #2#) (LETT #1# |lgwt| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |gwt| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |g| (QCAR |gwt|) . #2#)
                        (LETT |us| (QCDR |gwt|) . #2#)
                        (COND
                         ((OR (SPADCALL |g| (QREFELT $ 50))
                              (SPADCALL (SPADCALL |g| (QREFELT $ 40)) |v|
                                        (QREFELT $ 71)))
                          (EXIT
                           (LETT |lpwt| (CONS (CONS |p| |us|) |lpwt|) . #2#))))
                        (LETT |g| (SPADCALL |g| (QREFELT $ 90)) . #2#)
                        (LETT |sfp| (SPADCALL |p| |g| (QREFELT $ 91)) . #2#)
                        (LETT |sfp|
                              (SPADCALL (SPADCALL |sfp| |us| (QREFELT $ 92))
                                        (QREFELT $ 90))
                              . #2#)
                        (EXIT
                         (LETT |lpwt| (CONS (CONS |sfp| |us|) |lpwt|) . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |lpwt|)))))))) 

(DEFUN |SFRGCD;stoseSquareFreePart_base| (|p| |ts| $) (LIST (CONS |p| |ts|))) 

(DEFUN |SFRGCD;stoseSquareFreePart;PTSL;13| (|p| |ts| $)
  (|SFRGCD;stoseSquareFreePart_wip| |p| |ts| $)) 

(DEFUN |SFRGCD;stoseInvertible?_sqfreg;PTSL;14| (|p| |ts| $)
  (PROG (|lbwt| #1=#:G346 |ts_h| |lts_h| |h| #2=#:G345 |ts_g| |lts_g| |g|
         #3=#:G344 |lts| #4=#:G343 |gwt| |lgwt| |ts_v+| |ts_v-| |ts_v|
         #5=#:G323 #6=#:G341 |newq| #7=#:G342 |bwt| |toCheck| |v| |q|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |q| (SPADCALL (SPADCALL |p| |ts| (QREFELT $ 36)) (QREFELT $ 37))
              . #8=(|SFRGCD;stoseInvertible?_sqfreg;PTSL;14|))
        (EXIT
         (COND ((SPADCALL |q| (QREFELT $ 38)) (LIST (CONS 'NIL |ts|)))
               ((SPADCALL |q| |ts| (QREFELT $ 39)) (LIST (CONS 'T |ts|)))
               ('T
                (SEQ (LETT |v| (SPADCALL |q| (QREFELT $ 40)) . #8#)
                     (COND
                      ((NULL (SPADCALL |v| |ts| (QREFELT $ 41)))
                       (EXIT
                        (SEQ (LETT |lbwt| NIL . #8#)
                             (LETT |toCheck|
                                   (SPADCALL (SPADCALL |q| (QREFELT $ 62)) |ts|
                                             (QREFELT $ 94))
                                   . #8#)
                             (SEQ (LETT |bwt| NIL . #8#)
                                  (LETT #7# |toCheck| . #8#) G190
                                  (COND
                                   ((OR (ATOM #7#)
                                        (PROGN
                                         (LETT |bwt| (CAR #7#) . #8#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((QCAR |bwt|)
                                      (LETT |lbwt| (CONS |bwt| |lbwt|) . #8#))
                                     ('T
                                      (SEQ
                                       (LETT |newq|
                                             (SPADCALL |q| (QCDR |bwt|)
                                                       (QREFELT $ 95))
                                             . #8#)
                                       (EXIT
                                        (COND
                                         ((SPADCALL |newq| (QREFELT $ 38))
                                          (LETT |lbwt| (CONS |bwt| |lbwt|)
                                                . #8#))
                                         ('T
                                          (LETT |lbwt|
                                                (SPADCALL
                                                 (SPADCALL |newq| (QCDR |bwt|)
                                                           (QREFELT $ 94))
                                                 |lbwt| (QREFELT $ 96))
                                                . #8#)))))))))
                                  (LETT #7# (CDR #7#) . #8#) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT
                              (PROGN (LETT #6# |lbwt| . #8#) (GO #6#)))))))
                     (LETT |ts_v|
                           (PROG2
                               (LETT #5# (SPADCALL |ts| |v| (QREFELT $ 46))
                                     . #8#)
                               (QCDR #5#)
                             (|check_union| (QEQCAR #5# 0) (QREFELT $ 9) #5#))
                           . #8#)
                     (LETT |ts_v-| (SPADCALL |ts| |v| (QREFELT $ 47)) . #8#)
                     (LETT |ts_v+| (SPADCALL |ts| |v| (QREFELT $ 97)) . #8#)
                     (LETT |lgwt|
                           (SPADCALL |ts_v| |q| |ts_v-| 'NIL 'NIL
                                     (QREFELT $ 49))
                           . #8#)
                     (LETT |lbwt| NIL . #8#)
                     (SEQ (LETT |gwt| NIL . #8#) (LETT #4# |lgwt| . #8#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |gwt| (CAR #4#) . #8#) NIL))
                            (GO G191)))
                          (SEQ (LETT |g| (QCAR |gwt|) . #8#)
                               (LETT |ts| (QCDR |gwt|) . #8#)
                               (COND
                                ((OR (SPADCALL |g| (QREFELT $ 50))
                                     (SPADCALL (SPADCALL |g| (QREFELT $ 40))
                                               |v| (QREFELT $ 71)))
                                 (EXIT
                                  (SEQ
                                   (LETT |lts|
                                         (SPADCALL |ts_v| |ts| (QREFELT $ 99))
                                         . #8#)
                                   (LETT |lts|
                                         (SPADCALL
                                          (SPADCALL |ts_v+| (QREFELT $ 100))
                                          |lts| (QREFELT $ 101))
                                         . #8#)
                                   (EXIT
                                    (SEQ (LETT |ts| NIL . #8#)
                                         (LETT #3# |lts| . #8#) G190
                                         (COND
                                          ((OR (ATOM #3#)
                                               (PROGN
                                                (LETT |ts| (CAR #3#) . #8#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |lbwt|
                                                 (CONS (CONS 'T |ts|) |lbwt|)
                                                 . #8#)))
                                         (LETT #3# (CDR #3#) . #8#) (GO G190)
                                         G191 (EXIT NIL)))))))
                               (LETT |g| (SPADCALL |g| (QREFELT $ 90)) . #8#)
                               (LETT |lts_g| (SPADCALL |g| |ts| (QREFELT $ 99))
                                     . #8#)
                               (LETT |lts_g|
                                     (SPADCALL
                                      (SPADCALL |ts_v+| (QREFELT $ 100))
                                      |lts_g| (QREFELT $ 101))
                                     . #8#)
                               (SEQ (LETT |ts_g| NIL . #8#)
                                    (LETT #2# |lts_g| . #8#) G190
                                    (COND
                                     ((OR (ATOM #2#)
                                          (PROGN
                                           (LETT |ts_g| (CAR #2#) . #8#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |lbwt|
                                            (CONS (CONS 'NIL |ts_g|) |lbwt|)
                                            . #8#)))
                                    (LETT #2# (CDR #2#) . #8#) (GO G190) G191
                                    (EXIT NIL))
                               (LETT |h| (SPADCALL |ts_v| |g| (QREFELT $ 91))
                                     . #8#)
                               (COND
                                ((OR (SPADCALL |h| (QREFELT $ 50))
                                     (SPADCALL (SPADCALL |h| (QREFELT $ 40))
                                               |v| (QREFELT $ 71)))
                                 (EXIT "leave")))
                               (LETT |h| (SPADCALL |h| (QREFELT $ 90)) . #8#)
                               (LETT |lts_h| (SPADCALL |h| |ts| (QREFELT $ 99))
                                     . #8#)
                               (LETT |lts_h|
                                     (SPADCALL
                                      (SPADCALL |ts_v+| (QREFELT $ 100))
                                      |lts_h| (QREFELT $ 101))
                                     . #8#)
                               (EXIT
                                (SEQ (LETT |ts_h| NIL . #8#)
                                     (LETT #1# |lts_h| . #8#) G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN
                                            (LETT |ts_h| (CAR #1#) . #8#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT |lbwt|
                                             (CONS (CONS 'T |ts_h|) |lbwt|)
                                             . #8#)))
                                     (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                                     (EXIT NIL))))
                          (LETT #4# (CDR #4#) . #8#) (GO G190) G191 (EXIT NIL))
                     (EXIT
                      (SPADCALL
                       (CONS #'|SFRGCD;stoseInvertible?_sqfreg;PTSL;14!0| $)
                       |lbwt| (QREFELT $ 104)))))))))
      #6# (EXIT #6#))))) 

(DEFUN |SFRGCD;stoseInvertible?_sqfreg;PTSL;14!0| (|x| |y| $)
  (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 102))) 

(DEFUN |SFRGCD;stoseInvertibleSet_sqfreg;PTSL;15| (|p| |ts| $)
  (PROG (|toSave| |lts_h| |h| |g| |lts| #1=#:G374 |gwt| |lgwt| |ts_v+| |ts_v-|
         |ts_v| #2=#:G358 #3=#:G372 |newq| #4=#:G373 |bwt| |toCheck| |v| |q|
         |e| |k|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |k| (CONS |p| |ts|)
              . #5=(|SFRGCD;stoseInvertibleSet_sqfreg;PTSL;15|))
        (LETT |e| (SPADCALL |k| (QREFELT $ 106)) . #5#)
        (EXIT
         (COND ((QEQCAR |e| 0) (QCDR |e|))
               (#6='T
                (SEQ
                 (LETT |q|
                       (SPADCALL (SPADCALL |p| |ts| (QREFELT $ 36))
                                 (QREFELT $ 37))
                       . #5#)
                 (EXIT
                  (COND ((SPADCALL |q| (QREFELT $ 38)) NIL)
                        ((SPADCALL |q| |ts| (QREFELT $ 39)) (LIST |ts|))
                        (#6#
                         (SEQ (LETT |v| (SPADCALL |q| (QREFELT $ 40)) . #5#)
                              (LETT |toSave| NIL . #5#)
                              (COND
                               ((NULL (SPADCALL |v| |ts| (QREFELT $ 41)))
                                (EXIT
                                 (SEQ
                                  (LETT |toCheck|
                                        (SPADCALL (SPADCALL |q| (QREFELT $ 62))
                                                  |ts| (QREFELT $ 94))
                                        . #5#)
                                  (SEQ (LETT |bwt| NIL . #5#)
                                       (LETT #4# |toCheck| . #5#) G190
                                       (COND
                                        ((OR (ATOM #4#)
                                             (PROGN
                                              (LETT |bwt| (CAR #4#) . #5#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (COND
                                          ((QCAR |bwt|)
                                           (LETT |toSave|
                                                 (CONS (QCDR |bwt|) |toSave|)
                                                 . #5#))
                                          ('T
                                           (SEQ
                                            (LETT |newq|
                                                  (SPADCALL |q| (QCDR |bwt|)
                                                            (QREFELT $ 95))
                                                  . #5#)
                                            (EXIT
                                             (COND
                                              ((SPADCALL |newq| (QREFELT $ 38))
                                               "leave")
                                              ('T
                                               (LETT |toSave|
                                                     (SPADCALL
                                                      (SPADCALL |newq|
                                                                (QCDR |bwt|)
                                                                (QREFELT $
                                                                         108))
                                                      |toSave| (QREFELT $ 109))
                                                     . #5#)))))))))
                                       (LETT #4# (CDR #4#) . #5#) (GO G190)
                                       G191 (EXIT NIL))
                                  (LETT |toSave|
                                        (SPADCALL |toSave| (QREFELT $ 110))
                                        . #5#)
                                  (EXIT
                                   (PROGN
                                    (LETT #3#
                                          (SPADCALL |toSave| (QREFELT $ 112))
                                          . #5#)
                                    (GO #3#)))))))
                              (LETT |ts_v|
                                    (PROG2
                                        (LETT #2#
                                              (SPADCALL |ts| |v|
                                                        (QREFELT $ 46))
                                              . #5#)
                                        (QCDR #2#)
                                      (|check_union| (QEQCAR #2# 0)
                                                     (QREFELT $ 9) #2#))
                                    . #5#)
                              (LETT |ts_v-| (SPADCALL |ts| |v| (QREFELT $ 47))
                                    . #5#)
                              (LETT |ts_v+| (SPADCALL |ts| |v| (QREFELT $ 97))
                                    . #5#)
                              (LETT |lgwt|
                                    (SPADCALL |ts_v| |q| |ts_v-| 'NIL 'NIL
                                              (QREFELT $ 49))
                                    . #5#)
                              (SEQ (LETT |gwt| NIL . #5#)
                                   (LETT #1# |lgwt| . #5#) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |gwt| (CAR #1#) . #5#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ (LETT |g| (QCAR |gwt|) . #5#)
                                        (LETT |ts| (QCDR |gwt|) . #5#)
                                        (COND
                                         ((OR (SPADCALL |g| (QREFELT $ 50))
                                              (SPADCALL
                                               (SPADCALL |g| (QREFELT $ 40))
                                               |v| (QREFELT $ 71)))
                                          (EXIT
                                           (SEQ
                                            (LETT |lts|
                                                  (SPADCALL |ts_v| |ts|
                                                            (QREFELT $ 99))
                                                  . #5#)
                                            (LETT |lts|
                                                  (SPADCALL
                                                   (SPADCALL |ts_v+|
                                                             (QREFELT $ 100))
                                                   |lts| (QREFELT $ 101))
                                                  . #5#)
                                            (EXIT
                                             (LETT |toSave|
                                                   (SPADCALL |lts| |toSave|
                                                             (QREFELT $ 109))
                                                   . #5#))))))
                                        (LETT |g| (SPADCALL |g| (QREFELT $ 90))
                                              . #5#)
                                        (LETT |h|
                                              (SPADCALL |ts_v| |g|
                                                        (QREFELT $ 91))
                                              . #5#)
                                        (LETT |h| (SPADCALL |h| (QREFELT $ 90))
                                              . #5#)
                                        (COND
                                         ((OR (SPADCALL |h| (QREFELT $ 50))
                                              (SPADCALL
                                               (SPADCALL |h| (QREFELT $ 40))
                                               |v| (QREFELT $ 71)))
                                          (EXIT "leave")))
                                        (LETT |lts_h|
                                              (SPADCALL |h| |ts|
                                                        (QREFELT $ 99))
                                              . #5#)
                                        (LETT |lts_h|
                                              (SPADCALL
                                               (SPADCALL |ts_v+|
                                                         (QREFELT $ 100))
                                               |lts_h| (QREFELT $ 101))
                                              . #5#)
                                        (EXIT
                                         (LETT |toSave|
                                               (SPADCALL |lts_h| |toSave|
                                                         (QREFELT $ 109))
                                               . #5#)))
                                   (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                   (EXIT NIL))
                              (LETT |toSave|
                                    (SPADCALL |toSave| (QREFELT $ 112)) . #5#)
                              (SPADCALL |k| |toSave| (QREFELT $ 113))
                              (EXIT |toSave|)))))))))))
      #3# (EXIT #3#))))) 

(DEFUN |SFRGCD;stoseInvertible?_reg;PTSL;16| (|p| |ts| $)
  (PROG (|lbwt| #1=#:G410 |bwt| #2=#:G409 |inv| #3=#:G408 |ts_h| |lts_h| |h|
         #4=#:G407 |ts_g| |lts_g| |g| #5=#:G406 |lts| #6=#:G405 |gwt| |lgwt|
         |ts_v+| |ts_v-| |ts_v| #7=#:G382 #8=#:G403 |newq| #9=#:G404 |toCheck|
         |v| |q|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |q| (SPADCALL (SPADCALL |p| |ts| (QREFELT $ 36)) (QREFELT $ 37))
              . #10=(|SFRGCD;stoseInvertible?_reg;PTSL;16|))
        (EXIT
         (COND ((SPADCALL |q| (QREFELT $ 38)) (LIST (CONS 'NIL |ts|)))
               ((SPADCALL |q| |ts| (QREFELT $ 39)) (LIST (CONS 'T |ts|)))
               ('T
                (SEQ (LETT |v| (SPADCALL |q| (QREFELT $ 40)) . #10#)
                     (COND
                      ((NULL (SPADCALL |v| |ts| (QREFELT $ 41)))
                       (EXIT
                        (SEQ (LETT |lbwt| NIL . #10#)
                             (LETT |toCheck|
                                   (SPADCALL (SPADCALL |q| (QREFELT $ 62)) |ts|
                                             (QREFELT $ 114))
                                   . #10#)
                             (SEQ (LETT |bwt| NIL . #10#)
                                  (LETT #9# |toCheck| . #10#) G190
                                  (COND
                                   ((OR (ATOM #9#)
                                        (PROGN
                                         (LETT |bwt| (CAR #9#) . #10#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((QCAR |bwt|)
                                      (LETT |lbwt| (CONS |bwt| |lbwt|) . #10#))
                                     ('T
                                      (SEQ
                                       (LETT |newq|
                                             (SPADCALL |q| (QCDR |bwt|)
                                                       (QREFELT $ 95))
                                             . #10#)
                                       (EXIT
                                        (COND
                                         ((SPADCALL |newq| (QREFELT $ 38))
                                          (LETT |lbwt| (CONS |bwt| |lbwt|)
                                                . #10#))
                                         ('T
                                          (LETT |lbwt|
                                                (SPADCALL
                                                 (SPADCALL |newq| (QCDR |bwt|)
                                                           (QREFELT $ 114))
                                                 |lbwt| (QREFELT $ 96))
                                                . #10#)))))))))
                                  (LETT #9# (CDR #9#) . #10#) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT
                              (PROGN (LETT #8# |lbwt| . #10#) (GO #8#)))))))
                     (LETT |ts_v|
                           (PROG2
                               (LETT #7# (SPADCALL |ts| |v| (QREFELT $ 46))
                                     . #10#)
                               (QCDR #7#)
                             (|check_union| (QEQCAR #7# 0) (QREFELT $ 9) #7#))
                           . #10#)
                     (LETT |ts_v-| (SPADCALL |ts| |v| (QREFELT $ 47)) . #10#)
                     (LETT |ts_v+| (SPADCALL |ts| |v| (QREFELT $ 97)) . #10#)
                     (LETT |lgwt|
                           (SPADCALL |ts_v| |q| |ts_v-| 'NIL 'NIL
                                     (QREFELT $ 49))
                           . #10#)
                     (LETT |lbwt| NIL . #10#)
                     (SEQ (LETT |gwt| NIL . #10#) (LETT #6# |lgwt| . #10#) G190
                          (COND
                           ((OR (ATOM #6#)
                                (PROGN (LETT |gwt| (CAR #6#) . #10#) NIL))
                            (GO G191)))
                          (SEQ (LETT |g| (QCAR |gwt|) . #10#)
                               (LETT |ts| (QCDR |gwt|) . #10#)
                               (COND
                                ((OR (SPADCALL |g| (QREFELT $ 50))
                                     (SPADCALL (SPADCALL |g| (QREFELT $ 40))
                                               |v| (QREFELT $ 71)))
                                 (EXIT
                                  (SEQ
                                   (LETT |lts|
                                         (SPADCALL |ts_v| |ts| (QREFELT $ 99))
                                         . #10#)
                                   (LETT |lts|
                                         (SPADCALL
                                          (SPADCALL |ts_v+| (QREFELT $ 100))
                                          |lts| (QREFELT $ 101))
                                         . #10#)
                                   (EXIT
                                    (SEQ (LETT |ts| NIL . #10#)
                                         (LETT #5# |lts| . #10#) G190
                                         (COND
                                          ((OR (ATOM #5#)
                                               (PROGN
                                                (LETT |ts| (CAR #5#) . #10#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |lbwt|
                                                 (CONS (CONS 'T |ts|) |lbwt|)
                                                 . #10#)))
                                         (LETT #5# (CDR #5#) . #10#) (GO G190)
                                         G191 (EXIT NIL)))))))
                               (LETT |g| (SPADCALL |g| (QREFELT $ 90)) . #10#)
                               (LETT |lts_g| (SPADCALL |g| |ts| (QREFELT $ 99))
                                     . #10#)
                               (LETT |lts_g|
                                     (SPADCALL
                                      (SPADCALL |ts_v+| (QREFELT $ 100))
                                      |lts_g| (QREFELT $ 101))
                                     . #10#)
                               (SEQ (LETT |ts_g| NIL . #10#)
                                    (LETT #4# |lts_g| . #10#) G190
                                    (COND
                                     ((OR (ATOM #4#)
                                          (PROGN
                                           (LETT |ts_g| (CAR #4#) . #10#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |lbwt|
                                            (CONS (CONS 'NIL |ts_g|) |lbwt|)
                                            . #10#)))
                                    (LETT #4# (CDR #4#) . #10#) (GO G190) G191
                                    (EXIT NIL))
                               (LETT |h| (SPADCALL |ts_v| |g| (QREFELT $ 91))
                                     . #10#)
                               (COND
                                ((OR (SPADCALL |h| (QREFELT $ 50))
                                     (SPADCALL (SPADCALL |h| (QREFELT $ 40))
                                               |v| (QREFELT $ 71)))
                                 (EXIT "leave")))
                               (LETT |h| (SPADCALL |h| (QREFELT $ 90)) . #10#)
                               (LETT |lts_h| (SPADCALL |h| |ts| (QREFELT $ 99))
                                     . #10#)
                               (LETT |lts_h|
                                     (SPADCALL
                                      (SPADCALL |ts_v+| (QREFELT $ 100))
                                      |lts_h| (QREFELT $ 101))
                                     . #10#)
                               (EXIT
                                (SEQ (LETT |ts_h| NIL . #10#)
                                     (LETT #3# |lts_h| . #10#) G190
                                     (COND
                                      ((OR (ATOM #3#)
                                           (PROGN
                                            (LETT |ts_h| (CAR #3#) . #10#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |inv|
                                            (SPADCALL |q| |ts_h|
                                                      (QREFELT $ 114))
                                            . #10#)
                                      (EXIT
                                       (LETT |lbwt|
                                             (SPADCALL
                                              (PROGN
                                               (LETT #2# NIL . #10#)
                                               (SEQ (LETT |bwt| NIL . #10#)
                                                    (LETT #1# |inv| . #10#)
                                                    G190
                                                    (COND
                                                     ((OR (ATOM #1#)
                                                          (PROGN
                                                           (LETT |bwt|
                                                                 (CAR #1#)
                                                                 . #10#)
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (COND
                                                       ((QCAR |bwt|)
                                                        (LETT #2#
                                                              (CONS |bwt| #2#)
                                                              . #10#)))))
                                                    (LETT #1# (CDR #1#) . #10#)
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #2#))))
                                              |lbwt| (QREFELT $ 96))
                                             . #10#)))
                                     (LETT #3# (CDR #3#) . #10#) (GO G190) G191
                                     (EXIT NIL))))
                          (LETT #6# (CDR #6#) . #10#) (GO G190) G191
                          (EXIT NIL))
                     (EXIT
                      (SPADCALL
                       (CONS #'|SFRGCD;stoseInvertible?_reg;PTSL;16!0| $)
                       |lbwt| (QREFELT $ 104)))))))))
      #8# (EXIT #8#))))) 

(DEFUN |SFRGCD;stoseInvertible?_reg;PTSL;16!0| (|x| |y| $)
  (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 102))) 

(DEFUN |SFRGCD;stoseInvertibleSet_reg;PTSL;17| (|p| |ts| $)
  (PROG (|toSave| |inv| #1=#:G441 |ts_h| |lts_h| |h| |g| |lts| #2=#:G440 |gwt|
         |lgwt| |ts_v+| |ts_v-| |ts_v| #3=#:G422 #4=#:G438 |newq| #5=#:G439
         |bwt| |toCheck| |v| |q| |e| |k|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |k| (CONS |p| |ts|)
              . #6=(|SFRGCD;stoseInvertibleSet_reg;PTSL;17|))
        (LETT |e| (SPADCALL |k| (QREFELT $ 106)) . #6#)
        (EXIT
         (COND ((QEQCAR |e| 0) (QCDR |e|))
               (#7='T
                (SEQ
                 (LETT |q|
                       (SPADCALL (SPADCALL |p| |ts| (QREFELT $ 36))
                                 (QREFELT $ 37))
                       . #6#)
                 (EXIT
                  (COND ((SPADCALL |q| (QREFELT $ 38)) NIL)
                        ((SPADCALL |q| |ts| (QREFELT $ 39)) (LIST |ts|))
                        (#7#
                         (SEQ (LETT |v| (SPADCALL |q| (QREFELT $ 40)) . #6#)
                              (LETT |toSave| NIL . #6#)
                              (COND
                               ((NULL (SPADCALL |v| |ts| (QREFELT $ 41)))
                                (EXIT
                                 (SEQ
                                  (LETT |toCheck|
                                        (SPADCALL (SPADCALL |q| (QREFELT $ 62))
                                                  |ts| (QREFELT $ 114))
                                        . #6#)
                                  (SEQ (LETT |bwt| NIL . #6#)
                                       (LETT #5# |toCheck| . #6#) G190
                                       (COND
                                        ((OR (ATOM #5#)
                                             (PROGN
                                              (LETT |bwt| (CAR #5#) . #6#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (COND
                                          ((QCAR |bwt|)
                                           (LETT |toSave|
                                                 (CONS (QCDR |bwt|) |toSave|)
                                                 . #6#))
                                          ('T
                                           (SEQ
                                            (LETT |newq|
                                                  (SPADCALL |q| (QCDR |bwt|)
                                                            (QREFELT $ 95))
                                                  . #6#)
                                            (EXIT
                                             (COND
                                              ((SPADCALL |newq| (QREFELT $ 38))
                                               "leave")
                                              ('T
                                               (LETT |toSave|
                                                     (SPADCALL
                                                      (SPADCALL |newq|
                                                                (QCDR |bwt|)
                                                                (QREFELT $
                                                                         115))
                                                      |toSave| (QREFELT $ 109))
                                                     . #6#)))))))))
                                       (LETT #5# (CDR #5#) . #6#) (GO G190)
                                       G191 (EXIT NIL))
                                  (LETT |toSave|
                                        (SPADCALL |toSave| (QREFELT $ 110))
                                        . #6#)
                                  (EXIT
                                   (PROGN
                                    (LETT #4#
                                          (SPADCALL |toSave| (QREFELT $ 112))
                                          . #6#)
                                    (GO #4#)))))))
                              (LETT |ts_v|
                                    (PROG2
                                        (LETT #3#
                                              (SPADCALL |ts| |v|
                                                        (QREFELT $ 46))
                                              . #6#)
                                        (QCDR #3#)
                                      (|check_union| (QEQCAR #3# 0)
                                                     (QREFELT $ 9) #3#))
                                    . #6#)
                              (LETT |ts_v-| (SPADCALL |ts| |v| (QREFELT $ 47))
                                    . #6#)
                              (LETT |ts_v+| (SPADCALL |ts| |v| (QREFELT $ 97))
                                    . #6#)
                              (LETT |lgwt|
                                    (SPADCALL |ts_v| |q| |ts_v-| 'NIL 'NIL
                                              (QREFELT $ 49))
                                    . #6#)
                              (SEQ (LETT |gwt| NIL . #6#)
                                   (LETT #2# |lgwt| . #6#) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN
                                          (LETT |gwt| (CAR #2#) . #6#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ (LETT |g| (QCAR |gwt|) . #6#)
                                        (LETT |ts| (QCDR |gwt|) . #6#)
                                        (COND
                                         ((OR (SPADCALL |g| (QREFELT $ 50))
                                              (SPADCALL
                                               (SPADCALL |g| (QREFELT $ 40))
                                               |v| (QREFELT $ 71)))
                                          (EXIT
                                           (SEQ
                                            (LETT |lts|
                                                  (SPADCALL |ts_v| |ts|
                                                            (QREFELT $ 99))
                                                  . #6#)
                                            (LETT |lts|
                                                  (SPADCALL
                                                   (SPADCALL |ts_v+|
                                                             (QREFELT $ 100))
                                                   |lts| (QREFELT $ 101))
                                                  . #6#)
                                            (EXIT
                                             (LETT |toSave|
                                                   (SPADCALL |lts| |toSave|
                                                             (QREFELT $ 109))
                                                   . #6#))))))
                                        (LETT |g| (SPADCALL |g| (QREFELT $ 90))
                                              . #6#)
                                        (LETT |h|
                                              (SPADCALL |ts_v| |g|
                                                        (QREFELT $ 91))
                                              . #6#)
                                        (LETT |h| (SPADCALL |h| (QREFELT $ 90))
                                              . #6#)
                                        (COND
                                         ((OR (SPADCALL |h| (QREFELT $ 50))
                                              (SPADCALL
                                               (SPADCALL |h| (QREFELT $ 40))
                                               |v| (QREFELT $ 71)))
                                          (EXIT "leave")))
                                        (LETT |lts_h|
                                              (SPADCALL |h| |ts|
                                                        (QREFELT $ 99))
                                              . #6#)
                                        (LETT |lts_h|
                                              (SPADCALL
                                               (SPADCALL |ts_v+|
                                                         (QREFELT $ 100))
                                               |lts_h| (QREFELT $ 101))
                                              . #6#)
                                        (EXIT
                                         (SEQ (LETT |ts_h| NIL . #6#)
                                              (LETT #1# |lts_h| . #6#) G190
                                              (COND
                                               ((OR (ATOM #1#)
                                                    (PROGN
                                                     (LETT |ts_h| (CAR #1#)
                                                           . #6#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (LETT |inv|
                                                     (SPADCALL |q| |ts_h|
                                                               (QREFELT $ 115))
                                                     . #6#)
                                               (EXIT
                                                (LETT |toSave|
                                                      (SPADCALL
                                                       (SPADCALL |inv| |toSave|
                                                                 (QREFELT $
                                                                          109))
                                                       (QREFELT $ 110))
                                                      . #6#)))
                                              (LETT #1# (CDR #1#) . #6#)
                                              (GO G190) G191 (EXIT NIL))))
                                   (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                                   (EXIT NIL))
                              (LETT |toSave|
                                    (SPADCALL |toSave| (QREFELT $ 112)) . #6#)
                              (SPADCALL |k| |toSave| (QREFELT $ 113))
                              (EXIT |toSave|)))))))))))
      #4# (EXIT #4#))))) 

(DEFUN |SFRGCD;stoseInvertible?;PTSL;18| (|p| |ts| $)
  (SPADCALL |p| |ts| (QREFELT $ 94))) 

(DEFUN |SFRGCD;stoseInvertibleSet;PTSL;19| (|p| |ts| $)
  (SPADCALL |p| |ts| (QREFELT $ 108))) 

(DEFUN |SFRGCD;stoseInvertible?;PTSL;20| (|p| |ts| $)
  (SPADCALL |p| |ts| (QREFELT $ 114))) 

(DEFUN |SFRGCD;stoseInvertibleSet;PTSL;21| (|p| |ts| $)
  (SPADCALL |p| |ts| (QREFELT $ 115))) 

(DEFUN |SquareFreeRegularTriangularSetGcdPackage| (&REST #1=#:G448)
  (PROG ()
    (RETURN
     (PROG (#2=#:G449)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|SquareFreeRegularTriangularSetGcdPackage|)
                                           '|domainEqualList|)
                . #3=(|SquareFreeRegularTriangularSetGcdPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY
                   (|function| |SquareFreeRegularTriangularSetGcdPackage;|)
                   #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|SquareFreeRegularTriangularSetGcdPackage|))))))))))) 

(DEFUN |SquareFreeRegularTriangularSetGcdPackage;| (|#1| |#2| |#3| |#4| |#5|)
  (PROG (|pv$| $ |dv$| DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|SquareFreeRegularTriangularSetGcdPackage|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT DV$5 (|devaluate| |#5|) . #1#)
      (LETT |dv$|
            (LIST '|SquareFreeRegularTriangularSetGcdPackage| DV$1 DV$2 DV$3
                  DV$4 DV$5)
            . #1#)
      (LETT $ (GETREFV 117) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache|
                  '|SquareFreeRegularTriangularSetGcdPackage|
                  (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (QSETREFV $ 10 |#5|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#5|
                       (LIST '|SquareFreeRegularTriangularSetCategory|
                             (|devaluate| |#1|) (|devaluate| |#2|)
                             (|devaluate| |#3|) (|devaluate| |#4|)))
        (PROGN
         (QSETREFV $ 44
                   (CONS (|dispatchFunction| |SFRGCD;stoseInvertible?;PTSL;18|)
                         $))
         (QSETREFV $ 116
                   (CONS
                    (|dispatchFunction| |SFRGCD;stoseInvertibleSet;PTSL;19|)
                    $))))
       ('T
        (PROGN
         (QSETREFV $ 44
                   (CONS (|dispatchFunction| |SFRGCD;stoseInvertible?;PTSL;20|)
                         $))
         (QSETREFV $ 116
                   (CONS
                    (|dispatchFunction| |SFRGCD;stoseInvertibleSet;PTSL;21|)
                    $)))))
      $)))) 

(MAKEPROP '|SquareFreeRegularTriangularSetGcdPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|Void|)
              (|Record| (|:| |arg1| 9) (|:| |arg2| 9) (|:| |arg3| 10)
                        (|:| |arg4| 21))
              (|Record| (|:| |val| 9) (|:| |tower| 10))
              (|TabulatedComputationPackage| 12 48) (0 . |initTable!|)
              (|String|) (4 . |printInfo!|) (10 . |startStats!|) (15 . |void|)
              |SFRGCD;startTableGcd!;3SV;1| (|Boolean|) (19 . |makingStats?|)
              (23 . |printStats!|) (27 . |clearTable!|)
              |SFRGCD;stopTableGcd!;V;2|
              (|Record| (|:| |arg1| 9) (|:| |arg3| 10))
              (|TabulatedComputationPackage| 26 107) (31 . |initTable!|)
              (35 . |printInfo!|) (41 . |startStats!|)
              |SFRGCD;startTableInvSet!;3SV;3| (46 . |makingStats?|)
              (50 . |printStats!|) (54 . |clearTable!|)
              |SFRGCD;stopTableInvSet!;V;4| (58 . |initiallyReduce|)
              (64 . |primitivePart|) (69 . |zero?|) (74 . |normalized?|)
              (80 . |mvar|) (85 . |algebraic?|)
              (|Record| (|:| |val| 21) (|:| |tower| 10)) (|List| 42)
              (91 . |stoseInvertible?|) (|Union| 9 '"failed") (97 . |select|)
              (103 . |collectUnder|) (|List| 13)
              |SFRGCD;stoseInternalLastSubResultant;2PTS2BL;8|
              (109 . |ground?|) (114 . =) |SFRGCD;stoseInvertible?;PTSB;5|
              (|Integer|) (|List| 9) (120 . |elt|) (126 . |leadingCoefficient|)
              (|NonNegativeInteger|) (132 . |degree|) (138 . >) (144 . -)
              (149 . |prem|) (155 . |init|) (160 . |mdeg|) (165 . ^)
              (171 . |Zero|) (175 . |One|)
              (|Record| (|:| |val| 54) (|:| |tower| 10)) (|List| 67)
              |SFRGCD;stosePrepareSubResAlgo;2PTSL;6|
              (179 . |lastSubResultant|) (185 . <) (191 . |gcd|) (197 . *)
              (|Union| $ '"failed") (203 . |exquo|)
              |SFRGCD;stoseIntegralLastSubResultant;2PTSL;7|
              (|Union| 48 '#1="failed") (209 . |extractIfCan|) (214 . |empty?|)
              (219 . |insert!|) |SFRGCD;stoseInternalLastSubResultant;LVBL;9|
              (225 . |positive?|) (230 . |LazardQuotient2|)
              (238 . |next_subResultant2|) (246 . |initiallyReduced?|)
              (252 . |purelyTranscendental?|)
              |SFRGCD;stoseLastSubResultant;2PTSL;10| (258 . |One|) (262 . D)
              (268 . |mainPrimitivePart|) (273 . |lazyPquo|)
              (279 . |stronglyReduce|) |SFRGCD;stoseSquareFreePart;PTSL;13|
              |SFRGCD;stoseInvertible?_sqfreg;PTSL;14| (285 . |removeZero|)
              (291 . |concat|) (297 . |collectUpper|) (|List| $)
              (303 . |augment|) (309 . |members|) (314 . |augment|) (320 . <)
              (|Mapping| 21 42 42) (326 . |sort|) (|Union| 107 '#1#)
              (332 . |extractIfCan|) (|List| 10)
              |SFRGCD;stoseInvertibleSet_sqfreg;PTSL;15| (337 . |concat|)
              (343 . |removeDuplicates|)
              (|SquareFreeQuasiComponentPackage| 6 7 8 9 10)
              (348 . |algebraicSort|) (353 . |insert!|)
              |SFRGCD;stoseInvertible?_reg;PTSL;16|
              |SFRGCD;stoseInvertibleSet_reg;PTSL;17|
              (359 . |stoseInvertibleSet|))
           '#(|stoseSquareFreePart| 365 |stosePrepareSubResAlgo| 371
              |stoseLastSubResultant| 378 |stoseInvertibleSet_sqfreg| 385
              |stoseInvertibleSet_reg| 391 |stoseInvertibleSet| 397
              |stoseInvertible?_sqfreg| 403 |stoseInvertible?_reg| 409
              |stoseInvertible?| 415 |stoseInternalLastSubResultant| 427
              |stoseIntegralLastSubResultant| 443 |stopTableInvSet!| 450
              |stopTableGcd!| 454 |startTableInvSet!| 458 |startTableGcd!| 465)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 116
                                                 '(0 14 11 15 2 14 11 16 16 17
                                                   1 14 11 16 18 0 11 0 19 0 14
                                                   21 22 0 14 11 23 0 14 11 24
                                                   0 27 11 28 2 27 11 16 16 29
                                                   1 27 11 16 30 0 27 21 32 0
                                                   27 11 33 0 27 11 34 2 10 9 9
                                                   0 36 1 9 0 0 37 1 9 21 0 38
                                                   2 10 21 9 0 39 1 9 8 0 40 2
                                                   10 21 8 0 41 2 0 43 9 10 44
                                                   2 10 45 0 8 46 2 10 0 0 8 47
                                                   1 9 21 0 50 2 8 21 0 0 51 2
                                                   54 9 0 53 55 2 9 0 0 8 56 2
                                                   9 57 0 8 58 2 53 21 0 0 59 1
                                                   9 0 0 60 2 9 0 0 0 61 1 9 0
                                                   0 62 1 9 57 0 63 2 9 0 0 57
                                                   64 0 9 0 65 0 9 0 66 2 9 0 0
                                                   0 70 2 8 21 0 0 71 2 9 0 0 0
                                                   72 2 9 0 0 0 73 2 9 74 0 0
                                                   75 1 14 77 12 78 1 10 21 0
                                                   79 2 14 11 12 48 80 1 53 21
                                                   0 82 4 9 0 0 0 0 57 83 4 9 0
                                                   0 0 0 0 84 2 10 21 9 0 85 2
                                                   10 21 9 0 86 0 6 0 88 2 9 0
                                                   0 8 89 1 9 0 0 90 2 9 0 0 0
                                                   91 2 10 9 9 0 92 2 10 9 9 0
                                                   95 2 43 0 0 0 96 2 10 0 0 8
                                                   97 2 10 98 9 0 99 1 10 54 0
                                                   100 2 10 98 54 98 101 2 21
                                                   21 0 0 102 2 43 0 103 0 104
                                                   1 27 105 26 106 2 107 0 0 0
                                                   109 1 107 0 0 110 1 111 107
                                                   107 112 2 27 11 26 107 113 2
                                                   0 107 9 10 116 2 0 48 9 10
                                                   93 3 0 68 9 9 10 69 3 0 48 9
                                                   9 10 87 2 0 107 9 10 108 2 0
                                                   107 9 10 115 2 0 107 9 10
                                                   116 2 0 43 9 10 94 2 0 43 9
                                                   10 114 2 0 21 9 10 52 2 0 43
                                                   9 10 44 5 0 48 9 9 10 21 21
                                                   49 3 0 48 68 8 21 81 3 0 48
                                                   9 9 10 76 0 0 11 35 0 0 11
                                                   25 3 0 11 16 16 16 31 3 0 11
                                                   16 16 16 20)))))
           '|lookupComplete|)) 
