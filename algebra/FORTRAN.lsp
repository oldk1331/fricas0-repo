
(SDEFUN |FORTRAN;makeRep| ((|b| |List| (|FortranCode|)) ($ $))
        (CONS (SPADCALL (QREFELT $ 12)) |b|)) 

(PUT '|FORTRAN;codeFrom| '|SPADreplace| 'QCDR) 

(SDEFUN |FORTRAN;codeFrom| ((|u| $) ($ |List| (|FortranCode|))) (QCDR |u|)) 

(SDEFUN |FORTRAN;fortFormatHead1|
        ((|asp| |List| (|String|)) ($ |List| (|String|)))
        (SPROG
         ((|of| (|OutputForm|)) (#1=#:G129 NIL) (|arg| NIL) (#2=#:G128 NIL))
         (SEQ
          (LETT |of|
                (SPADCALL (SPADCALL (QREFELT $ 6) (QREFELT $ 15))
                          (PROGN
                           (LETT #2# NIL . #3=(|FORTRAN;fortFormatHead1|))
                           (SEQ (LETT |arg| NIL . #3#)
                                (LETT #1# (QREFELT $ 8) . #3#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |arg| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |arg| (QREFELT $ 15))
                                              #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 17))
                . #3#)
          (EXIT (APPEND |asp| (SPADCALL |of| (QREFELT $ 20))))))) 

(SDEFUN |FORTRAN;fortFormatHead| (($ |Void|))
        (SPROG
         ((|lines| (|List| (|String|))) (|l| (|Integer|))
          (|asp| (|List| (|String|))) (|s| (|String|)) (#1=#:G117 NIL))
         (SEQ
          (COND
           ((QEQCAR (QREFELT $ 7) 1)
            (SEQ
             (LETT |asp| (LIST "SUBROUTINE ") . #2=(|FORTRAN;fortFormatHead|))
             (EXIT (SPADCALL (LETT |l| -11 . #2#) (QREFELT $ 23)))))
           ('T
            (SEQ
             (LETT |s|
                   (|checkType|
                    (SPADCALL
                     (PROG2 (LETT #1# (QREFELT $ 7) . #2#)
                         (QCDR #1#)
                       (|check_union| (QEQCAR #1# 0) (|FortranScalarType|)
                                      #1#))
                     (QREFELT $ 26)))
                   . #2#)
             (LETT |asp| (LIST |s| " FUNCTION ") . #2#)
             (EXIT
              (SPADCALL (LETT |l| (- -10 (QCSIZE |s|)) . #2#)
                        (QREFELT $ 23))))))
          (LETT |lines|
                (SPADCALL (CONS #'|FORTRAN;fortFormatHead!0| (VECTOR $ |asp|))
                          (QREFELT $ 28))
                . #2#)
          (SPADCALL |lines| (QREFELT $ 29))
          (EXIT (SPADCALL (- |l|) (QREFELT $ 23)))))) 

(SDEFUN |FORTRAN;fortFormatHead!0| (($$ NIL))
        (PROG (|asp| $)
          (LETT |asp| (QREFELT $$ 1) . #1=(|FORTRAN;fortFormatHead|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|FORTRAN;fortFormatHead1| |asp| $))))) 

(SDEFUN |FORTRAN;outputAsFortran;$V;5| ((|p| $) ($ |Void|))
        (SPROG
         ((#1=#:G141 NIL) (|expr| NIL) (|intrinsics| (|List| (|String|)))
          (|body| (|List| (|List| (|String|)))) (#2=#:G140 NIL) (|l| NIL)
          (#3=#:G139 NIL) (|tempName| (|Symbol|)))
         (SEQ (SPADCALL (SPADCALL 25000 (QREFELT $ 31)) (QREFELT $ 33))
              (LETT |tempName| 'FPTEMP . #4=(|FORTRAN;outputAsFortran;$V;5|))
              (SPADCALL |tempName| (QREFELT $ 35)) (|initialiseIntrinsicList|)
              (LETT |body|
                    (PROGN
                     (LETT #3# NIL . #4#)
                     (SEQ (LETT |l| NIL . #4#)
                          (LETT #2# (|FORTRAN;codeFrom| |p| $) . #4#) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |l| (CAR #2#) . #4#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3# (CONS (SPADCALL |l| (QREFELT $ 36)) #3#)
                                  . #4#)))
                          (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    . #4#)
              (LETT |intrinsics| (|getIntrinsicList|) . #4#)
              (SPADCALL (QREFELT $ 37)) (|FORTRAN;fortFormatHead| $)
              (SPADCALL (QREFELT $ 9) (QREFELT $ 38))
              (SPADCALL (QCAR |p|) (QREFELT $ 38))
              (SPADCALL |tempName| (QREFELT $ 39))
              (|fortFormatIntrinsics| |intrinsics|)
              (SPADCALL |tempName| (QREFELT $ 40))
              (SEQ (LETT |expr| NIL . #4#) (LETT #1# |body| . #4#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |expr| (CAR #1#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |expr| (QREFELT $ 29))))
                   (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (SPADCALL 'END (QREFELT $ 15)) (QREFELT $ 41)))))) 

(SDEFUN |FORTRAN;mkString| ((|l| |List| (|Symbol|)) ($ |String|))
        (SPADCALL (SPADCALL |l| (QREFELT $ 45)) (QREFELT $ 46))) 

(SDEFUN |FORTRAN;checkVariables|
        ((|user| |List| (|Symbol|)) (|target| |List| (|Symbol|)) ($ |Void|))
        (SPROG ((|s2| #1=(|String|)) (|s1| #1#))
               (SEQ
                (COND
                 ((SPADCALL
                   (SPADCALL (SPADCALL (ELT $ 47) |user| (QREFELT $ 49))
                             |target| (QREFELT $ 50))
                   NIL (QREFELT $ 52))
                  (SEQ
                   (LETT |s1| (|FORTRAN;mkString| |user| $)
                         . #2=(|FORTRAN;checkVariables|))
                   (LETT |s2| (|FORTRAN;mkString| |target| $) . #2#)
                   (EXIT
                    (|error|
                     (SPADCALL (LIST "Incompatible variable lists:" |s1| |s2|)
                               (QREFELT $ 53))))))
                 ('T (SPADCALL (QREFELT $ 54))))))) 

(SDEFUN |FORTRAN;coerce;E$;8| ((|u| |Expression| (|MachineInteger|)) ($ $))
        (SPROG ((|l| (|List| (|FortranCode|))))
               (SEQ
                (|FORTRAN;checkVariables| (SPADCALL |u| (QREFELT $ 56))
                 (QREFELT $ 8) $)
                (LETT |l|
                      (LIST (SPADCALL (QREFELT $ 6) |u| (QREFELT $ 57))
                            (SPADCALL (QREFELT $ 58)))
                      |FORTRAN;coerce;E$;8|)
                (EXIT (|FORTRAN;makeRep| |l| $))))) 

(SDEFUN |FORTRAN;coerce;E$;9|
        ((|u| |Equation| (|Expression| (|MachineInteger|))) ($ $))
        (SPROG
         ((|eList| (|List| (|Equation| (|Expression| (|MachineInteger|)))))
          (#1=#:G166 NIL) (|w| NIL) (#2=#:G167 NIL) (|v| NIL) (#3=#:G165 NIL)
          (|aeList| (|List| (|Expression| (|MachineInteger|)))) (#4=#:G164 NIL)
          (#5=#:G163 NIL) (|veList| (|List| (|Expression| (|MachineInteger|))))
          (#6=#:G162 NIL) (#7=#:G161 NIL) (|vList| (|List| (|Symbol|))))
         (SEQ
          (COND
           ((QEQCAR (SPADCALL (SPADCALL |u| (QREFELT $ 61)) (QREFELT $ 63)) 1)
            (|error| "left hand side is not a kernel"))
           (#8='T
            (SEQ
             (LETT |vList|
                   (SPADCALL (SPADCALL |u| (QREFELT $ 61)) (QREFELT $ 56))
                   . #9=(|FORTRAN;coerce;E$;9|))
             (EXIT
              (COND
               ((SPADCALL (LENGTH |vList|) (LENGTH (QREFELT $ 8))
                          (QREFELT $ 65))
                (|error| "Incorrect number of arguments"))
               (#8#
                (SEQ
                 (LETT |veList|
                       (PROGN
                        (LETT #7# NIL . #9#)
                        (SEQ (LETT |w| NIL . #9#) (LETT #6# |vList| . #9#) G190
                             (COND
                              ((OR (ATOM #6#)
                                   (PROGN (LETT |w| (CAR #6#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #7#
                                     (CONS (SPADCALL |w| (QREFELT $ 66)) #7#)
                                     . #9#)))
                             (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                             (EXIT (NREVERSE #7#))))
                       . #9#)
                 (LETT |aeList|
                       (PROGN
                        (LETT #5# NIL . #9#)
                        (SEQ (LETT |w| NIL . #9#)
                             (LETT #4# (QREFELT $ 8) . #9#) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |w| (CAR #4#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #5#
                                     (CONS (SPADCALL |w| (QREFELT $ 66)) #5#)
                                     . #9#)))
                             (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                             (EXIT (NREVERSE #5#))))
                       . #9#)
                 (LETT |eList|
                       (PROGN
                        (LETT #3# NIL . #9#)
                        (SEQ (LETT |v| NIL . #9#) (LETT #2# |aeList| . #9#)
                             (LETT |w| NIL . #9#) (LETT #1# |veList| . #9#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |w| (CAR #1#) . #9#) NIL)
                                   (ATOM #2#)
                                   (PROGN (LETT |v| (CAR #2#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #3#
                                     (CONS (SPADCALL |w| |v| (QREFELT $ 67))
                                           #3#)
                                     . #9#)))
                             (LETT #1#
                                   (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #9#))
                                   . #9#)
                             (GO G190) G191 (EXIT (NREVERSE #3#))))
                       . #9#)
                 (EXIT
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT $ 68)) |eList|
                             (QREFELT $ 70))
                   (QREFELT $ 59))))))))))))) 

(SDEFUN |FORTRAN;coerce;E$;10| ((|u| |Expression| (|MachineFloat|)) ($ $))
        (SPROG ((|l| (|List| (|FortranCode|))))
               (SEQ
                (|FORTRAN;checkVariables| (SPADCALL |u| (QREFELT $ 73))
                 (QREFELT $ 8) $)
                (LETT |l|
                      (LIST (SPADCALL (QREFELT $ 6) |u| (QREFELT $ 74))
                            (SPADCALL (QREFELT $ 58)))
                      |FORTRAN;coerce;E$;10|)
                (EXIT (|FORTRAN;makeRep| |l| $))))) 

(SDEFUN |FORTRAN;coerce;E$;11|
        ((|u| |Equation| (|Expression| (|MachineFloat|))) ($ $))
        (SPROG
         ((|eList| (|List| (|Equation| (|Expression| (|MachineFloat|)))))
          (#1=#:G186 NIL) (|w| NIL) (#2=#:G187 NIL) (|v| NIL) (#3=#:G185 NIL)
          (|aeList| (|List| (|Expression| (|MachineFloat|)))) (#4=#:G184 NIL)
          (#5=#:G183 NIL) (|veList| (|List| (|Expression| (|MachineFloat|))))
          (#6=#:G182 NIL) (#7=#:G181 NIL) (|vList| (|List| (|Symbol|))))
         (SEQ
          (COND
           ((QEQCAR (SPADCALL (SPADCALL |u| (QREFELT $ 77)) (QREFELT $ 78)) 1)
            (|error| "left hand side is not a kernel"))
           (#8='T
            (SEQ
             (LETT |vList|
                   (SPADCALL (SPADCALL |u| (QREFELT $ 77)) (QREFELT $ 73))
                   . #9=(|FORTRAN;coerce;E$;11|))
             (EXIT
              (COND
               ((SPADCALL (LENGTH |vList|) (LENGTH (QREFELT $ 8))
                          (QREFELT $ 65))
                (|error| "Incorrect number of arguments"))
               (#8#
                (SEQ
                 (LETT |veList|
                       (PROGN
                        (LETT #7# NIL . #9#)
                        (SEQ (LETT |w| NIL . #9#) (LETT #6# |vList| . #9#) G190
                             (COND
                              ((OR (ATOM #6#)
                                   (PROGN (LETT |w| (CAR #6#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #7#
                                     (CONS (SPADCALL |w| (QREFELT $ 79)) #7#)
                                     . #9#)))
                             (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                             (EXIT (NREVERSE #7#))))
                       . #9#)
                 (LETT |aeList|
                       (PROGN
                        (LETT #5# NIL . #9#)
                        (SEQ (LETT |w| NIL . #9#)
                             (LETT #4# (QREFELT $ 8) . #9#) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |w| (CAR #4#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #5#
                                     (CONS (SPADCALL |w| (QREFELT $ 79)) #5#)
                                     . #9#)))
                             (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                             (EXIT (NREVERSE #5#))))
                       . #9#)
                 (LETT |eList|
                       (PROGN
                        (LETT #3# NIL . #9#)
                        (SEQ (LETT |v| NIL . #9#) (LETT #2# |aeList| . #9#)
                             (LETT |w| NIL . #9#) (LETT #1# |veList| . #9#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |w| (CAR #1#) . #9#) NIL)
                                   (ATOM #2#)
                                   (PROGN (LETT |v| (CAR #2#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #3#
                                     (CONS (SPADCALL |w| |v| (QREFELT $ 80))
                                           #3#)
                                     . #9#)))
                             (LETT #1#
                                   (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #9#))
                                   . #9#)
                             (GO G190) G191 (EXIT (NREVERSE #3#))))
                       . #9#)
                 (EXIT
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT $ 81)) |eList|
                             (QREFELT $ 82))
                   (QREFELT $ 75))))))))))))) 

(SDEFUN |FORTRAN;coerce;E$;12| ((|u| |Expression| (|MachineComplex|)) ($ $))
        (SPROG ((|l| (|List| (|FortranCode|))))
               (SEQ
                (|FORTRAN;checkVariables| (SPADCALL |u| (QREFELT $ 85))
                 (QREFELT $ 8) $)
                (LETT |l|
                      (LIST (SPADCALL (QREFELT $ 6) |u| (QREFELT $ 86))
                            (SPADCALL (QREFELT $ 58)))
                      |FORTRAN;coerce;E$;12|)
                (EXIT (|FORTRAN;makeRep| |l| $))))) 

(SDEFUN |FORTRAN;coerce;E$;13|
        ((|u| |Equation| (|Expression| (|MachineComplex|))) ($ $))
        (SPROG
         ((|eList| (|List| (|Equation| (|Expression| (|MachineComplex|)))))
          (#1=#:G206 NIL) (|w| NIL) (#2=#:G207 NIL) (|v| NIL) (#3=#:G205 NIL)
          (|aeList| (|List| (|Expression| (|MachineComplex|)))) (#4=#:G204 NIL)
          (#5=#:G203 NIL) (|veList| (|List| (|Expression| (|MachineComplex|))))
          (#6=#:G202 NIL) (#7=#:G201 NIL) (|vList| (|List| (|Symbol|))))
         (SEQ
          (COND
           ((QEQCAR (SPADCALL (SPADCALL |u| (QREFELT $ 89)) (QREFELT $ 90)) 1)
            (|error| "left hand side is not a kernel"))
           (#8='T
            (SEQ
             (LETT |vList|
                   (SPADCALL (SPADCALL |u| (QREFELT $ 89)) (QREFELT $ 85))
                   . #9=(|FORTRAN;coerce;E$;13|))
             (EXIT
              (COND
               ((SPADCALL (LENGTH |vList|) (LENGTH (QREFELT $ 8))
                          (QREFELT $ 65))
                (|error| "Incorrect number of arguments"))
               (#8#
                (SEQ
                 (LETT |veList|
                       (PROGN
                        (LETT #7# NIL . #9#)
                        (SEQ (LETT |w| NIL . #9#) (LETT #6# |vList| . #9#) G190
                             (COND
                              ((OR (ATOM #6#)
                                   (PROGN (LETT |w| (CAR #6#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #7#
                                     (CONS (SPADCALL |w| (QREFELT $ 91)) #7#)
                                     . #9#)))
                             (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                             (EXIT (NREVERSE #7#))))
                       . #9#)
                 (LETT |aeList|
                       (PROGN
                        (LETT #5# NIL . #9#)
                        (SEQ (LETT |w| NIL . #9#)
                             (LETT #4# (QREFELT $ 8) . #9#) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |w| (CAR #4#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #5#
                                     (CONS (SPADCALL |w| (QREFELT $ 91)) #5#)
                                     . #9#)))
                             (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                             (EXIT (NREVERSE #5#))))
                       . #9#)
                 (LETT |eList|
                       (PROGN
                        (LETT #3# NIL . #9#)
                        (SEQ (LETT |v| NIL . #9#) (LETT #2# |aeList| . #9#)
                             (LETT |w| NIL . #9#) (LETT #1# |veList| . #9#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |w| (CAR #1#) . #9#) NIL)
                                   (ATOM #2#)
                                   (PROGN (LETT |v| (CAR #2#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #3#
                                     (CONS (SPADCALL |w| |v| (QREFELT $ 92))
                                           #3#)
                                     . #9#)))
                             (LETT #1#
                                   (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #9#))
                                   . #9#)
                             (GO G190) G191 (EXIT (NREVERSE #3#))))
                       . #9#)
                 (EXIT
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT $ 93)) |eList|
                             (QREFELT $ 94))
                   (QREFELT $ 87))))))))))))) 

(PUT '|FORTRAN;coerce;R$;14| '|SPADreplace| '(XLAM (|u|) |u|)) 

(SDEFUN |FORTRAN;coerce;R$;14|
        ((|u| |Record| (|:| |localSymbols| (|SymbolTable|))
          (|:| |code| (|List| (|FortranCode|))))
         ($ $))
        |u|) 

(SDEFUN |FORTRAN;coerce;$Of;15| ((|u| $) ($ |OutputForm|))
        (SPADCALL (QREFELT $ 6) (QREFELT $ 15))) 

(SDEFUN |FORTRAN;coerce;L$;16| ((|c| |List| (|FortranCode|)) ($ $))
        (|FORTRAN;makeRep| |c| $)) 

(SDEFUN |FORTRAN;coerce;Fc$;17| ((|c| |FortranCode|) ($ $))
        (|FORTRAN;makeRep| (LIST |c|) $)) 

(SDEFUN |FORTRAN;coerce;E$;18| ((|u| |Expression| (|Integer|)) ($ $))
        (SPROG ((|l| (|List| (|FortranCode|))))
               (SEQ
                (|FORTRAN;checkVariables| (SPADCALL |u| (QREFELT $ 103))
                 (QREFELT $ 8) $)
                (LETT |l|
                      (LIST (SPADCALL (QREFELT $ 6) |u| (QREFELT $ 104))
                            (SPADCALL (QREFELT $ 58)))
                      |FORTRAN;coerce;E$;18|)
                (EXIT (|FORTRAN;makeRep| |l| $))))) 

(SDEFUN |FORTRAN;coerce;E$;19|
        ((|u| |Equation| (|Expression| (|Integer|))) ($ $))
        (SPROG
         ((|eList| (|List| (|Equation| (|Expression| (|Integer|)))))
          (#1=#:G232 NIL) (|w| NIL) (#2=#:G233 NIL) (|v| NIL) (#3=#:G231 NIL)
          (|aeList| (|List| (|Expression| (|Integer|)))) (#4=#:G230 NIL)
          (#5=#:G229 NIL) (|veList| (|List| (|Expression| (|Integer|))))
          (#6=#:G228 NIL) (#7=#:G227 NIL) (|vList| (|List| (|Symbol|))))
         (SEQ
          (COND
           ((QEQCAR (SPADCALL (SPADCALL |u| (QREFELT $ 107)) (QREFELT $ 108))
                    1)
            (|error| "left hand side is not a kernel"))
           (#8='T
            (SEQ
             (LETT |vList|
                   (SPADCALL (SPADCALL |u| (QREFELT $ 107)) (QREFELT $ 103))
                   . #9=(|FORTRAN;coerce;E$;19|))
             (EXIT
              (COND
               ((SPADCALL (LENGTH |vList|) (LENGTH (QREFELT $ 8))
                          (QREFELT $ 65))
                (|error| "Incorrect number of arguments"))
               (#8#
                (SEQ
                 (LETT |veList|
                       (PROGN
                        (LETT #7# NIL . #9#)
                        (SEQ (LETT |w| NIL . #9#) (LETT #6# |vList| . #9#) G190
                             (COND
                              ((OR (ATOM #6#)
                                   (PROGN (LETT |w| (CAR #6#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #7#
                                     (CONS (SPADCALL |w| (QREFELT $ 109)) #7#)
                                     . #9#)))
                             (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                             (EXIT (NREVERSE #7#))))
                       . #9#)
                 (LETT |aeList|
                       (PROGN
                        (LETT #5# NIL . #9#)
                        (SEQ (LETT |w| NIL . #9#)
                             (LETT #4# (QREFELT $ 8) . #9#) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |w| (CAR #4#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #5#
                                     (CONS (SPADCALL |w| (QREFELT $ 109)) #5#)
                                     . #9#)))
                             (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                             (EXIT (NREVERSE #5#))))
                       . #9#)
                 (LETT |eList|
                       (PROGN
                        (LETT #3# NIL . #9#)
                        (SEQ (LETT |v| NIL . #9#) (LETT #2# |aeList| . #9#)
                             (LETT |w| NIL . #9#) (LETT #1# |veList| . #9#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |w| (CAR #1#) . #9#) NIL)
                                   (ATOM #2#)
                                   (PROGN (LETT |v| (CAR #2#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #3#
                                     (CONS (SPADCALL |w| |v| (QREFELT $ 110))
                                           #3#)
                                     . #9#)))
                             (LETT #1#
                                   (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #9#))
                                   . #9#)
                             (GO G190) G191 (EXIT (NREVERSE #3#))))
                       . #9#)
                 (EXIT
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT $ 111)) |eList|
                             (QREFELT $ 112))
                   (QREFELT $ 105))))))))))))) 

(SDEFUN |FORTRAN;coerce;E$;20| ((|u| |Expression| (|Float|)) ($ $))
        (SPROG ((|l| (|List| (|FortranCode|))))
               (SEQ
                (|FORTRAN;checkVariables| (SPADCALL |u| (QREFELT $ 115))
                 (QREFELT $ 8) $)
                (LETT |l|
                      (LIST (SPADCALL (QREFELT $ 6) |u| (QREFELT $ 116))
                            (SPADCALL (QREFELT $ 58)))
                      |FORTRAN;coerce;E$;20|)
                (EXIT (|FORTRAN;makeRep| |l| $))))) 

(SDEFUN |FORTRAN;coerce;E$;21|
        ((|u| |Equation| (|Expression| (|Float|))) ($ $))
        (SPROG
         ((|eList| (|List| (|Equation| (|Expression| (|Float|)))))
          (#1=#:G252 NIL) (|w| NIL) (#2=#:G253 NIL) (|v| NIL) (#3=#:G251 NIL)
          (|aeList| (|List| (|Expression| (|Float|)))) (#4=#:G250 NIL)
          (#5=#:G249 NIL) (|veList| (|List| (|Expression| (|Float|))))
          (#6=#:G248 NIL) (#7=#:G247 NIL) (|vList| (|List| (|Symbol|))))
         (SEQ
          (COND
           ((QEQCAR (SPADCALL (SPADCALL |u| (QREFELT $ 119)) (QREFELT $ 120))
                    1)
            (|error| "left hand side is not a kernel"))
           (#8='T
            (SEQ
             (LETT |vList|
                   (SPADCALL (SPADCALL |u| (QREFELT $ 119)) (QREFELT $ 115))
                   . #9=(|FORTRAN;coerce;E$;21|))
             (EXIT
              (COND
               ((SPADCALL (LENGTH |vList|) (LENGTH (QREFELT $ 8))
                          (QREFELT $ 65))
                (|error| "Incorrect number of arguments"))
               (#8#
                (SEQ
                 (LETT |veList|
                       (PROGN
                        (LETT #7# NIL . #9#)
                        (SEQ (LETT |w| NIL . #9#) (LETT #6# |vList| . #9#) G190
                             (COND
                              ((OR (ATOM #6#)
                                   (PROGN (LETT |w| (CAR #6#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #7#
                                     (CONS (SPADCALL |w| (QREFELT $ 121)) #7#)
                                     . #9#)))
                             (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                             (EXIT (NREVERSE #7#))))
                       . #9#)
                 (LETT |aeList|
                       (PROGN
                        (LETT #5# NIL . #9#)
                        (SEQ (LETT |w| NIL . #9#)
                             (LETT #4# (QREFELT $ 8) . #9#) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |w| (CAR #4#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #5#
                                     (CONS (SPADCALL |w| (QREFELT $ 121)) #5#)
                                     . #9#)))
                             (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                             (EXIT (NREVERSE #5#))))
                       . #9#)
                 (LETT |eList|
                       (PROGN
                        (LETT #3# NIL . #9#)
                        (SEQ (LETT |v| NIL . #9#) (LETT #2# |aeList| . #9#)
                             (LETT |w| NIL . #9#) (LETT #1# |veList| . #9#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |w| (CAR #1#) . #9#) NIL)
                                   (ATOM #2#)
                                   (PROGN (LETT |v| (CAR #2#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #3#
                                     (CONS (SPADCALL |w| |v| (QREFELT $ 122))
                                           #3#)
                                     . #9#)))
                             (LETT #1#
                                   (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #9#))
                                   . #9#)
                             (GO G190) G191 (EXIT (NREVERSE #3#))))
                       . #9#)
                 (EXIT
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT $ 123)) |eList|
                             (QREFELT $ 124))
                   (QREFELT $ 117))))))))))))) 

(SDEFUN |FORTRAN;coerce;E$;22| ((|u| |Expression| (|Complex| (|Float|))) ($ $))
        (SPROG ((|l| (|List| (|FortranCode|))))
               (SEQ
                (|FORTRAN;checkVariables| (SPADCALL |u| (QREFELT $ 127))
                 (QREFELT $ 8) $)
                (LETT |l|
                      (LIST (SPADCALL (QREFELT $ 6) |u| (QREFELT $ 128))
                            (SPADCALL (QREFELT $ 58)))
                      |FORTRAN;coerce;E$;22|)
                (EXIT (|FORTRAN;makeRep| |l| $))))) 

(SDEFUN |FORTRAN;coerce;E$;23|
        ((|u| |Equation| (|Expression| (|Complex| (|Float|)))) ($ $))
        (SPROG
         ((|eList| (|List| (|Equation| (|Expression| (|Complex| (|Float|))))))
          (#1=#:G272 NIL) (|w| NIL) (#2=#:G273 NIL) (|v| NIL) (#3=#:G271 NIL)
          (|aeList| (|List| (|Expression| (|Complex| (|Float|)))))
          (#4=#:G270 NIL) (#5=#:G269 NIL)
          (|veList| (|List| (|Expression| (|Complex| (|Float|)))))
          (#6=#:G268 NIL) (#7=#:G267 NIL) (|vList| (|List| (|Symbol|))))
         (SEQ
          (COND
           ((QEQCAR (SPADCALL (SPADCALL |u| (QREFELT $ 131)) (QREFELT $ 132))
                    1)
            (|error| "left hand side is not a kernel"))
           (#8='T
            (SEQ
             (LETT |vList|
                   (SPADCALL (SPADCALL |u| (QREFELT $ 131)) (QREFELT $ 127))
                   . #9=(|FORTRAN;coerce;E$;23|))
             (EXIT
              (COND
               ((SPADCALL (LENGTH |vList|) (LENGTH (QREFELT $ 8))
                          (QREFELT $ 65))
                (|error| "Incorrect number of arguments"))
               (#8#
                (SEQ
                 (LETT |veList|
                       (PROGN
                        (LETT #7# NIL . #9#)
                        (SEQ (LETT |w| NIL . #9#) (LETT #6# |vList| . #9#) G190
                             (COND
                              ((OR (ATOM #6#)
                                   (PROGN (LETT |w| (CAR #6#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #7#
                                     (CONS (SPADCALL |w| (QREFELT $ 133)) #7#)
                                     . #9#)))
                             (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                             (EXIT (NREVERSE #7#))))
                       . #9#)
                 (LETT |aeList|
                       (PROGN
                        (LETT #5# NIL . #9#)
                        (SEQ (LETT |w| NIL . #9#)
                             (LETT #4# (QREFELT $ 8) . #9#) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |w| (CAR #4#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #5#
                                     (CONS (SPADCALL |w| (QREFELT $ 133)) #5#)
                                     . #9#)))
                             (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                             (EXIT (NREVERSE #5#))))
                       . #9#)
                 (LETT |eList|
                       (PROGN
                        (LETT #3# NIL . #9#)
                        (SEQ (LETT |v| NIL . #9#) (LETT #2# |aeList| . #9#)
                             (LETT |w| NIL . #9#) (LETT #1# |veList| . #9#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |w| (CAR #1#) . #9#) NIL)
                                   (ATOM #2#)
                                   (PROGN (LETT |v| (CAR #2#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #3#
                                     (CONS (SPADCALL |w| |v| (QREFELT $ 134))
                                           #3#)
                                     . #9#)))
                             (LETT #1#
                                   (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #9#))
                                   . #9#)
                             (GO G190) G191 (EXIT (NREVERSE #3#))))
                       . #9#)
                 (EXIT
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT $ 135)) |eList|
                             (QREFELT $ 136))
                   (QREFELT $ 129))))))))))))) 

(DECLAIM (NOTINLINE |FortranProgram;|)) 

(DEFUN |FortranProgram| (&REST #1=#:G274)
  (SPROG NIL
         (PROG (#2=#:G275)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FortranProgram|)
                                               '|domainEqualList|)
                    . #3=(|FortranProgram|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FortranProgram;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FortranProgram|)))))))))) 

(DEFUN |FortranProgram;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|FortranProgram|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|FortranProgram| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 138) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|FortranProgram|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 10
              (|Record| (|:| |localSymbols| (|SymbolTable|))
                        (|:| |code| (|List| (|FortranCode|)))))
    $))) 

(MAKEPROP '|FortranProgram| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) '|Rep| (|SymbolTable|)
              (0 . |empty|) (|OutputForm|) (|Symbol|) (4 . |coerce|) (|List| $)
              (9 . |elt|) (|List| 24) (|FortranCodeTools|)
              (15 . |statement2Fortran|) (|Void|) (|Integer|)
              (20 . |changeExprLength|) (|String|) (|FortranScalarType|)
              (25 . |coerce|) (|Mapping| 18) (30 . |do_with_error_env1|)
              (35 . |displayLines1|) (|SingleInteger|) (40 . |coerce|)
              (|FortranCode|) (45 . |setLabelValue|) (|TheSymbolTable|)
              (50 . |newSubProgram|) (55 . |getCode|) (60 . |endSubProgram|)
              (64 . |printTypes|) (69 . |printTypes|)
              (74 . |clearTheSymbolTable|) (79 . |dispStatement|)
              |FORTRAN;outputAsFortran;$V;5| (|InputForm|) (|List| 14)
              (84 . |convert|) (89 . |unparse|) (94 . |name|) (|Mapping| 14 14)
              (99 . |map|) (105 . |setDifference|) (|Boolean|) (111 . ~=)
              (117 . |coerce|) (122 . |void|) (|Expression| (|MachineInteger|))
              (126 . |variables|) (131 . |assign|) (137 . |returns|)
              |FORTRAN;coerce;E$;8| (|Equation| 55) (141 . |lhs|)
              (|Union| (|Kernel| $) '"failed") (146 . |retractIfCan|)
              (|NonNegativeInteger|) (151 . ~=) (157 . |coerce|)
              (162 . |equation|) (168 . |rhs|) (|List| (|Equation| $))
              (173 . |subst|) |FORTRAN;coerce;E$;9|
              (|Expression| (|MachineFloat|)) (179 . |variables|)
              (184 . |assign|) |FORTRAN;coerce;E$;10| (|Equation| 72)
              (190 . |lhs|) (195 . |retractIfCan|) (200 . |coerce|)
              (205 . |equation|) (211 . |rhs|) (216 . |subst|)
              |FORTRAN;coerce;E$;11| (|Expression| (|MachineComplex|))
              (222 . |variables|) (227 . |assign|) |FORTRAN;coerce;E$;12|
              (|Equation| 84) (233 . |lhs|) (238 . |retractIfCan|)
              (243 . |coerce|) (248 . |equation|) (254 . |rhs|) (259 . |subst|)
              |FORTRAN;coerce;E$;13|
              (|Record| (|:| |localSymbols| 11) (|:| |code| 99))
              |FORTRAN;coerce;R$;14| |FORTRAN;coerce;$Of;15| (|List| 32)
              |FORTRAN;coerce;L$;16| |FORTRAN;coerce;Fc$;17| (|Expression| 22)
              (265 . |variables|) (270 . |assign|) |FORTRAN;coerce;E$;18|
              (|Equation| 102) (276 . |lhs|) (281 . |retractIfCan|)
              (286 . |coerce|) (291 . |equation|) (297 . |rhs|) (302 . |subst|)
              |FORTRAN;coerce;E$;19| (|Expression| (|Float|))
              (308 . |variables|) (313 . |assign|) |FORTRAN;coerce;E$;20|
              (|Equation| 114) (319 . |lhs|) (324 . |retractIfCan|)
              (329 . |coerce|) (334 . |equation|) (340 . |rhs|) (345 . |subst|)
              |FORTRAN;coerce;E$;21| (|Expression| (|Complex| (|Float|)))
              (351 . |variables|) (356 . |assign|) |FORTRAN;coerce;E$;22|
              (|Equation| 126) (362 . |lhs|) (367 . |retractIfCan|)
              (372 . |coerce|) (377 . |equation|) (383 . |rhs|) (388 . |subst|)
              |FORTRAN;coerce;E$;23|)
           '#(|outputAsFortran| 394 |coerce| 399) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(NIL NIL NIL)
                       (CONS
                        '#((|FortranProgramCategory|) (|Type|)
                           (|CoercibleTo| 13))
                        (|makeByteWordVec2| 137
                                            '(0 11 0 12 1 14 13 0 15 2 13 0 0
                                              16 17 1 19 18 13 20 1 19 21 22 23
                                              1 25 24 0 26 1 19 18 27 28 1 19
                                              21 18 29 1 30 0 22 31 1 32 30 30
                                              33 1 34 21 14 35 1 32 18 0 36 0
                                              34 14 37 1 11 21 0 38 1 34 21 14
                                              39 1 34 21 14 40 1 19 21 13 41 1
                                              44 43 0 45 1 43 24 0 46 1 14 0 0
                                              47 2 44 0 48 0 49 2 44 0 0 0 50 2
                                              44 51 0 0 52 1 18 13 0 53 0 21 0
                                              54 1 55 44 0 56 2 32 0 14 55 57 0
                                              32 0 58 1 60 55 0 61 1 55 62 0 63
                                              2 64 51 0 0 65 1 55 0 14 66 2 60
                                              0 55 55 67 1 60 55 0 68 2 55 0 0
                                              69 70 1 72 44 0 73 2 32 0 14 72
                                              74 1 76 72 0 77 1 72 62 0 78 1 72
                                              0 14 79 2 76 0 72 72 80 1 76 72 0
                                              81 2 72 0 0 69 82 1 84 44 0 85 2
                                              32 0 14 84 86 1 88 84 0 89 1 84
                                              62 0 90 1 84 0 14 91 2 88 0 84 84
                                              92 1 88 84 0 93 2 84 0 0 69 94 1
                                              102 44 0 103 2 32 0 14 102 104 1
                                              106 102 0 107 1 102 62 0 108 1
                                              102 0 14 109 2 106 0 102 102 110
                                              1 106 102 0 111 2 102 0 0 69 112
                                              1 114 44 0 115 2 32 0 14 114 116
                                              1 118 114 0 119 1 114 62 0 120 1
                                              114 0 14 121 2 118 0 114 114 122
                                              1 118 114 0 123 2 114 0 0 69 124
                                              1 126 44 0 127 2 32 0 14 126 128
                                              1 130 126 0 131 1 126 62 0 132 1
                                              126 0 14 133 2 130 0 126 126 134
                                              1 130 126 0 135 2 126 0 0 69 136
                                              1 0 21 0 42 1 0 0 118 125 1 0 0
                                              130 137 1 0 0 126 129 1 0 0 106
                                              113 1 0 0 102 105 1 0 0 114 117 1
                                              0 0 76 83 1 0 0 88 95 1 0 0 84 87
                                              1 0 0 60 71 1 0 0 55 59 1 0 0 72
                                              75 1 0 0 99 100 1 0 0 96 97 1 0 0
                                              32 101 1 0 13 0 98)))))
           '|lookupComplete|)) 
