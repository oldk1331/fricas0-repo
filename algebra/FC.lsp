
(SDEFUN |FC;get_assignment|
        ((|name| |OutputForm|) (|e| |OutputForm|) (|int_to_floats?| |Boolean|)
         ($ |List| (|String|)))
        (SPADCALL
         (SPADCALL (SPADCALL '= (QREFELT $ 8)) (LIST |name| |e|)
                   (QREFELT $ 10))
         |int_to_floats?| (QREFELT $ 14))) 

(SDEFUN |FC;format_switch|
        ((|switch1| |OutputForm|) (|l| |List| (|String|))
         ($ |List| (|List| (|String|))))
        (SPROG ((|r| (|List| (|String|))) (|l1| (|List| (|OutputForm|))))
               (SEQ
                (COND
                 ((LISTP |switch1|)
                  (SEQ (LETT |l1| |switch1| . #1=(|FC;format_switch|))
                       (EXIT
                        (COND
                         ((EQ (|SPADfirst| |l1|) 'NULL)
                          (LETT |switch1| (|SPADfirst| (CDR |l1|)) . #1#)))))))
                (LETT |r| (NREVERSE (SPADCALL |switch1| (QREFELT $ 15))) . #1#)
                (SEQ G190
                     (COND
                      ((NULL
                        (COND
                         ((OR (NULL |r|) (EQUAL (|SPADfirst| |r|) "%l")) 'NIL)
                         ('T 'T)))
                       (GO G191)))
                     (SEQ (LETT |l| (CONS (|SPADfirst| |r|) |l|) . #1#)
                          (EXIT (LETT |r| (CDR |r|) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (LIST |l| |r|))))) 

(SDEFUN |FC;fortFormatIf1|
        ((|switch1| |OutputForm|) (|i| |Integer|) (|kind| |String|)
         ($ |List| (|String|)))
        (SPROG
         ((|r| NIL) (|#G11| #1=(|List| (|List| (|String|))))
          (|l| (|List| (|String|))) (|#G10| #1#))
         (SEQ (LETT |l| (LIST ")THEN") . #2=(|FC;fortFormatIf1|))
              (SPADCALL (- |i|) (QREFELT $ 18))
              (PROGN
               (LETT |#G10| (|FC;format_switch| |switch1| |l| $) . #2#)
               (LETT |#G11| |#G10| . #2#)
               (LETT |l| (|SPADfirst| |#G11|) . #2#)
               (LETT |#G11| (CDR |#G11|) . #2#)
               (LETT |r| (|SPADfirst| |#G11|) . #2#)
               |#G10|)
              (SPADCALL |i| (QREFELT $ 18))
              (EXIT (NREVERSE (APPEND (NREVERSE |l|) (CONS |kind| |r|))))))) 

(SDEFUN |FC;fortFormatIf| ((|switch1| |OutputForm|) ($ |List| (|String|)))
        (SPROG NIL
               (SPADCALL (CONS #'|FC;fortFormatIf!0| (VECTOR $ |switch1|))
                         (QREFELT $ 20)))) 

(SDEFUN |FC;fortFormatIf!0| (($$ NIL))
        (PROG (|switch1| $)
          (LETT |switch1| (QREFELT $$ 1) . #1=(|FC;fortFormatIf|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|FC;fortFormatIf1| |switch1| 8 "IF(" $))))) 

(SDEFUN |FC;fortFormatElseIf| ((|switch1| |OutputForm|) ($ |List| (|String|)))
        (SPROG NIL
               (SPADCALL (CONS #'|FC;fortFormatElseIf!0| (VECTOR $ |switch1|))
                         (QREFELT $ 20)))) 

(SDEFUN |FC;fortFormatElseIf!0| (($$ NIL))
        (PROG (|switch1| $)
          (LETT |switch1| (QREFELT $$ 1) . #1=(|FC;fortFormatElseIf|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|FC;fortFormatIf1| |switch1| 12 "ELSEIF(" $))))) 

(SDEFUN |FC;fortFormatIfGoto1|
        ((|switch1| |OutputForm|) (|lab| |SingleInteger|)
         ($ |List| (|String|)))
        (SPROG
         ((|r| NIL) (|#G19| #1=(|List| (|List| (|String|))))
          (|l| (|List| (|String|))) (|#G18| #1#))
         (SEQ
          (LETT |l| (LIST ")GOTO " (STRINGIMAGE |lab|))
                . #2=(|FC;fortFormatIfGoto1|))
          (SPADCALL -8 (QREFELT $ 18))
          (PROGN
           (LETT |#G18| (|FC;format_switch| |switch1| |l| $) . #2#)
           (LETT |#G19| |#G18| . #2#)
           (LETT |l| (|SPADfirst| |#G19|) . #2#)
           (LETT |#G19| (CDR |#G19|) . #2#)
           (LETT |r| (|SPADfirst| |#G19|) . #2#)
           |#G18|)
          (SPADCALL 8 (QREFELT $ 18))
          (EXIT (NREVERSE (APPEND (NREVERSE |l|) (CONS "IF(" |r|))))))) 

(SDEFUN |FC;fortFormatIfGoto|
        ((|switch1| |OutputForm|) (|lab| |SingleInteger|)
         ($ |List| (|String|)))
        (SPROG NIL
               (SPADCALL
                (CONS #'|FC;fortFormatIfGoto!0| (VECTOR $ |lab| |switch1|))
                (QREFELT $ 20)))) 

(SDEFUN |FC;fortFormatIfGoto!0| (($$ NIL))
        (PROG (|switch1| |lab| $)
          (LETT |switch1| (QREFELT $$ 2) . #1=(|FC;fortFormatIfGoto|))
          (LETT |lab| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|FC;fortFormatIfGoto1| |switch1| |lab| $))))) 

(SDEFUN |FC;fortFormatLabelledIfGoto1|
        ((|switch1| |OutputForm|) (|lab1| |SingleInteger|)
         (|lab2| |SingleInteger|) ($ |List| (|String|)))
        (SPROG ((|l| (|List| (|String|))) (|labString| (|String|)) (|i| NIL))
               (SEQ
                (LETT |l| (|FC;fortFormatIfGoto1| |switch1| |lab2| $)
                      . #1=(|FC;fortFormatLabelledIfGoto1|))
                (LETT |labString| (STRINGIMAGE |lab1|) . #1#)
                (SEQ (LETT |i| (QCSIZE |labString|) . #1#) G190
                     (COND ((> |i| 5) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |labString| (STRCONC |labString| " ") . #1#)))
                     (LETT |i| (+ |i| 1) . #1#) (GO G190) G191 (EXIT NIL))
                (LETT |l| (SPADCALL |l| (QREFELT $ 21)) . #1#)
                (EXIT
                 (CONS
                  (STRCONC |labString|
                           (SPADCALL (|SPADfirst| |l|)
                                     (SPADCALL 7 (QREFELT $ 23))
                                     (QREFELT $ 25)))
                  (CDR |l|)))))) 

(SDEFUN |FC;fortFormatLabelledIfGoto|
        ((|switch1| |OutputForm|) (|lab1| |SingleInteger|)
         (|lab2| |SingleInteger|) ($ |List| (|String|)))
        (SPROG NIL
               (SPADCALL
                (CONS #'|FC;fortFormatLabelledIfGoto!0|
                      (VECTOR $ |lab2| |lab1| |switch1|))
                (QREFELT $ 26)))) 

(SDEFUN |FC;fortFormatLabelledIfGoto!0| (($$ NIL))
        (PROG (|switch1| |lab1| |lab2| $)
          (LETT |switch1| (QREFELT $$ 3) . #1=(|FC;fortFormatLabelledIfGoto|))
          (LETT |lab1| (QREFELT $$ 2) . #1#)
          (LETT |lab2| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (|FC;fortFormatLabelledIfGoto1| |switch1| |lab1| |lab2| $))))) 

(SDEFUN |FC;getfortarrayexp1|
        ((|name| |Symbol|) (|of| |OutputForm|) (|int_to_floats?| |Boolean|)
         ($ |List| (|String|)))
        (SPROG ((#1=#:G145 NIL) (|l| (|List| (|String|))))
               (SEQ
                (LETT |l|
                      (SPADCALL |name| 'T |of| |int_to_floats?| (QREFELT $ 27))
                      . #2=(|FC;getfortarrayexp1|))
                (EXIT
                 (SPADCALL |l|
                           (PROG1 (LETT #1# (- (LENGTH |l|) 2) . #2#)
                             (|check_subtype| (>= #1# 0)
                                              '(|NonNegativeInteger|) #1#))
                           (QREFELT $ 29)))))) 

(SDEFUN |FC;getfortarrayexp|
        ((|name| |Symbol|) (|of| |OutputForm|) (|int_to_floats?| |Boolean|)
         ($ |List| (|String|)))
        (SPROG NIL
               (SPADCALL |int_to_floats?|
                         (CONS #'|FC;getfortarrayexp!0|
                               (VECTOR $ |int_to_floats?| |of| |name|))
                         (QREFELT $ 30)))) 

(SDEFUN |FC;getfortarrayexp!0| (($$ NIL))
        (PROG (|name| |of| |int_to_floats?| $)
          (LETT |name| (QREFELT $$ 3) . #1=(|FC;getfortarrayexp|))
          (LETT |of| (QREFELT $$ 2) . #1#)
          (LETT |int_to_floats?| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (|FC;getfortarrayexp1| |name| |of| |int_to_floats?| $))))) 

(SDEFUN |FC;fortFormatDo1|
        ((|var1| |Symbol|) (|lo| |OutputForm|) (|hi| |OutputForm|)
         (|incr| |OutputForm|) (|lab| |SingleInteger|) ($ |List| (|String|)))
        (SPROG
         ((|il| (|List| (|String|))) (|incl| (|List| (|String|)))
          (|hil| #1=(|List| (|String|))) (|lol| #1#))
         (SEQ
          (LETT |lol| (SPADCALL |lo| (QREFELT $ 15)) . #2=(|FC;fortFormatDo1|))
          (LETT |hil| (SPADCALL |hi| (QREFELT $ 15)) . #2#)
          (LETT |incl|
                (COND
                 ((EQUAL |incr| 1) (CONS "," (SPADCALL |incr| (QREFELT $ 15))))
                 ('T NIL))
                . #2#)
          (LETT |il| (APPEND |lol| (CONS "," (APPEND |hil| |incl|))) . #2#)
          (EXIT
           (APPEND
            (LIST "DO " (STRINGIMAGE |lab|) " "
                  (SPADCALL |var1| (QREFELT $ 31)) "=")
            |il|))))) 

(SDEFUN |FC;fortFormatDo|
        ((|var1| |Symbol|) (|lo| |OutputForm|) (|hi| |OutputForm|)
         (|inc| |OutputForm|) (|lab| |SingleInteger|) ($ |List| (|String|)))
        (SPROG NIL
               (SPADCALL 'NIL
                         (CONS #'|FC;fortFormatDo!0|
                               (VECTOR $ |lab| |inc| |hi| |lo| |var1|))
                         (QREFELT $ 30)))) 

(SDEFUN |FC;fortFormatDo!0| (($$ NIL))
        (PROG (|var1| |lo| |hi| |inc| |lab| $)
          (LETT |var1| (QREFELT $$ 5) . #1=(|FC;fortFormatDo|))
          (LETT |lo| (QREFELT $$ 4) . #1#)
          (LETT |hi| (QREFELT $$ 3) . #1#)
          (LETT |inc| (QREFELT $$ 2) . #1#)
          (LETT |lab| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|FC;fortFormatDo1| |var1| |lo| |hi| |inc| |lab| $))))) 

(SDEFUN |FC;addCommas| ((|l| |List| (|Symbol|)) ($ |List| (|String|)))
        (SPROG ((|r| (|List| (|String|))) (#1=#:G159 NIL) (|e| NIL))
               (SEQ
                (COND ((NULL |l|) NIL)
                      ('T
                       (SEQ
                        (LETT |r|
                              (LIST
                               (SPADCALL (|SPADfirst| |l|) (QREFELT $ 31)))
                              . #2=(|FC;addCommas|))
                        (SEQ (LETT |e| NIL . #2#) (LETT #1# (CDR |l|) . #2#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |e| (CAR #1#) . #2#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |r|
                                     (CONS (SPADCALL |e| (QREFELT $ 31))
                                           (CONS "," |r|))
                                     . #2#)))
                             (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (NREVERSE |r|)))))))) 

(PUT '|FC;indentFortLevel| '|SPADreplace| '|indentFortLevel|) 

(SDEFUN |FC;indentFortLevel| ((|i| |Integer|) ($ |Void|))
        (|indentFortLevel| |i|)) 

(SDEFUN |FC;setLabelValue;2Si;16| ((|u| |SingleInteger|) ($ |SingleInteger|))
        (SETELT $ 35 |u|)) 

(SDEFUN |FC;newLabel| (($ |SingleInteger|))
        (SEQ (SETELT $ 35 (|add_SI| (QREFELT $ 35) 1)) (EXIT (QREFELT $ 35)))) 

(SDEFUN |FC;commaSep| ((|l| |List| (|String|)) ($ |List| (|String|)))
        (SPROG
         ((#1=#:G167 NIL) (#2=#:G166 #3=(|List| (|String|))) (#4=#:G168 #3#)
          (#5=#:G170 NIL) (|u| NIL))
         (SEQ
          (CONS (SPADCALL |l| 1 (QREFELT $ 39))
                (PROGN
                 (LETT #1# NIL . #6=(|FC;commaSep|))
                 (SEQ (LETT |u| NIL . #6#) (LETT #5# (CDR |l|) . #6#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |u| (CAR #5#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4# (LIST "," |u|) . #6#)
                         (COND (#1# (LETT #2# (APPEND #2# #4#) . #6#))
                               ('T
                                (PROGN
                                 (LETT #2# #4# . #6#)
                                 (LETT #1# 'T . #6#)))))))
                      (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) ('T NIL))))))) 

(SDEFUN |FC;getReturn|
        ((|rec| |Record| (|:| |empty?| (|Boolean|))
          (|:| |value|
               (|Record| (|:| |ints2Floats?| (|Boolean|))
                         (|:| |expr| (|OutputForm|)))))
         ($ |List| (|String|)))
        (SPROG
         ((|rv| (|OutputForm|))
          (|rt|
           (|Record| (|:| |ints2Floats?| (|Boolean|))
                     (|:| |expr| (|OutputForm|))))
          (|returnToken| (|OutputForm|)))
         (SEQ
          (LETT |returnToken| (SPADCALL 'RETURN (QREFELT $ 8))
                . #1=(|FC;getReturn|))
          (EXIT
           (COND ((QCAR |rec|) (SPADCALL |returnToken| 'NIL (QREFELT $ 14)))
                 ('T
                  (SEQ (LETT |rt| (QCDR |rec|) . #1#)
                       (LETT |rv| (QCDR |rt|) . #1#)
                       (EXIT
                        (SPADCALL
                         (SPADCALL |returnToken| (LIST |rv|) (QREFELT $ 10))
                         (QCAR |rt|) (QREFELT $ 14)))))))))) 

(SDEFUN |FC;getStop| (($ |List| (|String|)))
        (SPADCALL (LIST "STOP") (QREFELT $ 21))) 

(SDEFUN |FC;getSave| (($ |List| (|String|)))
        (SPADCALL (LIST "SAVE") (QREFELT $ 21))) 

(SDEFUN |FC;getCommon|
        ((|u| |Record| (|:| |name| (|Symbol|))
          (|:| |contents| (|List| (|Symbol|))))
         ($ |List| (|String|)))
        (SPADCALL
         (APPEND (LIST "COMMON" " /" (SPADCALL (QCAR |u|) (QREFELT $ 31)) "/ ")
                 (|FC;addCommas| (QCDR |u|) $))
         (QREFELT $ 21))) 

(SDEFUN |FC;getPrint| ((|l| |List| (|OutputForm|)) ($ |List| (|String|)))
        (SPROG ((|ll| (|List| (|String|))) (#1=#:G182 NIL) (|i| NIL))
               (SEQ (LETT |ll| (LIST "PRINT*") . #2=(|FC;getPrint|))
                    (SEQ (LETT |i| NIL . #2#) (LETT #1# |l| . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |ll|
                                 (APPEND |ll|
                                         (CONS ","
                                               (SPADCALL |i| (QREFELT $ 40))))
                                 . #2#)))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |ll| (QREFELT $ 21)))))) 

(SDEFUN |FC;getBlock| ((|rec| |List| $) ($ |List| (|String|)))
        (SPROG ((|expr| (|List| (|String|))) (#1=#:G186 NIL) (|u| NIL))
               (SEQ (|FC;indentFortLevel| 1 $)
                    (LETT |expr| NIL . #2=(|FC;getBlock|))
                    (SEQ (LETT |u| NIL . #2#) (LETT #1# |rec| . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |u| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |expr|
                                 (APPEND |expr| (SPADCALL |u| (QREFELT $ 41)))
                                 . #2#)))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (|FC;indentFortLevel| -1 $) (EXIT |expr|)))) 

(SDEFUN |FC;getBody| ((|f| $) ($ |List| (|String|)))
        (SPROG ((|expr| (|List| (|String|))))
               (SEQ
                (COND
                 ((QEQCAR (SPADCALL |f| (QREFELT $ 43)) 4)
                  (SPADCALL |f| (QREFELT $ 41)))
                 ('T
                  (SEQ (|FC;indentFortLevel| 1 $)
                       (LETT |expr| (SPADCALL |f| (QREFELT $ 41)) |FC;getBody|)
                       (|FC;indentFortLevel| -1 $) (EXIT |expr|))))))) 

(SDEFUN |FC;getElseIf| ((|f| $) ($ |List| (|String|)))
        (SPROG
         ((|expr| (|List| (|String|))) (|elseBranch| ($)) (#1=#:G214 NIL)
          (|rec|
           (|Union| (|:| |nullBranch| "null")
                    (|:| |assignmentBranch|
                         (|Record| (|:| |var| (|Symbol|))
                                   (|:| |arrayIndex|
                                        (|List| (|Polynomial| (|Integer|))))
                                   (|:| |rand|
                                        (|Record|
                                         (|:| |ints2Floats?| (|Boolean|))
                                         (|:| |expr| (|OutputForm|))))))
                    (|:| |arrayAssignmentBranch|
                         (|Record| (|:| |var| (|Symbol|))
                                   (|:| |rand| (|OutputForm|))
                                   (|:| |ints2Floats?| (|Boolean|))))
                    (|:| |conditionalBranch|
                         (|Record| (|:| |switch| (|Switch|))
                                   (|:| |thenClause| $) (|:| |elseClause| $)))
                    (|:| |returnBranch|
                         (|Record| (|:| |empty?| (|Boolean|))
                                   (|:| |value|
                                        (|Record|
                                         (|:| |ints2Floats?| (|Boolean|))
                                         (|:| |expr| (|OutputForm|))))))
                    (|:| |blockBranch| (|List| $))
                    (|:| |commentBranch| (|List| (|String|)))
                    (|:| |callBranch| (|String|))
                    (|:| |forBranch|
                         (|Record|
                          (|:| |range|
                               (|SegmentBinding| (|Polynomial| (|Integer|))))
                          (|:| |span| (|Polynomial| (|Integer|)))
                          (|:| |body| $)))
                    (|:| |labelBranch| (|SingleInteger|))
                    (|:| |loopBranch|
                         (|Record| (|:| |switch| (|Switch|)) (|:| |body| $)))
                    (|:| |commonBranch|
                         (|Record| (|:| |name| (|Symbol|))
                                   (|:| |contents| (|List| (|Symbol|)))))
                    (|:| |printBranch| (|List| (|OutputForm|))))))
         (SEQ (LETT |rec| (SPADCALL |f| (QREFELT $ 53)) . #2=(|FC;getElseIf|))
              (LETT |expr|
                    (|FC;fortFormatElseIf|
                     (SPADCALL
                      (QVELT
                       (PROG2 (LETT #1# |rec| . #2#)
                           (QCDR #1#)
                         (|check_union| (QEQCAR #1# 3)
                                        (|Record| (|:| |switch| (|Switch|))
                                                  (|:| |thenClause| $)
                                                  (|:| |elseClause| $))
                                        #1#))
                       0)
                      (QREFELT $ 55))
                     $)
                    . #2#)
              (LETT |expr|
                    (APPEND |expr|
                            (|FC;getBody|
                             (QVELT
                              (PROG2 (LETT #1# |rec| . #2#)
                                  (QCDR #1#)
                                (|check_union| (QEQCAR #1# 3)
                                               (|Record|
                                                (|:| |switch| (|Switch|))
                                                (|:| |thenClause| $)
                                                (|:| |elseClause| $))
                                               #1#))
                              1)
                             $))
                    . #2#)
              (LETT |elseBranch|
                    (QVELT
                     (PROG2 (LETT #1# |rec| . #2#)
                         (QCDR #1#)
                       (|check_union| (QEQCAR #1# 3)
                                      (|Record| (|:| |switch| (|Switch|))
                                                (|:| |thenClause| $)
                                                (|:| |elseClause| $))
                                      #1#))
                     2)
                    . #2#)
              (COND
               ((NULL (QEQCAR (SPADCALL |elseBranch| (QREFELT $ 43)) 0))
                (EXIT
                 (COND
                  ((QEQCAR (SPADCALL |elseBranch| (QREFELT $ 43)) 2)
                   (APPEND |expr| (|FC;getElseIf| |elseBranch| $)))
                  ('T
                   (SEQ
                    (LETT |expr|
                          (APPEND |expr|
                                  (SPADCALL (SPADCALL 'ELSE (QREFELT $ 8)) 'NIL
                                            (QREFELT $ 14)))
                          . #2#)
                    (EXIT
                     (LETT |expr| (APPEND |expr| (|FC;getBody| |elseBranch| $))
                           . #2#))))))))
              (EXIT |expr|)))) 

(SDEFUN |FC;getContinue| ((|label| |SingleInteger|) ($ |List| (|String|)))
        (SPROG
         ((|sp| (|OutputForm|)) (|cnt| (#1="CONTINUE")) (|lab| (|String|)))
         (SEQ (LETT |lab| (STRINGIMAGE |label|) . #2=(|FC;getContinue|))
              (COND
               ((SPADCALL (QCSIZE |lab|) 6 (QREFELT $ 56))
                (|error| "Label too big")))
              (LETT |cnt| #1# . #2#)
              (LETT |sp|
                    (SPADCALL (- |$fortIndent| (QCSIZE |lab|)) (QREFELT $ 57))
                    . #2#)
              (EXIT (STRCONC |lab| |sp| |cnt|))))) 

(SDEFUN |FC;getGoto| ((|label| |SingleInteger|) ($ |List| (|String|)))
        (SPADCALL (LIST (STRCONC "GOTO " (STRINGIMAGE |label|)))
                  (QREFELT $ 21))) 

(SDEFUN |FC;getRepeat|
        ((|repRec| |Record| (|:| |switch| (|Switch|)) (|:| |body| $))
         ($ |List| (|String|)))
        (SPROG ((|bod| ($)) (|lab| (|SingleInteger|)) (|sw| (|Switch|)))
               (SEQ
                (LETT |sw| (SPADCALL (QCAR |repRec|) (QREFELT $ 58))
                      . #1=(|FC;getRepeat|))
                (LETT |lab| (|FC;newLabel| $) . #1#)
                (LETT |bod| (QCDR |repRec|) . #1#)
                (EXIT
                 (APPEND (|FC;getContinue| |lab| $)
                         (APPEND (|FC;getBody| |bod| $)
                                 (|FC;fortFormatIfGoto|
                                  (SPADCALL |sw| (QREFELT $ 55)) |lab| $))))))) 

(SDEFUN |FC;getWhile|
        ((|whileRec| |Record| (|:| |switch| (|Switch|)) (|:| |body| $))
         ($ |List| (|String|)))
        (SPROG
         ((|rl1| (|List| (|List| (|String|)))) (|ig| (|List| (|String|)))
          (|bod| ($)) (|lab2| #1=(|SingleInteger|)) (|lab1| #1#)
          (|sw| (|Switch|)))
         (SEQ
          (LETT |sw| (SPADCALL (QCAR |whileRec|) (QREFELT $ 58))
                . #2=(|FC;getWhile|))
          (LETT |lab1| (|FC;newLabel| $) . #2#)
          (LETT |lab2| (|FC;newLabel| $) . #2#)
          (LETT |bod| (QCDR |whileRec|) . #2#)
          (LETT |ig|
                (|FC;fortFormatLabelledIfGoto| (SPADCALL |sw| (QREFELT $ 55))
                 |lab1| |lab2| $)
                . #2#)
          (LETT |rl1|
                (LIST |ig| (|FC;getBody| |bod| $)
                      (|FC;getBody| (SPADCALL |lab1| (QREFELT $ 59)) $)
                      (|FC;getContinue| |lab2| $))
                . #2#)
          (EXIT (SPADCALL |rl1| (QREFELT $ 60)))))) 

(SDEFUN |FC;getArrayAssign|
        ((|rec| |Record| (|:| |var| (|Symbol|)) (|:| |rand| (|OutputForm|))
          (|:| |ints2Floats?| (|Boolean|)))
         ($ |List| (|String|)))
        (|FC;getfortarrayexp| (QVELT |rec| 0) (QVELT |rec| 1) (QVELT |rec| 2)
         $)) 

(SDEFUN |FC;getAssign|
        ((|rec| |Record| (|:| |var| (|Symbol|))
          (|:| |arrayIndex| (|List| (|Polynomial| (|Integer|))))
          (|:| |rand|
               (|Record| (|:| |ints2Floats?| (|Boolean|))
                         (|:| |expr| (|OutputForm|)))))
         ($ |List| (|String|)))
        (SPROG
         ((|ex| #1=(|OutputForm|))
          (|ass| (|Record| (|:| |ints2Floats?| (|Boolean|)) (|:| |expr| #1#)))
          (|lhs| (|OutputForm|))
          (|indices| (|List| (|Polynomial| (|Integer|)))))
         (SEQ (LETT |indices| (QVELT |rec| 1) . #2=(|FC;getAssign|))
              (LETT |lhs| (SPADCALL (QVELT |rec| 0) (QREFELT $ 8)) . #2#)
              (COND
               ((NULL (NULL |indices|))
                (LETT |lhs|
                      (SPADCALL |lhs|
                                (SPADCALL (ELT $ 61) |indices| (QREFELT $ 66))
                                (QREFELT $ 10))
                      . #2#)))
              (LETT |ass| (QVELT |rec| 2) . #2#) (LETT |ex| (QCDR |ass|) . #2#)
              (EXIT (|FC;get_assignment| |lhs| |ex| (QCAR |ass|) $))))) 

(SDEFUN |FC;getCond|
        ((|rec| |Record| (|:| |switch| (|Switch|)) (|:| |thenClause| $)
          (|:| |elseClause| $))
         ($ |List| (|String|)))
        (SPROG ((|expr| (|List| (|String|))) (|elseBranch| ($)))
               (SEQ
                (LETT |expr|
                      (APPEND
                       (|FC;fortFormatIf|
                        (SPADCALL (QVELT |rec| 0) (QREFELT $ 55)) $)
                       (|FC;getBody| (QVELT |rec| 1) $))
                      . #1=(|FC;getCond|))
                (LETT |elseBranch| (QVELT |rec| 2) . #1#)
                (COND
                 ((NULL (QEQCAR (SPADCALL |elseBranch| (QREFELT $ 43)) 0))
                  (COND
                   ((QEQCAR (SPADCALL |elseBranch| (QREFELT $ 43)) 2)
                    (LETT |expr|
                          (APPEND |expr| (|FC;getElseIf| |elseBranch| $))
                          . #1#))
                   ('T
                    (LETT |expr|
                          (APPEND |expr|
                                  (APPEND
                                   (SPADCALL (SPADCALL 'ELSE (QREFELT $ 8))
                                             'NIL (QREFELT $ 14))
                                   (|FC;getBody| |elseBranch| $)))
                          . #1#)))))
                (EXIT
                 (APPEND |expr|
                         (SPADCALL (SPADCALL 'ENDIF (QREFELT $ 8)) 'NIL
                                   (QREFELT $ 14))))))) 

(SDEFUN |FC;getComment| ((|rec| |List| (|String|)) ($ |List| (|String|)))
        (SPROG ((#1=#:G286 NIL) (|c| NIL) (#2=#:G285 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|FC;getComment|))
                 (SEQ (LETT |c| NIL . #3#) (LETT #1# |rec| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (STRCONC "C     " |c|) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FC;getCall| ((|rec| |String|) ($ |List| (|String|)))
        (SPROG ((|expr| (|String|)))
               (SEQ (LETT |expr| (STRCONC "CALL " |rec|) |FC;getCall|)
                    (EXIT
                     (COND
                      ((SPADCALL (QCSIZE |expr|) 1320 (QREFELT $ 56))
                       (|error| "Fortran CALL too large"))
                      ('T (SPADCALL (LIST |expr|) (QREFELT $ 21)))))))) 

(SDEFUN |FC;getFor|
        ((|rec| |Record|
          (|:| |range| #1=(|SegmentBinding| (|Polynomial| (|Integer|))))
          (|:| |span| #2=(|Polynomial| (|Integer|))) (|:| |body| $))
         ($ |List| (|String|)))
        (SPROG
         ((|expr| (|List| (|String|))) (|lab| (|SingleInteger|))
          (|increment| #2#) (|rnge| #1#))
         (SEQ (LETT |rnge| (QVELT |rec| 0) . #3=(|FC;getFor|))
              (LETT |increment| (QVELT |rec| 1) . #3#)
              (LETT |lab| (|FC;newLabel| $) . #3#)
              (SPADCALL (SPADCALL |rnge| (QREFELT $ 68))
                        (SPADCALL (QREFELT $ 70)) (QREFELT $ 72))
              (LETT |expr|
                    (|FC;fortFormatDo| (SPADCALL |rnge| (QREFELT $ 68))
                     (SPADCALL
                      (SPADCALL (SPADCALL |rnge| (QREFELT $ 74))
                                (QREFELT $ 75))
                      (QREFELT $ 61))
                     (SPADCALL
                      (SPADCALL (SPADCALL |rnge| (QREFELT $ 74))
                                (QREFELT $ 76))
                      (QREFELT $ 61))
                     (SPADCALL |increment| (QREFELT $ 61)) |lab| $)
                    . #3#)
              (EXIT
               (APPEND |expr|
                       (APPEND (|FC;getBody| (QVELT |rec| 2) $)
                               (|FC;getContinue| |lab| $))))))) 

(SDEFUN |FC;getCode;$L;37| ((|f| $) ($ |List| (|String|)))
        (SPROG
         ((#1=#:G324 NIL) (#2=#:G325 NIL) (#3=#:G323 NIL) (#4=#:G322 NIL)
          (#5=#:G321 NIL) (#6=#:G320 NIL) (#7=#:G319 NIL) (#8=#:G318 NIL)
          (#9=#:G317 NIL) (#10=#:G316 NIL) (#11=#:G315 NIL) (#12=#:G314 NIL)
          (|rec|
           (|Union| (|:| |nullBranch| "null")
                    (|:| |assignmentBranch|
                         (|Record| (|:| |var| (|Symbol|))
                                   (|:| |arrayIndex|
                                        (|List| (|Polynomial| (|Integer|))))
                                   (|:| |rand|
                                        (|Record|
                                         (|:| |ints2Floats?| (|Boolean|))
                                         (|:| |expr| (|OutputForm|))))))
                    (|:| |arrayAssignmentBranch|
                         (|Record| (|:| |var| (|Symbol|))
                                   (|:| |rand| (|OutputForm|))
                                   (|:| |ints2Floats?| (|Boolean|))))
                    (|:| |conditionalBranch|
                         (|Record| (|:| |switch| (|Switch|))
                                   (|:| |thenClause| $) (|:| |elseClause| $)))
                    (|:| |returnBranch|
                         (|Record| (|:| |empty?| (|Boolean|))
                                   (|:| |value|
                                        (|Record|
                                         (|:| |ints2Floats?| (|Boolean|))
                                         (|:| |expr| (|OutputForm|))))))
                    (|:| |blockBranch| (|List| $))
                    (|:| |commentBranch| (|List| (|String|)))
                    (|:| |callBranch| (|String|))
                    (|:| |forBranch|
                         (|Record|
                          (|:| |range|
                               (|SegmentBinding| (|Polynomial| (|Integer|))))
                          (|:| |span| (|Polynomial| (|Integer|)))
                          (|:| |body| $)))
                    (|:| |labelBranch| (|SingleInteger|))
                    (|:| |loopBranch|
                         (|Record| (|:| |switch| (|Switch|)) (|:| |body| $)))
                    (|:| |commonBranch|
                         (|Record| (|:| |name| (|Symbol|))
                                   (|:| |contents| (|List| (|Symbol|)))))
                    (|:| |printBranch| (|List| (|OutputForm|)))))
          (|opp|
           (|Union| (|:| |Null| "null") (|:| |Assignment| "assignment")
                    (|:| |Conditional| "conditional") (|:| |Return| "return")
                    (|:| |Block| "block") (|:| |Comment| "comment")
                    (|:| |Call| "call") (|:| |For| "for") (|:| |While| "while")
                    (|:| |Repeat| "repeat") (|:| |Goto| "goto")
                    (|:| |Continue| "continue")
                    (|:| |ArrayAssignment| "arrayAssignment")
                    (|:| |Save| "save") (|:| |Stop| "stop")
                    (|:| |Common| "common") (|:| |Print| "print"))))
         (SEQ
          (LETT |opp| (SPADCALL |f| (QREFELT $ 43)) . #13=(|FC;getCode;$L;37|))
          (LETT |rec| (SPADCALL |f| (QREFELT $ 53)) . #13#)
          (EXIT
           (COND
            ((QEQCAR |opp| 1)
             (|FC;getAssign|
              (PROG2 (LETT #12# |rec| . #13#)
                  (QCDR #12#)
                (|check_union| (QEQCAR #12# 1)
                               (|Record| (|:| |var| (|Symbol|))
                                         (|:| |arrayIndex|
                                              (|List|
                                               (|Polynomial| (|Integer|))))
                                         (|:| |rand|
                                              (|Record|
                                               (|:| |ints2Floats?| (|Boolean|))
                                               (|:| |expr| (|OutputForm|)))))
                               #12#))
              $))
            ((QEQCAR |opp| 12)
             (|FC;getArrayAssign|
              (PROG2 (LETT #11# |rec| . #13#)
                  (QCDR #11#)
                (|check_union| (QEQCAR #11# 2)
                               (|Record| (|:| |var| (|Symbol|))
                                         (|:| |rand| (|OutputForm|))
                                         (|:| |ints2Floats?| (|Boolean|)))
                               #11#))
              $))
            ((QEQCAR |opp| 2)
             (|FC;getCond|
              (PROG2 (LETT #10# |rec| . #13#)
                  (QCDR #10#)
                (|check_union| (QEQCAR #10# 3)
                               (|Record| (|:| |switch| (|Switch|))
                                         (|:| |thenClause| $)
                                         (|:| |elseClause| $))
                               #10#))
              $))
            ((QEQCAR |opp| 3)
             (|FC;getReturn|
              (PROG2 (LETT #9# |rec| . #13#)
                  (QCDR #9#)
                (|check_union| (QEQCAR #9# 4)
                               (|Record| (|:| |empty?| (|Boolean|))
                                         (|:| |value|
                                              (|Record|
                                               (|:| |ints2Floats?| (|Boolean|))
                                               (|:| |expr| (|OutputForm|)))))
                               #9#))
              $))
            ((QEQCAR |opp| 4)
             (|FC;getBlock|
              (PROG2 (LETT #8# |rec| . #13#)
                  (QCDR #8#)
                (|check_union| (QEQCAR #8# 5) (|List| $) #8#))
              $))
            ((QEQCAR |opp| 5)
             (|FC;getComment|
              (PROG2 (LETT #7# |rec| . #13#)
                  (QCDR #7#)
                (|check_union| (QEQCAR #7# 6) (|List| (|String|)) #7#))
              $))
            ((QEQCAR |opp| 6)
             (|FC;getCall|
              (PROG2 (LETT #6# |rec| . #13#)
                  (QCDR #6#)
                (|check_union| (QEQCAR #6# 7) (|String|) #6#))
              $))
            ((QEQCAR |opp| 7)
             (|FC;getFor|
              (PROG2 (LETT #5# |rec| . #13#)
                  (QCDR #5#)
                (|check_union| (QEQCAR #5# 8)
                               (|Record|
                                (|:| |range|
                                     (|SegmentBinding|
                                      (|Polynomial| (|Integer|))))
                                (|:| |span| (|Polynomial| (|Integer|)))
                                (|:| |body| $))
                               #5#))
              $))
            ((QEQCAR |opp| 11)
             (|FC;getContinue|
              (PROG2 (LETT #4# |rec| . #13#)
                  (QCDR #4#)
                (|check_union| (QEQCAR #4# 9) (|SingleInteger|) #4#))
              $))
            ((QEQCAR |opp| 10)
             (|FC;getGoto|
              (PROG2 (LETT #4# |rec| . #13#)
                  (QCDR #4#)
                (|check_union| (QEQCAR #4# 9) (|SingleInteger|) #4#))
              $))
            ((QEQCAR |opp| 9)
             (|FC;getRepeat|
              (PROG2 (LETT #3# |rec| . #13#)
                  (QCDR #3#)
                (|check_union| (QEQCAR #3# 10)
                               (|Record| (|:| |switch| (|Switch|))
                                         (|:| |body| $))
                               #3#))
              $))
            ((QEQCAR |opp| 8)
             (|FC;getWhile|
              (PROG2 (LETT #3# |rec| . #13#)
                  (QCDR #3#)
                (|check_union| (QEQCAR #3# 10)
                               (|Record| (|:| |switch| (|Switch|))
                                         (|:| |body| $))
                               #3#))
              $))
            ((QEQCAR |opp| 13) (|FC;getSave| $))
            ((QEQCAR |opp| 14) (|FC;getStop| $))
            ((QEQCAR |opp| 16)
             (|FC;getPrint|
              (PROG2 (LETT #2# |rec| . #13#)
                  (QCDR #2#)
                (|check_union| (QEQCAR #2# 12) (|List| (|OutputForm|)) #2#))
              $))
            ((QEQCAR |opp| 15)
             (|FC;getCommon|
              (PROG2 (LETT #1# |rec| . #13#)
                  (QCDR #1#)
                (|check_union| (QEQCAR #1# 11)
                               (|Record| (|:| |name| (|Symbol|))
                                         (|:| |contents| (|List| (|Symbol|))))
                               #1#))
              $))
            ('T (|error| "Unsupported program construct."))))))) 

(SDEFUN |FC;printCode;$V;38| ((|f| $) ($ |Void|))
        (SEQ (|displayLines1| (SPADCALL |f| (QREFELT $ 41)))
             (EXIT (SPADCALL (QREFELT $ 77))))) 

(PUT '|FC;code;$U;39| '|SPADreplace| 'QCDR) 

(SDEFUN |FC;code;$U;39|
        ((|f| $)
         ($ |Union| (|:| |nullBranch| "null")
          (|:| |assignmentBranch|
               (|Record| (|:| |var| (|Symbol|))
                         (|:| |arrayIndex| (|List| (|Polynomial| (|Integer|))))
                         (|:| |rand|
                              (|Record| (|:| |ints2Floats?| (|Boolean|))
                                        (|:| |expr| (|OutputForm|))))))
          (|:| |arrayAssignmentBranch|
               (|Record| (|:| |var| (|Symbol|)) (|:| |rand| (|OutputForm|))
                         (|:| |ints2Floats?| (|Boolean|))))
          (|:| |conditionalBranch|
               (|Record| (|:| |switch| (|Switch|)) (|:| |thenClause| $)
                         (|:| |elseClause| $)))
          (|:| |returnBranch|
               (|Record| (|:| |empty?| (|Boolean|))
                         (|:| |value|
                              (|Record| (|:| |ints2Floats?| (|Boolean|))
                                        (|:| |expr| (|OutputForm|))))))
          (|:| |blockBranch| (|List| $))
          (|:| |commentBranch| (|List| (|String|)))
          (|:| |callBranch| (|String|))
          (|:| |forBranch|
               (|Record|
                (|:| |range| (|SegmentBinding| (|Polynomial| (|Integer|))))
                (|:| |span| (|Polynomial| (|Integer|))) (|:| |body| $)))
          (|:| |labelBranch| (|SingleInteger|))
          (|:| |loopBranch|
               (|Record| (|:| |switch| (|Switch|)) (|:| |body| $)))
          (|:| |commonBranch|
               (|Record| (|:| |name| (|Symbol|))
                         (|:| |contents| (|List| (|Symbol|)))))
          (|:| |printBranch| (|List| (|OutputForm|)))))
        (QCDR |f|)) 

(PUT '|FC;operation;$U;40| '|SPADreplace| 'QCAR) 

(SDEFUN |FC;operation;$U;40|
        ((|f| $)
         ($ |Union| (|:| |Null| "null") (|:| |Assignment| "assignment")
          (|:| |Conditional| "conditional") (|:| |Return| "return")
          (|:| |Block| "block") (|:| |Comment| "comment") (|:| |Call| "call")
          (|:| |For| "for") (|:| |While| "while") (|:| |Repeat| "repeat")
          (|:| |Goto| "goto") (|:| |Continue| "continue")
          (|:| |ArrayAssignment| "arrayAssignment") (|:| |Save| "save")
          (|:| |Stop| "stop") (|:| |Common| "common") (|:| |Print| "print")))
        (QCAR |f|)) 

(SDEFUN |FC;common;SL$;41|
        ((|name| |Symbol|) (|contents| |List| (|Symbol|)) ($ $))
        (CONS (CONS 15 "common") (CONS 11 (CONS |name| |contents|)))) 

(SDEFUN |FC;stop;$;42| (($ $)) (CONS (CONS 14 "stop") (CONS 0 "null"))) 

(SDEFUN |FC;save;$;43| (($ $)) (CONS (CONS 13 "save") (CONS 0 "null"))) 

(SDEFUN |FC;printStatement;L$;44| ((|l| |List| (|OutputForm|)) ($ $))
        (CONS (CONS 16 "print") (CONS 12 |l|))) 

(SDEFUN |FC;comment;L$;45| ((|s| |List| (|String|)) ($ $))
        (CONS (CONS 5 "comment") (CONS 6 |s|))) 

(SDEFUN |FC;comment;S$;46| ((|s| |String|) ($ $))
        (CONS (CONS 5 "comment") (CONS 6 (SPADCALL |s| (QREFELT $ 85))))) 

(SDEFUN |FC;forLoop;Sb2$;47|
        ((|r| |SegmentBinding| (|Polynomial| (|Integer|))) (|body| $) ($ $))
        (CONS (CONS 7 "for")
              (CONS 8
                    (VECTOR |r|
                            (SPADCALL
                             (SPADCALL (SPADCALL |r| (QREFELT $ 74))
                                       (QREFELT $ 87))
                             (QREFELT $ 88))
                            |body|)))) 

(SDEFUN |FC;forLoop;SbP2$;48|
        ((|r| |SegmentBinding| (|Polynomial| (|Integer|)))
         (|increment| |Polynomial| (|Integer|)) (|body| $) ($ $))
        (CONS (CONS 7 "for") (CONS 8 (VECTOR |r| |increment| |body|)))) 

(SDEFUN |FC;gotoJump;Si$;49| ((|l| |SingleInteger|) ($ $))
        (CONS (CONS 10 "goto") (CONS 9 |l|))) 

(SDEFUN |FC;continue;Si$;50| ((|l| |SingleInteger|) ($ $))
        (CONS (CONS 11 "continue") (CONS 9 |l|))) 

(SDEFUN |FC;whileLoop;S2$;51| ((|sw| |Switch|) (|b| $) ($ $))
        (CONS (CONS 8 "while") (CONS 10 (CONS |sw| |b|)))) 

(SDEFUN |FC;repeatUntilLoop;S2$;52| ((|sw| |Switch|) (|b| $) ($ $))
        (CONS (CONS 9 "repeat") (CONS 10 (CONS |sw| |b|)))) 

(SDEFUN |FC;returns;$;53| (($ $))
        (SPROG
         ((|v|
           (|Record| (|:| |ints2Floats?| (|Boolean|))
                     (|:| |expr| (|OutputForm|)))))
         (SEQ
          (LETT |v| (CONS 'NIL (SPADCALL (|spadConstant| $ 94) (QREFELT $ 61)))
                |FC;returns;$;53|)
          (EXIT (CONS (CONS 3 "return") (CONS 4 (CONS 'T |v|))))))) 

(SDEFUN |FC;returns;E$;54| ((|v| |Expression| (|MachineInteger|)) ($ $))
        (CONS (CONS 3 "return")
              (CONS 4 (CONS 'NIL (CONS 'NIL (SPADCALL |v| (QREFELT $ 97))))))) 

(SDEFUN |FC;returns;E$;55| ((|v| |Expression| (|MachineFloat|)) ($ $))
        (CONS (CONS 3 "return")
              (CONS 4 (CONS 'NIL (CONS 'NIL (SPADCALL |v| (QREFELT $ 100))))))) 

(SDEFUN |FC;returns;E$;56| ((|v| |Expression| (|MachineComplex|)) ($ $))
        (CONS (CONS 3 "return")
              (CONS 4 (CONS 'NIL (CONS 'NIL (SPADCALL |v| (QREFELT $ 103))))))) 

(SDEFUN |FC;returns;E$;57| ((|v| |Expression| (|Integer|)) ($ $))
        (CONS (CONS 3 "return")
              (CONS 4 (CONS 'NIL (CONS 'NIL (SPADCALL |v| (QREFELT $ 106))))))) 

(SDEFUN |FC;returns;E$;58| ((|v| |Expression| (|Float|)) ($ $))
        (CONS (CONS 3 "return")
              (CONS 4 (CONS 'NIL (CONS 'NIL (SPADCALL |v| (QREFELT $ 109))))))) 

(SDEFUN |FC;returns;E$;59| ((|v| |Expression| (|Complex| (|Float|))) ($ $))
        (CONS (CONS 3 "return")
              (CONS 4 (CONS 'NIL (CONS 'NIL (SPADCALL |v| (QREFELT $ 112))))))) 

(SDEFUN |FC;block;L$;60| ((|l| |List| $) ($ $))
        (CONS (CONS 4 "block") (CONS 5 |l|))) 

(SDEFUN |FC;cond;S2$;61| ((|sw| |Switch|) (|thenC| $) ($ $))
        (CONS (CONS 2 "conditional")
              (CONS 3
                    (VECTOR |sw| |thenC|
                            (CONS (CONS 0 "null") (CONS 0 "null")))))) 

(SDEFUN |FC;cond;S3$;62| ((|sw| |Switch|) (|thenC| $) (|elseC| $) ($ $))
        (CONS (CONS 2 "conditional") (CONS 3 (VECTOR |sw| |thenC| |elseC|)))) 

(SDEFUN |FC;coerce;$Of;63| ((|f| $) ($ |OutputForm|))
        (SPADCALL (QCAR |f|) (QREFELT $ 117))) 

(SDEFUN |FC;assign;SS$;64| ((|v| |Symbol|) (|rhs| |String|) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS 'NIL (SPADCALL |rhs| (QREFELT $ 119))))))) 

(SDEFUN |FC;assign;SM$;65|
        ((|v| |Symbol|) (|rhs| |Matrix| (|MachineInteger|)) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 122)) 'NIL)))) 

(SDEFUN |FC;assign;SM$;66|
        ((|v| |Symbol|) (|rhs| |Matrix| (|MachineFloat|)) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 125)) 'T)))) 

(SDEFUN |FC;assign;SM$;67|
        ((|v| |Symbol|) (|rhs| |Matrix| (|MachineComplex|)) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 128)) 'T)))) 

(SDEFUN |FC;assign;SV$;68|
        ((|v| |Symbol|) (|rhs| |Vector| (|MachineInteger|)) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 131)) 'NIL)))) 

(SDEFUN |FC;assign;SV$;69|
        ((|v| |Symbol|) (|rhs| |Vector| (|MachineFloat|)) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 134)) 'T)))) 

(SDEFUN |FC;assign;SV$;70|
        ((|v| |Symbol|) (|rhs| |Vector| (|MachineComplex|)) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 137)) 'T)))) 

(SDEFUN |FC;assign;SM$;71|
        ((|v| |Symbol|) (|rhs| |Matrix| (|Expression| (|MachineInteger|)))
         ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 140)) 'NIL)))) 

(SDEFUN |FC;assign;SM$;72|
        ((|v| |Symbol|) (|rhs| |Matrix| (|Expression| (|MachineFloat|))) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 143)) 'T)))) 

(SDEFUN |FC;assign;SM$;73|
        ((|v| |Symbol|) (|rhs| |Matrix| (|Expression| (|MachineComplex|)))
         ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 146)) 'T)))) 

(SDEFUN |FC;assign;SV$;74|
        ((|v| |Symbol|) (|rhs| |Vector| (|Expression| (|MachineInteger|)))
         ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 149)) 'NIL)))) 

(SDEFUN |FC;assign;SV$;75|
        ((|v| |Symbol|) (|rhs| |Vector| (|Expression| (|MachineFloat|))) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 152)) 'T)))) 

(SDEFUN |FC;assign;SV$;76|
        ((|v| |Symbol|) (|rhs| |Vector| (|Expression| (|MachineComplex|)))
         ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 155)) 'T)))) 

(SDEFUN |FC;assign;SLE$;77|
        ((|v| |Symbol|) (|index| |List| (|Polynomial| (|Integer|)))
         (|rhs| |Expression| (|MachineInteger|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| |index|
                            (CONS 'NIL (SPADCALL |rhs| (QREFELT $ 97))))))) 

(SDEFUN |FC;assign;SLE$;78|
        ((|v| |Symbol|) (|index| |List| (|Polynomial| (|Integer|)))
         (|rhs| |Expression| (|MachineFloat|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| |index|
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 100))))))) 

(SDEFUN |FC;assign;SLE$;79|
        ((|v| |Symbol|) (|index| |List| (|Polynomial| (|Integer|)))
         (|rhs| |Expression| (|MachineComplex|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| |index|
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 103))))))) 

(SDEFUN |FC;assign;SE$;80|
        ((|v| |Symbol|) (|rhs| |Expression| (|MachineInteger|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS 'NIL (SPADCALL |rhs| (QREFELT $ 97))))))) 

(SDEFUN |FC;assign;SE$;81|
        ((|v| |Symbol|) (|rhs| |Expression| (|MachineFloat|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 100))))))) 

(SDEFUN |FC;assign;SE$;82|
        ((|v| |Symbol|) (|rhs| |Expression| (|MachineComplex|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 103))))))) 

(SDEFUN |FC;assign;SM$;83|
        ((|v| |Symbol|) (|rhs| |Matrix| (|Expression| (|Integer|))) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 164)) 'NIL)))) 

(SDEFUN |FC;assign;SM$;84|
        ((|v| |Symbol|) (|rhs| |Matrix| (|Expression| (|Float|))) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 167)) 'T)))) 

(SDEFUN |FC;assign;SM$;85|
        ((|v| |Symbol|) (|rhs| |Matrix| (|Expression| (|Complex| (|Float|))))
         ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 170)) 'T)))) 

(SDEFUN |FC;assign;SV$;86|
        ((|v| |Symbol|) (|rhs| |Vector| (|Expression| (|Integer|))) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 173)) 'NIL)))) 

(SDEFUN |FC;assign;SV$;87|
        ((|v| |Symbol|) (|rhs| |Vector| (|Expression| (|Float|))) ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 176)) 'T)))) 

(SDEFUN |FC;assign;SV$;88|
        ((|v| |Symbol|) (|rhs| |Vector| (|Expression| (|Complex| (|Float|))))
         ($ $))
        (CONS (CONS 12 "arrayAssignment")
              (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 179)) 'T)))) 

(SDEFUN |FC;assign;SLE$;89|
        ((|v| |Symbol|) (|index| |List| (|Polynomial| (|Integer|)))
         (|rhs| |Expression| (|Integer|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| |index|
                            (CONS 'NIL (SPADCALL |rhs| (QREFELT $ 106))))))) 

(SDEFUN |FC;assign;SLE$;90|
        ((|v| |Symbol|) (|index| |List| (|Polynomial| (|Integer|)))
         (|rhs| |Expression| (|Float|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| |index|
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 109))))))) 

(SDEFUN |FC;assign;SLE$;91|
        ((|v| |Symbol|) (|index| |List| (|Polynomial| (|Integer|)))
         (|rhs| |Expression| (|Complex| (|Float|))) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| |index|
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 112))))))) 

(SDEFUN |FC;assign;SE$;92|
        ((|v| |Symbol|) (|rhs| |Expression| (|Integer|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS 'NIL (SPADCALL |rhs| (QREFELT $ 106))))))) 

(SDEFUN |FC;assign;SE$;93|
        ((|v| |Symbol|) (|rhs| |Expression| (|Float|)) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 109))))))) 

(SDEFUN |FC;assign;SE$;94|
        ((|v| |Symbol|) (|rhs| |Expression| (|Complex| (|Float|))) ($ $))
        (CONS (CONS 1 "assignment")
              (CONS 1
                    (VECTOR |v| NIL
                            (CONS 'T (SPADCALL |rhs| (QREFELT $ 112))))))) 

(SDEFUN |FC;call;S$;95| ((|s| |String|) ($ $))
        (CONS (CONS 6 "call") (CONS 7 |s|))) 

(DECLAIM (NOTINLINE |FortranCode;|)) 

(DEFUN |FortranCode| ()
  (SPROG NIL
         (PROG (#1=#:G2299)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|FortranCode|)
                    . #2=(|FortranCode|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|FortranCode|
                             (LIST (CONS NIL (CONS 1 (|FortranCode;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|FortranCode|)))))))))) 

(DEFUN |FortranCode;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|FortranCode|) . #1=(|FortranCode|))
          (LETT $ (GETREFV 189) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FortranCode| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 32
                    (|Record|
                     (|:| |op|
                          (|Union| (|:| |Null| #2="null")
                                   (|:| |Assignment| "assignment")
                                   (|:| |Conditional| "conditional")
                                   (|:| |Return| "return")
                                   (|:| |Block| "block")
                                   (|:| |Comment| "comment")
                                   (|:| |Call| "call") (|:| |For| "for")
                                   (|:| |While| "while")
                                   (|:| |Repeat| "repeat") (|:| |Goto| "goto")
                                   (|:| |Continue| "continue")
                                   (|:| |ArrayAssignment| "arrayAssignment")
                                   (|:| |Save| "save") (|:| |Stop| "stop")
                                   (|:| |Common| "common")
                                   (|:| |Print| "print")))
                     (|:| |data|
                          (|Union| (|:| |nullBranch| #2#)
                                   (|:| |assignmentBranch|
                                        (|Record| (|:| |var| (|Symbol|))
                                                  (|:| |arrayIndex|
                                                       (|List|
                                                        (|Polynomial|
                                                         (|Integer|))))
                                                  (|:| |rand|
                                                       (|Record|
                                                        (|:| |ints2Floats?|
                                                             (|Boolean|))
                                                        (|:| |expr|
                                                             (|OutputForm|))))))
                                   (|:| |arrayAssignmentBranch|
                                        (|Record| (|:| |var| (|Symbol|))
                                                  (|:| |rand| (|OutputForm|))
                                                  (|:| |ints2Floats?|
                                                       (|Boolean|))))
                                   (|:| |conditionalBranch|
                                        (|Record| (|:| |switch| (|Switch|))
                                                  (|:| |thenClause| $)
                                                  (|:| |elseClause| $)))
                                   (|:| |returnBranch|
                                        (|Record| (|:| |empty?| (|Boolean|))
                                                  (|:| |value|
                                                       (|Record|
                                                        (|:| |ints2Floats?|
                                                             (|Boolean|))
                                                        (|:| |expr|
                                                             (|OutputForm|))))))
                                   (|:| |blockBranch| (|List| $))
                                   (|:| |commentBranch| (|List| (|String|)))
                                   (|:| |callBranch| (|String|))
                                   (|:| |forBranch|
                                        (|Record|
                                         (|:| |range|
                                              (|SegmentBinding|
                                               (|Polynomial| (|Integer|))))
                                         (|:| |span|
                                              (|Polynomial| (|Integer|)))
                                         (|:| |body| $)))
                                   (|:| |labelBranch| (|SingleInteger|))
                                   (|:| |loopBranch|
                                        (|Record| (|:| |switch| (|Switch|))
                                                  (|:| |body| $)))
                                   (|:| |commonBranch|
                                        (|Record| (|:| |name| (|Symbol|))
                                                  (|:| |contents|
                                                       (|List| (|Symbol|)))))
                                   (|:| |printBranch|
                                        (|List| (|OutputForm|)))))))
          (QSETREFV $ 35 (SPADCALL 25000 (QREFELT $ 34)))
          $))) 

(MAKEPROP '|FortranCode| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|OutputForm|) (|Symbol|) (0 . |coerce|)
              (|List| $) (5 . |elt|) (|List| 24) (|Boolean|)
              (|FortranCodeTools|) (11 . |getStatement|)
              (17 . |statement2Fortran|) (|Void|) (|Integer|)
              (22 . |changeExprLength|) (|Mapping| 11)
              (27 . |do_with_error_env1|) (32 . |fort_clean_lines|)
              (|UniversalSegment| 17) (37 . SEGMENT) (|String|) (42 . |elt|)
              (48 . |do_with_error_env0|) (53 . |expression2Fortran1|)
              (|NonNegativeInteger|) (61 . |first|) (67 . |do_with_error_env2|)
              (73 . |string|) '|Rep| (|SingleInteger|) (78 . |coerce|)
              '|labelValue| |FC;setLabelValue;2Si;16| (|Polynomial| 17)
              (83 . |One|) (87 . |elt|) (93 . |expression2Fortran|)
              |FC;getCode;$L;37|
              (|Union| (|:| |Null| '"null") (|:| |Assignment| '"assignment")
                       (|:| |Conditional| '"conditional")
                       (|:| |Return| '"return") (|:| |Block| '"block")
                       (|:| |Comment| '"comment") (|:| |Call| '"call")
                       (|:| |For| '"for") (|:| |While| '"while")
                       (|:| |Repeat| '"repeat") (|:| |Goto| '"goto")
                       (|:| |Continue| '"continue")
                       (|:| |ArrayAssignment| '"arrayAssignment")
                       (|:| |Save| '"save") (|:| |Stop| '"stop")
                       (|:| |Common| '"common") (|:| |Print| '"print"))
              |FC;operation;$U;40|
              (|Record| (|:| |ints2Floats?| 12) (|:| |expr| 6))
              (|Record| (|:| |var| 7) (|:| |arrayIndex| 64) (|:| |rand| 44))
              (|Record| (|:| |var| 7) (|:| |rand| 6) (|:| |ints2Floats?| 12))
              (|Record| (|:| |switch| 54) (|:| |thenClause| $)
                        (|:| |elseClause| $))
              (|Record| (|:| |empty?| 12) (|:| |value| 44))
              (|Record| (|:| |range| 67) (|:| |span| 37) (|:| |body| $))
              (|Record| (|:| |switch| 54) (|:| |body| $))
              (|Record| (|:| |name| 7) (|:| |contents| 79))
              (|Union| (|:| |nullBranch| '"null") (|:| |assignmentBranch| 45)
                       (|:| |arrayAssignmentBranch| 46)
                       (|:| |conditionalBranch| 47) (|:| |returnBranch| 48)
                       (|:| |blockBranch| 9) (|:| |commentBranch| 11)
                       (|:| |callBranch| 24) (|:| |forBranch| 49)
                       (|:| |labelBranch| 33) (|:| |loopBranch| 50)
                       (|:| |commonBranch| 51) (|:| |printBranch| 62))
              |FC;code;$U;39| (|Switch|) (98 . |coerce|) (103 . >)
              (109 . |hspace|) (114 . NOT) |FC;gotoJump;Si$;49|
              (119 . |concat|) (124 . |coerce|) (|List| 6) (|Mapping| 6 37)
              (|List| 37) (|ListFunctions2| 37 6) (129 . |map|)
              (|SegmentBinding| 37) (135 . |variable|) (|FortranType|)
              (140 . |fortranInteger|) (|TheSymbolTable|) (144 . |declare!|)
              (|Segment| 37) (150 . |segment|) (155 . |lo|) (160 . |hi|)
              (165 . |void|) |FC;printCode;$V;38| (|List| 7) |FC;common;SL$;41|
              |FC;stop;$;42| |FC;save;$;43| |FC;printStatement;L$;44|
              |FC;comment;L$;45| (169 . |list|) |FC;comment;S$;46|
              (174 . |incr|) (179 . |coerce|) |FC;forLoop;Sb2$;47|
              |FC;forLoop;SbP2$;48| |FC;continue;Si$;50| |FC;whileLoop;S2$;51|
              |FC;repeatUntilLoop;S2$;52| (184 . |Zero|) |FC;returns;$;53|
              (|Expression| (|MachineInteger|)) (188 . |coerce|)
              |FC;returns;E$;54| (|Expression| (|MachineFloat|))
              (193 . |coerce|) |FC;returns;E$;55|
              (|Expression| (|MachineComplex|)) (198 . |coerce|)
              |FC;returns;E$;56| (|Expression| 17) (203 . |coerce|)
              |FC;returns;E$;57| (|Expression| (|Float|)) (208 . |coerce|)
              |FC;returns;E$;58| (|Expression| (|Complex| (|Float|)))
              (213 . |coerce|) |FC;returns;E$;59| |FC;block;L$;60|
              |FC;cond;S2$;61| |FC;cond;S3$;62| (218 . |coerce|)
              |FC;coerce;$Of;63| (223 . |coerce|) |FC;assign;SS$;64|
              (|Matrix| (|MachineInteger|)) (228 . |coerce|) |FC;assign;SM$;65|
              (|Matrix| (|MachineFloat|)) (233 . |coerce|) |FC;assign;SM$;66|
              (|Matrix| (|MachineComplex|)) (238 . |coerce|) |FC;assign;SM$;67|
              (|Vector| (|MachineInteger|)) (243 . |coerce|) |FC;assign;SV$;68|
              (|Vector| (|MachineFloat|)) (248 . |coerce|) |FC;assign;SV$;69|
              (|Vector| (|MachineComplex|)) (253 . |coerce|) |FC;assign;SV$;70|
              (|Matrix| 96) (258 . |coerce|) |FC;assign;SM$;71| (|Matrix| 99)
              (263 . |coerce|) |FC;assign;SM$;72| (|Matrix| 102)
              (268 . |coerce|) |FC;assign;SM$;73| (|Vector| 96)
              (273 . |coerce|) |FC;assign;SV$;74| (|Vector| 99)
              (278 . |coerce|) |FC;assign;SV$;75| (|Vector| 102)
              (283 . |coerce|) |FC;assign;SV$;76| |FC;assign;SLE$;77|
              |FC;assign;SLE$;78| |FC;assign;SLE$;79| |FC;assign;SE$;80|
              |FC;assign;SE$;81| |FC;assign;SE$;82| (|Matrix| 105)
              (288 . |coerce|) |FC;assign;SM$;83| (|Matrix| 108)
              (293 . |coerce|) |FC;assign;SM$;84| (|Matrix| 111)
              (298 . |coerce|) |FC;assign;SM$;85| (|Vector| 105)
              (303 . |coerce|) |FC;assign;SV$;86| (|Vector| 108)
              (308 . |coerce|) |FC;assign;SV$;87| (|Vector| 111)
              (313 . |coerce|) |FC;assign;SV$;88| |FC;assign;SLE$;89|
              |FC;assign;SLE$;90| |FC;assign;SLE$;91| |FC;assign;SE$;92|
              |FC;assign;SE$;93| |FC;assign;SE$;94| |FC;call;S$;95|
              (|HashState|))
           '#(~= 318 |whileLoop| 324 |stop| 330 |setLabelValue| 334 |save| 339
              |returns| 343 |repeatUntilLoop| 377 |printStatement| 383
              |printCode| 388 |operation| 393 |latex| 398 |hashUpdate!| 403
              |hash| 409 |gotoJump| 414 |getCode| 419 |forLoop| 424 |continue|
              437 |cond| 442 |common| 455 |comment| 461 |coerce| 471 |code| 476
              |call| 481 |block| 486 |assign| 491 = 683)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 6))
                        (|makeByteWordVec2| 188
                                            '(1 7 6 0 8 2 6 0 0 9 10 2 13 11 6
                                              12 14 1 13 11 6 15 1 13 16 17 18
                                              1 13 11 19 20 1 13 11 11 21 1 22
                                              0 17 23 2 24 0 0 22 25 1 13 11 19
                                              26 4 13 11 7 12 6 12 27 2 11 0 0
                                              28 29 2 13 11 12 19 30 1 7 24 0
                                              31 1 33 0 17 34 0 37 0 38 2 11 24
                                              0 17 39 1 13 11 6 40 1 54 6 0 55
                                              2 28 12 0 0 56 1 6 0 17 57 1 54 0
                                              0 58 1 11 0 9 60 1 37 6 0 61 2 65
                                              62 63 64 66 1 67 7 0 68 0 69 0 70
                                              2 71 69 7 69 72 1 67 73 0 74 1 73
                                              37 0 75 1 73 37 0 76 0 16 0 77 1
                                              11 0 24 85 1 73 17 0 87 1 37 0 17
                                              88 0 37 0 94 1 96 6 0 97 1 99 6 0
                                              100 1 102 6 0 103 1 105 6 0 106 1
                                              108 6 0 109 1 111 6 0 112 1 42 6
                                              0 117 1 24 6 0 119 1 121 6 0 122
                                              1 124 6 0 125 1 127 6 0 128 1 130
                                              6 0 131 1 133 6 0 134 1 136 6 0
                                              137 1 139 6 0 140 1 142 6 0 143 1
                                              145 6 0 146 1 148 6 0 149 1 151 6
                                              0 152 1 154 6 0 155 1 163 6 0 164
                                              1 166 6 0 167 1 169 6 0 170 1 172
                                              6 0 173 1 175 6 0 176 1 178 6 0
                                              179 2 0 12 0 0 1 2 0 0 54 0 92 0
                                              0 0 81 1 0 33 33 36 0 0 0 82 1 0
                                              0 111 113 1 0 0 108 110 1 0 0 105
                                              107 1 0 0 96 98 1 0 0 102 104 0 0
                                              0 95 1 0 0 99 101 2 0 0 54 0 93 1
                                              0 0 62 83 1 0 16 0 78 1 0 42 0 43
                                              1 0 24 0 1 2 0 188 188 0 1 1 0 33
                                              0 1 1 0 0 33 59 1 0 11 0 41 3 0 0
                                              67 37 0 90 2 0 0 67 0 89 1 0 0 33
                                              91 3 0 0 54 0 0 116 2 0 0 54 0
                                              115 2 0 0 7 79 80 1 0 0 11 84 1 0
                                              0 24 86 1 0 6 0 118 1 0 52 0 53 1
                                              0 0 24 187 1 0 0 9 114 3 0 0 7 64
                                              108 182 3 0 0 7 64 111 183 2 0 0
                                              7 178 180 3 0 0 7 64 105 181 2 0
                                              0 7 172 174 2 0 0 7 175 177 2 0 0
                                              7 166 168 2 0 0 7 169 171 2 0 0 7
                                              111 186 2 0 0 7 163 165 2 0 0 7
                                              105 184 2 0 0 7 108 185 3 0 0 7
                                              64 99 158 3 0 0 7 64 102 159 2 0
                                              0 7 154 156 3 0 0 7 64 96 157 2 0
                                              0 7 148 150 2 0 0 7 151 153 2 0 0
                                              7 142 144 2 0 0 7 145 147 2 0 0 7
                                              136 138 2 0 0 7 139 141 2 0 0 7
                                              130 132 2 0 0 7 133 135 2 0 0 7
                                              124 126 2 0 0 7 127 129 2 0 0 7
                                              102 162 2 0 0 7 121 123 2 0 0 7
                                              96 160 2 0 0 7 99 161 2 0 0 7 24
                                              120 2 0 12 0 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|FortranCode| 'NILADIC T) 
