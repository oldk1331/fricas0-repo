
(/VERSIONCHECK 2) 

(DEFUN |SYMANA;ansatz;Jvf;1| ($)
  (PROG (|res| #1=#:G153 |f| |s| #2=#:G159 |i| #3=#:G149 #4=#:G158)
    (RETURN
     (SEQ (LETT |res| (|spadConstant| $ 35) . #5=(|SYMANA;ansatz;Jvf;1|))
          (SEQ (LETT |i| 1 . #5#) (LETT #4# (QREFELT $ 11) . #5#) G190
               (COND ((|greater_SI| |i| #4#) (GO G191)))
               (SEQ
                (LETT |s| (SPADCALL (QREFELT $ 22) |i| (QREFELT $ 38)) . #5#)
                (LETT |f| (SPADCALL |s| (QREFELT $ 33) 0 (QREFELT $ 40)) . #5#)
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL |f|
                                           (SPADCALL
                                            (PROG1 (LETT #3# |i| . #5#)
                                              (|check_subtype| (> #3# 0)
                                                               '(|PositiveInteger|)
                                                               #3#))
                                            (QREFELT $ 41))
                                           (QREFELT $ 42))
                                 (QREFELT $ 43))
                       . #5#)))
               (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |i| 1 . #5#) (LETT #2# (QREFELT $ 13) . #5#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (LETT |s|
                      (SPADCALL (QREFELT $ 22) (+ (QREFELT $ 11) |i|)
                                (QREFELT $ 38))
                      . #5#)
                (LETT |f| (SPADCALL |s| (QREFELT $ 33) 0 (QREFELT $ 40)) . #5#)
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL |f|
                                           (SPADCALL
                                            (PROG1 (LETT #1# |i| . #5#)
                                              (|check_subtype| (> #1# 0)
                                                               '(|PositiveInteger|)
                                                               #1#))
                                            (QREFELT $ 44))
                                           (QREFELT $ 42))
                                 (QREFELT $ 43))
                       . #5#)))
               (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |SYMANA;transform;JbeJbe;2| (|f| $)
  (PROG (|g| |SubL| JV |lower| #1=#:G188 |id| #2=#:G203 |d| |up| #3=#:G186
         #4=#:G184 |diff| |rarg| |arg| |i| |num| |pos| |fname| #5=#:G175
         #6=#:G170 #7=#:G168 |ind| |typ| #8=#:G162 #9=#:G201 |Ke| #10=#:G202
         |Op| |LOps| #11=#:G200 #12=#:G199 |LKernels|)
    (RETURN
     (SEQ (LETT JV NIL . #13=(|SYMANA;transform;JbeJbe;2|))
          (LETT |SubL| NIL . #13#)
          (LETT |LKernels| (SPADCALL |f| (QREFELT $ 47)) . #13#)
          (LETT |LOps|
                (PROGN
                 (LETT #12# NIL . #13#)
                 (SEQ (LETT |Ke| NIL . #13#) (LETT #11# |LKernels| . #13#) G190
                      (COND
                       ((OR (ATOM #11#)
                            (PROGN (LETT |Ke| (CAR #11#) . #13#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #12# (CONS (SPADCALL |Ke| (QREFELT $ 50)) #12#)
                              . #13#)))
                      (LETT #11# (CDR #11#) . #13#) (GO G190) G191
                      (EXIT (NREVERSE #12#))))
                . #13#)
          (SEQ (LETT |Op| NIL . #13#) (LETT #10# |LOps| . #13#)
               (LETT |Ke| NIL . #13#) (LETT #9# |LKernels| . #13#) G190
               (COND
                ((OR (ATOM #9#) (PROGN (LETT |Ke| (CAR #9#) . #13#) NIL)
                     (ATOM #10#) (PROGN (LETT |Op| (CAR #10#) . #13#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |Op| '|%jet| (QREFELT $ 51))
                   (SEQ
                    (LETT |typ|
                          (PROG2
                              (LETT #8# (SPADCALL |Op| '|%jet| (QREFELT $ 53))
                                    . #13#)
                              (QCDR #8#)
                            (|check_union| (QEQCAR #8# 0) (|None|) #8#))
                          . #13#)
                    (EXIT
                     (COND
                      ((EQUAL |typ| '|Deriv|)
                       (|error|
                        "function contains illegal jet variables in transform"))
                      ('T
                       (SEQ
                        (LETT |ind|
                              (SPADCALL
                               (SPADCALL (SPADCALL |Ke| (QREFELT $ 55))
                                         (QREFELT $ 56))
                               (QREFELT $ 57))
                              . #13#)
                        (LETT JV
                              (CONS
                               (SPADCALL
                                (SPADCALL
                                 (PROG1 (LETT #7# |ind| . #13#)
                                   (|check_subtype| (> #7# 0)
                                                    '(|PositiveInteger|) #7#))
                                 (QREFELT $ 59))
                                (QREFELT $ 61))
                               JV)
                              . #13#)
                        (EXIT
                         (COND
                          ((SPADCALL |ind| (QREFELT $ 11) (QREFELT $ 62))
                           (LETT |SubL|
                                 (CONS
                                  (|SPADfirst|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (PROG1
                                          (LETT #6# (- |ind| (QREFELT $ 11))
                                                . #13#)
                                        (|check_subtype| (> #6# 0)
                                                         '(|PositiveInteger|)
                                                         #6#))
                                      (QREFELT $ 15))
                                     (QREFELT $ 63))
                                    (QREFELT $ 64)))
                                  |SubL|)
                                 . #13#))
                          ('T
                           (LETT |SubL|
                                 (CONS
                                  (|SPADfirst|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (PROG1 (LETT #5# |ind| . #13#)
                                        (|check_subtype| (> #5# 0)
                                                         '(|PositiveInteger|)
                                                         #5#))
                                      (QREFELT $ 14))
                                     (QREFELT $ 63))
                                    (QREFELT $ 64)))
                                  |SubL|)
                                 . #13#))))))))))
                  ('T
                   (SEQ (LETT |fname| (SPADCALL |Op| (QREFELT $ 65)) . #13#)
                        (LETT |pos|
                              (SPADCALL |fname| (QREFELT $ 22) (QREFELT $ 66))
                              . #13#)
                        (EXIT
                         (COND
                          ((>= |pos| (SPADCALL (QREFELT $ 22) (QREFELT $ 67)))
                           (SEQ
                            (LETT |arg| (SPADCALL |Ke| (QREFELT $ 55)) . #13#)
                            (EXIT
                             (COND
                              ((SPADCALL (LENGTH |arg|) 3 (QREFELT $ 68))
                               (SEQ (LETT |arg| (CDR |arg|) . #13#)
                                    (LETT |num|
                                          (SPADCALL (|SPADfirst| |arg|)
                                                    (QREFELT $ 57))
                                          . #13#)
                                    (LETT |arg| (CDR (CDR |arg|)) . #13#)
                                    (LETT |rarg| NIL . #13#)
                                    (SEQ (LETT |i| 1 . #13#) G190
                                         (COND
                                          ((|greater_SI| |i| |num|) (GO G191)))
                                         (SEQ
                                          (LETT |rarg|
                                                (CONS (|SPADfirst| |arg|)
                                                      |rarg|)
                                                . #13#)
                                          (EXIT
                                           (LETT |arg| (CDR |arg|) . #13#)))
                                         (LETT |i| (|inc_SI| |i|) . #13#)
                                         (GO G190) G191 (EXIT NIL))
                                    (LETT |rarg| (NREVERSE |rarg|) . #13#)
                                    (LETT |diff| |arg| . #13#)
                                    (EXIT
                                     (COND
                                      ((NULL |diff|)
                                       (SEQ
                                        (LETT JV
                                              (CONS
                                               (SPADCALL
                                                (SPADCALL
                                                 (PROG1 (LETT #4# |pos| . #13#)
                                                   (|check_subtype| (> #4# 0)
                                                                    '(|PositiveInteger|)
                                                                    #4#))
                                                 (QREFELT $ 70))
                                                (QREFELT $ 61))
                                               JV)
                                              . #13#)
                                        (EXIT
                                         (LETT |SubL|
                                               (CONS
                                                (|SPADfirst|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |Ke|
                                                             (QREFELT $ 72))
                                                   (QREFELT $ 73))
                                                  (QREFELT $ 64)))
                                                |SubL|)
                                               . #13#))))
                                      ('T
                                       (SEQ
                                        (LETT |up|
                                              (PROG1 (LETT #3# |pos| . #13#)
                                                (|check_subtype| (> #3# 0)
                                                                 '(|PositiveInteger|)
                                                                 #3#))
                                              . #13#)
                                        (LETT |lower| NIL . #13#)
                                        (SEQ (LETT |d| NIL . #13#)
                                             (LETT #2# |diff| . #13#) G190
                                             (COND
                                              ((OR (ATOM #2#)
                                                   (PROGN
                                                    (LETT |d| (CAR #2#) . #13#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (LETT |id|
                                                    (SPADCALL |d|
                                                              (QREFELT $ 57))
                                                    . #13#)
                                              (EXIT
                                               (LETT |lower|
                                                     (CONS
                                                      (PROG1
                                                          (LETT #1# |id|
                                                                . #13#)
                                                        (|check_subtype|
                                                         (> #1# 0)
                                                         '(|PositiveInteger|)
                                                         #1#))
                                                      |lower|)
                                                     . #13#)))
                                             (LETT #2# (CDR #2#) . #13#)
                                             (GO G190) G191 (EXIT NIL))
                                        (LETT |lower| (NREVERSE |lower|)
                                              . #13#)
                                        (LETT JV
                                              (CONS
                                               (SPADCALL
                                                (SPADCALL |up| |lower|
                                                          (QREFELT $ 75))
                                                (QREFELT $ 61))
                                               JV)
                                              . #13#)
                                        (EXIT
                                         (LETT |SubL|
                                               (CONS
                                                (|SPADfirst|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |Ke|
                                                             (QREFELT $ 72))
                                                   (QREFELT $ 73))
                                                  (QREFELT $ 64)))
                                                |SubL|)
                                               . #13#)))))))))))))))))))
               (LETT #9# (PROG1 (CDR #9#) (LETT #10# (CDR #10#) . #13#))
                     . #13#)
               (GO G190) G191 (EXIT NIL))
          (LETT |g|
                (SPADCALL (SPADCALL |f| (QREFELT $ 73)) |SubL| JV
                          (QREFELT $ 76))
                . #13#)
          (EXIT (SPADCALL |g| (QREFELT $ 78))))))) 

(DEFUN |SYMANA;detSys;LL;3| (|sys| $)
  (PROG (#1=#:G211 |eq| #2=#:G210 |ds| #3=#:G209 #4=#:G208)
    (RETURN
     (SEQ
      (LETT |ds|
            (SPADCALL |sys|
                      (PROGN
                       (LETT #4# NIL . #5=(|SYMANA;detSys;LL;3|))
                       (SEQ (LETT |eq| NIL . #5#) (LETT #3# |sys| . #5#) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |eq| (CAR #3#) . #5#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #4#
                                    (CONS (SPADCALL |eq| (QREFELT $ 80)) #4#)
                                    . #5#)))
                            (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                            (EXIT (NREVERSE #4#))))
                      (SPADCALL (QREFELT $ 45)) (QREFELT $ 81))
            . #5#)
      (EXIT
       (PROGN
        (LETT #2# NIL . #5#)
        (SEQ (LETT |eq| NIL . #5#) (LETT #1# |ds| . #5#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#) . #5#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT #2# (CONS (SPADCALL |eq| (QREFELT $ 79)) #2#) . #5#)))
             (LETT #1# (CDR #1#) . #5#) (GO G190) G191
             (EXIT (NREVERSE #2#))))))))) 

(DEFUN |SYMANA;detSys;LJvfL;4| (|sys| |vf| $)
  (PROG (#1=#:G215 |eq| #2=#:G214)
    (RETURN
     (SEQ
      (SPADCALL |sys|
                (PROGN
                 (LETT #2# NIL . #3=(|SYMANA;detSys;LJvfL;4|))
                 (SEQ (LETT |eq| NIL . #3#) (LETT #1# |sys| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |eq| (QREFELT $ 80)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                |vf| (QREFELT $ 81)))))) 

(DEFUN |SYMANA;detSys;LLJvfL;5| (|sys| |sjb| |vf| $)
  (PROG (#1=#:G265 |co| #2=#:G264 |conds| |coL| #3=#:G263 |jp| #4=#:G262
         |pcrit| #5=#:G261 |eq| #6=#:G260 |crit| #7=#:G259 #8=#:G258 |pvf| |o|
         |ol| #9=#:G257 #10=#:G256 |solEq| |tmp| #11=#:G254 #12=#:G255 |jv|)
    (RETURN
     (SEQ (LETT |solEq| NIL . #13=(|SYMANA;detSys;LLJvfL;5|))
          (SEQ (LETT |jv| NIL . #13#) (LETT #12# |sjb| . #13#)
               (LETT |eq| NIL . #13#) (LETT #11# |sys| . #13#) G190
               (COND
                ((OR (ATOM #11#) (PROGN (LETT |eq| (CAR #11#) . #13#) NIL)
                     (ATOM #12#) (PROGN (LETT |jv| (CAR #12#) . #13#) NIL))
                 (GO G191)))
               (SEQ (LETT |tmp| (SPADCALL |eq| |jv| (QREFELT $ 86)) . #13#)
                    (EXIT
                     (COND
                      ((QEQCAR |tmp| 1) (|error| "cannot solve in detsys"))
                      ('T
                       (LETT |solEq|
                             (CONS
                              (SPADCALL (SPADCALL |jv| (QREFELT $ 32))
                                        (QCDR |tmp|) (QREFELT $ 89))
                              |solEq|)
                             . #13#)))))
               (LETT #11# (PROG1 (CDR #11#) (LETT #12# (CDR #12#) . #13#))
                     . #13#)
               (GO G190) G191 (EXIT NIL))
          (LETT |solEq| (NREVERSE |solEq|) . #13#)
          (LETT |ol|
                (PROGN
                 (LETT #10# NIL . #13#)
                 (SEQ (LETT |eq| NIL . #13#) (LETT #9# |sys| . #13#) G190
                      (COND
                       ((OR (ATOM #9#)
                            (PROGN (LETT |eq| (CAR #9#) . #13#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #10# (CONS (SPADCALL |eq| (QREFELT $ 90)) #10#)
                              . #13#)))
                      (LETT #9# (CDR #9#) . #13#) (GO G190) G191
                      (EXIT (NREVERSE #10#))))
                . #13#)
          (LETT |o| (SPADCALL (ELT $ 93) |ol| 0 (QREFELT $ 96)) . #13#)
          (LETT |pvf| (SPADCALL |vf| |o| (QREFELT $ 97)) . #13#)
          (LETT |crit|
                (PROGN
                 (LETT #8# NIL . #13#)
                 (SEQ (LETT |eq| NIL . #13#) (LETT #7# |sys| . #13#) G190
                      (COND
                       ((OR (ATOM #7#)
                            (PROGN (LETT |eq| (CAR #7#) . #13#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #8#
                              (CONS (SPADCALL |pvf| |eq| (QREFELT $ 98)) #8#)
                              . #13#)))
                      (LETT #7# (CDR #7#) . #13#) (GO G190) G191
                      (EXIT (NREVERSE #8#))))
                . #13#)
          (LETT |pcrit|
                (PROGN
                 (LETT #6# NIL . #13#)
                 (SEQ (LETT |eq| NIL . #13#) (LETT #5# |crit| . #13#) G190
                      (COND
                       ((OR (ATOM #5#)
                            (PROGN (LETT |eq| (CAR #5#) . #13#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6#
                              (CONS
                               (SPADCALL
                                (SPADCALL |eq| |solEq| (QREFELT $ 100))
                                (QREFELT $ 102))
                               #6#)
                              . #13#)))
                      (LETT #5# (CDR #5#) . #13#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #13#)
          (LETT |coL|
                (PROGN
                 (LETT #4# NIL . #13#)
                 (SEQ (LETT |jp| NIL . #13#) (LETT #3# |pcrit| . #13#) G190
                      (COND
                       ((OR (ATOM #3#)
                            (PROGN (LETT |jp| (CAR #3#) . #13#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4# (CONS (SPADCALL |jp| (QREFELT $ 104)) #4#)
                              . #13#)))
                      (LETT #3# (CDR #3#) . #13#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #13#)
          (LETT |conds| (SPADCALL (ELT $ 105) |coL| NIL (QREFELT $ 108))
                . #13#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #13#)
            (SEQ (LETT |co| NIL . #13#) (LETT #1# |conds| . #13#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |co| (CAR #1#) . #13#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (SPADCALL |co| (QREFELT $ 109)) #2#)
                         . #13#)))
                 (LETT #1# (CDR #1#) . #13#) (GO G190) G191
                 (EXIT (NREVERSE #2#))))))))) 

(DEFUN |SYMANA;ncDetSys;LL;6| (|sys| $)
  (PROG (#1=#:G273 |eq| #2=#:G272 |ds| #3=#:G271 #4=#:G270)
    (RETURN
     (SEQ
      (LETT |ds|
            (SPADCALL |sys|
                      (PROGN
                       (LETT #4# NIL . #5=(|SYMANA;ncDetSys;LL;6|))
                       (SEQ (LETT |eq| NIL . #5#) (LETT #3# |sys| . #5#) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |eq| (CAR #3#) . #5#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #4#
                                    (CONS (SPADCALL |eq| (QREFELT $ 80)) #4#)
                                    . #5#)))
                            (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                            (EXIT (NREVERSE #4#))))
                      (SPADCALL (QREFELT $ 45)) (QREFELT $ 110))
            . #5#)
      (EXIT
       (PROGN
        (LETT #2# NIL . #5#)
        (SEQ (LETT |eq| NIL . #5#) (LETT #1# |ds| . #5#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#) . #5#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT #2# (CONS (SPADCALL |eq| (QREFELT $ 79)) #2#) . #5#)))
             (LETT #1# (CDR #1#) . #5#) (GO G190) G191
             (EXIT (NREVERSE #2#))))))))) 

(DEFUN |SYMANA;ncDetSys;LJvfL;7| (|sys| |vf| $)
  (PROG (#1=#:G277 |eq| #2=#:G276)
    (RETURN
     (SEQ
      (SPADCALL |sys|
                (PROGN
                 (LETT #2# NIL . #3=(|SYMANA;ncDetSys;LJvfL;7|))
                 (SEQ (LETT |eq| NIL . #3#) (LETT #1# |sys| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |eq| (QREFELT $ 80)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                |vf| (QREFELT $ 110)))))) 

(DEFUN |SYMANA;ncDetSys;LLJvfL;8| (|sys| |sjb| |vf| $)
  (PROG (|isc| |ijb| |cond| |jv| #1=#:G289 #2=#:G304 |x| #3=#:G305 |i|
         #4=#:G302 |e| #5=#:G303 |j| |Eta| #6=#:G300 |co| #7=#:G301 |ind2|
         |tmp| |ind1| |Xi| |jt| #8=#:G298 #9=#:G299 |coeffs| |dirs|)
    (RETURN
     (SEQ
      (LETT |dirs| (SPADCALL |vf| (QREFELT $ 113))
            . #10=(|SYMANA;ncDetSys;LLJvfL;8|))
      (LETT |coeffs| (SPADCALL |vf| (QREFELT $ 114)) . #10#)
      (LETT |Xi| NIL . #10#) (LETT |tmp| NIL . #10#) (LETT |ind1| NIL . #10#)
      (LETT |ind2| NIL . #10#)
      (SEQ (LETT |co| NIL . #10#) (LETT #9# |coeffs| . #10#)
           (LETT |jv| NIL . #10#) (LETT #8# |dirs| . #10#) G190
           (COND
            ((OR (ATOM #8#) (PROGN (LETT |jv| (CAR #8#) . #10#) NIL) (ATOM #9#)
                 (PROGN (LETT |co| (CAR #9#) . #10#) NIL))
             (GO G191)))
           (SEQ (LETT |jt| (SPADCALL |jv| (QREFELT $ 115)) . #10#)
                (EXIT
                 (COND
                  ((EQUAL |jt| '|Indep|)
                   (SEQ (LETT |Xi| (CONS |co| |Xi|) . #10#)
                        (EXIT
                         (LETT |ind1|
                               (CONS (SPADCALL |jv| (QREFELT $ 116)) |ind1|)
                               . #10#))))
                  ((EQUAL |jt| '|Dep|)
                   (SEQ (LETT |tmp| (CONS |co| |tmp|) . #10#)
                        (EXIT
                         (LETT |ind2|
                               (CONS (SPADCALL |jv| (QREFELT $ 116)) |ind2|)
                               . #10#))))
                  ('T (|error| '|errmsg|)))))
           (LETT #8# (PROG1 (CDR #8#) (LETT #9# (CDR #9#) . #10#)) . #10#)
           (GO G190) G191 (EXIT NIL))
      (LETT |j| (QREFELT $ 13) . #10#) (LETT |Eta| NIL . #10#)
      (SEQ (LETT |i| NIL . #10#) (LETT #7# |ind2| . #10#)
           (LETT |co| NIL . #10#) (LETT #6# |tmp| . #10#) G190
           (COND
            ((OR (ATOM #6#) (PROGN (LETT |co| (CAR #6#) . #10#) NIL) (ATOM #7#)
                 (PROGN (LETT |i| (CAR #7#) . #10#) NIL))
             (GO G191)))
           (SEQ
            (SEQ G190
                 (COND ((NULL (SPADCALL |j| |i| (QREFELT $ 62))) (GO G191)))
                 (SEQ (LETT |Eta| (CONS (|spadConstant| $ 117) |Eta|) . #10#)
                      (EXIT (LETT |j| (- |j| 1) . #10#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (LETT |Eta| (CONS |co| |Eta|) . #10#)
            (EXIT (LETT |j| (- |j| 1) . #10#)))
           (LETT #6# (PROG1 (CDR #6#) (LETT #7# (CDR #7#) . #10#)) . #10#)
           (GO G190) G191 (EXIT NIL))
      (COND
       ((NULL (ZEROP |j|))
        (SEQ (LETT |i| 1 . #10#) G190 (COND ((|greater_SI| |i| |j|) (GO G191)))
             (SEQ
              (EXIT (LETT |Eta| (CONS (|spadConstant| $ 117) |Eta|) . #10#)))
             (LETT |i| (|inc_SI| |i|) . #10#) (GO G190) G191 (EXIT NIL))))
      (LETT |isc| NIL . #10#) (LETT |ijb| NIL . #10#)
      (SEQ (LETT |j| 1 . #10#) (LETT #5# (QREFELT $ 13) . #10#)
           (LETT |e| NIL . #10#) (LETT #4# |Eta| . #10#) G190
           (COND
            ((OR (ATOM #4#) (PROGN (LETT |e| (CAR #4#) . #10#) NIL)
                 (|greater_SI| |j| #5#))
             (GO G191)))
           (SEQ (LETT |cond| (SPADCALL |e| (QREFELT $ 118)) . #10#)
                (LETT |jv| (SPADCALL (QREFELT $ 23)) . #10#)
                (SEQ (LETT |i| NIL . #10#) (LETT #3# |ind1| . #10#)
                     (LETT |x| NIL . #10#) (LETT #2# |Xi| . #10#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #10#) NIL)
                           (ATOM #3#) (PROGN (LETT |i| (CAR #3#) . #10#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((NULL (SPADCALL |x| (QREFELT $ 119)))
                         (SEQ
                          (LETT |jv|
                                (SPADCALL
                                 (PROG1 (LETT #1# |j| . #10#)
                                   (|check_subtype| (> #1# 0)
                                                    '(|PositiveInteger|) #1#))
                                 (LIST |i|) (QREFELT $ 120))
                                . #10#)
                          (EXIT
                           (LETT |cond|
                                 (SPADCALL |cond|
                                           (SPADCALL |x|
                                                     (SPADCALL |jv|
                                                               (QREFELT $ 32))
                                                     (QREFELT $ 121))
                                           (QREFELT $ 122))
                                 . #10#)))))))
                     (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #10#))
                           . #10#)
                     (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND
                  ((SPADCALL |jv| (QREFELT $ 123))
                   (|error| "cannot solve invariant surface condition"))
                  ('T
                   (SEQ (LETT |ijb| (CONS |jv| |ijb|) . #10#)
                        (EXIT (LETT |isc| (CONS |cond| |isc|) . #10#)))))))
           (LETT #4# (PROG1 (CDR #4#) (LETT |j| (|inc_SI| |j|) . #10#)) . #10#)
           (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL (APPEND |isc| |sys|) (APPEND |ijb| |sjb|) |vf|
                 (QREFELT $ 81))))))) 

(DEFUN |SymmetryAnalysis| (&REST #1=#:G318)
  (PROG ()
    (RETURN
     (PROG (#2=#:G319)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|SymmetryAnalysis|)
                                           '|domainEqualList|)
                . #3=(|SymmetryAnalysis|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |SymmetryAnalysis;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|SymmetryAnalysis|))))))))))) 

(DEFUN |SymmetryAnalysis;| (|#1| |#2| |#3|)
  (PROG (#1=#:G317 |jv| #2=#:G316 #3=#:G315 |i| #4=#:G314 #5=#:G313 #6=#:G312
         #7=#:G311 #8=#:G310 #9=#:G142 #10=#:G309 #11=#:G308 #12=#:G139
         #13=#:G307 #14=#:G306 |pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (SEQ
      (PROGN
       (LETT DV$1 (|devaluate| |#1|) . #15=(|SymmetryAnalysis|))
       (LETT DV$2 (|devaluate| |#2|) . #15#)
       (LETT DV$3 (|devaluate| |#3|) . #15#)
       (LETT |dv$| (LIST '|SymmetryAnalysis| DV$1 DV$2 DV$3) . #15#)
       (LETT $ (GETREFV 125) . #15#)
       (QSETREFV $ 0 |dv$|)
       (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #15#))
       (|haddProp| |$ConstructorCache| '|SymmetryAnalysis|
                   (LIST DV$1 DV$2 DV$3) (CONS 1 $))
       (|stuffDomainSlots| $)
       (QSETREFV $ 6 |#1|)
       (QSETREFV $ 7 |#2|)
       (QSETREFV $ 8 |#3|)
       (SETF |pv$| (QREFELT $ 3))
       (QSETREFV $ 11 (SPADCALL (QREFELT $ 10)))
       (QSETREFV $ 13 (SPADCALL (QREFELT $ 12)))
       (QSETREFV $ 18
                 (SPADCALL
                  (PROGN
                   (LETT #14# NIL . #15#)
                   (SEQ (LETT |i| 1 . #15#) (LETT #13# (QREFELT $ 11) . #15#)
                        G190 (COND ((|greater_SI| |i| #13#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #14#
                                (CONS
                                 (SPADCALL
                                  (PROG1 (LETT #12# |i| . #15#)
                                    (|check_subtype| (> #12# 0)
                                                     '(|PositiveInteger|)
                                                     #12#))
                                  (QREFELT $ 14))
                                 #14#)
                                . #15#)))
                        (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                        (EXIT (NREVERSE #14#))))
                  (PROGN
                   (LETT #11# NIL . #15#)
                   (SEQ (LETT |i| 1 . #15#) (LETT #10# (QREFELT $ 13) . #15#)
                        G190 (COND ((|greater_SI| |i| #10#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #11#
                                (CONS
                                 (SPADCALL
                                  (PROG1 (LETT #9# |i| . #15#)
                                    (|check_subtype| (> #9# 0)
                                                     '(|PositiveInteger|) #9#))
                                  (QREFELT $ 15))
                                 #11#)
                                . #15#)))
                        (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                        (EXIT (NREVERSE #11#))))
                  (QREFELT $ 17)))
       (QSETREFV $ 21
                 (PROGN
                  (LETT #8# NIL . #15#)
                  (SEQ (LETT |jv| NIL . #15#) (LETT #7# (QREFELT $ 18) . #15#)
                       G190
                       (COND
                        ((OR (ATOM #7#)
                             (PROGN (LETT |jv| (CAR #7#) . #15#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #8# (CONS (SPADCALL |jv| (QREFELT $ 20)) #8#)
                               . #15#)))
                       (LETT #7# (CDR #7#) . #15#) (GO G190) G191
                       (EXIT (NREVERSE #8#)))))
       (QSETREFV $ 22 NIL)
       (COND
        ((QEQCAR |#2| 0)
         (COND
          ((SPADCALL (QREFELT $ 11) 1 (QREFELT $ 25))
           (SETELT $ 22
                   (PROGN
                    (LETT #6# NIL . #15#)
                    (SEQ (LETT |i| 1 . #15#) (LETT #5# (QREFELT $ 11) . #15#)
                         G190 (COND ((|greater_SI| |i| #5#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #6#
                                 (CONS
                                  (SPADCALL (QCDR |#2|)
                                            (LIST
                                             (SPADCALL |i| (QREFELT $ 28)))
                                            (QREFELT $ 30))
                                  #6#)
                                 . #15#)))
                         (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                         (EXIT (NREVERSE #6#))))))
          ('T (SETELT $ 22 (LIST (QCDR |#2|))))))
        ('T (SETELT $ 22 (QCDR |#2|))))
       (COND
        ((QEQCAR |#3| 0)
         (COND
          ((SPADCALL (QREFELT $ 13) 1 (QREFELT $ 25))
           (SETELT $ 22
                   (APPEND (QREFELT $ 22)
                           (PROGN
                            (LETT #4# NIL . #15#)
                            (SEQ (LETT |i| 1 . #15#)
                                 (LETT #3# (QREFELT $ 13) . #15#) G190
                                 (COND ((|greater_SI| |i| #3#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #4#
                                         (CONS
                                          (SPADCALL (QCDR |#3|)
                                                    (LIST
                                                     (SPADCALL |i|
                                                               (QREFELT $ 28)))
                                                    (QREFELT $ 30))
                                          #4#)
                                         . #15#)))
                                 (LETT |i| (|inc_SI| |i|) . #15#) (GO G190)
                                 G191 (EXIT (NREVERSE #4#)))))))
          ('T (SETELT $ 22 (APPEND (QREFELT $ 22) (LIST (QCDR |#3|)))))))
        ('T (SETELT $ 22 (APPEND (QREFELT $ 22) (QCDR |#3|)))))
       (QSETREFV $ 33
                 (PROGN
                  (LETT #2# NIL . #15#)
                  (SEQ (LETT |jv| NIL . #15#) (LETT #1# (QREFELT $ 18) . #15#)
                       G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |jv| (CAR #1#) . #15#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL |jv| (QREFELT $ 32)) #2#)
                               . #15#)))
                       (LETT #1# (CDR #1#) . #15#) (GO G190) G191
                       (EXIT (NREVERSE #2#)))))
       $))))) 

(MAKEPROP '|SymmetryAnalysis| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|PositiveInteger|) (0 . |numIndVar|) '|nn|
              (4 . |numDepVar|) '|mm| (8 . X) (13 . U) (|List| 6)
              (18 . |concat!|) '|vars| (|Symbol|) (24 . |name|) '|indVars|
              '|depVars| (29 . |One|) (|Boolean|) (33 . >) (|OutputForm|)
              (|NonNegativeInteger|) (39 . |coerce|) (|List| 26)
              (44 . |superscript|) (|JetBundleExpression| 6) (50 . |coerce|)
              '|JVars| (|JetVectorField| 6 31) (55 . |Zero|) (|Integer|)
              (|List| 19) (59 . |qelt|) (|List| $) (65 . |function|)
              (72 . |diffX|) (77 . *) (83 . +) (89 . |diffU|)
              |SYMANA;ansatz;Jvf;1| (|List| 71) (94 . |tower|)
              (|BasicOperator|) (|Kernel| 31) (99 . |operator|) (104 . |has?|)
              (|Union| (|None|) '"failed") (110 . |property|) (|List| 31)
              (116 . |argument|) (121 . |second|) (126 . |retract|)
              (|JetBundleSymAna| 6 7 8) (131 . X) (|Expression| 36)
              (136 . |coerce|) (141 . >) (147 . |coerce|) (152 . |kernels|)
              (157 . |name|) (162 . |position|) (168 . |minIndex|) (173 . >)
              (179 . |empty|) (183 . U) (|Kernel| $) (188 . |coerce|)
              (193 . |coerce|) (|List| 9) (198 . |Pr|) (204 . |eval|)
              (|JetBundleExpression| 58) (211 . |coerce|)
              |SYMANA;transform;JbeJbe;2| (216 . |leadingDer|)
              |SYMANA;detSys;LLJvfL;5| (|List| 77) |SYMANA;detSys;LL;3|
              |SYMANA;detSys;LJvfL;4| (|Union| $ '"failed") (221 . |solveFor|)
              (227 . =) (|Equation| 31) (233 . =) (239 . |order|) (244 . |max|)
              (250 . |max|) (256 . |max|) (|Mapping| 27 27 27) (|List| 27)
              (262 . |reduce|) (269 . |prolong|) (275 . |eval|)
              (|List| (|Equation| $)) (281 . |eval|)
              (|SparseMultivariatePolynomial| 60 6) (287 . |numerJP|)
              (|List| 60) (292 . |coefficients|) (297 . |append|)
              (|Mapping| 103 103 103) (|List| 103) (303 . |reduce|)
              (310 . |coerce|) |SYMANA;ncDetSys;LLJvfL;8|
              |SYMANA;ncDetSys;LL;6| |SYMANA;ncDetSys;LJvfL;7|
              (315 . |directions|) (320 . |coefficients|) (325 . |type|)
              (330 . |index|) (335 . |Zero|) (339 . -) (344 . |zero?|)
              (349 . |Pr|) (355 . *) (361 . +) (367 . |one?|)
              (|List|
               (|JetBundleLinearFunction| 58 (|JetBundleXExpression| 58))))
           '#(|transform| 372 |ncDetSys| 377 |linearize| 395 |detSysNS| 400
              |detSys| 411 |ansatz| 429)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 124
                                                 '(0 6 9 10 0 6 9 12 1 6 0 9 14
                                                   1 6 0 9 15 2 16 0 0 0 17 1 6
                                                   19 0 20 0 6 0 23 2 9 24 0 0
                                                   25 1 27 26 0 28 2 19 0 0 29
                                                   30 1 31 0 6 32 0 34 0 35 2
                                                   37 19 0 36 38 3 31 0 19 39
                                                   27 40 1 34 0 9 41 2 34 0 31
                                                   0 42 2 34 0 0 0 43 1 34 0 9
                                                   44 1 31 46 0 47 1 49 48 0 50
                                                   2 48 24 0 19 51 2 48 52 0 19
                                                   53 1 49 54 0 55 1 54 31 0 56
                                                   1 31 36 0 57 1 58 0 9 59 1
                                                   58 60 0 61 2 36 24 0 0 62 1
                                                   6 60 0 63 1 60 46 0 64 1 48
                                                   19 0 65 2 37 36 19 0 66 1 37
                                                   36 0 67 2 27 24 0 0 68 0 26
                                                   0 69 1 58 0 9 70 1 31 0 71
                                                   72 1 31 60 0 73 2 58 0 9 74
                                                   75 3 60 0 0 46 39 76 1 77 0
                                                   60 78 1 31 6 0 80 2 31 85 0
                                                   6 86 2 31 24 0 0 87 2 88 0
                                                   31 31 89 1 31 27 0 90 2 19 0
                                                   0 0 91 2 6 0 0 0 92 2 27 0 0
                                                   0 93 3 95 27 94 0 27 96 2 34
                                                   0 0 27 97 2 34 31 0 31 98 2
                                                   31 0 0 99 100 1 31 101 0 102
                                                   1 101 103 0 104 2 103 0 0 0
                                                   105 3 107 103 106 0 103 108
                                                   1 31 0 60 109 1 34 16 0 113
                                                   1 34 54 0 114 1 6 19 0 115 1
                                                   6 9 0 116 0 31 0 117 1 31 0
                                                   0 118 1 31 24 0 119 2 6 0 9
                                                   74 120 2 31 0 0 0 121 2 31 0
                                                   0 0 122 1 6 24 0 123 1 0 77
                                                   31 79 2 0 54 54 34 112 1 0
                                                   82 54 111 3 0 54 54 16 34
                                                   110 1 0 124 82 1 2 0 54 54
                                                   34 1 1 0 82 54 1 2 0 54 54
                                                   34 84 1 0 82 54 83 3 0 54 54
                                                   16 34 81 0 0 34 45)))))
           '|lookupComplete|)) 
