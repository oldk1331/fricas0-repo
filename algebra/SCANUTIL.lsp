
(SDEFUN |SCANUTIL;parse_integer2|
        ((|str| |String|) (|i0| |SingleInteger|) (|l| |SingleInteger|)
         (|l2l| |List| (|SingleInteger|)) (|tpl| |List| (|Integer|))
         ($ |Integer|))
        (SPROG
         ((|res| (|Integer|)) (|l2| #1=(|SingleInteger|)) (|tp| (|Integer|))
          (|l1| (|SingleInteger|)) (|s1| (|SingleInteger|)) (|dig_val| #1#)
          (#2=#:G121 NIL) (|i| NIL) (#3=#:G120 NIL) (#4=#:G119 NIL)
          (|ten7| (|Integer|)) (|ten| #5=(|SingleInteger|)) (|b| #5#))
         (SEQ (LETT |b| 48 . #6=(|SCANUTIL;parse_integer2|))
              (LETT |ten| 10 . #6#) (LETT |ten7| 10000000 . #6#)
              (EXIT
               (COND
                ((EQL |l| 2)
                 (SEQ (LETT |s1| 0 . #6#)
                      (SEQ (LETT |i| |i0| . #6#) (LETT #4# (+ |i0| 6) . #6#)
                           G190 (COND ((> |i| #4#) (GO G191)))
                           (SEQ
                            (LETT |dig_val| (|sub_SI| (STR_ELT1 |str| |i|) |b|)
                                  . #6#)
                            (EXIT
                             (LETT |s1|
                                   (|add_SI| (|mul_SI| |ten| |s1|) |dig_val|)
                                   . #6#)))
                           (LETT |i| (+ |i| 1) . #6#) (GO G190) G191
                           (EXIT NIL))
                      (LETT |res| |s1| . #6#) (LETT |s1| 0 . #6#)
                      (SEQ (LETT |i| (+ |i0| 7) . #6#)
                           (LETT #3# (+ |i0| 13) . #6#) G190
                           (COND ((> |i| #3#) (GO G191)))
                           (SEQ
                            (LETT |dig_val| (|sub_SI| (STR_ELT1 |str| |i|) |b|)
                                  . #6#)
                            (EXIT
                             (LETT |s1|
                                   (|add_SI| (|mul_SI| |ten| |s1|) |dig_val|)
                                   . #6#)))
                           (LETT |i| (+ |i| 1) . #6#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT (+ (* |ten7| |res|) |s1|))))
                ((|eql_SI| |l| 1)
                 (SEQ (LETT |s1| 0 . #6#)
                      (SEQ (LETT |i| |i0| . #6#)
                           (LETT #2# (|add_SI| |i0| 6) . #6#) G190
                           (COND ((|greater_SI| |i| #2#) (GO G191)))
                           (SEQ
                            (LETT |dig_val| (|sub_SI| (STR_ELT1 |str| |i|) |b|)
                                  . #6#)
                            (EXIT
                             (LETT |s1|
                                   (|add_SI| (|mul_SI| |ten| |s1|) |dig_val|)
                                   . #6#)))
                           (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT |s1|)))
                ('T
                 (SEQ (LETT |l1| (|SPADfirst| |l2l|) . #6#)
                      (LETT |l2l| (CDR |l2l|) . #6#)
                      (LETT |tp| (|SPADfirst| |tpl|) . #6#)
                      (LETT |tpl| (CDR |tpl|) . #6#)
                      (LETT |l2| (|sub_SI| |l| |l1|) . #6#)
                      (LETT |res|
                            (|SCANUTIL;parse_integer2| |str|
                             (|add_SI| |i0| (|mul_SI| 7 |l2|)) |l1| |l2l| |tpl|
                             $)
                            . #6#)
                      (SEQ G190
                           (COND
                            ((NULL
                              (COND ((|less_SI| (|SPADfirst| |l2l|) |l2|) 'NIL)
                                    ('T 'T)))
                             (GO G191)))
                           (SEQ (LETT |l2l| (CDR |l2l|) . #6#)
                                (EXIT (LETT |tpl| (CDR |tpl|) . #6#)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (+ |res|
                          (* |tp|
                             (|SCANUTIL;parse_integer2| |str| |i0| |l2| |l2l|
                              |tpl| $))))))))))) 

(SDEFUN |SCANUTIL;parse_integer;SI;2| ((|str| |String|) ($ |Integer|))
        (SPROG
         ((|res| (|Integer|)) (|j| (|SingleInteger|))
          (|s1| #1=(|SingleInteger|)) (|dig_val| #2=(|SingleInteger|))
          (#3=#:G135 NIL) (|i| NIL) (|k| NIL) (|ll| #4=(|SingleInteger|))
          (|tpl| (|List| #5=(|Integer|))) (|l2l| (|List| #1#)) (|tp| #5#)
          (|ten7| #5#) (|l2| #2#) (|l20| #2#) (|ten| #4#)
          (|l1| (|SingleInteger|)) (|l| #4#) (|b| #4#))
         (SEQ (LETT |b| 48 . #6=(|SCANUTIL;parse_integer;SI;2|))
              (LETT |l| (QCSIZE |str|) . #6#)
              (LETT |l1| (|rem_SI| |l| 7) . #6#) (LETT |s1| 0 . #6#)
              (LETT |ten| 10 . #6#)
              (SEQ (LETT |i| 1 . #6#) G190
                   (COND ((|greater_SI| |i| |l1|) (GO G191)))
                   (SEQ
                    (LETT |dig_val| (|sub_SI| (STR_ELT1 |str| |i|) |b|) . #6#)
                    (EXIT
                     (LETT |s1| (|add_SI| (|mul_SI| |ten| |s1|) |dig_val|)
                           . #6#)))
                   (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
              (LETT |l20| (LETT |l2| (|sub_SI| |l| |l1|) . #6#) . #6#)
              (LETT |res| |s1| . #6#)
              (EXIT
               (COND ((|eql_SI| |l2| 0) |res|)
                     (#7='T
                      (SEQ (LETT |l2| (|quo_SI| |l2| 7) . #6#)
                           (LETT |j| (|add_SI| |l1| 1) . #6#)
                           (LETT |ten7| 10000000 . #6#)
                           (EXIT
                            (COND
                             ((|less_SI| 3 |l2|)
                              (SEQ (LETT |l2l| (LIST 1 0) . #6#)
                                   (LETT |tpl| (LIST |ten7| 1) . #6#)
                                   (LETT |tp| |ten7| . #6#) (LETT |ll| 2 . #6#)
                                   (SEQ G190
                                        (COND
                                         ((NULL (|less_SI| |ll| |l2|))
                                          (GO G191)))
                                        (SEQ (LETT |tp| (* |tp| |tp|) . #6#)
                                             (LETT |l2l| (CONS |ll| |l2l|)
                                                   . #6#)
                                             (LETT |tpl| (CONS |tp| |tpl|)
                                                   . #6#)
                                             (EXIT
                                              (LETT |ll| (|add_SI| |ll| |ll|)
                                                    . #6#)))
                                        NIL (GO G190) G191 (EXIT NIL))
                                   (EXIT
                                    (+ (* |res| (EXPT 10 |l20|))
                                       (|SCANUTIL;parse_integer2| |str| |j|
                                        |l2| |l2l| |tpl| $)))))
                             (#7#
                              (SEQ
                               (SEQ (LETT |k| 1 . #6#) G190
                                    (COND ((|greater_SI| |k| |l2|) (GO G191)))
                                    (SEQ (LETT |s1| 0 . #6#)
                                         (SEQ (LETT |i| |j| . #6#)
                                              (LETT #3# (|add_SI| |j| 6) . #6#)
                                              G190
                                              (COND
                                               ((|greater_SI| |i| #3#)
                                                (GO G191)))
                                              (SEQ
                                               (LETT |dig_val|
                                                     (|sub_SI|
                                                      (STR_ELT1 |str| |i|) |b|)
                                                     . #6#)
                                               (EXIT
                                                (LETT |s1|
                                                      (|add_SI|
                                                       (|mul_SI| |ten| |s1|)
                                                       |dig_val|)
                                                      . #6#)))
                                              (LETT |i| (|inc_SI| |i|) . #6#)
                                              (GO G190) G191 (EXIT NIL))
                                         (LETT |j| (|add_SI| |j| 7) . #6#)
                                         (EXIT
                                          (LETT |res| (+ (* |ten7| |res|) |s1|)
                                                . #6#)))
                                    (LETT |k| (|inc_SI| |k|) . #6#) (GO G190)
                                    G191 (EXIT NIL))
                               (EXIT |res|)))))))))))) 

(DECLAIM (NOTINLINE |ScanningUtilities;|)) 

(DEFUN |ScanningUtilities| ()
  (SPROG NIL
         (PROG (#1=#:G137)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ScanningUtilities|)
                    . #2=(|ScanningUtilities|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ScanningUtilities|
                             (LIST
                              (CONS NIL (CONS 1 (|ScanningUtilities;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|ScanningUtilities|)))))))))) 

(DEFUN |ScanningUtilities;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|ScanningUtilities|) . #1=(|ScanningUtilities|))
          (LETT $ (GETREFV 9) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ScanningUtilities| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|ScanningUtilities| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) (|String|)
              |SCANUTIL;parse_integer;SI;2|)
           '#(|parse_integer| 0) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#() (CONS '#() (|makeByteWordVec2| 8 '(1 0 6 7 8)))))
           '|lookupComplete|)) 

(MAKEPROP '|ScanningUtilities| 'NILADIC T) 
