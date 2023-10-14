
(/VERSIONCHECK 2) 

(DEFUN |FC;setLabelValue;2Si;1| (|u| $) (SETELT $ 10 |u|)) 

(DEFUN |FC;newLabel| ($)
  (SEQ (SETELT $ 10 (|add_SI| (QREFELT $ 10) 1)) (EXIT (QREFELT $ 10)))) 

(DEFUN |FC;commaSep| (|l| $)
  (PROG (#1=#:G141 #2=#:G140 #3=#:G142 #4=#:G144 |u|)
    (RETURN
     (SEQ
      (CONS (SPADCALL |l| 1 (QREFELT $ 16))
            (PROGN
             (LETT #1# NIL . #5=(|FC;commaSep|))
             (SEQ (LETT |u| NIL . #5#) (LETT #4# (CDR |l|) . #5#) G190
                  (COND
                   ((OR (ATOM #4#) (PROGN (LETT |u| (CAR #4#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #3# (LIST "," |u|) . #5#)
                     (COND (#1# (LETT #2# (APPEND #2# #3#) . #5#))
                           ('T
                            (PROGN
                             (LETT #2# #3# . #5#)
                             (LETT #1# 'T . #5#)))))))
                  (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) ('T NIL)))))))) 

(DEFUN |FC;getReturn| (|rec| $)
  (PROG (|rv| |rt| |returnToken|)
    (RETURN
     (SEQ
      (LETT |returnToken|
            (SPADCALL (SPADCALL 'RETURN (QREFELT $ 19)) (QREFELT $ 21))
            . #1=(|FC;getReturn|))
      (EXIT
       (COND ((QCAR |rec|) (|getStatement| |returnToken| NIL))
             ('T
              (SEQ (LETT |rt| (QCDR |rec|) . #1#) (LETT |rv| (QCDR |rt|) . #1#)
                   (EXIT
                    (|getStatement|
                     (|construct| |returnToken| (SPADCALL |rv| (QREFELT $ 21)))
                     (QCAR |rt|))))))))))) 

(DEFUN |FC;getStop| ($) (|fortran2Lines| (LIST "STOP"))) 

(DEFUN |FC;getSave| ($) (|fortran2Lines| (LIST "SAVE"))) 

(DEFUN |FC;getCommon| (|u| $)
  (|fortran2Lines|
   (APPEND (LIST "COMMON" " /" (SPADCALL (QCAR |u|) (QREFELT $ 22)) "/ ")
           (|addCommas| (QCDR |u|))))) 

(DEFUN |FC;getPrint| (|l| $)
  (PROG (|ll| #1=#:G156 |i|)
    (RETURN
     (SEQ (LETT |ll| (LIST "PRINT*") . #2=(|FC;getPrint|))
          (SEQ (LETT |i| NIL . #2#) (LETT #1# |l| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |ll| (APPEND |ll| (CONS "," (|expression2Fortran| |i|)))
                       . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (|fortran2Lines| |ll|)))))) 

(DEFUN |FC;getBlock| (|rec| $)
  (PROG (|expr| #1=#:G160 |u|)
    (RETURN
     (SEQ (|indentFortLevel| (SPADCALL 1 (QREFELT $ 23)))
          (LETT |expr| (LIST) . #2=(|FC;getBlock|))
          (SEQ (LETT |u| NIL . #2#) (LETT #1# |rec| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |expr| (APPEND |expr| (SPADCALL |u| (QREFELT $ 24)))
                       . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (|indentFortLevel| (SPADCALL -1 (QREFELT $ 23))) (EXIT |expr|))))) 

(DEFUN |FC;getBody| (|f| $)
  (PROG (|expr|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR (SPADCALL |f| (QREFELT $ 26)) 4) (SPADCALL |f| (QREFELT $ 24)))
       ('T
        (SEQ (|indentFortLevel| (SPADCALL 1 (QREFELT $ 23)))
             (LETT |expr| (SPADCALL |f| (QREFELT $ 24)) |FC;getBody|)
             (|indentFortLevel| (SPADCALL -1 (QREFELT $ 23)))
             (EXIT |expr|)))))))) 

(DEFUN |FC;getElseIf| (|f| $)
  (PROG (|expr| |elseBranch| #1=#:G188 |rec|)
    (RETURN
     (SEQ (LETT |rec| (SPADCALL |f| (QREFELT $ 36)) . #2=(|FC;getElseIf|))
          (LETT |expr|
                (|fortFormatElseIf|
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
                  (QREFELT $ 38)))
                . #2#)
          (LETT |expr|
                (APPEND |expr|
                        (|FC;getBody|
                         (QVELT
                          (PROG2 (LETT #1# |rec| . #2#)
                              (QCDR #1#)
                            (|check_union| (QEQCAR #1# 3)
                                           (|Record| (|:| |switch| (|Switch|))
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
           ((NULL (QEQCAR (SPADCALL |elseBranch| (QREFELT $ 26)) 0))
            (EXIT
             (COND
              ((QEQCAR (SPADCALL |elseBranch| (QREFELT $ 26)) 2)
               (APPEND |expr| (|FC;getElseIf| |elseBranch| $)))
              ('T
               (SEQ
                (LETT |expr|
                      (APPEND |expr|
                              (|getStatement| (SPADCALL 'ELSE (QREFELT $ 19))
                                              NIL))
                      . #2#)
                (EXIT
                 (LETT |expr| (APPEND |expr| (|FC;getBody| |elseBranch| $))
                       . #2#))))))))
          (EXIT |expr|))))) 

(DEFUN |FC;getContinue| (|label| $)
  (PROG (|sp| |cnt| |lab|)
    (RETURN
     (SEQ
      (LETT |lab| (SPADCALL |label| (QREFELT $ 39)) . #1=(|FC;getContinue|))
      (COND
       ((SPADCALL (SPADCALL |lab| (QREFELT $ 41)) 6 (QREFELT $ 43))
        (|error| "Label too big")))
      (LETT |cnt| "CONTINUE" . #1#)
      (LETT |sp|
            (SPADCALL (- |$fortIndent| (SPADCALL |lab| (QREFELT $ 41)))
                      (QREFELT $ 44))
            . #1#)
      (EXIT (LIST (STRCONC (STRINGIMAGE |lab|) |sp| |cnt|))))))) 

(DEFUN |FC;getGoto| (|label| $)
  (|fortran2Lines|
   (LIST (STRCONC "GOTO " (STRINGIMAGE (SPADCALL |label| (QREFELT $ 39))))))) 

(DEFUN |FC;getRepeat| (|repRec| $)
  (PROG (|bod| |lab| |sw|)
    (RETURN
     (SEQ
      (LETT |sw| (SPADCALL (QCAR |repRec|) (QREFELT $ 45))
            . #1=(|FC;getRepeat|))
      (LETT |lab| (|FC;newLabel| $) . #1#) (LETT |bod| (QCDR |repRec|) . #1#)
      (EXIT
       (APPEND (|FC;getContinue| |lab| $) (|FC;getBody| |bod| $)
               (|fortFormatIfGoto| (SPADCALL |sw| (QREFELT $ 38)) |lab|))))))) 

(DEFUN |FC;getWhile| (|whileRec| $)
  (PROG (|bod| |lab2| |lab1| |sw|)
    (RETURN
     (SEQ
      (LETT |sw| (SPADCALL (QCAR |whileRec|) (QREFELT $ 45))
            . #1=(|FC;getWhile|))
      (LETT |lab1| (|FC;newLabel| $) . #1#)
      (LETT |lab2| (|FC;newLabel| $) . #1#)
      (LETT |bod| (QCDR |whileRec|) . #1#)
      (EXIT
       (APPEND
        (|fortFormatLabelledIfGoto| (SPADCALL |sw| (QREFELT $ 38)) |lab1|
                                    |lab2|)
        (|FC;getBody| |bod| $)
        (|FC;getBody| (SPADCALL |lab1| (QREFELT $ 46)) $)
        (|FC;getContinue| |lab2| $))))))) 

(DEFUN |FC;getArrayAssign| (|rec| $)
  (|getfortarrayexp| (SPADCALL (QVELT |rec| 0) (QREFELT $ 19)) (QVELT |rec| 1)
                     (QVELT |rec| 2))) 

(DEFUN |FC;getAssign| (|rec| $)
  (PROG (|lhs| |indices|)
    (RETURN
     (SEQ (LETT |indices| (QVELT |rec| 1) . #1=(|FC;getAssign|))
          (COND
           ((SPADCALL |indices| NIL (QREFELT $ 48))
            (LETT |lhs| (SPADCALL (QVELT |rec| 0) (QREFELT $ 19)) . #1#))
           (#2='T
            (SEQ
             (LETT |lhs|
                   (SPADCALL
                    (CONS (SPADCALL (QVELT |rec| 0) (QREFELT $ 49)) |indices|)
                    (QREFELT $ 50))
                   . #1#)
             (EXIT
              (LETT |lhs|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |lhs| (QREFELT $ 21))
                                 (QREFELT $ 51))
                       (QREFELT $ 52))
                      (QREFELT $ 51))
                     (QREFELT $ 53))
                    . #1#)))))
          (EXIT
           (COND
            ((QCAR (QVELT |rec| 2))
             (|assignment2Fortran1| |lhs| (QCDR (QVELT |rec| 2))))
            (#2#
             (|integerAssignment2Fortran1| |lhs| (QCDR (QVELT |rec| 2)))))))))) 

(DEFUN |FC;getCond| (|rec| $)
  (PROG (|expr| |elseBranch|)
    (RETURN
     (SEQ
      (LETT |expr|
            (APPEND (|fortFormatIf| (SPADCALL (QVELT |rec| 0) (QREFELT $ 38)))
                    (|FC;getBody| (QVELT |rec| 1) $))
            . #1=(|FC;getCond|))
      (LETT |elseBranch| (QVELT |rec| 2) . #1#)
      (COND
       ((NULL (QEQCAR (SPADCALL |elseBranch| (QREFELT $ 26)) 0))
        (COND
         ((QEQCAR (SPADCALL |elseBranch| (QREFELT $ 26)) 2)
          (LETT |expr| (APPEND |expr| (|FC;getElseIf| |elseBranch| $)) . #1#))
         ('T
          (LETT |expr|
                (APPEND |expr|
                        (|getStatement| (SPADCALL 'ELSE (QREFELT $ 19)) NIL)
                        (|FC;getBody| |elseBranch| $))
                . #1#)))))
      (EXIT
       (APPEND |expr|
               (|getStatement| (SPADCALL 'ENDIF (QREFELT $ 19)) NIL))))))) 

(DEFUN |FC;getComment| (|rec| $)
  (PROG (#1=#:G260 |c| #2=#:G259)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|FC;getComment|))
        (SEQ (LETT |c| NIL . #3#) (LETT #1# |rec| . #3#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT #2#
                     (CONS (SPADCALL (STRCONC "C     " |c|) (QREFELT $ 54))
                           #2#)
                     . #3#)))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       (QREFELT $ 56)))))) 

(DEFUN |FC;getCall| (|rec| $)
  (PROG (|expr|)
    (RETURN
     (SEQ (LETT |expr| (STRCONC "CALL " |rec|) |FC;getCall|)
          (EXIT
           (COND
            ((SPADCALL (QCSIZE |expr|) 1320 (QREFELT $ 58))
             (|error| "Fortran CALL too large"))
            ('T
             (|fortran2Lines|
              (SPADCALL (LIST (SPADCALL |expr| (QREFELT $ 54)))
                        (QREFELT $ 56)))))))))) 

(DEFUN |FC;getFor| (|rec| $)
  (PROG (|expr| |lab| |increment| |rnge|)
    (RETURN
     (SEQ (LETT |rnge| (QVELT |rec| 0) . #1=(|FC;getFor|))
          (LETT |increment| (QVELT |rec| 1) . #1#)
          (LETT |lab| (|FC;newLabel| $) . #1#)
          (SPADCALL (SPADCALL |rnge| (QREFELT $ 60)) (SPADCALL (QREFELT $ 62))
                    (QREFELT $ 64))
          (LETT |expr|
                (|fortFormatDo| (SPADCALL |rnge| (QREFELT $ 60))
                                (SPADCALL
                                 (SPADCALL (SPADCALL |rnge| (QREFELT $ 66))
                                           (QREFELT $ 67))
                                 (QREFELT $ 68))
                                (SPADCALL
                                 (SPADCALL (SPADCALL |rnge| (QREFELT $ 66))
                                           (QREFELT $ 69))
                                 (QREFELT $ 68))
                                (SPADCALL |increment| (QREFELT $ 68)) |lab|)
                . #1#)
          (EXIT
           (APPEND |expr| (|FC;getBody| (QVELT |rec| 2) $)
                   (|FC;getContinue| |lab| $))))))) 

(DEFUN |FC;getCode;$Se;22| (|f| $)
  (PROG (#1=#:G298 #2=#:G299 #3=#:G297 #4=#:G296 #5=#:G295 #6=#:G294 #7=#:G293
         #8=#:G292 #9=#:G291 #10=#:G290 #11=#:G289 #12=#:G288 |rec| |opp|)
    (RETURN
     (SEQ
      (LETT |opp| (SPADCALL |f| (QREFELT $ 26)) . #13=(|FC;getCode;$Se;22|))
      (LETT |rec| (SPADCALL |f| (QREFELT $ 36)) . #13#)
      (EXIT
       (COND
        ((QEQCAR |opp| 1)
         (|FC;getAssign|
          (PROG2 (LETT #12# |rec| . #13#)
              (QCDR #12#)
            (|check_union| (QEQCAR #12# 1)
                           (|Record| (|:| |var| (|Symbol|))
                                     (|:| |arrayIndex|
                                          (|List| (|Polynomial| (|Integer|))))
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
                                     (|:| |thenClause| $) (|:| |elseClause| $))
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
                                 (|SegmentBinding| (|Polynomial| (|Integer|))))
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
                           (|Record| (|:| |switch| (|Switch|)) (|:| |body| $))
                           #3#))
          $))
        ((QEQCAR |opp| 8)
         (|FC;getWhile|
          (PROG2 (LETT #3# |rec| . #13#)
              (QCDR #3#)
            (|check_union| (QEQCAR #3# 10)
                           (|Record| (|:| |switch| (|Switch|)) (|:| |body| $))
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
        ('T
         (SEQ (|error| "Unsupported program construct.")
              (EXIT (SPADCALL 0.0 (QREFELT $ 72))))))))))) 

(DEFUN |FC;printCode;$V;23| (|f| $)
  (SEQ (|displayLines1| (SPADCALL |f| (QREFELT $ 24)))
       (EXIT (SPADCALL (QREFELT $ 74))))) 

(PUT '|FC;code;$U;24| '|SPADreplace| 'QCDR) 

(DEFUN |FC;code;$U;24| (|f| $) (QCDR |f|)) 

(PUT '|FC;operation;$U;25| '|SPADreplace| 'QCAR) 

(DEFUN |FC;operation;$U;25| (|f| $) (QCAR |f|)) 

(DEFUN |FC;common;SL$;26| (|name| |contents| $)
  (CONS (CONS 15 "common") (CONS 11 (CONS |name| |contents|)))) 

(DEFUN |FC;stop;$;27| ($) (CONS (CONS 14 "stop") (CONS 0 "null"))) 

(DEFUN |FC;save;$;28| ($) (CONS (CONS 13 "save") (CONS 0 "null"))) 

(DEFUN |FC;printStatement;L$;29| (|l| $) (CONS (CONS 16 "print") (CONS 12 |l|))) 

(DEFUN |FC;comment;L$;30| (|s| $) (CONS (CONS 5 "comment") (CONS 6 |s|))) 

(DEFUN |FC;comment;S$;31| (|s| $)
  (CONS (CONS 5 "comment") (CONS 6 (SPADCALL |s| (QREFELT $ 83))))) 

(DEFUN |FC;forLoop;Sb2$;32| (|r| |body| $)
  (CONS (CONS 7 "for")
        (CONS 8
              (VECTOR |r|
                      (SPADCALL
                       (SPADCALL (SPADCALL |r| (QREFELT $ 66)) (QREFELT $ 85))
                       (QREFELT $ 86))
                      |body|)))) 

(DEFUN |FC;forLoop;SbP2$;33| (|r| |increment| |body| $)
  (CONS (CONS 7 "for") (CONS 8 (VECTOR |r| |increment| |body|)))) 

(DEFUN |FC;goto;Si$;34| (|l| $) (CONS (CONS 10 "goto") (CONS 9 |l|))) 

(DEFUN |FC;continue;Si$;35| (|l| $) (CONS (CONS 11 "continue") (CONS 9 |l|))) 

(DEFUN |FC;whileLoop;S2$;36| (|sw| |b| $)
  (CONS (CONS 8 "while") (CONS 10 (CONS |sw| |b|)))) 

(DEFUN |FC;repeatUntilLoop;S2$;37| (|sw| |b| $)
  (CONS (CONS 9 "repeat") (CONS 10 (CONS |sw| |b|)))) 

(DEFUN |FC;returns;$;38| ($)
  (PROG (|v|)
    (RETURN
     (SEQ
      (LETT |v| (CONS 'NIL (SPADCALL (|spadConstant| $ 70) (QREFELT $ 68)))
            |FC;returns;$;38|)
      (EXIT (CONS (CONS 3 "return") (CONS 4 (CONS 'T |v|)))))))) 

(DEFUN |FC;returns;E$;39| (|v| $)
  (CONS (CONS 3 "return")
        (CONS 4 (CONS 'NIL (CONS 'NIL (SPADCALL |v| (QREFELT $ 94))))))) 

(DEFUN |FC;returns;E$;40| (|v| $)
  (CONS (CONS 3 "return")
        (CONS 4 (CONS 'NIL (CONS 'NIL (SPADCALL |v| (QREFELT $ 97))))))) 

(DEFUN |FC;returns;E$;41| (|v| $)
  (CONS (CONS 3 "return")
        (CONS 4 (CONS 'NIL (CONS 'NIL (SPADCALL |v| (QREFELT $ 100))))))) 

(DEFUN |FC;returns;E$;42| (|v| $)
  (CONS (CONS 3 "return")
        (CONS 4 (CONS 'NIL (CONS 'NIL (SPADCALL |v| (QREFELT $ 103))))))) 

(DEFUN |FC;returns;E$;43| (|v| $)
  (CONS (CONS 3 "return")
        (CONS 4 (CONS 'NIL (CONS 'NIL (SPADCALL |v| (QREFELT $ 106))))))) 

(DEFUN |FC;returns;E$;44| (|v| $)
  (CONS (CONS 3 "return")
        (CONS 4 (CONS 'NIL (CONS 'NIL (SPADCALL |v| (QREFELT $ 109))))))) 

(DEFUN |FC;block;L$;45| (|l| $) (CONS (CONS 4 "block") (CONS 5 |l|))) 

(DEFUN |FC;cond;S2$;46| (|sw| |thenC| $)
  (CONS (CONS 2 "conditional")
        (CONS 3 (VECTOR |sw| |thenC| (CONS (CONS 0 "null") (CONS 0 "null")))))) 

(DEFUN |FC;cond;S3$;47| (|sw| |thenC| |elseC| $)
  (CONS (CONS 2 "conditional") (CONS 3 (VECTOR |sw| |thenC| |elseC|)))) 

(DEFUN |FC;coerce;$Of;48| (|f| $) (SPADCALL (QCAR |f|) (QREFELT $ 114))) 

(DEFUN |FC;assign;SS$;49| (|v| |rhs| $)
  (CONS (CONS 1 "assignment")
        (CONS 1 (VECTOR |v| NIL (CONS 'NIL (SPADCALL |rhs| (QREFELT $ 116))))))) 

(DEFUN |FC;assign;SM$;50| (|v| |rhs| $)
  (CONS (CONS 12 "arrayAssignment")
        (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 119)) 'NIL)))) 

(DEFUN |FC;assign;SM$;51| (|v| |rhs| $)
  (CONS (CONS 12 "arrayAssignment")
        (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 122)) 'T)))) 

(DEFUN |FC;assign;SM$;52| (|v| |rhs| $)
  (CONS (CONS 12 "arrayAssignment")
        (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 125)) 'T)))) 

(DEFUN |FC;assign;SV$;53| (|v| |rhs| $)
  (CONS (CONS 12 "arrayAssignment")
        (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 128)) 'NIL)))) 

(DEFUN |FC;assign;SV$;54| (|v| |rhs| $)
  (CONS (CONS 12 "arrayAssignment")
        (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 131)) 'T)))) 

(DEFUN |FC;assign;SV$;55| (|v| |rhs| $)
  (CONS (CONS 12 "arrayAssignment")
        (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 134)) 'T)))) 

(DEFUN |FC;assign;SM$;56| (|v| |rhs| $)
  (CONS (CONS 12 "arrayAssignment")
        (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 137)) 'NIL)))) 

(DEFUN |FC;assign;SM$;57| (|v| |rhs| $)
  (CONS (CONS 12 "arrayAssignment")
        (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 140)) 'T)))) 

(DEFUN |FC;assign;SM$;58| (|v| |rhs| $)
  (CONS (CONS 12 "arrayAssignment")
        (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 143)) 'T)))) 

(DEFUN |FC;assign;SV$;59| (|v| |rhs| $)
  (CONS (CONS 12 "arrayAssignment")
        (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 146)) 'NIL)))) 

(DEFUN |FC;assign;SV$;60| (|v| |rhs| $)
  (CONS (CONS 12 "arrayAssignment")
        (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 149)) 'T)))) 

(DEFUN |FC;assign;SV$;61| (|v| |rhs| $)
  (CONS (CONS 12 "arrayAssignment")
        (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 152)) 'T)))) 

(DEFUN |FC;assign;SLE$;62| (|v| |index| |rhs| $)
  (CONS (CONS 1 "assignment")
        (CONS 1
              (VECTOR |v| |index|
                      (CONS 'NIL (SPADCALL |rhs| (QREFELT $ 94))))))) 

(DEFUN |FC;assign;SLE$;63| (|v| |index| |rhs| $)
  (CONS (CONS 1 "assignment")
        (CONS 1
              (VECTOR |v| |index| (CONS 'T (SPADCALL |rhs| (QREFELT $ 97))))))) 

(DEFUN |FC;assign;SLE$;64| (|v| |index| |rhs| $)
  (CONS (CONS 1 "assignment")
        (CONS 1
              (VECTOR |v| |index| (CONS 'T (SPADCALL |rhs| (QREFELT $ 100))))))) 

(DEFUN |FC;assign;SE$;65| (|v| |rhs| $)
  (CONS (CONS 1 "assignment")
        (CONS 1 (VECTOR |v| NIL (CONS 'NIL (SPADCALL |rhs| (QREFELT $ 94))))))) 

(DEFUN |FC;assign;SE$;66| (|v| |rhs| $)
  (CONS (CONS 1 "assignment")
        (CONS 1 (VECTOR |v| NIL (CONS 'T (SPADCALL |rhs| (QREFELT $ 97))))))) 

(DEFUN |FC;assign;SE$;67| (|v| |rhs| $)
  (CONS (CONS 1 "assignment")
        (CONS 1 (VECTOR |v| NIL (CONS 'T (SPADCALL |rhs| (QREFELT $ 100))))))) 

(DEFUN |FC;assign;SM$;68| (|v| |rhs| $)
  (CONS (CONS 12 "arrayAssignment")
        (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 161)) 'NIL)))) 

(DEFUN |FC;assign;SM$;69| (|v| |rhs| $)
  (CONS (CONS 12 "arrayAssignment")
        (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 164)) 'T)))) 

(DEFUN |FC;assign;SM$;70| (|v| |rhs| $)
  (CONS (CONS 12 "arrayAssignment")
        (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 167)) 'T)))) 

(DEFUN |FC;assign;SV$;71| (|v| |rhs| $)
  (CONS (CONS 12 "arrayAssignment")
        (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 170)) 'NIL)))) 

(DEFUN |FC;assign;SV$;72| (|v| |rhs| $)
  (CONS (CONS 12 "arrayAssignment")
        (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 173)) 'T)))) 

(DEFUN |FC;assign;SV$;73| (|v| |rhs| $)
  (CONS (CONS 12 "arrayAssignment")
        (CONS 2 (VECTOR |v| (SPADCALL |rhs| (QREFELT $ 176)) 'T)))) 

(DEFUN |FC;assign;SLE$;74| (|v| |index| |rhs| $)
  (CONS (CONS 1 "assignment")
        (CONS 1
              (VECTOR |v| |index|
                      (CONS 'NIL (SPADCALL |rhs| (QREFELT $ 103))))))) 

(DEFUN |FC;assign;SLE$;75| (|v| |index| |rhs| $)
  (CONS (CONS 1 "assignment")
        (CONS 1
              (VECTOR |v| |index| (CONS 'T (SPADCALL |rhs| (QREFELT $ 106))))))) 

(DEFUN |FC;assign;SLE$;76| (|v| |index| |rhs| $)
  (CONS (CONS 1 "assignment")
        (CONS 1
              (VECTOR |v| |index| (CONS 'T (SPADCALL |rhs| (QREFELT $ 109))))))) 

(DEFUN |FC;assign;SE$;77| (|v| |rhs| $)
  (CONS (CONS 1 "assignment")
        (CONS 1 (VECTOR |v| NIL (CONS 'NIL (SPADCALL |rhs| (QREFELT $ 103))))))) 

(DEFUN |FC;assign;SE$;78| (|v| |rhs| $)
  (CONS (CONS 1 "assignment")
        (CONS 1 (VECTOR |v| NIL (CONS 'T (SPADCALL |rhs| (QREFELT $ 106))))))) 

(DEFUN |FC;assign;SE$;79| (|v| |rhs| $)
  (CONS (CONS 1 "assignment")
        (CONS 1 (VECTOR |v| NIL (CONS 'T (SPADCALL |rhs| (QREFELT $ 109))))))) 

(DEFUN |FC;call;S$;80| (|s| $) (CONS (CONS 6 "call") (CONS 7 |s|))) 

(DEFUN |FortranCode| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G2274)
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
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|FortranCode|))))))))))) 

(DEFUN |FortranCode;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|FortranCode|) . #1=(|FortranCode|))
      (LETT $ (GETREFV 186) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|FortranCode| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6
                (|Record|
                 (|:| |op|
                      (|Union| (|:| |Null| #2="null")
                               (|:| |Assignment| "assignment")
                               (|:| |Conditional| "conditional")
                               (|:| |Return| "return") (|:| |Block| "block")
                               (|:| |Comment| "comment") (|:| |Call| "call")
                               (|:| |For| "for") (|:| |While| "while")
                               (|:| |Repeat| "repeat") (|:| |Goto| "goto")
                               (|:| |Continue| "continue")
                               (|:| |ArrayAssignment| "arrayAssignment")
                               (|:| |Save| "save") (|:| |Stop| "stop")
                               (|:| |Common| "common") (|:| |Print| "print")))
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
                                     (|:| |span| (|Polynomial| (|Integer|)))
                                     (|:| |body| $)))
                               (|:| |labelBranch| (|SingleInteger|))
                               (|:| |loopBranch|
                                    (|Record| (|:| |switch| (|Switch|))
                                              (|:| |body| $)))
                               (|:| |commonBranch|
                                    (|Record| (|:| |name| (|Symbol|))
                                              (|:| |contents|
                                                   (|List| (|Symbol|)))))
                               (|:| |printBranch| (|List| (|OutputForm|)))))))
      (QSETREFV $ 10 (SPADCALL 25000 (QREFELT $ 9)))
      $)))) 

(MAKEPROP '|FortranCode| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Integer|) (|SingleInteger|)
              (0 . |coerce|) '|labelValue| |FC;setLabelValue;2Si;1|
              (|Polynomial| 7) (5 . |One|) (|String|) (|List| 14) (9 . |elt|)
              (|OutputForm|) (|Symbol|) (15 . |coerce|) (|SExpression|)
              (20 . |convert|) (25 . |string|) (30 . |convert|)
              |FC;getCode;$Se;22|
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
              |FC;operation;$U;25|
              (|Record| (|:| |ints2Floats?| 42) (|:| |expr| 17))
              (|Record| (|:| |var| 18) (|:| |arrayIndex| 47) (|:| |rand| 27))
              (|Record| (|:| |var| 18) (|:| |rand| 17) (|:| |ints2Floats?| 42))
              (|Record| (|:| |switch| 37) (|:| |thenClause| $)
                        (|:| |elseClause| $))
              (|Record| (|:| |empty?| 42) (|:| |value| 27))
              (|Record| (|:| |range| 59) (|:| |span| 12) (|:| |body| $))
              (|Record| (|:| |switch| 37) (|:| |body| $))
              (|Record| (|:| |name| 18) (|:| |contents| 76))
              (|Union| (|:| |nullBranch| '"null") (|:| |assignmentBranch| 28)
                       (|:| |arrayAssignmentBranch| 29)
                       (|:| |conditionalBranch| 30) (|:| |returnBranch| 31)
                       (|:| |blockBranch| 55) (|:| |commentBranch| 15)
                       (|:| |callBranch| 14) (|:| |forBranch| 32)
                       (|:| |labelBranch| 8) (|:| |loopBranch| 33)
                       (|:| |commonBranch| 34) (|:| |printBranch| 80))
              |FC;code;$U;24| (|Switch|) (35 . |coerce|) (40 . |coerce|)
              (45 . |width|) (49 . |width|) (|Boolean|) (54 . >)
              (60 . |hspace|) (65 . NOT) |FC;goto;Si$;34| (|List| 12) (70 . =)
              (76 . |coerce|) (81 . |coerce|) (86 . |cdr|) (91 . |car|)
              (96 . |coerce|) (101 . |convert|) (|List| $) (106 . |convert|)
              (|NonNegativeInteger|) (111 . >) (|SegmentBinding| 12)
              (117 . |variable|) (|FortranType|) (122 . |fortranInteger|)
              (|TheSymbolTable|) (126 . |declare!|) (|Segment| 12)
              (132 . |segment|) (137 . |lo|) (142 . |coerce|) (147 . |hi|)
              (152 . |Zero|) (|DoubleFloat|) (156 . |convert|) (|Void|)
              (161 . |void|) |FC;printCode;$V;23| (|List| 18)
              |FC;common;SL$;26| |FC;stop;$;27| |FC;save;$;28| (|List| 17)
              |FC;printStatement;L$;29| |FC;comment;L$;30| (165 . |list|)
              |FC;comment;S$;31| (170 . |incr|) (175 . |coerce|)
              |FC;forLoop;Sb2$;32| |FC;forLoop;SbP2$;33| |FC;continue;Si$;35|
              |FC;whileLoop;S2$;36| |FC;repeatUntilLoop;S2$;37|
              |FC;returns;$;38| (|Expression| (|MachineInteger|))
              (180 . |coerce|) |FC;returns;E$;39|
              (|Expression| (|MachineFloat|)) (185 . |coerce|)
              |FC;returns;E$;40| (|Expression| (|MachineComplex|))
              (190 . |coerce|) |FC;returns;E$;41| (|Expression| 7)
              (195 . |coerce|) |FC;returns;E$;42| (|Expression| (|Float|))
              (200 . |coerce|) |FC;returns;E$;43|
              (|Expression| (|Complex| (|Float|))) (205 . |coerce|)
              |FC;returns;E$;44| |FC;block;L$;45| |FC;cond;S2$;46|
              |FC;cond;S3$;47| (210 . |coerce|) |FC;coerce;$Of;48|
              (215 . |coerce|) |FC;assign;SS$;49| (|Matrix| (|MachineInteger|))
              (220 . |coerce|) |FC;assign;SM$;50| (|Matrix| (|MachineFloat|))
              (225 . |coerce|) |FC;assign;SM$;51| (|Matrix| (|MachineComplex|))
              (230 . |coerce|) |FC;assign;SM$;52| (|Vector| (|MachineInteger|))
              (235 . |coerce|) |FC;assign;SV$;53| (|Vector| (|MachineFloat|))
              (240 . |coerce|) |FC;assign;SV$;54| (|Vector| (|MachineComplex|))
              (245 . |coerce|) |FC;assign;SV$;55| (|Matrix| 93)
              (250 . |coerce|) |FC;assign;SM$;56| (|Matrix| 96)
              (255 . |coerce|) |FC;assign;SM$;57| (|Matrix| 99)
              (260 . |coerce|) |FC;assign;SM$;58| (|Vector| 93)
              (265 . |coerce|) |FC;assign;SV$;59| (|Vector| 96)
              (270 . |coerce|) |FC;assign;SV$;60| (|Vector| 99)
              (275 . |coerce|) |FC;assign;SV$;61| |FC;assign;SLE$;62|
              |FC;assign;SLE$;63| |FC;assign;SLE$;64| |FC;assign;SE$;65|
              |FC;assign;SE$;66| |FC;assign;SE$;67| (|Matrix| 102)
              (280 . |coerce|) |FC;assign;SM$;68| (|Matrix| 105)
              (285 . |coerce|) |FC;assign;SM$;69| (|Matrix| 108)
              (290 . |coerce|) |FC;assign;SM$;70| (|Vector| 102)
              (295 . |coerce|) |FC;assign;SV$;71| (|Vector| 105)
              (300 . |coerce|) |FC;assign;SV$;72| (|Vector| 108)
              (305 . |coerce|) |FC;assign;SV$;73| |FC;assign;SLE$;74|
              |FC;assign;SLE$;75| |FC;assign;SLE$;76| |FC;assign;SE$;77|
              |FC;assign;SE$;78| |FC;assign;SE$;79| |FC;call;S$;80|
              (|HashState|))
           '#(~= 310 |whileLoop| 316 |stop| 322 |setLabelValue| 326 |save| 331
              |returns| 335 |repeatUntilLoop| 369 |printStatement| 375
              |printCode| 380 |operation| 385 |latex| 390 |hashUpdate!| 395
              |hash| 401 |goto| 406 |getCode| 411 |forLoop| 416 |continue| 429
              |cond| 434 |common| 447 |comment| 453 |coerce| 463 |code| 468
              |call| 473 |block| 478 |assign| 483 = 675)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 17))
                        (|makeByteWordVec2| 185
                                            '(1 8 0 7 9 0 12 0 13 2 15 14 0 7
                                              16 1 18 17 0 19 1 20 0 17 21 1 18
                                              14 0 22 1 20 0 7 23 1 37 17 0 38
                                              1 8 17 0 39 0 17 7 40 1 17 7 0 41
                                              2 7 42 0 0 43 1 17 0 7 44 1 37 0
                                              0 45 2 47 42 0 0 48 1 12 0 18 49
                                              1 47 17 0 50 1 20 0 0 51 1 20 0 0
                                              52 1 20 17 0 53 1 20 0 14 54 1 20
                                              0 55 56 2 57 42 0 0 58 1 59 18 0
                                              60 0 61 0 62 2 63 61 18 61 64 1
                                              59 65 0 66 1 65 12 0 67 1 12 17 0
                                              68 1 65 12 0 69 0 12 0 70 1 20 0
                                              71 72 0 73 0 74 1 15 0 14 83 1 65
                                              7 0 85 1 12 0 7 86 1 93 17 0 94 1
                                              96 17 0 97 1 99 17 0 100 1 102 17
                                              0 103 1 105 17 0 106 1 108 17 0
                                              109 1 25 17 0 114 1 14 17 0 116 1
                                              118 17 0 119 1 121 17 0 122 1 124
                                              17 0 125 1 127 17 0 128 1 130 17
                                              0 131 1 133 17 0 134 1 136 17 0
                                              137 1 139 17 0 140 1 142 17 0 143
                                              1 145 17 0 146 1 148 17 0 149 1
                                              151 17 0 152 1 160 17 0 161 1 163
                                              17 0 164 1 166 17 0 167 1 169 17
                                              0 170 1 172 17 0 173 1 175 17 0
                                              176 2 0 42 0 0 1 2 0 0 37 0 90 0
                                              0 0 78 1 0 8 8 11 0 0 0 79 1 0 0
                                              108 110 1 0 0 105 107 1 0 0 102
                                              104 1 0 0 93 95 1 0 0 99 101 0 0
                                              0 92 1 0 0 96 98 2 0 0 37 0 91 1
                                              0 0 80 81 1 0 73 0 75 1 0 25 0 26
                                              1 0 14 0 1 2 0 185 185 0 1 1 0 8
                                              0 1 1 0 0 8 46 1 0 20 0 24 3 0 0
                                              59 12 0 88 2 0 0 59 0 87 1 0 0 8
                                              89 3 0 0 37 0 0 113 2 0 0 37 0
                                              112 2 0 0 18 76 77 1 0 0 15 82 1
                                              0 0 14 84 1 0 17 0 115 1 0 35 0
                                              36 1 0 0 14 184 1 0 0 55 111 3 0
                                              0 18 47 105 179 3 0 0 18 47 108
                                              180 2 0 0 18 175 177 3 0 0 18 47
                                              102 178 2 0 0 18 169 171 2 0 0 18
                                              172 174 2 0 0 18 163 165 2 0 0 18
                                              166 168 2 0 0 18 108 183 2 0 0 18
                                              160 162 2 0 0 18 102 181 2 0 0 18
                                              105 182 3 0 0 18 47 96 155 3 0 0
                                              18 47 99 156 2 0 0 18 151 153 3 0
                                              0 18 47 93 154 2 0 0 18 145 147 2
                                              0 0 18 148 150 2 0 0 18 139 141 2
                                              0 0 18 142 144 2 0 0 18 133 135 2
                                              0 0 18 136 138 2 0 0 18 127 129 2
                                              0 0 18 130 132 2 0 0 18 121 123 2
                                              0 0 18 124 126 2 0 0 18 99 159 2
                                              0 0 18 118 120 2 0 0 18 93 157 2
                                              0 0 18 96 158 2 0 0 18 14 117 2 0
                                              42 0 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|FortranCode| 'NILADIC T) 
