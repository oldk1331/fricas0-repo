
(/VERSIONCHECK 2) 

(DEFUN |FORTRAN;makeRep| (|b| $) (CONS (SPADCALL (QREFELT $ 12)) |b|)) 

(PUT '|FORTRAN;codeFrom| '|SPADreplace| 'QCDR) 

(DEFUN |FORTRAN;codeFrom| (|u| $) (QCDR |u|)) 

(DEFUN |FORTRAN;outputAsFortran;$V;3| (|p| $)
  (PROG (#1=#:G156 |expr| |intrinsics| |body| #2=#:G155 |l| #3=#:G154
         |tempName|)
    (RETURN
     (SEQ (SPADCALL (SPADCALL 25000 (QREFELT $ 15)) (QREFELT $ 17))
          (LETT |tempName| 'FPTEMP . #4=(|FORTRAN;outputAsFortran;$V;3|))
          (SPADCALL |tempName| (QREFELT $ 21)) (|initialiseIntrinsicList|)
          (LETT |body|
                (PROGN
                 (LETT #3# NIL . #4#)
                 (SEQ (LETT |l| NIL . #4#)
                      (LETT #2# (|FORTRAN;codeFrom| |p| $) . #4#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |l| (CAR #2#) . #4#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3# (CONS (SPADCALL |l| (QREFELT $ 23)) #3#)
                              . #4#)))
                      (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))
                . #4#)
          (LETT |intrinsics| (|getIntrinsicList|) . #4#)
          (SPADCALL (QREFELT $ 24))
          (|fortFormatHead| (SPADCALL (QREFELT $ 7) (QREFELT $ 27))
                            (SPADCALL (QREFELT $ 6) (QREFELT $ 28))
                            (SPADCALL (QREFELT $ 8) (QREFELT $ 30)))
          (SPADCALL (QREFELT $ 9) (QREFELT $ 31))
          (SPADCALL (QCAR |p|) (QREFELT $ 31))
          (SPADCALL |tempName| (QREFELT $ 32))
          (|fortFormatIntrinsics| |intrinsics|)
          (SPADCALL |tempName| (QREFELT $ 33))
          (SEQ (LETT |expr| NIL . #4#) (LETT #1# |body| . #4#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |expr| (CAR #1#) . #4#) NIL))
                 (GO G191)))
               (SEQ (EXIT (|displayLines1| |expr|))) (LETT #1# (CDR #1#) . #4#)
               (GO G190) G191 (EXIT NIL))
          (|dispStatement| (SPADCALL 'END (QREFELT $ 28)))
          (EXIT (SPADCALL (QREFELT $ 34))))))) 

(DEFUN |FORTRAN;mkString| (|l| $)
  (SPADCALL (SPADCALL (SPADCALL |l| (QREFELT $ 30)) (QREFELT $ 37))
            (QREFELT $ 39))) 

(DEFUN |FORTRAN;checkVariables| (|user| |target| $)
  (PROG (|s2| |s1|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (SPADCALL (SPADCALL (ELT $ 40) |user| (QREFELT $ 42)) |target|
                   (QREFELT $ 43))
         NIL (QREFELT $ 45))
        (SEQ
         (LETT |s1| (|FORTRAN;mkString| |user| $)
               . #1=(|FORTRAN;checkVariables|))
         (LETT |s2| (|FORTRAN;mkString| |target| $) . #1#)
         (EXIT
          (|error|
           (LIST "Incompatible variable lists:" (SPADCALL |s1| (QREFELT $ 46))
                 (SPADCALL |s2| (QREFELT $ 46)))))))
       ('T (SPADCALL (QREFELT $ 34)))))))) 

(DEFUN |FORTRAN;coerce;E$;6| (|u| $)
  (PROG (|l|)
    (RETURN
     (SEQ
      (|FORTRAN;checkVariables| (SPADCALL |u| (QREFELT $ 48)) (QREFELT $ 8) $)
      (LETT |l|
            (LIST (SPADCALL (QREFELT $ 6) |u| (QREFELT $ 49))
                  (SPADCALL (QREFELT $ 50)))
            |FORTRAN;coerce;E$;6|)
      (EXIT (|FORTRAN;makeRep| |l| $)))))) 

(DEFUN |FORTRAN;coerce;E$;7| (|u| $)
  (PROG (|eList| #1=#:G181 |w| #2=#:G182 |v| #3=#:G180 |aeList| #4=#:G179
         #5=#:G178 |veList| #6=#:G177 #7=#:G176 |vList|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR (SPADCALL (SPADCALL |u| (QREFELT $ 53)) (QREFELT $ 55)) 1)
        (|error| "left hand side is not a kernel"))
       (#8='T
        (SEQ
         (LETT |vList| (SPADCALL (SPADCALL |u| (QREFELT $ 53)) (QREFELT $ 48))
               . #9=(|FORTRAN;coerce;E$;7|))
         (EXIT
          (COND
           ((SPADCALL (LENGTH |vList|) (LENGTH (QREFELT $ 8)) (QREFELT $ 57))
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
                           (LETT #7# (CONS (SPADCALL |w| (QREFELT $ 58)) #7#)
                                 . #9#)))
                         (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                         (EXIT (NREVERSE #7#))))
                   . #9#)
             (LETT |aeList|
                   (PROGN
                    (LETT #5# NIL . #9#)
                    (SEQ (LETT |w| NIL . #9#) (LETT #4# (QREFELT $ 8) . #9#)
                         G190
                         (COND
                          ((OR (ATOM #4#)
                               (PROGN (LETT |w| (CAR #4#) . #9#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #5# (CONS (SPADCALL |w| (QREFELT $ 58)) #5#)
                                 . #9#)))
                         (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                         (EXIT (NREVERSE #5#))))
                   . #9#)
             (LETT |eList|
                   (PROGN
                    (LETT #3# NIL . #9#)
                    (SEQ (LETT |v| NIL . #9#) (LETT #2# |aeList| . #9#)
                         (LETT |w| NIL . #9#) (LETT #1# |veList| . #9#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |w| (CAR #1#) . #9#) NIL)
                               (ATOM #2#)
                               (PROGN (LETT |v| (CAR #2#) . #9#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #3#
                                 (CONS (SPADCALL |w| |v| (QREFELT $ 59)) #3#)
                                 . #9#)))
                         (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #9#))
                               . #9#)
                         (GO G190) G191 (EXIT (NREVERSE #3#))))
                   . #9#)
             (EXIT
              (SPADCALL
               (SPADCALL (SPADCALL |u| (QREFELT $ 60)) |eList| (QREFELT $ 62))
               (QREFELT $ 51)))))))))))))) 

(DEFUN |FORTRAN;coerce;E$;8| (|u| $)
  (PROG (|l|)
    (RETURN
     (SEQ
      (|FORTRAN;checkVariables| (SPADCALL |u| (QREFELT $ 65)) (QREFELT $ 8) $)
      (LETT |l|
            (LIST (SPADCALL (QREFELT $ 6) |u| (QREFELT $ 66))
                  (SPADCALL (QREFELT $ 50)))
            |FORTRAN;coerce;E$;8|)
      (EXIT (|FORTRAN;makeRep| |l| $)))))) 

(DEFUN |FORTRAN;coerce;E$;9| (|u| $)
  (PROG (|eList| #1=#:G201 |w| #2=#:G202 |v| #3=#:G200 |aeList| #4=#:G199
         #5=#:G198 |veList| #6=#:G197 #7=#:G196 |vList|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR (SPADCALL (SPADCALL |u| (QREFELT $ 69)) (QREFELT $ 70)) 1)
        (|error| "left hand side is not a kernel"))
       (#8='T
        (SEQ
         (LETT |vList| (SPADCALL (SPADCALL |u| (QREFELT $ 69)) (QREFELT $ 65))
               . #9=(|FORTRAN;coerce;E$;9|))
         (EXIT
          (COND
           ((SPADCALL (LENGTH |vList|) (LENGTH (QREFELT $ 8)) (QREFELT $ 57))
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
                           (LETT #7# (CONS (SPADCALL |w| (QREFELT $ 71)) #7#)
                                 . #9#)))
                         (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                         (EXIT (NREVERSE #7#))))
                   . #9#)
             (LETT |aeList|
                   (PROGN
                    (LETT #5# NIL . #9#)
                    (SEQ (LETT |w| NIL . #9#) (LETT #4# (QREFELT $ 8) . #9#)
                         G190
                         (COND
                          ((OR (ATOM #4#)
                               (PROGN (LETT |w| (CAR #4#) . #9#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #5# (CONS (SPADCALL |w| (QREFELT $ 71)) #5#)
                                 . #9#)))
                         (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                         (EXIT (NREVERSE #5#))))
                   . #9#)
             (LETT |eList|
                   (PROGN
                    (LETT #3# NIL . #9#)
                    (SEQ (LETT |v| NIL . #9#) (LETT #2# |aeList| . #9#)
                         (LETT |w| NIL . #9#) (LETT #1# |veList| . #9#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |w| (CAR #1#) . #9#) NIL)
                               (ATOM #2#)
                               (PROGN (LETT |v| (CAR #2#) . #9#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #3#
                                 (CONS (SPADCALL |w| |v| (QREFELT $ 72)) #3#)
                                 . #9#)))
                         (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #9#))
                               . #9#)
                         (GO G190) G191 (EXIT (NREVERSE #3#))))
                   . #9#)
             (EXIT
              (SPADCALL
               (SPADCALL (SPADCALL |u| (QREFELT $ 73)) |eList| (QREFELT $ 74))
               (QREFELT $ 67)))))))))))))) 

(DEFUN |FORTRAN;coerce;E$;10| (|u| $)
  (PROG (|l|)
    (RETURN
     (SEQ
      (|FORTRAN;checkVariables| (SPADCALL |u| (QREFELT $ 77)) (QREFELT $ 8) $)
      (LETT |l|
            (LIST (SPADCALL (QREFELT $ 6) |u| (QREFELT $ 78))
                  (SPADCALL (QREFELT $ 50)))
            |FORTRAN;coerce;E$;10|)
      (EXIT (|FORTRAN;makeRep| |l| $)))))) 

(DEFUN |FORTRAN;coerce;E$;11| (|u| $)
  (PROG (|eList| #1=#:G221 |w| #2=#:G222 |v| #3=#:G220 |aeList| #4=#:G219
         #5=#:G218 |veList| #6=#:G217 #7=#:G216 |vList|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR (SPADCALL (SPADCALL |u| (QREFELT $ 81)) (QREFELT $ 82)) 1)
        (|error| "left hand side is not a kernel"))
       (#8='T
        (SEQ
         (LETT |vList| (SPADCALL (SPADCALL |u| (QREFELT $ 81)) (QREFELT $ 77))
               . #9=(|FORTRAN;coerce;E$;11|))
         (EXIT
          (COND
           ((SPADCALL (LENGTH |vList|) (LENGTH (QREFELT $ 8)) (QREFELT $ 57))
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
                           (LETT #7# (CONS (SPADCALL |w| (QREFELT $ 83)) #7#)
                                 . #9#)))
                         (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                         (EXIT (NREVERSE #7#))))
                   . #9#)
             (LETT |aeList|
                   (PROGN
                    (LETT #5# NIL . #9#)
                    (SEQ (LETT |w| NIL . #9#) (LETT #4# (QREFELT $ 8) . #9#)
                         G190
                         (COND
                          ((OR (ATOM #4#)
                               (PROGN (LETT |w| (CAR #4#) . #9#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #5# (CONS (SPADCALL |w| (QREFELT $ 83)) #5#)
                                 . #9#)))
                         (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                         (EXIT (NREVERSE #5#))))
                   . #9#)
             (LETT |eList|
                   (PROGN
                    (LETT #3# NIL . #9#)
                    (SEQ (LETT |v| NIL . #9#) (LETT #2# |aeList| . #9#)
                         (LETT |w| NIL . #9#) (LETT #1# |veList| . #9#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |w| (CAR #1#) . #9#) NIL)
                               (ATOM #2#)
                               (PROGN (LETT |v| (CAR #2#) . #9#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #3#
                                 (CONS (SPADCALL |w| |v| (QREFELT $ 84)) #3#)
                                 . #9#)))
                         (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #9#))
                               . #9#)
                         (GO G190) G191 (EXIT (NREVERSE #3#))))
                   . #9#)
             (EXIT
              (SPADCALL
               (SPADCALL (SPADCALL |u| (QREFELT $ 85)) |eList| (QREFELT $ 86))
               (QREFELT $ 79)))))))))))))) 

(PUT '|FORTRAN;coerce;R$;12| '|SPADreplace| '(XLAM (|u|) |u|)) 

(DEFUN |FORTRAN;coerce;R$;12| (|u| $) |u|) 

(DEFUN |FORTRAN;coerce;$Of;13| (|u| $) (SPADCALL (QREFELT $ 6) (QREFELT $ 28))) 

(DEFUN |FORTRAN;coerce;L$;14| (|c| $) (|FORTRAN;makeRep| |c| $)) 

(DEFUN |FORTRAN;coerce;Fc$;15| (|c| $) (|FORTRAN;makeRep| (LIST |c|) $)) 

(DEFUN |FORTRAN;coerce;E$;16| (|u| $)
  (PROG (|l|)
    (RETURN
     (SEQ
      (|FORTRAN;checkVariables| (SPADCALL |u| (QREFELT $ 95)) (QREFELT $ 8) $)
      (LETT |l|
            (LIST (SPADCALL (QREFELT $ 6) |u| (QREFELT $ 96))
                  (SPADCALL (QREFELT $ 50)))
            |FORTRAN;coerce;E$;16|)
      (EXIT (|FORTRAN;makeRep| |l| $)))))) 

(DEFUN |FORTRAN;coerce;E$;17| (|u| $)
  (PROG (|eList| #1=#:G247 |w| #2=#:G248 |v| #3=#:G246 |aeList| #4=#:G245
         #5=#:G244 |veList| #6=#:G243 #7=#:G242 |vList|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR (SPADCALL (SPADCALL |u| (QREFELT $ 99)) (QREFELT $ 100)) 1)
        (|error| "left hand side is not a kernel"))
       (#8='T
        (SEQ
         (LETT |vList| (SPADCALL (SPADCALL |u| (QREFELT $ 99)) (QREFELT $ 95))
               . #9=(|FORTRAN;coerce;E$;17|))
         (EXIT
          (COND
           ((SPADCALL (LENGTH |vList|) (LENGTH (QREFELT $ 8)) (QREFELT $ 57))
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
                           (LETT #7# (CONS (SPADCALL |w| (QREFELT $ 101)) #7#)
                                 . #9#)))
                         (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                         (EXIT (NREVERSE #7#))))
                   . #9#)
             (LETT |aeList|
                   (PROGN
                    (LETT #5# NIL . #9#)
                    (SEQ (LETT |w| NIL . #9#) (LETT #4# (QREFELT $ 8) . #9#)
                         G190
                         (COND
                          ((OR (ATOM #4#)
                               (PROGN (LETT |w| (CAR #4#) . #9#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #5# (CONS (SPADCALL |w| (QREFELT $ 101)) #5#)
                                 . #9#)))
                         (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                         (EXIT (NREVERSE #5#))))
                   . #9#)
             (LETT |eList|
                   (PROGN
                    (LETT #3# NIL . #9#)
                    (SEQ (LETT |v| NIL . #9#) (LETT #2# |aeList| . #9#)
                         (LETT |w| NIL . #9#) (LETT #1# |veList| . #9#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |w| (CAR #1#) . #9#) NIL)
                               (ATOM #2#)
                               (PROGN (LETT |v| (CAR #2#) . #9#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #3#
                                 (CONS (SPADCALL |w| |v| (QREFELT $ 102)) #3#)
                                 . #9#)))
                         (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #9#))
                               . #9#)
                         (GO G190) G191 (EXIT (NREVERSE #3#))))
                   . #9#)
             (EXIT
              (SPADCALL
               (SPADCALL (SPADCALL |u| (QREFELT $ 103)) |eList|
                         (QREFELT $ 104))
               (QREFELT $ 97)))))))))))))) 

(DEFUN |FORTRAN;coerce;E$;18| (|u| $)
  (PROG (|l|)
    (RETURN
     (SEQ
      (|FORTRAN;checkVariables| (SPADCALL |u| (QREFELT $ 107)) (QREFELT $ 8) $)
      (LETT |l|
            (LIST (SPADCALL (QREFELT $ 6) |u| (QREFELT $ 108))
                  (SPADCALL (QREFELT $ 50)))
            |FORTRAN;coerce;E$;18|)
      (EXIT (|FORTRAN;makeRep| |l| $)))))) 

(DEFUN |FORTRAN;coerce;E$;19| (|u| $)
  (PROG (|eList| #1=#:G267 |w| #2=#:G268 |v| #3=#:G266 |aeList| #4=#:G265
         #5=#:G264 |veList| #6=#:G263 #7=#:G262 |vList|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR (SPADCALL (SPADCALL |u| (QREFELT $ 111)) (QREFELT $ 112)) 1)
        (|error| "left hand side is not a kernel"))
       (#8='T
        (SEQ
         (LETT |vList|
               (SPADCALL (SPADCALL |u| (QREFELT $ 111)) (QREFELT $ 107))
               . #9=(|FORTRAN;coerce;E$;19|))
         (EXIT
          (COND
           ((SPADCALL (LENGTH |vList|) (LENGTH (QREFELT $ 8)) (QREFELT $ 57))
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
                           (LETT #7# (CONS (SPADCALL |w| (QREFELT $ 113)) #7#)
                                 . #9#)))
                         (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                         (EXIT (NREVERSE #7#))))
                   . #9#)
             (LETT |aeList|
                   (PROGN
                    (LETT #5# NIL . #9#)
                    (SEQ (LETT |w| NIL . #9#) (LETT #4# (QREFELT $ 8) . #9#)
                         G190
                         (COND
                          ((OR (ATOM #4#)
                               (PROGN (LETT |w| (CAR #4#) . #9#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #5# (CONS (SPADCALL |w| (QREFELT $ 113)) #5#)
                                 . #9#)))
                         (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                         (EXIT (NREVERSE #5#))))
                   . #9#)
             (LETT |eList|
                   (PROGN
                    (LETT #3# NIL . #9#)
                    (SEQ (LETT |v| NIL . #9#) (LETT #2# |aeList| . #9#)
                         (LETT |w| NIL . #9#) (LETT #1# |veList| . #9#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |w| (CAR #1#) . #9#) NIL)
                               (ATOM #2#)
                               (PROGN (LETT |v| (CAR #2#) . #9#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #3#
                                 (CONS (SPADCALL |w| |v| (QREFELT $ 114)) #3#)
                                 . #9#)))
                         (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #9#))
                               . #9#)
                         (GO G190) G191 (EXIT (NREVERSE #3#))))
                   . #9#)
             (EXIT
              (SPADCALL
               (SPADCALL (SPADCALL |u| (QREFELT $ 115)) |eList|
                         (QREFELT $ 116))
               (QREFELT $ 109)))))))))))))) 

(DEFUN |FORTRAN;coerce;E$;20| (|u| $)
  (PROG (|l|)
    (RETURN
     (SEQ
      (|FORTRAN;checkVariables| (SPADCALL |u| (QREFELT $ 119)) (QREFELT $ 8) $)
      (LETT |l|
            (LIST (SPADCALL (QREFELT $ 6) |u| (QREFELT $ 120))
                  (SPADCALL (QREFELT $ 50)))
            |FORTRAN;coerce;E$;20|)
      (EXIT (|FORTRAN;makeRep| |l| $)))))) 

(DEFUN |FORTRAN;coerce;E$;21| (|u| $)
  (PROG (|eList| #1=#:G287 |w| #2=#:G288 |v| #3=#:G286 |aeList| #4=#:G285
         #5=#:G284 |veList| #6=#:G283 #7=#:G282 |vList|)
    (RETURN
     (SEQ
      (COND
       ((QEQCAR (SPADCALL (SPADCALL |u| (QREFELT $ 123)) (QREFELT $ 124)) 1)
        (|error| "left hand side is not a kernel"))
       (#8='T
        (SEQ
         (LETT |vList|
               (SPADCALL (SPADCALL |u| (QREFELT $ 123)) (QREFELT $ 119))
               . #9=(|FORTRAN;coerce;E$;21|))
         (EXIT
          (COND
           ((SPADCALL (LENGTH |vList|) (LENGTH (QREFELT $ 8)) (QREFELT $ 57))
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
                           (LETT #7# (CONS (SPADCALL |w| (QREFELT $ 125)) #7#)
                                 . #9#)))
                         (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                         (EXIT (NREVERSE #7#))))
                   . #9#)
             (LETT |aeList|
                   (PROGN
                    (LETT #5# NIL . #9#)
                    (SEQ (LETT |w| NIL . #9#) (LETT #4# (QREFELT $ 8) . #9#)
                         G190
                         (COND
                          ((OR (ATOM #4#)
                               (PROGN (LETT |w| (CAR #4#) . #9#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #5# (CONS (SPADCALL |w| (QREFELT $ 125)) #5#)
                                 . #9#)))
                         (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                         (EXIT (NREVERSE #5#))))
                   . #9#)
             (LETT |eList|
                   (PROGN
                    (LETT #3# NIL . #9#)
                    (SEQ (LETT |v| NIL . #9#) (LETT #2# |aeList| . #9#)
                         (LETT |w| NIL . #9#) (LETT #1# |veList| . #9#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |w| (CAR #1#) . #9#) NIL)
                               (ATOM #2#)
                               (PROGN (LETT |v| (CAR #2#) . #9#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #3#
                                 (CONS (SPADCALL |w| |v| (QREFELT $ 126)) #3#)
                                 . #9#)))
                         (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #9#))
                               . #9#)
                         (GO G190) G191 (EXIT (NREVERSE #3#))))
                   . #9#)
             (EXIT
              (SPADCALL
               (SPADCALL (SPADCALL |u| (QREFELT $ 127)) |eList|
                         (QREFELT $ 128))
               (QREFELT $ 121)))))))))))))) 

(DEFUN |FortranProgram| (&REST #1=#:G289)
  (PROG ()
    (RETURN
     (PROG (#2=#:G290)
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
             ((NOT #2#) (HREM |$ConstructorCache| '|FortranProgram|))))))))))) 

(DEFUN |FortranProgram;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FortranProgram|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|FortranProgram| DV$1 DV$2 DV$3 DV$4) . #1#)
      (LETT $ (GETREFV 130) . #1#)
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
      $)))) 

(MAKEPROP '|FortranProgram| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) '|Rep| (|SymbolTable|)
              (0 . |empty|) (|Integer|) (|SingleInteger|) (4 . |coerce|)
              (|FortranCode|) (9 . |setLabelValue|) (|Void|) (|Symbol|)
              (|TheSymbolTable|) (14 . |newSubProgram|) (|SExpression|)
              (19 . |getCode|) (24 . |endSubProgram|) (|OutputForm|)
              (|Union| (|:| |fst| (|FortranScalarType|)) (|:| |void| '"void"))
              (28 . |coerce|) (33 . |coerce|) (|List| 19) (38 . |coerce|)
              (43 . |printTypes|) (48 . |printTypes|)
              (53 . |clearTheSymbolTable|) (58 . |void|)
              |FORTRAN;outputAsFortran;$V;3| (|InputForm|) (62 . |convert|)
              (|String|) (67 . |unparse|) (72 . |name|) (|Mapping| 19 19)
              (77 . |map|) (83 . |setDifference|) (|Boolean|) (89 . ~=)
              (95 . |coerce|) (|Expression| (|MachineInteger|))
              (100 . |variables|) (105 . |assign|) (111 . |returns|)
              |FORTRAN;coerce;E$;6| (|Equation| 47) (115 . |lhs|)
              (|Union| (|Kernel| $) '"failed") (120 . |retractIfCan|)
              (|NonNegativeInteger|) (125 . ~=) (131 . |coerce|)
              (136 . |equation|) (142 . |rhs|) (|List| (|Equation| $))
              (147 . |subst|) |FORTRAN;coerce;E$;7|
              (|Expression| (|MachineFloat|)) (153 . |variables|)
              (158 . |assign|) |FORTRAN;coerce;E$;8| (|Equation| 64)
              (164 . |lhs|) (169 . |retractIfCan|) (174 . |coerce|)
              (179 . |equation|) (185 . |rhs|) (190 . |subst|)
              |FORTRAN;coerce;E$;9| (|Expression| (|MachineComplex|))
              (196 . |variables|) (201 . |assign|) |FORTRAN;coerce;E$;10|
              (|Equation| 76) (207 . |lhs|) (212 . |retractIfCan|)
              (217 . |coerce|) (222 . |equation|) (228 . |rhs|) (233 . |subst|)
              |FORTRAN;coerce;E$;11|
              (|Record| (|:| |localSymbols| 11) (|:| |code| 91))
              |FORTRAN;coerce;R$;12| |FORTRAN;coerce;$Of;13| (|List| 16)
              |FORTRAN;coerce;L$;14| |FORTRAN;coerce;Fc$;15| (|Expression| 13)
              (239 . |variables|) (244 . |assign|) |FORTRAN;coerce;E$;16|
              (|Equation| 94) (250 . |lhs|) (255 . |retractIfCan|)
              (260 . |coerce|) (265 . |equation|) (271 . |rhs|) (276 . |subst|)
              |FORTRAN;coerce;E$;17| (|Expression| (|Float|))
              (282 . |variables|) (287 . |assign|) |FORTRAN;coerce;E$;18|
              (|Equation| 106) (293 . |lhs|) (298 . |retractIfCan|)
              (303 . |coerce|) (308 . |equation|) (314 . |rhs|) (319 . |subst|)
              |FORTRAN;coerce;E$;19| (|Expression| (|Complex| (|Float|)))
              (325 . |variables|) (330 . |assign|) |FORTRAN;coerce;E$;20|
              (|Equation| 118) (336 . |lhs|) (341 . |retractIfCan|)
              (346 . |coerce|) (351 . |equation|) (357 . |rhs|) (362 . |subst|)
              |FORTRAN;coerce;E$;21|)
           '#(|outputAsFortran| 368 |coerce| 373) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(NIL NIL NIL)
                       (CONS
                        '#((|FortranProgramCategory|) (|Type|)
                           (|CoercibleTo| 25))
                        (|makeByteWordVec2| 129
                                            '(0 11 0 12 1 14 0 13 15 1 16 14 14
                                              17 1 20 18 19 21 1 16 22 0 23 0
                                              20 19 24 1 26 25 0 27 1 19 25 0
                                              28 1 29 25 0 30 1 11 18 0 31 1 20
                                              18 19 32 1 20 18 19 33 0 18 0 34
                                              1 36 0 25 37 1 36 38 0 39 1 19 0
                                              0 40 2 29 0 41 0 42 2 29 0 0 0 43
                                              2 29 44 0 0 45 1 38 25 0 46 1 47
                                              29 0 48 2 16 0 19 47 49 0 16 0 50
                                              1 52 47 0 53 1 47 54 0 55 2 56 44
                                              0 0 57 1 47 0 19 58 2 52 0 47 47
                                              59 1 52 47 0 60 2 47 0 0 61 62 1
                                              64 29 0 65 2 16 0 19 64 66 1 68
                                              64 0 69 1 64 54 0 70 1 64 0 19 71
                                              2 68 0 64 64 72 1 68 64 0 73 2 64
                                              0 0 61 74 1 76 29 0 77 2 16 0 19
                                              76 78 1 80 76 0 81 1 76 54 0 82 1
                                              76 0 19 83 2 80 0 76 76 84 1 80
                                              76 0 85 2 76 0 0 61 86 1 94 29 0
                                              95 2 16 0 19 94 96 1 98 94 0 99 1
                                              94 54 0 100 1 94 0 19 101 2 98 0
                                              94 94 102 1 98 94 0 103 2 94 0 0
                                              61 104 1 106 29 0 107 2 16 0 19
                                              106 108 1 110 106 0 111 1 106 54
                                              0 112 1 106 0 19 113 2 110 0 106
                                              106 114 1 110 106 0 115 2 106 0 0
                                              61 116 1 118 29 0 119 2 16 0 19
                                              118 120 1 122 118 0 123 1 118 54
                                              0 124 1 118 0 19 125 2 122 0 118
                                              118 126 1 122 118 0 127 2 118 0 0
                                              61 128 1 0 18 0 35 1 0 0 110 117
                                              1 0 0 122 129 1 0 0 118 121 1 0 0
                                              98 105 1 0 0 94 97 1 0 0 106 109
                                              1 0 0 68 75 1 0 0 80 87 1 0 0 76
                                              79 1 0 0 52 63 1 0 0 47 51 1 0 0
                                              64 67 1 0 0 91 92 1 0 0 88 89 1 0
                                              0 16 93 1 0 25 0 90)))))
           '|lookupComplete|)) 
