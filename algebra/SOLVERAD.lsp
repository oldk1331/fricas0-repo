
(/VERSIONCHECK 2) 

(DEFUN |SOLVERAD;New| (|s| $)
  (PROG (S)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |s| (|spadConstant| $ 13) (QREFELT $ 15))
        (|spadConstant| $ 13))
       ('T
        (SEQ
         (LETT S
               (SPADCALL
                (SPADCALL (SPADCALL (SPADCALL (QREFELT $ 17)) (QREFELT $ 19))
                          (QREFELT $ 21))
                (QREFELT $ 22))
               |SOLVERAD;New|)
         (SETELT $ 7
                 (APPEND (LIST (SPADCALL S |s| (QREFELT $ 23))) (QREFELT $ 7)))
         (EXIT S)))))))) 

(DEFUN |SOLVERAD;linear| (|u| $)
  (LIST
   (SPADCALL
    (SPADCALL (SPADCALL (SPADCALL |u| 0 (QREFELT $ 26)) (QREFELT $ 27))
              (QREFELT $ 28))
    (SPADCALL (SPADCALL |u| 1 (QREFELT $ 26)) (QREFELT $ 28)) (QREFELT $ 31)))) 

(DEFUN |SOLVERAD;quadratic| (|u| $)
  (SPADCALL (SPADCALL (ELT $ 28) |u| (QREFELT $ 35)) (QREFELT $ 38))) 

(DEFUN |SOLVERAD;cubic| (|u| $)
  (SPADCALL (SPADCALL (ELT $ 28) |u| (QREFELT $ 35)) (QREFELT $ 39))) 

(DEFUN |SOLVERAD;quartic| (|u| $)
  (SPADCALL (SPADCALL (ELT $ 28) |u| (QREFELT $ 35)) (QREFELT $ 40))) 

(DEFUN |SOLVERAD;rad| (|n| $) (SPADCALL |n| (QREFELT $ 42))) 

