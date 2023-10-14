
(SDEFUN |IDPO;=;2$B;1| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G151 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND ((OR (NULL |x|) (NULL |y|)) 'NIL) ('T 'T)))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((OR
                            (SPADCALL (QCAR (|SPADfirst| |x|))
                                      (QCAR (|SPADfirst| |y|)) (QREFELT $ 10))
                            (SPADCALL (QCDR (|SPADfirst| |x|))
                                      (QCDR (|SPADfirst| |y|)) (QREFELT $ 11)))
                           (PROGN
                            (LETT #1# 'NIL . #2=(|IDPO;=;2$B;1|))
                            (GO #3=#:G150)))
                          ('T
                           (SEQ (LETT |x| (CDR |x|) . #2#)
                                (EXIT (LETT |y| (CDR |y|) . #2#)))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT (COND ((NULL |x|) (NULL |y|)) ('T 'NIL)))))
                #3# (EXIT #1#)))) 

(SDEFUN |IDPO;coerce;$Of;2| ((|x| $) ($ |OutputForm|))
        (SPROG ((#1=#:G155 NIL) (|t| NIL) (#2=#:G154 NIL))
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
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 18))))) 

(SDEFUN |IDPO;monomial;AS$;3| ((|r| A) (|s| S) ($ $))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 21) (QREFELT $ 22))
          (|spadConstant| $ 20))
         ('T (LIST (CONS |s| |r|))))) 

(SDEFUN |IDPO;map;M2$;4| ((|f| |Mapping| A A) (|x| $) ($ $))
        (SPROG ((|a| (A)) (#1=#:G162 NIL) (|tm| NIL) (#2=#:G161 NIL))
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
                                 ((SPADCALL |a| (|spadConstant| $ 21)
                                            (QREFELT $ 22))
                                  'NIL)
                                 ('T 'T))))
                          (LETT #2# (CONS (CONS (QCAR |tm|) |a|) #2#)
                                . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |IDPO;reductum;2$;5| ((|x| $) ($ $))
        (COND ((NULL |x|) (|spadConstant| $ 20)) ('T (CDR |x|)))) 

(SDEFUN |IDPO;leadingCoefficient;$A;6| ((|x| $) ($ A))
        (COND ((NULL |x|) (|spadConstant| $ 21)) ('T (QCDR (|SPADfirst| |x|))))) 

(SDEFUN |IDPO;smaller?;2$B;7| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G171 NIL))
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
                             (GO #3=#:G170)))
                           ('T
                            (PROGN
                             (LETT #1#
                                   (SPADCALL (QCDR (|SPADfirst| |x|))
                                             (|spadConstant| $ 21)
                                             (QREFELT $ 28))
                                   . #2#)
                             (GO #3#)))))
                         ((NULL |x|)
                          (PROGN
                           (LETT #1#
                                 (SPADCALL (|spadConstant| $ 21)
                                           (QCDR (|SPADfirst| |y|))
                                           (QREFELT $ 28))
                                 . #2#)
                           (GO #3#)))
                         ('T
                          (COND
                           ((SPADCALL (QCAR (|SPADfirst| |x|))
                                      (QCAR (|SPADfirst| |y|)) (QREFELT $ 29))
                            (COND
                             ((SPADCALL (QCDR (|SPADfirst| |x|))
                                        (QCDR (|SPADfirst| |y|))
                                        (QREFELT $ 22))
                              (SEQ (LETT |x| (CDR |x|) . #2#)
                                   (EXIT (LETT |y| (CDR |y|) . #2#))))
                             ('T
                              (PROGN
                               (LETT #1#
                                     (SPADCALL (QCDR (|SPADfirst| |x|))
                                               (QCDR (|SPADfirst| |y|))
                                               (QREFELT $ 28))
                                     . #2#)
                               (GO #3#)))))
                           ((SPADCALL (QCAR (|SPADfirst| |x|))
                                      (QCAR (|SPADfirst| |y|)) (QREFELT $ 30))
                            (PROGN
                             (LETT #1#
                                   (SPADCALL (|spadConstant| $ 21)
                                             (QCDR (|SPADfirst| |y|))
                                             (QREFELT $ 28))
                                   . #2#)
                             (GO #3#)))
                           ('T
                            (PROGN
                             (LETT #1#
                                   (SPADCALL (QCDR (|SPADfirst| |x|))
                                             (|spadConstant| $ 21)
                                             (QREFELT $ 28))
                                   . #2#)
                             (GO #3#))))))))
                      NIL (GO G190) G191 (EXIT NIL)))
                #3# (EXIT #1#)))) 

(SDEFUN |IDPO;monomial;AS$;8| ((|r| A) (|s| S) ($ $)) (LIST (CONS |s| |r|))) 

(SDEFUN |IDPO;map;M2$;9| ((|f| |Mapping| A A) (|x| $) ($ $))
        (SPROG ((#1=#:G176 NIL) (|tm| NIL) (#2=#:G175 NIL))
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
                              (CONS
                               (CONS (QCAR |tm|) (SPADCALL (QCDR |tm|) |f|))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(PUT '|IDPO;reductum;2$;10| '|SPADreplace| 'CDR) 

(SDEFUN |IDPO;reductum;2$;10| ((|x| $) ($ $)) (CDR |x|)) 

(SDEFUN |IDPO;leadingCoefficient;$A;11| ((|x| $) ($ A))
        (COND
         ((NULL |x|)
          (|error| "Can't take leadingCoefficient of empty product element"))
         ('T (QCDR (|SPADfirst| |x|))))) 

(SDEFUN |IDPO;smaller?;2$B;12| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G185 NIL))
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
                             (GO #3=#:G184)))))
                         ((NULL |x|) (PROGN (LETT #1# 'T . #2#) (GO #3#)))
                         ('T
                          (COND
                           ((SPADCALL (QCAR (|SPADfirst| |x|))
                                      (QCAR (|SPADfirst| |y|)) (QREFELT $ 29))
                            (COND
                             ((SPADCALL (QCDR (|SPADfirst| |x|))
                                        (QCDR (|SPADfirst| |y|))
                                        (QREFELT $ 22))
                              (SEQ (LETT |x| (CDR |x|) . #2#)
                                   (EXIT (LETT |y| (CDR |y|) . #2#))))
                             ('T
                              (PROGN
                               (LETT #1#
                                     (SPADCALL (QCDR (|SPADfirst| |x|))
                                               (QCDR (|SPADfirst| |y|))
                                               (QREFELT $ 28))
                                     . #2#)
                               (GO #3#)))))
                           ((SPADCALL (QCAR (|SPADfirst| |x|))
                                      (QCAR (|SPADfirst| |y|)) (QREFELT $ 30))
                            (PROGN (LETT #1# 'T . #2#) (GO #3#)))
                           ('T (PROGN (LETT #1# 'NIL . #2#) (GO #3#))))))))
                      NIL (GO G190) G191 (EXIT NIL)))
                #3# (EXIT #1#)))) 

(SDEFUN |IDPO;leadingSupport;$S;13| ((|x| $) ($ S))
        (COND
         ((NULL |x|)
          (|error| "Can't take leadingCoefficient of empty product element"))
         ('T (QCAR (|SPADfirst| |x|))))) 

(SDEFUN |IDPO;compareterm|
        ((|a| |Record| (|:| |k| S) (|:| |c| A))
         (|b| |Record| (|:| |k| S) (|:| |c| A)) ($ |Boolean|))
        (SPADCALL (QCAR |b|) (QCAR |a|) (QREFELT $ 30))) 

(SDEFUN |IDPO;construct;L$;15|
        ((|lx| |List| (|Record| (|:| |k| S) (|:| |c| A))) ($ $))
        (SPADCALL (CONS (|function| |IDPO;compareterm|) $) |lx| (QREFELT $ 35))) 

(PUT '|IDPO;constructOrdered;L$;16| '|SPADreplace| '(XLAM (|lx|) |lx|)) 

(SDEFUN |IDPO;constructOrdered;L$;16|
        ((|lx| |List| (|Record| (|:| |k| S) (|:| |c| A))) ($ $)) |lx|) 

(SDEFUN |IDPO;leadingTerm;$R;17| ((|x| $) ($ |Record| (|:| |k| S) (|:| |c| A)))
        (COND
         ((NULL |x|)
          (|error| "Can't take leadingCoefficient of empty product element"))
         ('T (|SPADfirst| |x|)))) 

(PUT '|IDPO;listOfTerms;$L;18| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |IDPO;listOfTerms;$L;18|
        ((|x| $) ($ |List| (|Record| (|:| |k| S) (|:| |c| A)))) |x|) 

(SDEFUN |IDPO;hashUpdate!;Hs$Hs;19| ((|s| |HashState|) (|x| $) ($ |HashState|))
        (SPROG ((#1=#:G199 NIL) (|t| NIL) (|xl| (|Rep|)))
               (SEQ (LETT |xl| |x| . #2=(|IDPO;hashUpdate!;Hs$Hs;19|))
                    (SEQ (LETT |t| NIL . #2#) (LETT #1# |xl| . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |t| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |s| (SPADCALL |s| (QCAR |t|) (QREFELT $ 42))
                                . #2#)
                          (EXIT
                           (LETT |s| (SPADCALL |s| (QCDR |t|) (QREFELT $ 43))
                                 . #2#)))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT |s|)))) 

(PUT '|IDPO;Zero;$;20| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |IDPO;Zero;$;20| (($ $)) NIL) 

(PUT '|IDPO;zero?;$B;21| '|SPADreplace| 'NULL) 

(SDEFUN |IDPO;zero?;$B;21| ((|x| $) ($ |Boolean|)) (NULL |x|)) 

(SDEFUN |IDPO;add_gen| ((|x| |Rep|) (|y| |Rep|) ($ |Rep|))
        (SPROG
         ((|res| (|Rep|)) (|end| (|Rep|)) (|endcell| (|Rep|))
          (|newcell| (|Rep|)) (|r| (A)))
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
                                                   (QREFELT $ 46))
                                         . #2#)
                                   (COND
                                    ((NULL (SPADCALL |r| (QREFELT $ 47)))
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
                                           (LETT |endcell| |newcell|
                                                 . #2#)))))))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (COND ((NULL |x|) (LETT |end| |y| . #2#))
                            (#1# (LETT |end| |x| . #2#)))
                      (COND ((NULL |res|) (LETT |res| |end| . #2#))
                            (#1# (RPLACD |endcell| |end|)))
                      (EXIT |res|))))))) 

(SDEFUN |IDPO;add_si|
        ((|x| |List| (|Record| (|:| |k| (|SingleInteger|)) (|:| |c| A)))
         (|y| . #1=(|List| (|Record| (|:| |k| (|SingleInteger|)) (|:| |c| A))))
         ($ |List| (|Record| (|:| |k| (|SingleInteger|)) (|:| |c| A))))
        (SPROG
         ((|res|
           #2=(|List| (|Record| (|:| |k| (|SingleInteger|)) (|:| |c| A))))
          (|end| #1#) (|endcell| #2#) (|newcell| #2#) (|r| (A)))
         (SEQ (LETT |endcell| NIL . #3=(|IDPO;add_si|)) (LETT |res| NIL . #3#)
              (SEQ G190
                   (COND
                    ((NULL (COND ((OR (NULL |x|) (NULL |y|)) 'NIL) ('T 'T)))
                     (GO G191)))
                   (SEQ (LETT |newcell| NIL . #3#)
                        (COND
                         ((|eql_SI| (QCAR (|SPADfirst| |x|))
                                    (QCAR (|SPADfirst| |y|)))
                          (SEQ
                           (LETT |r|
                                 (SPADCALL (QCDR (|SPADfirst| |x|))
                                           (QCDR (|SPADfirst| |y|))
                                           (QREFELT $ 46))
                                 . #3#)
                           (COND
                            ((NULL (SPADCALL |r| (QREFELT $ 47)))
                             (LETT |newcell|
                                   (CONS (CONS (QCAR (|SPADfirst| |x|)) |r|)
                                         NIL)
                                   . #3#)))
                           (LETT |x| (CDR |x|) . #3#)
                           (EXIT (LETT |y| (CDR |y|) . #3#))))
                         ((SPADCALL (QCAR (|SPADfirst| |y|))
                                    (QCAR (|SPADfirst| |x|)) (QREFELT $ 49))
                          (SEQ
                           (LETT |newcell| (CONS (|SPADfirst| |x|) NIL) . #3#)
                           (EXIT (LETT |x| (CDR |x|) . #3#))))
                         ('T
                          (SEQ
                           (LETT |newcell| (CONS (|SPADfirst| |y|) NIL) . #3#)
                           (EXIT (LETT |y| (CDR |y|) . #3#)))))
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
                                   (LETT |endcell| |newcell| . #3#)))))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (COND ((NULL |x|) (LETT |end| |y| . #3#))
                    (#4='T (LETT |end| |x| . #3#)))
              (COND ((NULL |res|) (LETT |res| |end| . #3#))
                    (#4# (RPLACD |endcell| |end|)))
              (EXIT |res|)))) 

(SDEFUN |IDPO;+;3$;24| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((#1=#:G241 NIL) (|msi| (|SingleInteger|)) (|degy| (|Integer|))
          (|degx| (|Integer|)))
         (SEQ
          (EXIT
           (COND ((NULL |x|) |y|) ((NULL |y|) |x|)
                 ('T
                  (SEQ
                   (LETT |degx| (QCAR (|SPADfirst| |x|)) . #2=(|IDPO;+;3$;24|))
                   (LETT |degy| (QCAR (|SPADfirst| |y|)) . #2#)
                   (LETT |msi| MOST-POSITIVE-FIXNUM . #2#)
                   (COND
                    ((< |degx| |msi|)
                     (COND
                      ((< |degy| |msi|)
                       (EXIT
                        (PROGN
                         (LETT #1# (|IDPO;add_si| |x| |y| $) . #2#)
                         (GO #3=#:G240)))))))
                   (EXIT (|IDPO;add_gen| |x| |y| $))))))
          #3# (EXIT #1#)))) 

(SDEFUN |IDPO;+;3$;25| ((|x| $) (|y| $) ($ $)) (|IDPO;add_gen| |x| |y| $)) 

(SDEFUN |IDPO;*;Pi2$;26| ((|n| |PositiveInteger|) (|x| $) ($ $))
        (SPROG ((|a| (A)) (#1=#:G246 NIL) (|u| NIL) (#2=#:G245 NIL))
               (SEQ
                (COND ((EQL |n| 0) (|spadConstant| $ 20)) ((EQL |n| 1) |x|)
                      ('T
                       (PROGN
                        (LETT #2# NIL . #3=(|IDPO;*;Pi2$;26|))
                        (SEQ (LETT |u| NIL . #3#) (LETT #1# |x| . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (LETT |a|
                                        (SPADCALL |n| (QCDR |u|)
                                                  (QREFELT $ 52))
                                        . #3#)
                                  (|spadConstant| $ 21) (QREFELT $ 11))
                                 (LETT #2# (CONS (CONS (QCAR |u|) |a|) #2#)
                                       . #3#)))))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |IDPO;-;2$;27| ((|x| $) ($ $))
        (SPROG ((#1=#:G250 NIL) (|u| NIL) (#2=#:G249 NIL))
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
                               (CONS (QCAR |u|)
                                     (SPADCALL (QCDR |u|) (QREFELT $ 54)))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |IDPO;*;I2$;28| ((|n| |Integer|) (|x| $) ($ $))
        (SPROG ((|a| (A)) (#1=#:G254 NIL) (|u| NIL) (#2=#:G253 NIL))
               (SEQ
                (COND ((EQL |n| 0) (|spadConstant| $ 20)) ((EQL |n| 1) |x|)
                      ('T
                       (PROGN
                        (LETT #2# NIL . #3=(|IDPO;*;I2$;28|))
                        (SEQ (LETT |u| NIL . #3#) (LETT #1# |x| . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (LETT |a|
                                        (SPADCALL |n| (QCDR |u|)
                                                  (QREFELT $ 57))
                                        . #3#)
                                  (|spadConstant| $ 21) (QREFELT $ 11))
                                 (LETT #2# (CONS (CONS (QCAR |u|) |a|) #2#)
                                       . #3#)))))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |IDPO;-;3$;29| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((|res| (|Rep|)) (|end| ($)) (|endcell| (|Rep|)) (|newcell| ($))
          (|r| (A)))
         (SEQ
          (COND ((NULL |x|) (SPADCALL |y| (QREFELT $ 55))) ((NULL |y|) |x|)
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
                                                   (QREFELT $ 59))
                                         . #2#)
                                   (COND
                                    ((NULL (SPADCALL |r| (QREFELT $ 47)))
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
                                                (SPADCALL
                                                 (QCDR (|SPADfirst| |y|))
                                                 (QREFELT $ 54)))
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
                                           (LETT |endcell| |newcell|
                                                 . #2#)))))))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (COND
                       ((NULL |x|)
                        (LETT |end| (SPADCALL |y| (QREFELT $ 55)) . #2#))
                       (#1# (LETT |end| |x| . #2#)))
                      (COND ((NULL |res|) (LETT |res| |end| . #2#))
                            (#1# (RPLACD |endcell| |end|)))
                      (EXIT |res|))))))) 

(SDEFUN |IDPO;subtractIfCan;2$U;30| ((|x| $) (|y| $) ($ |Union| $ #1="failed"))
        (SPROG
         ((|res| (|Rep|)) (|endcell| (|Rep|)) (|newcell| ($)) (|r| (A))
          (#2=#:G304 NIL) (|ru| (|Union| A #1#)))
         (SEQ
          (EXIT
           (COND ((NULL |y|) (CONS 0 |x|))
                 (#3='T
                  (SEQ (LETT |endcell| NIL . #4=(|IDPO;subtractIfCan;2$U;30|))
                       (LETT |res| NIL . #4#)
                       (SEQ G190
                            (COND
                             ((NULL
                               (COND ((OR (NULL |x|) (NULL |y|)) 'NIL)
                                     ('T 'T)))
                              (GO G191)))
                            (SEQ (LETT |newcell| NIL . #4#)
                                 (COND
                                  ((SPADCALL (QCAR (|SPADfirst| |x|))
                                             (QCAR (|SPADfirst| |y|))
                                             (QREFELT $ 29))
                                   (SEQ
                                    (LETT |ru|
                                          (SPADCALL (QCDR (|SPADfirst| |x|))
                                                    (QCDR (|SPADfirst| |y|))
                                                    (QREFELT $ 62))
                                          . #4#)
                                    (EXIT
                                     (COND
                                      ((QEQCAR |ru| 1)
                                       (PROGN
                                        (LETT #2# (CONS 1 "failed") . #4#)
                                        (GO #5=#:G303)))
                                      ('T
                                       (SEQ (LETT |r| (QCDR |ru|) . #4#)
                                            (COND
                                             ((NULL
                                               (SPADCALL |r| (QREFELT $ 47)))
                                              (LETT |newcell|
                                                    (CONS
                                                     (CONS
                                                      (QCAR (|SPADfirst| |x|))
                                                      |r|)
                                                     NIL)
                                                    . #4#)))
                                            (LETT |x| (CDR |x|) . #4#)
                                            (EXIT
                                             (LETT |y| (CDR |y|) . #4#))))))))
                                  ((SPADCALL (QCAR (|SPADfirst| |y|))
                                             (QCAR (|SPADfirst| |x|))
                                             (QREFELT $ 30))
                                   (SEQ
                                    (LETT |newcell|
                                          (CONS (|SPADfirst| |x|) NIL) . #4#)
                                    (EXIT (LETT |x| (CDR |x|) . #4#))))
                                  ('T
                                   (SEQ
                                    (LETT |ru|
                                          (SPADCALL (|spadConstant| $ 21)
                                                    (QCDR (|SPADfirst| |y|))
                                                    (QREFELT $ 62))
                                          . #4#)
                                    (EXIT
                                     (COND
                                      ((QEQCAR |ru| 1)
                                       (PROGN
                                        (LETT #2# (CONS 1 "failed") . #4#)
                                        (GO #5#)))
                                      ('T
                                       (SEQ (LETT |r| (QCDR |ru|) . #4#)
                                            (LETT |newcell|
                                                  (CONS
                                                   (CONS
                                                    (QCAR (|SPADfirst| |y|))
                                                    |r|)
                                                   NIL)
                                                  . #4#)
                                            (EXIT
                                             (LETT |y| (CDR |y|) . #4#)))))))))
                                 (EXIT
                                  (COND
                                   ((NULL (NULL |newcell|))
                                    (COND
                                     ((NULL |endcell|)
                                      (SEQ (LETT |res| |newcell| . #4#)
                                           (EXIT
                                            (LETT |endcell| |res| . #4#))))
                                     ('T
                                      (SEQ (RPLACD |endcell| |newcell|)
                                           (EXIT
                                            (LETT |endcell| |newcell|
                                                  . #4#)))))))))
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
                                                 (QREFELT $ 62))
                                       . #4#)
                                 (EXIT
                                  (COND
                                   ((QEQCAR |ru| 1)
                                    (PROGN
                                     (LETT #2# (CONS 1 "failed") . #4#)
                                     (GO #5#)))
                                   ('T
                                    (SEQ (LETT |r| (QCDR |ru|) . #4#)
                                         (LETT |newcell|
                                               (CONS
                                                (CONS (QCAR (|SPADfirst| |y|))
                                                      |r|)
                                                NIL)
                                               . #4#)
                                         (LETT |y| (CDR |y|) . #4#)
                                         (EXIT
                                          (COND
                                           ((NULL |endcell|)
                                            (SEQ (LETT |res| |newcell| . #4#)
                                                 (EXIT
                                                  (LETT |endcell| |res|
                                                        . #4#))))
                                           ('T
                                            (SEQ (RPLACD |endcell| |newcell|)
                                                 (EXIT
                                                  (LETT |endcell| |newcell|
                                                        . #4#)))))))))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT (CONS 0 |res|))))
                         (#3#
                          (SEQ
                           (COND ((NULL |res|) (LETT |res| |x| . #4#))
                                 (#3# (RPLACD |endcell| |x|)))
                           (EXIT (CONS 0 |res|))))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |IDPO;<;2$B;31| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 31))) 

(SDEFUN |IDPO;sup;3$;32| ((|x| $) (|y| $) ($ $))
        (SPROG ((|u| (A)))
               (SEQ
                (COND ((NULL |y|) |x|) ((NULL |x|) |y|)
                      ((SPADCALL (QCAR (|SPADfirst| |x|))
                                 (QCAR (|SPADfirst| |y|)) (QREFELT $ 65))
                       (CONS (|SPADfirst| |y|)
                             (SPADCALL |x| (CDR |y|) (QREFELT $ 66))))
                      ((SPADCALL (QCAR (|SPADfirst| |x|))
                                 (QCAR (|SPADfirst| |y|)) (QREFELT $ 67))
                       (CONS (|SPADfirst| |x|)
                             (SPADCALL (CDR |x|) |y| (QREFELT $ 66))))
                      ('T
                       (SEQ
                        (LETT |u|
                              (SPADCALL (QCDR (|SPADfirst| |x|))
                                        (QCDR (|SPADfirst| |y|))
                                        (QREFELT $ 68))
                              |IDPO;sup;3$;32|)
                        (EXIT
                         (CONS (CONS (QCAR (|SPADfirst| |x|)) |u|)
                               (SPADCALL (CDR |x|) (CDR |y|)
                                         (QREFELT $ 66)))))))))) 

(DECLAIM (NOTINLINE |IndexedDirectProductObject;|)) 

(DEFUN |IndexedDirectProductObject| (&REST #1=#:G312)
  (SPROG NIL
         (PROG (#2=#:G313)
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
                  (HREM |$ConstructorCache|
                        '|IndexedDirectProductObject|)))))))))) 

(DEFUN |IndexedDirectProductObject;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|IndexedDirectProductObject|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|IndexedDirectProductObject| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 71) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|OrderedAbelianMonoidSup|))
                                               (|HasCategory| |#2|
                                                              '(|OrderedSet|)))
                                              (OR
                                               (|HasCategory| |#1|
                                                              '(|Comparable|))
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|OrderedAbelianMonoid|))
                                                (|HasCategory| |#2|
                                                               '(|OrderedSet|)))
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|OrderedAbelianMonoidSup|))
                                                (|HasCategory| |#2|
                                                               '(|OrderedSet|))))
                                              (OR
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|OrderedAbelianMonoid|))
                                                (|HasCategory| |#2|
                                                               '(|OrderedSet|)))
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|OrderedAbelianMonoidSup|))
                                                (|HasCategory| |#2|
                                                               '(|OrderedSet|))))
                                              (OR
                                               (|HasCategory| |#1|
                                                              '(|AbelianMonoid|))
                                               (|HasCategory| |#1|
                                                              '(|Comparable|)))
                                              (OR
                                               (|HasCategory| |#1|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#1|
                                                              '(|CancellationAbelianMonoid|)))
                                              (OR
                                               (|HasCategory| |#1|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#1|
                                                              '(|AbelianMonoid|))
                                               (|HasCategory| |#1|
                                                              '(|CancellationAbelianMonoid|))
                                               (|HasCategory| |#1|
                                                              '(|Comparable|))
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|OrderedAbelianMonoid|))
                                                (|HasCategory| |#2|
                                                               '(|OrderedSet|)))
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|OrderedAbelianMonoidSup|))
                                                (|HasCategory| |#2|
                                                               '(|OrderedSet|))))
                                              (OR
                                               (|HasCategory| |#1|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#1|
                                                              '(|AbelianMonoid|))
                                               (|HasCategory| |#1|
                                                              '(|CancellationAbelianMonoid|)))
                                              (OR
                                               (|HasCategory| |#1|
                                                              '(|CancellationAbelianMonoid|))
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|OrderedAbelianMonoidSup|))
                                                (|HasCategory| |#2|
                                                               '(|OrderedSet|))))
                                              (OR
                                               (|HasCategory| |#1|
                                                              '(|AbelianMonoid|))
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|OrderedAbelianMonoid|))
                                                (|HasCategory| |#2|
                                                               '(|OrderedSet|)))
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|OrderedAbelianMonoidSup|))
                                                (|HasCategory| |#2|
                                                               '(|OrderedSet|))))
                                              (OR
                                               (|HasCategory| |#1|
                                                              '(|AbelianMonoid|))
                                               (|HasCategory| |#1|
                                                              '(|Comparable|))
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|OrderedAbelianMonoid|))
                                                (|HasCategory| |#2|
                                                               '(|OrderedSet|)))
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|OrderedAbelianMonoidSup|))
                                                (|HasCategory| |#2|
                                                               '(|OrderedSet|))))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|IndexedDirectProductObject|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 (|List| (|Record| (|:| |k| |#2|) (|:| |c| |#1|))))
          (COND
           ((|HasCategory| |#1| '(|AbelianMonoid|))
            (PROGN
             (QSETREFV $ 23
                       (CONS (|dispatchFunction| |IDPO;monomial;AS$;3|) $))
             (QSETREFV $ 25 (CONS (|dispatchFunction| |IDPO;map;M2$;4|) $))
             (QSETREFV $ 26 (CONS (|dispatchFunction| |IDPO;reductum;2$;5|) $))
             (QSETREFV $ 27
                       (CONS
                        (|dispatchFunction| |IDPO;leadingCoefficient;$A;6|) $))
             (COND
              ((|HasCategory| |#1| '(|Comparable|))
               (PROGN
                (QSETREFV $ 31
                          (CONS (|dispatchFunction| |IDPO;smaller?;2$B;7|)
                                $)))))))
           ('T
            (PROGN
             (QSETREFV $ 23
                       (CONS (|dispatchFunction| |IDPO;monomial;AS$;8|) $))
             (QSETREFV $ 25 (CONS (|dispatchFunction| |IDPO;map;M2$;9|) $))
             (QSETREFV $ 26
                       (CONS (|dispatchFunction| |IDPO;reductum;2$;10|) $))
             (QSETREFV $ 27
                       (CONS
                        (|dispatchFunction| |IDPO;leadingCoefficient;$A;11|)
                        $))
             (COND
              ((|HasCategory| |#1| '(|Comparable|))
               (PROGN
                (QSETREFV $ 31
                          (CONS (|dispatchFunction| |IDPO;smaller?;2$B;12|)
                                $))))))))
          (COND
           ((|HasCategory| |#1| '(|AbelianMonoid|))
            (PROGN
             (QSETREFV $ 20
                       (CONS #'|makeSpadConstant|
                             (LIST (|dispatchFunction| |IDPO;Zero;$;20|) $
                                   20)))
             (QSETREFV $ 45 (CONS (|dispatchFunction| |IDPO;zero?;$B;21|) $))
             (COND
              ((|domainEqual| |#2| (|NonNegativeInteger|))
               (PROGN
                (QSETREFV $ 50 (CONS (|dispatchFunction| |IDPO;+;3$;24|) $))))
              ('T
               (QSETREFV $ 50 (CONS (|dispatchFunction| |IDPO;+;3$;25|) $))))
             (QSETREFV $ 53 (CONS (|dispatchFunction| |IDPO;*;Pi2$;26|) $)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 55 (CONS (|dispatchFunction| |IDPO;-;2$;27|) $))
             (QSETREFV $ 58 (CONS (|dispatchFunction| |IDPO;*;I2$;28|) $))
             (QSETREFV $ 60 (CONS (|dispatchFunction| |IDPO;-;3$;29|) $)))))
          (COND
           ((|HasCategory| |#1| '(|CancellationAbelianMonoid|))
            (QSETREFV $ 63
                      (CONS (|dispatchFunction| |IDPO;subtractIfCan;2$U;30|)
                            $))))
          (COND
           ((|HasCategory| |#1| '(|OrderedAbelianMonoid|))
            (QSETREFV $ 64 (CONS (|dispatchFunction| |IDPO;<;2$B;31|) $))))
          (COND
           ((|HasCategory| |#2| '(|OrderedSet|))
            (COND
             ((|HasCategory| |#1| '(|OrderedAbelianMonoidSup|))
              (QSETREFV $ 66
                        (CONS (|dispatchFunction| |IDPO;sup;3$;32|) $))))))
          $))) 

(MAKEPROP '|IndexedDirectProductObject| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|Boolean|) (0 . ~=) (6 . ~=) |IDPO;=;2$B;1| (|OutputForm|)
              (12 . |coerce|) (17 . |coerce|) (22 . |rarrow|) (|List| $)
              (28 . |bracket|) |IDPO;coerce;$Of;2| (33 . |Zero|) (37 . |Zero|)
              (41 . =) (47 . |monomial|) (|Mapping| 6 6) (53 . |map|)
              (59 . |reductum|) (64 . |leadingCoefficient|) (69 . |smaller?|)
              (75 . =) (81 . |smaller?|) (87 . |smaller?|)
              |IDPO;leadingSupport;$S;13| (|Record| (|:| |k| 7) (|:| |c| 6))
              (|Mapping| 9 33 33) (93 . |sort|) (|List| 33)
              |IDPO;construct;L$;15| |IDPO;constructOrdered;L$;16|
              |IDPO;leadingTerm;$R;17| |IDPO;listOfTerms;$L;18| (|HashState|)
              (99 . |hashUpdate!|) (105 . |hashUpdate!|)
              |IDPO;hashUpdate!;Hs$Hs;19| (111 . |zero?|) (116 . +)
              (122 . |zero?|) (|SingleInteger|) (127 . |smaller?|) (133 . +)
              (|PositiveInteger|) (139 . *) (145 . *) (151 . -) (156 . -)
              (|Integer|) (161 . *) (167 . *) (173 . -) (179 . -)
              (|Union| $ '"failed") (185 . |subtractIfCan|)
              (191 . |subtractIfCan|) (197 . <) (203 . <) (209 . |sup|)
              (215 . >) (221 . |sup|) (|NonNegativeInteger|) (|String|))
           '#(~= 227 |zero?| 233 |sup| 238 |subtractIfCan| 244 |smaller?| 250
              |sample| 256 |reductum| 260 |opposite?| 265 |monomial| 271 |min|
              277 |max| 283 |map| 289 |listOfTerms| 295 |leadingTerm| 300
              |leadingSupport| 305 |leadingCoefficient| 310 |latex| 315
              |hashUpdate!| 320 |hash| 326 |constructOrdered| 331 |construct|
              336 |coerce| 341 |Zero| 346 >= 350 > 356 = 362 <= 368 < 374 - 380
              + 391 * 397)
           'NIL
           (CONS (|makeByteWordVec2| 8 '(0 2 0 2 1 4 4 6 4 8 3 8 7 5 4 7))
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
                   (|makeByteWordVec2| 70
                                       '(2 7 9 0 0 10 2 6 9 0 0 11 1 7 13 0 14
                                         1 6 13 0 15 2 13 0 0 0 16 1 13 0 17 18
                                         0 0 0 20 0 6 0 21 2 6 9 0 0 22 2 0 0 6
                                         7 23 2 0 0 24 0 25 1 0 0 0 26 1 0 6 0
                                         27 2 6 9 0 0 28 2 7 9 0 0 29 2 7 9 0 0
                                         30 2 0 9 0 0 31 2 8 0 34 0 35 2 7 41
                                         41 0 42 2 6 41 41 0 43 1 0 9 0 45 2 6
                                         0 0 0 46 1 6 9 0 47 2 48 9 0 0 49 2 0
                                         0 0 0 50 2 6 0 51 0 52 2 0 0 51 0 53 1
                                         6 0 0 54 1 0 0 0 55 2 6 0 56 0 57 2 0
                                         0 56 0 58 2 6 0 0 0 59 2 0 0 0 0 60 2
                                         6 61 0 0 62 2 0 61 0 0 63 2 0 9 0 0 64
                                         2 7 9 0 0 65 2 0 0 0 0 66 2 7 9 0 0 67
                                         2 6 0 0 0 68 2 11 9 0 0 1 1 10 9 0 45
                                         2 2 0 0 0 66 2 9 61 0 0 63 2 3 9 0 0
                                         31 0 10 0 1 1 0 0 0 26 2 10 9 0 0 1 2
                                         0 0 6 7 23 2 4 0 0 0 1 2 4 0 0 0 1 2 0
                                         0 24 0 25 1 0 36 0 40 1 0 33 0 39 1 0
                                         7 0 32 1 0 6 0 27 1 11 70 0 1 2 11 41
                                         41 0 44 1 11 48 0 1 1 0 0 36 38 1 0 0
                                         36 37 1 11 13 0 19 0 10 0 20 2 4 9 0 0
                                         1 2 4 9 0 0 1 2 11 9 0 0 12 2 4 9 0 0
                                         1 2 4 9 0 0 64 1 1 0 0 55 2 1 0 0 0 60
                                         2 10 0 0 0 50 2 10 0 51 0 53 2 10 0 69
                                         0 1 2 1 0 56 0 58)))))
           '|lookupComplete|)) 
