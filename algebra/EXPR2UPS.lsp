
(/VERSIONCHECK 2) 

(DEFUN |EXPR2UPS;performSubstitution| (|fcn| |x| |a| $)
  (PROG (|xFE|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |a| (QREFELT $ 9)) |fcn|)
            ('T
             (SEQ
              (LETT |xFE| (SPADCALL |x| (QREFELT $ 11))
                    |EXPR2UPS;performSubstitution|)
              (EXIT
               (SPADCALL |fcn|
                         (SPADCALL |xFE| (SPADCALL |xFE| |a| (QREFELT $ 12))
                                   (QREFELT $ 14))
                         (QREFELT $ 16)))))))))) 

(DEFUN |EXPR2UPS;iTaylor| (|fcn| |x| |a| $)
  (PROG (|any1| |uts| |uls| #1=#:G153 |ans| |pack| |Uts| |Uls|)
    (RETURN
     (SEQ
      (LETT |Uls| (|UnivariateLaurentSeries| (QREFELT $ 7) |x| |a|)
            . #2=(|EXPR2UPS;iTaylor|))
      (LETT |Uts| (|UnivariateTaylorSeries| (QREFELT $ 7) |x| |a|) . #2#)
      (LETT |pack|
            (|FunctionSpaceToUnivariatePowerSeries| (QREFELT $ 6) (QREFELT $ 7)
                                                    (|Integer|) |Uls|
                                                    (|ElementaryFunctionsUnivariateLaurentSeries|
                                                     (QREFELT $ 7) |Uts| |Uls|)
                                                    |Uts|
                                                    (|TaylorSeriesExpansionLaurent|
                                                     (QREFELT $ 7) |Uts| |Uls|)
                                                    |x|)
            . #2#)
      (LETT |ans|
            (SPADCALL |fcn| 'NIL (CONS 4 "just do it")
                      (|compiledLookupCheck| '|exprToUPS|
                                             (LIST
                                              (LIST '|Union|
                                                    (LIST '|:| '|%series|
                                                          (|devaluate| |Uls|))
                                                    (LIST '|:| '|%problem|
                                                          (LIST '|Record|
                                                                (LIST '|:|
                                                                      '|func|
                                                                      (LIST
                                                                       '|String|))
                                                                (LIST '|:|
                                                                      '|prob|
                                                                      (LIST
                                                                       '|String|)))))
                                              (|devaluate| (ELT $ 7))
                                              (LIST '|Boolean|)
                                              (LIST '|Union| '"complex"
                                                    '"real: two sides"
                                                    '"real: left side"
                                                    '"real: right side"
                                                    '"just do it"))
                                             |pack|))
            . #2#)
      (EXIT
       (COND
        ((QEQCAR |ans| 1)
         (COND
          ((EQUAL (QCDR (CDR |ans|)) "essential singularity")
           (|error| "No Taylor expansion: essential singularity"))
          ((EQUAL (QCAR (CDR |ans|)) "log")
           (|error| "No Taylor expansion: logarithmic singularity"))
          ((EQUAL (QCAR (CDR |ans|)) "nth root")
           (|error| "No Taylor expansion: fractional powers in expansion"))
          (#3='T (|error| "No Taylor expansion"))))
        (#3#
         (SEQ
          (LETT |uls|
                (PROG2 (LETT #1# |ans| . #2#)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0) |Uls| #1#))
                . #2#)
          (LETT |uts|
                (SPADCALL |uls|
                          (|compiledLookupCheck| '|taylorIfCan|
                                                 (LIST
                                                  (LIST '|Union|
                                                        (LIST
                                                         '|UnivariateTaylorSeries|
                                                         (|devaluate|
                                                          (ELT $ 7))
                                                         |x| |a|)
                                                        '"failed")
                                                  '$)
                                                 |Uls|))
                . #2#)
          (EXIT
           (COND ((QEQCAR |uts| 1) (|error| "No Taylor expansion: pole"))
                 (#3#
                  (SEQ
                   (LETT |any1|
                         (|AnyFunctions1|
                          (|UnivariateTaylorSeries| (QREFELT $ 7) |x| |a|))
                         . #2#)
                   (EXIT
                    (SPADCALL (QCDR |uts|)
                              (|compiledLookupCheck| '|coerce|
                                                     (LIST (LIST '|Any|)
                                                           (LIST
                                                            '|UnivariateTaylorSeries|
                                                            (|devaluate|
                                                             (ELT $ 7))
                                                            |x| |a|))
                                                     |any1|))))))))))))))) 

(DEFUN |EXPR2UPS;taylor;SA;3| (|x| $)
  (PROG (|any1| |uts|)
    (RETURN
     (SEQ
      (LETT |uts|
            (|UnivariateTaylorSeries| (QREFELT $ 7) |x| (|spadConstant| $ 17))
            . #1=(|EXPR2UPS;taylor;SA;3|))
      (LETT |any1| (|AnyFunctions1| |uts|) . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL (|spadConstant| $ 19) 1
                  (|compiledLookupCheck| '|monomial|
                                         (LIST '$ (|devaluate| (ELT $ 7))
                                               (LIST '|NonNegativeInteger|))
                                         |uts|))
        (|compiledLookupCheck| '|coerce|
                               (LIST (LIST '|Any|) (|devaluate| |uts|))
                               |any1|))))))) 

(DEFUN |EXPR2UPS;taylor;FEA;4| (|fcn| $)
  (PROG (|vars|)
    (RETURN
     (SEQ (LETT |vars| (SPADCALL |fcn| (QREFELT $ 23)) |EXPR2UPS;taylor;FEA;4|)
          (EXIT
           (COND
            ((NULL |vars|) (|error| "taylor: expression has no variables"))
            ((NULL (NULL (CDR |vars|)))
             (|error| "taylor: expression has more than one variable"))
            ('T
             (SPADCALL |fcn|
                       (SPADCALL (SPADCALL (|SPADfirst| |vars|) (QREFELT $ 11))
                                 (|spadConstant| $ 17) (QREFELT $ 14))
                       (QREFELT $ 24))))))))) 

(DEFUN |EXPR2UPS;taylor;FENniA;5| (|fcn| |n| $)
  (PROG (|series| |any1| |uts| |x| |vars|)
    (RETURN
     (SEQ
      (LETT |vars| (SPADCALL |fcn| (QREFELT $ 23))
            . #1=(|EXPR2UPS;taylor;FENniA;5|))
      (EXIT
       (COND ((NULL |vars|) (|error| "taylor: expression has no variables"))
             ((NULL (NULL (CDR |vars|)))
              (|error| "taylor: expression has more than one variable"))
             ('T
              (SEQ (LETT |x| (|SPADfirst| |vars|) . #1#)
                   (LETT |uts|
                         (|UnivariateTaylorSeries| (QREFELT $ 7) |x|
                                                   (|spadConstant| $ 17))
                         . #1#)
                   (LETT |any1| (|AnyFunctions1| |uts|) . #1#)
                   (LETT |series|
                         (SPADCALL
                          (SPADCALL |fcn|
                                    (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                              (|spadConstant| $ 17)
                                              (QREFELT $ 14))
                                    (QREFELT $ 24))
                          (|compiledLookupCheck| '|retract|
                                                 (LIST (|devaluate| |uts|)
                                                       (LIST '|Any|))
                                                 |any1|))
                         . #1#)
                   (EXIT
                    (SPADCALL
                     (SPADCALL |series| |n|
                               (|compiledLookupCheck| '|extend|
                                                      (LIST '$ '$
                                                            (LIST
                                                             '|NonNegativeInteger|))
                                                      |uts|))
                     (|compiledLookupCheck| '|coerce|
                                            (LIST (LIST '|Any|)
                                                  (|devaluate| |uts|))
                                            |any1|))))))))))) 

(DEFUN |EXPR2UPS;taylor;FEEA;6| (|fcn| |eq| $)
  (PROG (|a| |x| |xx|)
    (RETURN
     (SEQ
      (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 29)) (QREFELT $ 31))
            . #1=(|EXPR2UPS;taylor;FEEA;6|))
      (EXIT
       (COND
        ((QEQCAR |xx| 1) (|error| "taylor: left hand side must be a variable"))
        ('T
         (SEQ (LETT |x| (QCDR |xx|) . #1#)
              (LETT |a| (SPADCALL |eq| (QREFELT $ 32)) . #1#)
              (EXIT
               (|EXPR2UPS;iTaylor|
                (|EXPR2UPS;performSubstitution| |fcn| |x| |a| $) |x| |a|
                $)))))))))) 

(DEFUN |EXPR2UPS;taylor;FEENniA;7| (|fcn| |eq| |n| $)
  (PROG (|series| |any1| |a| |x| |xx|)
    (RETURN
     (SEQ
      (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 29)) (QREFELT $ 31))
            . #1=(|EXPR2UPS;taylor;FEENniA;7|))
      (EXIT
       (COND
        ((QEQCAR |xx| 1) (|error| "taylor: left hand side must be a variable"))
        ('T
         (SEQ (LETT |x| (QCDR |xx|) . #1#)
              (LETT |a| (SPADCALL |eq| (QREFELT $ 32)) . #1#)
              (LETT |any1|
                    (|AnyFunctions1|
                     (|UnivariateTaylorSeries| (QREFELT $ 7) |x| |a|))
                    . #1#)
              (LETT |series|
                    (SPADCALL
                     (|EXPR2UPS;iTaylor|
                      (|EXPR2UPS;performSubstitution| |fcn| |x| |a| $) |x| |a|
                      $)
                     (|compiledLookupCheck| '|retract|
                                            (LIST
                                             (LIST '|UnivariateTaylorSeries|
                                                   (|devaluate| (ELT $ 7)) |x|
                                                   |a|)
                                             (LIST '|Any|))
                                            |any1|))
                    . #1#)
              (EXIT
               (SPADCALL
                (SPADCALL |series| |n|
                          (|compiledLookupCheck| '|extend|
                                                 (LIST '$ '$
                                                       (LIST
                                                        '|NonNegativeInteger|))
                                                 (|UnivariateTaylorSeries|
                                                  (ELT $ 7) |x| |a|)))
                (|compiledLookupCheck| '|coerce|
                                       (LIST (LIST '|Any|)
                                             (LIST '|UnivariateTaylorSeries|
                                                   (|devaluate| (ELT $ 7)) |x|
                                                   |a|))
                                       |any1|))))))))))) 

(DEFUN |EXPR2UPS;iLaurent| (|fcn| |x| |a| $)
  (PROG (#1=#:G194 |any1| |ans| |pack| |Uts| |Uls|)
    (RETURN
     (SEQ
      (LETT |Uls| (|UnivariateLaurentSeries| (QREFELT $ 7) |x| |a|)
            . #2=(|EXPR2UPS;iLaurent|))
      (LETT |Uts| (|UnivariateTaylorSeries| (QREFELT $ 7) |x| |a|) . #2#)
      (LETT |pack|
            (|FunctionSpaceToUnivariatePowerSeries| (QREFELT $ 6) (QREFELT $ 7)
                                                    (|Integer|) |Uls|
                                                    (|ElementaryFunctionsUnivariateLaurentSeries|
                                                     (QREFELT $ 7) |Uts| |Uls|)
                                                    |Uts|
                                                    (|TaylorSeriesExpansionLaurent|
                                                     (QREFELT $ 7) |Uts| |Uls|)
                                                    |x|)
            . #2#)
      (LETT |ans|
            (SPADCALL |fcn| 'NIL (CONS 4 "just do it")
                      (|compiledLookupCheck| '|exprToUPS|
                                             (LIST
                                              (LIST '|Union|
                                                    (LIST '|:| '|%series|
                                                          (|devaluate| |Uls|))
                                                    (LIST '|:| '|%problem|
                                                          (LIST '|Record|
                                                                (LIST '|:|
                                                                      '|func|
                                                                      (LIST
                                                                       '|String|))
                                                                (LIST '|:|
                                                                      '|prob|
                                                                      (LIST
                                                                       '|String|)))))
                                              (|devaluate| (ELT $ 7))
                                              (LIST '|Boolean|)
                                              (LIST '|Union| '"complex"
                                                    '"real: two sides"
                                                    '"real: left side"
                                                    '"real: right side"
                                                    '"just do it"))
                                             |pack|))
            . #2#)
      (EXIT
       (COND
        ((QEQCAR |ans| 1)
         (COND
          ((EQUAL (QCDR (CDR |ans|)) "essential singularity")
           (|error| "No Laurent expansion: essential singularity"))
          ((EQUAL (QCAR (CDR |ans|)) "log")
           (|error| "No Laurent expansion: logarithmic singularity"))
          ((EQUAL (QCAR (CDR |ans|)) "nth root")
           (|error| "No Laurent expansion: fractional powers in expansion"))
          (#3='T (|error| "No Laurent expansion"))))
        (#3#
         (SEQ
          (LETT |any1|
                (|AnyFunctions1|
                 (|UnivariateLaurentSeries| (QREFELT $ 7) |x| |a|))
                . #2#)
          (EXIT
           (SPADCALL
            (PROG2 (LETT #1# |ans| . #2#)
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0) |Uls| #1#))
            (|compiledLookupCheck| '|coerce|
                                   (LIST (LIST '|Any|)
                                         (LIST '|UnivariateLaurentSeries|
                                               (|devaluate| (ELT $ 7)) |x|
                                               |a|))
                                   |any1|))))))))))) 

(DEFUN |EXPR2UPS;laurent;SA;9| (|x| $)
  (PROG (|any1| |uls|)
    (RETURN
     (SEQ
      (LETT |uls|
            (|UnivariateLaurentSeries| (QREFELT $ 7) |x| (|spadConstant| $ 17))
            . #1=(|EXPR2UPS;laurent;SA;9|))
      (LETT |any1| (|AnyFunctions1| |uls|) . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL (|spadConstant| $ 19) 1
                  (|compiledLookupCheck| '|monomial|
                                         (LIST '$ (|devaluate| (ELT $ 7))
                                               (LIST '|Integer|))
                                         |uls|))
        (|compiledLookupCheck| '|coerce|
                               (LIST (LIST '|Any|) (|devaluate| |uls|))
                               |any1|))))))) 

(DEFUN |EXPR2UPS;laurent;FEA;10| (|fcn| $)
  (PROG (|vars|)
    (RETURN
     (SEQ
      (LETT |vars| (SPADCALL |fcn| (QREFELT $ 23)) |EXPR2UPS;laurent;FEA;10|)
      (EXIT
       (COND ((NULL |vars|) (|error| "laurent: expression has no variables"))
             ((NULL (NULL (CDR |vars|)))
              (|error| "laurent: expression has more than one variable"))
             ('T
              (SPADCALL |fcn|
                        (SPADCALL
                         (SPADCALL (|SPADfirst| |vars|) (QREFELT $ 11))
                         (|spadConstant| $ 17) (QREFELT $ 14))
                        (QREFELT $ 35))))))))) 

(DEFUN |EXPR2UPS;laurent;FEIA;11| (|fcn| |n| $)
  (PROG (|series| |any1| |uls| |x| |vars|)
    (RETURN
     (SEQ
      (LETT |vars| (SPADCALL |fcn| (QREFELT $ 23))
            . #1=(|EXPR2UPS;laurent;FEIA;11|))
      (EXIT
       (COND ((NULL |vars|) (|error| "laurent: expression has no variables"))
             ((NULL (NULL (CDR |vars|)))
              (|error| "laurent: expression has more than one variable"))
             ('T
              (SEQ (LETT |x| (|SPADfirst| |vars|) . #1#)
                   (LETT |uls|
                         (|UnivariateLaurentSeries| (QREFELT $ 7) |x|
                                                    (|spadConstant| $ 17))
                         . #1#)
                   (LETT |any1| (|AnyFunctions1| |uls|) . #1#)
                   (LETT |series|
                         (SPADCALL
                          (SPADCALL |fcn|
                                    (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                              (|spadConstant| $ 17)
                                              (QREFELT $ 14))
                                    (QREFELT $ 35))
                          (|compiledLookupCheck| '|retract|
                                                 (LIST (|devaluate| |uls|)
                                                       (LIST '|Any|))
                                                 |any1|))
                         . #1#)
                   (EXIT
                    (SPADCALL
                     (SPADCALL |series| |n|
                               (|compiledLookupCheck| '|extend|
                                                      (LIST '$ '$
                                                            (LIST '|Integer|))
                                                      |uls|))
                     (|compiledLookupCheck| '|coerce|
                                            (LIST (LIST '|Any|)
                                                  (|devaluate| |uls|))
                                            |any1|))))))))))) 

(DEFUN |EXPR2UPS;laurent;FEEA;12| (|fcn| |eq| $)
  (PROG (|a| |x| |xx|)
    (RETURN
     (SEQ
      (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 29)) (QREFELT $ 31))
            . #1=(|EXPR2UPS;laurent;FEEA;12|))
      (EXIT
       (COND
        ((QEQCAR |xx| 1) (|error| "taylor: left hand side must be a variable"))
        ('T
         (SEQ (LETT |x| (QCDR |xx|) . #1#)
              (LETT |a| (SPADCALL |eq| (QREFELT $ 32)) . #1#)
              (EXIT
               (|EXPR2UPS;iLaurent|
                (|EXPR2UPS;performSubstitution| |fcn| |x| |a| $) |x| |a|
                $)))))))))) 

(DEFUN |EXPR2UPS;laurent;FEEIA;13| (|fcn| |eq| |n| $)
  (PROG (|series| |any1| |a| |x| |xx|)
    (RETURN
     (SEQ
      (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 29)) (QREFELT $ 31))
            . #1=(|EXPR2UPS;laurent;FEEIA;13|))
      (EXIT
       (COND
        ((QEQCAR |xx| 1) (|error| "taylor: left hand side must be a variable"))
        ('T
         (SEQ (LETT |x| (QCDR |xx|) . #1#)
              (LETT |a| (SPADCALL |eq| (QREFELT $ 32)) . #1#)
              (LETT |any1|
                    (|AnyFunctions1|
                     (|UnivariateLaurentSeries| (QREFELT $ 7) |x| |a|))
                    . #1#)
              (LETT |series|
                    (SPADCALL
                     (|EXPR2UPS;iLaurent|
                      (|EXPR2UPS;performSubstitution| |fcn| |x| |a| $) |x| |a|
                      $)
                     (|compiledLookupCheck| '|retract|
                                            (LIST
                                             (LIST '|UnivariateLaurentSeries|
                                                   (|devaluate| (ELT $ 7)) |x|
                                                   |a|)
                                             (LIST '|Any|))
                                            |any1|))
                    . #1#)
              (EXIT
               (SPADCALL
                (SPADCALL |series| |n|
                          (|compiledLookupCheck| '|extend|
                                                 (LIST '$ '$ (LIST '|Integer|))
                                                 (|UnivariateLaurentSeries|
                                                  (ELT $ 7) |x| |a|)))
                (|compiledLookupCheck| '|coerce|
                                       (LIST (LIST '|Any|)
                                             (LIST '|UnivariateLaurentSeries|
                                                   (|devaluate| (ELT $ 7)) |x|
                                                   |a|))
                                       |any1|))))))))))) 

(DEFUN |EXPR2UPS;iPuiseux| (|fcn| |x| |a| $)
  (PROG (#1=#:G231 |any1| |ans| |pack| |Ups| |Uls| |Uts|)
    (RETURN
     (SEQ
      (LETT |Uts| (|UnivariateTaylorSeries| (QREFELT $ 7) |x| |a|)
            . #2=(|EXPR2UPS;iPuiseux|))
      (LETT |Uls| (|UnivariateLaurentSeries| (QREFELT $ 7) |x| |a|) . #2#)
      (LETT |Ups| (|UnivariatePuiseuxSeries| (QREFELT $ 7) |x| |a|) . #2#)
      (LETT |pack|
            (|FunctionSpaceToUnivariatePowerSeries| (QREFELT $ 6) (QREFELT $ 7)
                                                    (|Fraction| (|Integer|))
                                                    |Ups|
                                                    (|ElementaryFunctionsUnivariatePuiseuxSeries|
                                                     (QREFELT $ 7) |Uls| |Ups|
                                                     (|ElementaryFunctionsUnivariateLaurentSeries|
                                                      (QREFELT $ 7) |Uts|
                                                      |Uls|))
                                                    |Uts|
                                                    (|TaylorSeriesExpansionPuiseux|
                                                     (QREFELT $ 7) |Uts| |Uls|
                                                     |Ups|)
                                                    |x|)
            . #2#)
      (LETT |ans|
            (SPADCALL |fcn| 'NIL (CONS 4 "just do it")
                      (|compiledLookupCheck| '|exprToUPS|
                                             (LIST
                                              (LIST '|Union|
                                                    (LIST '|:| '|%series|
                                                          (|devaluate| |Ups|))
                                                    (LIST '|:| '|%problem|
                                                          (LIST '|Record|
                                                                (LIST '|:|
                                                                      '|func|
                                                                      (LIST
                                                                       '|String|))
                                                                (LIST '|:|
                                                                      '|prob|
                                                                      (LIST
                                                                       '|String|)))))
                                              (|devaluate| (ELT $ 7))
                                              (LIST '|Boolean|)
                                              (LIST '|Union| '"complex"
                                                    '"real: two sides"
                                                    '"real: left side"
                                                    '"real: right side"
                                                    '"just do it"))
                                             |pack|))
            . #2#)
      (EXIT
       (COND
        ((QEQCAR |ans| 1)
         (COND
          ((EQUAL (QCDR (CDR |ans|)) "essential singularity")
           (|error| "No Puiseux expansion: essential singularity"))
          ((EQUAL (QCAR (CDR |ans|)) "log")
           (|error| "No Puiseux expansion: logarithmic singularity"))
          (#3='T (|error| "No Puiseux expansion"))))
        (#3#
         (SEQ
          (LETT |any1|
                (|AnyFunctions1|
                 (|UnivariatePuiseuxSeries| (QREFELT $ 7) |x| |a|))
                . #2#)
          (EXIT
           (SPADCALL
            (PROG2 (LETT #1# |ans| . #2#)
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0) |Ups| #1#))
            (|compiledLookupCheck| '|coerce|
                                   (LIST (LIST '|Any|)
                                         (LIST '|UnivariatePuiseuxSeries|
                                               (|devaluate| (ELT $ 7)) |x|
                                               |a|))
                                   |any1|))))))))))) 

(DEFUN |EXPR2UPS;puiseux;SA;15| (|x| $)
  (PROG (|any1| |upxs|)
    (RETURN
     (SEQ
      (LETT |upxs|
            (|UnivariatePuiseuxSeries| (QREFELT $ 7) |x| (|spadConstant| $ 17))
            . #1=(|EXPR2UPS;puiseux;SA;15|))
      (LETT |any1| (|AnyFunctions1| |upxs|) . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL (|spadConstant| $ 19) (|spadConstant| $ 41)
                  (|compiledLookupCheck| '|monomial|
                                         (LIST '$ (|devaluate| (ELT $ 7))
                                               (LIST '|Fraction|
                                                     (LIST '|Integer|)))
                                         |upxs|))
        (|compiledLookupCheck| '|coerce|
                               (LIST (LIST '|Any|) (|devaluate| |upxs|))
                               |any1|))))))) 

(DEFUN |EXPR2UPS;puiseux;FEA;16| (|fcn| $)
  (PROG (|vars|)
    (RETURN
     (SEQ
      (LETT |vars| (SPADCALL |fcn| (QREFELT $ 23)) |EXPR2UPS;puiseux;FEA;16|)
      (EXIT
       (COND ((NULL |vars|) (|error| "puiseux: expression has no variables"))
             ((NULL (NULL (CDR |vars|)))
              (|error| "puiseux: expression has more than one variable"))
             ('T
              (SPADCALL |fcn|
                        (SPADCALL
                         (SPADCALL (|SPADfirst| |vars|) (QREFELT $ 11))
                         (|spadConstant| $ 17) (QREFELT $ 14))
                        (QREFELT $ 43))))))))) 

(DEFUN |EXPR2UPS;puiseux;FEFA;17| (|fcn| |n| $)
  (PROG (|series| |any1| |upxs| |x| |vars|)
    (RETURN
     (SEQ
      (LETT |vars| (SPADCALL |fcn| (QREFELT $ 23))
            . #1=(|EXPR2UPS;puiseux;FEFA;17|))
      (EXIT
       (COND ((NULL |vars|) (|error| "puiseux: expression has no variables"))
             ((NULL (NULL (CDR |vars|)))
              (|error| "puiseux: expression has more than one variable"))
             ('T
              (SEQ (LETT |x| (|SPADfirst| |vars|) . #1#)
                   (LETT |upxs|
                         (|UnivariatePuiseuxSeries| (QREFELT $ 7) |x|
                                                    (|spadConstant| $ 17))
                         . #1#)
                   (LETT |any1| (|AnyFunctions1| |upxs|) . #1#)
                   (LETT |series|
                         (SPADCALL
                          (SPADCALL |fcn|
                                    (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                              (|spadConstant| $ 17)
                                              (QREFELT $ 14))
                                    (QREFELT $ 43))
                          (|compiledLookupCheck| '|retract|
                                                 (LIST (|devaluate| |upxs|)
                                                       (LIST '|Any|))
                                                 |any1|))
                         . #1#)
                   (EXIT
                    (SPADCALL
                     (SPADCALL |series| |n|
                               (|compiledLookupCheck| '|extend|
                                                      (LIST '$ '$
                                                            (LIST '|Fraction|
                                                                  (LIST
                                                                   '|Integer|)))
                                                      |upxs|))
                     (|compiledLookupCheck| '|coerce|
                                            (LIST (LIST '|Any|)
                                                  (|devaluate| |upxs|))
                                            |any1|))))))))))) 

(DEFUN |EXPR2UPS;puiseux;FEEA;18| (|fcn| |eq| $)
  (PROG (|a| |x| |xx|)
    (RETURN
     (SEQ
      (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 29)) (QREFELT $ 31))
            . #1=(|EXPR2UPS;puiseux;FEEA;18|))
      (EXIT
       (COND
        ((QEQCAR |xx| 1) (|error| "taylor: left hand side must be a variable"))
        ('T
         (SEQ (LETT |x| (QCDR |xx|) . #1#)
              (LETT |a| (SPADCALL |eq| (QREFELT $ 32)) . #1#)
              (EXIT
               (|EXPR2UPS;iPuiseux|
                (|EXPR2UPS;performSubstitution| |fcn| |x| |a| $) |x| |a|
                $)))))))))) 

(DEFUN |EXPR2UPS;puiseux;FEEFA;19| (|fcn| |eq| |n| $)
  (PROG (|series| |any1| |a| |x| |xx|)
    (RETURN
     (SEQ
      (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 29)) (QREFELT $ 31))
            . #1=(|EXPR2UPS;puiseux;FEEFA;19|))
      (EXIT
       (COND
        ((QEQCAR |xx| 1) (|error| "taylor: left hand side must be a variable"))
        ('T
         (SEQ (LETT |x| (QCDR |xx|) . #1#)
              (LETT |a| (SPADCALL |eq| (QREFELT $ 32)) . #1#)
              (LETT |any1|
                    (|AnyFunctions1|
                     (|UnivariatePuiseuxSeries| (QREFELT $ 7) |x| |a|))
                    . #1#)
              (LETT |series|
                    (SPADCALL
                     (|EXPR2UPS;iPuiseux|
                      (|EXPR2UPS;performSubstitution| |fcn| |x| |a| $) |x| |a|
                      $)
                     (|compiledLookupCheck| '|retract|
                                            (LIST
                                             (LIST '|UnivariatePuiseuxSeries|
                                                   (|devaluate| (ELT $ 7)) |x|
                                                   |a|)
                                             (LIST '|Any|))
                                            |any1|))
                    . #1#)
              (EXIT
               (SPADCALL
                (SPADCALL |series| |n|
                          (|compiledLookupCheck| '|extend|
                                                 (LIST '$ '$
                                                       (LIST '|Fraction|
                                                             (LIST
                                                              '|Integer|)))
                                                 (|UnivariatePuiseuxSeries|
                                                  (ELT $ 7) |x| |a|)))
                (|compiledLookupCheck| '|coerce|
                                       (LIST (LIST '|Any|)
                                             (LIST '|UnivariatePuiseuxSeries|
                                                   (|devaluate| (ELT $ 7)) |x|
                                                   |a|))
                                       |any1|))))))))))) 

(DEFUN |EXPR2UPS;iSeries| (|fcn| |x| |a| $)
  (PROG (|any1| #1=#:G267 |anyone| |ansG| |ans| |pack| |Uls| |Uts|)
    (RETURN
     (SEQ
      (LETT |Uts| (|UnivariateTaylorSeries| (QREFELT $ 7) |x| |a|)
            . #2=(|EXPR2UPS;iSeries|))
      (LETT |Uls| (|UnivariateLaurentSeries| (QREFELT $ 7) |x| |a|) . #2#)
      (LETT |pack|
            (|FunctionSpaceToUnivariatePowerSeries| (QREFELT $ 6) (QREFELT $ 7)
                                                    (|Fraction| (|Integer|))
                                                    (|UnivariatePuiseuxSeries|
                                                     (QREFELT $ 7) |x| |a|)
                                                    (|ElementaryFunctionsUnivariatePuiseuxSeries|
                                                     (QREFELT $ 7) |Uls|
                                                     (|UnivariatePuiseuxSeries|
                                                      (QREFELT $ 7) |x| |a|)
                                                     (|ElementaryFunctionsUnivariateLaurentSeries|
                                                      (QREFELT $ 7) |Uts|
                                                      |Uls|))
                                                    |Uts|
                                                    (|TaylorSeriesExpansionPuiseux|
                                                     (QREFELT $ 7) |Uts| |Uls|
                                                     (|UnivariatePuiseuxSeries|
                                                      (QREFELT $ 7) |x| |a|))
                                                    |x|)
            . #2#)
      (LETT |ans|
            (SPADCALL |fcn| 'NIL (CONS 4 "just do it")
                      (|compiledLookupCheck| '|exprToUPS|
                                             (LIST
                                              (LIST '|Union|
                                                    (LIST '|:| '|%series|
                                                          (LIST
                                                           '|UnivariatePuiseuxSeries|
                                                           (|devaluate|
                                                            (ELT $ 7))
                                                           |x| |a|))
                                                    (LIST '|:| '|%problem|
                                                          (LIST '|Record|
                                                                (LIST '|:|
                                                                      '|func|
                                                                      (LIST
                                                                       '|String|))
                                                                (LIST '|:|
                                                                      '|prob|
                                                                      (LIST
                                                                       '|String|)))))
                                              (|devaluate| (ELT $ 7))
                                              (LIST '|Boolean|)
                                              (LIST '|Union| '#3="complex"
                                                    '#4="real: two sides"
                                                    '#5="real: left side"
                                                    '#6="real: right side"
                                                    '#7="just do it"))
                                             |pack|))
            . #2#)
      (EXIT
       (COND
        ((QEQCAR |ans| 1)
         (SEQ
          (LETT |ansG|
                (SPADCALL |fcn| 'NIL (CONS 4 "just do it")
                          (|compiledLookupCheck| '|exprToGenUPS|
                                                 (LIST
                                                  (LIST '|Union|
                                                        (LIST '|:| '|%series|
                                                              (LIST
                                                               '|UnivariatePuiseuxSeries|
                                                               (|devaluate|
                                                                (ELT $ 7))
                                                               |x| |a|))
                                                        (LIST '|:| '|%problem|
                                                              (LIST '|Record|
                                                                    (LIST '|:|
                                                                          '|func|
                                                                          (LIST
                                                                           '|String|))
                                                                    (LIST '|:|
                                                                          '|prob|
                                                                          (LIST
                                                                           '|String|)))))
                                                  (|devaluate| (ELT $ 7))
                                                  (LIST '|Boolean|)
                                                  (LIST '|Union| '#3# '#4# '#5#
                                                        '#6# '#7#))
                                                 |pack|))
                . #2#)
          (EXIT
           (COND
            ((QEQCAR |ansG| 1)
             (COND
              ((EQUAL (QCDR (CDR |ansG|)) "essential singularity")
               (|error| "No series expansion: essential singularity"))
              (#8='T (|error| "No series expansion"))))
            (#8#
             (SEQ
              (LETT |anyone|
                    (|AnyFunctions1|
                     (|GeneralUnivariatePowerSeries| (QREFELT $ 7) |x| |a|))
                    . #2#)
              (EXIT
               (SPADCALL
                (SPADCALL
                 (PROG2 (LETT #1# |ansG| . #2#)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 0)
                                  (|UnivariatePuiseuxSeries| (QREFELT $ 7) |x|
                                                             |a|)
                                  #1#))
                 (|compiledLookupCheck| '|coerce|
                                        (LIST '$
                                              (LIST '|UnivariatePuiseuxSeries|
                                                    (|devaluate| (ELT $ 7)) |x|
                                                    |a|))
                                        (|GeneralUnivariatePowerSeries|
                                         (ELT $ 7) |x| |a|)))
                (|compiledLookupCheck| '|coerce|
                                       (LIST (LIST '|Any|)
                                             (LIST
                                              '|GeneralUnivariatePowerSeries|
                                              (|devaluate| (ELT $ 7)) |x| |a|))
                                       |anyone|)))))))))
        (#8#
         (SEQ
          (LETT |any1|
                (|AnyFunctions1|
                 (|UnivariatePuiseuxSeries| (QREFELT $ 7) |x| |a|))
                . #2#)
          (EXIT
           (SPADCALL (CDR |ans|)
                     (|compiledLookupCheck| '|coerce|
                                            (LIST (LIST '|Any|)
                                                  (LIST
                                                   '|UnivariatePuiseuxSeries|
                                                   (|devaluate| (ELT $ 7)) |x|
                                                   |a|))
                                            |any1|))))))))))) 

(DEFUN |EXPR2UPS;series;SA;21| (|x| $)
  (PROG (|any1| |upxs|)
    (RETURN
     (SEQ
      (LETT |upxs|
            (|UnivariatePuiseuxSeries| (QREFELT $ 7) |x| (|spadConstant| $ 17))
            . #1=(|EXPR2UPS;series;SA;21|))
      (LETT |any1| (|AnyFunctions1| |upxs|) . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL (|spadConstant| $ 19) (|spadConstant| $ 41)
                  (|compiledLookupCheck| '|monomial|
                                         (LIST '$ (|devaluate| (ELT $ 7))
                                               (LIST '|Fraction|
                                                     (LIST '|Integer|)))
                                         |upxs|))
        (|compiledLookupCheck| '|coerce|
                               (LIST (LIST '|Any|) (|devaluate| |upxs|))
                               |any1|))))))) 

(DEFUN |EXPR2UPS;series;FEA;22| (|fcn| $)
  (PROG (|vars|)
    (RETURN
     (SEQ
      (LETT |vars| (SPADCALL |fcn| (QREFELT $ 23)) |EXPR2UPS;series;FEA;22|)
      (EXIT
       (COND ((NULL |vars|) (|error| "series: expression has no variables"))
             ((NULL (NULL (CDR |vars|)))
              (|error| "series: expression has more than one variable"))
             ('T
              (SPADCALL |fcn|
                        (SPADCALL
                         (SPADCALL (|SPADfirst| |vars|) (QREFELT $ 11))
                         (|spadConstant| $ 17) (QREFELT $ 14))
                        (QREFELT $ 48))))))))) 

(DEFUN |EXPR2UPS;series;FEFA;23| (|fcn| |n| $)
  (PROG (|series| |any1| |upxs| |x| |vars|)
    (RETURN
     (SEQ
      (LETT |vars| (SPADCALL |fcn| (QREFELT $ 23))
            . #1=(|EXPR2UPS;series;FEFA;23|))
      (EXIT
       (COND ((NULL |vars|) (|error| "series: expression has no variables"))
             ((NULL (NULL (CDR |vars|)))
              (|error| "series: expression has more than one variable"))
             ('T
              (SEQ (LETT |x| (|SPADfirst| |vars|) . #1#)
                   (LETT |upxs|
                         (|UnivariatePuiseuxSeries| (QREFELT $ 7) |x|
                                                    (|spadConstant| $ 17))
                         . #1#)
                   (LETT |any1| (|AnyFunctions1| |upxs|) . #1#)
                   (LETT |series|
                         (SPADCALL
                          (SPADCALL |fcn|
                                    (SPADCALL (SPADCALL |x| (QREFELT $ 11))
                                              (|spadConstant| $ 17)
                                              (QREFELT $ 14))
                                    (QREFELT $ 48))
                          (|compiledLookupCheck| '|retract|
                                                 (LIST (|devaluate| |upxs|)
                                                       (LIST '|Any|))
                                                 |any1|))
                         . #1#)
                   (EXIT
                    (SPADCALL
                     (SPADCALL |series| |n|
                               (|compiledLookupCheck| '|extend|
                                                      (LIST '$ '$
                                                            (LIST '|Fraction|
                                                                  (LIST
                                                                   '|Integer|)))
                                                      |upxs|))
                     (|compiledLookupCheck| '|coerce|
                                            (LIST (LIST '|Any|)
                                                  (|devaluate| |upxs|))
                                            |any1|))))))))))) 

(DEFUN |EXPR2UPS;series;FEEA;24| (|fcn| |eq| $)
  (PROG (|a| |x| |xx|)
    (RETURN
     (SEQ
      (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 29)) (QREFELT $ 31))
            . #1=(|EXPR2UPS;series;FEEA;24|))
      (EXIT
       (COND
        ((QEQCAR |xx| 1) (|error| "taylor: left hand side must be a variable"))
        ('T
         (SEQ (LETT |x| (QCDR |xx|) . #1#)
              (LETT |a| (SPADCALL |eq| (QREFELT $ 32)) . #1#)
              (EXIT
               (|EXPR2UPS;iSeries|
                (|EXPR2UPS;performSubstitution| |fcn| |x| |a| $) |x| |a|
                $)))))))))) 

(DEFUN |EXPR2UPS;series;FEEFA;25| (|fcn| |eq| |n| $)
  (PROG (|series| |any1| |a| |x| |xx|)
    (RETURN
     (SEQ
      (LETT |xx| (SPADCALL (SPADCALL |eq| (QREFELT $ 29)) (QREFELT $ 31))
            . #1=(|EXPR2UPS;series;FEEFA;25|))
      (EXIT
       (COND
        ((QEQCAR |xx| 1) (|error| "taylor: left hand side must be a variable"))
        ('T
         (SEQ (LETT |x| (QCDR |xx|) . #1#)
              (LETT |a| (SPADCALL |eq| (QREFELT $ 32)) . #1#)
              (LETT |any1|
                    (|AnyFunctions1|
                     (|UnivariatePuiseuxSeries| (QREFELT $ 7) |x| |a|))
                    . #1#)
              (LETT |series|
                    (SPADCALL
                     (|EXPR2UPS;iSeries|
                      (|EXPR2UPS;performSubstitution| |fcn| |x| |a| $) |x| |a|
                      $)
                     (|compiledLookupCheck| '|retract|
                                            (LIST
                                             (LIST '|UnivariatePuiseuxSeries|
                                                   (|devaluate| (ELT $ 7)) |x|
                                                   |a|)
                                             (LIST '|Any|))
                                            |any1|))
                    . #1#)
              (EXIT
               (SPADCALL
                (SPADCALL |series| |n|
                          (|compiledLookupCheck| '|extend|
                                                 (LIST '$ '$
                                                       (LIST '|Fraction|
                                                             (LIST
                                                              '|Integer|)))
                                                 (|UnivariatePuiseuxSeries|
                                                  (ELT $ 7) |x| |a|)))
                (|compiledLookupCheck| '|coerce|
                                       (LIST (LIST '|Any|)
                                             (LIST '|UnivariatePuiseuxSeries|
                                                   (|devaluate| (ELT $ 7)) |x|
                                                   |a|))
                                       |any1|))))))))))) 

(DEFUN |ExpressionToUnivariatePowerSeries| (&REST #1=#:G297)
  (PROG ()
    (RETURN
     (PROG (#2=#:G298)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ExpressionToUnivariatePowerSeries|)
                                           '|domainEqualList|)
                . #3=(|ExpressionToUnivariatePowerSeries|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |ExpressionToUnivariatePowerSeries;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|ExpressionToUnivariatePowerSeries|))))))))))) 

(DEFUN |ExpressionToUnivariatePowerSeries;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ExpressionToUnivariatePowerSeries|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|ExpressionToUnivariatePowerSeries| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 52) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ExpressionToUnivariatePowerSeries|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|ExpressionToUnivariatePowerSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Boolean|)
              (0 . |zero?|) (|Symbol|) (5 . |coerce|) (10 . +) (|Equation| 7)
              (16 . =) (|Equation| $) (22 . |eval|) (28 . |Zero|) (32 . |One|)
              (36 . |One|) (|Any|) |EXPR2UPS;taylor;SA;3| (|List| 10)
              (40 . |variables|) |EXPR2UPS;taylor;FEEA;6|
              |EXPR2UPS;taylor;FEA;4| (45 . |Zero|) (|NonNegativeInteger|)
              |EXPR2UPS;taylor;FENniA;5| (49 . |lhs|) (|Union| 10 '"failed")
              (54 . |retractIfCan|) (59 . |rhs|) |EXPR2UPS;taylor;FEENniA;7|
              |EXPR2UPS;laurent;SA;9| |EXPR2UPS;laurent;FEEA;12|
              |EXPR2UPS;laurent;FEA;10| (|Integer|) |EXPR2UPS;laurent;FEIA;11|
              |EXPR2UPS;laurent;FEEIA;13| (|Fraction| 37) (64 . |One|)
              |EXPR2UPS;puiseux;SA;15| |EXPR2UPS;puiseux;FEEA;18|
              |EXPR2UPS;puiseux;FEA;16| |EXPR2UPS;puiseux;FEFA;17|
              |EXPR2UPS;puiseux;FEEFA;19| |EXPR2UPS;series;SA;21|
              |EXPR2UPS;series;FEEA;24| |EXPR2UPS;series;FEA;22|
              |EXPR2UPS;series;FEFA;23| |EXPR2UPS;series;FEEFA;25|)
           '#(|taylor| 68 |series| 97 |puiseux| 126 |laurent| 155) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 51
                                                 '(1 7 8 0 9 1 7 0 10 11 2 7 0
                                                   0 0 12 2 13 0 7 7 14 2 7 0 0
                                                   15 16 0 7 0 17 0 6 0 18 0 7
                                                   0 19 1 7 22 0 23 0 6 0 26 1
                                                   13 7 0 29 1 7 30 0 31 1 13 7
                                                   0 32 0 40 0 41 1 0 20 7 25 1
                                                   0 20 10 21 2 0 20 7 27 28 3
                                                   0 20 7 13 27 33 2 0 20 7 13
                                                   24 1 0 20 7 49 1 0 20 10 47
                                                   2 0 20 7 40 50 3 0 20 7 13
                                                   40 51 2 0 20 7 13 48 1 0 20
                                                   7 44 1 0 20 10 42 2 0 20 7
                                                   40 45 3 0 20 7 13 40 46 2 0
                                                   20 7 13 43 1 0 20 7 36 1 0
                                                   20 10 34 2 0 20 7 37 38 3 0
                                                   20 7 13 37 39 2 0 20 7 13
                                                   35)))))
           '|lookupComplete|)) 