(DEFUN |SOLVERAD;wrap| (|s| $)
  (COND ((QREFELT $ 8) (|SOLVERAD;New| |s| $)) ('T |s|))) 

(DEFUN |SOLVERAD;findGenZeros| (|rlp| |rlv| $)
  (PROG (|res| #1=#:G152 |vv| #2=#:G153 |p| #3=#:G151 #4=#:G150 |r| #5=#:G149
         |v| |pp|)
    (RETURN
     (SEQ (LETT |pp| (|SPADfirst| |rlp|) . #6=(|SOLVERAD;findGenZeros|))
          (LETT |v| (|SPADfirst| |rlv|) . #6#) (LETT |rlv| (CDR |rlv|) . #6#)
          (LETT |res| NIL . #6#)
          (LETT |res|
                (APPEND
                 (PROGN
                  (LETT #5# NIL . #6#)
                  (SEQ (LETT |r| NIL . #6#)
                       (LETT #4#
                             (SPADCALL (SPADCALL |pp| (QREFELT $ 21)) |v|
                                       (QREFELT $ 43))
                             . #6#)
                       G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |r| (CAR #4#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #5#
                               (CONS
                                (REVERSE
                                 (CONS |r|
                                       (PROGN
                                        (LETT #3# NIL . #6#)
                                        (SEQ (LETT |p| NIL . #6#)
                                             (LETT #2# (CDR |rlp|) . #6#)
                                             (LETT |vv| NIL . #6#)
                                             (LETT #1# |rlv| . #6#) G190
                                             (COND
                                              ((OR (ATOM #1#)
                                                   (PROGN
                                                    (LETT |vv| (CAR #1#) . #6#)
                                                    NIL)
                                                   (ATOM #2#)
                                                   (PROGN
                                                    (LETT |p| (CAR #2#) . #6#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #3#
                                                     (CONS
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL |p| |vv|
                                                                     (QREFELT $
                                                                              45))
                                                           0 (QREFELT $ 26))
                                                          (QREFELT $ 28))
                                                         (QREFELT $ 46))
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (SPADCALL |p| |vv|
                                                                    (QREFELT $
                                                                             45))
                                                          (QREFELT $ 47))
                                                         (QREFELT $ 28))
                                                        (QREFELT $ 31))
                                                       (SPADCALL |v|
                                                                 (QREFELT $
                                                                          49))
                                                       |r| (QREFELT $ 51))
                                                      #3#)
                                                     . #6#)))
                                             (LETT #1#
                                                   (PROG1 (CDR #1#)
                                                     (LETT #2# (CDR #2#)
                                                           . #6#))
                                                   . #6#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #3#))))))
                                #5#)
                               . #6#)))
                       (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                       (EXIT (NREVERSE #5#))))
                 |res|)
                . #6#)
          (EXIT |res|))))) 

(DEFUN |SOLVERAD;findZeros| (|rlp| |rlv| $)
  (PROG (|res| |rlv1| |lv1| |p1| |res1| #1=#:G164 |par| |parRes| #2=#:G162 |p|
         #3=#:G163 |v| #4=#:G161)
    (RETURN
     (SEQ
      (LETT |parRes|
            (PROGN
             (LETT #4# NIL . #5=(|SOLVERAD;findZeros|))
             (SEQ (LETT |v| NIL . #5#) (LETT #3# |rlv| . #5#)
                  (LETT |p| NIL . #5#) (LETT #2# |rlp| . #5#) G190
                  (COND
                   ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) . #5#) NIL)
                        (ATOM #3#) (PROGN (LETT |v| (CAR #3#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #4#
                          (CONS
                           (SPADCALL (SPADCALL |p| (QREFELT $ 21)) |v|
                                     (QREFELT $ 43))
                           #4#)
                          . #5#)))
                  (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #5#)) . #5#)
                  (GO G190) G191 (EXIT (NREVERSE #4#))))
            . #5#)
      (LETT |parRes| (|SOLVERAD;select| |parRes| $) . #5#)
      (LETT |res| NIL . #5#)
      (SEQ (LETT |par| NIL . #5#) (LETT #1# |parRes| . #5#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |par| (CAR #1#) . #5#) NIL))
             (GO G191)))
           (SEQ (LETT |res1| (LIST (|SPADfirst| |par|)) . #5#)
                (LETT |lv1|
                      (LIST (SPADCALL (|SPADfirst| |rlv|) (QREFELT $ 49)))
                      . #5#)
                (LETT |rlv1| (CDR |rlv|) . #5#) (LETT |p1| (CDR |par|) . #5#)
                (SEQ G190
                     (COND
                      ((NULL (SPADCALL |p1| NIL (QREFELT $ 52))) (GO G191)))
                     (SEQ
                      (LETT |res1|
                            (CONS
                             (SPADCALL (|SPADfirst| |p1|) |lv1| |res1|
                                       (QREFELT $ 55))
                             |res1|)
                            . #5#)
                      (LETT |p1| (CDR |p1|) . #5#)
                      (LETT |lv1|
                            (CONS
                             (SPADCALL (|SPADfirst| |rlv1|) (QREFELT $ 49))
                             |lv1|)
                            . #5#)
                      (EXIT (LETT |rlv1| (CDR |rlv1|) . #5#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (LETT |res| (CONS |res1| |res|) . #5#)))
           (LETT #1# (CDR #1#) . #5#) (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |SOLVERAD;radicalSolve;FSL;10| (|pol| |v| $)
  (PROG (#1=#:G168 |r| #2=#:G167)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|SOLVERAD;radicalSolve;FSL;10|))
       (SEQ (LETT |r| NIL . #3#)
            (LETT #1# (SPADCALL |pol| |v| (QREFELT $ 43)) . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2#
                    (CONS
                     (SPADCALL (SPADCALL |v| (QREFELT $ 56)) |r|
                               (QREFELT $ 57))
                     #2#)
                    . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |SOLVERAD;radicalSolve;FL;11| (|p| $)
  (PROG (|lv|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p| (QREFELT $ 60)) (|error| "equation is always satisfied"))
       (#1='T
        (SEQ
         (LETT |lv|
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |p| (QREFELT $ 61)) (QREFELT $ 63))
                 (SPADCALL (SPADCALL |p| (QREFELT $ 64)) (QREFELT $ 63))
                 (QREFELT $ 65))
                (QREFELT $ 66))
               |SOLVERAD;radicalSolve;FL;11|)
         (EXIT
          (COND ((NULL |lv|) (|error| "inconsistent equation"))
                ((SPADCALL (LENGTH |lv|) 1 (QREFELT $ 67))
                 (|error| "too many variables"))
                (#1# (SPADCALL |p| (|SPADfirst| |lv|) (QREFELT $ 59)))))))))))) 

(DEFUN |SOLVERAD;radicalSolve;EL;12| (|eq| $)
  (SPADCALL
   (SPADCALL (SPADCALL |eq| (QREFELT $ 70)) (SPADCALL |eq| (QREFELT $ 71))
             (QREFELT $ 72))
   (QREFELT $ 68))) 

(DEFUN |SOLVERAD;radicalSolve;ESL;13| (|eq| |v| $)
  (SPADCALL
   (SPADCALL (SPADCALL |eq| (QREFELT $ 70)) (SPADCALL |eq| (QREFELT $ 71))
             (QREFELT $ 72))
   |v| (QREFELT $ 59))) 

(DEFUN |SOLVERAD;radicalRoots;LLL;14| (|lp| |lv| $)
  (PROG (#1=#:G184 #2=#:G183 #3=#:G185 #4=#:G195 |res| |rpRes| #5=#:G194
         |result| #6=#:G178 #7=#:G177 #8=#:G179 #9=#:G193 |listGen| #10=#:G192
         #11=#:G191 #12=#:G190 #13=#:G189 |rlv| |parRes|)
    (RETURN
     (SEQ
      (LETT |parRes| (SPADCALL |lp| |lv| (QREFELT $ 78))
            . #14=(|SOLVERAD;radicalRoots;LLL;14|))
      (EXIT
       (COND
        ((SPADCALL |parRes| (SPADCALL NIL (QREFELT $ 80)) (QREFELT $ 81)) NIL)
        (#15='T
         (SEQ (LETT |rlv| (REVERSE |lv|) . #14#)
              (LETT |rpRes|
                    (PROGN
                     (LETT #13# NIL . #14#)
                     (SEQ (LETT |res| NIL . #14#) (LETT #12# |parRes| . #14#)
                          G190
                          (COND
                           ((OR (ATOM #12#)
                                (PROGN (LETT |res| (CAR #12#) . #14#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #13# (CONS (REVERSE |res|) #13#) . #14#)))
                          (LETT #12# (CDR #12#) . #14#) (GO G190) G191
                          (EXIT (NREVERSE #13#))))
                    . #14#)
              (LETT |listGen|
                    (PROGN
                     (LETT #11# NIL . #14#)
                     (SEQ (LETT |res| NIL . #14#) (LETT #10# |rpRes| . #14#)
                          G190
                          (COND
                           ((OR (ATOM #10#)
                                (PROGN (LETT |res| (CAR #10#) . #14#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((|SOLVERAD;isGeneric?| |res| |rlv| $)
                              (LETT #11# (CONS |res| #11#) . #14#)))))
                          (LETT #10# (CDR #10#) . #14#) (GO G190) G191
                          (EXIT (NREVERSE #11#))))
                    . #14#)
              (LETT |result| NIL . #14#)
              (COND
               ((SPADCALL |listGen| NIL (QREFELT $ 82))
                (SEQ
                 (LETT |result|
                       (PROGN
                        (LETT #6# NIL . #14#)
                        (SEQ (LETT |res| NIL . #14#)
                             (LETT #9# |listGen| . #14#) G190
                             (COND
                              ((OR (ATOM #9#)
                                   (PROGN (LETT |res| (CAR #9#) . #14#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (PROGN
                                (LETT #8#
                                      (|SOLVERAD;findGenZeros| |res| |rlv| $)
                                      . #14#)
                                (COND (#6# (LETT #7# (APPEND #7# #8#) . #14#))
                                      ('T
                                       (PROGN
                                        (LETT #7# #8# . #14#)
                                        (LETT #6# 'T . #14#)))))))
                             (LETT #9# (CDR #9#) . #14#) (GO G190) G191
                             (EXIT NIL))
                        (COND (#6# #7#) (#15# NIL)))
                       . #14#)
                 (EXIT
                  (SEQ (LETT |res| NIL . #14#) (LETT #5# |listGen| . #14#) G190
                       (COND
                        ((OR (ATOM #5#)
                             (PROGN (LETT |res| (CAR #5#) . #14#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |rpRes|
                               (SPADCALL |rpRes|
                                         (SPADCALL |res| |rpRes|
                                                   (QREFELT $ 83))
                                         (QREFELT $ 84))
                               . #14#)))
                       (LETT #5# (CDR #5#) . #14#) (GO G190) G191
                       (EXIT NIL))))))
              (EXIT
               (COND ((SPADCALL |rpRes| NIL (QREFELT $ 81)) |result|)
                     (#15#
                      (APPEND
                       (PROGN
                        (LETT #1# NIL . #14#)
                        (SEQ (LETT |res| NIL . #14#) (LETT #4# |rpRes| . #14#)
                             G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |res| (CAR #4#) . #14#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (PROGN
                                (LETT #3# (|SOLVERAD;findZeros| |res| |rlv| $)
                                      . #14#)
                                (COND (#1# (LETT #2# (APPEND #2# #3#) . #14#))
                                      ('T
                                       (PROGN
                                        (LETT #2# #3# . #14#)
                                        (LETT #1# 'T . #14#)))))))
                             (LETT #4# (CDR #4#) . #14#) (GO G190) G191
                             (EXIT NIL))
                        (COND (#1# #2#) (#15# NIL)))
                       |result|)))))))))))) 

(DEFUN |SOLVERAD;radicalSolve;LLL;15| (|lp| |lv| $)
  (PROG (#1=#:G199 |lres| #2=#:G198)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|SOLVERAD;radicalSolve;LLL;15|))
       (SEQ (LETT |lres| NIL . #3#)
            (LETT #1# (SPADCALL |lp| |lv| (QREFELT $ 86)) . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |lres| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (|SOLVERAD;makeEq| |lres| |lv| $) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |SOLVERAD;radicalSolve;LL;16| (|lp| $)
  (PROG (#1=#:G208 |lres| #2=#:G207 |lv| #3=#:G201 #4=#:G200 #5=#:G202
         #6=#:G206 |p|)
    (RETURN
     (SEQ
      (LETT |lv|
            (PROGN
             (LETT #3# NIL . #7=(|SOLVERAD;radicalSolve;LL;16|))
             (SEQ (LETT |p| NIL . #7#) (LETT #6# |lp| . #7#) G190
                  (COND
                   ((OR (ATOM #6#) (PROGN (LETT |p| (CAR #6#) . #7#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #5#
                           (SPADCALL
                            (SPADCALL (SPADCALL |p| (QREFELT $ 61))
                                      (QREFELT $ 63))
                            (SPADCALL (SPADCALL |p| (QREFELT $ 64))
                                      (QREFELT $ 63))
                            (QREFELT $ 89))
                           . #7#)
                     (COND
                      (#3# (LETT #4# (SPADCALL #4# #5# (QREFELT $ 89)) . #7#))
                      ('T (PROGN (LETT #4# #5# . #7#) (LETT #3# 'T . #7#)))))))
                  (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
             (COND (#3# #4#) ('T (|IdentityError| '|setUnion|))))
            . #7#)
      (EXIT
       (PROGN
        (LETT #2# NIL . #7#)
        (SEQ (LETT |lres| NIL . #7#)
             (LETT #1# (SPADCALL |lp| |lv| (QREFELT $ 86)) . #7#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |lres| (CAR #1#) . #7#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT #2# (CONS (|SOLVERAD;makeEq| |lres| |lv| $) #2#) . #7#)))
             (LETT #1# (CDR #1#) . #7#) (GO G190) G191
             (EXIT (NREVERSE #2#))))))))) 

(DEFUN |SOLVERAD;radicalSolve;LLL;17| (|le| |lv| $)
  (PROG (#1=#:G216 |lres| #2=#:G215 |lp| #3=#:G214 |p| #4=#:G213)
    (RETURN
     (SEQ
      (LETT |lp|
            (PROGN
             (LETT #4# NIL . #5=(|SOLVERAD;radicalSolve;LLL;17|))
             (SEQ (LETT |p| NIL . #5#) (LETT #3# |le| . #5#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #4#
                          (CONS
                           (SPADCALL (SPADCALL |p| (QREFELT $ 71))
                                     (SPADCALL |p| (QREFELT $ 70))
                                     (QREFELT $ 72))
                           #4#)
                          . #5#)))
                  (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            . #5#)
      (EXIT
       (PROGN
        (LETT #2# NIL . #5#)
        (SEQ (LETT |lres| NIL . #5#)
             (LETT #1# (SPADCALL |lp| |lv| (QREFELT $ 86)) . #5#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |lres| (CAR #1#) . #5#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT #2# (CONS (|SOLVERAD;makeEq| |lres| |lv| $) #2#) . #5#)))
             (LETT #1# (CDR #1#) . #5#) (GO G190) G191
             (EXIT (NREVERSE #2#))))))))) 

(DEFUN |SOLVERAD;radicalSolve;LL;18| (|le| $)
  (PROG (#1=#:G228 |lres| #2=#:G227 |lv| #3=#:G219 #4=#:G218 #5=#:G220
         #6=#:G226 |p| |lp| #7=#:G225 #8=#:G224)
    (RETURN
     (SEQ
      (LETT |lp|
            (PROGN
             (LETT #8# NIL . #9=(|SOLVERAD;radicalSolve;LL;18|))
             (SEQ (LETT |p| NIL . #9#) (LETT #7# |le| . #9#) G190
                  (COND
                   ((OR (ATOM #7#) (PROGN (LETT |p| (CAR #7#) . #9#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #8#
                          (CONS
                           (SPADCALL (SPADCALL |p| (QREFELT $ 71))
                                     (SPADCALL |p| (QREFELT $ 70))
                                     (QREFELT $ 72))
                           #8#)
                          . #9#)))
                  (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                  (EXIT (NREVERSE #8#))))
            . #9#)
      (LETT |lv|
            (PROGN
             (LETT #3# NIL . #9#)
             (SEQ (LETT |p| NIL . #9#) (LETT #6# |lp| . #9#) G190
                  (COND
                   ((OR (ATOM #6#) (PROGN (LETT |p| (CAR #6#) . #9#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #5#
                           (SPADCALL
                            (SPADCALL (SPADCALL |p| (QREFELT $ 61))
                                      (QREFELT $ 63))
                            (SPADCALL (SPADCALL |p| (QREFELT $ 64))
                                      (QREFELT $ 63))
                            (QREFELT $ 89))
                           . #9#)
                     (COND
                      (#3# (LETT #4# (SPADCALL #4# #5# (QREFELT $ 89)) . #9#))
                      ('T (PROGN (LETT #4# #5# . #9#) (LETT #3# 'T . #9#)))))))
                  (LETT #6# (CDR #6#) . #9#) (GO G190) G191 (EXIT NIL))
             (COND (#3# #4#) ('T (|IdentityError| '|setUnion|))))
            . #9#)
      (EXIT
       (PROGN
        (LETT #2# NIL . #9#)
        (SEQ (LETT |lres| NIL . #9#)
             (LETT #1# (SPADCALL |lp| |lv| (QREFELT $ 86)) . #9#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |lres| (CAR #1#) . #9#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT #2# (CONS (|SOLVERAD;makeEq| |lres| |lv| $) #2#) . #9#)))
             (LETT #1# (CDR #1#) . #9#) (GO G190) G191
             (EXIT (NREVERSE #2#))))))))) 

(DEFUN |SOLVERAD;contractSolve;ESSt;19| (|eq| |v| $)
  (|SOLVERAD;solveInner|
   (SPADCALL
    (SPADCALL (SPADCALL |eq| (QREFELT $ 70)) (SPADCALL |eq| (QREFELT $ 71))
              (QREFELT $ 72))
    (QREFELT $ 61))
   |v| 'T $)) 

(DEFUN |SOLVERAD;contractSolve;FSSt;20| (|pq| |v| $)
  (|SOLVERAD;solveInner| (SPADCALL |pq| (QREFELT $ 61)) |v| 'T $)) 

(DEFUN |SOLVERAD;radicalRoots;FSL;21| (|pq| |v| $)
  (SPADCALL (|SOLVERAD;solveInner| (SPADCALL |pq| (QREFELT $ 61)) |v| 'NIL $)
            (QREFELT $ 97))) 

(DEFUN |SOLVERAD;isGeneric?| (|rlp| |rlv| $)
  (PROG (#1=#:G233 #2=#:G232 #3=#:G234 #4=#:G236 |f| #5=#:G237 |x|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #6=(|SOLVERAD;isGeneric?|))
       (SEQ (LETT |x| NIL . #6#) (LETT #5# (CDR |rlv|) . #6#)
            (LETT |f| NIL . #6#) (LETT #4# (CDR |rlp|) . #6#) G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#) . #6#) NIL) (ATOM #5#)
                  (PROGN (LETT |x| (CAR #5#) . #6#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3# (EQL (SPADCALL |f| |x| (QREFELT $ 98)) 1) . #6#)
               (COND (#1# (LETT #2# (COND (#2# #3#) ('T 'NIL)) . #6#))
                     ('T (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
            (LETT #4# (PROG1 (CDR #4#) (LETT #5# (CDR #5#) . #6#)) . #6#)
            (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T 'T))))))) 

(DEFUN |SOLVERAD;select| (|lp| $)
  (PROG (#1=#:G239 #2=#:G238 #3=#:G240 #4=#:G245 |lsel| #5=#:G244 #6=#:G243
         |f|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |lp| NIL (QREFELT $ 99)) (SPADCALL NIL (QREFELT $ 100)))
            (#7='T
             (PROGN
              (LETT #1# NIL . #8=(|SOLVERAD;select|))
              (SEQ (LETT |f| NIL . #8#) (LETT #6# (|SPADfirst| |lp|) . #8#)
                   G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |f| (CAR #6#) . #8#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #3#
                            (PROGN
                             (LETT #5# NIL . #8#)
                             (SEQ (LETT |lsel| NIL . #8#)
                                  (LETT #4# (|SOLVERAD;select| (CDR |lp|) $)
                                        . #8#)
                                  G190
                                  (COND
                                   ((OR (ATOM #4#)
                                        (PROGN
                                         (LETT |lsel| (CAR #4#) . #8#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #5# (CONS (CONS |f| |lsel|) #5#)
                                          . #8#)))
                                  (LETT #4# (CDR #4#) . #8#) (GO G190) G191
                                  (EXIT (NREVERSE #5#))))
                            . #8#)
                      (COND (#1# (LETT #2# (APPEND #2# #3#) . #8#))
                            ('T
                             (PROGN
                              (LETT #2# #3# . #8#)
                              (LETT #1# 'T . #8#)))))))
                   (LETT #6# (CDR #6#) . #8#) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) (#7# NIL))))))))) 

(DEFUN |SOLVERAD;makeEq| (|nres| |lv| $)
  (PROG (#1=#:G249 |x| #2=#:G250 |r| #3=#:G248)
    (RETURN
     (SEQ
      (PROGN
       (LETT #3# NIL . #4=(|SOLVERAD;makeEq|))
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
                     (SPADCALL (SPADCALL |x| (QREFELT $ 56)) |r|
                               (QREFELT $ 57))
                     #3#)
                    . #4#)))
            (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #4#)) . #4#)
            (GO G190) G191 (EXIT (NREVERSE #3#)))))))) 

(DEFUN |SOLVERAD;solveInner| (|pq| |v| |contractFlag| $)
  (PROG (|re| |solutions| #1=#:G265 |i| T0 |s| #2=#:G264 |l| |unsolved| |n| |u|
         |t| |constants| |ff| #3=#:G263 |f| |factors|)
    (RETURN
     (SEQ (SETELT $ 7 NIL) (SETELT $ 8 |contractFlag|)
          (LETT |factors|
                (SPADCALL (SPADCALL |pq| (QREFELT $ 103)) (QREFELT $ 106))
                . #4=(|SOLVERAD;solveInner|))
          (LETT |constants| NIL . #4#) (LETT |unsolved| NIL . #4#)
          (LETT |solutions| NIL . #4#)
          (SEQ (LETT |f| NIL . #4#) (LETT #3# |factors| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ (LETT |ff| (QCAR |f|) . #4#)
                    (COND
                     ((NULL
                       (SPADCALL |v| (SPADCALL |ff| (QREFELT $ 63))
                                 (QREFELT $ 107)))
                      (EXIT (LETT |constants| (CONS |ff| |constants|) . #4#))))
                    (LETT |u| (SPADCALL |ff| |v| (QREFELT $ 45)) . #4#)
                    (LETT |t| (SPADCALL |u| (QREFELT $ 110)) . #4#)
                    (LETT |u| (QCAR |t|) . #4#)
                    (LETT |n| (SPADCALL |u| (QREFELT $ 111)) . #4#)
                    (LETT |l|
                          (COND ((EQL |n| 1) (|SOLVERAD;linear| |u| $))
                                ((EQL |n| 2) (|SOLVERAD;quadratic| |u| $))
                                ((EQL |n| 3) (|SOLVERAD;cubic| |u| $))
                                ((EQL |n| 4) (|SOLVERAD;quartic| |u| $))
                                ('T
                                 (SEQ
                                  (LETT |unsolved| (CONS |ff| |unsolved|)
                                        . #4#)
                                  (EXIT NIL))))
                          . #4#)
                    (EXIT
                     (SEQ (LETT |s| NIL . #4#) (LETT #2# |l| . #4#) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |s| (CAR #2#) . #4#) NIL))
                            (GO G191)))
                          (SEQ
                           (COND
                            ((SPADCALL (QCDR |t|) 1 (QREFELT $ 113))
                             (LETT |s| (|SOLVERAD;wrap| |s| $) . #4#)))
                           (LETT T0 (SPADCALL |s| (QCDR |t|) (QREFELT $ 114))
                                 . #4#)
                           (SEQ (LETT |i| 1 . #4#) (LETT #1# (QCDR |f|) . #4#)
                                G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |solutions| (APPEND T0 |solutions|)
                                        . #4#)))
                                (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT (LETT |re| (QREFELT $ 7) . #4#)))
                          (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |solutions| (QREFELT $ 7) (QREFELT $ 115))))))) 

(DECLAIM (NOTINLINE |RadicalSolvePackage;|)) 

(DEFUN |RadicalSolvePackage| (#1=#:G266)
  (PROG ()
    (RETURN
     (PROG (#2=#:G267)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|RadicalSolvePackage|)
                                           '|domainEqualList|)
                . #3=(|RadicalSolvePackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|RadicalSolvePackage;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|RadicalSolvePackage|))))))))))) 

(DEFUN |RadicalSolvePackage;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|RadicalSolvePackage|))
      (LETT |dv$| (LIST '|RadicalSolvePackage| DV$1) . #1#)
      (LETT $ (GETREFV 116) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|RadicalSolvePackage| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 NIL)
      (QSETREFV $ 8 'NIL)
      $)))) 

(MAKEPROP '|RadicalSolvePackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|SideEquations|
              '|ContractSoln| (0 . |Zero|) (|Equation| 12) (4 . |Zero|)
              (|Expression| 6) (8 . |Zero|) (|Boolean|) (12 . =) (|Symbol|)
              (18 . |new|) (|Polynomial| 6) (22 . |coerce|) (|Fraction| 18)
              (27 . |coerce|) (32 . |coerce|) (37 . =) (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 18) (43 . |coefficient|) (49 . -)
              (54 . |coerce|) (59 . |One|) (63 . |One|) (67 . /)
              (|SparseUnivariatePolynomial| 12) (|Mapping| 12 18)
              (|SparseUnivariatePolynomialFunctions2| 18 12) (73 . |map|)
              (|List| 12) (|PolynomialSolveByFormulas| 32 12)
              (79 . |quadratic|) (84 . |cubic|) (89 . |quartic|) (|Integer|)
              (94 . |coerce|) |SOLVERAD;radicalRoots;FSL;21|
              (|SparseUnivariatePolynomial| $) (99 . |univariate|) (105 . -)
              (110 . |leadingCoefficient|) (|Kernel| 12) (115 . |kernel|)
              (|Kernel| $) (120 . |eval|) (127 . ~=) (|List| 50) (|List| $)
              (133 . |eval|) (140 . |coerce|) (145 . |equation|) (|List| 10)
              |SOLVERAD;radicalSolve;FSL;10| (151 . |zero?|) (156 . |numer|)
              (|List| 16) (161 . |variables|) (166 . |denom|) (171 . |concat|)
              (177 . |removeDuplicates|) (182 . >)
              |SOLVERAD;radicalSolve;FL;11| (|Equation| 20) (188 . |lhs|)
              (193 . |rhs|) (198 . -) |SOLVERAD;radicalSolve;EL;12|
              |SOLVERAD;radicalSolve;ESL;13| (|List| 79) (|List| 20)
              (|SystemSolvePackage| 6) (204 . |triangularSystems|) (|List| 18)
              (210 . |list|) (215 . =) (221 . ~=) (227 . |position|)
              (233 . |delete|) (|List| 36) |SOLVERAD;radicalRoots;LLL;14|
              (|List| 58) |SOLVERAD;radicalSolve;LLL;15| (239 . |setUnion|)
              |SOLVERAD;radicalSolve;LL;16| (|List| 69)
              |SOLVERAD;radicalSolve;LLL;17| |SOLVERAD;radicalSolve;LL;18|
              (|SuchThat| 36 58) |SOLVERAD;contractSolve;ESSt;19|
              |SOLVERAD;contractSolve;FSSt;20| (245 . |lhs|) (250 . |degree|)
              (256 . =) (262 . |list|) (|Factored| 18)
              (|MultivariateFactorize| 16 (|IndexedExponents| 16) 6 18)
              (267 . |factor|) (|Record| (|:| |factor| 18) (|:| |exponent| 41))
              (|List| 104) (272 . |factors|) (277 . |member?|)
              (|Record| (|:| |pol| 25) (|:| |deg| 112))
              (|DegreeReductionPackage| 18 6) (283 . |reduce|) (288 . |degree|)
              (|PositiveInteger|) (293 . >) (299 . |expand|)
              (305 . |construct|))
           '#(|radicalSolve| 311 |radicalRoots| 355 |contractSolve| 367) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 115
                                                 '(0 6 0 9 0 10 0 11 0 12 0 13
                                                   2 12 14 0 0 15 0 16 0 17 1
                                                   18 0 16 19 1 20 0 18 21 1 12
                                                   0 20 22 2 10 0 12 12 23 2 25
                                                   18 0 24 26 1 18 0 0 27 1 12
                                                   0 18 28 0 6 0 29 0 10 0 30 2
                                                   12 0 0 0 31 2 34 32 33 25 35
                                                   1 37 36 32 38 1 37 36 32 39
                                                   1 37 36 32 40 1 12 0 41 42 2
                                                   18 44 0 16 45 1 12 0 0 46 1
                                                   25 18 0 47 1 48 0 16 49 3 12
                                                   0 0 50 0 51 2 36 14 0 0 52 3
                                                   12 0 0 53 54 55 1 12 0 16 56
                                                   2 10 0 12 12 57 1 20 14 0 60
                                                   1 20 18 0 61 1 18 62 0 63 1
                                                   20 18 0 64 2 62 0 0 0 65 1
                                                   62 0 0 66 2 24 14 0 0 67 1
                                                   69 20 0 70 1 69 20 0 71 2 20
                                                   0 0 0 72 2 77 75 76 62 78 1
                                                   75 0 79 80 2 75 14 0 0 81 2
                                                   75 14 0 0 82 2 75 41 79 0 83
                                                   2 75 0 0 41 84 2 62 0 0 0 89
                                                   1 94 36 0 97 2 18 24 0 16 98
                                                   2 85 14 0 0 99 1 85 0 36 100
                                                   1 102 101 18 103 1 101 105 0
                                                   106 2 62 14 16 0 107 1 109
                                                   108 25 110 1 25 24 0 111 2
                                                   112 14 0 0 113 2 109 36 12
                                                   112 114 2 94 0 36 58 115 2 0
                                                   58 20 16 59 2 0 58 69 16 74
                                                   1 0 58 20 68 1 0 58 69 73 1
                                                   0 87 76 90 2 0 87 76 62 88 2
                                                   0 87 91 62 92 1 0 87 91 93 2
                                                   0 36 20 16 43 2 0 85 76 62
                                                   86 2 0 94 20 16 96 2 0 94 69
                                                   16 95)))))
           '|lookupComplete|)) 
