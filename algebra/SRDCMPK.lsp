
(/VERSIONCHECK 2) 

(DEFUN |SRDCMPK;KrullNumber;LLNni;1| (|lp| |lts| $)
  (PROG (|n| |ln| #1=#:G150 |ts| #2=#:G149)
    (RETURN
     (SEQ
      (LETT |ln|
            (PROGN
             (LETT #2# NIL . #3=(|SRDCMPK;KrullNumber;LLNni;1|))
             (SEQ (LETT |ts| NIL . #3#) (LETT #1# |lts| . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |ts| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2# (CONS (SPADCALL |ts| (QREFELT $ 12)) #2#)
                          . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT
       (LETT |n| (+ (LENGTH |lp|) (SPADCALL (ELT $ 13) |ln| (QREFELT $ 16)))
             . #3#)))))) 

(DEFUN |SRDCMPK;numberOfVariables;LLNni;2| (|lp| |lts| $)
  (PROG (|lv| #1=#:G154 |ts|)
    (RETURN
     (SEQ
      (LETT |lv| (SPADCALL (SPADCALL |lp| (QREFELT $ 21)) (QREFELT $ 23))
            . #2=(|SRDCMPK;numberOfVariables;LLNni;2|))
      (SEQ (LETT |ts| NIL . #2#) (LETT #1# |lts| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |ts| (CAR #1#) . #2#) NIL))
             (GO G191)))
           (SEQ
            (EXIT
             (LETT |lv|
                   (SPADCALL (SPADCALL |ts| (QREFELT $ 24)) |lv|
                             (QREFELT $ 25))
                   . #2#)))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT (LENGTH (SPADCALL |lv| (QREFELT $ 26)))))))) 

(DEFUN |SRDCMPK;algebraicDecompose;PTSR;3| (|p| |ts| $)
  (PROG (#1=#:G165 |lts| |llpwt| #2=#:G177 |vs| #3=#:G176 |f| |lsfp| |lus| |h|
         |us| |g| #4=#:G175 |gwt| |lgwt| |ts_v| #5=#:G157 |ts_v+| |ts_v-| |n|
         |v|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p| (QREFELT $ 29))
        (|error| " in algebraicDecompose$REGSET: should never happen !"))
       (#6='T
        (SEQ
         (LETT |v| (SPADCALL |p| (QREFELT $ 30))
               . #7=(|SRDCMPK;algebraicDecompose;PTSR;3|))
         (LETT |n| (SPADCALL |ts| (QREFELT $ 12)) . #7#)
         (LETT |ts_v-| (SPADCALL |ts| |v| (QREFELT $ 31)) . #7#)
         (LETT |ts_v+| (SPADCALL |ts| |v| (QREFELT $ 32)) . #7#)
         (LETT |ts_v|
               (PROG2 (LETT #5# (SPADCALL |ts| |v| (QREFELT $ 34)) . #7#)
                   (QCDR #5#)
                 (|check_union| (QEQCAR #5# 0) (QREFELT $ 9) #5#))
               . #7#)
         (COND
          ((< (SPADCALL |p| (QREFELT $ 35)) (SPADCALL |ts_v| (QREFELT $ 35)))
           (LETT |lgwt| (SPADCALL |ts_v| |p| |ts_v-| 'T 'NIL (QREFELT $ 39))
                 . #7#))
          (#6#
           (LETT |lgwt| (SPADCALL |p| |ts_v| |ts_v-| 'T 'NIL (QREFELT $ 39))
                 . #7#)))
         (LETT |lts| NIL . #7#) (LETT |llpwt| NIL . #7#)
         (SEQ (LETT |gwt| NIL . #7#) (LETT #4# |lgwt| . #7#) G190
              (COND
               ((OR (ATOM #4#) (PROGN (LETT |gwt| (CAR #4#) . #7#) NIL))
                (GO G191)))
              (SEQ (LETT |g| (QCAR |gwt|) . #7#) (LETT |us| (QCDR |gwt|) . #7#)
                   (EXIT
                    (COND
                     ((SPADCALL |g| (QREFELT $ 40))
                      (|error|
                       " in algebraicDecompose$REGSET: should never happen !!"))
                     ((SPADCALL |g| (QREFELT $ 29)) "leave")
                     ('T
                      (SEQ (LETT |h| (SPADCALL |g| |v| (QREFELT $ 41)) . #7#)
                           (LETT |lus|
                                 (SPADCALL (SPADCALL |ts_v+| (QREFELT $ 42))
                                           (SPADCALL |ts_v| |us|
                                                     (QREFELT $ 44))
                                           (QREFELT $ 45))
                                 . #7#)
                           (LETT |lsfp| (SPADCALL |h| (QREFELT $ 47)) . #7#)
                           (SEQ (LETT |f| NIL . #7#) (LETT #3# |lsfp| . #7#)
                                G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |f| (CAR #3#) . #7#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND ((SPADCALL |f| (QREFELT $ 29)) "leave")
                                        ('T
                                         (SEQ (LETT |vs| NIL . #7#)
                                              (LETT #2# |lus| . #7#) G190
                                              (COND
                                               ((OR (ATOM #2#)
                                                    (PROGN
                                                     (LETT |vs| (CAR #2#)
                                                           . #7#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT |llpwt|
                                                      (CONS
                                                       (CONS (LIST |f| |p|)
                                                             |vs|)
                                                       |llpwt|)
                                                      . #7#)))
                                              (LETT #2# (CDR #2#) . #7#)
                                              (GO G190) G191 (EXIT NIL))))))
                                (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT
                            (COND
                             ((< |n| (SPADCALL |us| (QREFELT $ 12)))
                              (|error|
                               " in algebraicDecompose$REGSET: should never happen !!!"))
                             ('T
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL (SPADCALL |g| (QREFELT $ 30)) |v|
                                            (QREFELT $ 48))
                                  (PROGN
                                   (LETT #1#
                                         (LETT |lts|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |ts_v+|
                                                           (QREFELT $ 42))
                                                 (SPADCALL |g| |us|
                                                           (QREFELT $ 44))
                                                 (QREFELT $ 45))
                                                |lts| (QREFELT $ 49))
                                               . #7#)
                                         . #7#)
                                   (GO #1#)))))
                               #1# (EXIT #1#))))))))))
              (LETT #4# (CDR #4#) . #7#) (GO G190) G191 (EXIT NIL))
         (EXIT (CONS |lts| |llpwt|))))))))) 

(DEFUN |SRDCMPK;transcendentalDecompose;PTSNniR;4| (|p| |ts| |bound| $)
  (PROG (|llpwt| |lts|)
    (RETURN
     (SEQ
      (COND
       ((< (SPADCALL |ts| (QREFELT $ 12)) |bound|)
        (LETT |lts| (SPADCALL |p| |ts| (QREFELT $ 44))
              . #1=(|SRDCMPK;transcendentalDecompose;PTSNniR;4|)))
       ('T (LETT |lts| NIL . #1#)))
      (LETT |llpwt| NIL . #1#) (EXIT (CONS |lts| |llpwt|)))))) 

(DEFUN |SRDCMPK;transcendentalDecompose;PTSR;5| (|p| |ts| $)
  (PROG (|llpwt| |lts|)
    (RETURN
     (SEQ
      (LETT |lts| (SPADCALL |p| |ts| (QREFELT $ 44))
            . #1=(|SRDCMPK;transcendentalDecompose;PTSR;5|))
      (LETT |llpwt| NIL . #1#) (EXIT (CONS |lts| |llpwt|)))))) 

(DEFUN |SRDCMPK;internalDecompose;PTSNniBR;6| (|p| |ts| |bound| |clos?| $)
  (COND (|clos?| (SPADCALL |p| |ts| |bound| (QREFELT $ 55)))
        ('T (SPADCALL |p| |ts| (QREFELT $ 56))))) 

(DEFUN |SRDCMPK;internalDecompose;PTSNniR;7| (|p| |ts| |bound| $)
  (PROG (|llpwt| |lts| |riv| |rsl| #1=#:G210 |bwt| |lbwt| |tp| |ip| #2=#:G192
         |lmp|)
    (RETURN
     (SEQ (LETT |llpwt| NIL . #3=(|SRDCMPK;internalDecompose;PTSNniR;7|))
          (LETT |lts| NIL . #3#)
          (COND
           ((NULL (SPADCALL (SPADCALL |p| (QREFELT $ 58)) (QREFELT $ 40)))
            (COND
             ((NULL
               (SPADCALL (LETT |lmp| (SPADCALL |p| (QREFELT $ 59)) . #3#)
                         (QREFELT $ 29)))
              (SEQ
               (LETT |llpwt|
                     (CONS
                      (CONS
                       (LIST
                        (SPADCALL (SPADCALL |p| (QREFELT $ 30))
                                  (QREFELT $ 60)))
                       |ts|)
                      |llpwt|)
                     . #3#)
               (EXIT
                (LETT |p|
                      (PROG2
                          (LETT #2# (SPADCALL |p| |lmp| (QREFELT $ 62)) . #3#)
                          (QCDR #2#)
                        (|check_union| (QEQCAR #2# 0) (QREFELT $ 9) #2#))
                      . #3#)))))))
          (LETT |ip| (SPADCALL (SPADCALL |p| (QREFELT $ 63)) (QREFELT $ 64))
                . #3#)
          (LETT |tp| (SPADCALL |p| (QREFELT $ 58)) . #3#)
          (LETT |p| (SPADCALL |p| (QREFELT $ 65)) . #3#)
          (LETT |lbwt| (SPADCALL |ip| |ts| (QREFELT $ 68)) . #3#)
          (SEQ (LETT |bwt| NIL . #3#) (LETT #1# |lbwt| . #3#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |bwt| (CAR #1#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((QCAR |bwt|)
                   (SEQ
                    (COND
                     ((SPADCALL (SPADCALL |p| (QREFELT $ 30)) (QCDR |bwt|)
                                (QREFELT $ 69))
                      (LETT |rsl| (SPADCALL |p| (QCDR |bwt|) (QREFELT $ 52))
                            . #3#))
                     ('T
                      (LETT |rsl|
                            (SPADCALL |p| (QCDR |bwt|) |bound| (QREFELT $ 53))
                            . #3#)))
                    (LETT |lts| (SPADCALL (QCAR |rsl|) |lts| (QREFELT $ 49))
                          . #3#)
                    (LETT |llpwt|
                          (SPADCALL (QCDR |rsl|) |llpwt| (QREFELT $ 71)) . #3#)
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |ip| (QREFELT $ 29)))
                       (COND
                        ((SPADCALL |tp| (QREFELT $ 40))
                         (LETT |llpwt|
                               (CONS (CONS (LIST |ip|) (QCDR |bwt|)) |llpwt|)
                               . #3#))
                        ((NULL (SPADCALL |tp| (QREFELT $ 29)))
                         (LETT |llpwt|
                               (CONS (CONS (LIST |ip| |tp|) (QCDR |bwt|))
                                     |llpwt|)
                               . #3#))))))))
                  ('T
                   (SEQ
                    (LETT |riv| (SPADCALL |ip| (QCDR |bwt|) (QREFELT $ 72))
                          . #3#)
                    (EXIT
                     (COND
                      ((SPADCALL |riv| (QREFELT $ 40))
                       (COND
                        ((SPADCALL |tp| (QREFELT $ 40))
                         (LETT |lts| (CONS (QCDR |bwt|) |lts|) . #3#))
                        ((NULL (SPADCALL |tp| (QREFELT $ 29)))
                         (LETT |llpwt|
                               (CONS (CONS (LIST |tp|) (QCDR |bwt|)) |llpwt|)
                               . #3#))))
                      ('T
                       (LETT |llpwt|
                             (CONS
                              (CONS
                               (LIST
                                (SPADCALL
                                 (SPADCALL |riv| (SPADCALL |p| (QREFELT $ 73))
                                           (QREFELT $ 74))
                                 |tp| (QREFELT $ 75)))
                               (QCDR |bwt|))
                              |llpwt|)
                             . #3#)))))))))
               (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |lts| |llpwt|)))))) 

(DEFUN |SRDCMPK;internalDecompose;PTSR;8| (|p| |ts| $)
  (PROG (|llpwt| |lts| |riv| |rsl| #1=#:G231 |bwt| |lbwt| |tp| |ip| #2=#:G214
         |lmp|)
    (RETURN
     (SEQ (LETT |llpwt| NIL . #3=(|SRDCMPK;internalDecompose;PTSR;8|))
          (LETT |lts| NIL . #3#)
          (COND
           ((NULL (SPADCALL (SPADCALL |p| (QREFELT $ 58)) (QREFELT $ 40)))
            (COND
             ((NULL
               (SPADCALL (LETT |lmp| (SPADCALL |p| (QREFELT $ 59)) . #3#)
                         (QREFELT $ 29)))
              (SEQ
               (LETT |llpwt|
                     (CONS
                      (CONS
                       (LIST
                        (SPADCALL (SPADCALL |p| (QREFELT $ 30))
                                  (QREFELT $ 60)))
                       |ts|)
                      |llpwt|)
                     . #3#)
               (EXIT
                (LETT |p|
                      (PROG2
                          (LETT #2# (SPADCALL |p| |lmp| (QREFELT $ 62)) . #3#)
                          (QCDR #2#)
                        (|check_union| (QEQCAR #2# 0) (QREFELT $ 9) #2#))
                      . #3#)))))))
          (LETT |ip| (SPADCALL (SPADCALL |p| (QREFELT $ 63)) (QREFELT $ 64))
                . #3#)
          (LETT |tp| (SPADCALL |p| (QREFELT $ 58)) . #3#)
          (LETT |p| (SPADCALL |p| (QREFELT $ 65)) . #3#)
          (LETT |lbwt| (SPADCALL |ip| |ts| (QREFELT $ 68)) . #3#)
          (SEQ (LETT |bwt| NIL . #3#) (LETT #1# |lbwt| . #3#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |bwt| (CAR #1#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((QCAR |bwt|)
                   (SEQ
                    (COND
                     ((SPADCALL (SPADCALL |p| (QREFELT $ 30)) (QCDR |bwt|)
                                (QREFELT $ 69))
                      (LETT |rsl| (SPADCALL |p| (QCDR |bwt|) (QREFELT $ 52))
                            . #3#))
                     ('T
                      (LETT |rsl| (SPADCALL |p| (QCDR |bwt|) (QREFELT $ 54))
                            . #3#)))
                    (LETT |lts| (SPADCALL (QCAR |rsl|) |lts| (QREFELT $ 49))
                          . #3#)
                    (LETT |llpwt|
                          (SPADCALL (QCDR |rsl|) |llpwt| (QREFELT $ 71)) . #3#)
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |ip| (QREFELT $ 29)))
                       (COND
                        ((SPADCALL |tp| (QREFELT $ 40))
                         (LETT |llpwt|
                               (CONS (CONS (LIST |ip|) (QCDR |bwt|)) |llpwt|)
                               . #3#))
                        ((NULL (SPADCALL |tp| (QREFELT $ 29)))
                         (LETT |llpwt|
                               (CONS (CONS (LIST |ip| |tp|) (QCDR |bwt|))
                                     |llpwt|)
                               . #3#))))))))
                  ('T
                   (SEQ
                    (LETT |riv| (SPADCALL |ip| (QCDR |bwt|) (QREFELT $ 72))
                          . #3#)
                    (EXIT
                     (COND
                      ((SPADCALL |riv| (QREFELT $ 40))
                       (COND
                        ((SPADCALL |tp| (QREFELT $ 40))
                         (LETT |lts| (CONS (QCDR |bwt|) |lts|) . #3#))
                        ((NULL (SPADCALL |tp| (QREFELT $ 29)))
                         (LETT |llpwt|
                               (CONS (CONS (LIST |tp|) (QCDR |bwt|)) |llpwt|)
                               . #3#))))
                      ('T
                       (LETT |llpwt|
                             (CONS
                              (CONS
                               (LIST
                                (SPADCALL
                                 (SPADCALL |riv| (SPADCALL |p| (QREFELT $ 73))
                                           (QREFELT $ 74))
                                 |tp| (QREFELT $ 75)))
                               (QCDR |bwt|))
                              |llpwt|)
                             . #3#)))))))))
               (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |lts| |llpwt|)))))) 

(DEFUN |SRDCMPK;decompose;LL2BL;9| (|lp| |lts| |clos?| |info?| $)
  (SPADCALL |lp| |lts| 'NIL 'NIL |clos?| 'T |info?| (QREFELT $ 76))) 

(DEFUN |SRDCMPK;convert;RS;10| (|lpwt| $)
  (PROG (|ls|)
    (RETURN
     (SEQ
      (LETT |ls|
            (LIST "<" (STRINGIMAGE (LENGTH (QCAR |lpwt|))) ","
                  (STRINGIMAGE (SPADCALL (QCDR |lpwt|) (QREFELT $ 12))) ">")
            |SRDCMPK;convert;RS;10|)
      (EXIT (SPADCALL |ls| (QREFELT $ 79))))))) 

(DEFUN |SRDCMPK;printInfo;LNniV;11| (|toSee| |n| $)
  (PROG (|s| |m| #1=#:G242 |lpwt|)
    (RETURN
     (SEQ
      (LETT |lpwt| (|SPADfirst| |toSee|) . #2=(|SRDCMPK;printInfo;LNniV;11|))
      (LETT |s|
            (SPADCALL
             (LIST "[" (STRINGIMAGE (LENGTH |toSee|)) " "
                   (SPADCALL |lpwt| (QREFELT $ 80)))
             (QREFELT $ 79))
            . #2#)
      (LETT |m| (LENGTH (QCAR |lpwt|)) . #2#)
      (LETT |toSee| (CDR |toSee|) . #2#)
      (SEQ (LETT |lpwt| NIL . #2#) (LETT #1# |toSee| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |lpwt| (CAR #1#) . #2#) NIL))
             (GO G191)))
           (SEQ (LETT |m| (+ |m| (LENGTH (QCAR |lpwt|))) . #2#)
                (EXIT
                 (LETT |s|
                       (SPADCALL
                        (LIST |s| "," (SPADCALL |lpwt| (QREFELT $ 80)))
                        (QREFELT $ 79))
                       . #2#)))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (LETT |s|
            (SPADCALL
             (LIST |s| " -> |" (STRINGIMAGE |m|) "|; {" (STRINGIMAGE |n|) "}]")
             (QREFELT $ 79))
            . #2#)
      (SPADCALL |s| (QREFELT $ 83)) (EXIT (SPADCALL (QREFELT $ 84))))))) 

(DEFUN |SRDCMPK;decompose;LL5BL;12|
       (|lp| |lts| |cleanW?| |sqfr?| |clos?| |rem?| |info?| $)
  (PROG (|toSee| |rsl| |p| |toSave| |ts| |lpwt| |bound| #1=#:G261 |br|
         #2=#:G260 |branches|)
    (RETURN
     (SEQ
      (COND ((NULL |lp|) |lts|)
            (#3='T
             (SEQ
              (LETT |branches|
                    (SPADCALL |lp| |lts| |cleanW?| |sqfr?| (QREFELT $ 89))
                    . #4=(|SRDCMPK;decompose;LL5BL;12|))
              (EXIT
               (COND ((NULL |branches|) NIL)
                     (#3#
                      (SEQ
                       (LETT |toSee|
                             (PROGN
                              (LETT #2# NIL . #4#)
                              (SEQ (LETT |br| NIL . #4#)
                                   (LETT #1# |branches| . #4#) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |br| (CAR #1#) . #4#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS
                                            (CONS (QVELT |br| 0)
                                                  (QVELT |br| 1))
                                            #2#)
                                           . #4#)))
                                   (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))
                             . #4#)
                       (LETT |toSave| NIL . #4#)
                       (COND
                        (|clos?|
                         (LETT |bound| (SPADCALL |lp| |lts| (QREFELT $ 19))
                               . #4#))
                        (#3#
                         (LETT |bound| (SPADCALL |lp| |lts| (QREFELT $ 27))
                               . #4#)))
                       (SEQ G190
                            (COND
                             ((NULL (COND ((NULL |toSee|) 'NIL) ('T 'T)))
                              (GO G191)))
                            (SEQ
                             (COND
                              (|info?|
                               (SPADCALL |toSee| (LENGTH |toSave|)
                                         (QREFELT $ 85))))
                             (LETT |lpwt| (|SPADfirst| |toSee|) . #4#)
                             (LETT |toSee| (CDR |toSee|) . #4#)
                             (LETT |lp| (QCAR |lpwt|) . #4#)
                             (LETT |ts| (QCDR |lpwt|) . #4#)
                             (EXIT
                              (COND
                               ((NULL |lp|)
                                (LETT |toSave| (CONS |ts| |toSave|) . #4#))
                               ('T
                                (SEQ (LETT |p| (|SPADfirst| |lp|) . #4#)
                                     (LETT |lp| (CDR |lp|) . #4#)
                                     (COND
                                      (|rem?|
                                       (COND
                                        ((NULL (SPADCALL |p| (QREFELT $ 29)))
                                         (COND
                                          ((NULL
                                            (SPADCALL |ts| (QREFELT $ 90)))
                                           (LETT |p|
                                                 (QVELT
                                                  (SPADCALL |p| |ts|
                                                            (QREFELT $ 92))
                                                  1)
                                                 . #4#)))))))
                                     (LETT |p|
                                           (SPADCALL |p| |ts| (QREFELT $ 72))
                                           . #4#)
                                     (EXIT
                                      (COND
                                       ((SPADCALL |p| (QREFELT $ 40))
                                        (LETT |toSee|
                                              (CONS (CONS |lp| |ts|) |toSee|)
                                              . #4#))
                                       ((SPADCALL |p| (QREFELT $ 29)) "leave")
                                       ('T
                                        (SEQ
                                         (LETT |rsl|
                                               (SPADCALL |p| |ts| |bound|
                                                         |clos?|
                                                         (QREFELT $ 57))
                                               . #4#)
                                         (EXIT
                                          (LETT |toSee|
                                                (SPADCALL |lp| |toSave| |toSee|
                                                          |rsl| |bound|
                                                          (QREFELT $ 93))
                                                . #4#)))))))))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT (SPADCALL |toSave| (QREFELT $ 94)))))))))))))) 

(DEFUN |SRDCMPK;upDateBranches;LLLRNniL;13| (|leq| |lts| |current| |wip| |n| $)
  (PROG (|branches| |branches2| #1=#:G281 |us| |branches1| |newleq| #2=#:G280
         |branch| |newComponents| |newBranches|)
    (RETURN
     (SEQ
      (LETT |newBranches| (QCDR |wip|)
            . #3=(|SRDCMPK;upDateBranches;LLLRNniL;13|))
      (LETT |newComponents| (QCAR |wip|) . #3#) (LETT |branches1| NIL . #3#)
      (LETT |branches2| NIL . #3#)
      (SEQ (LETT |branch| NIL . #3#) (LETT #2# |newBranches| . #3#) G190
           (COND
            ((OR (ATOM #2#) (PROGN (LETT |branch| (CAR #2#) . #3#) NIL))
             (GO G191)))
           (SEQ (LETT |us| (QCDR |branch|) . #3#)
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |us| (QREFELT $ 12)) |n| (QREFELT $ 95))
                   "leave")
                  ('T
                   (SEQ
                    (LETT |newleq|
                          (SPADCALL (ELT $ 97)
                                    (SPADCALL |leq| (QCAR |branch|)
                                              (QREFELT $ 98))
                                    (QREFELT $ 100))
                          . #3#)
                    (EXIT
                     (LETT |branches1| (CONS (CONS |newleq| |us|) |branches1|)
                           . #3#)))))))
           (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
      (SEQ (LETT |us| NIL . #3#) (LETT #1# |newComponents| . #3#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |us| (CAR #1#) . #3#) NIL))
             (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((OR (SPADCALL (SPADCALL |us| (QREFELT $ 12)) |n| (QREFELT $ 95))
                   (SPADCALL |us| |lts| (QREFELT $ 101)))
               "leave")
              ('T
               (LETT |branches2| (CONS (CONS |leq| |us|) |branches2|)
                     . #3#)))))
           (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (COND
        ((NULL |branches1|)
         (COND ((NULL |branches2|) |current|)
               (#4='T (SPADCALL |branches2| |current| (QREFELT $ 71)))))
        (#4#
         (SEQ
          (LETT |branches|
                (SPADCALL (LIST |branches2| |branches1| |current|)
                          (QREFELT $ 102))
                . #3#)
          (EXIT (SPADCALL |branches| (QREFELT $ 103))))))))))) 

(DECLAIM (NOTINLINE |SquareFreeRegularSetDecompositionPackage;|)) 

(DEFUN |SquareFreeRegularSetDecompositionPackage| (&REST #1=#:G282)
  (PROG ()
    (RETURN
     (PROG (#2=#:G283)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|SquareFreeRegularSetDecompositionPackage|)
                                           '|domainEqualList|)
                . #3=(|SquareFreeRegularSetDecompositionPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY
                   (|function| |SquareFreeRegularSetDecompositionPackage;|)
                   #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|SquareFreeRegularSetDecompositionPackage|))))))))))) 

(DEFUN |SquareFreeRegularSetDecompositionPackage;| (|#1| |#2| |#3| |#4| |#5|)
  (PROG (|pv$| $ |dv$| DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|SquareFreeRegularSetDecompositionPackage|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT DV$5 (|devaluate| |#5|) . #1#)
      (LETT |dv$|
            (LIST '|SquareFreeRegularSetDecompositionPackage| DV$1 DV$2 DV$3
                  DV$4 DV$5)
            . #1#)
      (LETT $ (GETREFV 104) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache|
                  '|SquareFreeRegularSetDecompositionPackage|
                  (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (QSETREFV $ 10 |#5|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|SquareFreeRegularSetDecompositionPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|)
              (|NonNegativeInteger|) (0 . |#|) (5 . |max|) (|Mapping| 11 11 11)
              (|List| 11) (11 . |reduce|) (|List| 9) (|List| 10)
              |SRDCMPK;KrullNumber;LLNni;1| (|GeneralPolynomialSet| 6 7 8 9)
              (17 . |construct|) (|List| 8) (22 . |variables|)
              (27 . |variables|) (32 . |concat|) (38 . |removeDuplicates|)
              |SRDCMPK;numberOfVariables;LLNni;2| (|Boolean|) (43 . |ground?|)
              (48 . |mvar|) (53 . |collectUnder|) (59 . |collectUpper|)
              (|Union| 9 '"failed") (65 . |select|) (71 . |mdeg|)
              (|Record| (|:| |val| 9) (|:| |tower| 10)) (|List| 36)
              (|SquareFreeRegularTriangularSetGcdPackage| 6 7 8 9 10)
              (76 . |stoseInternalLastSubResultant|) (85 . |zero?|)
              (90 . |leadingCoefficient|) (96 . |members|) (|List| $)
              (101 . |augment|) (107 . |augment|)
              (|PolynomialSetUtilitiesPackage| 6 7 8 9)
              (113 . |squareFreeFactors|) (118 . =) (124 . |concat|)
              (|Record| (|:| |val| 17) (|:| |tower| 10))
              (|Record| (|:| |done| 18) (|:| |todo| 70))
              |SRDCMPK;algebraicDecompose;PTSR;3|
              |SRDCMPK;transcendentalDecompose;PTSNniR;4|
              |SRDCMPK;transcendentalDecompose;PTSR;5|
              |SRDCMPK;internalDecompose;PTSNniR;7|
              |SRDCMPK;internalDecompose;PTSR;8|
              |SRDCMPK;internalDecompose;PTSNniBR;6| (130 . |tail|)
              (135 . |leastMonomial|) (140 . |coerce|) (|Union| $ '"failed")
              (145 . |exquo|) (151 . |init|) (156 . |squareFreePart|)
              (161 . |mainPrimitivePart|)
              (|Record| (|:| |val| 28) (|:| |tower| 10)) (|List| 66)
              (166 . |stoseInvertible?_sqfreg|) (172 . |algebraic?|)
              (|List| 50) (178 . |concat|) (184 . |removeZero|)
              (190 . |mainMonomial|) (195 . *) (201 . +)
              |SRDCMPK;decompose;LL5BL;12| |SRDCMPK;decompose;LL2BL;9|
              (|String|) (207 . |concat|) |SRDCMPK;convert;RS;10| (|Void|)
              (|InternalPrintPackage|) (212 . |iprint|) (217 . |void|)
              |SRDCMPK;printInfo;LNniV;11|
              (|Record| (|:| |eq| 17) (|:| |tower| 10) (|:| |ineq| 17))
              (|List| 86) (|SquareFreeQuasiComponentPackage| 6 7 8 9 10)
              (221 . |prepareDecompose|) (229 . |empty?|)
              (|Record| (|:| |rnum| 6) (|:| |polnum| 9) (|:| |den| 6))
              (234 . |remainder|) |SRDCMPK;upDateBranches;LLLRNniL;13|
              (240 . |removeSuperfluousQuasiComponents|) (245 . >)
              (251 . |infRittWu?|) (257 . |infRittWu?|) (263 . |concat|)
              (|Mapping| 28 9 9) (269 . |sort|) (275 . |subQuasiComponent?|)
              (281 . |concat|) (286 . |removeSuperfluousCases|))
           '#(|upDateBranches| 291 |transcendentalDecompose| 300 |printInfo|
              313 |numberOfVariables| 319 |internalDecompose| 325 |decompose|
              346 |convert| 365 |algebraicDecompose| 370 |KrullNumber| 376)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 103
                                                 '(1 10 11 0 12 2 11 0 0 0 13 2
                                                   15 11 14 0 16 1 20 0 17 21 1
                                                   20 22 0 23 1 10 22 0 24 2 22
                                                   0 0 0 25 1 22 0 0 26 1 9 28
                                                   0 29 1 9 8 0 30 2 10 0 0 8
                                                   31 2 10 0 0 8 32 2 10 33 0 8
                                                   34 1 9 11 0 35 5 38 37 9 9
                                                   10 28 28 39 1 9 28 0 40 2 9
                                                   0 0 8 41 1 10 17 0 42 2 10
                                                   43 9 0 44 2 10 43 17 43 45 1
                                                   46 17 9 47 2 8 28 0 0 48 2
                                                   18 0 0 0 49 1 9 0 0 58 1 9 0
                                                   0 59 1 9 0 8 60 2 9 61 0 0
                                                   62 1 9 0 0 63 1 9 0 0 64 1 9
                                                   0 0 65 2 38 67 9 10 68 2 10
                                                   28 8 0 69 2 70 0 0 0 71 2 10
                                                   9 9 0 72 1 9 0 0 73 2 9 0 0
                                                   0 74 2 9 0 0 0 75 1 78 0 43
                                                   79 1 82 81 78 83 0 81 0 84 4
                                                   88 87 17 18 28 28 89 1 10 28
                                                   0 90 2 10 91 9 0 92 1 88 18
                                                   18 94 2 11 28 0 0 95 2 10 28
                                                   0 0 96 2 9 28 0 0 97 2 17 0
                                                   0 0 98 2 17 0 99 0 100 2 88
                                                   28 10 18 101 1 70 0 43 102 1
                                                   88 70 70 103 5 0 70 17 18 70
                                                   51 11 93 3 0 51 9 10 11 53 2
                                                   0 51 9 10 54 2 0 81 70 11 85
                                                   2 0 11 17 18 27 4 0 51 9 10
                                                   11 28 57 3 0 51 9 10 11 55 2
                                                   0 51 9 10 56 4 0 18 17 18 28
                                                   28 77 7 0 18 17 18 28 28 28
                                                   28 28 76 1 0 78 50 80 2 0 51
                                                   9 10 52 2 0 11 17 18 19)))))
           '|lookupComplete|)) 
