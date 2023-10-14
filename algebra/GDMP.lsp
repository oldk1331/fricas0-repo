
(/VERSIONCHECK 2) 

(PUT '|GDMP;zero?;$B;1| '|SPADreplace| 'NULL) 

(DEFUN |GDMP;zero?;$B;1| (|p| $) (NULL |p|)) 

(DEFUN |GDMP;totalDegree;$Nni;2| (|p| $)
  (PROG (#1=#:G150 #2=#:G149 #3=#:G151 #4=#:G156 |t|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p| (QREFELT $ 13)) 0)
            (#5='T
             (PROGN
              (LETT #1# NIL . #6=(|GDMP;totalDegree;$Nni;2|))
              (SEQ (LETT |t| NIL . #6#) (LETT #4# |p| . #6#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #3#
                            (SPADCALL (ELT $ 18)
                                      (SPADCALL (QCAR |t|) (QREFELT $ 15)) 0
                                      (QREFELT $ 20))
                            . #6#)
                      (COND (#1# (LETT #2# (MAX #2# #3#) . #6#))
                            ('T
                             (PROGN
                              (LETT #2# #3# . #6#)
                              (LETT #1# 'T . #6#)))))))
                   (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) (#5# (|IdentityError| '|max|)))))))))) 

(DEFUN |GDMP;monomial;$OvlNni$;3| (|p| |v| |e| $)
  (PROG (#1=#:G161 #2=#:G163 |z| #3=#:G162 |locv|)
    (RETURN
     (SEQ
      (LETT |locv| (SPADCALL |v| (QREFELT $ 24))
            . #4=(|GDMP;monomial;$OvlNni$;3|))
      (EXIT
       (SPADCALL |p|
                 (SPADCALL (|spadConstant| $ 26)
                           (SPADCALL
                            (PROGN
                             (LETT #3# (GETREFV #5=(QREFELT $ 11)) . #4#)
                             (SEQ (LETT |z| 1 . #4#) (LETT #2# #5# . #4#)
                                  (LETT #1# 0 . #4#) G190
                                  (COND ((|greater_SI| |z| #2#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SETELT #3# #1#
                                            (COND ((EQL |z| |locv|) |e|)
                                                  ('T 0)))))
                                  (LETT #1#
                                        (PROG1 (|inc_SI| #1#)
                                          (LETT |z| (|inc_SI| |z|) . #4#))
                                        . #4#)
                                  (GO G190) G191 (EXIT NIL))
                             #3#)
                            (QREFELT $ 27))
                           (QREFELT $ 28))
                 (QREFELT $ 29))))))) 

(DEFUN |GDMP;coerce;Ovl$;4| (|v| $)
  (SPADCALL (|spadConstant| $ 25) |v| 1 (QREFELT $ 30))) 

(DEFUN |GDMP;listCoef| (|p| $)
  (PROG (#1=#:G169 |rec| #2=#:G168)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|GDMP;listCoef|))
       (SEQ (LETT |rec| NIL . #3#) (LETT #1# |p| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ (EXIT (LETT #2# (CONS (QCDR |rec|) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |GDMP;mainVariable;$U;6| (|p| $)
  (PROG (#1=#:G180 |vv| #2=#:G171 #3=#:G181 |v|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((SPADCALL |p| (QREFELT $ 13)) (CONS 1 "failed"))
             ('T
              (SEQ
               (SEQ (LETT |v| NIL . #4=(|GDMP;mainVariable;$U;6|))
                    (LETT #3# (QREFELT $ 6) . #4#) G190
                    (COND
                     ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#) . #4#) NIL))
                      (GO G191)))
                    (SEQ
                     (LETT |vv|
                           (PROG2
                               (LETT #2# (SPADCALL |v| (QREFELT $ 34)) . #4#)
                               (QCDR #2#)
                             (|check_union| (QEQCAR #2# 0)
                                            (|OrderedVariableList|
                                             (QREFELT $ 6))
                                            #2#))
                           . #4#)
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |p| |vv| (QREFELT $ 35)) 0
                                  (QREFELT $ 36))
                        (PROGN (LETT #1# (CONS 0 |vv|) . #4#) (GO #1#))))))
                    (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
               (EXIT (CONS 1 "failed"))))))
      #1# (EXIT #1#))))) 

(DEFUN |GDMP;ground?;$B;7| (|p| $) (QEQCAR (SPADCALL |p| (QREFELT $ 38)) 1)) 

(DEFUN |GDMP;retract;$R;8| (|p| $)
  (COND ((NULL (SPADCALL |p| (QREFELT $ 39))) (|error| "not a constant"))
        ('T (SPADCALL |p| (QREFELT $ 40))))) 

(DEFUN |GDMP;retractIfCan;$U;9| (|p| $)
  (COND ((SPADCALL |p| (QREFELT $ 39)) (CONS 0 (SPADCALL |p| (QREFELT $ 40))))
        ('T (CONS 1 "failed")))) 

(DEFUN |GDMP;degree;$OvlNni;10| (|p| |v| $)
  (PROG (|res| |j| |t| |locv|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p| (QREFELT $ 13)) 0)
            ('T
             (SEQ (LETT |res| 0 . #1=(|GDMP;degree;$OvlNni;10|))
                  (LETT |locv| (SPADCALL |v| (QREFELT $ 24)) . #1#)
                  (SEQ G190
                       (COND
                        ((NULL (COND ((NULL |p|) 'NIL) ('T 'T))) (GO G191)))
                       (SEQ (LETT |t| (|SPADfirst| |p|) . #1#)
                            (LETT |j|
                                  (SPADCALL (QCAR |t|) |locv| (QREFELT $ 45))
                                  . #1#)
                            (COND
                             ((SPADCALL |j| |res| (QREFELT $ 36))
                              (LETT |res| |j| . #1#)))
                            (EXIT (LETT |p| (CDR |p|) . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |res|)))))))) 

(DEFUN |GDMP;minimumDegree;$OvlNni;11| (|p| |v| $)
  (SPADCALL (SPADCALL |p| |v| (QREFELT $ 47)) (QREFELT $ 49))) 

(DEFUN |GDMP;differentiate;$Ovl$;12| (|p| |v| $)
  (SPADCALL (SPADCALL (SPADCALL |p| |v| (QREFELT $ 47)) (QREFELT $ 51)) |v|
            (QREFELT $ 52))) 

(DEFUN |GDMP;degree;$LL;13| (|p| |lv| $)
  (PROG (#1=#:G208 |v| #2=#:G207)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|GDMP;degree;$LL;13|))
       (SEQ (LETT |v| NIL . #3#) (LETT #1# |lv| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (SPADCALL |p| |v| (QREFELT $ 35)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |GDMP;minimumDegree;$LL;14| (|p| |lv| $)
  (PROG (#1=#:G212 |v| #2=#:G211)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|GDMP;minimumDegree;$LL;14|))
       (SEQ (LETT |v| NIL . #3#) (LETT #1# |lv| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (SPADCALL |p| |v| (QREFELT $ 50)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |GDMP;numberOfMonomials;$Nni;15| (|p| $)
  (PROG (|l|)
    (RETURN
     (SEQ (LETT |l| |p| |GDMP;numberOfMonomials;$Nni;15|)
          (EXIT (COND ((NULL |l|) 1) ('T (LENGTH |l|)))))))) 

(DEFUN |GDMP;monomial?;$B;16| (|p| $)
  (PROG (|l|)
    (RETURN
     (SEQ (LETT |l| |p| |GDMP;monomial?;$B;16|)
          (EXIT (COND ((NULL |l|) 'T) ('T (NULL (CDR |l|))))))))) 

(DEFUN |GDMP;maxNorm| (|p| $)
  (PROG (|m| #1=#:G221 |r| |l|)
    (RETURN
     (SEQ (LETT |l| NIL . #2=(|GDMP;maxNorm|))
          (LETT |m| (|spadConstant| $ 60) . #2#)
          (SEQ (LETT |r| NIL . #2#) (LETT #1# (|GDMP;listCoef| |p| $) . #2#)
               G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND ((SPADCALL |r| |m| (QREFELT $ 61)) (LETT |m| |r| . #2#))
                       ((SPADCALL (SPADCALL |r| (QREFELT $ 62)) |m|
                                  (QREFELT $ 61))
                        (LETT |m| (SPADCALL |r| (QREFELT $ 62)) . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |m|))))) 

(DEFUN |GDMP;/;$R$;18| (|p| |r| $)
  (SPADCALL (SPADCALL |r| (QREFELT $ 63)) |p| (QREFELT $ 64))) 

(DEFUN |GDMP;variables;$L;19| (|p| $)
  (PROG (#1=#:G229 #2=#:G235 |i| #3=#:G234 #4=#:G233 |tdeg| |maxdeg|)
    (RETURN
     (SEQ
      (LETT |maxdeg| (SPADCALL (QREFELT $ 11) 0 (QREFELT $ 66))
            . #5=(|GDMP;variables;$L;19|))
      (SEQ G190
           (COND
            ((NULL (COND ((SPADCALL |p| (QREFELT $ 13)) 'NIL) ('T 'T)))
             (GO G191)))
           (SEQ (LETT |tdeg| (SPADCALL |p| (QREFELT $ 67)) . #5#)
                (LETT |p| (SPADCALL |p| (QREFELT $ 68)) . #5#)
                (EXIT
                 (SEQ (LETT |i| 1 . #5#) (LETT #4# (QREFELT $ 11) . #5#) G190
                      (COND ((|greater_SI| |i| #4#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |maxdeg| |i|
                                  (MAX (SPADCALL |maxdeg| |i| (QREFELT $ 69))
                                       (SPADCALL |tdeg| |i| (QREFELT $ 45)))
                                  (QREFELT $ 70))))
                      (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                      (EXIT NIL))))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT
       (PROGN
        (LETT #3# NIL . #5#)
        (SEQ (LETT |i| 1 . #5#) (LETT #2# (QREFELT $ 11) . #5#) G190
             (COND ((|greater_SI| |i| #2#) (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |maxdeg| |i| (QREFELT $ 69)) 0
                           (QREFELT $ 71))
                 (LETT #3#
                       (CONS
                        (SPADCALL
                         (PROG1 (LETT #1# |i| . #5#)
                           (|check_subtype| (> #1# 0) '(|PositiveInteger|)
                                            #1#))
                         (QREFELT $ 72))
                        #3#)
                       . #5#)))))
             (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
             (EXIT (NREVERSE #3#))))))))) 

(DEFUN |GDMP;reorder;$L$;20| (|p| |perm| $)
  (PROG (|q| #1=#:G245 #2=#:G247 |j| #3=#:G246 #4=#:G244 |term| #5=#:G243)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (LENGTH |perm|) (QREFELT $ 11) (QREFELT $ 71))
        (|error| "must be a complete permutation of all vars"))
       ('T
        (SEQ
         (LETT |q|
               (PROGN
                (LETT #5# NIL . #6=(|GDMP;reorder;$L$;20|))
                (SEQ (LETT |term| NIL . #6#) (LETT #4# |p| . #6#) G190
                     (COND
                      ((OR (ATOM #4#)
                           (PROGN (LETT |term| (CAR #4#) . #6#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #5#
                             (CONS
                              (CONS
                               (SPADCALL
                                (PROGN
                                 (LETT #3# (GETREFV (SIZE |perm|)) . #6#)
                                 (SEQ (LETT |j| NIL . #6#)
                                      (LETT #2# |perm| . #6#)
                                      (LETT #1# 0 . #6#) G190
                                      (COND
                                       ((OR (ATOM #2#)
                                            (PROGN
                                             (LETT |j| (CAR #2#) . #6#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SETELT #3# #1#
                                                (SPADCALL (QCAR |term|) |j|
                                                          (QREFELT $ 45)))))
                                      (LETT #1#
                                            (PROG1 (|inc_SI| #1#)
                                              (LETT #2# (CDR #2#) . #6#))
                                            . #6#)
                                      (GO G190) G191 (EXIT NIL))
                                 #3#)
                                (QREFELT $ 27))
                               (QCDR |term|))
                              #5#)
                             . #6#)))
                     (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                     (EXIT (NREVERSE #5#))))
               . #6#)
         (EXIT
          (SPADCALL (CONS #'|GDMP;reorder;$L$;20!0| $) |q|
                    (QREFELT $ 76)))))))))) 

(DEFUN |GDMP;reorder;$L$;20!0| (|z1| |z2| $)
  (SPADCALL (QCAR |z1|) (QCAR |z2|) (QREFELT $ 74))) 

(DEFUN |GDMP;univariate;$OvlSup;21| (|p| |v| $)
  (PROG (|nexp| |deg| #1=#:G254 #2=#:G256 |i| #3=#:G255 |locv| |exp|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p| (QREFELT $ 13)) (|spadConstant| $ 79))
            ('T
             (SEQ
              (LETT |exp| (SPADCALL |p| (QREFELT $ 67))
                    . #4=(|GDMP;univariate;$OvlSup;21|))
              (LETT |locv| (SPADCALL |v| (QREFELT $ 24)) . #4#)
              (LETT |deg| 0 . #4#)
              (LETT |nexp|
                    (SPADCALL
                     (PROGN
                      (LETT #3# (GETREFV #5=(QREFELT $ 11)) . #4#)
                      (SEQ (LETT |i| 1 . #4#) (LETT #2# #5# . #4#)
                           (LETT #1# 0 . #4#) G190
                           (COND ((|greater_SI| |i| #2#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SETELT #3# #1#
                                     (COND
                                      ((EQL |i| |locv|)
                                       (SEQ
                                        (LETT |deg|
                                              (SPADCALL |exp| |i|
                                                        (QREFELT $ 45))
                                              . #4#)
                                        (EXIT 0)))
                                      ('T
                                       (SPADCALL |exp| |i| (QREFELT $ 45)))))))
                           (LETT #1#
                                 (PROG1 (|inc_SI| #1#)
                                   (LETT |i| (|inc_SI| |i|) . #4#))
                                 . #4#)
                           (GO G190) G191 (EXIT NIL))
                      #3#)
                     (QREFELT $ 27))
                    . #4#)
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |p| (QREFELT $ 40)) |nexp| (QREFELT $ 28))
                 |deg| (QREFELT $ 80))
                (SPADCALL (SPADCALL |p| (QREFELT $ 68)) |v| (QREFELT $ 47))
                (QREFELT $ 81)))))))))) 

(DEFUN |GDMP;eval;$Ovl2$;22| (|p| |v| |val| $)
  (SPADCALL (SPADCALL |p| |v| (QREFELT $ 47)) |val| (QREFELT $ 82))) 

(DEFUN |GDMP;eval;$OvlR$;23| (|p| |v| |val| $)
  (SPADCALL |p| |v| (SPADCALL |val| (QREFELT $ 84)) (QREFELT $ 83))) 

(DEFUN |GDMP;eval;$LL$;24| (|p| |lv| |lval| $)
  (COND ((SPADCALL |lv| NIL (QREFELT $ 86)) |p|)
        ('T
         (SPADCALL
          (SPADCALL |p| (|SPADfirst| |lv|)
                    (SPADCALL (|SPADfirst| |lval|) (QREFELT $ 84))
                    (QREFELT $ 83))
          (CDR |lv|) (CDR |lval|) (QREFELT $ 88))))) 

(DEFUN |GDMP;evalSortedVarlist| (|p| |Lvar| |Lpval| $)
  (PROG (|pts| |pval| |mvar| |pv| |v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL |p| (QREFELT $ 38)) . #1=(|GDMP;evalSortedVarlist|))
      (EXIT
       (COND ((QEQCAR |v| 1) |p|)
             (#2='T
              (SEQ (LETT |pv| (QCDR |v|) . #1#)
                   (COND
                    ((OR (SPADCALL |Lvar| NIL (QREFELT $ 86))
                         (SPADCALL |Lpval| NIL (QREFELT $ 90)))
                     (EXIT |p|)))
                   (LETT |mvar| (|SPADfirst| |Lvar|) . #1#)
                   (EXIT
                    (COND
                     ((SPADCALL |mvar| |pv| (QREFELT $ 91))
                      (|GDMP;evalSortedVarlist| |p| (CDR |Lvar|)
                       (SPADCALL |Lpval| '|rest| (QREFELT $ 93)) $))
                     (#2#
                      (SEQ
                       (LETT |pval| (SPADCALL |Lpval| '|first| (QREFELT $ 95))
                             . #1#)
                       (LETT |pts|
                             (SPADCALL
                              (CONS #'|GDMP;evalSortedVarlist!0|
                                    (VECTOR $ |Lpval| |Lvar|))
                              (SPADCALL |p| |pv| (QREFELT $ 47))
                              (QREFELT $ 97))
                             . #1#)
                       (EXIT
                        (COND
                         ((SPADCALL |mvar| |pv| (QREFELT $ 98))
                          (SPADCALL |pts| |pval| (QREFELT $ 82)))
                         (#2#
                          (SPADCALL |pts| |pv| (QREFELT $ 52))))))))))))))))) 

(DEFUN |GDMP;evalSortedVarlist!0| (|x| $$)
  (PROG (|Lvar| |Lpval| $)
    (LETT |Lvar| (QREFELT $$ 2) . #1=(|GDMP;evalSortedVarlist|))
    (LETT |Lpval| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|GDMP;evalSortedVarlist| |x| |Lvar| |Lpval| $))))) 

(DEFUN |GDMP;eval;$LL$;26| (|p| |Lvar| |Lpval| $)
  (PROG (|nlpval| #1=#:G272 |mvar| #2=#:G271 |nlvar|)
    (RETURN
     (SEQ
      (LETT |nlvar| (SPADCALL (ELT $ 91) |Lvar| (QREFELT $ 100))
            . #3=(|GDMP;eval;$LL$;26|))
      (LETT |nlpval|
            (COND ((SPADCALL |Lvar| |nlvar| (QREFELT $ 86)) |Lpval|)
                  ('T
                   (LETT |nlpval|
                         (PROGN
                          (LETT #2# NIL . #3#)
                          (SEQ (LETT |mvar| NIL . #3#) (LETT #1# |nlvar| . #3#)
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |mvar| (CAR #1#) . #3#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS
                                        (SPADCALL |Lpval|
                                                  (SPADCALL |mvar| |Lvar|
                                                            (QREFELT $ 101))
                                                  (QREFELT $ 102))
                                        #2#)
                                       . #3#)))
                               (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         . #3#)))
            . #3#)
      (EXIT (|GDMP;evalSortedVarlist| |p| |nlvar| |nlpval| $)))))) 

(DEFUN |GDMP;multivariate;SupOvl$;27| (|p1| |v| $)
  (COND
   ((SPADCALL (|spadConstant| $ 79) |p1| (QREFELT $ 106))
    (|spadConstant| $ 16))
   ((EQL (SPADCALL |p1| (QREFELT $ 107)) 0) (SPADCALL |p1| (QREFELT $ 108)))
   ('T
    (SPADCALL
     (SPADCALL (SPADCALL |p1| (QREFELT $ 108))
               (SPADCALL (SPADCALL |v| (QREFELT $ 31))
                         (SPADCALL |p1| (QREFELT $ 107)) (QREFELT $ 109))
               (QREFELT $ 29))
     (SPADCALL (SPADCALL |p1| (QREFELT $ 110)) |v| (QREFELT $ 52))
     (QREFELT $ 111))))) 

(DEFUN |GDMP;univariate;$Sup;28| (|p| $)
  (PROG (|q| |ans| |v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL |p| (QREFELT $ 38)) . #1=(|GDMP;univariate;$Sup;28|))
      (EXIT
       (COND
        ((QEQCAR |v| 1)
         (SPADCALL (SPADCALL |p| (QREFELT $ 40)) 0 (QREFELT $ 113)))
        ('T
         (SEQ (LETT |q| (SPADCALL |p| (QCDR |v|) (QREFELT $ 47)) . #1#)
              (LETT |ans| (|spadConstant| $ 114) . #1#)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |q| (|spadConstant| $ 79) (QREFELT $ 115)))
                     (GO G191)))
                   (SEQ
                    (LETT |ans|
                          (SPADCALL |ans|
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |q| (QREFELT $ 108))
                                               (QREFELT $ 116))
                                     (SPADCALL |q| (QREFELT $ 107))
                                     (QREFELT $ 113))
                                    (QREFELT $ 117))
                          . #1#)
                    (EXIT (LETT |q| (SPADCALL |q| (QREFELT $ 110)) . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |ans|))))))))) 

(DEFUN |GDMP;multivariate;SupOvl$;29| (|p| |v| $)
  (COND
   ((SPADCALL (|spadConstant| $ 114) |p| (QREFELT $ 119))
    (|spadConstant| $ 16))
   ('T
    (SPADCALL
     (SPADCALL (SPADCALL |p| (QREFELT $ 120))
               (SPADCALL (|spadConstant| $ 25) |v|
                         (SPADCALL |p| (QREFELT $ 121)) (QREFELT $ 30))
               (QREFELT $ 64))
     (SPADCALL (SPADCALL |p| (QREFELT $ 122)) |v| (QREFELT $ 123))
     (QREFELT $ 111))))) 

(DEFUN |GDMP;content;$R;30| (|p| $)
  (PROG (#1=#:G287 #2=#:G286 #3=#:G288 #4=#:G291 |t|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p| (QREFELT $ 13)) (|spadConstant| $ 60))
            (#5='T
             (PROGN
              (LETT #1# NIL . #6=(|GDMP;content;$R;30|))
              (SEQ (LETT |t| NIL . #6#) (LETT #4# |p| . #6#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #3# (QCDR |t|) . #6#)
                      (COND
                       (#1#
                        (LETT #2# (SPADCALL #2# #3# (QREFELT $ 124)) . #6#))
                       ('T
                        (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
                   (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) (#5# (|spadConstant| $ 60)))))))))) 

(DEFUN |GDMP;gcd;3$;31| (|p| |q| $)
  (PROG (|r| |qv| |pv|)
    (RETURN
     (SEQ (LETT |pv| (SPADCALL |p| (QREFELT $ 38)) . #1=(|GDMP;gcd;3$;31|))
          (EXIT
           (COND
            ((QEQCAR |pv| 1)
             (SEQ (LETT |r| (SPADCALL |p| (QREFELT $ 40)) . #1#)
                  (EXIT
                   (COND
                    ((SPADCALL |r| (|spadConstant| $ 60) (QREFELT $ 126)) |q|)
                    (#2='T
                     (SPADCALL
                      (SPADCALL |r| (SPADCALL |q| (QREFELT $ 125))
                                (QREFELT $ 124))
                      (QREFELT $ 84)))))))
            (#2#
             (SEQ (LETT |qv| (SPADCALL |q| (QREFELT $ 38)) . #1#)
                  (EXIT
                   (COND
                    ((QEQCAR |qv| 1)
                     (SEQ (LETT |r| (SPADCALL |q| (QREFELT $ 40)) . #1#)
                          (EXIT
                           (COND
                            ((SPADCALL |r| (|spadConstant| $ 60)
                                       (QREFELT $ 126))
                             |p|)
                            (#2#
                             (SPADCALL
                              (SPADCALL |r| (SPADCALL |p| (QREFELT $ 125))
                                        (QREFELT $ 124))
                              (QREFELT $ 84)))))))
                    ((SPADCALL (QCDR |pv|) (QCDR |qv|) (QREFELT $ 127))
                     (SPADCALL |p|
                               (SPADCALL
                                (SPADCALL |q| (QCDR |qv|) (QREFELT $ 47))
                                (QREFELT $ 128))
                               (QREFELT $ 129)))
                    ((SPADCALL (QCDR |qv|) (QCDR |pv|) (QREFELT $ 127))
                     (SPADCALL |q|
                               (SPADCALL
                                (SPADCALL |p| (QCDR |pv|) (QREFELT $ 47))
                                (QREFELT $ 128))
                               (QREFELT $ 129)))
                    (#2#
                     (SPADCALL
                      (SPADCALL (SPADCALL |p| (QCDR |pv|) (QREFELT $ 47))
                                (SPADCALL |q| (QCDR |qv|) (QREFELT $ 47))
                                (QREFELT $ 130))
                      (QCDR |pv|) (QREFELT $ 52))))))))))))) 

(DEFUN |GDMP;gcd;3$;32| (|p| |q| $) (SPADCALL |p| |q| (QREFELT $ 132))) 

(DEFUN |GDMP;gcd;3$;33| (|p| |q| $)
  (PROG (|r| |qv| |pv|)
    (RETURN
     (SEQ (LETT |pv| (SPADCALL |p| (QREFELT $ 38)) . #1=(|GDMP;gcd;3$;33|))
          (EXIT
           (COND
            ((QEQCAR |pv| 1)
             (SEQ (LETT |r| (SPADCALL |p| (QREFELT $ 40)) . #1#)
                  (EXIT
                   (COND
                    ((SPADCALL |r| (|spadConstant| $ 60) (QREFELT $ 126)) |q|)
                    (#2='T
                     (SPADCALL
                      (SPADCALL |r| (SPADCALL |q| (QREFELT $ 125))
                                (QREFELT $ 124))
                      (QREFELT $ 84)))))))
            (#2#
             (SEQ (LETT |qv| (SPADCALL |q| (QREFELT $ 38)) . #1#)
                  (EXIT
                   (COND
                    ((QEQCAR |qv| 1)
                     (SEQ (LETT |r| (SPADCALL |q| (QREFELT $ 40)) . #1#)
                          (EXIT
                           (COND
                            ((SPADCALL |r| (|spadConstant| $ 60)
                                       (QREFELT $ 126))
                             |p|)
                            (#2#
                             (SPADCALL
                              (SPADCALL |r| (SPADCALL |p| (QREFELT $ 125))
                                        (QREFELT $ 124))
                              (QREFELT $ 84)))))))
                    ((SPADCALL (QCDR |pv|) (QCDR |qv|) (QREFELT $ 127))
                     (SPADCALL |p|
                               (SPADCALL
                                (SPADCALL |q| (QCDR |qv|) (QREFELT $ 47))
                                (QREFELT $ 128))
                               (QREFELT $ 129)))
                    ((SPADCALL (QCDR |qv|) (QCDR |pv|) (QREFELT $ 127))
                     (SPADCALL |q|
                               (SPADCALL
                                (SPADCALL |p| (QCDR |pv|) (QREFELT $ 47))
                                (QREFELT $ 128))
                               (QREFELT $ 129)))
                    (#2#
                     (SPADCALL
                      (SPADCALL (SPADCALL |p| (QCDR |pv|) (QREFELT $ 47))
                                (SPADCALL |q| (QCDR |qv|) (QREFELT $ 47))
                                (QREFELT $ 130))
                      (QCDR |pv|) (QREFELT $ 52))))))))))))) 

(DEFUN |GDMP;coerce;$Of;34| (|p| $)
  (PROG (|lt| |l| #1=#:G327 |i| #2=#:G326 |t| |vl1| #3=#:G325 |v| #4=#:G324)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p| (QREFELT $ 13))
        (SPADCALL (|spadConstant| $ 60) (QREFELT $ 134)))
       (#5='T
        (SEQ (LETT |lt| NIL . #6=(|GDMP;coerce;$Of;34|))
             (LETT |vl1|
                   (PROGN
                    (LETT #4# NIL . #6#)
                    (SEQ (LETT |v| NIL . #6#) (LETT #3# (QREFELT $ 6) . #6#)
                         G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |v| (CAR #3#) . #6#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #4# (CONS (SPADCALL |v| (QREFELT $ 135)) #4#)
                                 . #6#)))
                         (LETT #3# (CDR #3#) . #6#) (GO G190) G191
                         (EXIT (NREVERSE #4#))))
                   . #6#)
             (SEQ (LETT |t| NIL . #6#) (LETT #2# (REVERSE |p|) . #6#) G190
                  (COND
                   ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#) . #6#) NIL))
                    (GO G191)))
                  (SEQ (LETT |l| NIL . #6#)
                       (SEQ (LETT |i| 1 . #6#) (LETT #1# (LENGTH |vl1|) . #6#)
                            G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((EQL (SPADCALL (QCAR |t|) |i| (QREFELT $ 45))
                                     0)
                                "next")
                               ((EQL (SPADCALL (QCAR |t|) |i| (QREFELT $ 45))
                                     1)
                                (LETT |l|
                                      (CONS
                                       (SPADCALL |vl1| |i| (QREFELT $ 137))
                                       |l|)
                                      . #6#))
                               ('T
                                (LETT |l|
                                      (CONS
                                       (SPADCALL
                                        (SPADCALL |vl1| |i| (QREFELT $ 137))
                                        (SPADCALL
                                         (SPADCALL (QCAR |t|) |i|
                                                   (QREFELT $ 45))
                                         (QREFELT $ 138))
                                        (QREFELT $ 139))
                                       |l|)
                                      . #6#)))))
                            (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                            (EXIT NIL))
                       (LETT |l| (REVERSE |l|) . #6#)
                       (COND
                        ((OR
                          (SPADCALL (QCDR |t|) (|spadConstant| $ 26)
                                    (QREFELT $ 140))
                          (NULL |l|))
                         (LETT |l|
                               (CONS (SPADCALL (QCDR |t|) (QREFELT $ 134)) |l|)
                               . #6#)))
                       (EXIT
                        (COND
                         ((EQL 1 (LENGTH |l|))
                          (LETT |lt| (CONS (|SPADfirst| |l|) |lt|) . #6#))
                         ('T
                          (LETT |lt|
                                (CONS
                                 (SPADCALL (ELT $ 142) |l| (QREFELT $ 144))
                                 |lt|)
                                . #6#)))))
                  (LETT #2# (CDR #2#) . #6#) (GO G190) G191 (EXIT NIL))
             (EXIT
              (COND ((EQL 1 (LENGTH |lt|)) (|SPADfirst| |lt|))
                    (#5# (SPADCALL (ELT $ 145) |lt| (QREFELT $ 144)))))))))))) 

(DECLAIM (NOTINLINE |GeneralDistributedMultivariatePolynomial;|)) 

(DEFUN |GeneralDistributedMultivariatePolynomial| (&REST #1=#:G358)
  (PROG ()
    (RETURN
     (PROG (#2=#:G359)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|GeneralDistributedMultivariatePolynomial|)
                                           '|domainEqualList|)
                . #3=(|GeneralDistributedMultivariatePolynomial|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY
                   (|function| |GeneralDistributedMultivariatePolynomial;|)
                   #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|GeneralDistributedMultivariatePolynomial|))))))))))) 

(DEFUN |GeneralDistributedMultivariatePolynomial;| (|#1| |#2| |#3|)
  (PROG (#1=#:G357 |pv$| #2=#:G354 #3=#:G355 #4=#:G356 $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #5=(|GeneralDistributedMultivariatePolynomial|))
      (LETT DV$2 (|devaluate| |#2|) . #5#)
      (LETT DV$3 (|devaluate| |#3|) . #5#)
      (LETT |dv$|
            (LIST '|GeneralDistributedMultivariatePolynomial| DV$1 DV$2 DV$3)
            . #5#)
      (LETT $ (GETREFV 179) . #5#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#2| '(|EntireRing|))
                                          (LETT #4#
                                                (|HasCategory| |#2|
                                                               '(|GcdDomain|))
                                                . #5#)
                                          (OR #4#
                                              (|HasCategory| |#2|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (AND
                                           (|HasCategory| |#2|
                                                          '(|PatternMatchable|
                                                            (|Float|)))
                                           (|HasCategory|
                                            (|OrderedVariableList| |#1|)
                                            '(|PatternMatchable| (|Float|))))
                                          (AND
                                           (|HasCategory| |#2|
                                                          '(|PatternMatchable|
                                                            (|Integer|)))
                                           (|HasCategory|
                                            (|OrderedVariableList| |#1|)
                                            '(|PatternMatchable| (|Integer|))))
                                          (AND
                                           (|HasCategory| |#2|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Float|))))
                                           (|HasCategory|
                                            (|OrderedVariableList| |#1|)
                                            '(|ConvertibleTo|
                                              (|Pattern| (|Float|)))))
                                          (AND
                                           (|HasCategory| |#2|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Integer|))))
                                           (|HasCategory|
                                            (|OrderedVariableList| |#1|)
                                            '(|ConvertibleTo|
                                              (|Pattern| (|Integer|)))))
                                          (AND
                                           (|HasCategory| |#2|
                                                          '(|ConvertibleTo|
                                                            (|InputForm|)))
                                           (|HasCategory|
                                            (|OrderedVariableList| |#1|)
                                            '(|ConvertibleTo| (|InputForm|))))
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (OR
                                           (|HasCategory| |#2| '(|EntireRing|))
                                           #4#)
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|canonicalUnitNormal|))
                                          (|HasCategory| |#2| '(|Comparable|))
                                          (|HasCategory| |#2|
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory| |#2|
                                                          '(|RetractableTo|
                                                            (|Fraction|
                                                             (|Integer|)))))
                                          (|HasCategory| |#2| '(|Field|))
                                          (LETT #3#
                                                (|HasCategory| |#2|
                                                               '(|CommutativeRing|))
                                                . #5#)
                                          (OR #3#
                                              (|HasCategory| |#2|
                                                             '(|EntireRing|)))
                                          (OR #3# #4#
                                              (|HasCategory| |#2|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (LETT #2#
                                                (|HasCategory| |#2|
                                                               '(|IntegralDomain|))
                                                . #5#)
                                          (OR #3# #4# #2#
                                              (|HasCategory| |#2|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #4# #2#
                                              (|HasCategory| |#2|
                                                             '(|PolynomialFactorizationExplicit|)))
                                          (OR #3# #4# #2#) (OR #4# #2#)
                                          (OR #3#
                                              (|HasCategory| |#2|
                                                             '(|EntireRing|))
                                              #4# #2#)))
                      . #5#))
      (|haddProp| |$ConstructorCache|
                  '|GeneralDistributedMultivariatePolynomial|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (AND (|HasCategory| $ '(|CommutativeRing|))
           (|augmentPredVector| $ 536870912))
      (AND
       (LETT #1#
             (AND (|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
                  (|HasCategory| $ '(|CharacteristicNonZero|)))
             . #5#)
       (|augmentPredVector| $ 1073741824))
      (AND (OR (|HasCategory| |#2| '(|CharacteristicNonZero|)) #1#)
           (|augmentPredVector| $ 2147483648))
      (AND
       (OR (|HasCategory| |#2| '(|EntireRing|))
           (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 4294967296))
      (AND
       (OR #4#
           (AND #2# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
       (|augmentPredVector| $ 8589934592))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 9 (|Record| (|:| |k| |#3|) (|:| |c| |#2|)))
      (QSETREFV $ 10 (|List| (QREFELT $ 9)))
      (QSETREFV $ 11 (LENGTH |#1|))
      (COND
       ((|testBitVector| |pv$| 20)
        (QSETREFV $ 65 (CONS (|dispatchFunction| |GDMP;/;$R$;18|) $))))
      (COND
       ((|testBitVector| |pv$| 3)
        (PROGN
         (QSETREFV $ 125 (CONS (|dispatchFunction| |GDMP;content;$R;30|) $))
         (COND
          ((|HasCategory| |#2| '(|EuclideanDomain|))
           (COND
            ((|HasCategory| |#2| '(|FloatingPointSystem|))
             (QSETREFV $ 129 (CONS (|dispatchFunction| |GDMP;gcd;3$;31|) $)))
            ('T
             (QSETREFV $ 129 (CONS (|dispatchFunction| |GDMP;gcd;3$;32|) $)))))
          ('T
           (QSETREFV $ 129 (CONS (|dispatchFunction| |GDMP;gcd;3$;33|) $)))))))
      $)))) 

(MAKEPROP '|GeneralDistributedMultivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|PolynomialRing| 7 8) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) '|Term| '|Rep| '|n| (|Boolean|)
              |GDMP;zero?;$B;1| (|Vector| 17) (0 . |coerce|) (5 . |Zero|)
              (|NonNegativeInteger|) (9 . +) (|Mapping| 17 17 17)
              (15 . |reduce|) |GDMP;totalDegree;$Nni;2| (|PositiveInteger|)
              (|OrderedVariableList| 6) (22 . |lookup|) (27 . |One|)
              (31 . |One|) (35 . |directProduct|) (40 . |monomial|) (46 . *)
              |GDMP;monomial;$OvlNni$;3| |GDMP;coerce;Ovl$;4|
              (|Union| $ '"failed") (|Symbol|) (52 . |variable|)
              |GDMP;degree;$OvlNni;10| (57 . >) (|Union| 23 '"failed")
              |GDMP;mainVariable;$U;6| |GDMP;ground?;$B;7|
              (63 . |leadingCoefficient|) |GDMP;retract;$R;8|
              (|Union| 7 '"failed") |GDMP;retractIfCan;$U;9| (|Integer|)
              (68 . |elt|) (|SparseUnivariatePolynomial| $)
              |GDMP;univariate;$OvlSup;21| (|SparseUnivariatePolynomial| $$)
              (74 . |minimumDegree|) |GDMP;minimumDegree;$OvlNni;11|
              (79 . |differentiate|) |GDMP;multivariate;SupOvl$;27|
              |GDMP;differentiate;$Ovl$;12| (|List| 17) (|List| 23)
              |GDMP;degree;$LL;13| |GDMP;minimumDegree;$LL;14|
              |GDMP;numberOfMonomials;$Nni;15| |GDMP;monomial?;$B;16|
              (84 . |Zero|) (88 . >) (94 . -) (99 . |inv|) (104 . *) (110 . /)
              (116 . |new|) (122 . |degree|) (127 . |reductum|) (132 . |elt|)
              (138 . |setelt|) (145 . ~=) (151 . |index|)
              |GDMP;variables;$L;19| (156 . >) (|Mapping| 12 9 9)
              (162 . |sort|) (|List| 44) |GDMP;reorder;$L$;20| (168 . |Zero|)
              (172 . |monomial|) (178 . +) (184 . |elt|) |GDMP;eval;$Ovl2$;22|
              (190 . |coerce|) |GDMP;eval;$OvlR$;23| (195 . =) (|List| 7)
              |GDMP;eval;$LL$;24| (|List| $$) (201 . =) (207 . >) '"rest"
              (213 . |elt|) '"first" (219 . |elt|) (|Mapping| $$ $$)
              (225 . |map|) (231 . =) (|Mapping| 12 23 23) (237 . |sort|)
              (243 . |position|) (249 . |elt|) (|List| $) |GDMP;eval;$LL$;26|
              (255 . |Zero|) (259 . =) (265 . |degree|)
              (270 . |leadingCoefficient|) (275 . ^) (281 . |reductum|)
              (286 . +) (|SparseUnivariatePolynomial| 7) (292 . |monomial|)
              (298 . |Zero|) (302 . ~=) (308 . |ground|) (313 . +)
              |GDMP;univariate;$Sup;28| (319 . =) (325 . |leadingCoefficient|)
              (330 . |degree|) (335 . |reductum|)
              |GDMP;multivariate;SupOvl$;29| (340 . |gcd|) (346 . |content|)
              (351 . =) (357 . <) (363 . |content|) (368 . |gcd|) (374 . |gcd|)
              (|PolynomialGcdPackage| 8 23 7 $$) (380 . |gcd|) (|OutputForm|)
              (386 . |coerce|) (391 . |coerce|) (|List| 133) (396 . |elt|)
              (402 . |coerce|) (407 . ^) (413 . ~=) (419 . |One|) (423 . *)
              (|Mapping| 133 133 133) (429 . |reduce|) (435 . +)
              |GDMP;coerce;$Of;34| (|Union| 160 '#1="failed") (|Matrix| $)
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 44)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 44 $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 44)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Factored| $) (|Matrix| 44)
              (|Record| (|:| |mat| 158) (|:| |vec| (|Vector| 44))) (|Vector| $)
              (|Factored| 46) (|Union| 163 '#1#) (|List| 46)
              (|Union| 155 '#2="failed") (|Union| 44 '#2#)
              (|Record| (|:| |var| 23) (|:| |exponent| 17))
              (|Union| 166 '#3="failed") (|Union| 103 '#3#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $)) (|Equation| $)
              (|List| 170) (|Mapping| 7 7) (|Mapping| 8 8)
              (|Record| (|:| |mat| 175) (|:| |vec| (|Vector| 7))) (|Matrix| 7)
              (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 441 |zero?| 447 |variables| 452 |univariate| 457 |unitNormal|
              468 |unitCanonical| 473 |unit?| 478 |totalDegreeSorted| 483
              |totalDegree| 489 |subtractIfCan| 500 |squareFreePolynomial| 506
              |squareFreePart| 511 |squareFree| 516
              |solveLinearPolynomialEquation| 521 |smaller?| 527 |sample| 533
              |retractIfCan| 537 |retract| 557 |resultant| 577 |reorder| 584
              |reductum| 590 |reducedSystem| 595 |recip| 617 |primitivePart|
              622 |primitiveMonomials| 633 |prime?| 638 |pomopo!| 643
              |patternMatch| 651 |one?| 665 |numberOfMonomials| 670
              |multivariate| 675 |monomials| 687 |monomial?| 692 |monomial| 697
              |monicDivide| 717 |minimumDegree| 724 |mapExponents| 741 |map|
              747 |mainVariable| 753 |leadingMonomial| 758 |leadingCoefficient|
              763 |lcmCoef| 768 |lcm| 774 |latex| 785 |isTimes| 790 |isPlus|
              795 |isExpt| 800 |hashUpdate!| 805 |hash| 811 |ground?| 816
              |ground| 821 |gcdPolynomial| 826 |gcd| 832
              |factorSquareFreePolynomial| 843 |factorPolynomial| 848 |factor|
              853 |exquo| 858 |eval| 870 |discriminant| 924 |differentiate| 930
              |degree| 956 |convert| 973 |content| 988 |conditionP| 999
              |coerce| 1004 |coefficients| 1034 |coefficient| 1039 |charthRoot|
              1059 |characteristic| 1064 |binomThmExpt| 1068 |associates?| 1075
              ^ 1081 |Zero| 1093 |One| 1097 D 1101 = 1127 / 1133 - 1139 + 1150
              * 1156)
           'NIL
           (CONS
            (|makeByteWordVec2| 29
                                '(0 0 1 0 1 0 4 26 0 28 3 10 23 0 0 25 28 10 11
                                  12 23 13 18 0 0 10 29 0 0 0 0 22 10 10 0 0 0
                                  0 0 0 0 0 5 6 17 0 0 0 0 0 0 0 0 0 0 0 0 27 2
                                  7 8 9 14 15 16))
            (CONS
             '#(|PolynomialCategory&| |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |FiniteAbelianMonoidRing&|
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |FullyLinearlyExplicitRingOver&| |Algebra&| NIL |Algebra&|
                |Algebra&| |PartialDifferentialRing&| NIL NIL |Module&|
                |Module&| NIL NIL |Module&| |EntireRing&| NIL |Ring&| NIL NIL
                NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL
                |AbelianMonoid&| |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&|
                NIL NIL NIL |Evalable&| |FullyRetractableTo&| |SetCategory&|
                NIL |RetractableTo&| |InnerEvalable&| |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| NIL |BasicType&| NIL NIL NIL
                NIL NIL NIL |RetractableTo&| |RetractableTo&| NIL)
             (CONS
              '#((|PolynomialCategory| 7 8 (|OrderedVariableList| 6))
                 (|MaybeSkewPolynomialCategory| 7 8 (|OrderedVariableList| 6))
                 (|PolynomialFactorizationExplicit|)
                 (|FiniteAbelianMonoidRing| 7 8) (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 7 8) (|GcdDomain|) (|IntegralDomain|)
                 (|FullyLinearlyExplicitRingOver| 7) (|Algebra| $$)
                 (|LeftOreRing|) (|Algebra| 155) (|Algebra| 7)
                 (|PartialDifferentialRing| (|OrderedVariableList| 6))
                 (|LinearlyExplicitRingOver| 7) (|CommutativeRing|)
                 (|Module| $$) (|Module| 155) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Module| 7) (|EntireRing|)
                 (|LinearlyExplicitRingOver| 44) (|Ring|) (|BiModule| 7 7)
                 (|BiModule| 155 155) (|BiModule| $$ $$) (|Rng|)
                 (|LeftModule| 7) (|RightModule| 7) (|LeftModule| $$)
                 (|RightModule| $$) (|LeftModule| 155) (|RightModule| 155)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 44) (|Comparable|) (|Evalable| $$)
                 (|FullyRetractableTo| 7) (|SetCategory|)
                 (|VariablesCommuteWithCoefficients|)
                 (|RetractableTo| (|OrderedVariableList| 6))
                 (|InnerEvalable| (|OrderedVariableList| 6) $$)
                 (|InnerEvalable| (|OrderedVariableList| 6) 7)
                 (|InnerEvalable| $$ $$) (|RetractableTo| 7) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 133) (|CommutativeStar|)
                 (|noZeroDivisors|) (|ConvertibleTo| 150) (|ConvertibleTo| 151)
                 (|ConvertibleTo| 149) (|RetractableTo| 155)
                 (|RetractableTo| 44) (|canonicalUnitNormal|))
              (|makeByteWordVec2| 178
                                  '(1 8 14 0 15 0 0 0 16 2 17 0 0 0 18 3 14 17
                                    19 0 17 20 1 23 22 0 24 0 0 0 25 0 7 0 26 1
                                    8 0 14 27 2 0 0 7 8 28 2 0 0 0 0 29 1 23 32
                                    33 34 2 17 12 0 0 36 1 0 7 0 40 2 8 17 0 44
                                    45 1 48 17 0 49 1 48 0 0 51 0 7 0 60 2 7 12
                                    0 0 61 1 7 0 0 62 1 7 0 0 63 2 0 0 7 0 64 2
                                    0 0 0 7 65 2 14 0 17 17 66 1 0 8 0 67 1 0 0
                                    0 68 2 14 17 0 44 69 3 14 17 0 44 17 70 2
                                    17 12 0 0 71 1 23 0 22 72 2 8 12 0 0 74 2
                                    10 0 75 0 76 0 48 0 79 2 48 0 2 17 80 2 48
                                    0 0 0 81 2 48 2 0 2 82 1 0 0 7 84 2 55 12 0
                                    0 86 2 89 12 0 0 90 2 23 12 0 0 91 2 89 0 0
                                    92 93 2 89 2 0 94 95 2 48 0 96 0 97 2 23 12
                                    0 0 98 2 55 0 99 0 100 2 55 44 23 0 101 2
                                    89 2 0 44 102 0 8 0 105 2 48 12 0 0 106 1
                                    48 17 0 107 1 48 2 0 108 2 0 0 0 17 109 1
                                    48 0 0 110 2 0 0 0 0 111 2 112 0 7 17 113 0
                                    112 0 114 2 48 12 0 0 115 1 0 7 0 116 2 112
                                    0 0 0 117 2 112 12 0 0 119 1 112 7 0 120 1
                                    112 17 0 121 1 112 0 0 122 2 7 0 0 0 124 1
                                    0 7 0 125 2 7 12 0 0 126 2 23 12 0 0 127 1
                                    48 2 0 128 2 0 0 0 0 129 2 48 0 0 0 130 2
                                    131 2 2 2 132 1 7 133 0 134 1 33 133 0 135
                                    2 136 133 0 44 137 1 17 133 0 138 2 133 0 0
                                    0 139 2 7 12 0 0 140 0 8 0 141 2 133 0 0 0
                                    142 2 136 133 143 0 144 2 133 0 0 0 145 2 0
                                    12 0 0 1 1 0 12 0 13 1 0 55 0 73 1 0 112 0
                                    118 2 0 46 0 23 47 1 33 154 0 1 1 33 0 0 1
                                    1 33 12 0 1 2 0 17 0 55 1 1 0 17 0 21 2 0
                                    17 0 55 1 2 0 32 0 0 1 1 1 161 46 1 1 3 0 0
                                    1 1 3 157 0 1 2 1 162 163 46 1 2 17 12 0 0
                                    1 0 0 0 1 1 14 164 0 1 1 15 165 0 1 1 0 37
                                    0 1 1 0 42 0 43 1 14 155 0 1 1 15 44 0 1 1
                                    0 23 0 1 1 0 7 0 41 3 21 0 0 0 23 1 2 0 0 0
                                    77 78 1 0 0 0 68 1 18 158 148 1 2 18 159
                                    148 160 1 2 0 174 148 160 1 1 0 175 148 1 1
                                    0 32 0 1 2 3 0 0 23 1 1 3 0 0 1 1 0 103 0 1
                                    1 1 12 0 1 4 0 0 0 7 8 0 1 3 5 152 0 150
                                    152 1 3 6 153 0 151 153 1 1 0 12 0 1 1 0 17
                                    0 58 2 0 0 112 23 123 2 0 0 46 23 52 1 0
                                    103 0 1 1 0 12 0 59 2 0 0 7 8 28 3 0 0 0 23
                                    17 30 3 0 0 0 55 54 1 3 0 169 0 0 23 1 2 0
                                    54 0 55 57 2 0 17 0 23 50 1 0 8 0 1 2 0 0
                                    173 0 1 2 0 0 172 0 1 1 0 37 0 38 1 0 0 0 1
                                    1 0 7 0 40 2 3 156 0 0 1 2 3 0 0 0 1 1 3 0
                                    103 1 1 0 176 0 1 1 0 168 0 1 1 0 168 0 1 1
                                    0 167 0 1 2 0 178 178 0 1 1 0 177 0 1 1 0
                                    12 0 39 1 0 7 0 116 2 3 46 46 46 1 2 3 0 0
                                    0 129 1 3 0 103 1 1 1 161 46 1 1 1 161 46 1
                                    1 1 157 0 1 2 33 32 0 0 1 2 2 32 0 7 1 3 0
                                    0 0 23 0 83 3 0 0 0 55 103 104 3 0 0 0 55
                                    87 88 3 0 0 0 103 103 1 3 0 0 0 23 7 85 2 0
                                    0 0 170 1 3 0 0 0 0 0 1 2 0 0 0 171 1 2 21
                                    0 0 23 1 3 0 0 0 23 17 1 3 0 0 0 55 54 1 2
                                    0 0 0 23 53 2 0 0 0 55 1 1 0 8 0 67 2 0 17
                                    0 23 35 2 0 54 0 55 56 1 9 149 0 1 1 7 150
                                    0 1 1 8 151 0 1 2 3 0 0 23 1 1 3 7 0 125 1
                                    31 147 148 1 1 34 0 0 1 1 19 0 155 1 1 0 0
                                    23 31 1 0 0 7 84 1 0 0 44 1 1 0 133 0 146 1
                                    0 87 0 1 2 0 7 0 8 1 3 0 0 0 23 17 1 3 0 0
                                    0 55 54 1 1 32 32 0 1 0 0 17 1 3 30 0 0 0
                                    17 1 2 33 12 0 0 1 2 0 0 0 17 109 2 0 0 0
                                    22 1 0 0 0 16 0 0 0 25 3 0 0 0 23 17 1 3 0
                                    0 0 55 54 1 2 0 0 0 23 1 2 0 0 0 55 1 2 0
                                    12 0 0 1 2 20 0 0 7 65 1 0 0 0 1 2 0 0 0 0
                                    1 2 0 0 0 0 111 2 10 0 155 0 1 2 10 0 0 155
                                    1 2 0 0 0 7 1 2 0 0 7 0 64 2 0 0 44 0 1 2 0
                                    0 0 0 29 2 0 0 17 0 1 2 0 0 22 0 1)))))
           '|lookupComplete|)) 
