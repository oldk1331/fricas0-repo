
(DEFUN |TESTCNT;testsuite;SV;1| (|s| $)
  (SEQ (SPADCALL "clear all" (QREFELT $ 19))
       (EXIT (SPADCALL |s| (QREFELT $ 20))))) 

(DEFUN |TESTCNT;testsuiteNoClear;SV;2| (|s| $)
  (SEQ
   (COND
    ((SPADCALL (QCSIZE |s|) 15 (QREFELT $ 24))
     (SPADCALL
      (SPADCALL "WARNING: string for testsuite should have less then "
                "15 characters!" (QREFELT $ 25))
      (QREFELT $ 27))))
   (SETELT $ 15 |s|)
   (EXIT
    (SPADCALL (CONS (QREFELT $ 15) (SPADCALL (QREFELT $ 29))) (QREFELT $ 12)
              (QREFELT $ 31))))) 

(DEFUN |TESTCNT;testcaseNoClear;SV;3| (|s| $)
  (SEQ
   (COND
    ((SPADCALL (QCSIZE |s|) (- (QREFELT $ 6) (QCSIZE "  Testcase: "))
               (QREFELT $ 33))
     (SPADCALL
      (SPADCALL "WARNING: string for testcase should have less then "
                (SPADCALL
                 (STRINGIMAGE (- (QREFELT $ 6) (QCSIZE "  Testcase: ")))
                 " characters!" (QREFELT $ 25))
                (QREFELT $ 25))
      (QREFELT $ 27))))
   (SETELT $ 14 |s|)
   (EXIT
    (SPADCALL (CONS (QREFELT $ 14) (VECTOR 0 0 0 0 NIL NIL NIL))
              (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
              (QREFELT $ 36))))) 

(DEFUN |TESTCNT;testcase;SV;4| (|s| $)
  (SEQ (SPADCALL "clear all" (QREFELT $ 19))
       (EXIT (SPADCALL |s| (QREFELT $ 37))))) 

(DEFUN |TESTCNT;incPass;V;5| ($)
  (PROG (|cur|)
    (RETURN
     (SEQ
      (LETT |cur|
            (SPADCALL (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
                      (QREFELT $ 14) (QREFELT $ 39))
            |TESTCNT;incPass;V;5|)
      (EXIT (QSETVELT |cur| 0 (+ (QVELT |cur| 0) 1))))))) 

(DEFUN |TESTCNT;chkLibraryError;V;6| ($)
  (PROG (|cur|)
    (RETURN
     (SEQ
      (LETT |cur|
            (SPADCALL (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
                      (QREFELT $ 14) (QREFELT $ 39))
            |TESTCNT;chkLibraryError;V;6|)
      (EXIT (QSETVELT |cur| 0 (+ (QVELT |cur| 0) 1))))))) 

(DEFUN |TESTCNT;incLibraryError;SLV;7| (|inp| |out| $)
  (PROG (|cur|)
    (RETURN
     (SEQ
      (LETT |cur|
            (SPADCALL (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
                      (QREFELT $ 14) (QREFELT $ 39))
            |TESTCNT;incLibraryError;SLV;7|)
      (QSETVELT |cur| 1 (+ (QVELT |cur| 1) 1))
      (EXIT
       (QSETVELT |cur| 6
                 (CONS (VECTOR (QVELT |cur| 0) |inp| |out|)
                       (QVELT |cur| 6)))))))) 

(DEFUN |TESTCNT;incXfLibraryError;SLV;8| (|inp| |out| $)
  (PROG (|cur|)
    (RETURN
     (SEQ
      (LETT |cur|
            (SPADCALL (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
                      (QREFELT $ 14) (QREFELT $ 39))
            |TESTCNT;incXfLibraryError;SLV;8|)
      (EXIT (QSETVELT |cur| 2 (+ (QVELT |cur| 2) 1))))))) 

(DEFUN |TESTCNT;incXfFail;V;9| ($)
  (PROG (|cur|)
    (RETURN
     (SEQ
      (LETT |cur|
            (SPADCALL (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
                      (QREFELT $ 14) (QREFELT $ 39))
            |TESTCNT;incXfFail;V;9|)
      (QSETVELT |cur| 2 (+ (QVELT |cur| 2) 1))
      (EXIT (QSETVELT |cur| 0 (+ (QVELT |cur| 0) 1))))))) 

(DEFUN |TESTCNT;incFail;SLV;10| (|inp| |out| $)
  (PROG (|cur|)
    (RETURN
     (SEQ
      (LETT |cur|
            (SPADCALL (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
                      (QREFELT $ 14) (QREFELT $ 39))
            |TESTCNT;incFail;SLV;10|)
      (QSETVELT |cur| 1 (+ (QVELT |cur| 1) 1))
      (QSETVELT |cur| 6
                (CONS (VECTOR (QVELT |cur| 0) |inp| |out|) (QVELT |cur| 6)))
      (EXIT (QSETVELT |cur| 0 (+ (QVELT |cur| 0) 1))))))) 

(DEFUN |TESTCNT;incXfPass;SLV;11| (|inp| |out| $)
  (PROG (|cur|)
    (RETURN
     (SEQ
      (LETT |cur|
            (SPADCALL (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
                      (QREFELT $ 14) (QREFELT $ 39))
            |TESTCNT;incXfPass;SLV;11|)
      (QSETVELT |cur| 3 (+ (QVELT |cur| 3) 1))
      (QSETVELT |cur| 5
                (CONS (VECTOR (QVELT |cur| 0) |inp| |out|) (QVELT |cur| 5)))
      (EXIT (QSETVELT |cur| 0 (+ (QVELT |cur| 0) 1))))))) 

(DEFUN |TESTCNT;decXfPass;V;12| ($)
  (PROG (|cur|)
    (RETURN
     (SEQ
      (LETT |cur|
            (SPADCALL (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
                      (QREFELT $ 14) (QREFELT $ 39))
            |TESTCNT;decXfPass;V;12|)
      (QSETVELT |cur| 0 (- (QVELT |cur| 0) 1))
      (QSETVELT |cur| 5 (CDR (QVELT |cur| 5)))
      (EXIT (QSETVELT |cur| 3 (- (QVELT |cur| 3) 1))))))) 

(DEFUN |TESTCNT;incFatal;SV;13| (|inp| $)
  (PROG (|cur|)
    (RETURN
     (SEQ
      (LETT |cur|
            (SPADCALL (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
                      (QREFELT $ 14) (QREFELT $ 39))
            |TESTCNT;incFatal;SV;13|)
      (QSETVELT |cur| 0 (+ (QVELT |cur| 0) 1))
      (QSETVELT |cur| 1 (+ (QVELT |cur| 1) 1))
      (EXIT
       (QSETVELT |cur| 4
                 (CONS (CONS (QVELT |cur| 0) |inp|) (QVELT |cur| 4)))))))) 

(DEFUN |TESTCNT;decFatal;V;14| ($)
  (PROG (|cur|)
    (RETURN
     (SEQ
      (LETT |cur|
            (SPADCALL (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
                      (QREFELT $ 14) (QREFELT $ 39))
            |TESTCNT;decFatal;V;14|)
      (QSETVELT |cur| 0 (- (QVELT |cur| 0) 1))
      (QSETVELT |cur| 1 (- (QVELT |cur| 1) 1))
      (EXIT (QSETVELT |cur| 4 (CDR (QVELT |cur| 4)))))))) 

(DEFUN |TESTCNT;incXfFatal;SV;15| (|inp| $)
  (PROG (|cur|)
    (RETURN
     (SEQ
      (LETT |cur|
            (SPADCALL (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
                      (QREFELT $ 14) (QREFELT $ 39))
            |TESTCNT;incXfFatal;SV;15|)
      (QSETVELT |cur| 0 (+ (QVELT |cur| 0) 1))
      (EXIT (QSETVELT |cur| 2 (+ (QVELT |cur| 2) 1))))))) 

(DEFUN |TESTCNT;decXfFatal;V;16| ($)
  (PROG (|cur|)
    (RETURN
     (SEQ
      (LETT |cur|
            (SPADCALL (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
                      (QREFELT $ 14) (QREFELT $ 39))
            |TESTCNT;decXfFatal;V;16|)
      (QSETVELT |cur| 0 (- (QVELT |cur| 0) 1))
      (EXIT (QSETVELT |cur| 2 (- (QVELT |cur| 2) 1))))))) 

(DEFUN |TESTCNT;addWarning;OfV;17| (|s| $)
  (PROG (|idx|)
    (RETURN
     (SEQ
      (LETT |idx|
            (QVELT
             (SPADCALL (SPADCALL (QREFELT $ 12) (QREFELT $ 15) (QREFELT $ 34))
                       (QREFELT $ 14) (QREFELT $ 39))
             0)
            |TESTCNT;addWarning;OfV;17|)
      (EXIT
       (SETELT $ 13
               (CONS
                (SPADCALL
                 (LIST
                  (SPADCALL
                   (SPADCALL "Testsuite: " (QREFELT $ 15) (QREFELT $ 25))
                   (QREFELT $ 53))
                  (SPADCALL
                   (SPADCALL "Testcase: " (QREFELT $ 14) (QREFELT $ 25))
                   (QREFELT $ 53))
                  (SPADCALL
                   (SPADCALL "test: " (STRINGIMAGE |idx|) (QREFELT $ 25))
                   (QREFELT $ 53))
                  |s|)
                 (QREFELT $ 55))
                (QREFELT $ 13)))))))) 

(DEFUN |TESTCNT;statistics;V;18| ($)
  (PROG (#1=#:G237 #2=#:G233 #3=#:G229 #4=#:G225 #5=#:G221 |stotalTests|
         |sfailedTests| |stotalCases| |sfailedCases| |tsfailedTests|
         |tstotalTests| |failedCases| |totalCases| #6=#:G253 |tstcase|
         #7=#:G252 |tstsuite| #8=#:G251 |f| #9=#:G204 #10=#:G250 #11=#:G249
         |outstring| #12=#:G247 |o| #13=#:G248 |i| #14=#:G246 #15=#:G188
         #16=#:G245 |xfpassedTests| |xfailedTests| |failedTests| |totalTests|
         |xfpassedCases| #17=#:G244 #18=#:G243 #19=#:G242 |w|)
    (RETURN
     (SEQ
      (SPADCALL (|make_full_CVEC| (QREFELT $ 6) (|STR_to_CHAR| "="))
                (QREFELT $ 27))
      (SPADCALL "General WARNINGS:" (QREFELT $ 27))
      (SPADCALL
       (SPADCALL "* do not use ')clear completely' before having used "
                 "'statistics()'" (QREFELT $ 25))
       (QREFELT $ 27))
      (SPADCALL "  It clears the statistics without warning!" (QREFELT $ 27))
      (SPADCALL
       (SPADCALL "* do not forget to pass the arguments of the testXxxx "
                 "functions as Strings!" (QREFELT $ 25))
       (QREFELT $ 27))
      (SPADCALL
       (SPADCALL "  Otherwise, the test will fail and statistics() will "
                 "not notice!" (QREFELT $ 25))
       (QREFELT $ 27))
      (SPADCALL
       (SPADCALL "* testLibraryError does not prevent FriCAS from "
                 "aborting the current block." (QREFELT $ 25))
       (QREFELT $ 27))
      (SPADCALL
       (SPADCALL "  Thus, if a block contains other test functions, they "
                 "will not be executed" (QREFELT $ 25))
       (QREFELT $ 27))
      (SPADCALL "  and statistics() will not notice!" (QREFELT $ 27))
      (COND
       ((SPADCALL (LENGTH (QREFELT $ 13)) 0 (QREFELT $ 24))
        (SEQ
         (SPADCALL (|make_full_CVEC| (QREFELT $ 6) (|STR_to_CHAR| "="))
                   (QREFELT $ 27))
         (SPADCALL "WARNINGS:" (QREFELT $ 27))
         (EXIT
          (SEQ (LETT |w| NIL . #20=(|TESTCNT;statistics;V;18|))
               (LETT #19# (REVERSE (QREFELT $ 13)) . #20#) G190
               (COND
                ((OR (ATOM #19#) (PROGN (LETT |w| (CAR #19#) . #20#) NIL))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |w| (QREFELT $ 58))))
               (LETT #19# (CDR #19#) . #20#) (GO G190) G191 (EXIT NIL))))))
      (SPADCALL "" (QREFELT $ 59)) (LETT |totalTests| 0 . #20#)
      (LETT |failedTests| 0 . #20#) (LETT |xfailedTests| 0 . #20#)
      (LETT |xfpassedTests| 0 . #20#)
      (SEQ (LETT |tstsuite| NIL . #20#)
           (LETT #18# (REVERSE (SPADCALL (QREFELT $ 12) (QREFELT $ 61)))
                 . #20#)
           G190
           (COND
            ((OR (ATOM #18#) (PROGN (LETT |tstsuite| (CAR #18#) . #20#) NIL))
             (GO G191)))
           (SEQ (LETT |failedCases| 0 . #20#) (LETT |xfpassedCases| 0 . #20#)
                (LETT |totalCases| 0 . #20#)
                (SEQ (LETT |tstcase| NIL . #20#)
                     (LETT #17#
                           (REVERSE
                            (SPADCALL (QCDR |tstsuite|) (QREFELT $ 63)))
                           . #20#)
                     G190
                     (COND
                      ((OR (ATOM #17#)
                           (PROGN (LETT |tstcase| (CAR #17#) . #20#) NIL))
                       (GO G191)))
                     (SEQ (LETT |totalCases| (+ |totalCases| 1) . #20#)
                          (COND
                           ((SPADCALL (QVELT (QCDR |tstcase|) 1) 0
                                      (QREFELT $ 33))
                            (LETT |failedCases| (+ |failedCases| 1) . #20#)))
                          (COND
                           ((SPADCALL (QVELT (QCDR |tstcase|) 3) 0
                                      (QREFELT $ 33))
                            (LETT |xfpassedCases| (+ |xfpassedCases| 1)
                                  . #20#)))
                          (LETT |totalTests|
                                (+ |totalTests| (QVELT (QCDR |tstcase|) 0))
                                . #20#)
                          (LETT |failedTests|
                                (+ |failedTests| (QVELT (QCDR |tstcase|) 1))
                                . #20#)
                          (LETT |xfailedTests|
                                (+ |xfailedTests| (QVELT (QCDR |tstcase|) 2))
                                . #20#)
                          (EXIT
                           (LETT |xfpassedTests|
                                 (+ |xfpassedTests| (QVELT (QCDR |tstcase|) 3))
                                 . #20#)))
                     (LETT #17# (CDR #17#) . #20#) (GO G190) G191 (EXIT NIL))
                (SPADCALL (|make_full_CVEC| (QREFELT $ 6) (|STR_to_CHAR| "="))
                          (QREFELT $ 27))
                (SPADCALL
                 (SPADCALL "Testsuite: " (QCAR |tstsuite|) (QREFELT $ 25))
                 (QREFELT $ 27))
                (SPADCALL
                 (SPADCALL "  failed (total): "
                           (SPADCALL (STRINGIMAGE |failedCases|)
                                     (SPADCALL " ("
                                               (SPADCALL
                                                (STRINGIMAGE |totalCases|) ")"
                                                (QREFELT $ 25))
                                               (QREFELT $ 25))
                                     (QREFELT $ 25))
                           (QREFELT $ 25))
                 (QREFELT $ 27))
                (COND
                 ((SPADCALL |failedCases| 0 (QREFELT $ 33))
                  (SEQ (SPADCALL "" (QREFELT $ 59))
                       (SPADCALL "  failed testcases were:" (QREFELT $ 27))
                       (EXIT
                        (SEQ (LETT |tstcase| NIL . #20#)
                             (LETT #16#
                                   (REVERSE
                                    (SPADCALL (QCDR |tstsuite|)
                                              (QREFELT $ 63)))
                                   . #20#)
                             G190
                             (COND
                              ((OR (ATOM #16#)
                                   (PROGN
                                    (LETT |tstcase| (CAR #16#) . #20#)
                                    NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL (QVELT (QCDR |tstcase|) 1) 0
                                           (QREFELT $ 33))
                                 (SEQ
                                  (SPADCALL
                                   (SPADCALL "  "
                                             (|make_full_CVEC|
                                              (PROG1
                                                  (LETT #15#
                                                        (- (QREFELT $ 6) 2)
                                                        . #20#)
                                                (|check_subtype| (>= #15# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 #15#))
                                              (|STR_to_CHAR| "-"))
                                             (QREFELT $ 25))
                                   (QREFELT $ 27))
                                  (SPADCALL
                                   (SPADCALL "  Testcase: " (QCAR |tstcase|)
                                             (QREFELT $ 25))
                                   (QREFELT $ 27))
                                  (SPADCALL
                                   (SPADCALL "    failed (total): "
                                             (SPADCALL
                                              (STRINGIMAGE
                                               (QVELT (QCDR |tstcase|) 1))
                                              (SPADCALL " ("
                                                        (SPADCALL
                                                         (STRINGIMAGE
                                                          (QVELT
                                                           (QCDR |tstcase|) 0))
                                                         ")" (QREFELT $ 25))
                                                        (QREFELT $ 25))
                                              (QREFELT $ 25))
                                             (QREFELT $ 25))
                                   (QREFELT $ 27))
                                  (COND
                                   ((NULL (NULL (QVELT (QCDR |tstcase|) 6)))
                                    (SEQ (SPADCALL "" (QREFELT $ 59))
                                         (SPADCALL "    failed tests were:"
                                                   (QREFELT $ 27))
                                         (EXIT
                                          (SEQ (LETT |f| NIL . #20#)
                                               (LETT #14#
                                                     (REVERSE
                                                      (QVELT (QCDR |tstcase|)
                                                             6))
                                                     . #20#)
                                               G190
                                               (COND
                                                ((OR (ATOM #14#)
                                                     (PROGN
                                                      (LETT |f| (CAR #14#)
                                                            . #20#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (SPADCALL "" (QREFELT $ 59))
                                                (SPADCALL
                                                 (SPADCALL "      "
                                                           (SPADCALL
                                                            (STRINGIMAGE
                                                             (QVELT |f| 0))
                                                            (SPADCALL ": "
                                                                      (QVELT
                                                                       |f| 1)
                                                                      (QREFELT
                                                                       $ 25))
                                                            (QREFELT $ 25))
                                                           (QREFELT $ 25))
                                                 (QREFELT $ 27))
                                                (EXIT
                                                 (SEQ (LETT |i| 1 . #20#)
                                                      (LETT #13#
                                                            (LENGTH
                                                             (QVELT |f| 2))
                                                            . #20#)
                                                      (LETT |o| NIL . #20#)
                                                      (LETT #12# (QVELT |f| 2)
                                                            . #20#)
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #12#)
                                                            (PROGN
                                                             (LETT |o|
                                                                   (CAR #12#)
                                                                   . #20#)
                                                             NIL)
                                                            (|greater_SI| |i|
                                                                          #13#))
                                                        (GO G191)))
                                                      (SEQ
                                                       (LETT |outstring|
                                                             (SPADCALL
                                                              "      Output"
                                                              (SPADCALL
                                                               (STRINGIMAGE
                                                                |i|)
                                                               ": "
                                                               (QREFELT $ 25))
                                                              (QREFELT $ 25))
                                                             . #20#)
                                                       (EXIT
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (SPADCALL |outstring|
                                                                    (QREFELT $
                                                                             53))
                                                          |o| (QREFELT $ 64))
                                                         (QREFELT $ 58))))
                                                      (LETT #12#
                                                            (PROG1 (CDR #12#)
                                                              (LETT |i|
                                                                    (|inc_SI|
                                                                     |i|)
                                                                    . #20#))
                                                            . #20#)
                                                      (GO G190) G191
                                                      (EXIT NIL))))
                                               (LETT #14# (CDR #14#) . #20#)
                                               (GO G190) G191 (EXIT NIL))))))
                                  (EXIT
                                   (COND
                                    ((NULL (NULL (QVELT (QCDR |tstcase|) 4)))
                                     (SEQ (SPADCALL "" (QREFELT $ 59))
                                          (SPADCALL "  fatal tests were:"
                                                    (QREFELT $ 27))
                                          (EXIT
                                           (SEQ (LETT |f| NIL . #20#)
                                                (LETT #11#
                                                      (REVERSE
                                                       (QVELT (QCDR |tstcase|)
                                                              4))
                                                      . #20#)
                                                G190
                                                (COND
                                                 ((OR (ATOM #11#)
                                                      (PROGN
                                                       (LETT |f| (CAR #11#)
                                                             . #20#)
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (SPADCALL "" (QREFELT $ 59))
                                                 (EXIT
                                                  (SPADCALL
                                                   (SPADCALL "      "
                                                             (SPADCALL
                                                              (STRINGIMAGE
                                                               (QCAR |f|))
                                                              (SPADCALL ": "
                                                                        (QCDR
                                                                         |f|)
                                                                        (QREFELT
                                                                         $ 25))
                                                              (QREFELT $ 25))
                                                             (QREFELT $ 25))
                                                   (QREFELT $ 27))))
                                                (LETT #11# (CDR #11#) . #20#)
                                                (GO G190) G191
                                                (EXIT NIL))))))))))))
                             (LETT #16# (CDR #16#) . #20#) (GO G190) G191
                             (EXIT NIL))))))
                (EXIT
                 (COND
                  ((SPADCALL |xfpassedCases| 0 (QREFELT $ 33))
                   (SEQ (SPADCALL "" (QREFELT $ 59))
                        (SPADCALL
                         "  testcases with unexpected passed tests were:"
                         (QREFELT $ 27))
                        (EXIT
                         (SEQ (LETT |tstcase| NIL . #20#)
                              (LETT #10#
                                    (REVERSE
                                     (SPADCALL (QCDR |tstsuite|)
                                               (QREFELT $ 63)))
                                    . #20#)
                              G190
                              (COND
                               ((OR (ATOM #10#)
                                    (PROGN
                                     (LETT |tstcase| (CAR #10#) . #20#)
                                     NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL (QVELT (QCDR |tstcase|) 3) 0
                                            (QREFELT $ 33))
                                  (SEQ
                                   (SPADCALL
                                    (SPADCALL "  "
                                              (|make_full_CVEC|
                                               (PROG1
                                                   (LETT #9#
                                                         (- (QREFELT $ 6) 2)
                                                         . #20#)
                                                 (|check_subtype| (>= #9# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  #9#))
                                               (|STR_to_CHAR| "-"))
                                              (QREFELT $ 25))
                                    (QREFELT $ 27))
                                   (SPADCALL
                                    (SPADCALL "  Testcase: " (QCAR |tstcase|)
                                              (QREFELT $ 25))
                                    (QREFELT $ 27))
                                   (EXIT
                                    (COND
                                     ((NULL (NULL (QVELT (QCDR |tstcase|) 5)))
                                      (SEQ (SPADCALL "" (QREFELT $ 59))
                                           (SPADCALL
                                            "  unexpected passed tests were:"
                                            (QREFELT $ 27))
                                           (EXIT
                                            (SEQ (LETT |f| NIL . #20#)
                                                 (LETT #8#
                                                       (REVERSE
                                                        (QVELT (QCDR |tstcase|)
                                                               5))
                                                       . #20#)
                                                 G190
                                                 (COND
                                                  ((OR (ATOM #8#)
                                                       (PROGN
                                                        (LETT |f| (CAR #8#)
                                                              . #20#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (SPADCALL "" (QREFELT $ 59))
                                                  (EXIT
                                                   (SPADCALL
                                                    (SPADCALL "      "
                                                              (SPADCALL
                                                               (STRINGIMAGE
                                                                (QVELT |f| 0))
                                                               (SPADCALL ": "
                                                                         (QVELT
                                                                          |f|
                                                                          1)
                                                                         (QREFELT
                                                                          $
                                                                          25))
                                                               (QREFELT $ 25))
                                                              (QREFELT $ 25))
                                                    (QREFELT $ 27))))
                                                 (LETT #8# (CDR #8#) . #20#)
                                                 (GO G190) G191
                                                 (EXIT NIL))))))))))))
                              (LETT #10# (CDR #10#) . #20#) (GO G190) G191
                              (EXIT NIL))))))))
           (LETT #18# (CDR #18#) . #20#) (GO G190) G191 (EXIT NIL))
      (SPADCALL "" (QREFELT $ 59))
      (SPADCALL (|make_full_CVEC| (QREFELT $ 6) (|STR_to_CHAR| "="))
                (QREFELT $ 27))
      (SPADCALL "testsuite | testcases: failed (total) | tests: failed (total)"
                (QREFELT $ 27))
      (SEQ (LETT |tstsuite| NIL . #20#)
           (LETT #7# (REVERSE (SPADCALL (QREFELT $ 12) (QREFELT $ 61))) . #20#)
           G190
           (COND
            ((OR (ATOM #7#) (PROGN (LETT |tstsuite| (CAR #7#) . #20#) NIL))
             (GO G191)))
           (SEQ (LETT |failedCases| 0 . #20#) (LETT |totalCases| 0 . #20#)
                (LETT |tsfailedTests| 0 . #20#) (LETT |tstotalTests| 0 . #20#)
                (SEQ (LETT |tstcase| NIL . #20#)
                     (LETT #6#
                           (REVERSE
                            (SPADCALL (QCDR |tstsuite|) (QREFELT $ 63)))
                           . #20#)
                     G190
                     (COND
                      ((OR (ATOM #6#)
                           (PROGN (LETT |tstcase| (CAR #6#) . #20#) NIL))
                       (GO G191)))
                     (SEQ (LETT |totalCases| (+ |totalCases| 1) . #20#)
                          (COND
                           ((SPADCALL (QVELT (QCDR |tstcase|) 1) 0
                                      (QREFELT $ 33))
                            (LETT |failedCases| (+ |failedCases| 1) . #20#)))
                          (LETT |tstotalTests|
                                (+ |tstotalTests| (QVELT (QCDR |tstcase|) 0))
                                . #20#)
                          (EXIT
                           (LETT |tsfailedTests|
                                 (+ |tsfailedTests| (QVELT (QCDR |tstcase|) 1))
                                 . #20#)))
                     (LETT #6# (CDR #6#) . #20#) (GO G190) G191 (EXIT NIL))
                (LETT |sfailedCases| (STRINGIMAGE |failedCases|) . #20#)
                (LETT |stotalCases| (STRINGIMAGE |totalCases|) . #20#)
                (LETT |sfailedTests| (STRINGIMAGE |tsfailedTests|) . #20#)
                (LETT |stotalTests| (STRINGIMAGE |tstotalTests|) . #20#)
                (EXIT
                 (SPADCALL
                  (SPADCALL (QCAR |tstsuite|)
                            (SPADCALL
                             (|make_full_CVEC|
                              (PROG1
                                  (LETT #5#
                                        (MAX (- 24 (QCSIZE (QCAR |tstsuite|)))
                                             0)
                                        . #20#)
                                (|check_subtype| (>= #5# 0)
                                                 '(|NonNegativeInteger|) #5#))
                              (|STR_to_CHAR| " "))
                             (SPADCALL
                              (|make_full_CVEC|
                               (PROG1
                                   (LETT #4#
                                         (MAX (- 5 (QCSIZE |sfailedCases|)) 0)
                                         . #20#)
                                 (|check_subtype| (>= #4# 0)
                                                  '(|NonNegativeInteger|) #4#))
                               (|STR_to_CHAR| " "))
                              (SPADCALL |sfailedCases|
                                        (SPADCALL
                                         (|make_full_CVEC|
                                          (PROG1
                                              (LETT #3#
                                                    (MAX
                                                     (- 6
                                                        (QCSIZE |stotalCases|))
                                                     0)
                                                    . #20#)
                                            (|check_subtype| (>= #3# 0)
                                                             '(|NonNegativeInteger|)
                                                             #3#))
                                          (|STR_to_CHAR| " "))
                                         (SPADCALL "("
                                                   (SPADCALL |stotalCases|
                                                             (SPADCALL ")"
                                                                       (SPADCALL
                                                                        (|make_full_CVEC|
                                                                         (PROG1
                                                                             (LETT
                                                                              #2#
                                                                              (MAX
                                                                               (-
                                                                                16
                                                                                (QCSIZE
                                                                                 |sfailedTests|))
                                                                               0)
                                                                              . #20#)
                                                                           (|check_subtype|
                                                                            (>=
                                                                             #2#
                                                                             0)
                                                                            '(|NonNegativeInteger|)
                                                                            #2#))
                                                                         (|STR_to_CHAR|
                                                                          " "))
                                                                        (SPADCALL
                                                                         |sfailedTests|
                                                                         (SPADCALL
                                                                          (|make_full_CVEC|
                                                                           (PROG1
                                                                               (LETT
                                                                                #1#
                                                                                (MAX
                                                                                 (-
                                                                                  6
                                                                                  (QCSIZE
                                                                                   |stotalTests|))
                                                                                 0)
                                                                                . #20#)
                                                                             (|check_subtype|
                                                                              (>=
                                                                               #1#
                                                                               0)
                                                                              '(|NonNegativeInteger|)
                                                                              #1#))
                                                                           (|STR_to_CHAR|
                                                                            " "))
                                                                          (SPADCALL
                                                                           "("
                                                                           (SPADCALL
                                                                            |stotalTests|
                                                                            ")"
                                                                            (QREFELT
                                                                             $
                                                                             25))
                                                                           (QREFELT
                                                                            $
                                                                            25))
                                                                          (QREFELT
                                                                           $
                                                                           25))
                                                                         (QREFELT
                                                                          $
                                                                          25))
                                                                        (QREFELT
                                                                         $ 25))
                                                                       (QREFELT
                                                                        $ 25))
                                                             (QREFELT $ 25))
                                                   (QREFELT $ 25))
                                         (QREFELT $ 25))
                                        (QREFELT $ 25))
                              (QREFELT $ 25))
                             (QREFELT $ 25))
                            (QREFELT $ 25))
                  (QREFELT $ 27))))
           (LETT #7# (CDR #7#) . #20#) (GO G190) G191 (EXIT NIL))
      (SPADCALL (|make_full_CVEC| (QREFELT $ 6) (|STR_to_CHAR| "="))
                (QREFELT $ 27))
      (SPADCALL "File summary." (QREFELT $ 27))
      (SPADCALL
       (SPADCALL "unexpected failures: " (STRINGIMAGE |failedTests|)
                 (QREFELT $ 25))
       (QREFELT $ 27))
      (SPADCALL
       (SPADCALL "expected failures: " (STRINGIMAGE |xfailedTests|)
                 (QREFELT $ 25))
       (QREFELT $ 27))
      (SPADCALL
       (SPADCALL "unexpected passes: " (STRINGIMAGE |xfpassedTests|)
                 (QREFELT $ 25))
       (QREFELT $ 27))
      (EXIT
       (SPADCALL
        (SPADCALL "total tests: " (STRINGIMAGE |totalTests|) (QREFELT $ 25))
        (QREFELT $ 27))))))) 

(DECLAIM (NOTINLINE |UnittestCount;|)) 

(DEFUN |UnittestCount| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G255)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|UnittestCount|)
                . #2=(|UnittestCount|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|UnittestCount|
                         (LIST (CONS NIL (CONS 1 (|UnittestCount;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#) (HREM |$ConstructorCache| '|UnittestCount|))))))))))) 

(DEFUN |UnittestCount;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|UnittestCount|) . #1=(|UnittestCount|))
      (LETT $ (GETREFV 66) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|UnittestCount| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6 77)
      (QSETREFV $ 12 (SPADCALL (QREFELT $ 11)))
      (QSETREFV $ 13 NIL)
      (QSETREFV $ 14 #2="")
      (QSETREFV $ 15 #2#)
      $)))) 

(MAKEPROP '|UnittestCount| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|maxWidth|
              (|Record| (|:| |index| 32) (|:| |input| 17))
              (|Record| (|:| |index| 32) (|:| |input| 17) (|:| |output| 42))
              (|Record| (|:| |total| 32) (|:| |fail| 32) (|:| |xfail| 32)
                        (|:| |xfpass| 32) (|:| |fatalities| (|List| 7))
                        (|:| |xfpassed| (|List| 8)) (|:| |failed| (|List| 8)))
              (|AssociationList| 17 28) (0 . |empty|) '|tests| '|warnings|
              '|currentTestcase| '|currentTestsuite| (|Void|) (|String|)
              (|MoreSystemCommands|) (4 . |systemCommand|)
              |TESTCNT;testsuiteNoClear;SV;2| |TESTCNT;testsuite;SV;1|
              (|Boolean|) (|NonNegativeInteger|) (9 . >) (15 . |elt|)
              (|OutputForm|) (21 . |messagePrint|) (|AssociationList| 17 9)
              (26 . |empty|) (|Record| (|:| |key| 17) (|:| |entry| 28))
              (30 . |insert!|) (|Integer|) (36 . >) (42 . |elt|)
              (|Record| (|:| |key| 17) (|:| |entry| 9)) (48 . |insert!|)
              |TESTCNT;testcaseNoClear;SV;3| |TESTCNT;testcase;SV;4|
              (54 . |elt|) |TESTCNT;incPass;V;5| |TESTCNT;chkLibraryError;V;6|
              (|List| 26) |TESTCNT;incLibraryError;SLV;7|
              |TESTCNT;incXfLibraryError;SLV;8| |TESTCNT;incXfFail;V;9|
              |TESTCNT;incFail;SLV;10| |TESTCNT;incXfPass;SLV;11|
              |TESTCNT;decXfPass;V;12| |TESTCNT;incFatal;SV;13|
              |TESTCNT;decFatal;V;14| |TESTCNT;incXfFatal;SV;15|
              |TESTCNT;decXfFatal;V;16| (60 . |message|) (|List| $)
              (65 . |pile|) |TESTCNT;addWarning;OfV;17| (|OutputPackage|)
              (70 . |output|) (75 . |output|) (|List| 30) (80 . |parts|)
              (|List| 35) (85 . |parts|) (90 . |hconcat|)
              |TESTCNT;statistics;V;18|)
           '#(|testsuiteNoClear| 96 |testsuite| 101 |testcaseNoClear| 106
              |testcase| 111 |statistics| 116 |incXfPass| 120
              |incXfLibraryError| 126 |incXfFatal| 132 |incXfFail| 137
              |incPass| 141 |incLibraryError| 145 |incFatal| 151 |incFail| 156
              |decXfPass| 162 |decXfFatal| 166 |decFatal| 170 |chkLibraryError|
              174 |addWarning| 178)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 65
                                                 '(0 10 0 11 1 18 16 17 19 2 23
                                                   22 0 0 24 2 17 0 0 0 25 1 26
                                                   16 17 27 0 28 0 29 2 10 0 30
                                                   0 31 2 32 22 0 0 33 2 10 28
                                                   0 17 34 2 28 0 35 0 36 2 28
                                                   9 0 17 39 1 26 0 17 53 1 26
                                                   0 54 55 1 57 16 26 58 1 57
                                                   16 17 59 1 10 60 0 61 1 28
                                                   62 0 63 2 26 0 0 0 64 1 0 16
                                                   17 20 1 0 16 17 21 1 0 16 17
                                                   37 1 0 16 17 38 0 0 16 65 2
                                                   0 16 17 42 47 2 0 16 17 42
                                                   44 1 0 16 17 51 0 0 16 45 0
                                                   0 16 40 2 0 16 17 42 43 1 0
                                                   16 17 49 2 0 16 17 42 46 0 0
                                                   16 48 0 0 16 52 0 0 16 50 0
                                                   0 16 41 1 0 16 26 56)))))
           '|lookupComplete|)) 

(MAKEPROP '|UnittestCount| 'NILADIC T) 
