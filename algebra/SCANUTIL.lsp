
(/VERSIONCHECK 2) 

(DEFUN |SCANUTIL;parse_integer2| (|str| |i0| |l| |l2l| |tpl| $)
  (PROG (|res| |l2| |tp| |l1| |s1| |dig_val| #1=#:G144 |i| #2=#:G143 #3=#:G142
         |ten7| |ten| |b|)
    (RETURN
     (SEQ (LETT |b| 48 . #4=(|SCANUTIL;parse_integer2|)) (LETT |ten| 10 . #4#)
          (LETT |ten7| 10000000 . #4#)
          (EXIT
           (COND
            ((EQL |l| 2)
             (SEQ (LETT |s1| 0 . #4#)
                  (SEQ (LETT |i| |i0| . #4#) (LETT #3# (+ |i0| 6) . #4#) G190
                       (COND ((> |i| #3#) (GO G191)))
                       (SEQ
                        (LETT |dig_val| (|sub_SI| (STR_ELT1 |str| |i|) |b|)
                              . #4#)
                        (EXIT
                         (LETT |s1| (|add_SI| (|mul_SI| |ten| |s1|) |dig_val|)
                               . #4#)))
                       (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL))
                  (LETT |res| |s1| . #4#) (LETT |s1| 0 . #4#)
                  (SEQ (LETT |i| (+ |i0| 7) . #4#) (LETT #2# (+ |i0| 13) . #4#)
                       G190 (COND ((> |i| #2#) (GO G191)))
                       (SEQ
                        (LETT |dig_val| (|sub_SI| (STR_ELT1 |str| |i|) |b|)
                              . #4#)
                        (EXIT
                         (LETT |s1| (|add_SI| (|mul_SI| |ten| |s1|) |dig_val|)
                               . #4#)))
                       (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL))
                  (EXIT (+ (* |ten7| |res|) |s1|))))
            ((|eql_SI| |l| 1)
             (SEQ (LETT |s1| 0 . #4#)
                  (SEQ (LETT |i| |i0| . #4#) (LETT #1# (|add_SI| |i0| 6) . #4#)
                       G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (LETT |dig_val| (|sub_SI| (STR_ELT1 |str| |i|) |b|)
                              . #4#)
                        (EXIT
                         (LETT |s1| (|add_SI| (|mul_SI| |ten| |s1|) |dig_val|)
                               . #4#)))
                       (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT |s1|)))
            ('T
             (SEQ (LETT |l1| (|SPADfirst| |l2l|) . #4#)
                  (LETT |l2l| (CDR |l2l|) . #4#)
                  (LETT |tp| (|SPADfirst| |tpl|) . #4#)
                  (LETT |tpl| (CDR |tpl|) . #4#)
                  (LETT |l2| (|sub_SI| |l| |l1|) . #4#)
                  (LETT |res|
                        (|SCANUTIL;parse_integer2| |str|
                         (|add_SI| |i0| (|mul_SI| 7 |l2|)) |l1| |l2l| |tpl| $)
                        . #4#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND ((|less_SI| (|SPADfirst| |l2l|) |l2|) 'NIL)
                                ('T 'T)))
                         (GO G191)))
                       (SEQ (LETT |l2l| (CDR |l2l|) . #4#)
                            (EXIT (LETT |tpl| (CDR |tpl|) . #4#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (+ |res|
                      (* |tp|
                         (|SCANUTIL;parse_integer2| |str| |i0| |l2| |l2l| |tpl|
                          $)))))))))))) 

(DEFUN |SCANUTIL;parse_integer;SI;2| (|str| $)
  (PROG (|res| |j| |s1| |dig_val| #1=#:G158 |i| |k| |ll| |tpl| |l2l| |tp|
         |ten7| |l2| |l20| |ten| |l1| |l| |b|)
    (RETURN
     (SEQ (LETT |b| 48 . #2=(|SCANUTIL;parse_integer;SI;2|))
          (LETT |l| (QCSIZE |str|) . #2#) (LETT |l1| (|rem_SI| |l| 7) . #2#)
          (LETT |s1| 0 . #2#) (LETT |ten| 10 . #2#)
          (SEQ (LETT |i| 1 . #2#) G190
               (COND ((|greater_SI| |i| |l1|) (GO G191)))
               (SEQ (LETT |dig_val| (|sub_SI| (STR_ELT1 |str| |i|) |b|) . #2#)
                    (EXIT
                     (LETT |s1| (|add_SI| (|mul_SI| |ten| |s1|) |dig_val|)
                           . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (LETT |l20| (LETT |l2| (|sub_SI| |l| |l1|) . #2#) . #2#)
          (LETT |res| |s1| . #2#)
          (EXIT
           (COND ((|eql_SI| |l2| 0) |res|)
                 (#3='T
                  (SEQ (LETT |l2| (|quo_SI| |l2| 7) . #2#)
                       (LETT |j| (|add_SI| |l1| 1) . #2#)
                       (LETT |ten7| 10000000 . #2#)
                       (EXIT
                        (COND
                         ((|less_SI| 3 |l2|)
                          (SEQ (LETT |l2l| (LIST 1 0) . #2#)
                               (LETT |tpl| (LIST |ten7| 1) . #2#)
                               (LETT |tp| |ten7| . #2#) (LETT |ll| 2 . #2#)
                               (SEQ G190
                                    (COND
                                     ((NULL (|less_SI| |ll| |l2|)) (GO G191)))
                                    (SEQ (LETT |tp| (* |tp| |tp|) . #2#)
                                         (LETT |l2l| (CONS |ll| |l2l|) . #2#)
                                         (LETT |tpl| (CONS |tp| |tpl|) . #2#)
                                         (EXIT
                                          (LETT |ll| (|add_SI| |ll| |ll|)
                                                . #2#)))
                                    NIL (GO G190) G191 (EXIT NIL))
                               (EXIT
                                (+ (* |res| (EXPT 10 |l20|))
                                   (|SCANUTIL;parse_integer2| |str| |j| |l2|
                                    |l2l| |tpl| $)))))
                         (#3#
                          (SEQ
                           (SEQ (LETT |k| 1 . #2#) G190
                                (COND ((|greater_SI| |k| |l2|) (GO G191)))
                                (SEQ (LETT |s1| 0 . #2#)
                                     (SEQ (LETT |i| |j| . #2#)
                                          (LETT #1# (|add_SI| |j| 6) . #2#)
                                          G190
                                          (COND
                                           ((|greater_SI| |i| #1#) (GO G191)))
                                          (SEQ
                                           (LETT |dig_val|
                                                 (|sub_SI| (STR_ELT1 |str| |i|)
                                                           |b|)
                                                 . #2#)
                                           (EXIT
                                            (LETT |s1|
                                                  (|add_SI|
                                                   (|mul_SI| |ten| |s1|)
                                                   |dig_val|)
                                                  . #2#)))
                                          (LETT |i| (|inc_SI| |i|) . #2#)
                                          (GO G190) G191 (EXIT NIL))
                                     (LETT |j| (|add_SI| |j| 7) . #2#)
                                     (EXIT
                                      (LETT |res| (+ (* |ten7| |res|) |s1|)
                                            . #2#)))
                                (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT |res|))))))))))))) 

(DECLAIM (NOTINLINE |ScanningUtilities;|)) 

(DEFUN |ScanningUtilities| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G160)
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
                         (LIST (CONS NIL (CONS 1 (|ScanningUtilities;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|ScanningUtilities|))))))))))) 

(DEFUN |ScanningUtilities;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|ScanningUtilities|) . #1=(|ScanningUtilities|))
      (LETT $ (GETREFV 9) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ScanningUtilities| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|ScanningUtilities| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) (|String|)
              |SCANUTIL;parse_integer;SI;2|)
           '#(|parse_integer| 0) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#() (CONS '#() (|makeByteWordVec2| 8 '(1 0 6 7 8)))))
           '|lookupComplete|)) 

(MAKEPROP '|ScanningUtilities| 'NILADIC T) 
