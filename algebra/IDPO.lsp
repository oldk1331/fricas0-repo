
(/VERSIONCHECK 2) 

(DEFUN |IDPO;=;2$B;1| (|x| |y| $)
  (PROG (#1=#:G172)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ G190
             (COND
              ((NULL (COND ((OR (NULL |x|) (NULL |y|)) 'NIL) ('T 'T)))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((OR
                  (SPADCALL (QCAR (|SPADfirst| |x|)) (QCAR (|SPADfirst| |y|))
                            (QREFELT $ 10))
                  (SPADCALL (QCDR (|SPADfirst| |x|)) (QCDR (|SPADfirst| |y|))
                            (QREFELT $ 11)))
                 (PROGN (LETT #1# 'NIL . #2=(|IDPO;=;2$B;1|)) (GO #1#)))
                ('T
                 (SEQ (LETT |x| (CDR |x|) . #2#)
                      (EXIT (LETT |y| (CDR |y|) . #2#)))))))
             NIL (GO G190) G191 (EXIT NIL))
        (EXIT (COND ((NULL |x|) (NULL |y|)) ('T 'NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |IDPO;coerce;$Of;2| (|x| $)
  (PROG (#1=#:G176 |t| #2=#:G175)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|IDPO;coerce;$Of;2|))
        (SEQ (LETT |t| NIL . #3#) (LETT #1# |x| . #3#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT #2#
                     (CONS
                      (SPADCALL (SPADCALL (QCAR |t|) (QREFELT $ 14))
                                (SPADCALL (QCDR |t|) (QREFELT $ 15))
                                (QREFELT $ 16))
                      #2#)
                     . #3#)))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       (QREFELT $ 18)))))) 

(DEFUN |IDPO;monomial;AS$;3| (|r| |s| $)
  (COND
   ((SPADCALL |r| (|spadConstant| $ 21) (QREFELT $ 22)) (|spadConstant| $ 20))
   ('T (LIST (CONS |s| |r|))))) 

(DEFUN |IDPO;map;M2$;4| (|f| |x| $)
  (PROG (|a| #1=#:G183 |tm| #2=#:G182)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|IDPO;map;M2$;4|))
       (SEQ (LETT |tm| NIL . #3#) (LETT #1# |x| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |tm| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (COND
               ((SEQ (LETT |a| (SPADCALL (QCDR |tm|) |f|) . #3#)
                     (EXIT
                      (COND
                       ((SPADCALL |a| (|spadConstant| $ 21) (QREFELT $ 22))
                        'NIL)
                       ('T 'T))))
                (LETT #2# (CONS (CONS (QCAR |tm|) |a|) #2#) . #3#)))))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |IDPO;reductum;2$;5| (|x| $)
  (COND ((NULL |x|) (|spadConstant| $ 20)) ('T (CDR |x|)))) 

(DEFUN |IDPO;leadingCoefficient;$A;6| (|x| $)
  (COND ((NULL |x|) (|spadConstant| $ 21)) ('T (QCDR (|SPADfirst| |x|))))) 

(DEFUN |IDPO;smaller?;2$B;7| (|x| |y| $)
  (PROG (#1=#:G191)
    (RETURN
     (SEQ
      (EXIT
       (SEQ G190 NIL
            (SEQ
             (EXIT
              (COND
               ((NULL |y|)
                (COND
                 ((NULL |x|)
                  (PROGN
                   (LETT #1# 'NIL . #2=(|IDPO;smaller?;2$B;7|))
                   (GO #1#)))
                 ('T
                  (PROGN
                   (LETT #1#
                         (SPADCALL (QCDR (|SPADfirst| |x|))
                                   (|spadConstant| $ 21) (QREFELT $ 28))
                         . #2#)
                   (GO #1#)))))
               ((NULL |x|)
                (PROGN
                 (LETT #1#
                       (SPADCALL (|spadConstant| $ 21) (QCDR (|SPADfirst| |y|))
                                 (QREFELT $ 28))
                       . #2#)
                 (GO #1#)))
               ('T
                (COND
                 ((SPADCALL (QCAR (|SPADfirst| |x|)) (QCAR (|SPADfirst| |y|))
                            (QREFELT $ 29))
                  (COND
                   ((SPADCALL (QCDR (|SPADfirst| |x|)) (QCDR (|SPADfirst| |y|))
                              (QREFELT $ 22))
                    (SEQ (LETT |x| (CDR |x|) . #2#)
                         (EXIT (LETT |y| (CDR |y|) . #2#))))
                   ('T
                    (PROGN
                     (LETT #1#
                           (SPADCALL (QCDR (|SPADfirst| |x|))
                                     (QCDR (|SPADfirst| |y|)) (QREFELT $ 28))
                           . #2#)
                     (GO #1#)))))
                 ((SPADCALL (QCAR (|SPADfirst| |x|)) (QCAR (|SPADfirst| |y|))
                            (QREFELT $ 30))
                  (PROGN
                   (LETT #1#
                         (SPADCALL (|spadConstant| $ 21)
                                   (QCDR (|SPADfirst| |y|)) (QREFELT $ 28))
                         . #2#)
                   (GO #1#)))
                 ('T
                  (PROGN
                   (LETT #1#
                         (SPADCALL (QCDR (|SPADfirst| |x|))
                                   (|spadConstant| $ 21) (QREFELT $ 28))
                         . #2#)
                   (GO #1#))))))))
            NIL (GO G190) G191 (EXIT NIL)))
      #1# (EXIT #1#))))) 

(DEFUN |IDPO;monomial;AS$;8| (|r| |s| $) (LIST (CONS |s| |r|))) 

(DEFUN |IDPO;map;M2$;9| (|f| |x| $)
  (PROG (#1=#:G196 |tm| #2=#:G195)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|IDPO;map;M2$;9|))
       (SEQ (LETT |tm| NIL . #3#) (LETT #1# |x| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |tm| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2#
                    (CONS (CONS (QCAR |tm|) (SPADCALL (QCDR |tm|) |f|)) #2#)
                    . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(PUT '|IDPO;reductum;2$;10| '|SPADreplace| 'CDR) 

(DEFUN |IDPO;reductum;2$;10| (|x| $) (CDR |x|)) 

(DEFUN |IDPO;leadingCoefficient;$A;11| (|x| $)
  (COND
   ((NULL |x|)
    (|error| "Can't take leadingCoefficient of empty product element"))
   ('T (QCDR (|SPADfirst| |x|))))) 

(DEFUN |IDPO;smaller?;2$B;12| (|x| |y| $)
  (PROG (#1=#:G204)
    (RETURN
     (SEQ
      (EXIT
       (SEQ G190 NIL
            (SEQ
             (EXIT
              (COND
               ((NULL |y|)
                (COND
                 ((OR (NULL |x|) 'T)
                  (PROGN
                   (LETT #1# 'NIL . #2=(|IDPO;smaller?;2$B;12|))
                   (GO #1#)))))
               ((NULL |x|) (PROGN (LETT #1# 'T . #2#) (GO #1#)))
               ('T
                (COND
                 ((SPADCALL (QCAR (|SPADfirst| |x|)) (QCAR (|SPADfirst| |y|))
                            (QREFELT $ 29))
                  (COND
                   ((SPADCALL (QCDR (|SPADfirst| |x|)) (QCDR (|SPADfirst| |y|))
                              (QREFELT $ 22))
                    (SEQ (LETT |x| (CDR |x|) . #2#)
                         (EXIT (LETT |y| (CDR |y|) . #2#))))
                   ('T
                    (PROGN
                     (LETT #1#
                           (SPADCALL (QCDR (|SPADfirst| |x|))
                                     (QCDR (|SPADfirst| |y|)) (QREFELT $ 28))
                           . #2#)
                     (GO #1#)))))
                 ((SPADCALL (QCAR (|SPADfirst| |x|)) (QCAR (|SPADfirst| |y|))
                            (QREFELT $ 30))
                  (PROGN (LETT #1# 'T . #2#) (GO #1#)))
                 ('T (PROGN (LETT #1# 'NIL . #2#) (GO #1#))))))))
            NIL (GO G190) G191 (EXIT NIL)))
      #1# (EXIT #1#))))) 

(DEFUN |IDPO;leadingSupport;$S;13| (|x| $)
  (COND
   ((NULL |x|)
    (|error| "Can't take leadingCoefficient of empty product element"))
   ('T (QCAR (|SPADfirst| |x|))))) 

(DEFUN |IDPO;compareterm| (|a| |b| $)
  (SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 33))) 

(DEFUN |IDPO;construct;L$;15| (|lx| $)
  (SPADCALL (CONS (|function| |IDPO;compareterm|) $) |lx| (QREFELT $ 36))) 

(PUT '|IDPO;constructOrdered;L$;16| '|SPADreplace| '(XLAM (|lx|) |lx|)) 

(DEFUN |IDPO;constructOrdered;L$;16| (|lx| $) |lx|) 

(DEFUN |IDPO;leadingTerm;$R;17| (|x| $)
  (COND
   ((NULL |x|)
    (|error| "Can't take leadingCoefficient of empty product element"))
   ('T (|SPADfirst| |x|)))) 

(PUT '|IDPO;listOfTerms;$L;18| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |IDPO;listOfTerms;$L;18| (|x| $) |x|) 

(DEFUN |IDPO;hashUpdate!;Hs$Hs;19| (|s| |x| $)
  (PROG (#1=#:G218 |t| |xl|)
    (RETURN
     (SEQ (LETT |xl| |x| . #2=(|IDPO;hashUpdate!;Hs$Hs;19|))
          (SEQ (LETT |t| NIL . #2#) (LETT #1# |xl| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |s| (SPADCALL |s| (QCAR |t|) (QREFELT $ 43)) . #2#)
                    (EXIT
                     (LETT |s| (SPADCALL |s| (QCDR |t|) (QREFELT $ 44))
                           . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |s|))))) 

(PUT '|IDPO;Zero;$;20| '|SPADreplace| '(XLAM NIL NIL)) 

(DEFUN |IDPO;Zero;$;20| ($) NIL) 

(PUT '|IDPO;zero?;$B;21| '|SPADreplace| 'NULL) 

(DEFUN |IDPO;zero?;$B;21| (|x| $) (NULL |x|)) 

(DEFUN |IDPO;add_gen| (|x| |y| $)
  (PROG (|res| |end| |endcell| |newcell| |r|)
    (RETURN
     (SEQ
      (COND ((NULL |x|) |y|) ((NULL |y|) |x|)
            (#1='T
             (SEQ (LETT |endcell| NIL . #2=(|IDPO;add_gen|))
                  (LETT |res| NIL . #2#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND ((OR (NULL |x|) (NULL |y|)) 'NIL) ('T 'T)))
                         (GO G191)))
                       (SEQ (LETT |newcell| NIL . #2#)
                            (COND
                             ((SPADCALL (QCAR (|SPADfirst| |x|))
                                        (QCAR (|SPADfirst| |y|))
                                        (QREFELT $ 29))
                              (SEQ
                               (LETT |r|
                                     (SPADCALL (QCDR (|SPADfirst| |x|))
                                               (QCDR (|SPADfirst| |y|))
                                               (QREFELT $ 47))
                                     . #2#)
                               (COND
                                ((NULL (SPADCALL |r| (QREFELT $ 48)))
                                 (LETT |newcell|
                                       (CONS
                                        (CONS (QCAR (|SPADfirst| |x|)) |r|)
                                        NIL)
                                       . #2#)))
                               (LETT |x| (CDR |x|) . #2#)
                               (EXIT (LETT |y| (CDR |y|) . #2#))))
                             ((SPADCALL (QCAR (|SPADfirst| |y|))
                                        (QCAR (|SPADfirst| |x|))
                                        (QREFELT $ 30))
                              (SEQ
                               (LETT |newcell| (CONS (|SPADfirst| |x|) NIL)
                                     . #2#)
                               (EXIT (LETT |x| (CDR |x|) . #2#))))
                             ('T
                              (SEQ
                               (LETT |newcell| (CONS (|SPADfirst| |y|) NIL)
                                     . #2#)
                               (EXIT (LETT |y| (CDR |y|) . #2#)))))
                            (EXIT
                             (COND
                              ((NULL (NULL |newcell|))
                               (COND
                                ((NULL |endcell|)
                                 (SEQ (LETT |res| |newcell| . #2#)
                                      (EXIT (LETT |endcell| |res| . #2#))))
                                ('T
                                 (SEQ (RPLACD |endcell| |newcell|)
                                      (EXIT
                                       (LETT |endcell| |newcell| . #2#)))))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (COND ((NULL |x|) (LETT |end| |y| . #2#))
                        (#1# (LETT |end| |x| . #2#)))
                  (COND ((NULL |res|) (LETT |res| |end| . #2#))
                        (#1# (RPLACD |endcell| |end|)))
                  (EXIT |res|)))))))) 

(DEFUN |IDPO;add_si| (|x| |y| $)
  (PROG (|res| |end| |endcell| |newcell| |r|)
    (RETURN
     (SEQ (LETT |endcell| NIL . #1=(|IDPO;add_si|)) (LETT |res| NIL . #1#)
          (SEQ G190
               (COND
                ((NULL (COND ((OR (NULL |x|) (NULL |y|)) 'NIL) ('T 'T)))
                 (GO G191)))
               (SEQ (LETT |newcell| NIL . #1#)
                    (COND
                     ((|eql_SI| (QCAR (|SPADfirst| |x|))
                                (QCAR (|SPADfirst| |y|)))
                      (SEQ
                       (LETT |r|
                             (SPADCALL (QCDR (|SPADfirst| |x|))
                                       (QCDR (|SPADfirst| |y|)) (QREFELT $ 47))
                             . #1#)
                       (COND
                        ((NULL (SPADCALL |r| (QREFELT $ 48)))
                         (LETT |newcell|
                               (CONS (CONS (QCAR (|SPADfirst| |x|)) |r|) NIL)
                               . #1#)))
                       (LETT |x| (CDR |x|) . #1#)
                       (EXIT (LETT |y| (CDR |y|) . #1#))))
                     ((|less_SI| (QCAR (|SPADfirst| |y|))
                                 (QCAR (|SPADfirst| |x|)))
                      (SEQ (LETT |newcell| (CONS (|SPADfirst| |x|) NIL) . #1#)
                           (EXIT (LETT |x| (CDR |x|) . #1#))))
                     ('T
                      (SEQ (LETT |newcell| (CONS (|SPADfirst| |y|) NIL) . #1#)
                           (EXIT (LETT |y| (CDR |y|) . #1#)))))
                    (EXIT
                     (COND
                      ((NULL (NULL |newcell|))
                       (COND
                        ((NULL |endcell|)
                         (SEQ (LETT |res| |newcell| . #1#)
                              (EXIT (LETT |endcell| |res| . #1#))))
                        ('T
                         (SEQ (RPLACD |endcell| |newcell|)
                              (EXIT (LETT |endcell| |newcell| . #1#)))))))))
               NIL (GO G190) G191 (EXIT NIL))
          (COND ((NULL |x|) (LETT |end| |y| . #1#))
                (#2='T (LETT |end| |x| . #1#)))
          (COND ((NULL |res|) (LETT |res| |end| . #1#))
                (#2# (RPLACD |endcell| |end|)))
          (EXIT |res|))))) 

(DEFUN |IDPO;+;3$;24| (|x| |y| $)
  (PROG (#1=#:G259 |msi| |degy| |degx|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((NULL |x|) |y|) ((NULL |y|) |x|)
             ('T
              (SEQ (LETT |degx| (QCAR (|SPADfirst| |x|)) . #2=(|IDPO;+;3$;24|))
                   (LETT |degy| (QCAR (|SPADfirst| |y|)) . #2#)
                   (LETT |msi| MOST-POSITIVE-FIXNUM . #2#)
                   (COND
                    ((< |degx| |msi|)
                     (COND
                      ((< |degy| |msi|)
                       (EXIT
                        (PROGN
                         (LETT #1# (|IDPO;add_si| |x| |y| $) . #2#)
                         (GO #1#)))))))
                   (EXIT (|IDPO;add_gen| |x| |y| $))))))
      #1# (EXIT #1#))))) 

(DEFUN |IDPO;+;3$;25| (|x| |y| $) (|IDPO;add_gen| |x| |y| $)) 

(DEFUN |IDPO;*;Pi2$;26| (|n| |x| $)
  (PROG (|a| #1=#:G264 |u| #2=#:G263)
    (RETURN
     (SEQ
      (COND ((EQL |n| 0) (|spadConstant| $ 20)) ((EQL |n| 1) |x|)
            ('T
             (PROGN
              (LETT #2# NIL . #3=(|IDPO;*;Pi2$;26|))
              (SEQ (LETT |u| NIL . #3#) (LETT #1# |x| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL
                        (LETT |a| (SPADCALL |n| (QCDR |u|) (QREFELT $ 51))
                              . #3#)
                        (|spadConstant| $ 21) (QREFELT $ 11))
                       (LETT #2# (CONS (CONS (QCAR |u|) |a|) #2#) . #3#)))))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                   (EXIT (NREVERSE #2#)))))))))) 

(DEFUN |IDPO;-;2$;27| (|x| $)
  (PROG (#1=#:G268 |u| #2=#:G267)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|IDPO;-;2$;27|))
       (SEQ (LETT |u| NIL . #3#) (LETT #1# |x| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2#
                    (CONS
                     (CONS (QCAR |u|) (SPADCALL (QCDR |u|) (QREFELT $ 53)))
                     #2#)
                    . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |IDPO;*;I2$;28| (|n| |x| $)
  (PROG (|a| #1=#:G272 |u| #2=#:G271)
    (RETURN
     (SEQ
      (COND ((EQL |n| 0) (|spadConstant| $ 20)) ((EQL |n| 1) |x|)
            ('T
             (PROGN
              (LETT #2# NIL . #3=(|IDPO;*;I2$;28|))
              (SEQ (LETT |u| NIL . #3#) (LETT #1# |x| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL
                        (LETT |a| (SPADCALL |n| (QCDR |u|) (QREFELT $ 56))
                              . #3#)
                        (|spadConstant| $ 21) (QREFELT $ 11))
                       (LETT #2# (CONS (CONS (QCAR |u|) |a|) #2#) . #3#)))))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                   (EXIT (NREVERSE #2#)))))))))) 

(DEFUN |IDPO;-;3$;29| (|x| |y| $)
  (PROG (|res| |end| |endcell| |newcell| |r|)
    (RETURN
     (SEQ
      (COND ((NULL |x|) (SPADCALL |y| (QREFELT $ 54))) ((NULL |y|) |x|)
            (#1='T
             (SEQ (LETT |endcell| NIL . #2=(|IDPO;-;3$;29|))
                  (LETT |res| NIL . #2#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND ((OR (NULL |x|) (NULL |y|)) 'NIL) ('T 'T)))
                         (GO G191)))
                       (SEQ (LETT |newcell| NIL . #2#)
                            (COND
                             ((SPADCALL (QCAR (|SPADfirst| |x|))
                                        (QCAR (|SPADfirst| |y|))
                                        (QREFELT $ 29))
                              (SEQ
                               (LETT |r|
                                     (SPADCALL (QCDR (|SPADfirst| |x|))
                                               (QCDR (|SPADfirst| |y|))
                                               (QREFELT $ 58))
                                     . #2#)
                               (COND
                                ((NULL (SPADCALL |r| (QREFELT $ 48)))
                                 (LETT |newcell|
                                       (CONS
                                        (CONS (QCAR (|SPADfirst| |x|)) |r|)
                                        NIL)
                                       . #2#)))
                               (LETT |x| (CDR |x|) . #2#)
                               (EXIT (LETT |y| (CDR |y|) . #2#))))
                             ((SPADCALL (QCAR (|SPADfirst| |y|))
                                        (QCAR (|SPADfirst| |x|))
                                        (QREFELT $ 30))
                              (SEQ
                               (LETT |newcell| (CONS (|SPADfirst| |x|) NIL)
                                     . #2#)
                               (EXIT (LETT |x| (CDR |x|) . #2#))))
                             ('T
                              (SEQ
                               (LETT |newcell|
                                     (CONS
                                      (CONS (QCAR (|SPADfirst| |y|))
                                            (SPADCALL (QCDR (|SPADfirst| |y|))
                                                      (QREFELT $ 53)))
                                      NIL)
                                     . #2#)
                               (EXIT (LETT |y| (CDR |y|) . #2#)))))
                            (EXIT
                             (COND
                              ((NULL (NULL |newcell|))
                               (COND
                                ((NULL |endcell|)
                                 (SEQ (LETT |res| |newcell| . #2#)
                                      (EXIT (LETT |endcell| |res| . #2#))))
                                ('T
                                 (SEQ (RPLACD |endcell| |newcell|)
                                      (EXIT
                                       (LETT |endcell| |newcell| . #2#)))))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (COND
                   ((NULL |x|)
                    (LETT |end| (SPADCALL |y| (QREFELT $ 54)) . #2#))
                   (#1# (LETT |end| |x| . #2#)))
                  (COND ((NULL |res|) (LETT |res| |end| . #2#))
                        (#1# (RPLACD |endcell| |end|)))
                  (EXIT |res|)))))))) 

(DEFUN |IDPO;subtractIfCan;2$U;30| (|x| |y| $)
  (PROG (|res| |endcell| |newcell| |r| #1=#:G321 |ru|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((NULL |y|) (CONS 0 |x|))
             (#2='T
              (SEQ (LETT |endcell| NIL . #3=(|IDPO;subtractIfCan;2$U;30|))
                   (LETT |res| NIL . #3#)
                   (SEQ G190
                        (COND
                         ((NULL
                           (COND ((OR (NULL |x|) (NULL |y|)) 'NIL) ('T 'T)))
                          (GO G191)))
                        (SEQ (LETT |newcell| NIL . #3#)
                             (COND
                              ((SPADCALL (QCAR (|SPADfirst| |x|))
                                         (QCAR (|SPADfirst| |y|))
                                         (QREFELT $ 29))
                               (SEQ
                                (LETT |ru|
                                      (SPADCALL (QCDR (|SPADfirst| |x|))
                                                (QCDR (|SPADfirst| |y|))
                                                (QREFELT $ 61))
                                      . #3#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |ru| 1)
                                   (PROGN
                                    (LETT #1# (CONS 1 "failed") . #3#)
                                    (GO #1#)))
                                  ('T
                                   (SEQ (LETT |r| (QCDR |ru|) . #3#)
                                        (COND
                                         ((NULL (SPADCALL |r| (QREFELT $ 48)))
                                          (LETT |newcell|
                                                (CONS
                                                 (CONS (QCAR (|SPADfirst| |x|))
                                                       |r|)
                                                 NIL)
                                                . #3#)))
                                        (LETT |x| (CDR |x|) . #3#)
                                        (EXIT (LETT |y| (CDR |y|) . #3#))))))))
                              ((SPADCALL (QCAR (|SPADfirst| |x|))
                                         (QCAR (|SPADfirst| |y|))
                                         (QREFELT $ 33))
                               (SEQ
                                (LETT |newcell| (CONS (|SPADfirst| |x|) NIL)
                                      . #3#)
                                (EXIT (LETT |x| (CDR |x|) . #3#))))
                              ('T
                               (SEQ
                                (LETT |ru|
                                      (SPADCALL (|spadConstant| $ 21)
                                                (QCDR (|SPADfirst| |y|))
                                                (QREFELT $ 61))
                                      . #3#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |ru| 1)
                                   (PROGN
                                    (LETT #1# (CONS 1 "failed") . #3#)
                                    (GO #1#)))
                                  ('T
                                   (SEQ (LETT |r| (QCDR |ru|) . #3#)
                                        (LETT |newcell|
                                              (CONS
                                               (CONS (QCAR (|SPADfirst| |y|))
                                                     |r|)
                                               NIL)
                                              . #3#)
                                        (EXIT
                                         (LETT |y| (CDR |y|) . #3#)))))))))
                             (EXIT
                              (COND
                               ((NULL (NULL |newcell|))
                                (COND
                                 ((NULL |endcell|)
                                  (SEQ (LETT |res| |newcell| . #3#)
                                       (EXIT (LETT |endcell| |res| . #3#))))
                                 ('T
                                  (SEQ (RPLACD |endcell| |newcell|)
                                       (EXIT
                                        (LETT |endcell| |newcell|
                                              . #3#)))))))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT
                    (COND
                     ((NULL |x|)
                      (SEQ
                       (SEQ G190
                            (COND
                             ((NULL (COND ((NULL |y|) 'NIL) ('T 'T)))
                              (GO G191)))
                            (SEQ
                             (LETT |ru|
                                   (SPADCALL (|spadConstant| $ 21)
                                             (QCDR (|SPADfirst| |y|))
                                             (QREFELT $ 61))
                                   . #3#)
                             (EXIT
                              (COND
                               ((QEQCAR |ru| 1)
                                (PROGN
                                 (LETT #1# (CONS 1 "failed") . #3#)
                                 (GO #1#)))
                               ('T
                                (SEQ (LETT |r| (QCDR |ru|) . #3#)
                                     (LETT |newcell|
                                           (CONS
                                            (CONS (QCAR (|SPADfirst| |y|)) |r|)
                                            NIL)
                                           . #3#)
                                     (LETT |y| (CDR |y|) . #3#)
                                     (EXIT
                                      (COND
                                       ((NULL |endcell|)
                                        (SEQ (LETT |res| |newcell| . #3#)
                                             (EXIT
                                              (LETT |endcell| |res| . #3#))))
                                       ('T
                                        (SEQ (RPLACD |endcell| |newcell|)
                                             (EXIT
                                              (LETT |endcell| |newcell|
                                                    . #3#)))))))))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT (CONS 0 |res|))))
                     (#2#
                      (SEQ
                       (COND ((NULL |res|) (LETT |res| |x| . #3#))
                             (#2# (RPLACD |endcell| |x|)))
                       (EXIT (CONS 0 |res|))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |IDPO;<;2$B;31| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 31))) 

(DEFUN |IDPO;sup;3$;32| (|x| |y| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (COND ((NULL |y|) |x|) ((NULL |x|) |y|)
            ((SPADCALL (QCAR (|SPADfirst| |x|)) (QCAR (|SPADfirst| |y|))
                       (QREFELT $ 30))
             (CONS (|SPADfirst| |y|) (SPADCALL |x| (CDR |y|) (QREFELT $ 64))))
            ((SPADCALL (QCAR (|SPADfirst| |x|)) (QCAR (|SPADfirst| |y|))
                       (QREFELT $ 33))
             (CONS (|SPADfirst| |x|) (SPADCALL (CDR |x|) |y| (QREFELT $ 64))))
            ('T
             (SEQ
              (LETT |u|
                    (SPADCALL (QCDR (|SPADfirst| |x|)) (QCDR (|SPADfirst| |y|))
                              (QREFELT $ 65))
                    |IDPO;sup;3$;32|)
              (EXIT
               (CONS (CONS (QCAR (|SPADfirst| |x|)) |u|)
                     (SPADCALL (CDR |x|) (CDR |y|) (QREFELT $ 64))))))))))) 

(DEFUN |IndexedDirectProductObject| (&REST #1=#:G333)
  (PROG ()
    (RETURN
     (PROG (#2=#:G334)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|IndexedDirectProductObject|)
                                           '|domainEqualList|)
                . #3=(|IndexedDirectProductObject|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |IndexedDirectProductObject;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|IndexedDirectProductObject|))))))))))) 

(DEFUN |IndexedDirectProductObject;| (|#1| |#2|)
  (PROG (|pv$| #1=#:G329 #2=#:G330 #3=#:G331 #4=#:G332 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #5=(|IndexedDirectProductObject|))
      (LETT DV$2 (|devaluate| |#2|) . #5#)
      (LETT |dv$| (LIST '|IndexedDirectProductObject| DV$1 DV$2) . #5#)
      (LETT $ (GETREFV 69) . #5#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#1|
                                                         '(|OrderedAbelianMonoidSup|))
                                          (LETT #4#
                                                (|HasCategory| |#1|
                                                               '(|OrderedAbelianMonoid|))
                                                . #5#)
                                          (OR #4#
                                              (|HasCategory| |#1|
                                                             '(|OrderedAbelianMonoidSup|)))
                                          (LETT #3#
                                                (|HasCategory| |#1|
                                                               '(|CancellationAbelianMonoid|))
                                                . #5#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|AbelianGroup|))
                                           #3#)
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|AbelianMonoid|))
                                                . #5#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|AbelianGroup|))
                                           #2# #3#)
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|Comparable|))
                                                . #5#)
                                          (OR #1# #4#
                                              (|HasCategory| |#1|
                                                             '(|OrderedAbelianMonoidSup|)))
                                          (OR #2# #1#)
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|AbelianGroup|))
                                           #2# #3# #1# #4#
                                           (|HasCategory| |#1|
                                                          '(|OrderedAbelianMonoidSup|)))))
                      . #5#))
      (|haddProp| |$ConstructorCache| '|IndexedDirectProductObject|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 (|List| (|Record| (|:| |k| |#2|) (|:| |c| |#1|))))
      (COND
       ((|testBitVector| |pv$| 7)
        (PROGN
         (QSETREFV $ 23 (CONS (|dispatchFunction| |IDPO;monomial;AS$;3|) $))
         (QSETREFV $ 25 (CONS (|dispatchFunction| |IDPO;map;M2$;4|) $))
         (QSETREFV $ 26 (CONS (|dispatchFunction| |IDPO;reductum;2$;5|) $))
         (QSETREFV $ 27
                   (CONS (|dispatchFunction| |IDPO;leadingCoefficient;$A;6|)
                         $))
         (COND
          ((|testBitVector| |pv$| 9)
           (PROGN
            (QSETREFV $ 31
                      (CONS (|dispatchFunction| |IDPO;smaller?;2$B;7|) $)))))))
       ('T
        (PROGN
         (QSETREFV $ 23 (CONS (|dispatchFunction| |IDPO;monomial;AS$;8|) $))
         (QSETREFV $ 25 (CONS (|dispatchFunction| |IDPO;map;M2$;9|) $))
         (QSETREFV $ 26 (CONS (|dispatchFunction| |IDPO;reductum;2$;10|) $))
         (QSETREFV $ 27
                   (CONS (|dispatchFunction| |IDPO;leadingCoefficient;$A;11|)
                         $))
         (COND
          ((|testBitVector| |pv$| 9)
           (PROGN
            (QSETREFV $ 31
                      (CONS (|dispatchFunction| |IDPO;smaller?;2$B;12|)
                            $))))))))
      (COND
       ((|testBitVector| |pv$| 7)
        (PROGN
         (QSETREFV $ 20
                   (CONS #'|makeSpadConstant|
                         (LIST (|dispatchFunction| |IDPO;Zero;$;20|) $ 20)))
         (QSETREFV $ 46 (CONS (|dispatchFunction| |IDPO;zero?;$B;21|) $))
         (COND
          ((|domainEqual| |#2| (|NonNegativeInteger|))
           (PROGN
            (QSETREFV $ 49 (CONS (|dispatchFunction| |IDPO;+;3$;24|) $))))
          ('T (QSETREFV $ 49 (CONS (|dispatchFunction| |IDPO;+;3$;25|) $))))
         (QSETREFV $ 52 (CONS (|dispatchFunction| |IDPO;*;Pi2$;26|) $)))))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 54 (CONS (|dispatchFunction| |IDPO;-;2$;27|) $))
         (QSETREFV $ 57 (CONS (|dispatchFunction| |IDPO;*;I2$;28|) $))
         (QSETREFV $ 59 (CONS (|dispatchFunction| |IDPO;-;3$;29|) $)))))
      (COND
       ((|testBitVector| |pv$| 5)
        (QSETREFV $ 62
                  (CONS (|dispatchFunction| |IDPO;subtractIfCan;2$U;30|) $))))
      (COND
       ((|testBitVector| |pv$| 3)
        (QSETREFV $ 63 (CONS (|dispatchFunction| |IDPO;<;2$B;31|) $))))
      (COND
       ((|testBitVector| |pv$| 2)
        (QSETREFV $ 64 (CONS (|dispatchFunction| |IDPO;sup;3$;32|) $))))
      $)))) 

(MAKEPROP '|IndexedDirectProductObject| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|Boolean|) (0 . ~=) (6 . ~=) |IDPO;=;2$B;1| (|OutputForm|)
              (12 . |coerce|) (17 . |coerce|) (22 . |rarrow|) (|List| $)
              (28 . |bracket|) |IDPO;coerce;$Of;2| (33 . |Zero|) (37 . |Zero|)
              (41 . =) (47 . |monomial|) (|Mapping| 6 6) (53 . |map|)
              (59 . |reductum|) (64 . |leadingCoefficient|) (69 . |smaller?|)
              (75 . =) (81 . <) (87 . |smaller?|) |IDPO;leadingSupport;$S;13|
              (93 . >) (|Record| (|:| |k| 7) (|:| |c| 6)) (|Mapping| 9 34 34)
              (99 . |sort|) (|List| 34) |IDPO;construct;L$;15|
              |IDPO;constructOrdered;L$;16| |IDPO;leadingTerm;$R;17|
              |IDPO;listOfTerms;$L;18| (|HashState|) (105 . |hashUpdate!|)
              (111 . |hashUpdate!|) |IDPO;hashUpdate!;Hs$Hs;19| (117 . |zero?|)
              (122 . +) (128 . |zero?|) (133 . +) (|PositiveInteger|) (139 . *)
              (145 . *) (151 . -) (156 . -) (|Integer|) (161 . *) (167 . *)
              (173 . -) (179 . -) (|Union| $ '"failed") (185 . |subtractIfCan|)
              (191 . |subtractIfCan|) (197 . <) (203 . |sup|) (209 . |sup|)
              (|SingleInteger|) (|String|) (|NonNegativeInteger|))
           '#(~= 215 |zero?| 221 |sup| 226 |subtractIfCan| 232 |smaller?| 238
              |sample| 244 |reductum| 248 |monomial| 253 |min| 259 |max| 265
              |map| 271 |listOfTerms| 277 |leadingTerm| 282 |leadingSupport|
              287 |leadingCoefficient| 292 |latex| 297 |hashUpdate!| 302 |hash|
              308 |constructOrdered| 313 |construct| 318 |coerce| 323 |Zero|
              328 >= 332 > 338 = 344 <= 350 < 356 - 362 + 373 * 379)
           'NIL
           (CONS (|makeByteWordVec2| 12 '(0 2 0 2 1 4 4 6 4 8 10 8 12 11 3 12))
                 (CONS
                  '#(NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL |OrderedSet&|
                     |AbelianMonoid&| NIL |AbelianSemiGroup&| |SetCategory&|
                     NIL |PartialOrder&| |BasicType&|)
                  (CONS
                   '#((|IndexedDirectProductCategory| 6 7)
                      (|OrderedAbelianMonoidSup|) (|AbelianProductCategory| 6)
                      (|OrderedCancellationAbelianMonoid|) (|AbelianGroup|)
                      (|OrderedAbelianMonoid|) (|OrderedAbelianSemiGroup|)
                      (|CancellationAbelianMonoid|) (|OrderedSet|)
                      (|AbelianMonoid|) (|Comparable|) (|AbelianSemiGroup|)
                      (|SetCategory|) (|CoercibleTo| 13) (|PartialOrder|)
                      (|BasicType|))
                   (|makeByteWordVec2| 68
                                       '(2 7 9 0 0 10 2 6 9 0 0 11 1 7 13 0 14
                                         1 6 13 0 15 2 13 0 0 0 16 1 13 0 17 18
                                         0 0 0 20 0 6 0 21 2 6 9 0 0 22 2 0 0 6
                                         7 23 2 0 0 24 0 25 1 0 0 0 26 1 0 6 0
                                         27 2 6 9 0 0 28 2 7 9 0 0 29 2 7 9 0 0
                                         30 2 0 9 0 0 31 2 7 9 0 0 33 2 8 0 35
                                         0 36 2 7 42 42 0 43 2 6 42 42 0 44 1 0
                                         9 0 46 2 6 0 0 0 47 1 6 9 0 48 2 0 0 0
                                         0 49 2 6 0 50 0 51 2 0 0 50 0 52 1 6 0
                                         0 53 1 0 0 0 54 2 6 0 55 0 56 2 0 0 55
                                         0 57 2 6 0 0 0 58 2 0 0 0 0 59 2 6 60
                                         0 0 61 2 0 60 0 0 62 2 0 9 0 0 63 2 0
                                         0 0 0 64 2 6 0 0 0 65 2 11 9 0 0 1 1 7
                                         9 0 46 2 2 0 0 0 64 2 5 60 0 0 62 2 9
                                         9 0 0 31 0 7 0 1 1 0 0 0 26 2 0 0 6 7
                                         23 2 3 0 0 0 1 2 3 0 0 0 1 2 0 0 24 0
                                         25 1 0 37 0 41 1 0 34 0 40 1 0 7 0 32
                                         1 0 6 0 27 1 11 67 0 1 2 11 42 42 0 45
                                         1 11 66 0 1 1 0 0 37 39 1 0 0 37 38 1
                                         11 13 0 19 0 7 0 20 2 3 9 0 0 1 2 3 9
                                         0 0 1 2 11 9 0 0 12 2 3 9 0 0 1 2 3 9
                                         0 0 63 1 1 0 0 54 2 1 0 0 0 59 2 7 0 0
                                         0 49 2 1 0 55 0 57 2 7 0 50 0 52 2 7 0
                                         68 0 1)))))
           '|lookupComplete|)) 
