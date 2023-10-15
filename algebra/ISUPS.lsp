
(PUT '|ISUPS;makeTerm| '|SPADreplace| 'CONS) 

(SDEFUN |ISUPS;makeTerm|
        ((|exp| |Integer|) (|coef| |Coef|)
         ($ |Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
        (CONS |exp| |coef|)) 

(PUT '|ISUPS;getCoef| '|SPADreplace| 'QCDR) 

(SDEFUN |ISUPS;getCoef|
        ((|term| |Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)) ($ |Coef|))
        (QCDR |term|)) 

(PUT '|ISUPS;getExpon| '|SPADreplace| 'QCAR) 

(SDEFUN |ISUPS;getExpon|
        ((|term| |Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))
         ($ |Integer|))
        (QCAR |term|)) 

(PUT '|ISUPS;makeSeries;RS$;4| '|SPADreplace| 'CONS) 

(SDEFUN |ISUPS;makeSeries;RS$;4|
        ((|refer| |Reference| (|OrderedCompletion| (|Integer|)))
         (|x| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         ($ $))
        (CONS |refer| |x|)) 

(PUT '|ISUPS;getRef;$R;5| '|SPADreplace| 'QCAR) 

(SDEFUN |ISUPS;getRef;$R;5|
        ((|ups| $) ($ |Reference| (|OrderedCompletion| (|Integer|))))
        (QCAR |ups|)) 

(PUT '|ISUPS;getStream;$S;6| '|SPADreplace| 'QCDR) 

(SDEFUN |ISUPS;getStream;$S;6|
        ((|ups| $)
         ($ |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
        (QCDR |ups|)) 

(SDEFUN |ISUPS;monomial;CoefI$;7| ((|coef| |Coef|) (|expon| |Integer|) ($ $))
        (SPROG
         ((|st| (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|nix| (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))))
         (SEQ
          (LETT |nix| (SPADCALL (QREFELT $ 14))
                . #1=(|ISUPS;monomial;CoefI$;7|))
          (LETT |st|
                (COND ((SPADCALL |coef| (QREFELT $ 16)) |nix|)
                      ('T
                       (SPADCALL (|ISUPS;makeTerm| |expon| |coef| $) |nix|
                                 (QREFELT $ 17))))
                . #1#)
          (EXIT
           (SPADCALL (SPADCALL (SPADCALL (QREFELT $ 19)) (QREFELT $ 20)) |st|
                     (QREFELT $ 11)))))) 

(SDEFUN |ISUPS;monomial?;$B;8| ((|ups| $) ($ |Boolean|))
        (COND ((SPADCALL (SPADCALL |ups| (QREFELT $ 13)) (QREFELT $ 23)) NIL)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |ups| (QREFELT $ 13)) (QREFELT $ 24))
                (QREFELT $ 23))))) 

(SDEFUN |ISUPS;coerce;I$;9| ((|n| |Integer|) ($ $))
        (SPADCALL (SPADCALL |n| (QREFELT $ 26)) (QREFELT $ 27))) 

(SDEFUN |ISUPS;coerce;Coef$;10| ((|r| |Coef|) ($ $))
        (SPADCALL |r| 0 (QREFELT $ 22))) 

(SDEFUN |ISUPS;iSeries|
        ((|x| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|refer| |Reference| (|OrderedCompletion| (|Integer|)))
         ($ |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
        (SEQ
         (COND
          ((SPADCALL |x| (QREFELT $ 23))
           (SEQ (SPADCALL |refer| (SPADCALL (QREFELT $ 19)) (QREFELT $ 31))
                (EXIT (SPADCALL (QREFELT $ 14)))))
          ('T
           (SEQ
            (SPADCALL |refer|
                      (SPADCALL
                       (|ISUPS;getExpon| (SPADCALL |x| (QREFELT $ 32)) $)
                       (QREFELT $ 33))
                      (QREFELT $ 31))
            (EXIT
             (SPADCALL (SPADCALL |x| (QREFELT $ 32))
                       (|ISUPS;iSeries| (SPADCALL |x| (QREFELT $ 24)) |refer|
                        $)
                       (QREFELT $ 17)))))))) 

(SDEFUN |ISUPS;series;S$;12|
        ((|x| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         ($ $))
        (SPROG
         ((|refer| (|Reference| (|OrderedCompletion| (|Integer|))))
          (|n| (|Integer|)))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 23)) (|spadConstant| $ 29))
                ('T
                 (SEQ
                  (LETT |n| (|ISUPS;getExpon| (SPADCALL |x| (QREFELT $ 32)) $)
                        . #1=(|ISUPS;series;S$;12|))
                  (LETT |refer|
                        (SPADCALL (SPADCALL |n| (QREFELT $ 33)) (QREFELT $ 20))
                        . #1#)
                  (EXIT
                   (SPADCALL |refer| (|ISUPS;iSeries| |x| |refer| $)
                             (QREFELT $ 11))))))))) 

(SDEFUN |ISUPS;characteristic;Nni;13| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 36))) 

(SDEFUN |ISUPS;Zero;$;14| (($ $))
        (SPADCALL (|spadConstant| $ 30) 0 (QREFELT $ 22))) 

(SDEFUN |ISUPS;One;$;15| (($ $))
        (SPADCALL (|spadConstant| $ 39) 0 (QREFELT $ 22))) 

(SDEFUN |ISUPS;iExtend|
        ((|st| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|n| |OrderedCompletion| (|Integer|))
         (|refer| |Reference| (|OrderedCompletion| (|Integer|)))
         ($ |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |refer| (QREFELT $ 40)) |n| (QREFELT $ 41))
           (COND
            ((SPADCALL |st| (QREFELT $ 42))
             (SEQ (SPADCALL |refer| (SPADCALL (QREFELT $ 19)) (QREFELT $ 31))
                  (EXIT |st|)))
            ((SPADCALL |st| (QREFELT $ 43))
             (|ISUPS;iExtend| (SPADCALL |st| (QREFELT $ 24)) |n| |refer| $))
            (#1='T
             (|ISUPS;iExtend| (SPADCALL |st| (QREFELT $ 44)) |n| |refer| $))))
          (#1# |st|)))) 

(SDEFUN |ISUPS;extend;$I$;17| ((|x| $) (|n| |Integer|) ($ $))
        (SEQ
         (|ISUPS;iExtend| (SPADCALL |x| (QREFELT $ 13))
          (SPADCALL |n| (QREFELT $ 33)) (SPADCALL |x| (QREFELT $ 12)) $)
         (EXIT |x|))) 

(SDEFUN |ISUPS;complete;2$;18| ((|x| $) ($ $))
        (SEQ
         (|ISUPS;iExtend| (SPADCALL |x| (QREFELT $ 13))
          (SPADCALL (QREFELT $ 19)) (SPADCALL |x| (QREFELT $ 12)) $)
         (EXIT |x|))) 

(SDEFUN |ISUPS;iTruncate0|
        ((|x| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|xRefer| |Reference| (|OrderedCompletion| (|Integer|)))
         (|refer| |Reference| (|OrderedCompletion| (|Integer|)))
         (|minExp| |OrderedCompletion| (|Integer|)) (|maxExp| |Integer|)
         (|n| |Integer|)
         ($ |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|ISUPS;iTruncate0!0|
                       (VECTOR |minExp| |maxExp| |xRefer| |n| |refer| $ |x|))
                 (QREFELT $ 53))))) 

(SDEFUN |ISUPS;iTruncate0!0| (($$ NIL))
        (PROG (|x| $ |refer| |n| |xRefer| |maxExp| |minExp|)
          (LETT |x| (QREFELT $$ 6) . #1=(|ISUPS;iTruncate0|))
          (LETT $ (QREFELT $$ 5) . #1#)
          (LETT |refer| (QREFELT $$ 4) . #1#)
          (LETT |n| (QREFELT $$ 3) . #1#)
          (LETT |xRefer| (QREFELT $$ 2) . #1#)
          (LETT |maxExp| (QREFELT $$ 1) . #1#)
          (LETT |minExp| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|nn| NIL) (|xTerm| NIL) (|nx| NIL) (|degr| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |x| (QREFELT $ 42))
                      (SEQ
                       (SPADCALL |refer| (SPADCALL (QREFELT $ 19))
                                 (QREFELT $ 31))
                       (EXIT (SPADCALL (QREFELT $ 14)))))
                     ('T
                      (SEQ (LETT |nn| (SPADCALL |n| (QREFELT $ 33)) NIL)
                           (SEQ G190
                                (COND
                                 ((NULL
                                   (SPADCALL (SPADCALL |xRefer| (QREFELT $ 40))
                                             |nn| (QREFELT $ 41)))
                                  (GO G191)))
                                (SEQ (EXIT (SPADCALL |x| (QREFELT $ 44)))) NIL
                                (GO G190) G191 (EXIT NIL))
                           (EXIT
                            (COND
                             ((SPADCALL |x| (QREFELT $ 43))
                              (SEQ
                               (LETT |nx|
                                     (|ISUPS;getExpon|
                                      (LETT |xTerm|
                                            (SPADCALL |x| (QREFELT $ 32)) NIL)
                                      $)
                                     NIL)
                               (EXIT
                                (COND
                                 ((SPADCALL |nx| |maxExp| (QREFELT $ 47))
                                  (SEQ
                                   (SPADCALL |refer| (SPADCALL (QREFELT $ 19))
                                             (QREFELT $ 31))
                                   (EXIT (SPADCALL (QREFELT $ 14)))))
                                 ('T
                                  (SEQ
                                   (SPADCALL |refer|
                                             (SPADCALL |nx| (QREFELT $ 33))
                                             (QREFELT $ 31))
                                   (EXIT
                                    (COND
                                     ((SPADCALL (SPADCALL |nx| (QREFELT $ 33))
                                                |minExp| (QREFELT $ 48))
                                      (SPADCALL
                                       (|ISUPS;makeTerm| |nx|
                                        (|ISUPS;getCoef| |xTerm| $) $)
                                       (|ISUPS;iTruncate0|
                                        (SPADCALL |x| (QREFELT $ 24)) |xRefer|
                                        |refer| |minExp| |maxExp|
                                        (SPADCALL |nx| (|spadConstant| $ 49)
                                                  (QREFELT $ 50))
                                        $)
                                       (QREFELT $ 17)))
                                     ('T
                                      (|ISUPS;iTruncate0|
                                       (SPADCALL |x| (QREFELT $ 24)) |xRefer|
                                       |refer| |minExp| |maxExp|
                                       (SPADCALL |nx| (|spadConstant| $ 49)
                                                 (QREFELT $ 50))
                                       $))))))))))
                             ('T
                              (SEQ
                               (LETT |degr|
                                     (SPADCALL
                                      (SPADCALL |xRefer| (QREFELT $ 40))
                                      (QREFELT $ 51))
                                     NIL)
                               (SPADCALL |refer|
                                         (SPADCALL |degr| (QREFELT $ 33))
                                         (QREFELT $ 31))
                               (EXIT
                                (|ISUPS;iTruncate0| |x| |xRefer| |refer|
                                 |minExp| |maxExp|
                                 (SPADCALL |degr| (|spadConstant| $ 49)
                                           (QREFELT $ 50))
                                 $))))))))))))))) 

(SDEFUN |ISUPS;iTruncate|
        ((|ups| $) (|minExp| |OrderedCompletion| (|Integer|))
         (|maxExp| |Integer|) ($ $))
        (SPROG
         ((|refer| (|Reference| (|OrderedCompletion| (|Integer|))))
          (|degr| (|Integer|)) (|deg| (|Integer|))
          (|xRefer| (|Reference| (|OrderedCompletion| (|Integer|))))
          (|x| (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))))
         (SEQ
          (LETT |x| (SPADCALL |ups| (QREFELT $ 13)) . #1=(|ISUPS;iTruncate|))
          (LETT |xRefer| (SPADCALL |ups| (QREFELT $ 12)) . #1#)
          (EXIT
           (COND ((SPADCALL |x| (QREFELT $ 42)) (|spadConstant| $ 29))
                 ((SPADCALL |x| (QREFELT $ 43))
                  (SEQ
                   (LETT |deg|
                         (|ISUPS;getExpon| (SPADCALL |x| (QREFELT $ 32)) $)
                         . #1#)
                   (LETT |refer|
                         (SPADCALL (SPADCALL (- |deg| 1) (QREFELT $ 33))
                                   (QREFELT $ 20))
                         . #1#)
                   (EXIT
                    (SPADCALL |refer|
                              (|ISUPS;iTruncate0| |x| |xRefer| |refer| |minExp|
                               |maxExp| |deg| $)
                              (QREFELT $ 11)))))
                 ('T
                  (SEQ
                   (LETT |degr|
                         (SPADCALL (SPADCALL |xRefer| (QREFELT $ 40))
                                   (QREFELT $ 51))
                         . #1#)
                   (LETT |refer|
                         (SPADCALL (SPADCALL |degr| (QREFELT $ 33))
                                   (QREFELT $ 20))
                         . #1#)
                   (EXIT
                    (SPADCALL |refer|
                              (|ISUPS;iTruncate0| |x| |xRefer| |refer| |minExp|
                               |maxExp| (+ |degr| 1) $)
                              (QREFELT $ 11)))))))))) 

(SDEFUN |ISUPS;truncate;$I$;21| ((|ups| $) (|n| |Integer|) ($ $))
        (|ISUPS;iTruncate| |ups| (SPADCALL (QREFELT $ 54)) |n| $)) 

(SDEFUN |ISUPS;truncate;$2I$;22|
        ((|ups| $) (|n1| . #1=(|Integer|)) (|n2| . #1#) ($ $))
        (SPROG ((|#G41| #1#) (|#G40| #1#))
               (SEQ
                (COND
                 ((SPADCALL |n1| |n2| (QREFELT $ 47))
                  (PROGN
                   (LETT |#G40| |n2| . #2=(|ISUPS;truncate;$2I$;22|))
                   (LETT |#G41| |n1| . #2#)
                   (LETT |n1| |#G40| . #2#)
                   (LETT |n2| |#G41| . #2#))))
                (EXIT
                 (|ISUPS;iTruncate| |ups| (SPADCALL |n1| (QREFELT $ 33)) |n2|
                  $))))) 

(SDEFUN |ISUPS;iCoefficient|
        ((|st| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|n| |Integer|) ($ |Coef|))
        (SPROG
         ((|expon| (|Integer|))
          (|term| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
         (SEQ
          (COND
           ((SPADCALL |st| (QREFELT $ 43))
            (SEQ
             (LETT |term| (SPADCALL |st| (QREFELT $ 32))
                   . #1=(|ISUPS;iCoefficient|))
             (LETT |expon| (|ISUPS;getExpon| |term| $) . #1#)
             (EXIT
              (COND
               ((SPADCALL |expon| |n| (QREFELT $ 47)) (|spadConstant| $ 30))
               ((EQL |expon| |n|) (|ISUPS;getCoef| |term| $))
               (#2='T
                (|ISUPS;iCoefficient| (SPADCALL |st| (QREFELT $ 24)) |n|
                 $))))))
           (#2# (|spadConstant| $ 30)))))) 

(SDEFUN |ISUPS;coefficient;$ICoef;24| ((|x| $) (|n| |Integer|) ($ |Coef|))
        (SEQ (SPADCALL |x| |n| (QREFELT $ 45))
             (EXIT (|ISUPS;iCoefficient| (SPADCALL |x| (QREFELT $ 13)) |n| $)))) 

(SDEFUN |ISUPS;elt;$ICoef;25| ((|x| $) (|n| |Integer|) ($ |Coef|))
        (SPADCALL |x| |n| (QREFELT $ 57))) 

(SDEFUN |ISUPS;iOrder|
        ((|st| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|n| |OrderedCompletion| (|Integer|))
         (|refer| |Reference| (|OrderedCompletion| (|Integer|))) ($ |Integer|))
        (SPROG ((|degr| (|Integer|)) (|r| (|Integer|)))
               (SEQ
                (COND
                 ((SPADCALL |st| (QREFELT $ 42))
                  (COND
                   ((SPADCALL |n| (QREFELT $ 59))
                    (SPADCALL |n| (QREFELT $ 51)))
                   (#1='T (|error| "order: series has infinite order"))))
                 ((SPADCALL |st| (QREFELT $ 43))
                  (SEQ
                   (LETT |r|
                         (|ISUPS;getExpon| (SPADCALL |st| (QREFELT $ 32)) $)
                         . #2=(|ISUPS;iOrder|))
                   (EXIT
                    (COND
                     ((SPADCALL (SPADCALL |r| (QREFELT $ 33)) |n|
                                (QREFELT $ 48))
                      (SPADCALL |n| (QREFELT $ 51)))
                     (#1# |r|)))))
                 (#1#
                  (SEQ
                   (LETT |degr|
                         (SPADCALL (SPADCALL |refer| (QREFELT $ 40))
                                   (QREFELT $ 51))
                         . #2#)
                   (EXIT
                    (COND
                     ((SPADCALL (SPADCALL |degr| (QREFELT $ 33)) |n|
                                (QREFELT $ 48))
                      (SPADCALL |n| (QREFELT $ 51)))
                     (#1#
                      (|ISUPS;iOrder| (SPADCALL |st| (QREFELT $ 44)) |n|
                       |refer| $)))))))))) 

(SDEFUN |ISUPS;order;$I;27| ((|x| $) ($ |Integer|))
        (|ISUPS;iOrder| (SPADCALL |x| (QREFELT $ 13)) (SPADCALL (QREFELT $ 19))
         (SPADCALL |x| (QREFELT $ 12)) $)) 

(SDEFUN |ISUPS;order;$2I;28| ((|x| $) (|n| . #1=(|Integer|)) ($ . #1#))
        (|ISUPS;iOrder| (SPADCALL |x| (QREFELT $ 13))
         (SPADCALL |n| (QREFELT $ 33)) (SPADCALL |x| (QREFELT $ 12)) $)) 

(SDEFUN |ISUPS;terms;$S;29|
        ((|x| $)
         ($ |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
        (SPADCALL |x| (QREFELT $ 13))) 

(SDEFUN |ISUPS;zero?;$B;30| ((|ups| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G345 NIL) (#2=#:G346 NIL) (|i| NIL)
          (|count| (|NonNegativeInteger|))
          (|n| (|OrderedCompletion| (|Integer|)))
          (|ref| (|Reference| (|OrderedCompletion| (|Integer|))))
          (|x| (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |x| (SPADCALL |ups| (QREFELT $ 13))
                  . #3=(|ISUPS;zero?;$B;30|))
            (LETT |ref| (SPADCALL |ups| (QREFELT $ 12)) . #3#)
            (EXIT
             (COND
              ((|eql_SI|
                (SPADCALL (LETT |n| (SPADCALL |ref| (QREFELT $ 40)) . #3#)
                          (QREFELT $ 64))
                1)
               (SPADCALL |x| (QREFELT $ 42)))
              ('T
               (SEQ (LETT |count| |$streamCount| . #3#)
                    (SEQ (LETT |i| 1 . #3#) (LETT #2# |count| . #3#) G190
                         (COND ((|greater_SI| |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |x| (QREFELT $ 42))
                             (PROGN (LETT #1# 'T . #3#) (GO #4=#:G344)))
                            ((SPADCALL |x| (QREFELT $ 43))
                             (PROGN (LETT #1# NIL . #3#) (GO #4#)))
                            ('T (SPADCALL |x| (QREFELT $ 44))))))
                         (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT NIL)))))))
          #4# (EXIT #1#)))) 

(SDEFUN |ISUPS;=;2$B;31| ((|ups1| $) (|ups2| $) ($ |Boolean|))
        (SPADCALL (SPADCALL |ups1| |ups2| (QREFELT $ 66)) (QREFELT $ 65))) 

(SDEFUN |ISUPS;iMap1|
        ((|cFcn| |Mapping| |Coef| |Coef| (|Integer|))
         (|eFcn| |Mapping| (|Integer|) (|Integer|)) (|check?| |Boolean|)
         (|x| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|xRefer| |Reference| (|OrderedCompletion| (|Integer|)))
         (|refer| |Reference| (|OrderedCompletion| (|Integer|)))
         (|n| |Integer|)
         ($ |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|ISUPS;iMap1!0|
                       (VECTOR |check?| |eFcn| |cFcn| |xRefer| |n| |refer| $
                               |x|))
                 (QREFELT $ 53))))) 

(SDEFUN |ISUPS;iMap1!0| (($$ NIL))
        (PROG (|x| $ |refer| |n| |xRefer| |cFcn| |eFcn| |check?|)
          (LETT |x| (QREFELT $$ 7) . #1=(|ISUPS;iMap1|))
          (LETT $ (QREFELT $$ 6) . #1#)
          (LETT |refer| (QREFELT $$ 5) . #1#)
          (LETT |n| (QREFELT $$ 4) . #1#)
          (LETT |xRefer| (QREFELT $$ 3) . #1#)
          (LETT |cFcn| (QREFELT $$ 2) . #1#)
          (LETT |eFcn| (QREFELT $$ 1) . #1#)
          (LETT |check?| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG
             ((|nn| NIL) (|xTerm| NIL) (|xCoef| NIL) (|nx| NIL) (|newCoef| NIL)
              (|m| NIL) (|degr| NIL))
             (SEQ
              (COND
               ((SPADCALL |x| (QREFELT $ 42))
                (SEQ
                 (SPADCALL |refer| (SPADCALL (QREFELT $ 19)) (QREFELT $ 31))
                 (EXIT (SPADCALL (QREFELT $ 14)))))
               ('T
                (SEQ (LETT |nn| (SPADCALL |n| (QREFELT $ 33)) NIL)
                     (SEQ G190
                          (COND
                           ((NULL
                             (SPADCALL (SPADCALL |xRefer| (QREFELT $ 40)) |nn|
                                       (QREFELT $ 41)))
                            (GO G191)))
                          (SEQ (EXIT (SPADCALL |x| (QREFELT $ 44)))) NIL
                          (GO G190) G191 (EXIT NIL))
                     (EXIT
                      (COND
                       ((SPADCALL |x| (QREFELT $ 42))
                        (SEQ
                         (SPADCALL |refer| (SPADCALL (QREFELT $ 19))
                                   (QREFELT $ 31))
                         (EXIT (SPADCALL (QREFELT $ 14)))))
                       ((SPADCALL |x| (QREFELT $ 43))
                        (SEQ
                         (LETT |xCoef|
                               (|ISUPS;getCoef|
                                (LETT |xTerm| (SPADCALL |x| (QREFELT $ 32))
                                      NIL)
                                $)
                               NIL)
                         (LETT |nx| (|ISUPS;getExpon| |xTerm| $) NIL)
                         (LETT |newCoef| (SPADCALL |xCoef| |nx| |cFcn|) NIL)
                         (LETT |m| (SPADCALL |nx| |eFcn|) NIL)
                         (SPADCALL |refer| (SPADCALL |m| (QREFELT $ 33))
                                   (QREFELT $ 31))
                         (EXIT
                          (COND
                           (|check?|
                            (COND
                             ((SPADCALL |newCoef| (QREFELT $ 16))
                              (|ISUPS;iMap1| |cFcn| |eFcn| |check?|
                               (SPADCALL |x| (QREFELT $ 24)) |xRefer| |refer|
                               (SPADCALL |nx| (|spadConstant| $ 49)
                                         (QREFELT $ 50))
                               $))
                             ('T
                              (SPADCALL (|ISUPS;makeTerm| |m| |newCoef| $)
                                        (|ISUPS;iMap1| |cFcn| |eFcn| |check?|
                                         (SPADCALL |x| (QREFELT $ 24)) |xRefer|
                                         |refer|
                                         (SPADCALL |nx| (|spadConstant| $ 49)
                                                   (QREFELT $ 50))
                                         $)
                                        (QREFELT $ 17)))))
                           ('T
                            (SPADCALL (|ISUPS;makeTerm| |m| |newCoef| $)
                                      (|ISUPS;iMap1| |cFcn| |eFcn| |check?|
                                       (SPADCALL |x| (QREFELT $ 24)) |xRefer|
                                       |refer|
                                       (SPADCALL |nx| (|spadConstant| $ 49)
                                                 (QREFELT $ 50))
                                       $)
                                      (QREFELT $ 17)))))))
                       ('T
                        (SEQ
                         (LETT |degr|
                               (SPADCALL (SPADCALL |xRefer| (QREFELT $ 40))
                                         (QREFELT $ 51))
                               NIL)
                         (SPADCALL |refer|
                                   (SPADCALL (SPADCALL |degr| |eFcn|)
                                             (QREFELT $ 33))
                                   (QREFELT $ 31))
                         (EXIT
                          (|ISUPS;iMap1| |cFcn| |eFcn| |check?| |x| |xRefer|
                           |refer|
                           (SPADCALL |degr| (|spadConstant| $ 49)
                                     (QREFELT $ 50))
                           $))))))))))))))) 

(SDEFUN |ISUPS;iMap2|
        ((|cFcn| |Mapping| |Coef| |Coef| (|Integer|))
         (|eFcn| |Mapping| (|Integer|) (|Integer|)) (|check?| |Boolean|)
         (|ups| $) ($ $))
        (SPROG
         ((|refer| (|Reference| (|OrderedCompletion| (|Integer|))))
          (|degr| (|Integer|)) (|deg| (|Integer|))
          (|x| (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|xRefer| (|Reference| (|OrderedCompletion| (|Integer|)))))
         (SEQ
          (LETT |xRefer| (SPADCALL |ups| (QREFELT $ 12)) . #1=(|ISUPS;iMap2|))
          (LETT |x| (SPADCALL |ups| (QREFELT $ 13)) . #1#)
          (EXIT
           (COND ((SPADCALL |x| (QREFELT $ 42)) (|spadConstant| $ 29))
                 ((SPADCALL |x| (QREFELT $ 43))
                  (SEQ
                   (LETT |deg|
                         (|ISUPS;getExpon| (SPADCALL |x| (QREFELT $ 32)) $)
                         . #1#)
                   (LETT |refer|
                         (SPADCALL
                          (SPADCALL (SPADCALL (- |deg| 1) |eFcn|)
                                    (QREFELT $ 33))
                          (QREFELT $ 20))
                         . #1#)
                   (EXIT
                    (SPADCALL |refer|
                              (|ISUPS;iMap1| |cFcn| |eFcn| |check?| |x|
                               |xRefer| |refer| |deg| $)
                              (QREFELT $ 11)))))
                 ('T
                  (SEQ
                   (LETT |degr|
                         (SPADCALL (SPADCALL |xRefer| (QREFELT $ 40))
                                   (QREFELT $ 51))
                         . #1#)
                   (LETT |refer|
                         (SPADCALL
                          (SPADCALL (SPADCALL |degr| |eFcn|) (QREFELT $ 33))
                          (QREFELT $ 20))
                         . #1#)
                   (EXIT
                    (SPADCALL |refer|
                              (|ISUPS;iMap1| |cFcn| |eFcn| |check?| |x|
                               |xRefer| |refer| (+ |degr| 1) $)
                              (QREFELT $ 11)))))))))) 

(SDEFUN |ISUPS;map;M2$;34| ((|fcn| |Mapping| |Coef| |Coef|) (|x| $) ($ $))
        (|ISUPS;iMap2| (CONS #'|ISUPS;map;M2$;34!0| |fcn|)
         (LIST #'|ISUPS;map;M2$;34!1|) 'T |x| $)) 

(SDEFUN |ISUPS;map;M2$;34!1| ((|z| NIL) ($$ NIL)) |z|) 

(SDEFUN |ISUPS;map;M2$;34!0| ((|y| NIL) (|n| NIL) (|fcn| NIL))
        (SPADCALL |y| |fcn|)) 

(SDEFUN |ISUPS;differentiate;2$;35| ((|x| $) ($ $))
        (|ISUPS;iMap2| (CONS #'|ISUPS;differentiate;2$;35!0| $)
         (CONS #'|ISUPS;differentiate;2$;35!1| $) 'T |x| $)) 

(SDEFUN |ISUPS;differentiate;2$;35!1| ((|z| NIL) ($ NIL))
        (SPADCALL |z| (|spadConstant| $ 49) (QREFELT $ 71))) 

(SDEFUN |ISUPS;differentiate;2$;35!0| ((|y| NIL) (|n| NIL) ($ NIL))
        (SPADCALL |n| |y| (QREFELT $ 70))) 

(SDEFUN |ISUPS;multiplyCoefficients;M2$;36|
        ((|f| |Mapping| |Coef| (|Integer|)) (|x| $) ($ $))
        (SPROG NIL
               (|ISUPS;iMap2|
                (CONS #'|ISUPS;multiplyCoefficients;M2$;36!0| (VECTOR $ |f|))
                (LIST #'|ISUPS;multiplyCoefficients;M2$;36!1|) 'T |x| $))) 

(SDEFUN |ISUPS;multiplyCoefficients;M2$;36!1| ((|z| NIL) ($$ NIL)) |z|) 

(SDEFUN |ISUPS;multiplyCoefficients;M2$;36!0| ((|y| NIL) (|n| NIL) ($$ NIL))
        (PROG (|f| $)
          (LETT |f| (QREFELT $$ 1) . #1=(|ISUPS;multiplyCoefficients;M2$;36|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (SPADCALL |n| |f|) |y| (QREFELT $ 73)))))) 

(SDEFUN |ISUPS;multiplyExponents;$Pi$;37|
        ((|x| $) (|n| |PositiveInteger|) ($ $))
        (SPROG NIL
               (|ISUPS;iMap2| (LIST #'|ISUPS;multiplyExponents;$Pi$;37!0|)
                (CONS #'|ISUPS;multiplyExponents;$Pi$;37!1| (VECTOR $ |n|)) NIL
                |x| $))) 

(SDEFUN |ISUPS;multiplyExponents;$Pi$;37!1| ((|z| NIL) ($$ NIL))
        (PROG (|n| $)
          (LETT |n| (QREFELT $$ 1) . #1=(|ISUPS;multiplyExponents;$Pi$;37|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |n| |z| (QREFELT $ 77)))))) 

(SDEFUN |ISUPS;multiplyExponents;$Pi$;37!0| ((|y| NIL) (|m| NIL) ($$ NIL)) |y|) 

(SDEFUN |ISUPS;iPlus1|
        ((|op| |Mapping| |Coef| |Coef| |Coef|)
         (|x| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|xRefer| |Reference| (|OrderedCompletion| (|Integer|)))
         (|y| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|yRefer| |Reference| (|OrderedCompletion| (|Integer|)))
         (|refer| |Reference| (|OrderedCompletion| (|Integer|)))
         (|n| |Integer|)
         ($ |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|ISUPS;iPlus1!8|
                       (VECTOR |xRefer| |n| |refer| |yRefer| |y| |op| $ |x|))
                 (QREFELT $ 53))))) 

(SDEFUN |ISUPS;iPlus1!8| (($$ NIL))
        (PROG (|x| $ |op| |y| |yRefer| |refer| |n| |xRefer|)
          (LETT |x| (QREFELT $$ 7) . #1=(|ISUPS;iPlus1|))
          (LETT $ (QREFELT $$ 6) . #1#)
          (LETT |op| (QREFELT $$ 5) . #1#)
          (LETT |y| (QREFELT $$ 4) . #1#)
          (LETT |yRefer| (QREFELT $$ 3) . #1#)
          (LETT |refer| (QREFELT $$ 2) . #1#)
          (LETT |n| (QREFELT $$ 1) . #1#)
          (LETT |xRefer| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG
             ((|nn| NIL) (|coef| NIL) (|xTerm| NIL) (|xCoef| NIL) (|nx| NIL)
              (|yTerm| NIL) (|yCoef| NIL) (|ny| NIL) (|degr| NIL)
              (|xyRef| NIL))
             (SEQ
              (COND
               ((SPADCALL |x| (QREFELT $ 42))
                (|ISUPS;iMap1| (CONS #'|ISUPS;iPlus1!0| (VECTOR |op| $))
                 (LIST #'|ISUPS;iPlus1!1|) NIL |y| |yRefer| |refer| |n| $))
               ((SPADCALL |y| (QREFELT $ 42))
                (|ISUPS;iMap1| (CONS #'|ISUPS;iPlus1!2| (VECTOR |op| $))
                 (LIST #'|ISUPS;iPlus1!3|) NIL |x| |xRefer| |refer| |n| $))
               ('T
                (SEQ (LETT |nn| (SPADCALL |n| (QREFELT $ 33)) NIL)
                     (SEQ G190
                          (COND
                           ((NULL
                             (SPADCALL (SPADCALL |xRefer| (QREFELT $ 40)) |nn|
                                       (QREFELT $ 41)))
                            (GO G191)))
                          (SEQ (EXIT (SPADCALL |x| (QREFELT $ 44)))) NIL
                          (GO G190) G191 (EXIT NIL))
                     (SEQ G190
                          (COND
                           ((NULL
                             (SPADCALL (SPADCALL |yRefer| (QREFELT $ 40)) |nn|
                                       (QREFELT $ 41)))
                            (GO G191)))
                          (SEQ (EXIT (SPADCALL |y| (QREFELT $ 44)))) NIL
                          (GO G190) G191 (EXIT NIL))
                     (EXIT
                      (COND
                       ((SPADCALL |x| (QREFELT $ 42))
                        (|ISUPS;iMap1|
                         (CONS #'|ISUPS;iPlus1!4| (VECTOR |op| $))
                         (LIST #'|ISUPS;iPlus1!5|) NIL |y| |yRefer| |refer| |n|
                         $))
                       ((SPADCALL |y| (QREFELT $ 42))
                        (|ISUPS;iMap1|
                         (CONS #'|ISUPS;iPlus1!6| (VECTOR |op| $))
                         (LIST #'|ISUPS;iPlus1!7|) NIL |x| |xRefer| |refer| |n|
                         $))
                       ('T
                        (SEQ
                         (COND
                          ((SPADCALL |x| (QREFELT $ 43))
                           (COND
                            ((SPADCALL |y| (QREFELT $ 43))
                             (EXIT
                              (SEQ
                               (LETT |xCoef|
                                     (|ISUPS;getCoef|
                                      (LETT |xTerm|
                                            (SPADCALL |x| (QREFELT $ 32)) NIL)
                                      $)
                                     NIL)
                               (LETT |nx| (|ISUPS;getExpon| |xTerm| $) NIL)
                               (LETT |yCoef|
                                     (|ISUPS;getCoef|
                                      (LETT |yTerm|
                                            (SPADCALL |y| (QREFELT $ 32)) NIL)
                                      $)
                                     NIL)
                               (LETT |ny| (|ISUPS;getExpon| |yTerm| $) NIL)
                               (EXIT
                                (COND
                                 ((SPADCALL |nx| |ny| (QREFELT $ 79))
                                  (SEQ
                                   (SPADCALL |refer|
                                             (SPADCALL |nx| (QREFELT $ 33))
                                             (QREFELT $ 31))
                                   (EXIT
                                    (COND
                                     ((SPADCALL
                                       (LETT |coef|
                                             (SPADCALL |xCoef| |yCoef| |op|)
                                             NIL)
                                       (QREFELT $ 16))
                                      (|ISUPS;iPlus1| |op|
                                       (SPADCALL |x| (QREFELT $ 24)) |xRefer|
                                       (SPADCALL |y| (QREFELT $ 24)) |yRefer|
                                       |refer|
                                       (SPADCALL |nx| (|spadConstant| $ 49)
                                                 (QREFELT $ 50))
                                       $))
                                     ('T
                                      (SPADCALL
                                       (|ISUPS;makeTerm| |nx| |coef| $)
                                       (|ISUPS;iPlus1| |op|
                                        (SPADCALL |x| (QREFELT $ 24)) |xRefer|
                                        (SPADCALL |y| (QREFELT $ 24)) |yRefer|
                                        |refer|
                                        (SPADCALL |nx| (|spadConstant| $ 49)
                                                  (QREFELT $ 50))
                                        $)
                                       (QREFELT $ 17)))))))
                                 ((SPADCALL |nx| |ny| (QREFELT $ 80))
                                  (SEQ
                                   (SPADCALL |refer|
                                             (SPADCALL |nx| (QREFELT $ 33))
                                             (QREFELT $ 31))
                                   (EXIT
                                    (SPADCALL
                                     (|ISUPS;makeTerm| |nx|
                                      (SPADCALL |xCoef| (|spadConstant| $ 30)
                                                |op|)
                                      $)
                                     (|ISUPS;iPlus1| |op|
                                      (SPADCALL |x| (QREFELT $ 24)) |xRefer|
                                      |y| |yRefer| |refer|
                                      (SPADCALL |nx| (|spadConstant| $ 49)
                                                (QREFELT $ 50))
                                      $)
                                     (QREFELT $ 17)))))
                                 ('T
                                  (SEQ
                                   (SPADCALL |refer|
                                             (SPADCALL |ny| (QREFELT $ 33))
                                             (QREFELT $ 31))
                                   (EXIT
                                    (SPADCALL
                                     (|ISUPS;makeTerm| |ny|
                                      (SPADCALL (|spadConstant| $ 30) |yCoef|
                                                |op|)
                                      $)
                                     (|ISUPS;iPlus1| |op| |x| |xRefer|
                                      (SPADCALL |y| (QREFELT $ 24)) |yRefer|
                                      |refer|
                                      (SPADCALL |ny| (|spadConstant| $ 49)
                                                (QREFELT $ 50))
                                      $)
                                     (QREFELT $ 17)))))))))))))
                         (EXIT
                          (COND
                           ((SPADCALL |x| (QREFELT $ 43))
                            (SEQ
                             (LETT |xCoef|
                                   (|ISUPS;getCoef|
                                    (LETT |xTerm| (SPADCALL |x| (QREFELT $ 32))
                                          NIL)
                                    $)
                                   NIL)
                             (LETT |nx| (|ISUPS;getExpon| |xTerm| $) NIL)
                             (LETT |degr|
                                   (SPADCALL (SPADCALL |yRefer| (QREFELT $ 40))
                                             (QREFELT $ 51))
                                   NIL)
                             (EXIT
                              (COND
                               ((SPADCALL |degr| |nx| (QREFELT $ 80))
                                (SEQ
                                 (SPADCALL |refer|
                                           (SPADCALL |yRefer| (QREFELT $ 40))
                                           (QREFELT $ 31))
                                 (EXIT
                                  (|ISUPS;iPlus1| |op| |x| |xRefer| |y|
                                   |yRefer| |refer|
                                   (SPADCALL |degr| (|spadConstant| $ 49)
                                             (QREFELT $ 50))
                                   $))))
                               ('T
                                (SEQ
                                 (SPADCALL |refer|
                                           (SPADCALL |nx| (QREFELT $ 33))
                                           (QREFELT $ 31))
                                 (EXIT
                                  (SPADCALL
                                   (|ISUPS;makeTerm| |nx|
                                    (SPADCALL |xCoef| (|spadConstant| $ 30)
                                              |op|)
                                    $)
                                   (|ISUPS;iPlus1| |op|
                                    (SPADCALL |x| (QREFELT $ 24)) |xRefer| |y|
                                    |yRefer| |refer|
                                    (SPADCALL |nx| (|spadConstant| $ 49)
                                              (QREFELT $ 50))
                                    $)
                                   (QREFELT $ 17)))))))))
                           ((SPADCALL |y| (QREFELT $ 43))
                            (SEQ
                             (LETT |yCoef|
                                   (|ISUPS;getCoef|
                                    (LETT |yTerm| (SPADCALL |y| (QREFELT $ 32))
                                          NIL)
                                    $)
                                   NIL)
                             (LETT |ny| (|ISUPS;getExpon| |yTerm| $) NIL)
                             (LETT |degr|
                                   (SPADCALL (SPADCALL |xRefer| (QREFELT $ 40))
                                             (QREFELT $ 51))
                                   NIL)
                             (EXIT
                              (COND
                               ((SPADCALL |degr| |ny| (QREFELT $ 80))
                                (SEQ
                                 (SPADCALL |refer|
                                           (SPADCALL |xRefer| (QREFELT $ 40))
                                           (QREFELT $ 31))
                                 (EXIT
                                  (|ISUPS;iPlus1| |op| |x| |xRefer| |y|
                                   |yRefer| |refer|
                                   (SPADCALL |degr| (|spadConstant| $ 49)
                                             (QREFELT $ 50))
                                   $))))
                               ('T
                                (SEQ
                                 (SPADCALL |refer|
                                           (SPADCALL |ny| (QREFELT $ 33))
                                           (QREFELT $ 31))
                                 (EXIT
                                  (SPADCALL
                                   (|ISUPS;makeTerm| |ny|
                                    (SPADCALL (|spadConstant| $ 30) |yCoef|
                                              |op|)
                                    $)
                                   (|ISUPS;iPlus1| |op| |x| |xRefer|
                                    (SPADCALL |y| (QREFELT $ 24)) |yRefer|
                                    |refer|
                                    (SPADCALL |ny| (|spadConstant| $ 49)
                                              (QREFELT $ 50))
                                    $)
                                   (QREFELT $ 17)))))))))
                           ('T
                            (SEQ
                             (SPADCALL |refer|
                                       (LETT |xyRef|
                                             (SPADCALL
                                              (SPADCALL |xRefer|
                                                        (QREFELT $ 40))
                                              (SPADCALL |yRefer|
                                                        (QREFELT $ 40))
                                              (QREFELT $ 81))
                                             NIL)
                                       (QREFELT $ 31))
                             (EXIT
                              (|ISUPS;iPlus1| |op| |x| |xRefer| |y| |yRefer|
                               |refer|
                               (SPADCALL (SPADCALL |xyRef| (QREFELT $ 51))
                                         (|spadConstant| $ 49) (QREFELT $ 50))
                               $))))))))))))))))))) 

(SDEFUN |ISUPS;iPlus1!7| ((|z| NIL) ($$ NIL)) |z|) 

(SDEFUN |ISUPS;iPlus1!6| ((|x1| NIL) (|m| NIL) ($$ NIL))
        (PROG ($ |op|)
          (LETT $ (QREFELT $$ 1) NIL)
          (LETT |op| (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x1| (|spadConstant| $ 30) |op|))))) 

(SDEFUN |ISUPS;iPlus1!5| ((|z| NIL) ($$ NIL)) |z|) 

(SDEFUN |ISUPS;iPlus1!4| ((|x1| NIL) (|m| NIL) ($$ NIL))
        (PROG ($ |op|)
          (LETT $ (QREFELT $$ 1) NIL)
          (LETT |op| (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL (|spadConstant| $ 30) |x1| |op|))))) 

(SDEFUN |ISUPS;iPlus1!3| ((|z| NIL) ($$ NIL)) |z|) 

(SDEFUN |ISUPS;iPlus1!2| ((|x1| NIL) (|m| NIL) ($$ NIL))
        (PROG ($ |op|)
          (LETT $ (QREFELT $$ 1) NIL)
          (LETT |op| (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |x1| (|spadConstant| $ 30) |op|))))) 

(SDEFUN |ISUPS;iPlus1!1| ((|z| NIL) ($$ NIL)) |z|) 

(SDEFUN |ISUPS;iPlus1!0| ((|x1| NIL) (|m| NIL) ($$ NIL))
        (PROG ($ |op|)
          (LETT $ (QREFELT $$ 1) NIL)
          (LETT |op| (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL (|spadConstant| $ 30) |x1| |op|))))) 

(SDEFUN |ISUPS;iPlus2|
        ((|op| |Mapping| |Coef| |Coef| |Coef|) (|ups1| $) (|ups2| $) ($ $))
        (SPROG
         ((|refer| (|Reference| (|OrderedCompletion| (|Integer|))))
          (|deg| (|Integer|)) (|yDeg| #1=(|Integer|)) (#2=#:G597 NIL)
          (|y| #3=(|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|yRefer| #4=(|Reference| (|OrderedCompletion| (|Integer|))))
          (|xDeg| #1#) (|x| #3#) (|xRefer| #4#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |xRefer| (SPADCALL |ups1| (QREFELT $ 12))
                  . #5=(|ISUPS;iPlus2|))
            (LETT |x| (SPADCALL |ups1| (QREFELT $ 13)) . #5#)
            (LETT |xDeg|
                  (COND
                   ((SPADCALL |x| (QREFELT $ 42))
                    (PROGN
                     (LETT #2#
                           (SPADCALL (CONS #'|ISUPS;iPlus2!0| (VECTOR |op| $))
                                     |ups2| (QREFELT $ 69))
                           . #5#)
                     (GO #6=#:G596)))
                   ((SPADCALL |x| (QREFELT $ 43))
                    (- (|ISUPS;getExpon| (SPADCALL |x| (QREFELT $ 32)) $) 1))
                   (#7='T
                    (SPADCALL (SPADCALL |xRefer| (QREFELT $ 40))
                              (QREFELT $ 51))))
                  . #5#)
            (LETT |yRefer| (SPADCALL |ups2| (QREFELT $ 12)) . #5#)
            (LETT |y| (SPADCALL |ups2| (QREFELT $ 13)) . #5#)
            (LETT |yDeg|
                  (COND
                   ((SPADCALL |y| (QREFELT $ 42))
                    (PROGN
                     (LETT #2#
                           (SPADCALL (CONS #'|ISUPS;iPlus2!1| (VECTOR |op| $))
                                     |ups1| (QREFELT $ 69))
                           . #5#)
                     (GO #6#)))
                   ((SPADCALL |y| (QREFELT $ 43))
                    (- (|ISUPS;getExpon| (SPADCALL |y| (QREFELT $ 32)) $) 1))
                   (#7#
                    (SPADCALL (SPADCALL |yRefer| (QREFELT $ 40))
                              (QREFELT $ 51))))
                  . #5#)
            (LETT |deg| (MIN |xDeg| |yDeg|) . #5#)
            (LETT |refer|
                  (SPADCALL (SPADCALL |deg| (QREFELT $ 33)) (QREFELT $ 20))
                  . #5#)
            (EXIT
             (SPADCALL |refer|
                       (|ISUPS;iPlus1| |op| |x| |xRefer| |y| |yRefer| |refer|
                        (+ |deg| 1) $)
                       (QREFELT $ 11)))))
          #6# (EXIT #2#)))) 

(SDEFUN |ISUPS;iPlus2!1| ((|z| NIL) ($$ NIL))
        (PROG ($ |op|)
          (LETT $ (QREFELT $$ 1) . #1=(|ISUPS;iPlus2|))
          (LETT |op| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z| (|spadConstant| $ 30) |op|))))) 

(SDEFUN |ISUPS;iPlus2!0| ((|z| NIL) ($$ NIL))
        (PROG ($ |op|)
          (LETT $ (QREFELT $$ 1) . #1=(|ISUPS;iPlus2|))
          (LETT |op| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (|spadConstant| $ 30) |z| |op|))))) 

(SDEFUN |ISUPS;+;3$;40| ((|x| $) (|y| $) ($ $))
        (|ISUPS;iPlus2| (ELT $ 82) |x| |y| $)) 

(SDEFUN |ISUPS;-;3$;41| ((|x| $) (|y| $) ($ $))
        (|ISUPS;iPlus2| (ELT $ 84) |x| |y| $)) 

(SDEFUN |ISUPS;-;2$;42| ((|y| $) ($ $))
        (|ISUPS;iMap2| (CONS #'|ISUPS;-;2$;42!0| $) (LIST #'|ISUPS;-;2$;42!1|)
         NIL |y| $)) 

(SDEFUN |ISUPS;-;2$;42!1| ((|z| NIL) ($$ NIL)) |z|) 

(SDEFUN |ISUPS;-;2$;42!0| ((|x| NIL) (|n| NIL) ($ NIL))
        (SPADCALL |x| (QREFELT $ 85))) 

(SDEFUN |ISUPS;*;I2$;43| ((|n| |Integer|) (|x| $) ($ $))
        (SPROG NIL
               (COND ((ZEROP |n|) (|spadConstant| $ 29))
                     ('T
                      (SPADCALL (CONS #'|ISUPS;*;I2$;43!0| (VECTOR $ |n|)) |x|
                                (QREFELT $ 69)))))) 

(SDEFUN |ISUPS;*;I2$;43!0| ((|z| NIL) ($$ NIL))
        (PROG (|n| $)
          (LETT |n| (QREFELT $$ 1) . #1=(|ISUPS;*;I2$;43|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |n| |z| (QREFELT $ 70)))))) 

(SDEFUN |ISUPS;*;Nni2$;44| ((|n| |NonNegativeInteger|) (|x| $) ($ $))
        (SPROG NIL
               (COND ((ZEROP |n|) (|spadConstant| $ 29))
                     ('T
                      (SPADCALL (CONS #'|ISUPS;*;Nni2$;44!0| (VECTOR $ |n|))
                                |x| (QREFELT $ 69)))))) 

(SDEFUN |ISUPS;*;Nni2$;44!0| ((|z| NIL) ($$ NIL))
        (PROG (|n| $)
          (LETT |n| (QREFELT $$ 1) . #1=(|ISUPS;*;Nni2$;44|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |n| |z| (QREFELT $ 88)))))) 

(SDEFUN |ISUPS;*;Pi2$;45| ((|n| |PositiveInteger|) (|x| $) ($ $))
        (SPROG NIL
               (COND ((ZEROP |n|) (|spadConstant| $ 29))
                     ('T
                      (SPADCALL (CONS #'|ISUPS;*;Pi2$;45!0| (VECTOR $ |n|)) |x|
                                (QREFELT $ 69)))))) 

(SDEFUN |ISUPS;*;Pi2$;45!0| ((|z| NIL) ($$ NIL))
        (PROG (|n| $)
          (LETT |n| (QREFELT $$ 1) . #1=(|ISUPS;*;Pi2$;45|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |n| |z| (QREFELT $ 90)))))) 

(SDEFUN |ISUPS;productByTerm|
        ((|coef| |Coef|) (|expon| |Integer|)
         (|x| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|xRefer| |Reference| (|OrderedCompletion| (|Integer|)))
         (|refer| |Reference| (|OrderedCompletion| (|Integer|)))
         (|n| |Integer|)
         ($ |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
        (SPROG NIL
               (|ISUPS;iMap1|
                (CONS #'|ISUPS;productByTerm!0| (VECTOR $ |coef|))
                (CONS #'|ISUPS;productByTerm!1| (VECTOR $ |expon|)) 'T |x|
                |xRefer| |refer| |n| $))) 

(SDEFUN |ISUPS;productByTerm!1| ((|z| NIL) ($$ NIL))
        (PROG (|expon| $)
          (LETT |expon| (QREFELT $$ 1) . #1=(|ISUPS;productByTerm|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z| |expon| (QREFELT $ 50)))))) 

(SDEFUN |ISUPS;productByTerm!0| ((|y| NIL) (|m| NIL) ($$ NIL))
        (PROG (|coef| $)
          (LETT |coef| (QREFELT $$ 1) . #1=(|ISUPS;productByTerm|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |coef| |y| (QREFELT $ 73)))))) 

(SDEFUN |ISUPS;productLazyEval|
        ((|x| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|xRefer| |Reference| (|OrderedCompletion| (|Integer|)))
         (|y| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|yRefer| |Reference| (|OrderedCompletion| (|Integer|)))
         (|nn| |OrderedCompletion| (|Integer|)) ($ |Void|))
        (SPROG
         ((|yDeg| (|OrderedCompletion| (|Integer|)))
          (|xDeg| (|OrderedCompletion| (|Integer|))))
         (SEQ
          (COND
           ((OR (SPADCALL |x| (QREFELT $ 42)) (SPADCALL |y| (QREFELT $ 42)))
            (SPADCALL (QREFELT $ 93)))
           ('T
            (COND
             ((SPADCALL |x| (QREFELT $ 43))
              (COND ((SPADCALL |y| (QREFELT $ 43)) (SPADCALL (QREFELT $ 93)))
                    (#1='T
                     (SEQ
                      (LETT |xDeg|
                            (SPADCALL
                             (|ISUPS;getExpon| (SPADCALL |x| (QREFELT $ 32)) $)
                             (QREFELT $ 33))
                            . #2=(|ISUPS;productLazyEval|))
                      (SEQ G190
                           (COND
                            ((NULL
                              (SPADCALL
                               (SPADCALL |xDeg|
                                         (SPADCALL |yRefer| (QREFELT $ 40))
                                         (QREFELT $ 94))
                               |nn| (QREFELT $ 41)))
                             (GO G191)))
                           (SEQ (EXIT (SPADCALL |y| (QREFELT $ 44)))) NIL
                           (GO G190) G191 (EXIT NIL))
                      (EXIT (SPADCALL (QREFELT $ 93)))))))
             ((SPADCALL |y| (QREFELT $ 43))
              (SEQ
               (LETT |yDeg|
                     (SPADCALL
                      (|ISUPS;getExpon| (SPADCALL |y| (QREFELT $ 32)) $)
                      (QREFELT $ 33))
                     . #2#)
               (SEQ G190
                    (COND
                     ((NULL
                       (SPADCALL
                        (SPADCALL |yDeg| (SPADCALL |xRefer| (QREFELT $ 40))
                                  (QREFELT $ 94))
                        |nn| (QREFELT $ 41)))
                      (GO G191)))
                    (SEQ (EXIT (SPADCALL |x| (QREFELT $ 44)))) NIL (GO G190)
                    G191 (EXIT NIL))
               (EXIT (SPADCALL (QREFELT $ 93)))))
             (#1#
              (SEQ (SPADCALL |x| (QREFELT $ 44))
                   (COND
                    ((SPADCALL |y| (QREFELT $ 95))
                     (SPADCALL |y| (QREFELT $ 44))))
                   (EXIT
                    (|ISUPS;productLazyEval| |x| |xRefer| |y| |yRefer| |nn|
                     $)))))))))) 

(SDEFUN |ISUPS;iTimes|
        ((|x| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|xRefer| |Reference| (|OrderedCompletion| (|Integer|)))
         (|y| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|yRefer| |Reference| (|OrderedCompletion| (|Integer|)))
         (|refer| |Reference| (|OrderedCompletion| (|Integer|)))
         (|n| |Integer|)
         ($ |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|ISUPS;iTimes!0|
                       (VECTOR |refer| $ |n| |yRefer| |y| |xRefer| |x|))
                 (QREFELT $ 53))))) 

(SDEFUN |ISUPS;iTimes!0| (($$ NIL))
        (PROG (|x| |xRefer| |y| |yRefer| |n| $ |refer|)
          (LETT |x| (QREFELT $$ 6) . #1=(|ISUPS;iTimes|))
          (LETT |xRefer| (QREFELT $$ 5) . #1#)
          (LETT |y| (QREFELT $$ 4) . #1#)
          (LETT |yRefer| (QREFELT $$ 3) . #1#)
          (LETT |n| (QREFELT $$ 2) . #1#)
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |refer| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG
             ((|xTerm| NIL) (|xCoef| NIL) (|yTerm| NIL) (|yCoef| NIL)
              (|expon| NIL) (|scRefer| NIL) (|scMult| NIL) (|prRefer| NIL)
              (|pr| NIL) (|sm| NIL) (|coef| NIL) (|xExpon| NIL) (|yExpon| NIL)
              (|degr| NIL) (|xDegr| NIL) (|yDegr| NIL))
             (SEQ
              (|ISUPS;productLazyEval| |x| |xRefer| |y| |yRefer|
               (SPADCALL |n| (QREFELT $ 33)) $)
              (COND
               ((OR (SPADCALL |x| (QREFELT $ 42))
                    (SPADCALL |y| (QREFELT $ 42)))
                (EXIT
                 (SEQ
                  (SPADCALL |refer| (SPADCALL (QREFELT $ 19)) (QREFELT $ 31))
                  (EXIT (SPADCALL (QREFELT $ 14)))))))
              (COND
               ((SPADCALL |x| (QREFELT $ 43))
                (COND
                 ((SPADCALL |y| (QREFELT $ 43))
                  (EXIT
                   (SEQ
                    (LETT |xCoef|
                          (|ISUPS;getCoef|
                           (LETT |xTerm| (SPADCALL |x| (QREFELT $ 32)) NIL) $)
                          NIL)
                    (LETT |xExpon| (|ISUPS;getExpon| |xTerm| $) NIL)
                    (LETT |yCoef|
                          (|ISUPS;getCoef|
                           (LETT |yTerm| (SPADCALL |y| (QREFELT $ 32)) NIL) $)
                          NIL)
                    (LETT |yExpon| (|ISUPS;getExpon| |yTerm| $) NIL)
                    (LETT |expon| (SPADCALL |xExpon| |yExpon| (QREFELT $ 50))
                          NIL)
                    (SPADCALL |refer| (SPADCALL |expon| (QREFELT $ 33))
                              (QREFELT $ 31))
                    (LETT |scRefer|
                          (SPADCALL (SPADCALL |expon| (QREFELT $ 33))
                                    (QREFELT $ 20))
                          NIL)
                    (LETT |scMult|
                          (|ISUPS;productByTerm| |xCoef| |xExpon|
                           (SPADCALL |y| (QREFELT $ 24)) |yRefer| |scRefer|
                           (SPADCALL |yExpon| (|spadConstant| $ 96)
                                     (QREFELT $ 50))
                           $)
                          NIL)
                    (LETT |prRefer|
                          (SPADCALL (SPADCALL |expon| (QREFELT $ 33))
                                    (QREFELT $ 20))
                          NIL)
                    (LETT |pr|
                          (|ISUPS;iTimes| (SPADCALL |x| (QREFELT $ 24))
                           |xRefer| |y| |yRefer| |prRefer|
                           (SPADCALL |expon| (|spadConstant| $ 96)
                                     (QREFELT $ 50))
                           $)
                          NIL)
                    (LETT |sm|
                          (|ISUPS;iPlus1| (ELT $ 82) |scMult| |scRefer| |pr|
                           |prRefer| |refer|
                           (SPADCALL |expon| (|spadConstant| $ 96)
                                     (QREFELT $ 50))
                           $)
                          NIL)
                    (EXIT
                     (COND
                      ((SPADCALL
                        (LETT |coef| (SPADCALL |xCoef| |yCoef| (QREFELT $ 73))
                              NIL)
                        (QREFELT $ 16))
                       |sm|)
                      ('T
                       (SPADCALL (|ISUPS;makeTerm| |expon| |coef| $) |sm|
                                 (QREFELT $ 17)))))))))))
              (EXIT
               (COND
                ((SPADCALL |x| (QREFELT $ 43))
                 (SEQ
                  (LETT |xExpon|
                        (|ISUPS;getExpon| (SPADCALL |x| (QREFELT $ 32)) $) NIL)
                  (LETT |degr|
                        (SPADCALL (SPADCALL |yRefer| (QREFELT $ 40))
                                  (QREFELT $ 51))
                        NIL)
                  (SPADCALL |refer|
                            (SPADCALL (SPADCALL |xExpon| |degr| (QREFELT $ 50))
                                      (QREFELT $ 33))
                            (QREFELT $ 31))
                  (EXIT
                   (|ISUPS;iTimes| |x| |xRefer| |y| |yRefer| |refer|
                    (SPADCALL (SPADCALL |xExpon| |degr| (QREFELT $ 50))
                              (|spadConstant| $ 96) (QREFELT $ 50))
                    $))))
                ((SPADCALL |y| (QREFELT $ 43))
                 (SEQ
                  (LETT |yExpon|
                        (|ISUPS;getExpon| (SPADCALL |y| (QREFELT $ 32)) $) NIL)
                  (LETT |degr|
                        (SPADCALL (SPADCALL |xRefer| (QREFELT $ 40))
                                  (QREFELT $ 51))
                        NIL)
                  (SPADCALL |refer|
                            (SPADCALL (SPADCALL |yExpon| |degr| (QREFELT $ 50))
                                      (QREFELT $ 33))
                            (QREFELT $ 31))
                  (EXIT
                   (|ISUPS;iTimes| |x| |xRefer| |y| |yRefer| |refer|
                    (SPADCALL (SPADCALL |yExpon| |degr| (QREFELT $ 50))
                              (|spadConstant| $ 96) (QREFELT $ 50))
                    $))))
                ('T
                 (SEQ
                  (LETT |xDegr|
                        (SPADCALL (SPADCALL |xRefer| (QREFELT $ 40))
                                  (QREFELT $ 51))
                        NIL)
                  (LETT |yDegr|
                        (SPADCALL (SPADCALL |yRefer| (QREFELT $ 40))
                                  (QREFELT $ 51))
                        NIL)
                  (SPADCALL |refer|
                            (SPADCALL (SPADCALL |xDegr| |yDegr| (QREFELT $ 50))
                                      (QREFELT $ 33))
                            (QREFELT $ 31))
                  (EXIT
                   (|ISUPS;iTimes| |x| |xRefer| |y| |yRefer| |refer|
                    (SPADCALL (SPADCALL |xDegr| |yDegr| (QREFELT $ 50))
                              (|spadConstant| $ 96) (QREFELT $ 50))
                    $)))))))))))) 

(SDEFUN |ISUPS;*;3$;49| ((|ups1| $) (|ups2| $) ($ $))
        (SPROG
         ((|refer| (|Reference| (|OrderedCompletion| (|Integer|))))
          (|deg| (|Integer|)) (|yDeg| #1=(|Integer|)) (#2=#:G677 NIL)
          (|y| #3=(|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|yRefer| #4=(|Reference| (|OrderedCompletion| (|Integer|))))
          (|xDeg| #1#) (|x| #3#) (|xRefer| #4#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |xRefer| (SPADCALL |ups1| (QREFELT $ 12))
                  . #5=(|ISUPS;*;3$;49|))
            (LETT |x| (SPADCALL |ups1| (QREFELT $ 13)) . #5#)
            (LETT |xDeg|
                  (COND
                   ((SPADCALL |x| (QREFELT $ 42))
                    (PROGN
                     (LETT #2# (|spadConstant| $ 29) . #5#)
                     (GO #6=#:G676)))
                   ((SPADCALL |x| (QREFELT $ 43))
                    (- (|ISUPS;getExpon| (SPADCALL |x| (QREFELT $ 32)) $) 1))
                   (#7='T
                    (SPADCALL (SPADCALL |xRefer| (QREFELT $ 40))
                              (QREFELT $ 51))))
                  . #5#)
            (LETT |yRefer| (SPADCALL |ups2| (QREFELT $ 12)) . #5#)
            (LETT |y| (SPADCALL |ups2| (QREFELT $ 13)) . #5#)
            (LETT |yDeg|
                  (COND
                   ((SPADCALL |y| (QREFELT $ 42))
                    (PROGN (LETT #2# (|spadConstant| $ 29) . #5#) (GO #6#)))
                   ((SPADCALL |y| (QREFELT $ 43))
                    (- (|ISUPS;getExpon| (SPADCALL |y| (QREFELT $ 32)) $) 1))
                   (#7#
                    (SPADCALL (SPADCALL |yRefer| (QREFELT $ 40))
                              (QREFELT $ 51))))
                  . #5#)
            (LETT |deg| (+ (+ |xDeg| |yDeg|) 1) . #5#)
            (LETT |refer|
                  (SPADCALL (SPADCALL |deg| (QREFELT $ 33)) (QREFELT $ 20))
                  . #5#)
            (EXIT
             (SPADCALL |refer|
                       (|ISUPS;iTimes| |x| |xRefer| |y| |yRefer| |refer|
                        (+ |deg| 1) $)
                       (QREFELT $ 11)))))
          #6# (EXIT #2#)))) 

(SDEFUN |ISUPS;iDivide|
        ((|x| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|xRefer| |Reference| (|OrderedCompletion| (|Integer|)))
         (|y| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|yRefer| |Reference| (|OrderedCompletion| (|Integer|)))
         (|rym| |Coef|) (|m| |Integer|)
         (|refer| |Reference| (|OrderedCompletion| (|Integer|)))
         (|n| |Integer|)
         ($ |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|ISUPS;iDivide!0|
                       (VECTOR |yRefer| |y| |rym| |xRefer| |m| |n| |refer| $
                               |x|))
                 (QREFELT $ 53))))) 

(SDEFUN |ISUPS;iDivide!0| (($$ NIL))
        (PROG (|x| $ |refer| |n| |m| |xRefer| |rym| |y| |yRefer|)
          (LETT |x| (QREFELT $$ 8) . #1=(|ISUPS;iDivide|))
          (LETT $ (QREFELT $$ 7) . #1#)
          (LETT |refer| (QREFELT $$ 6) . #1#)
          (LETT |n| (QREFELT $$ 5) . #1#)
          (LETT |m| (QREFELT $$ 4) . #1#)
          (LETT |xRefer| (QREFELT $$ 3) . #1#)
          (LETT |rym| (QREFELT $$ 2) . #1#)
          (LETT |y| (QREFELT $$ 1) . #1#)
          (LETT |yRefer| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG
             ((|nm| NIL) (|xTerm| NIL) (|newCoef| NIL) (|nx| NIL)
              (|prodRefer| NIL) (|prod| NIL) (|sumRefer| NIL) (|sum| NIL)
              (|term| NIL) (|degr| NIL))
             (SEQ
              (COND
               ((SPADCALL |x| (QREFELT $ 42))
                (SEQ
                 (SPADCALL |refer| (SPADCALL (QREFELT $ 19)) (QREFELT $ 31))
                 (EXIT (SPADCALL (QREFELT $ 14)))))
               ('T
                (SEQ
                 (LETT |nm|
                       (SPADCALL (SPADCALL |n| |m| (QREFELT $ 50))
                                 (QREFELT $ 33))
                       NIL)
                 (SEQ G190
                      (COND
                       ((NULL
                         (SPADCALL (SPADCALL |xRefer| (QREFELT $ 40)) |nm|
                                   (QREFELT $ 41)))
                        (GO G191)))
                      (SEQ (EXIT (SPADCALL |x| (QREFELT $ 44)))) NIL (GO G190)
                      G191 (EXIT NIL))
                 (EXIT
                  (COND
                   ((SPADCALL |x| (QREFELT $ 42))
                    (SEQ
                     (SPADCALL |refer| (SPADCALL (QREFELT $ 19))
                               (QREFELT $ 31))
                     (EXIT (SPADCALL (QREFELT $ 14)))))
                   ((SPADCALL |x| (QREFELT $ 43))
                    (SEQ
                     (LETT |newCoef|
                           (SPADCALL
                            (|ISUPS;getCoef|
                             (LETT |xTerm| (SPADCALL |x| (QREFELT $ 32)) NIL)
                             $)
                            |rym| (QREFELT $ 73))
                           NIL)
                     (LETT |nx| (|ISUPS;getExpon| |xTerm| $) NIL)
                     (LETT |prodRefer|
                           (SPADCALL (SPADCALL |nx| (QREFELT $ 33))
                                     (QREFELT $ 20))
                           NIL)
                     (LETT |prod|
                           (|ISUPS;productByTerm|
                            (SPADCALL |newCoef| (QREFELT $ 85))
                            (SPADCALL |nx| |m| (QREFELT $ 71))
                            (SPADCALL |y| (QREFELT $ 24)) |yRefer| |prodRefer|
                            (|spadConstant| $ 96) $)
                           NIL)
                     (LETT |sumRefer|
                           (SPADCALL (SPADCALL |nx| (QREFELT $ 33))
                                     (QREFELT $ 20))
                           NIL)
                     (LETT |sum|
                           (|ISUPS;iPlus1| (ELT $ 82)
                            (SPADCALL |x| (QREFELT $ 24)) |xRefer| |prod|
                            |prodRefer| |sumRefer|
                            (SPADCALL |nx| (|spadConstant| $ 96)
                                      (QREFELT $ 50))
                            $)
                           NIL)
                     (SPADCALL |refer|
                               (SPADCALL (SPADCALL |nx| |m| (QREFELT $ 71))
                                         (QREFELT $ 33))
                               (QREFELT $ 31))
                     (LETT |term|
                           (|ISUPS;makeTerm| (SPADCALL |nx| |m| (QREFELT $ 71))
                            |newCoef| $)
                           NIL)
                     (EXIT
                      (SPADCALL |term|
                                (|ISUPS;iDivide| |sum| |sumRefer| |y| |yRefer|
                                 |rym| |m| |refer|
                                 (SPADCALL (SPADCALL |nx| |m| (QREFELT $ 71))
                                           (|spadConstant| $ 96)
                                           (QREFELT $ 50))
                                 $)
                                (QREFELT $ 17)))))
                   ('T
                    (SEQ
                     (LETT |degr|
                           (SPADCALL (SPADCALL |xRefer| (QREFELT $ 40))
                                     (QREFELT $ 51))
                           NIL)
                     (SPADCALL |refer|
                               (SPADCALL (SPADCALL |degr| |m| (QREFELT $ 71))
                                         (QREFELT $ 33))
                               (QREFELT $ 31))
                     (EXIT
                      (|ISUPS;iDivide| |x| |xRefer| |y| |yRefer| |rym| |m|
                       |refer|
                       (SPADCALL (SPADCALL |degr| |m| (QREFELT $ 71))
                                 (|spadConstant| $ 96) (QREFELT $ 50))
                       $))))))))))))))) 

(SDEFUN |ISUPS;divide|
        ((|ups1| $) (|deg1| |Integer|) (|ups2| $) (|deg2| |Integer|)
         (|r| |Coef|) ($ $))
        (SPROG
         ((|refer| (|Reference| (|OrderedCompletion| (|Integer|))))
          (|y| #1=(|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|yRefer| #2=(|Reference| (|OrderedCompletion| (|Integer|))))
          (|x| #1#) (|xRefer| #2#))
         (SEQ
          (LETT |xRefer| (SPADCALL |ups1| (QREFELT $ 12))
                . #3=(|ISUPS;divide|))
          (LETT |x| (SPADCALL |ups1| (QREFELT $ 13)) . #3#)
          (LETT |yRefer| (SPADCALL |ups2| (QREFELT $ 12)) . #3#)
          (LETT |y| (SPADCALL |ups2| (QREFELT $ 13)) . #3#)
          (LETT |refer|
                (SPADCALL (SPADCALL (- |deg1| |deg2|) (QREFELT $ 33))
                          (QREFELT $ 20))
                . #3#)
          (EXIT
           (SPADCALL |refer|
                     (|ISUPS;iDivide| |x| |xRefer| |y| |yRefer| |r| |deg2|
                      |refer| (+ (- |deg1| |deg2|) 1) $)
                     (QREFELT $ 11)))))) 

(SDEFUN |ISUPS;iExquo;2$BU;52|
        ((|ups1| $) (|ups2| $) (|taylor?| |Boolean|) ($ |Union| $ "failed"))
        (SPROG
         ((|nx| (|Integer|)) (#1=#:G732 NIL) (#2=#:G734 NIL)
          (|deg| #3=(|Integer|)) (|nn| (|OrderedCompletion| (|Integer|)))
          (|ry| (|Union| |Coef| "failed")) (|ny| #3#) (|yCoef| (|Coef|))
          (|yTerm| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
          (#4=#:G733 NIL) (|n| (|Integer|))
          (|y| #5=(|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|yRefer| #6=(|Reference| (|OrderedCompletion| (|Integer|))))
          (|x| #5#) (|xRefer| #6#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |xRefer| (SPADCALL |ups1| (QREFELT $ 12))
                  . #7=(|ISUPS;iExquo;2$BU;52|))
            (LETT |x| (SPADCALL |ups1| (QREFELT $ 13)) . #7#)
            (LETT |yRefer| (SPADCALL |ups2| (QREFELT $ 12)) . #7#)
            (LETT |y| (SPADCALL |ups2| (QREFELT $ 13)) . #7#)
            (LETT |n| 0 . #7#)
            (SEQ G190
                 (COND ((NULL (NULL (SPADCALL |y| (QREFELT $ 43)))) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |y| (QREFELT $ 42))
                     (PROGN (LETT #2# (CONS 1 "failed") . #7#) (GO #8=#:G731)))
                    ('T
                     (SEQ
                      (EXIT
                       (SEQ (SPADCALL |y| (QREFELT $ 44))
                            (LETT |n| (+ |n| 1) . #7#)
                            (EXIT
                             (COND
                              ((SPADCALL |n| 1000 (QREFELT $ 47))
                               (PROGN
                                (LETT #4#
                                      (PROGN
                                       (LETT #2# (CONS 1 "failed") . #7#)
                                       (GO #8#))
                                      . #7#)
                                (GO #9=#:G712)))))))
                      #9# (EXIT #4#))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (LETT |yCoef|
                  (|ISUPS;getCoef|
                   (LETT |yTerm| (SPADCALL |y| (QREFELT $ 32)) . #7#) $)
                  . #7#)
            (LETT |ny| (|ISUPS;getExpon| |yTerm| $) . #7#)
            (LETT |ry| (SPADCALL |yCoef| (QREFELT $ 99)) . #7#)
            (EXIT
             (COND ((QEQCAR |ry| 1) (CONS 1 "failed"))
                   (#10='T
                    (SEQ (LETT |nn| (SPADCALL |ny| (QREFELT $ 33)) . #7#)
                         (COND
                          (|taylor?|
                           (SEQ G190
                                (COND
                                 ((NULL
                                   (SPADCALL (SPADCALL |xRefer| (QREFELT $ 40))
                                             |nn| (QREFELT $ 41)))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((SPADCALL |x| (QREFELT $ 42))
                                    (PROGN
                                     (LETT #2# (CONS 0 (|spadConstant| $ 29))
                                           . #7#)
                                     (GO #8#)))
                                   ((SPADCALL |x| (QREFELT $ 43))
                                    (PROGN
                                     (LETT #2# (CONS 1 "failed") . #7#)
                                     (GO #8#)))
                                   ('T (SPADCALL |x| (QREFELT $ 44))))))
                                NIL (GO G190) G191 (EXIT NIL))))
                         (EXIT
                          (COND
                           ((SPADCALL (SPADCALL |y| (QREFELT $ 24))
                                      (QREFELT $ 23))
                            (CONS 0
                                  (|ISUPS;iMap2|
                                   (CONS #'|ISUPS;iExquo;2$BU;52!0|
                                         (VECTOR $ |ry|))
                                   (CONS #'|ISUPS;iExquo;2$BU;52!1|
                                         (VECTOR $ |ny|))
                                   NIL |ups1| $)))
                           ((SPADCALL |x| (QREFELT $ 42))
                            (CONS 0 (|spadConstant| $ 29)))
                           (#10#
                            (SEQ
                             (LETT |nx|
                                   (COND
                                    ((SPADCALL |x| (QREFELT $ 43))
                                     (SEQ
                                      (EXIT
                                       (SEQ
                                        (SEQ
                                         (LETT |deg|
                                               (|ISUPS;getExpon|
                                                (SPADCALL |x| (QREFELT $ 32))
                                                $)
                                               . #7#)
                                         (EXIT
                                          (COND
                                           ((< |deg| |ny|)
                                            (COND
                                             (|taylor?|
                                              (PROGN
                                               (LETT #1#
                                                     (PROGN
                                                      (LETT #2#
                                                            (CONS 1 "failed")
                                                            . #7#)
                                                      (GO #8#))
                                                     . #7#)
                                               (GO #11=#:G725))))))))
                                        (EXIT (- |deg| 1))))
                                      #11# (EXIT #1#)))
                                    (#10#
                                     (SPADCALL
                                      (SPADCALL |xRefer| (QREFELT $ 40))
                                      (QREFELT $ 51))))
                                   . #7#)
                             (EXIT
                              (CONS 0
                                    (|ISUPS;divide| |ups1| |nx| |ups2| |ny|
                                     (QCDR |ry|) $)))))))))))))
          #8# (EXIT #2#)))) 

(SDEFUN |ISUPS;iExquo;2$BU;52!1| ((|z| NIL) ($$ NIL))
        (PROG (|ny| $)
          (LETT |ny| (QREFELT $$ 1) . #1=(|ISUPS;iExquo;2$BU;52|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z| |ny| (QREFELT $ 71)))))) 

(SDEFUN |ISUPS;iExquo;2$BU;52!0| ((|y1| NIL) (|m| NIL) ($$ NIL))
        (PROG (|ry| $)
          (LETT |ry| (QREFELT $$ 1) . #1=(|ISUPS;iExquo;2$BU;52|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |y1| (QCDR |ry|) (QREFELT $ 73)))))) 

(SDEFUN |ISUPS;taylorQuoByVar;2$;53| ((|ups| $) ($ $))
        (|ISUPS;iMap2| (LIST #'|ISUPS;taylorQuoByVar;2$;53!0|)
         (CONS #'|ISUPS;taylorQuoByVar;2$;53!1| $) NIL
         (SPADCALL |ups|
                   (SPADCALL (SPADCALL |ups| 0 (QREFELT $ 57)) 0
                             (QREFELT $ 22))
                   (QREFELT $ 66))
         $)) 

(SDEFUN |ISUPS;taylorQuoByVar;2$;53!1| ((|z| NIL) ($ NIL))
        (SPADCALL |z| (|spadConstant| $ 49) (QREFELT $ 71))) 

(SDEFUN |ISUPS;taylorQuoByVar;2$;53!0| ((|y| NIL) (|n| NIL) ($$ NIL)) |y|) 

(SDEFUN |ISUPS;compose0|
        ((|x| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|xRefer| |Reference| (|OrderedCompletion| (|Integer|)))
         (|y| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|yRefer| |Reference| (|OrderedCompletion| (|Integer|)))
         (|yOrd| |Integer|) (|y1| $) (|yn0| $) (|n0| |Integer|)
         (|refer| |Reference| (|OrderedCompletion| (|Integer|)))
         (|n| |Integer|)
         ($ |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|ISUPS;compose0!2|
                       (VECTOR |n0| |yn0| |y1| |yRefer| |y| |xRefer| |yOrd| |n|
                               |refer| $ |x|))
                 (QREFELT $ 53))))) 

(SDEFUN |ISUPS;compose0!2| (($$ NIL))
        (PROG (|x| $ |refer| |n| |yOrd| |xRefer| |y| |yRefer| |y1| |yn0| |n0|)
          (LETT |x| (QREFELT $$ 10) . #1=(|ISUPS;compose0|))
          (LETT $ (QREFELT $$ 9) . #1#)
          (LETT |refer| (QREFELT $$ 8) . #1#)
          (LETT |n| (QREFELT $$ 7) . #1#)
          (LETT |yOrd| (QREFELT $$ 6) . #1#)
          (LETT |xRefer| (QREFELT $$ 5) . #1#)
          (LETT |y| (QREFELT $$ 4) . #1#)
          (LETT |yRefer| (QREFELT $$ 3) . #1#)
          (LETT |y1| (QREFELT $$ 2) . #1#)
          (LETT |yn0| (QREFELT $$ 1) . #1#)
          (LETT |n0| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG
             ((|nn| NIL) (|yyOrd| NIL) (|xTerm| NIL) (|xCoef| NIL) (|n1| NIL)
              (#2=#:G768 NIL) (|yn1| NIL) (|z| NIL) (|zRefer| NIL)
              (|prodRefer| NIL) (|prod| NIL) (|coRefer| NIL) (|co| NIL)
              (|degr| NIL))
             (SEQ
              (COND
               ((SPADCALL |x| (QREFELT $ 42))
                (SEQ
                 (SPADCALL |refer| (SPADCALL (QREFELT $ 19)) (QREFELT $ 31))
                 (EXIT (SPADCALL (QREFELT $ 14)))))
               ('T
                (SEQ (LETT |nn| (SPADCALL |n| (QREFELT $ 33)) NIL)
                     (LETT |yyOrd| (SPADCALL |yOrd| (QREFELT $ 33)) NIL)
                     (SEQ G190
                          (COND
                           ((NULL
                             (SPADCALL
                              (SPADCALL |yyOrd|
                                        (SPADCALL |xRefer| (QREFELT $ 40))
                                        (QREFELT $ 102))
                              |nn| (QREFELT $ 41)))
                            (GO G191)))
                          (SEQ (EXIT (SPADCALL |x| (QREFELT $ 44)))) NIL
                          (GO G190) G191 (EXIT NIL))
                     (EXIT
                      (COND
                       ((SPADCALL |x| (QREFELT $ 43))
                        (SEQ
                         (LETT |xCoef|
                               (|ISUPS;getCoef|
                                (LETT |xTerm| (SPADCALL |x| (QREFELT $ 32))
                                      NIL)
                                $)
                               NIL)
                         (LETT |n1| (|ISUPS;getExpon| |xTerm| $) NIL)
                         (EXIT
                          (COND
                           ((SPADCALL |n1| (QREFELT $ 103))
                            (SEQ
                             (SPADCALL |refer| (SPADCALL |n1| (QREFELT $ 33))
                                       (QREFELT $ 31))
                             (EXIT
                              (SPADCALL (|ISUPS;makeTerm| |n1| |xCoef| $)
                                        (|ISUPS;compose0|
                                         (SPADCALL |x| (QREFELT $ 24)) |xRefer|
                                         |y| |yRefer| |yOrd| |y1| |yn0| |n0|
                                         |refer|
                                         (SPADCALL |n1| (|spadConstant| $ 96)
                                                   (QREFELT $ 50))
                                         $)
                                        (QREFELT $ 17)))))
                           ('T
                            (SEQ
                             (LETT |yn1|
                                   (SPADCALL |yn0|
                                             (SPADCALL |y1|
                                                       (PROG1
                                                           (LETT #2#
                                                                 (SPADCALL |n1|
                                                                           |n0|
                                                                           (QREFELT
                                                                            $
                                                                            71))
                                                                 NIL)
                                                         (|check_subtype2|
                                                          (>= #2# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #2#))
                                                       (QREFELT $ 104))
                                             (QREFELT $ 97))
                                   NIL)
                             (LETT |z| (SPADCALL |yn1| (QREFELT $ 13)) NIL)
                             (LETT |zRefer| (SPADCALL |yn1| (QREFELT $ 12))
                                   NIL)
                             (LETT |degr|
                                   (SPADCALL |yOrd| |n1| (QREFELT $ 105)) NIL)
                             (LETT |prodRefer|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL |degr| (|spadConstant| $ 96)
                                               (QREFELT $ 71))
                                     (QREFELT $ 33))
                                    (QREFELT $ 20))
                                   NIL)
                             (LETT |prod|
                                   (|ISUPS;iMap1|
                                    (CONS #'|ISUPS;compose0!0|
                                          (VECTOR $ |xCoef|))
                                    (LIST #'|ISUPS;compose0!1|) 'T |z| |zRefer|
                                    |prodRefer| |degr| $)
                                   NIL)
                             (LETT |coRefer|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |degr| |yOrd| (QREFELT $ 50))
                                      (|spadConstant| $ 96) (QREFELT $ 71))
                                     (QREFELT $ 33))
                                    (QREFELT $ 20))
                                   NIL)
                             (LETT |co|
                                   (|ISUPS;compose0|
                                    (SPADCALL |x| (QREFELT $ 24)) |xRefer| |y|
                                    |yRefer| |yOrd| |y1| |yn1| |n1| |coRefer|
                                    (SPADCALL |degr| |yOrd| (QREFELT $ 50)) $)
                                   NIL)
                             (SPADCALL |refer|
                                       (SPADCALL
                                        (SPADCALL |degr| (|spadConstant| $ 96)
                                                  (QREFELT $ 71))
                                        (QREFELT $ 33))
                                       (QREFELT $ 31))
                             (EXIT
                              (|ISUPS;iPlus1| (ELT $ 82) |prod| |prodRefer|
                               |co| |coRefer| |refer| |degr| $))))))))
                       ('T
                        (SEQ
                         (LETT |degr|
                               (SPADCALL |yOrd|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |xRefer| (QREFELT $ 40))
                                           (QREFELT $ 51))
                                          (|spadConstant| $ 96) (QREFELT $ 50))
                                         (QREFELT $ 105))
                               NIL)
                         (SPADCALL |refer|
                                   (SPADCALL
                                    (SPADCALL |degr| (|spadConstant| $ 96)
                                              (QREFELT $ 71))
                                    (QREFELT $ 33))
                                   (QREFELT $ 31))
                         (EXIT
                          (|ISUPS;compose0| |x| |xRefer| |y| |yRefer| |yOrd|
                           |y1| |yn0| |n0| |refer| |degr| $))))))))))))))) 

(SDEFUN |ISUPS;compose0!1| ((|m| NIL) ($$ NIL)) |m|) 

(SDEFUN |ISUPS;compose0!0| ((|s| NIL) (|k| NIL) ($$ NIL))
        (PROG (|xCoef| $)
          (LETT |xCoef| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |xCoef| |s| (QREFELT $ 73)))))) 

(SDEFUN |ISUPS;iCompose;3$;55| ((|ups1| $) (|ups2| $) ($ $))
        (SPROG
         ((|compRefer| (|Reference| (|OrderedCompletion| (|Integer|))))
          (|yOrd| (|Integer|)) (#1=#:G787 NIL) (#2=#:G788 NIL) (|i| NIL)
          (|n| (|Integer|))
          (|yRefer| #3=(|Reference| (|OrderedCompletion| (|Integer|))))
          (|y| #4=(|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|xRefer| #3#) (|x| #4#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |x| (SPADCALL |ups1| (QREFELT $ 13))
                  . #5=(|ISUPS;iCompose;3$;55|))
            (LETT |xRefer| (SPADCALL |ups1| (QREFELT $ 12)) . #5#)
            (LETT |y| (SPADCALL |ups2| (QREFELT $ 13)) . #5#)
            (LETT |yRefer| (SPADCALL |ups2| (QREFELT $ 12)) . #5#)
            (LETT |n| |$streamCount| . #5#)
            (SEQ (LETT |i| 1 . #5#) (LETT #2# |n| . #5#) G190
                 (COND
                  ((OR (|greater_SI| |i| #2#)
                       (NULL (NULL (SPADCALL |y| (QREFELT $ 43)))))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |y| (QREFELT $ 42))
                     (PROGN
                      (LETT #1#
                            (SPADCALL (SPADCALL |ups1| 0 (QREFELT $ 57))
                                      (QREFELT $ 27))
                            . #5#)
                      (GO #6=#:G786)))
                    ('T (SPADCALL |y| (QREFELT $ 44))))))
                 (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (COND
              ((SPADCALL |y| (QREFELT $ 42))
               (SPADCALL (SPADCALL |ups1| 0 (QREFELT $ 57)) (QREFELT $ 27)))
              (#7='T
               (SEQ
                (LETT |yOrd|
                      (COND
                       ((SPADCALL |y| (QREFELT $ 43))
                        (|ISUPS;getExpon| (SPADCALL |y| (QREFELT $ 32)) $))
                       (#7#
                        (SPADCALL (SPADCALL |yRefer| (QREFELT $ 40))
                                  (QREFELT $ 51))))
                      . #5#)
                (LETT |compRefer|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 106) (QREFELT $ 107))
                       (QREFELT $ 20))
                      . #5#)
                (EXIT
                 (SPADCALL |compRefer|
                           (|ISUPS;compose0| |x| |xRefer| |y| |yRefer| |yOrd|
                            |ups2| (|spadConstant| $ 38) 0 |compRefer| 0 $)
                           (QREFELT $ 11)))))))))
          #6# (EXIT #1#)))) 

(SDEFUN |ISUPS;integrate;2$;56| ((|x| $) ($ $))
        (|ISUPS;iMap2| (CONS #'|ISUPS;integrate;2$;56!0| $)
         (CONS #'|ISUPS;integrate;2$;56!1| $) 'T |x| $)) 

(SDEFUN |ISUPS;integrate;2$;56!1| ((|z| NIL) ($ NIL))
        (SPADCALL |z| (|spadConstant| $ 49) (QREFELT $ 50))) 

(SDEFUN |ISUPS;integrate;2$;56!0| ((|y| NIL) (|n| NIL) ($ NIL))
        (SPADCALL
         (SPADCALL (|spadConstant| $ 49)
                   (SPADCALL |n| (|spadConstant| $ 49) (QREFELT $ 50))
                   (QREFELT $ 110))
         |y| (QREFELT $ 111))) 

(SDEFUN |ISUPS;integ0|
        ((|x| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|intRef| |Reference| (|OrderedCompletion| (|Integer|)))
         (|ansRef| |Reference| (|OrderedCompletion| (|Integer|)))
         (|n| |Integer|)
         ($ |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|ISUPS;integ0!0| (VECTOR |ansRef| |x| |intRef| $ |n|))
                 (QREFELT $ 53))))) 

(SDEFUN |ISUPS;integ0!0| (($$ NIL))
        (PROG (|n| $ |intRef| |x| |ansRef|)
          (LETT |n| (QREFELT $$ 4) . #1=(|ISUPS;integ0|))
          (LETT $ (QREFELT $$ 3) . #1#)
          (LETT |intRef| (QREFELT $$ 2) . #1#)
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT |ansRef| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG
             ((|nLess1| NIL) (|xTerm| NIL) (|xCoef| NIL) (|nx| NIL) (|n1| NIL)
              (|degr| NIL))
             (SEQ
              (LETT |nLess1|
                    (SPADCALL
                     (SPADCALL |n| (|spadConstant| $ 96) (QREFELT $ 71))
                     (QREFELT $ 33))
                    NIL)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL (SPADCALL |intRef| (QREFELT $ 40)) |nLess1|
                                (QREFELT $ 41)))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |x| (QREFELT $ 44)))) NIL (GO G190)
                   G191 (EXIT NIL))
              (EXIT
               (COND
                ((SPADCALL |x| (QREFELT $ 42))
                 (SEQ
                  (SPADCALL |ansRef| (SPADCALL (QREFELT $ 19)) (QREFELT $ 31))
                  (EXIT (SPADCALL (QREFELT $ 14)))))
                ((SPADCALL |x| (QREFELT $ 43))
                 (SEQ
                  (LETT |xCoef|
                        (|ISUPS;getCoef|
                         (LETT |xTerm| (SPADCALL |x| (QREFELT $ 32)) NIL) $)
                        NIL)
                  (LETT |nx| (|ISUPS;getExpon| |xTerm| $) NIL)
                  (SPADCALL |ansRef|
                            (SPADCALL
                             (LETT |n1|
                                   (SPADCALL |nx| (|spadConstant| $ 96)
                                             (QREFELT $ 50))
                                   NIL)
                             (QREFELT $ 33))
                            (QREFELT $ 31))
                  (EXIT
                   (SPADCALL
                    (|ISUPS;makeTerm| |n1|
                     (SPADCALL
                      (SPADCALL (SPADCALL |n1| (QREFELT $ 113))
                                (QREFELT $ 114))
                      |xCoef| (QREFELT $ 111))
                     $)
                    (|ISUPS;integ0| (SPADCALL |x| (QREFELT $ 24)) |intRef|
                     |ansRef| |n1| $)
                    (QREFELT $ 17)))))
                ('T
                 (SEQ
                  (LETT |degr|
                        (SPADCALL (SPADCALL |intRef| (QREFELT $ 40))
                                  (QREFELT $ 51))
                        NIL)
                  (SPADCALL |ansRef|
                            (SPADCALL
                             (SPADCALL |degr| (|spadConstant| $ 96)
                                       (QREFELT $ 50))
                             (QREFELT $ 33))
                            (QREFELT $ 31))
                  (EXIT
                   (|ISUPS;integ0| |x| |intRef| |ansRef|
                    (SPADCALL |degr| 2 (QREFELT $ 50)) $)))))))))))) 

(SDEFUN |ISUPS;integ1|
        ((|x| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|intRef| |Reference| (|OrderedCompletion| (|Integer|)))
         (|ansRef| |Reference| (|OrderedCompletion| (|Integer|)))
         ($ |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
        (|ISUPS;integ0| |x| |intRef| |ansRef| 1 $)) 

(SDEFUN |ISUPS;lazyInteg|
        ((|a| |Coef|)
         (|xf| |Mapping|
          (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
         (|intRef| |Reference| (|OrderedCompletion| (|Integer|)))
         (|ansRef| |Reference| (|OrderedCompletion| (|Integer|)))
         ($ |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
        (SPROG
         ((|ansStr|
           (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))))
         (SEQ
          (LETT |ansStr|
                (|ISUPS;integ1| (SPADCALL |xf| (QREFELT $ 53)) |intRef|
                 |ansRef| $)
                |ISUPS;lazyInteg|)
          (EXIT
           (SPADCALL (|ISUPS;makeTerm| 0 |a| $) |ansStr| (QREFELT $ 17)))))) 

(SDEFUN |ISUPS;cPower;$Coef$;60| ((|f| $) (|r| |Coef|) ($ $))
        (SPROG
         ((|ansStr|
           (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|ansRef| #1=(|Reference| (|OrderedCompletion| (|Integer|))))
          (|intRef| #1#)
          (|yStr| (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|yRef| (|Reference| (|OrderedCompletion| (|Integer|)))) (|y| ($))
          (|fInv| ($)) (#2=#:G820 NIL) (|fp| ($)))
         (SEQ
          (LETT |fp| (SPADCALL |f| (QREFELT $ 72))
                . #3=(|ISUPS;cPower;$Coef$;60|))
          (LETT |fInv|
                (PROG2
                    (LETT #2#
                          (SPADCALL (|spadConstant| $ 38) |f| NIL
                                    (QREFELT $ 100))
                          . #3#)
                    (QCDR #2#)
                  (|check_union2| (QEQCAR #2# 0) $ (|Union| $ "failed") #2#))
                . #3#)
          (LETT |y|
                (SPADCALL (SPADCALL |r| |fp| (QREFELT $ 115)) |fInv|
                          (QREFELT $ 97))
                . #3#)
          (LETT |yRef| (SPADCALL |y| (QREFELT $ 12)) . #3#)
          (LETT |yStr| (SPADCALL |y| (QREFELT $ 13)) . #3#)
          (LETT |intRef|
                (SPADCALL (SPADCALL (|spadConstant| $ 106) (QREFELT $ 107))
                          (QREFELT $ 20))
                . #3#)
          (LETT |ansRef| (SPADCALL (|spadConstant| $ 116) (QREFELT $ 20))
                . #3#)
          (LETT |ansStr|
                (SPADCALL
                 (CONS #'|ISUPS;cPower;$Coef$;60!1|
                       (VECTOR |ansRef| |yStr| |yRef| |intRef| $))
                 (QREFELT $ 120))
                . #3#)
          (EXIT (SPADCALL |ansRef| |ansStr| (QREFELT $ 11)))))) 

(SDEFUN |ISUPS;cPower;$Coef$;60!1| ((|s| NIL) ($$ NIL))
        (PROG ($ |intRef| |yRef| |yStr| |ansRef|)
          (LETT $ (QREFELT $$ 4) . #1=(|ISUPS;cPower;$Coef$;60|))
          (LETT |intRef| (QREFELT $$ 3) . #1#)
          (LETT |yRef| (QREFELT $$ 2) . #1#)
          (LETT |yStr| (QREFELT $$ 1) . #1#)
          (LETT |ansRef| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (|ISUPS;lazyInteg| (|spadConstant| $ 39)
                    (CONS #'|ISUPS;cPower;$Coef$;60!0|
                          (VECTOR $ |intRef| |yRef| |yStr| |ansRef| |s|))
                    |intRef| |ansRef| $)))))) 

(SDEFUN |ISUPS;cPower;$Coef$;60!0| (($$ NIL))
        (PROG (|s| |ansRef| |yStr| |yRef| |intRef| $)
          (LETT |s| (QREFELT $$ 5) NIL)
          (LETT |ansRef| (QREFELT $$ 4) NIL)
          (LETT |yStr| (QREFELT $$ 3) NIL)
          (LETT |yRef| (QREFELT $$ 2) NIL)
          (LETT |intRef| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (|ISUPS;iTimes| |s| |ansRef| |yStr| |yRef| |intRef|
             (|spadConstant| $ 117) $))))) 

(SDEFUN |ISUPS;iExp| ((|f| $) (|cc| |Coef|) ($ $))
        (SPROG
         ((|ansStr|
           (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|ansRef| #1=(|Reference| (|OrderedCompletion| (|Integer|))))
          (|intRef| #1#)
          (|fpStr|
           (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|fpRef| (|Reference| (|OrderedCompletion| (|Integer|)))) (|fp| ($)))
         (SEQ (LETT |fp| (SPADCALL |f| (QREFELT $ 72)) . #2=(|ISUPS;iExp|))
              (LETT |fpRef| (SPADCALL |fp| (QREFELT $ 12)) . #2#)
              (LETT |fpStr| (SPADCALL |fp| (QREFELT $ 13)) . #2#)
              (LETT |intRef|
                    (SPADCALL (SPADCALL (|spadConstant| $ 106) (QREFELT $ 107))
                              (QREFELT $ 20))
                    . #2#)
              (LETT |ansRef| (SPADCALL (|spadConstant| $ 116) (QREFELT $ 20))
                    . #2#)
              (LETT |ansStr|
                    (SPADCALL
                     (CONS #'|ISUPS;iExp!1|
                           (VECTOR |ansRef| |fpStr| |fpRef| |intRef| $ |cc|))
                     (QREFELT $ 120))
                    . #2#)
              (EXIT (SPADCALL |ansRef| |ansStr| (QREFELT $ 11)))))) 

(SDEFUN |ISUPS;iExp!1| ((|s| NIL) ($$ NIL))
        (PROG (|cc| $ |intRef| |fpRef| |fpStr| |ansRef|)
          (LETT |cc| (QREFELT $$ 5) . #1=(|ISUPS;iExp|))
          (LETT $ (QREFELT $$ 4) . #1#)
          (LETT |intRef| (QREFELT $$ 3) . #1#)
          (LETT |fpRef| (QREFELT $$ 2) . #1#)
          (LETT |fpStr| (QREFELT $$ 1) . #1#)
          (LETT |ansRef| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (|ISUPS;lazyInteg| |cc|
                    (CONS #'|ISUPS;iExp!0|
                          (VECTOR $ |intRef| |fpRef| |fpStr| |ansRef| |s|))
                    |intRef| |ansRef| $)))))) 

(SDEFUN |ISUPS;iExp!0| (($$ NIL))
        (PROG (|s| |ansRef| |fpStr| |fpRef| |intRef| $)
          (LETT |s| (QREFELT $$ 5) NIL)
          (LETT |ansRef| (QREFELT $$ 4) NIL)
          (LETT |fpStr| (QREFELT $$ 3) NIL)
          (LETT |fpRef| (QREFELT $$ 2) NIL)
          (LETT |intRef| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (|ISUPS;iTimes| |s| |ansRef| |fpStr| |fpRef| |intRef|
             (|spadConstant| $ 122) $))))) 

(SDEFUN |ISUPS;sincos0|
        ((|sinc| |Coef|) (|cosc| |Coef|)
         (|list| |List|
          (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
         (|sinRef| |Reference| (|OrderedCompletion| (|Integer|)))
         (|cosRef| |Reference| (|OrderedCompletion| (|Integer|)))
         (|fpStr| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|fpRef| |Reference| (|OrderedCompletion| (|Integer|)))
         (|fpStr2| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|fpRef2| |Reference| (|OrderedCompletion| (|Integer|)))
         ($ |List|
          (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))))
        (SPROG
         ((|prodStr2|
           #1=(|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|prodStr1| #1#)
          (|prodRef2| #2=(|Reference| (|OrderedCompletion| (|Integer|))))
          (|prodRef1| #2#)
          (|cosStr|
           (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|sinStr|
           (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))))
         (SEQ (LETT |sinStr| (|SPADfirst| |list|) . #3=(|ISUPS;sincos0|))
              (LETT |cosStr| (SPADCALL |list| (QREFELT $ 124)) . #3#)
              (LETT |prodRef1|
                    (SPADCALL (SPADCALL (|spadConstant| $ 106) (QREFELT $ 107))
                              (QREFELT $ 20))
                    . #3#)
              (LETT |prodRef2|
                    (SPADCALL (SPADCALL (|spadConstant| $ 106) (QREFELT $ 107))
                              (QREFELT $ 20))
                    . #3#)
              (LETT |prodStr1|
                    (|ISUPS;iTimes| |cosStr| |cosRef| |fpStr| |fpRef|
                     |prodRef1| 0 $)
                    . #3#)
              (LETT |prodStr2|
                    (|ISUPS;iTimes| |sinStr| |sinRef| |fpStr2| |fpRef2|
                     |prodRef2| 0 $)
                    . #3#)
              (EXIT
               (LIST
                (|ISUPS;lazyInteg| |sinc| (CONS #'|ISUPS;sincos0!0| |prodStr1|)
                 |prodRef1| |sinRef| $)
                (|ISUPS;lazyInteg| |cosc| (CONS #'|ISUPS;sincos0!1| |prodStr2|)
                 |prodRef2| |cosRef| $)))))) 

(SDEFUN |ISUPS;sincos0!1| ((|prodStr2| NIL)) |prodStr2|) 

(SDEFUN |ISUPS;sincos0!0| ((|prodStr1| NIL)) |prodStr1|) 

(SDEFUN |ISUPS;iSincos|
        ((|f| $) (|sinc| |Coef|) (|cosc| |Coef|) (|sign| |Integer|)
         ($ |Record| (|:| |%sin| $) (|:| |%cos| $)))
        (SPROG
         ((|cosStr|
           (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|sinStr|
           (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|sincos|
           (|List|
            (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))))
          (|cosRef| #1=(|Reference| (|OrderedCompletion| (|Integer|))))
          (|sinRef| #1#)
          (|fpStr2|
           #2=(|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|fpRef2| #3=(|Reference| (|OrderedCompletion| (|Integer|))))
          (|fp2| ($)) (|fpStr| #2#) (|fpRef| #3#) (|fp| ($)))
         (SEQ (LETT |fp| (SPADCALL |f| (QREFELT $ 72)) . #4=(|ISUPS;iSincos|))
              (LETT |fpRef| (SPADCALL |fp| (QREFELT $ 12)) . #4#)
              (LETT |fpStr| (SPADCALL |fp| (QREFELT $ 13)) . #4#)
              (LETT |fp2|
                    (COND ((EQL |sign| 1) |fp|)
                          (#5='T (SPADCALL |fp| (QREFELT $ 86))))
                    . #4#)
              (LETT |fpRef2| (SPADCALL |fp2| (QREFELT $ 12)) . #4#)
              (LETT |fpStr2| (SPADCALL |fp2| (QREFELT $ 13)) . #4#)
              (LETT |sinRef| (SPADCALL (|spadConstant| $ 116) (QREFELT $ 20))
                    . #4#)
              (LETT |cosRef| (SPADCALL (|spadConstant| $ 116) (QREFELT $ 20))
                    . #4#)
              (LETT |sincos|
                    (SPADCALL
                     (CONS #'|ISUPS;iSincos!0|
                           (VECTOR $ |fpRef2| |fpStr2| |fpRef| |fpStr| |cosRef|
                                   |sinRef| |cosc| |sinc|))
                     2 (QREFELT $ 126))
                    . #4#)
              (LETT |sinStr|
                    (COND
                     ((SPADCALL |sinc| (QREFELT $ 16))
                      (SPADCALL (|SPADfirst| |sincos|) (QREFELT $ 24)))
                     (#5# (|SPADfirst| |sincos|)))
                    . #4#)
              (LETT |cosStr|
                    (COND
                     ((SPADCALL |cosc| (QREFELT $ 16))
                      (SPADCALL (SPADCALL |sincos| (QREFELT $ 124))
                                (QREFELT $ 24)))
                     (#5# (SPADCALL |sincos| (QREFELT $ 124))))
                    . #4#)
              (EXIT
               (CONS (SPADCALL |sinRef| |sinStr| (QREFELT $ 11))
                     (SPADCALL |cosRef| |cosStr| (QREFELT $ 11))))))) 

(SDEFUN |ISUPS;iSincos!0| ((|s| NIL) ($$ NIL))
        (PROG (|sinc| |cosc| |sinRef| |cosRef| |fpStr| |fpRef| |fpStr2|
               |fpRef2| $)
          (LETT |sinc| (QREFELT $$ 8) . #1=(|ISUPS;iSincos|))
          (LETT |cosc| (QREFELT $$ 7) . #1#)
          (LETT |sinRef| (QREFELT $$ 6) . #1#)
          (LETT |cosRef| (QREFELT $$ 5) . #1#)
          (LETT |fpStr| (QREFELT $$ 4) . #1#)
          (LETT |fpRef| (QREFELT $$ 3) . #1#)
          (LETT |fpStr2| (QREFELT $$ 2) . #1#)
          (LETT |fpRef2| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|ISUPS;sincos0| |sinc| |cosc| |s| |sinRef| |cosRef| |fpStr|
             |fpRef| |fpStr2| |fpRef2| $))))) 

(SDEFUN |ISUPS;tan0|
        ((|cc| |Coef|)
         (|ansStr| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|ansRef| |Reference| (|OrderedCompletion| (|Integer|)))
         (|fpStr| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|fpRef| |Reference| (|OrderedCompletion| (|Integer|)))
         (|sign| |Integer|)
         ($ |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
        (SPROG
         ((|intRef| #1=(|Reference| (|OrderedCompletion| (|Integer|))))
          (|yStr| (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|yRef| #1#)
          (|oneRef| (|Reference| (|OrderedCompletion| (|Integer|))))
          (|oneStr|
           (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|one| ($))
          (|sqStr|
           (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|sqRef| #1#))
         (SEQ
          (LETT |sqRef|
                (SPADCALL (SPADCALL (|spadConstant| $ 106) (QREFELT $ 107))
                          (QREFELT $ 20))
                . #2=(|ISUPS;tan0|))
          (LETT |sqStr|
                (|ISUPS;iTimes| |ansStr| |ansRef| |ansStr| |ansRef| |sqRef| 0
                 $)
                . #2#)
          (LETT |one| (|spadConstant| $ 38) . #2#)
          (LETT |oneStr| (SPADCALL |one| (QREFELT $ 13)) . #2#)
          (LETT |oneRef| (SPADCALL |one| (QREFELT $ 12)) . #2#)
          (LETT |yRef|
                (SPADCALL (SPADCALL (|spadConstant| $ 106) (QREFELT $ 107))
                          (QREFELT $ 20))
                . #2#)
          (LETT |yStr|
                (COND
                 ((EQL |sign| 1)
                  (|ISUPS;iPlus1| (ELT $ 82) |oneStr| |oneRef| |sqStr| |sqRef|
                   |yRef| 0 $))
                 ('T
                  (|ISUPS;iPlus1| (ELT $ 84) |oneStr| |oneRef| |sqStr| |sqRef|
                   |yRef| 0 $)))
                . #2#)
          (LETT |intRef|
                (SPADCALL (SPADCALL (|spadConstant| $ 106) (QREFELT $ 107))
                          (QREFELT $ 20))
                . #2#)
          (EXIT
           (|ISUPS;lazyInteg| |cc|
            (CONS #'|ISUPS;tan0!0|
                  (VECTOR $ |intRef| |fpRef| |fpStr| |yRef| |yStr|))
            |intRef| |ansRef| $))))) 

(SDEFUN |ISUPS;tan0!0| (($$ NIL))
        (PROG (|yStr| |yRef| |fpStr| |fpRef| |intRef| $)
          (LETT |yStr| (QREFELT $$ 5) . #1=(|ISUPS;tan0|))
          (LETT |yRef| (QREFELT $$ 4) . #1#)
          (LETT |fpStr| (QREFELT $$ 3) . #1#)
          (LETT |fpRef| (QREFELT $$ 2) . #1#)
          (LETT |intRef| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|ISUPS;iTimes| |yStr| |yRef| |fpStr| |fpRef| |intRef|
             (|spadConstant| $ 122) $))))) 

(SDEFUN |ISUPS;iTan| ((|f| $) (|fp| $) (|cc| |Coef|) (|sign| |Integer|) ($ $))
        (SPROG
         ((|ansStr|
           (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|ansRef| (|Reference| (|OrderedCompletion| (|Integer|))))
          (|fpStr|
           (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|fpRef| (|Reference| (|OrderedCompletion| (|Integer|)))))
         (SEQ (LETT |fpRef| (SPADCALL |fp| (QREFELT $ 12)) . #1=(|ISUPS;iTan|))
              (LETT |fpStr| (SPADCALL |fp| (QREFELT $ 13)) . #1#)
              (LETT |ansRef| (SPADCALL (|spadConstant| $ 116) (QREFELT $ 20))
                    . #1#)
              (LETT |ansStr|
                    (SPADCALL
                     (CONS #'|ISUPS;iTan!0|
                           (VECTOR $ |sign| |fpRef| |fpStr| |ansRef| |cc|))
                     (QREFELT $ 120))
                    . #1#)
              (EXIT
               (COND
                ((SPADCALL |cc| (QREFELT $ 16))
                 (SPADCALL |ansRef| (SPADCALL |ansStr| (QREFELT $ 24))
                           (QREFELT $ 11)))
                ('T (SPADCALL |ansRef| |ansStr| (QREFELT $ 11)))))))) 

(SDEFUN |ISUPS;iTan!0| ((|s| NIL) ($$ NIL))
        (PROG (|cc| |ansRef| |fpStr| |fpRef| |sign| $)
          (LETT |cc| (QREFELT $$ 5) . #1=(|ISUPS;iTan|))
          (LETT |ansRef| (QREFELT $$ 4) . #1#)
          (LETT |fpStr| (QREFELT $$ 3) . #1#)
          (LETT |fpRef| (QREFELT $$ 2) . #1#)
          (LETT |sign| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN (|ISUPS;tan0| |cc| |s| |ansRef| |fpStr| |fpRef| |sign| $))))) 

(SDEFUN |ISUPS;orderOrFailed| ((|uts| $) ($ |Union| (|Integer|) "failed"))
        (SPROG
         ((#1=#:G857 NIL) (|n| NIL)
          (|x| (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |x| (SPADCALL |uts| (QREFELT $ 13))
                  . #2=(|ISUPS;orderOrFailed|))
            (SEQ (LETT |n| 0 . #2#) G190
                 (COND ((|greater_SI| |n| 1000) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |x| (QREFELT $ 42))
                     (PROGN (LETT #1# (CONS 0 -1) . #2#) (GO #3=#:G856)))
                    ((SPADCALL |x| (QREFELT $ 43))
                     (PROGN
                      (LETT #1#
                            (CONS 0
                                  (|ISUPS;getExpon|
                                   (SPADCALL |x| (QREFELT $ 32)) $))
                            . #2#)
                      (GO #3#)))
                    ('T (SPADCALL |x| (QREFELT $ 44))))))
                 (LETT |n| (|inc_SI| |n|) . #2#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 1 "failed"))))
          #3# (EXIT #1#)))) 

(SDEFUN |ISUPS;cRationalPower;$F$;67|
        ((|uts| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPROG
         ((|uts2| ($)) (|uts1| ($)) (|ccPow| (|Coef|)) (#1=#:G872 NIL)
          (#2=#:G866 NIL) (|num| (|Integer|))
          (|ccInv| (|Union| |Coef| "failed")) (|cc| (|Coef|))
          (|n| (|Union| (|Integer|) "failed")) (|order| (|Integer|))
          (|ord0| (|Union| (|Integer|) "failed")))
         (SEQ
          (LETT |ord0| (|ISUPS;orderOrFailed| |uts| $)
                . #3=(|ISUPS;cRationalPower;$F$;67|))
          (EXIT
           (COND
            ((QEQCAR |ord0| 1)
             (|error| "^: series with many leading zero coefficients"))
            (#4='T
             (SEQ (LETT |order| (QCDR |ord0|) . #3#)
                  (LETT |n|
                        (SPADCALL |order| (SPADCALL |r| (QREFELT $ 136))
                                  (QREFELT $ 137))
                        . #3#)
                  (EXIT
                   (COND
                    ((QEQCAR |n| 1)
                     (|error| "^: rational power does not exist"))
                    (#4#
                     (SEQ
                      (LETT |cc| (SPADCALL |uts| |order| (QREFELT $ 57)) . #3#)
                      (LETT |ccInv| (SPADCALL |cc| (QREFELT $ 99)) . #3#)
                      (EXIT
                       (COND
                        ((QEQCAR |ccInv| 1)
                         (|error| (STRCONC "^: " (QREFELT $ 133))))
                        (#4#
                         (SEQ
                          (LETT |ccPow|
                                (COND
                                 ((SPADCALL |cc| (|spadConstant| $ 39)
                                            (QREFELT $ 138))
                                  |cc|)
                                 ((EQL (SPADCALL |r| (QREFELT $ 136)) 1)
                                  (COND
                                   ((NULL
                                     (MINUSP
                                      (LETT |num|
                                            (SPADCALL |r| (QREFELT $ 139))
                                            . #3#)))
                                    (SPADCALL |cc|
                                              (PROG1 (LETT #2# |num| . #3#)
                                                (|check_subtype2| (>= #2# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #2#))
                                              (QREFELT $ 140)))
                                   ('T
                                    (SPADCALL (QCDR |ccInv|)
                                              (PROG1 (LETT #1# (- |num|) . #3#)
                                                (|check_subtype2| (>= #1# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #1#))
                                              (QREFELT $ 140)))))
                                 ((QREFELT $ 134)
                                  (SPADCALL |cc| |r| (QREFELT $ 141)))
                                 (#4#
                                  (|error|
                                   "^ rational power of coefficient undefined")))
                                . #3#)
                          (LETT |uts1|
                                (SPADCALL (QCDR |ccInv|) |uts| (QREFELT $ 115))
                                . #3#)
                          (LETT |uts2|
                                (SPADCALL |uts1|
                                          (SPADCALL (|spadConstant| $ 39)
                                                    (- |order|) (QREFELT $ 22))
                                          (QREFELT $ 97))
                                . #3#)
                          (EXIT
                           (SPADCALL
                            (SPADCALL |ccPow|
                                      (* (QCDR |n|)
                                         (SPADCALL |r| (QREFELT $ 139)))
                                      (QREFELT $ 22))
                            (SPADCALL |uts2| (SPADCALL |r| (QREFELT $ 142))
                                      (QREFELT $ 121))
                            (QREFELT $ 97)))))))))))))))))) 

(SDEFUN |ISUPS;cExp;2$;68| ((|uts| $) ($ $))
        (SPROG ((|cc| (|Coef|)))
               (COND
                ((SPADCALL
                  (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57))
                        |ISUPS;cExp;2$;68|)
                  (QREFELT $ 16))
                 (|ISUPS;iExp| |uts| (|spadConstant| $ 39) $))
                ((QREFELT $ 135)
                 (|ISUPS;iExp| |uts| (SPADCALL |cc| (QREFELT $ 144)) $))
                ('T (|error| (STRCONC "exp: " (QREFELT $ 127))))))) 

(SDEFUN |ISUPS;cLog;2$;69| ((|uts| $) ($ $))
        (SPROG ((|y| ($)) (#1=#:G885 NIL) (|cc| (|Coef|)))
               (SEQ
                (COND
                 ((SPADCALL
                   (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57))
                         . #2=(|ISUPS;cLog;2$;69|))
                   (QREFELT $ 16))
                  (|error| "log: constant coefficient should not be 0"))
                 ((SPADCALL |cc| (|spadConstant| $ 39) (QREFELT $ 138))
                  (SPADCALL
                   (SPADCALL (SPADCALL |uts| (QREFELT $ 72))
                             (PROG2
                                 (LETT #1#
                                       (SPADCALL (|spadConstant| $ 38) |uts| 'T
                                                 (QREFELT $ 100))
                                       . #2#)
                                 (QCDR #1#)
                               (|check_union2| (QEQCAR #1# 0) $
                                               (|Union| $ #3="failed") #1#))
                             (QREFELT $ 97))
                   (QREFELT $ 112)))
                 ((QREFELT $ 135)
                  (SEQ
                   (LETT |y|
                         (PROG2
                             (LETT #1#
                                   (SPADCALL (|spadConstant| $ 38) |uts| 'T
                                             (QREFELT $ 100))
                                   . #2#)
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0) $ (|Union| $ #3#)
                                           #1#))
                         . #2#)
                   (EXIT
                    (SPADCALL
                     (SPADCALL (SPADCALL |cc| (QREFELT $ 146)) (QREFELT $ 27))
                     (SPADCALL
                      (SPADCALL |y| (SPADCALL |uts| (QREFELT $ 72))
                                (QREFELT $ 97))
                      (QREFELT $ 112))
                     (QREFELT $ 83)))))
                 ('T (|error| (STRCONC "log: " (QREFELT $ 127)))))))) 

(SDEFUN |ISUPS;sincos| ((|uts| $) ($ |Record| (|:| |%sin| $) (|:| |%cos| $)))
        (SPROG ((|cc| (|Coef|)))
               (COND
                ((SPADCALL
                  (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57)) |ISUPS;sincos|)
                  (QREFELT $ 16))
                 (|ISUPS;iSincos| |uts| (|spadConstant| $ 30)
                  (|spadConstant| $ 39) -1 $))
                ((QREFELT $ 135)
                 (|ISUPS;iSincos| |uts| (SPADCALL |cc| (QREFELT $ 148))
                  (SPADCALL |cc| (QREFELT $ 149)) -1 $))
                ('T (|error| (STRCONC "sincos: " (QREFELT $ 127))))))) 

(SDEFUN |ISUPS;cSin;2$;71| ((|uts| $) ($ $)) (QCAR (|ISUPS;sincos| |uts| $))) 

(SDEFUN |ISUPS;cCos;2$;72| ((|uts| $) ($ $)) (QCDR (|ISUPS;sincos| |uts| $))) 

(SDEFUN |ISUPS;cTan;2$;73| ((|uts| $) ($ $))
        (SPROG ((|cc| (|Coef|)))
               (COND
                ((SPADCALL
                  (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57))
                        |ISUPS;cTan;2$;73|)
                  (QREFELT $ 16))
                 (|ISUPS;iTan| |uts| (SPADCALL |uts| (QREFELT $ 72))
                  (|spadConstant| $ 30) 1 $))
                ((QREFELT $ 135)
                 (|ISUPS;iTan| |uts| (SPADCALL |uts| (QREFELT $ 72))
                  (SPADCALL |cc| (QREFELT $ 152)) 1 $))
                ('T (|error| (STRCONC "tan: " (QREFELT $ 127))))))) 

(SDEFUN |ISUPS;cCot;2$;74| ((|uts| $) ($ $))
        (SPROG ((|cc| (|Coef|)))
               (COND
                ((SPADCALL |uts| (QREFELT $ 65))
                 (|error| "cot: cot(0) is undefined"))
                ((SPADCALL
                  (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57))
                        |ISUPS;cCot;2$;74|)
                  (QREFELT $ 16))
                 (|error| (|error| (STRCONC "cot: " (QREFELT $ 128)))))
                ((QREFELT $ 135)
                 (|ISUPS;iTan| |uts|
                  (SPADCALL (SPADCALL |uts| (QREFELT $ 72)) (QREFELT $ 86))
                  (SPADCALL |cc| (QREFELT $ 154)) 1 $))
                ('T (|error| (STRCONC "cot: " (QREFELT $ 127))))))) 

(SDEFUN |ISUPS;cSec;2$;75| ((|uts| $) ($ $))
        (SPROG ((#1=#:G909 NIL) (|cosUts| ($)) (|cc| (|Coef|)))
               (SEQ
                (COND
                 ((SPADCALL
                   (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57))
                         . #2=(|ISUPS;cSec;2$;75|))
                   (QREFELT $ 16))
                  (PROG2
                      (LETT #1#
                            (SPADCALL (|spadConstant| $ 38)
                                      (SPADCALL |uts| (QREFELT $ 151)) 'T
                                      (QREFELT $ 100))
                            . #2#)
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 0) $ (|Union| $ #3="failed")
                                    #1#)))
                 ((QREFELT $ 135)
                  (SEQ (LETT |cosUts| (SPADCALL |uts| (QREFELT $ 151)) . #2#)
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |cosUts| 0 (QREFELT $ 57))
                                    (QREFELT $ 16))
                          (|error| (STRCONC "sec: " (QREFELT $ 128))))
                         (#4='T
                          (PROG2
                              (LETT #1#
                                    (SPADCALL (|spadConstant| $ 38) |cosUts| 'T
                                              (QREFELT $ 100))
                                    . #2#)
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0) $ (|Union| $ #3#)
                                            #1#)))))))
                 (#4# (|error| (STRCONC "sec: " (QREFELT $ 127)))))))) 

(SDEFUN |ISUPS;cCsc;2$;76| ((|uts| $) ($ $))
        (SPROG ((#1=#:G916 NIL) (|sinUts| ($)))
               (SEQ
                (COND
                 ((SPADCALL |uts| (QREFELT $ 65))
                  (|error| "csc: csc(0) is undefined"))
                 ((QREFELT $ 135)
                  (SEQ
                   (LETT |sinUts| (SPADCALL |uts| (QREFELT $ 150))
                         . #2=(|ISUPS;cCsc;2$;76|))
                   (EXIT
                    (COND
                     ((SPADCALL (SPADCALL |sinUts| 0 (QREFELT $ 57))
                                (QREFELT $ 16))
                      (|error| (STRCONC "csc: " (QREFELT $ 128))))
                     (#3='T
                      (PROG2
                          (LETT #1#
                                (SPADCALL (|spadConstant| $ 38) |sinUts| 'T
                                          (QREFELT $ 100))
                                . #2#)
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 0) $ (|Union| $ "failed")
                                        #1#)))))))
                 (#3# (|error| (STRCONC "csc: " (QREFELT $ 127)))))))) 

(SDEFUN |ISUPS;cAsin;2$;77| ((|uts| $) ($ $))
        (SPROG
         ((|c0| ($)) (#1=#:G937 NIL) (|order| (|Integer|))
          (|ord| (|Union| (|Integer|) "failed")) (|x| ($)) (|cc| (|Coef|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL
              (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57))
                    . #2=(|ISUPS;cAsin;2$;77|))
              (QREFELT $ 16))
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL (|spadConstant| $ 38)
                          (SPADCALL |uts| |uts| (QREFELT $ 97)) (QREFELT $ 66))
                (SPADCALL (SPADCALL 1 2 (QREFELT $ 110)) (QREFELT $ 158))
                (QREFELT $ 143))
               (SPADCALL |uts| (QREFELT $ 72)) (QREFELT $ 97))
              (QREFELT $ 112)))
            ((QREFELT $ 135)
             (SEQ
              (LETT |x|
                    (SPADCALL (|spadConstant| $ 38)
                              (SPADCALL |uts| |uts| (QREFELT $ 97))
                              (QREFELT $ 66))
                    . #2#)
              (COND
               ((OR (SPADCALL |cc| (|spadConstant| $ 39) (QREFELT $ 138))
                    (SPADCALL |cc|
                              (SPADCALL (|spadConstant| $ 39) (QREFELT $ 85))
                              (QREFELT $ 138)))
                (EXIT
                 (SEQ (LETT |ord| (|ISUPS;orderOrFailed| |x| $) . #2#)
                      (EXIT
                       (COND
                        ((QEQCAR |ord| 1)
                         (|error| (STRCONC "asin: " (QREFELT $ 130))))
                        ((EQL (LETT |order| (QCDR |ord|) . #2#) -1)
                         (PROGN
                          (LETT #1#
                                (SPADCALL (SPADCALL |cc| (QREFELT $ 159))
                                          (QREFELT $ 27))
                                . #2#)
                          (GO #3=#:G936)))
                        ((ODDP |order|)
                         (|error| (STRCONC "asin: " (QREFELT $ 129))))
                        (#4='T
                         (SEQ
                          (LETT |c0|
                                (SPADCALL (SPADCALL |cc| (QREFELT $ 159))
                                          (QREFELT $ 27))
                                . #2#)
                          (EXIT
                           (SPADCALL |c0|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |x|
                                                 (SPADCALL
                                                  (SPADCALL 1 2
                                                            (QREFELT $ 110))
                                                  (QREFELT $ 158))
                                                 (QREFELT $ 143))
                                       (SPADCALL |uts| (QREFELT $ 72))
                                       (QREFELT $ 97))
                                      (QREFELT $ 112))
                                     (QREFELT $ 83)))))))))))
              (LETT |c0|
                    (SPADCALL (SPADCALL |cc| (QREFELT $ 159)) (QREFELT $ 27))
                    . #2#)
              (EXIT
               (SPADCALL |c0|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL |x|
                                     (SPADCALL (SPADCALL 1 2 (QREFELT $ 110))
                                               (QREFELT $ 158))
                                     (QREFELT $ 143))
                           (SPADCALL |uts| (QREFELT $ 72)) (QREFELT $ 97))
                          (QREFELT $ 112))
                         (QREFELT $ 83)))))
            (#4# (|error| (STRCONC "asin: " (QREFELT $ 127))))))
          #3# (EXIT #1#)))) 

(SDEFUN |ISUPS;cAcos;2$;78| ((|uts| $) ($ $))
        (SPROG
         ((|c0| ($)) (#1=#:G954 NIL) (|order| (|Integer|))
          (|ord| (|Union| (|Integer|) "failed")) (|cc| (|Coef|)) (|x| ($)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |uts| (QREFELT $ 65))
             (COND
              ((QREFELT $ 135)
               (SPADCALL (SPADCALL (|spadConstant| $ 30) (QREFELT $ 161))
                         (QREFELT $ 27)))
              (#2='T (|error| (STRCONC "acos: " (QREFELT $ 127))))))
            ((QREFELT $ 135)
             (SEQ
              (LETT |x|
                    (SPADCALL (|spadConstant| $ 38)
                              (SPADCALL |uts| |uts| (QREFELT $ 97))
                              (QREFELT $ 66))
                    . #3=(|ISUPS;cAcos;2$;78|))
              (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57)) . #3#)
              (COND
               ((OR (SPADCALL |cc| (|spadConstant| $ 39) (QREFELT $ 138))
                    (SPADCALL |cc|
                              (SPADCALL (|spadConstant| $ 39) (QREFELT $ 85))
                              (QREFELT $ 138)))
                (EXIT
                 (SEQ (LETT |ord| (|ISUPS;orderOrFailed| |x| $) . #3#)
                      (EXIT
                       (COND
                        ((QEQCAR |ord| 1)
                         (|error| (STRCONC "acos: " (QREFELT $ 130))))
                        ((EQL (LETT |order| (QCDR |ord|) . #3#) -1)
                         (PROGN
                          (LETT #1#
                                (SPADCALL (SPADCALL |cc| (QREFELT $ 161))
                                          (QREFELT $ 27))
                                . #3#)
                          (GO #4=#:G953)))
                        ((ODDP |order|)
                         (|error| (STRCONC "acos: " (QREFELT $ 129))))
                        (#2#
                         (SEQ
                          (LETT |c0|
                                (SPADCALL (SPADCALL |cc| (QREFELT $ 161))
                                          (QREFELT $ 27))
                                . #3#)
                          (EXIT
                           (SPADCALL |c0|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |x|
                                                  (SPADCALL
                                                   (SPADCALL 1 2
                                                             (QREFELT $ 110))
                                                   (QREFELT $ 158))
                                                  (QREFELT $ 143))
                                        (SPADCALL |uts| (QREFELT $ 72))
                                        (QREFELT $ 97))
                                       (QREFELT $ 86))
                                      (QREFELT $ 112))
                                     (QREFELT $ 83)))))))))))
              (LETT |c0|
                    (SPADCALL (SPADCALL |cc| (QREFELT $ 161)) (QREFELT $ 27))
                    . #3#)
              (EXIT
               (SPADCALL |c0|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL |x|
                                      (SPADCALL (SPADCALL 1 2 (QREFELT $ 110))
                                                (QREFELT $ 158))
                                      (QREFELT $ 143))
                            (SPADCALL |uts| (QREFELT $ 72)) (QREFELT $ 97))
                           (QREFELT $ 86))
                          (QREFELT $ 112))
                         (QREFELT $ 83)))))
            (#2# (|error| (STRCONC "acos: " (QREFELT $ 127))))))
          #4# (EXIT #1#)))) 

(SDEFUN |ISUPS;cAtan;2$;79| ((|uts| $) ($ $))
        (SPROG ((|y| (|Union| $ #1="failed")) (#2=#:G957 NIL) (|cc| (|Coef|)))
               (SEQ
                (COND
                 ((SPADCALL
                   (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57))
                         . #3=(|ISUPS;cAtan;2$;79|))
                   (QREFELT $ 16))
                  (SEQ
                   (LETT |y|
                         (PROG2
                             (LETT #2#
                                   (SPADCALL (|spadConstant| $ 38)
                                             (SPADCALL (|spadConstant| $ 38)
                                                       (SPADCALL |uts| |uts|
                                                                 (QREFELT $
                                                                          97))
                                                       (QREFELT $ 83))
                                             'T (QREFELT $ 100))
                                   . #3#)
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0) $ (|Union| $ #1#)
                                           #2#))
                         . #3#)
                   (EXIT
                    (SPADCALL
                     (SPADCALL |y| (SPADCALL |uts| (QREFELT $ 72))
                               (QREFELT $ 97))
                     (QREFELT $ 112)))))
                 ((QREFELT $ 135)
                  (SEQ
                   (LETT |y|
                         (SPADCALL (|spadConstant| $ 38)
                                   (SPADCALL (|spadConstant| $ 38)
                                             (SPADCALL |uts| |uts|
                                                       (QREFELT $ 97))
                                             (QREFELT $ 83))
                                   'T (QREFELT $ 100))
                         . #3#)
                   (EXIT
                    (COND
                     ((QEQCAR |y| 1)
                      (|error| (STRCONC "atan: " (QREFELT $ 131))))
                     (#4='T
                      (SPADCALL
                       (SPADCALL (SPADCALL |cc| (QREFELT $ 163))
                                 (QREFELT $ 27))
                       (SPADCALL
                        (SPADCALL (QCDR |y|) (SPADCALL |uts| (QREFELT $ 72))
                                  (QREFELT $ 97))
                        (QREFELT $ 112))
                       (QREFELT $ 83)))))))
                 (#4# (|error| (STRCONC "atan: " (QREFELT $ 127)))))))) 

(SDEFUN |ISUPS;cAcot;2$;80| ((|uts| $) ($ $))
        (SPROG ((|cc| (|Coef|)) (|y| (|Union| $ "failed")))
               (SEQ
                (COND
                 ((QREFELT $ 135)
                  (SEQ
                   (LETT |y|
                         (SPADCALL (|spadConstant| $ 38)
                                   (SPADCALL (|spadConstant| $ 38)
                                             (SPADCALL |uts| |uts|
                                                       (QREFELT $ 97))
                                             (QREFELT $ 83))
                                   'T (QREFELT $ 100))
                         . #1=(|ISUPS;cAcot;2$;80|))
                   (EXIT
                    (COND
                     ((QEQCAR |y| 1)
                      (|error| (STRCONC "acot: " (QREFELT $ 131))))
                     (#2='T
                      (SEQ (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57)) . #1#)
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |cc| (QREFELT $ 165))
                                       (QREFELT $ 27))
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (QCDR |y|)
                                         (SPADCALL |uts| (QREFELT $ 72))
                                         (QREFELT $ 97))
                               (QREFELT $ 86))
                              (QREFELT $ 112))
                             (QREFELT $ 83)))))))))
                 (#2# (|error| (STRCONC "acot: " (QREFELT $ 127)))))))) 

(SDEFUN |ISUPS;cAsec;2$;81| ((|uts| $) ($ $))
        (SPROG
         ((|z| (|Union| $ "failed")) (|y| ($)) (#1=#:G988 NIL)
          (|order| (|Integer|)) (|ord| (|Union| (|Integer|) "failed"))
          (|x| ($)) (|cc| (|Coef|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL
              (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57))
                    . #2=(|ISUPS;cAsec;2$;81|))
              (QREFELT $ 16))
             (|error| "asec: constant coefficient should not be 0"))
            ((QREFELT $ 135)
             (SEQ
              (LETT |x|
                    (SPADCALL (SPADCALL |uts| |uts| (QREFELT $ 97))
                              (|spadConstant| $ 38) (QREFELT $ 66))
                    . #2#)
              (LETT |y|
                    (COND
                     ((OR (SPADCALL |cc| (|spadConstant| $ 39) (QREFELT $ 138))
                          (SPADCALL |cc|
                                    (SPADCALL (|spadConstant| $ 39)
                                              (QREFELT $ 85))
                                    (QREFELT $ 138)))
                      (SEQ (LETT |ord| (|ISUPS;orderOrFailed| |x| $) . #2#)
                           (EXIT
                            (COND
                             ((QEQCAR |ord| 1)
                              (|error| (STRCONC "asec: " (QREFELT $ 130))))
                             ((EQL (LETT |order| (QCDR |ord|) . #2#) -1)
                              (PROGN
                               (LETT #1#
                                     (SPADCALL (SPADCALL |cc| (QREFELT $ 167))
                                               (QREFELT $ 27))
                                     . #2#)
                               (GO #3=#:G987)))
                             ((ODDP |order|)
                              (|error| (STRCONC "asec: " (QREFELT $ 129))))
                             (#4='T
                              (SPADCALL
                               (SPADCALL |x|
                                         (SPADCALL
                                          (SPADCALL 1 2 (QREFELT $ 110))
                                          (QREFELT $ 158))
                                         (QREFELT $ 143))
                               (SPADCALL |uts| (QREFELT $ 72))
                               (QREFELT $ 97)))))))
                     ('T
                      (SPADCALL
                       (SPADCALL |x|
                                 (SPADCALL (SPADCALL 1 2 (QREFELT $ 110))
                                           (QREFELT $ 158))
                                 (QREFELT $ 143))
                       (SPADCALL |uts| (QREFELT $ 72)) (QREFELT $ 97))))
                    . #2#)
              (LETT |z| (SPADCALL |y| |uts| 'T (QREFELT $ 100)) . #2#)
              (EXIT
               (COND
                ((QEQCAR |z| 1) (|error| (STRCONC "asec: " (QREFELT $ 133))))
                (#4#
                 (SPADCALL
                  (SPADCALL (SPADCALL |cc| (QREFELT $ 167)) (QREFELT $ 27))
                  (SPADCALL (QCDR |z|) (QREFELT $ 112)) (QREFELT $ 83)))))))
            (#4# (|error| (STRCONC "asec: " (QREFELT $ 127))))))
          #3# (EXIT #1#)))) 

(SDEFUN |ISUPS;cAcsc;2$;82| ((|uts| $) ($ $))
        (SPROG
         ((|z| (|Union| $ "failed")) (|y| ($)) (#1=#:G1007 NIL)
          (|order| (|Integer|)) (|ord| (|Union| (|Integer|) "failed"))
          (|x| ($)) (|cc| (|Coef|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL
              (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57))
                    . #2=(|ISUPS;cAcsc;2$;82|))
              (QREFELT $ 16))
             (|error| "acsc: constant coefficient should not be 0"))
            ((QREFELT $ 135)
             (SEQ
              (LETT |x|
                    (SPADCALL (SPADCALL |uts| |uts| (QREFELT $ 97))
                              (|spadConstant| $ 38) (QREFELT $ 66))
                    . #2#)
              (LETT |y|
                    (COND
                     ((OR (SPADCALL |cc| (|spadConstant| $ 39) (QREFELT $ 138))
                          (SPADCALL |cc|
                                    (SPADCALL (|spadConstant| $ 39)
                                              (QREFELT $ 85))
                                    (QREFELT $ 138)))
                      (SEQ (LETT |ord| (|ISUPS;orderOrFailed| |x| $) . #2#)
                           (EXIT
                            (COND
                             ((QEQCAR |ord| 1)
                              (|error| (STRCONC "acsc: " (QREFELT $ 130))))
                             ((EQL (LETT |order| (QCDR |ord|) . #2#) -1)
                              (PROGN
                               (LETT #1#
                                     (SPADCALL (SPADCALL |cc| (QREFELT $ 169))
                                               (QREFELT $ 27))
                                     . #2#)
                               (GO #3=#:G1006)))
                             ((ODDP |order|)
                              (|error| (STRCONC "acsc: " (QREFELT $ 129))))
                             (#4='T
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |x|
                                          (SPADCALL
                                           (SPADCALL 1 2 (QREFELT $ 110))
                                           (QREFELT $ 158))
                                          (QREFELT $ 143))
                                (SPADCALL |uts| (QREFELT $ 72)) (QREFELT $ 97))
                               (QREFELT $ 86)))))))
                     ('T
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL |x|
                                  (SPADCALL (SPADCALL 1 2 (QREFELT $ 110))
                                            (QREFELT $ 158))
                                  (QREFELT $ 143))
                        (SPADCALL |uts| (QREFELT $ 72)) (QREFELT $ 97))
                       (QREFELT $ 86))))
                    . #2#)
              (LETT |z| (SPADCALL |y| |uts| 'T (QREFELT $ 100)) . #2#)
              (EXIT
               (COND
                ((QEQCAR |z| 1) (|error| (STRCONC "asec: " (QREFELT $ 133))))
                (#4#
                 (SPADCALL
                  (SPADCALL (SPADCALL |cc| (QREFELT $ 169)) (QREFELT $ 27))
                  (SPADCALL (QCDR |z|) (QREFELT $ 112)) (QREFELT $ 83)))))))
            (#4# (|error| (STRCONC "acsc: " (QREFELT $ 127))))))
          #3# (EXIT #1#)))) 

(SDEFUN |ISUPS;sinhcosh|
        ((|uts| $) ($ |Record| (|:| |%sinh| $) (|:| |%cosh| $)))
        (SPROG
         ((|tmp| (|Record| (|:| |%sin| $) (|:| |%cos| $))) (|cc| (|Coef|)))
         (SEQ
          (COND
           ((SPADCALL
             (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57))
                   . #1=(|ISUPS;sinhcosh|))
             (QREFELT $ 16))
            (SEQ
             (LETT |tmp|
                   (|ISUPS;iSincos| |uts| (|spadConstant| $ 30)
                    (|spadConstant| $ 39) 1 $)
                   . #1#)
             (EXIT (CONS (QCAR |tmp|) (QCDR |tmp|)))))
           ((QREFELT $ 135)
            (SEQ
             (LETT |tmp|
                   (|ISUPS;iSincos| |uts| (SPADCALL |cc| (QREFELT $ 171))
                    (SPADCALL |cc| (QREFELT $ 172)) 1 $)
                   . #1#)
             (EXIT (CONS (QCAR |tmp|) (QCDR |tmp|)))))
           ('T (|error| (STRCONC "sinhcosh: " (QREFELT $ 127)))))))) 

(SDEFUN |ISUPS;cSinh;2$;84| ((|uts| $) ($ $)) (QCAR (|ISUPS;sinhcosh| |uts| $))) 

(SDEFUN |ISUPS;cCosh;2$;85| ((|uts| $) ($ $)) (QCDR (|ISUPS;sinhcosh| |uts| $))) 

(SDEFUN |ISUPS;cTanh;2$;86| ((|uts| $) ($ $))
        (SPROG ((|cc| (|Coef|)))
               (COND
                ((SPADCALL
                  (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57))
                        |ISUPS;cTanh;2$;86|)
                  (QREFELT $ 16))
                 (|ISUPS;iTan| |uts| (SPADCALL |uts| (QREFELT $ 72))
                  (|spadConstant| $ 30) -1 $))
                ((QREFELT $ 135)
                 (|ISUPS;iTan| |uts| (SPADCALL |uts| (QREFELT $ 72))
                  (SPADCALL |cc| (QREFELT $ 175)) -1 $))
                ('T (|error| (STRCONC "tanh: " (QREFELT $ 127))))))) 

(SDEFUN |ISUPS;cCoth;2$;87| ((|uts| $) ($ $))
        (SPROG ((#1=#:G1026 NIL) (|tanhUts| ($)))
               (SEQ
                (LETT |tanhUts| (SPADCALL |uts| (QREFELT $ 176))
                      . #2=(|ISUPS;cCoth;2$;87|))
                (EXIT
                 (COND
                  ((SPADCALL |tanhUts| (QREFELT $ 65))
                   (|error| "coth: coth(0) is undefined"))
                  ((SPADCALL (SPADCALL |tanhUts| 0 (QREFELT $ 57))
                             (QREFELT $ 16))
                   (|error| (STRCONC "coth: " (QREFELT $ 128))))
                  ('T
                   (PROG2
                       (LETT #1#
                             (SPADCALL (|spadConstant| $ 38) |tanhUts| 'T
                                       (QREFELT $ 100))
                             . #2#)
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 0) $ (|Union| $ "failed")
                                     #1#)))))))) 

(SDEFUN |ISUPS;cSech;2$;88| ((|uts| $) ($ $))
        (SPROG ((#1=#:G1033 NIL) (|coshUts| ($)))
               (SEQ
                (LETT |coshUts| (SPADCALL |uts| (QREFELT $ 174))
                      . #2=(|ISUPS;cSech;2$;88|))
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |coshUts| 0 (QREFELT $ 57))
                             (QREFELT $ 16))
                   (|error| (STRCONC "sech: " (QREFELT $ 128))))
                  ('T
                   (PROG2
                       (LETT #1#
                             (SPADCALL (|spadConstant| $ 38) |coshUts| 'T
                                       (QREFELT $ 100))
                             . #2#)
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 0) $ (|Union| $ "failed")
                                     #1#)))))))) 

(SDEFUN |ISUPS;cCsch;2$;89| ((|uts| $) ($ $))
        (SPROG ((#1=#:G1039 NIL) (|sinhUts| ($)))
               (SEQ
                (LETT |sinhUts| (SPADCALL |uts| (QREFELT $ 173))
                      . #2=(|ISUPS;cCsch;2$;89|))
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |sinhUts| 0 (QREFELT $ 57))
                             (QREFELT $ 16))
                   (|error| (STRCONC "csch: " (QREFELT $ 128))))
                  ('T
                   (PROG2
                       (LETT #1#
                             (SPADCALL (|spadConstant| $ 38) |sinhUts| 'T
                                       (QREFELT $ 100))
                             . #2#)
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 0) $ (|Union| $ "failed")
                                     #1#)))))))) 

(SDEFUN |ISUPS;cAsinh;2$;90| ((|uts| $) ($ $))
        (SPROG
         ((#1=#:G1052 NIL) (|order| (|Integer|))
          (|ord| (|Union| (|Integer|) "failed")) (|cc| (|Coef|)) (|x| ($)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |x|
                  (SPADCALL (|spadConstant| $ 38)
                            (SPADCALL |uts| |uts| (QREFELT $ 97))
                            (QREFELT $ 83))
                  . #2=(|ISUPS;cAsinh;2$;90|))
            (EXIT
             (COND
              ((SPADCALL (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57)) . #2#)
                         (QREFELT $ 16))
               (SPADCALL
                (SPADCALL |uts|
                          (SPADCALL |x| (SPADCALL 1 2 (QREFELT $ 110))
                                    (QREFELT $ 143))
                          (QREFELT $ 83))
                (QREFELT $ 147)))
              ((QREFELT $ 135)
               (SEQ (LETT |ord| (|ISUPS;orderOrFailed| |x| $) . #2#)
                    (EXIT
                     (COND
                      ((QEQCAR |ord| 1)
                       (|error| (STRCONC "asinh: " (QREFELT $ 130))))
                      ((EQL (LETT |order| (QCDR |ord|) . #2#) -1)
                       (PROGN
                        (LETT #1#
                              (SPADCALL (SPADCALL |cc| (QREFELT $ 180))
                                        (QREFELT $ 27))
                              . #2#)
                        (GO #3=#:G1051)))
                      ((ODDP |order|)
                       (|error| (STRCONC "asinh: " (QREFELT $ 129))))
                      (#4='T
                       (SPADCALL
                        (SPADCALL |uts|
                                  (SPADCALL |x| (SPADCALL 1 2 (QREFELT $ 110))
                                            (QREFELT $ 143))
                                  (QREFELT $ 83))
                        (QREFELT $ 147)))))))
              (#4# (|error| (STRCONC "asinh: " (QREFELT $ 127))))))))
          #3# (EXIT #1#)))) 

(SDEFUN |ISUPS;cAcosh;2$;91| ((|uts| $) ($ $))
        (SPROG
         ((#1=#:G1067 NIL) (|order| (|Integer|))
          (|ord| (|Union| (|Integer|) "failed")) (|x| ($)) (|cc| (|Coef|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |uts| (QREFELT $ 65))
             (COND
              ((QREFELT $ 135)
               (SPADCALL (SPADCALL (|spadConstant| $ 30) (QREFELT $ 182))
                         (QREFELT $ 27)))
              (#2='T (|error| (STRCONC "acosh: " (QREFELT $ 127))))))
            ((QREFELT $ 135)
             (SEQ
              (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57))
                    . #3=(|ISUPS;cAcosh;2$;91|))
              (LETT |x|
                    (SPADCALL (SPADCALL |uts| |uts| (QREFELT $ 97))
                              (|spadConstant| $ 38) (QREFELT $ 66))
                    . #3#)
              (COND
               ((OR (SPADCALL |cc| (|spadConstant| $ 39) (QREFELT $ 138))
                    (SPADCALL |cc|
                              (SPADCALL (|spadConstant| $ 39) (QREFELT $ 85))
                              (QREFELT $ 138)))
                (EXIT
                 (SEQ (LETT |ord| (|ISUPS;orderOrFailed| |x| $) . #3#)
                      (EXIT
                       (COND
                        ((QEQCAR |ord| 1)
                         (|error| (STRCONC "acosh: " (QREFELT $ 130))))
                        ((EQL (LETT |order| (QCDR |ord|) . #3#) -1)
                         (PROGN
                          (LETT #1#
                                (SPADCALL (SPADCALL |cc| (QREFELT $ 182))
                                          (QREFELT $ 27))
                                . #3#)
                          (GO #4=#:G1066)))
                        ((ODDP |order|)
                         (|error| (STRCONC "acosh: " (QREFELT $ 129))))
                        (#2#
                         (SPADCALL
                          (SPADCALL |uts|
                                    (SPADCALL |x|
                                              (SPADCALL 1 2 (QREFELT $ 110))
                                              (QREFELT $ 143))
                                    (QREFELT $ 83))
                          (QREFELT $ 147)))))))))
              (EXIT
               (SPADCALL
                (SPADCALL |uts|
                          (SPADCALL |x| (SPADCALL 1 2 (QREFELT $ 110))
                                    (QREFELT $ 143))
                          (QREFELT $ 83))
                (QREFELT $ 147)))))
            (#2# (|error| (STRCONC "acosh: " (QREFELT $ 127))))))
          #4# (EXIT #1#)))) 

(SDEFUN |ISUPS;cAtanh;2$;92| ((|uts| $) ($ $))
        (SPROG ((|cc| (|Coef|)) (|half| (|Coef|)))
               (SEQ
                (LETT |half|
                      (SPADCALL
                       (SPADCALL (SPADCALL 2 (QREFELT $ 113)) (QREFELT $ 114))
                       (QREFELT $ 142))
                      . #1=(|ISUPS;cAtanh;2$;92|))
                (EXIT
                 (COND
                  ((SPADCALL
                    (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57)) . #1#)
                    (QREFELT $ 16))
                   (SPADCALL |half|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 38) |uts|
                                         (QREFELT $ 83))
                               (QREFELT $ 147))
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 38) |uts|
                                         (QREFELT $ 66))
                               (QREFELT $ 147))
                              (QREFELT $ 66))
                             (QREFELT $ 115)))
                  ((QREFELT $ 135)
                   (COND
                    ((OR (SPADCALL |cc| (|spadConstant| $ 39) (QREFELT $ 138))
                         (SPADCALL |cc|
                                   (SPADCALL (|spadConstant| $ 39)
                                             (QREFELT $ 85))
                                   (QREFELT $ 138)))
                     (|error| (STRCONC "atanh: " (QREFELT $ 131))))
                    ('T
                     (SPADCALL |half|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 38) |uts|
                                           (QREFELT $ 83))
                                 (QREFELT $ 147))
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 38) |uts|
                                           (QREFELT $ 66))
                                 (QREFELT $ 147))
                                (QREFELT $ 66))
                               (QREFELT $ 115)))))
                  ('T (|error| (STRCONC "atanh: " (QREFELT $ 127))))))))) 

(SDEFUN |ISUPS;cAcoth;2$;93| ((|uts| $) ($ $))
        (SPROG ((|half| (|Coef|)) (|cc| (|Coef|)))
               (SEQ
                (COND
                 ((SPADCALL |uts| (QREFELT $ 65))
                  (COND
                   ((QREFELT $ 135)
                    (SPADCALL (SPADCALL (|spadConstant| $ 30) (QREFELT $ 185))
                              (QREFELT $ 27)))
                   (#1='T (|error| (STRCONC "acoth: " (QREFELT $ 127))))))
                 ((QREFELT $ 135)
                  (SEQ
                   (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57))
                         . #2=(|ISUPS;cAcoth;2$;93|))
                   (LETT |half|
                         (SPADCALL
                          (SPADCALL (SPADCALL 2 (QREFELT $ 113))
                                    (QREFELT $ 114))
                          (QREFELT $ 142))
                         . #2#)
                   (COND
                    ((OR (SPADCALL |cc| (|spadConstant| $ 39) (QREFELT $ 138))
                         (SPADCALL |cc|
                                   (SPADCALL (|spadConstant| $ 39)
                                             (QREFELT $ 85))
                                   (QREFELT $ 138)))
                     (EXIT (|error| (STRCONC "acoth: " (QREFELT $ 131))))))
                   (EXIT
                    (SPADCALL |half|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |uts| (|spadConstant| $ 38)
                                          (QREFELT $ 83))
                                (QREFELT $ 147))
                               (SPADCALL
                                (SPADCALL |uts| (|spadConstant| $ 38)
                                          (QREFELT $ 66))
                                (QREFELT $ 147))
                               (QREFELT $ 66))
                              (QREFELT $ 115)))))
                 (#1# (|error| (STRCONC "acoth: " (QREFELT $ 127)))))))) 

(SDEFUN |ISUPS;cAsech;2$;94| ((|uts| $) ($ $))
        (SPROG
         ((|utsInv| (|Union| $ "failed")) (#1=#:G1098 NIL)
          (|order| (|Integer|)) (|ord| (|Union| (|Integer|) "failed"))
          (|x| ($)) (|cc| (|Coef|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |uts| (QREFELT $ 65))
             (|error| "asech: asech(0) is undefined"))
            ((QREFELT $ 135)
             (COND
              ((SPADCALL
                (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57))
                      . #2=(|ISUPS;cAsech;2$;94|))
                (QREFELT $ 16))
               (|error| (STRCONC "asech: " (QREFELT $ 132))))
              (#3='T
               (SEQ
                (LETT |x|
                      (SPADCALL (|spadConstant| $ 38)
                                (SPADCALL |uts| |uts| (QREFELT $ 97))
                                (QREFELT $ 66))
                      . #2#)
                (COND
                 ((OR (SPADCALL |cc| (|spadConstant| $ 39) (QREFELT $ 138))
                      (SPADCALL |cc|
                                (SPADCALL (|spadConstant| $ 39) (QREFELT $ 85))
                                (QREFELT $ 138)))
                  (EXIT
                   (SEQ (LETT |ord| (|ISUPS;orderOrFailed| |x| $) . #2#)
                        (EXIT
                         (COND
                          ((QEQCAR |ord| 1)
                           (|error| (STRCONC "asech: " (QREFELT $ 130))))
                          ((EQL (LETT |order| (QCDR |ord|) . #2#) -1)
                           (PROGN
                            (LETT #1#
                                  (SPADCALL (SPADCALL |cc| (QREFELT $ 187))
                                            (QREFELT $ 27))
                                  . #2#)
                            (GO #4=#:G1097)))
                          ((ODDP |order|)
                           (|error| (STRCONC "asech: " (QREFELT $ 129))))
                          (#3#
                           (SEQ
                            (LETT |utsInv|
                                  (SPADCALL (|spadConstant| $ 38) |uts| 'T
                                            (QREFELT $ 100))
                                  . #2#)
                            (EXIT
                             (COND
                              ((QEQCAR |utsInv| 1)
                               (|error| (STRCONC "asech: " (QREFELT $ 133))))
                              (#3#
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 38)
                                           (SPADCALL |x|
                                                     (SPADCALL 1 2
                                                               (QREFELT $ 110))
                                                     (QREFELT $ 143))
                                           (QREFELT $ 83))
                                 (QCDR |utsInv|) (QREFELT $ 97))
                                (QREFELT $ 147)))))))))))))
                (LETT |utsInv|
                      (SPADCALL (|spadConstant| $ 38) |uts| 'T (QREFELT $ 100))
                      . #2#)
                (EXIT
                 (COND
                  ((QEQCAR |utsInv| 1)
                   (|error| (STRCONC "asech: " (QREFELT $ 133))))
                  (#3#
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 38)
                               (SPADCALL |x| (SPADCALL 1 2 (QREFELT $ 110))
                                         (QREFELT $ 143))
                               (QREFELT $ 83))
                     (QCDR |utsInv|) (QREFELT $ 97))
                    (QREFELT $ 147)))))))))
            (#3# (|error| (STRCONC "asech: " (QREFELT $ 127))))))
          #4# (EXIT #1#)))) 

(SDEFUN |ISUPS;cAcsch;2$;95| ((|uts| $) ($ $))
        (SPROG
         ((|utsInv| (|Union| $ "failed")) (#1=#:G1113 NIL)
          (|order| (|Integer|)) (|ord| (|Union| (|Integer|) "failed"))
          (|x| ($)) (|cc| (|Coef|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |uts| (QREFELT $ 65))
             (|error| "acsch: acsch(0) is undefined"))
            ((QREFELT $ 135)
             (COND
              ((SPADCALL
                (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57))
                      . #2=(|ISUPS;cAcsch;2$;95|))
                (QREFELT $ 16))
               (|error| (STRCONC "acsch: " (QREFELT $ 132))))
              (#3='T
               (SEQ
                (LETT |x|
                      (SPADCALL (SPADCALL |uts| |uts| (QREFELT $ 97))
                                (|spadConstant| $ 38) (QREFELT $ 83))
                      . #2#)
                (LETT |ord| (|ISUPS;orderOrFailed| |x| $) . #2#)
                (EXIT
                 (COND
                  ((QEQCAR |ord| 1)
                   (|error| (STRCONC "acsc: " (QREFELT $ 130))))
                  ((EQL (LETT |order| (QCDR |ord|) . #2#) -1)
                   (PROGN
                    (LETT #1#
                          (SPADCALL (SPADCALL |cc| (QREFELT $ 189))
                                    (QREFELT $ 27))
                          . #2#)
                    (GO #4=#:G1112)))
                  ((ODDP |order|)
                   (|error| (STRCONC "acsch: " (QREFELT $ 129))))
                  (#3#
                   (SEQ
                    (LETT |utsInv|
                          (SPADCALL (|spadConstant| $ 38) |uts| 'T
                                    (QREFELT $ 100))
                          . #2#)
                    (EXIT
                     (COND
                      ((QEQCAR |utsInv| 1)
                       (|error| (STRCONC "acsch: " (QREFELT $ 133))))
                      (#3#
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 38)
                                   (SPADCALL |x| (SPADCALL 1 2 (QREFELT $ 110))
                                             (QREFELT $ 143))
                                   (QREFELT $ 83))
                         (QCDR |utsInv|) (QREFELT $ 97))
                        (QREFELT $ 147)))))))))))))
            (#3# (|error| (STRCONC "acsch: " (QREFELT $ 127))))))
          #4# (EXIT #1#)))) 

(PUT '|ISUPS;factorials?| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |ISUPS;factorials?| (($ |Boolean|)) NIL) 

(SDEFUN |ISUPS;termOutput|
        ((|k| |Fraction| (|Integer|)) (|c| |Coef|) (|vv| |OutputForm|)
         ($ |OutputForm|))
        (SPROG ((|mon| (|OutputForm|)))
               (SEQ
                (COND
                 ((SPADCALL |k| (|spadConstant| $ 191) (QREFELT $ 192))
                  (SPADCALL |c| (QREFELT $ 194)))
                 (#1='T
                  (SEQ
                   (LETT |mon|
                         (COND
                          ((SPADCALL |k| (|spadConstant| $ 195)
                                     (QREFELT $ 192))
                           |vv|)
                          (#1#
                           (SPADCALL |vv| (SPADCALL |k| (QREFELT $ 196))
                                     (QREFELT $ 197))))
                         |ISUPS;termOutput|)
                   (EXIT
                    (COND
                     ((SPADCALL |c| (|spadConstant| $ 39) (QREFELT $ 138))
                      |mon|)
                     ((SPADCALL |c|
                                (SPADCALL (|spadConstant| $ 39) (QREFELT $ 85))
                                (QREFELT $ 138))
                      (SPADCALL |mon| (QREFELT $ 198)))
                     (#1#
                      (SPADCALL (SPADCALL |c| (QREFELT $ 194)) |mon|
                                (QREFELT $ 199))))))))))) 

(PUT '|ISUPS;showAll?| '|SPADreplace| '(XLAM NIL 'T)) 

(SDEFUN |ISUPS;showAll?| (($ |Boolean|)) 'T) 

(SDEFUN |ISUPS;seriesToOutputForm;SRSCoefFOf;99|
        ((|st| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|refer| |Reference| (|OrderedCompletion| (|Integer|)))
         (|var| |Symbol|) (|cen| |Coef|) (|r| |Fraction| (|Integer|))
         ($ |OutputForm|))
        (SPROG
         ((|l| (|List| (|OutputForm|))) (|deg| (|Union| (|Integer|) "failed"))
          (|term| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
          (|vv| (|OutputForm|)))
         (SEQ
          (LETT |vv|
                (COND
                 ((SPADCALL |cen| (QREFELT $ 16))
                  (SPADCALL |var| (QREFELT $ 201)))
                 (#1='T
                  (SPADCALL
                   (SPADCALL (SPADCALL |var| (QREFELT $ 201))
                             (SPADCALL |cen| (QREFELT $ 194)) (QREFELT $ 202))
                   (QREFELT $ 203))))
                . #2=(|ISUPS;seriesToOutputForm;SRSCoefFOf;99|))
          (LETT |l| NIL . #2#)
          (SEQ G190 (COND ((NULL (SPADCALL |st| (QREFELT $ 43))) (GO G191)))
               (SEQ (LETT |term| (SPADCALL |st| (QREFELT $ 32)) . #2#)
                    (LETT |l|
                          (CONS
                           (|ISUPS;termOutput|
                            (SPADCALL (|ISUPS;getExpon| |term| $) |r|
                                      (QREFELT $ 204))
                            (|ISUPS;getCoef| |term| $) |vv| $)
                           |l|)
                          . #2#)
                    (EXIT (LETT |st| (SPADCALL |st| (QREFELT $ 24)) . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |l|
                (COND ((SPADCALL |st| (QREFELT $ 42)) |l|)
                      (#1#
                       (SEQ
                        (LETT |deg|
                              (SPADCALL (SPADCALL |refer| (QREFELT $ 40))
                                        (QREFELT $ 206))
                              . #2#)
                        (EXIT
                         (COND
                          ((QEQCAR |deg| 0)
                           (CONS
                            (SPADCALL (SPADCALL 'O (QREFELT $ 201))
                                      (LIST
                                       (SPADCALL |vv|
                                                 (SPADCALL
                                                  (SPADCALL (+ (QCDR |deg|) 1)
                                                            |r|
                                                            (QREFELT $ 204))
                                                  (QREFELT $ 196))
                                                 (QREFELT $ 197)))
                                      (QREFELT $ 208))
                            |l|))
                          (#1# |l|))))))
                . #2#)
          (EXIT
           (COND ((NULL |l|) (SPADCALL (|spadConstant| $ 30) (QREFELT $ 194)))
                 (#1#
                  (SPADCALL (ELT $ 209) (NREVERSE |l|) (QREFELT $ 212)))))))) 

(DECLAIM (NOTINLINE |InnerSparseUnivariatePowerSeries;|)) 

(DEFUN |InnerSparseUnivariatePowerSeries| (#1=#:G1144)
  (SPROG NIL
         (PROG (#2=#:G1145)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|InnerSparseUnivariatePowerSeries|)
                                               '|domainEqualList|)
                    . #3=(|InnerSparseUnivariatePowerSeries|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|InnerSparseUnivariatePowerSeries;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|InnerSparseUnivariatePowerSeries|)))))))))) 

(DEFUN |InnerSparseUnivariatePowerSeries;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G1136 NIL) (#2=#:G1137 NIL) (#3=#:G1138 NIL)
    (#4=#:G1139 NIL) (#5=#:G1140 NIL) (#6=#:G1143 NIL) ($ NIL) (|dv$| NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #7=(|InnerSparseUnivariatePowerSeries|))
    (LETT |dv$| (LIST '|InnerSparseUnivariatePowerSeries| DV$1) . #7#)
    (LETT $ (GETREFV 223) . #7#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (LETT #6#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #7#)
                                        (OR #6#
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
                                        (|HasSignature| |#1|
                                                        (LIST '*
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Integer|)
                                                               (|devaluate|
                                                                |#1|))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (|HasCategory| (|Integer|)
                                                       '(|SemiGroup|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasSignature| |#1|
                                                        (LIST '^
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Integer|))))
                                        (AND
                                         (|HasSignature| |#1|
                                                         (LIST '^
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|))))
                                         (|HasSignature| |#1|
                                                         (LIST '|coerce|
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Symbol|)))))
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|))
                                              . #7#)
                                        (OR #5#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (LETT #4#
                                              (|HasCategory| |#1| '(|Ring|))
                                              . #7#)
                                        (OR #6#
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|))
                                            #4#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #4#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #6#
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #4#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              . #7#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #3#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #6#
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #4#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|))
                                              . #7#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #3# #2#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #6#
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #4#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|AbelianMonoid|))
                                              . #7#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #3# #1# #2#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #6#
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #4#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|)
                                                                (|devaluate|
                                                                 |#1|)))))))
                    . #7#))
    (|haddProp| |$ConstructorCache| '|InnerSparseUnivariatePowerSeries|
                (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| |#1| '(|IntegralDomain|))
         (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 16777216))
    (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 33554432))
    (AND
     (OR (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         #5#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 67108864))
    (AND
     (OR (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         #4#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 134217728))
    (AND
     (OR #3# (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 268435456))
    (AND
     (OR #2# (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 536870912))
    (AND
     (OR #1# (AND #6# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 1073741824))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7
              (|Record|
               (|:| |%ord| (|Reference| (|OrderedCompletion| (|Integer|))))
               (|:| |%str|
                    (|Stream|
                     (|Record| (|:| |k| (|Integer|)) (|:| |c| |#1|))))))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 112 (CONS (|dispatchFunction| |ISUPS;integrate;2$;56|) $))
       NIL
       NIL
       NIL
       (QSETREFV $ 121 (CONS (|dispatchFunction| |ISUPS;cPower;$Coef$;60|) $))
       NIL
       NIL
       NIL
       NIL
       NIL
       (QSETREFV $ 127 "series expansion involves transcendental constants")
       (QSETREFV $ 128 "series expansion has terms of negative degree")
       (QSETREFV $ 129 "series expansion has terms of fractional degree")
       (QSETREFV $ 130 "series expansion may have terms of fractional degree")
       (QSETREFV $ 131 "series expansion has logarithmic term")
       (QSETREFV $ 132
                 "series expansion has terms of negative degree or logarithmic term")
       (QSETREFV $ 133 "leading coefficient not invertible")
       NIL
       (QSETREFV $ 134
                 (|HasSignature| |#1|
                                 (LIST '^
                                       (LIST (|devaluate| |#1|)
                                             (|devaluate| |#1|)
                                             '(|Fraction| (|Integer|))))))
       (QSETREFV $ 135
                 (|HasCategory| |#1| '(|TranscendentalFunctionCategory|)))
       (QSETREFV $ 143
                 (CONS (|dispatchFunction| |ISUPS;cRationalPower;$F$;67|) $))
       (QSETREFV $ 145 (CONS (|dispatchFunction| |ISUPS;cExp;2$;68|) $))
       (QSETREFV $ 147 (CONS (|dispatchFunction| |ISUPS;cLog;2$;69|) $))
       NIL
       (QSETREFV $ 150 (CONS (|dispatchFunction| |ISUPS;cSin;2$;71|) $))
       (QSETREFV $ 151 (CONS (|dispatchFunction| |ISUPS;cCos;2$;72|) $))
       (QSETREFV $ 153 (CONS (|dispatchFunction| |ISUPS;cTan;2$;73|) $))
       (QSETREFV $ 155 (CONS (|dispatchFunction| |ISUPS;cCot;2$;74|) $))
       (QSETREFV $ 156 (CONS (|dispatchFunction| |ISUPS;cSec;2$;75|) $))
       (QSETREFV $ 157 (CONS (|dispatchFunction| |ISUPS;cCsc;2$;76|) $))
       (QSETREFV $ 160 (CONS (|dispatchFunction| |ISUPS;cAsin;2$;77|) $))
       (QSETREFV $ 162 (CONS (|dispatchFunction| |ISUPS;cAcos;2$;78|) $))
       (QSETREFV $ 164 (CONS (|dispatchFunction| |ISUPS;cAtan;2$;79|) $))
       (QSETREFV $ 166 (CONS (|dispatchFunction| |ISUPS;cAcot;2$;80|) $))
       (QSETREFV $ 168 (CONS (|dispatchFunction| |ISUPS;cAsec;2$;81|) $))
       (QSETREFV $ 170 (CONS (|dispatchFunction| |ISUPS;cAcsc;2$;82|) $))
       NIL
       (QSETREFV $ 173 (CONS (|dispatchFunction| |ISUPS;cSinh;2$;84|) $))
       (QSETREFV $ 174 (CONS (|dispatchFunction| |ISUPS;cCosh;2$;85|) $))
       (QSETREFV $ 176 (CONS (|dispatchFunction| |ISUPS;cTanh;2$;86|) $))
       (QSETREFV $ 177 (CONS (|dispatchFunction| |ISUPS;cCoth;2$;87|) $))
       (QSETREFV $ 178 (CONS (|dispatchFunction| |ISUPS;cSech;2$;88|) $))
       (QSETREFV $ 179 (CONS (|dispatchFunction| |ISUPS;cCsch;2$;89|) $))
       (QSETREFV $ 181 (CONS (|dispatchFunction| |ISUPS;cAsinh;2$;90|) $))
       (QSETREFV $ 183 (CONS (|dispatchFunction| |ISUPS;cAcosh;2$;91|) $))
       (QSETREFV $ 184 (CONS (|dispatchFunction| |ISUPS;cAtanh;2$;92|) $))
       (QSETREFV $ 186 (CONS (|dispatchFunction| |ISUPS;cAcoth;2$;93|) $))
       (QSETREFV $ 188 (CONS (|dispatchFunction| |ISUPS;cAsech;2$;94|) $))
       (QSETREFV $ 190 (CONS (|dispatchFunction| |ISUPS;cAcsch;2$;95|) $)))))
    $))) 

(MAKEPROP '|InnerSparseUnivariatePowerSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Reference| 18)
              (|Record| (|:| |k| 21) (|:| |c| 6)) (|Stream| 9)
              |ISUPS;makeSeries;RS$;4| |ISUPS;getRef;$R;5|
              |ISUPS;getStream;$S;6| (0 . |empty|) (|Boolean|) (4 . |zero?|)
              (9 . |concat|) (|OrderedCompletion| 21) (15 . |plusInfinity|)
              (19 . |ref|) (|Integer|) |ISUPS;monomial;CoefI$;7|
              (24 . |empty?|) (29 . |rst|) |ISUPS;monomial?;$B;8|
              (34 . |coerce|) |ISUPS;coerce;Coef$;10| |ISUPS;coerce;I$;9|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |ISUPS;Zero;$;14|) $))
              (39 . |Zero|) (43 . |setelt!|) (49 . |frst|) (54 . |coerce|)
              |ISUPS;series;S$;12| (|NonNegativeInteger|)
              (59 . |characteristic|) |ISUPS;characteristic;Nni;13|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |ISUPS;One;$;15|) $))
              (63 . |One|) (67 . |elt|) (72 . <) (78 . |explicitlyEmpty?|)
              (83 . |explicitEntries?|) (88 . |lazyEvaluate|)
              |ISUPS;extend;$I$;17| |ISUPS;complete;2$;18| (93 . >) (99 . >=)
              (105 . |One|) (109 . +) (115 . |retract|) (|Mapping| $)
              (120 . |delay|) (125 . |minusInfinity|) |ISUPS;truncate;$I$;21|
              |ISUPS;truncate;$2I$;22| |ISUPS;coefficient;$ICoef;24|
              |ISUPS;elt;$ICoef;25| (129 . |finite?|) |ISUPS;order;$I;27|
              |ISUPS;order;$2I;28| |ISUPS;terms;$S;29| (|SingleInteger|)
              (134 . |whatInfinity|) |ISUPS;zero?;$B;30| |ISUPS;-;3$;41|
              |ISUPS;=;2$B;31| (|Mapping| 6 6) |ISUPS;map;M2$;34| (139 . *)
              (145 . -) |ISUPS;differentiate;2$;35| (151 . *) (|Mapping| 6 21)
              |ISUPS;multiplyCoefficients;M2$;36| (|PositiveInteger|) (157 . *)
              |ISUPS;multiplyExponents;$Pi$;37| (163 . =) (169 . <)
              (175 . |min|) (181 . +) |ISUPS;+;3$;40| (187 . -) (193 . -)
              |ISUPS;-;2$;42| |ISUPS;*;I2$;43| (198 . *) |ISUPS;*;Nni2$;44|
              (204 . *) |ISUPS;*;Pi2$;45| (|Void|) (210 . |void|) (214 . +)
              (220 . |lazy?|) (225 . |One|) |ISUPS;*;3$;49|
              (|Union| $ '"failed") (229 . |recip|) |ISUPS;iExquo;2$BU;52|
              |ISUPS;taylorQuoByVar;2$;53| (234 . *) (240 . |zero?|) (245 . ^)
              (251 . *) (257 . |One|) (261 . -) |ISUPS;iCompose;3$;55|
              (|Fraction| 21) (266 . /) (272 . *) (278 . |integrate|)
              (283 . |coerce|) (288 . |inv|) (293 . *) (299 . |Zero|)
              (303 . |Zero|) (|Mapping| 10 10)
              (|ParadoxicalCombinatorsForStreams| 9) (307 . Y) (312 . |cPower|)
              (318 . |Zero|) (|List| 10) (322 . |second|) (|Mapping| 123 123)
              (327 . Y) 'TRCONST 'NPOWERS 'FPOWERS 'MAYFPOW 'LOGS 'NPOWLOG
              'NOTINV 'RATPOWERS 'TRANSFCN (333 . |denom|) (338 . |exquo|)
              (344 . =) (350 . |numer|) (355 . ^) (361 . ^) (367 . |coerce|)
              (372 . |cRationalPower|) (378 . |exp|) (383 . |cExp|)
              (388 . |log|) (393 . |cLog|) (398 . |sin|) (403 . |cos|)
              (408 . |cSin|) (413 . |cCos|) (418 . |tan|) (423 . |cTan|)
              (428 . |cot|) (433 . |cCot|) (438 . |cSec|) (443 . |cCsc|)
              (448 . -) (453 . |asin|) (458 . |cAsin|) (463 . |acos|)
              (468 . |cAcos|) (473 . |atan|) (478 . |cAtan|) (483 . |acot|)
              (488 . |cAcot|) (493 . |asec|) (498 . |cAsec|) (503 . |acsc|)
              (508 . |cAcsc|) (513 . |sinh|) (518 . |cosh|) (523 . |cSinh|)
              (528 . |cCosh|) (533 . |tanh|) (538 . |cTanh|) (543 . |cCoth|)
              (548 . |cSech|) (553 . |cCsch|) (558 . |asinh|) (563 . |cAsinh|)
              (568 . |acosh|) (573 . |cAcosh|) (578 . |cAtanh|) (583 . |acoth|)
              (588 . |cAcoth|) (593 . |asech|) (598 . |cAsech|) (603 . |acsch|)
              (608 . |cAcsch|) (613 . |Zero|) (617 . =) (|OutputForm|)
              (623 . |coerce|) (628 . |One|) (632 . |coerce|) (637 . ^)
              (643 . -) (648 . *) (|Symbol|) (654 . |coerce|) (659 . -)
              (665 . |paren|) (670 . *) (|Union| 21 '"failed")
              (676 . |retractIfCan|) (|List| $) (681 . |prefix|) (687 . +)
              (|Mapping| 193 193 193) (|List| 193) (693 . |reduce|)
              |ISUPS;seriesToOutputForm;SRSCoefFOf;99|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|List| 200) (|List| 35) (|Stream| 6) (|List| 220) (|List| 21)
              (|SingletonAsOrderedSet|) (|HashState|) (|String|))
           '#(~= 699 |zero?| 705 |variables| 710 |variable| 715 |unitNormal|
              720 |unitCanonical| 725 |unit?| 730 |truncate| 735 |terms| 748
              |taylorQuoByVar| 753 |subtractIfCan| 758 |seriesToOutputForm| 764
              |series| 773 |sample| 778 |reductum| 782 |recip| 787 |pole?| 792
              |order| 797 |opposite?| 808 |one?| 814 |multiplyExponents| 819
              |multiplyCoefficients| 825 |monomial?| 831 |monomial| 836 |map|
              856 |makeSeries| 862 |leadingMonomial| 868 |leadingCoefficient|
              873 |latex| 878 |integrate| 883 |iExquo| 888 |iCompose| 895
              |hashUpdate!| 901 |hash| 907 |getStream| 912 |getRef| 917
              |extend| 922 |exquo| 928 |eval| 934 |elt| 940 |differentiate| 952
              |degree| 989 |complete| 994 |coerce| 999 |coefficient| 1024
              |charthRoot| 1030 |characteristic| 1035 |center| 1039 |cTanh|
              1044 |cTan| 1049 |cSinh| 1054 |cSin| 1059 |cSech| 1064 |cSec|
              1069 |cRationalPower| 1074 |cPower| 1080 |cLog| 1086 |cExp| 1091
              |cCsch| 1096 |cCsc| 1101 |cCoth| 1106 |cCot| 1111 |cCosh| 1116
              |cCos| 1121 |cAtanh| 1126 |cAtan| 1131 |cAsinh| 1136 |cAsin| 1141
              |cAsech| 1146 |cAsec| 1151 |cAcsch| 1156 |cAcsc| 1161 |cAcoth|
              1166 |cAcot| 1171 |cAcosh| 1176 |cAcos| 1181 |associates?| 1186
              |approximate| 1192 |annihilate?| 1198 ^ 1204 |Zero| 1216 |One|
              1220 D 1224 = 1261 / 1267 - 1273 + 1284 * 1290)
           'NIL
           (CONS
            (|makeByteWordVec2| 24
                                '(0 0 0 2 1 2 5 1 6 2 2 3 4 5 8 7 0 1 6 18 0 0
                                  1 1 6 16 18 20 14 22 0 14 24 0 0 0 0 0 0 6 2
                                  17 9))
            (CONS
             '#(|UnivariatePowerSeriesCategory&| |PowerSeriesCategory&|
                |AbelianMonoidRing&| NIL |Algebra&| |Algebra&| |Algebra&|
                |Module&| NIL |Module&| |EntireRing&| NIL NIL |Module&|
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL NIL
                |Ring&| NIL NIL NIL NIL NIL NIL |Rng&| |AbelianGroup&| NIL NIL
                NIL |Monoid&| |AbelianMonoid&| |AbelianSemiGroup&| |SemiGroup&|
                |SetCategory&| NIL |BasicType&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|UnivariatePowerSeriesCategory| 6 21)
                 (|PowerSeriesCategory| 6 21 220) (|AbelianMonoidRing| 6 21)
                 (|IntegralDomain|) (|Algebra| 109) (|Algebra| $$)
                 (|Algebra| 6) (|Module| 109) (|CommutativeRing|) (|Module| $$)
                 (|EntireRing|) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Module| 6)
                 (|PartialDifferentialRing| 200) (|DifferentialRing|)
                 (|BiModule| 6 6) (|BiModule| 109 109) (|BiModule| $$ $$)
                 (|Ring|) (|LeftModule| 6) (|RightModule| 6) (|LeftModule| 109)
                 (|RightModule| 109) (|RightModule| $$) (|LeftModule| $$)
                 (|Rng|) (|AbelianGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiRng|) (|Monoid|)
                 (|AbelianMonoid|) (|AbelianSemiGroup|) (|SemiGroup|)
                 (|SetCategory|) (|VariablesCommuteWithCoefficients|)
                 (|BasicType|) (|CoercibleTo| 193) (|CommutativeStar|)
                 (|noZeroDivisors|) (|unitsKnown|) (|Eltable| $$ $$))
              (|makeByteWordVec2| 222
                                  '(0 10 0 14 1 6 15 0 16 2 10 0 9 0 17 0 18 0
                                    19 1 8 0 18 20 1 10 15 0 23 1 10 0 0 24 1 6
                                    0 21 26 0 6 0 30 2 8 18 0 18 31 1 10 9 0 32
                                    1 18 0 21 33 0 6 35 36 0 6 0 39 1 8 18 0 40
                                    2 18 15 0 0 41 1 10 15 0 42 1 10 15 0 43 1
                                    10 0 0 44 2 21 15 0 0 47 2 18 15 0 0 48 0
                                    21 0 49 2 21 0 0 0 50 1 18 21 0 51 1 10 0
                                    52 53 0 18 0 54 1 18 15 0 59 1 18 63 0 64 2
                                    6 0 21 0 70 2 21 0 0 0 71 2 6 0 0 0 73 2 21
                                    0 76 0 77 2 21 15 0 0 79 2 21 15 0 0 80 2
                                    18 0 0 0 81 2 6 0 0 0 82 2 6 0 0 0 84 1 6 0
                                    0 85 2 6 0 35 0 88 2 6 0 76 0 90 0 92 0 93
                                    2 18 0 0 0 94 1 10 15 0 95 0 76 0 96 1 6 98
                                    0 99 2 18 0 0 0 102 1 21 15 0 103 2 0 0 0
                                    35 104 2 21 0 21 0 105 0 18 0 106 1 18 0 0
                                    107 2 109 0 21 21 110 2 6 0 109 0 111 1 0 0
                                    0 112 1 109 0 21 113 1 109 0 0 114 2 0 0 6
                                    0 115 0 18 0 116 0 35 0 117 1 119 10 118
                                    120 2 0 0 0 6 121 0 21 0 122 1 123 10 0 124
                                    2 119 123 125 21 126 1 109 21 0 136 2 21 98
                                    0 0 137 2 6 15 0 0 138 1 109 21 0 139 2 6 0
                                    0 35 140 2 6 0 0 109 141 1 6 0 109 142 2 0
                                    0 0 109 143 1 6 0 0 144 1 0 0 0 145 1 6 0 0
                                    146 1 0 0 0 147 1 6 0 0 148 1 6 0 0 149 1 0
                                    0 0 150 1 0 0 0 151 1 6 0 0 152 1 0 0 0 153
                                    1 6 0 0 154 1 0 0 0 155 1 0 0 0 156 1 0 0 0
                                    157 1 109 0 0 158 1 6 0 0 159 1 0 0 0 160 1
                                    6 0 0 161 1 0 0 0 162 1 6 0 0 163 1 0 0 0
                                    164 1 6 0 0 165 1 0 0 0 166 1 6 0 0 167 1 0
                                    0 0 168 1 6 0 0 169 1 0 0 0 170 1 6 0 0 171
                                    1 6 0 0 172 1 0 0 0 173 1 0 0 0 174 1 6 0 0
                                    175 1 0 0 0 176 1 0 0 0 177 1 0 0 0 178 1 0
                                    0 0 179 1 6 0 0 180 1 0 0 0 181 1 6 0 0 182
                                    1 0 0 0 183 1 0 0 0 184 1 6 0 0 185 1 0 0 0
                                    186 1 6 0 0 187 1 0 0 0 188 1 6 0 0 189 1 0
                                    0 0 190 0 109 0 191 2 109 15 0 0 192 1 6
                                    193 0 194 0 109 0 195 1 109 193 0 196 2 193
                                    0 0 0 197 1 193 0 0 198 2 193 0 0 0 199 1
                                    200 193 0 201 2 193 0 0 0 202 1 193 0 0 203
                                    2 109 0 21 0 204 1 18 205 0 206 2 193 0 0
                                    207 208 2 193 0 0 0 209 2 211 193 210 0 212
                                    2 0 15 0 0 1 1 31 15 0 65 1 0 218 0 1 1 0
                                    200 0 1 1 25 214 0 1 1 25 0 0 1 1 25 15 0 1
                                    2 0 0 0 21 55 3 0 0 0 21 21 56 1 0 10 0 62
                                    1 0 0 0 101 2 30 98 0 0 1 5 0 193 10 8 200
                                    6 109 213 1 0 0 10 34 0 31 0 1 1 0 0 0 1 1
                                    27 98 0 1 1 0 15 0 1 2 0 21 0 21 61 1 0 21
                                    0 60 2 31 15 0 0 1 1 27 15 0 1 2 0 0 0 76
                                    78 2 0 0 74 0 75 1 0 15 0 25 3 0 0 0 218
                                    219 1 3 0 0 0 220 21 1 2 0 0 6 21 22 2 0 0
                                    68 0 69 2 0 0 8 10 11 1 0 0 0 1 1 0 6 0 1 1
                                    0 222 0 1 1 1 0 0 112 3 0 98 0 0 15 100 2 0
                                    0 0 0 108 2 0 221 221 0 1 1 0 63 0 1 1 0 10
                                    0 13 1 0 8 0 12 2 0 0 0 21 45 2 25 98 0 0 1
                                    2 11 217 0 6 1 2 9 0 0 0 1 2 0 6 0 21 58 2
                                    8 0 0 215 1 2 8 0 0 200 1 3 8 0 0 215 216 1
                                    3 8 0 0 200 35 1 1 7 0 0 72 2 7 0 0 35 1 1
                                    0 21 0 1 1 0 0 0 46 1 26 0 6 27 1 25 0 0 1
                                    1 28 0 21 28 1 1 0 109 1 1 0 193 0 1 2 0 6
                                    0 21 57 1 3 98 0 1 0 28 35 37 1 0 6 0 1 1 1
                                    0 0 176 1 1 0 0 153 1 1 0 0 173 1 1 0 0 150
                                    1 1 0 0 178 1 1 0 0 156 2 1 0 0 109 143 2 1
                                    0 0 6 121 1 1 0 0 147 1 1 0 0 145 1 1 0 0
                                    179 1 1 0 0 157 1 1 0 0 177 1 1 0 0 155 1 1
                                    0 0 174 1 1 0 0 151 1 1 0 0 184 1 1 0 0 164
                                    1 1 0 0 181 1 1 0 0 160 1 1 0 0 188 1 1 0 0
                                    168 1 1 0 0 190 1 1 0 0 170 1 1 0 0 186 1 1
                                    0 0 166 1 1 0 0 183 1 1 0 0 162 2 25 15 0 0
                                    1 2 12 6 0 21 1 2 28 15 0 0 1 2 27 0 0 35
                                    104 2 0 0 0 76 1 0 31 0 29 0 27 0 38 2 8 0
                                    0 215 1 2 8 0 0 200 1 3 8 0 0 200 35 1 3 8
                                    0 0 215 216 1 1 7 0 0 1 2 7 0 0 35 1 2 0 15
                                    0 0 67 2 10 0 0 6 1 1 29 0 0 86 2 29 0 0 0
                                    66 2 0 0 0 0 83 2 29 0 21 0 87 2 31 0 35 0
                                    89 2 1 0 109 0 1 2 1 0 0 109 1 2 0 0 0 6 1
                                    2 0 0 6 0 115 2 0 0 0 0 97 2 0 0 76 0
                                    91)))))
           '|lookupComplete|)) 
