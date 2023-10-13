
(/VERSIONCHECK 2) 

(PUT '|ISUPS;makeTerm| '|SPADreplace| 'CONS) 

(DEFUN |ISUPS;makeTerm| (|exp| |coef| $) (CONS |exp| |coef|)) 

(PUT '|ISUPS;getCoef| '|SPADreplace| 'QCDR) 

(DEFUN |ISUPS;getCoef| (|term| $) (QCDR |term|)) 

(PUT '|ISUPS;getExpon| '|SPADreplace| 'QCAR) 

(DEFUN |ISUPS;getExpon| (|term| $) (QCAR |term|)) 

(PUT '|ISUPS;makeSeries;RS$;4| '|SPADreplace| 'CONS) 

(DEFUN |ISUPS;makeSeries;RS$;4| (|refer| |x| $) (CONS |refer| |x|)) 

(PUT '|ISUPS;getRef;$R;5| '|SPADreplace| 'QCAR) 

(DEFUN |ISUPS;getRef;$R;5| (|ups| $) (QCAR |ups|)) 

(PUT '|ISUPS;getStream;$S;6| '|SPADreplace| 'QCDR) 

(DEFUN |ISUPS;getStream;$S;6| (|ups| $) (QCDR |ups|)) 

(DEFUN |ISUPS;monomial;CoefI$;7| (|coef| |expon| $)
  (PROG (|st| |nix|)
    (RETURN
     (SEQ
      (LETT |nix| (SPADCALL (QREFELT $ 14)) . #1=(|ISUPS;monomial;CoefI$;7|))
      (LETT |st|
            (COND ((SPADCALL |coef| (QREFELT $ 16)) |nix|)
                  ('T
                   (SPADCALL (|ISUPS;makeTerm| |expon| |coef| $) |nix|
                             (QREFELT $ 17))))
            . #1#)
      (EXIT
       (SPADCALL (SPADCALL (SPADCALL (QREFELT $ 19)) (QREFELT $ 20)) |st|
                 (QREFELT $ 11))))))) 

(DEFUN |ISUPS;monomial?;$B;8| (|ups| $)
  (COND ((SPADCALL (SPADCALL |ups| (QREFELT $ 13)) (QREFELT $ 23)) 'NIL)
        ('T
         (SPADCALL (SPADCALL (SPADCALL |ups| (QREFELT $ 13)) (QREFELT $ 24))
                   (QREFELT $ 23))))) 

(DEFUN |ISUPS;coerce;I$;9| (|n| $)
  (SPADCALL (SPADCALL |n| (QREFELT $ 26)) (QREFELT $ 27))) 

(DEFUN |ISUPS;coerce;Coef$;10| (|r| $) (SPADCALL |r| 0 (QREFELT $ 22))) 

(DEFUN |ISUPS;iSeries| (|x| |refer| $)
  (SEQ
   (COND
    ((SPADCALL |x| (QREFELT $ 23))
     (SEQ (SPADCALL |refer| (SPADCALL (QREFELT $ 19)) (QREFELT $ 31))
          (EXIT (SPADCALL (QREFELT $ 14)))))
    ('T
     (SEQ
      (SPADCALL |refer|
                (SPADCALL (|ISUPS;getExpon| (SPADCALL |x| (QREFELT $ 32)) $)
                          (QREFELT $ 33))
                (QREFELT $ 31))
      (EXIT
       (SPADCALL (SPADCALL |x| (QREFELT $ 32))
                 (|ISUPS;iSeries| (SPADCALL |x| (QREFELT $ 24)) |refer| $)
                 (QREFELT $ 17)))))))) 

(DEFUN |ISUPS;series;S$;12| (|x| $)
  (PROG (|refer| |n|)
    (RETURN
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
                         (QREFELT $ 11)))))))))) 

(DEFUN |ISUPS;characteristic;Nni;13| ($) (SPADCALL (QREFELT $ 36))) 

(DEFUN |ISUPS;Zero;$;14| ($) (SPADCALL (|spadConstant| $ 30) 0 (QREFELT $ 22))) 

(DEFUN |ISUPS;One;$;15| ($) (SPADCALL (|spadConstant| $ 39) 0 (QREFELT $ 22))) 

(DEFUN |ISUPS;iExtend| (|st| |n| |refer| $)
  (SEQ
   (COND
    ((SPADCALL (SPADCALL |refer| (QREFELT $ 40)) |n| (QREFELT $ 41))
     (COND
      ((SPADCALL |st| (QREFELT $ 42))
       (SEQ (SPADCALL |refer| (SPADCALL (QREFELT $ 19)) (QREFELT $ 31))
            (EXIT |st|)))
      ((SPADCALL |st| (QREFELT $ 43))
       (|ISUPS;iExtend| (SPADCALL |st| (QREFELT $ 24)) |n| |refer| $))
      (#1='T (|ISUPS;iExtend| (SPADCALL |st| (QREFELT $ 44)) |n| |refer| $))))
    (#1# |st|)))) 

(DEFUN |ISUPS;extend;$I$;17| (|x| |n| $)
  (SEQ
   (|ISUPS;iExtend| (SPADCALL |x| (QREFELT $ 13)) (SPADCALL |n| (QREFELT $ 33))
    (SPADCALL |x| (QREFELT $ 12)) $)
   (EXIT |x|))) 

(DEFUN |ISUPS;complete;2$;18| (|x| $)
  (SEQ
   (|ISUPS;iExtend| (SPADCALL |x| (QREFELT $ 13)) (SPADCALL (QREFELT $ 19))
    (SPADCALL |x| (QREFELT $ 12)) $)
   (EXIT |x|))) 

(DEFUN |ISUPS;iTruncate0| (|x| |xRefer| |refer| |minExp| |maxExp| |n| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL
       (CONS #'|ISUPS;iTruncate0!0|
             (VECTOR |minExp| |maxExp| |xRefer| |n| |refer| $ |x|))
       (QREFELT $ 53)))))) 

(DEFUN |ISUPS;iTruncate0!0| ($$)
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
      (PROG (|nn| |xTerm| |nx| |degr|)
        (RETURN
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT $ 42))
            (SEQ (SPADCALL |refer| (SPADCALL (QREFELT $ 19)) (QREFELT $ 31))
                 (EXIT (SPADCALL (QREFELT $ 14)))))
           ('T
            (SEQ (LETT |nn| (SPADCALL |n| (QREFELT $ 33)) NIL)
                 (SEQ G190
                      (COND
                       ((NULL
                         (SPADCALL (SPADCALL |xRefer| (QREFELT $ 40)) |nn|
                                   (QREFELT $ 41)))
                        (GO G191)))
                      (SEQ (EXIT (SPADCALL |x| (QREFELT $ 44)))) NIL (GO G190)
                      G191 (EXIT NIL))
                 (EXIT
                  (COND
                   ((SPADCALL |x| (QREFELT $ 43))
                    (SEQ
                     (LETT |nx|
                           (|ISUPS;getExpon|
                            (LETT |xTerm| (SPADCALL |x| (QREFELT $ 32)) NIL) $)
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
                         (SPADCALL |refer| (SPADCALL |nx| (QREFELT $ 33))
                                   (QREFELT $ 31))
                         (EXIT
                          (COND
                           ((SPADCALL (SPADCALL |nx| (QREFELT $ 33)) |minExp|
                                      (QREFELT $ 48))
                            (SPADCALL
                             (|ISUPS;makeTerm| |nx| (|ISUPS;getCoef| |xTerm| $)
                              $)
                             (|ISUPS;iTruncate0| (SPADCALL |x| (QREFELT $ 24))
                              |xRefer| |refer| |minExp| |maxExp|
                              (SPADCALL |nx| (|spadConstant| $ 49)
                                        (QREFELT $ 50))
                              $)
                             (QREFELT $ 17)))
                           ('T
                            (|ISUPS;iTruncate0| (SPADCALL |x| (QREFELT $ 24))
                             |xRefer| |refer| |minExp| |maxExp|
                             (SPADCALL |nx| (|spadConstant| $ 49)
                                       (QREFELT $ 50))
                             $))))))))))
                   ('T
                    (SEQ
                     (LETT |degr|
                           (SPADCALL (SPADCALL |xRefer| (QREFELT $ 40))
                                     (QREFELT $ 51))
                           NIL)
                     (SPADCALL |refer| (SPADCALL |degr| (QREFELT $ 33))
                               (QREFELT $ 31))
                     (EXIT
                      (|ISUPS;iTruncate0| |x| |xRefer| |refer| |minExp|
                       |maxExp|
                       (SPADCALL |degr| (|spadConstant| $ 49) (QREFELT $ 50))
                       $)))))))))))))))) 

(DEFUN |ISUPS;iTruncate| (|ups| |minExp| |maxExp| $)
  (PROG (|refer| |degr| |deg| |xRefer| |x|)
    (RETURN
     (SEQ (LETT |x| (SPADCALL |ups| (QREFELT $ 13)) . #1=(|ISUPS;iTruncate|))
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
                              (QREFELT $ 11))))))))))) 

(DEFUN |ISUPS;truncate;$I$;21| (|ups| |n| $)
  (|ISUPS;iTruncate| |ups| (SPADCALL (QREFELT $ 54)) |n| $)) 

(DEFUN |ISUPS;truncate;$2I$;22| (|ups| |n1| |n2| $)
  (PROG (|#G41| |#G40|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |n1| |n2| (QREFELT $ 47))
        (PROGN
         (LETT |#G40| |n2| . #1=(|ISUPS;truncate;$2I$;22|))
         (LETT |#G41| |n1| . #1#)
         (LETT |n1| |#G40| . #1#)
         (LETT |n2| |#G41| . #1#))))
      (EXIT (|ISUPS;iTruncate| |ups| (SPADCALL |n1| (QREFELT $ 33)) |n2| $)))))) 

(DEFUN |ISUPS;iCoefficient| (|st| |n| $)
  (PROG (|expon| |term|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |st| (QREFELT $ 43))
        (SEQ
         (LETT |term| (SPADCALL |st| (QREFELT $ 32))
               . #1=(|ISUPS;iCoefficient|))
         (LETT |expon| (|ISUPS;getExpon| |term| $) . #1#)
         (EXIT
          (COND ((SPADCALL |expon| |n| (QREFELT $ 47)) (|spadConstant| $ 30))
                ((EQL |expon| |n|) (|ISUPS;getCoef| |term| $))
                (#2='T
                 (|ISUPS;iCoefficient| (SPADCALL |st| (QREFELT $ 24)) |n|
                  $))))))
       (#2# (|spadConstant| $ 30))))))) 

(DEFUN |ISUPS;coefficient;$ICoef;24| (|x| |n| $)
  (SEQ (SPADCALL |x| |n| (QREFELT $ 45))
       (EXIT (|ISUPS;iCoefficient| (SPADCALL |x| (QREFELT $ 13)) |n| $)))) 

(DEFUN |ISUPS;elt;$ICoef;25| (|x| |n| $) (SPADCALL |x| |n| (QREFELT $ 57))) 

(DEFUN |ISUPS;iOrder| (|st| |n| |refer| $)
  (PROG (|degr| |r|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |st| (QREFELT $ 42))
        (|error| "order: series has infinite order"))
       ((SPADCALL |st| (QREFELT $ 43))
        (SEQ
         (LETT |r| (|ISUPS;getExpon| (SPADCALL |st| (QREFELT $ 32)) $)
               . #1=(|ISUPS;iOrder|))
         (EXIT
          (COND
           ((SPADCALL (SPADCALL |r| (QREFELT $ 33)) |n| (QREFELT $ 48))
            (SPADCALL |n| (QREFELT $ 51)))
           (#2='T |r|)))))
       (#2#
        (SEQ
         (LETT |degr|
               (SPADCALL (SPADCALL |refer| (QREFELT $ 40)) (QREFELT $ 51))
               . #1#)
         (EXIT
          (COND
           ((SPADCALL (SPADCALL |degr| (QREFELT $ 33)) |n| (QREFELT $ 48))
            (SPADCALL |n| (QREFELT $ 51)))
           (#2#
            (|ISUPS;iOrder| (SPADCALL |st| (QREFELT $ 44)) |n| |refer|
             $))))))))))) 

(DEFUN |ISUPS;order;$I;27| (|x| $)
  (|ISUPS;iOrder| (SPADCALL |x| (QREFELT $ 13)) (SPADCALL (QREFELT $ 19))
   (SPADCALL |x| (QREFELT $ 12)) $)) 

(DEFUN |ISUPS;order;$2I;28| (|x| |n| $)
  (|ISUPS;iOrder| (SPADCALL |x| (QREFELT $ 13)) (SPADCALL |n| (QREFELT $ 33))
   (SPADCALL |x| (QREFELT $ 12)) $)) 

(DEFUN |ISUPS;terms;$S;29| (|x| $) (SPADCALL |x| (QREFELT $ 13))) 

(DEFUN |ISUPS;zero?;$B;30| (|ups| $)
  (PROG (#1=#:G379 |i| |count| |n| |ref| |x|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |x| (SPADCALL |ups| (QREFELT $ 13)) . #2=(|ISUPS;zero?;$B;30|))
        (LETT |ref| (SPADCALL |ups| (QREFELT $ 12)) . #2#)
        (EXIT
         (COND
          ((|eql_SI|
            (SPADCALL (LETT |n| (SPADCALL |ref| (QREFELT $ 40)) . #2#)
                      (QREFELT $ 63))
            1)
           (SPADCALL |x| (QREFELT $ 42)))
          ('T
           (SEQ (LETT |count| |$streamCount| . #2#)
                (SEQ (LETT |i| 1 . #2#) G190
                     (COND ((|greater_SI| |i| |count|) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |x| (QREFELT $ 42))
                         (PROGN (LETT #1# 'T . #2#) (GO #1#)))
                        ((SPADCALL |x| (QREFELT $ 43))
                         (PROGN (LETT #1# 'NIL . #2#) (GO #1#)))
                        ('T (SPADCALL |x| (QREFELT $ 44))))))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT 'NIL)))))))
      #1# (EXIT #1#))))) 

(DEFUN |ISUPS;=;2$B;31| (|ups1| |ups2| $)
  (SPADCALL (SPADCALL |ups1| |ups2| (QREFELT $ 65)) (QREFELT $ 64))) 

(DEFUN |ISUPS;iMap1| (|cFcn| |eFcn| |check?| |x| |xRefer| |refer| |n| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL
       (CONS #'|ISUPS;iMap1!0|
             (VECTOR |check?| |eFcn| |cFcn| |xRefer| |n| |refer| $ |x|))
       (QREFELT $ 53)))))) 

(DEFUN |ISUPS;iMap1!0| ($$)
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
      (PROG (|nn| |xTerm| |xCoef| |nx| |newCoef| |m| |degr|)
        (RETURN
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT $ 42))
            (SEQ (SPADCALL |refer| (SPADCALL (QREFELT $ 19)) (QREFELT $ 31))
                 (EXIT (SPADCALL (QREFELT $ 14)))))
           ('T
            (SEQ (LETT |nn| (SPADCALL |n| (QREFELT $ 33)) NIL)
                 (SEQ G190
                      (COND
                       ((NULL
                         (SPADCALL (SPADCALL |xRefer| (QREFELT $ 40)) |nn|
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
                     (LETT |xCoef|
                           (|ISUPS;getCoef|
                            (LETT |xTerm| (SPADCALL |x| (QREFELT $ 32)) NIL) $)
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
                           (SPADCALL |nx| (|spadConstant| $ 49) (QREFELT $ 50))
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
                       (SPADCALL |degr| (|spadConstant| $ 49) (QREFELT $ 50))
                       $)))))))))))))))) 

(DEFUN |ISUPS;iMap2| (|cFcn| |eFcn| |check?| |ups| $)
  (PROG (|refer| |degr| |deg| |x| |xRefer|)
    (RETURN
     (SEQ (LETT |xRefer| (SPADCALL |ups| (QREFELT $ 12)) . #1=(|ISUPS;iMap2|))
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
                              (QREFELT $ 11))))))))))) 

(DEFUN |ISUPS;map;M2$;34| (|fcn| |x| $)
  (|ISUPS;iMap2| (CONS #'|ISUPS;map;M2$;34!0| |fcn|)
   (LIST #'|ISUPS;map;M2$;34!1|) 'T |x| $)) 

(DEFUN |ISUPS;map;M2$;34!1| (|z| $$) |z|) 

(DEFUN |ISUPS;map;M2$;34!0| (|y| |n| |fcn|) (SPADCALL |y| |fcn|)) 

(DEFUN |ISUPS;differentiate;2$;35| (|x| $)
  (|ISUPS;iMap2| (CONS #'|ISUPS;differentiate;2$;35!0| $)
   (CONS #'|ISUPS;differentiate;2$;35!1| $) 'T |x| $)) 

(DEFUN |ISUPS;differentiate;2$;35!1| (|z| $)
  (SPADCALL |z| (|spadConstant| $ 49) (QREFELT $ 70))) 

(DEFUN |ISUPS;differentiate;2$;35!0| (|y| |n| $)
  (SPADCALL |n| |y| (QREFELT $ 69))) 

(DEFUN |ISUPS;multiplyCoefficients;M2$;36| (|f| |x| $)
  (PROG ()
    (RETURN
     (|ISUPS;iMap2|
      (CONS #'|ISUPS;multiplyCoefficients;M2$;36!0| (VECTOR $ |f|))
      (LIST #'|ISUPS;multiplyCoefficients;M2$;36!1|) 'T |x| $)))) 

(DEFUN |ISUPS;multiplyCoefficients;M2$;36!1| (|z| $$) |z|) 

(DEFUN |ISUPS;multiplyCoefficients;M2$;36!0| (|y| |n| $$)
  (PROG (|f| $)
    (LETT |f| (QREFELT $$ 1) . #1=(|ISUPS;multiplyCoefficients;M2$;36|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL (SPADCALL |n| |f|) |y| (QREFELT $ 72)))))) 

(DEFUN |ISUPS;multiplyExponents;$Pi$;37| (|x| |n| $)
  (PROG ()
    (RETURN
     (|ISUPS;iMap2| (LIST #'|ISUPS;multiplyExponents;$Pi$;37!0|)
      (CONS #'|ISUPS;multiplyExponents;$Pi$;37!1| (VECTOR $ |n|)) 'NIL |x| $)))) 

(DEFUN |ISUPS;multiplyExponents;$Pi$;37!1| (|z| $$)
  (PROG (|n| $)
    (LETT |n| (QREFELT $$ 1) . #1=(|ISUPS;multiplyExponents;$Pi$;37|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |n| |z| (QREFELT $ 76)))))) 

(DEFUN |ISUPS;multiplyExponents;$Pi$;37!0| (|y| |m| $$) |y|) 

(DEFUN |ISUPS;iPlus1| (|op| |x| |xRefer| |y| |yRefer| |refer| |n| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL
       (CONS #'|ISUPS;iPlus1!8|
             (VECTOR |xRefer| |n| |refer| |yRefer| |y| |op| $ |x|))
       (QREFELT $ 53)))))) 

(DEFUN |ISUPS;iPlus1!8| ($$)
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
      (PROG (|nn| |coef| |xTerm| |xCoef| |nx| |yTerm| |yCoef| |ny| |degr|
             |xyRef|)
        (RETURN
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT $ 42))
            (|ISUPS;iMap1| (CONS #'|ISUPS;iPlus1!0| (VECTOR |op| $))
             (LIST #'|ISUPS;iPlus1!1|) (|spadConstant| $ 78) |y| |yRefer|
             |refer| |n| $))
           ((SPADCALL |y| (QREFELT $ 42))
            (|ISUPS;iMap1| (CONS #'|ISUPS;iPlus1!2| (VECTOR |op| $))
             (LIST #'|ISUPS;iPlus1!3|) (|spadConstant| $ 78) |x| |xRefer|
             |refer| |n| $))
           ('T
            (SEQ (LETT |nn| (SPADCALL |n| (QREFELT $ 33)) NIL)
                 (SEQ G190
                      (COND
                       ((NULL
                         (SPADCALL (SPADCALL |xRefer| (QREFELT $ 40)) |nn|
                                   (QREFELT $ 41)))
                        (GO G191)))
                      (SEQ (EXIT (SPADCALL |x| (QREFELT $ 44)))) NIL (GO G190)
                      G191 (EXIT NIL))
                 (SEQ G190
                      (COND
                       ((NULL
                         (SPADCALL (SPADCALL |yRefer| (QREFELT $ 40)) |nn|
                                   (QREFELT $ 41)))
                        (GO G191)))
                      (SEQ (EXIT (SPADCALL |y| (QREFELT $ 44)))) NIL (GO G190)
                      G191 (EXIT NIL))
                 (EXIT
                  (COND
                   ((SPADCALL |x| (QREFELT $ 42))
                    (|ISUPS;iMap1| (CONS #'|ISUPS;iPlus1!4| (VECTOR |op| $))
                     (LIST #'|ISUPS;iPlus1!5|) (|spadConstant| $ 78) |y|
                     |yRefer| |refer| |n| $))
                   ((SPADCALL |y| (QREFELT $ 42))
                    (|ISUPS;iMap1| (CONS #'|ISUPS;iPlus1!6| (VECTOR |op| $))
                     (LIST #'|ISUPS;iPlus1!7|) (|spadConstant| $ 78) |x|
                     |xRefer| |refer| |n| $))
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
                                  (LETT |xTerm| (SPADCALL |x| (QREFELT $ 32))
                                        NIL)
                                  $)
                                 NIL)
                           (LETT |nx| (|ISUPS;getExpon| |xTerm| $) NIL)
                           (LETT |yCoef|
                                 (|ISUPS;getCoef|
                                  (LETT |yTerm| (SPADCALL |y| (QREFELT $ 32))
                                        NIL)
                                  $)
                                 NIL)
                           (LETT |ny| (|ISUPS;getExpon| |yTerm| $) NIL)
                           (EXIT
                            (COND
                             ((SPADCALL |nx| |ny| (QREFELT $ 79))
                              (SEQ
                               (SPADCALL |refer| (SPADCALL |nx| (QREFELT $ 33))
                                         (QREFELT $ 31))
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (LETT |coef| (SPADCALL |xCoef| |yCoef| |op|)
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
                                  (SPADCALL (|ISUPS;makeTerm| |nx| |coef| $)
                                            (|ISUPS;iPlus1| |op|
                                             (SPADCALL |x| (QREFELT $ 24))
                                             |xRefer|
                                             (SPADCALL |y| (QREFELT $ 24))
                                             |yRefer| |refer|
                                             (SPADCALL |nx|
                                                       (|spadConstant| $ 49)
                                                       (QREFELT $ 50))
                                             $)
                                            (QREFELT $ 17)))))))
                             ((SPADCALL |nx| |ny| (QREFELT $ 80))
                              (SEQ
                               (SPADCALL |refer| (SPADCALL |nx| (QREFELT $ 33))
                                         (QREFELT $ 31))
                               (EXIT
                                (SPADCALL
                                 (|ISUPS;makeTerm| |nx|
                                  (SPADCALL |xCoef| (|spadConstant| $ 30) |op|)
                                  $)
                                 (|ISUPS;iPlus1| |op|
                                  (SPADCALL |x| (QREFELT $ 24)) |xRefer| |y|
                                  |yRefer| |refer|
                                  (SPADCALL |nx| (|spadConstant| $ 49)
                                            (QREFELT $ 50))
                                  $)
                                 (QREFELT $ 17)))))
                             ('T
                              (SEQ
                               (SPADCALL |refer| (SPADCALL |ny| (QREFELT $ 33))
                                         (QREFELT $ 31))
                               (EXIT
                                (SPADCALL
                                 (|ISUPS;makeTerm| |ny|
                                  (SPADCALL (|spadConstant| $ 30) |yCoef| |op|)
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
                              (|ISUPS;iPlus1| |op| |x| |xRefer| |y| |yRefer|
                               |refer|
                               (SPADCALL |degr| (|spadConstant| $ 49)
                                         (QREFELT $ 50))
                               $))))
                           ('T
                            (SEQ
                             (SPADCALL |refer| (SPADCALL |nx| (QREFELT $ 33))
                                       (QREFELT $ 31))
                             (EXIT
                              (SPADCALL
                               (|ISUPS;makeTerm| |nx|
                                (SPADCALL |xCoef| (|spadConstant| $ 30) |op|)
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
                              (|ISUPS;iPlus1| |op| |x| |xRefer| |y| |yRefer|
                               |refer|
                               (SPADCALL |degr| (|spadConstant| $ 49)
                                         (QREFELT $ 50))
                               $))))
                           ('T
                            (SEQ
                             (SPADCALL |refer| (SPADCALL |ny| (QREFELT $ 33))
                                       (QREFELT $ 31))
                             (EXIT
                              (SPADCALL
                               (|ISUPS;makeTerm| |ny|
                                (SPADCALL (|spadConstant| $ 30) |yCoef| |op|)
                                $)
                               (|ISUPS;iPlus1| |op| |x| |xRefer|
                                (SPADCALL |y| (QREFELT $ 24)) |yRefer| |refer|
                                (SPADCALL |ny| (|spadConstant| $ 49)
                                          (QREFELT $ 50))
                                $)
                               (QREFELT $ 17)))))))))
                       ('T
                        (SEQ
                         (SPADCALL |refer|
                                   (LETT |xyRef|
                                         (SPADCALL
                                          (SPADCALL |xRefer| (QREFELT $ 40))
                                          (SPADCALL |yRefer| (QREFELT $ 40))
                                          (QREFELT $ 81))
                                         NIL)
                                   (QREFELT $ 31))
                         (EXIT
                          (|ISUPS;iPlus1| |op| |x| |xRefer| |y| |yRefer|
                           |refer|
                           (SPADCALL (SPADCALL |xyRef| (QREFELT $ 51))
                                     (|spadConstant| $ 49) (QREFELT $ 50))
                           $)))))))))))))))))))) 

(DEFUN |ISUPS;iPlus1!7| (|z| $$) |z|) 

(DEFUN |ISUPS;iPlus1!6| (|x1| |m| $$)
  (PROG ($ |op|)
    (LETT $ (QREFELT $$ 1) NIL)
    (LETT |op| (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x1| (|spadConstant| $ 30) |op|))))) 

(DEFUN |ISUPS;iPlus1!5| (|z| $$) |z|) 

(DEFUN |ISUPS;iPlus1!4| (|x1| |m| $$)
  (PROG ($ |op|)
    (LETT $ (QREFELT $$ 1) NIL)
    (LETT |op| (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL (|spadConstant| $ 30) |x1| |op|))))) 

(DEFUN |ISUPS;iPlus1!3| (|z| $$) |z|) 

(DEFUN |ISUPS;iPlus1!2| (|x1| |m| $$)
  (PROG ($ |op|)
    (LETT $ (QREFELT $$ 1) NIL)
    (LETT |op| (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |x1| (|spadConstant| $ 30) |op|))))) 

(DEFUN |ISUPS;iPlus1!1| (|z| $$) |z|) 

(DEFUN |ISUPS;iPlus1!0| (|x1| |m| $$)
  (PROG ($ |op|)
    (LETT $ (QREFELT $$ 1) NIL)
    (LETT |op| (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL (|spadConstant| $ 30) |x1| |op|))))) 

(DEFUN |ISUPS;iPlus2| (|op| |ups1| |ups2| $)
  (PROG (|refer| |deg| |yDeg| #1=#:G765 |y| |yRefer| |xDeg| |x| |xRefer|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |xRefer| (SPADCALL |ups1| (QREFELT $ 12)) . #2=(|ISUPS;iPlus2|))
        (LETT |x| (SPADCALL |ups1| (QREFELT $ 13)) . #2#)
        (LETT |xDeg|
              (COND
               ((SPADCALL |x| (QREFELT $ 42))
                (PROGN
                 (LETT #1#
                       (SPADCALL (CONS #'|ISUPS;iPlus2!0| (VECTOR |op| $))
                                 |ups2| (QREFELT $ 68))
                       . #2#)
                 (GO #1#)))
               ((SPADCALL |x| (QREFELT $ 43))
                (- (|ISUPS;getExpon| (SPADCALL |x| (QREFELT $ 32)) $) 1))
               (#3='T
                (SPADCALL (SPADCALL |xRefer| (QREFELT $ 40)) (QREFELT $ 51))))
              . #2#)
        (LETT |yRefer| (SPADCALL |ups2| (QREFELT $ 12)) . #2#)
        (LETT |y| (SPADCALL |ups2| (QREFELT $ 13)) . #2#)
        (LETT |yDeg|
              (COND
               ((SPADCALL |y| (QREFELT $ 42))
                (PROGN
                 (LETT #1#
                       (SPADCALL (CONS #'|ISUPS;iPlus2!1| (VECTOR |op| $))
                                 |ups1| (QREFELT $ 68))
                       . #2#)
                 (GO #1#)))
               ((SPADCALL |y| (QREFELT $ 43))
                (- (|ISUPS;getExpon| (SPADCALL |y| (QREFELT $ 32)) $) 1))
               (#3#
                (SPADCALL (SPADCALL |yRefer| (QREFELT $ 40)) (QREFELT $ 51))))
              . #2#)
        (LETT |deg| (MIN |xDeg| |yDeg|) . #2#)
        (LETT |refer| (SPADCALL (SPADCALL |deg| (QREFELT $ 33)) (QREFELT $ 20))
              . #2#)
        (EXIT
         (SPADCALL |refer|
                   (|ISUPS;iPlus1| |op| |x| |xRefer| |y| |yRefer| |refer|
                    (+ |deg| 1) $)
                   (QREFELT $ 11)))))
      #1# (EXIT #1#))))) 

(DEFUN |ISUPS;iPlus2!1| (|z| $$)
  (PROG ($ |op|)
    (LETT $ (QREFELT $$ 1) . #1=(|ISUPS;iPlus2|))
    (LETT |op| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |z| (|spadConstant| $ 30) |op|))))) 

(DEFUN |ISUPS;iPlus2!0| (|z| $$)
  (PROG ($ |op|)
    (LETT $ (QREFELT $$ 1) . #1=(|ISUPS;iPlus2|))
    (LETT |op| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL (|spadConstant| $ 30) |z| |op|))))) 

(DEFUN |ISUPS;+;3$;40| (|x| |y| $) (|ISUPS;iPlus2| (ELT $ 82) |x| |y| $)) 

(DEFUN |ISUPS;-;3$;41| (|x| |y| $) (|ISUPS;iPlus2| (ELT $ 84) |x| |y| $)) 

(DEFUN |ISUPS;-;2$;42| (|y| $)
  (|ISUPS;iMap2| (CONS #'|ISUPS;-;2$;42!0| $) (LIST #'|ISUPS;-;2$;42!1|) 'NIL
   |y| $)) 

(DEFUN |ISUPS;-;2$;42!1| (|z| $$) |z|) 

(DEFUN |ISUPS;-;2$;42!0| (|x| |n| $) (SPADCALL |x| (QREFELT $ 85))) 

(DEFUN |ISUPS;*;I2$;43| (|n| |x| $)
  (PROG ()
    (RETURN
     (COND ((ZEROP |n|) (|spadConstant| $ 29))
           ('T
            (SPADCALL (CONS #'|ISUPS;*;I2$;43!0| (VECTOR $ |n|)) |x|
                      (QREFELT $ 68))))))) 

(DEFUN |ISUPS;*;I2$;43!0| (|z| $$)
  (PROG (|n| $)
    (LETT |n| (QREFELT $$ 1) . #1=(|ISUPS;*;I2$;43|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |n| |z| (QREFELT $ 69)))))) 

(DEFUN |ISUPS;*;Nni2$;44| (|n| |x| $)
  (PROG ()
    (RETURN
     (COND ((ZEROP |n|) (|spadConstant| $ 29))
           ('T
            (SPADCALL (CONS #'|ISUPS;*;Nni2$;44!0| (VECTOR $ |n|)) |x|
                      (QREFELT $ 68))))))) 

(DEFUN |ISUPS;*;Nni2$;44!0| (|z| $$)
  (PROG (|n| $)
    (LETT |n| (QREFELT $$ 1) . #1=(|ISUPS;*;Nni2$;44|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |n| |z| (QREFELT $ 88)))))) 

(DEFUN |ISUPS;*;Pi2$;45| (|n| |x| $)
  (PROG ()
    (RETURN
     (COND ((ZEROP |n|) (|spadConstant| $ 29))
           ('T
            (SPADCALL (CONS #'|ISUPS;*;Pi2$;45!0| (VECTOR $ |n|)) |x|
                      (QREFELT $ 68))))))) 

(DEFUN |ISUPS;*;Pi2$;45!0| (|z| $$)
  (PROG (|n| $)
    (LETT |n| (QREFELT $$ 1) . #1=(|ISUPS;*;Pi2$;45|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |n| |z| (QREFELT $ 90)))))) 

(DEFUN |ISUPS;productByTerm| (|coef| |expon| |x| |xRefer| |refer| |n| $)
  (PROG ()
    (RETURN
     (|ISUPS;iMap1| (CONS #'|ISUPS;productByTerm!0| (VECTOR $ |coef|))
      (CONS #'|ISUPS;productByTerm!1| (VECTOR $ |expon|)) 'T |x| |xRefer|
      |refer| |n| $)))) 

(DEFUN |ISUPS;productByTerm!1| (|z| $$)
  (PROG (|expon| $)
    (LETT |expon| (QREFELT $$ 1) . #1=(|ISUPS;productByTerm|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |z| |expon| (QREFELT $ 50)))))) 

(DEFUN |ISUPS;productByTerm!0| (|y| |m| $$)
  (PROG (|coef| $)
    (LETT |coef| (QREFELT $$ 1) . #1=(|ISUPS;productByTerm|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |coef| |y| (QREFELT $ 72)))))) 

(DEFUN |ISUPS;productLazyEval| (|x| |xRefer| |y| |yRefer| |nn| $)
  (PROG (|yDeg| |xDeg|)
    (RETURN
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
                           (SPADCALL |xDeg| (SPADCALL |yRefer| (QREFELT $ 40))
                                     (QREFELT $ 94))
                           |nn| (QREFELT $ 41)))
                         (GO G191)))
                       (SEQ (EXIT (SPADCALL |y| (QREFELT $ 44)))) NIL (GO G190)
                       G191 (EXIT NIL))
                  (EXIT (SPADCALL (QREFELT $ 93)))))))
         ((SPADCALL |y| (QREFELT $ 43))
          (SEQ
           (LETT |yDeg|
                 (SPADCALL (|ISUPS;getExpon| (SPADCALL |y| (QREFELT $ 32)) $)
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
                (SEQ (EXIT (SPADCALL |x| (QREFELT $ 44)))) NIL (GO G190) G191
                (EXIT NIL))
           (EXIT (SPADCALL (QREFELT $ 93)))))
         (#1#
          (SEQ (SPADCALL |x| (QREFELT $ 44))
               (COND
                ((SPADCALL |y| (QREFELT $ 95)) (SPADCALL |y| (QREFELT $ 44))))
               (EXIT
                (|ISUPS;productLazyEval| |x| |xRefer| |y| |yRefer| |nn|
                 $))))))))))) 

(DEFUN |ISUPS;iTimes| (|x| |xRefer| |y| |yRefer| |refer| |n| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL
       (CONS #'|ISUPS;iTimes!0|
             (VECTOR |refer| $ |n| |yRefer| |y| |xRefer| |x|))
       (QREFELT $ 53)))))) 

(DEFUN |ISUPS;iTimes!0| ($$)
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
      (PROG (|xTerm| |xCoef| |yTerm| |yCoef| |expon| |scRefer| |scMult|
             |prRefer| |pr| |sm| |coef| |xExpon| |yExpon| |degr| |xDegr|
             |yDegr|)
        (RETURN
         (SEQ
          (|ISUPS;productLazyEval| |x| |xRefer| |y| |yRefer|
           (SPADCALL |n| (QREFELT $ 33)) $)
          (COND
           ((OR (SPADCALL |x| (QREFELT $ 42)) (SPADCALL |y| (QREFELT $ 42)))
            (EXIT
             (SEQ (SPADCALL |refer| (SPADCALL (QREFELT $ 19)) (QREFELT $ 31))
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
                (LETT |expon| (SPADCALL |xExpon| |yExpon| (QREFELT $ 50)) NIL)
                (SPADCALL |refer| (SPADCALL |expon| (QREFELT $ 33))
                          (QREFELT $ 31))
                (LETT |scRefer|
                      (SPADCALL (SPADCALL |expon| (QREFELT $ 33))
                                (QREFELT $ 20))
                      NIL)
                (LETT |scMult|
                      (|ISUPS;productByTerm| |xCoef| |xExpon|
                       (SPADCALL |y| (QREFELT $ 24)) |yRefer| |scRefer|
                       (SPADCALL |yExpon| (|spadConstant| $ 96) (QREFELT $ 50))
                       $)
                      NIL)
                (LETT |prRefer|
                      (SPADCALL (SPADCALL |expon| (QREFELT $ 33))
                                (QREFELT $ 20))
                      NIL)
                (LETT |pr|
                      (|ISUPS;iTimes| (SPADCALL |x| (QREFELT $ 24)) |xRefer|
                       |y| |yRefer| |prRefer|
                       (SPADCALL |expon| (|spadConstant| $ 96) (QREFELT $ 50))
                       $)
                      NIL)
                (LETT |sm|
                      (|ISUPS;iPlus1| (ELT $ 82) |scMult| |scRefer| |pr|
                       |prRefer| |refer|
                       (SPADCALL |expon| (|spadConstant| $ 96) (QREFELT $ 50))
                       $)
                      NIL)
                (EXIT
                 (COND
                  ((SPADCALL
                    (LETT |coef| (SPADCALL |xCoef| |yCoef| (QREFELT $ 72)) NIL)
                    (QREFELT $ 16))
                   |sm|)
                  ('T
                   (SPADCALL (|ISUPS;makeTerm| |expon| |coef| $) |sm|
                             (QREFELT $ 17)))))))))))
          (EXIT
           (COND
            ((SPADCALL |x| (QREFELT $ 43))
             (SEQ
              (LETT |xExpon| (|ISUPS;getExpon| (SPADCALL |x| (QREFELT $ 32)) $)
                    NIL)
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
              (LETT |yExpon| (|ISUPS;getExpon| (SPADCALL |y| (QREFELT $ 32)) $)
                    NIL)
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
                $))))))))))))) 

(DEFUN |ISUPS;*;3$;49| (|ups1| |ups2| $)
  (PROG (|refer| |deg| |yDeg| #1=#:G868 |y| |yRefer| |xDeg| |x| |xRefer|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |xRefer| (SPADCALL |ups1| (QREFELT $ 12)) . #2=(|ISUPS;*;3$;49|))
        (LETT |x| (SPADCALL |ups1| (QREFELT $ 13)) . #2#)
        (LETT |xDeg|
              (COND
               ((SPADCALL |x| (QREFELT $ 42))
                (PROGN (LETT #1# (|spadConstant| $ 29) . #2#) (GO #1#)))
               ((SPADCALL |x| (QREFELT $ 43))
                (- (|ISUPS;getExpon| (SPADCALL |x| (QREFELT $ 32)) $) 1))
               (#3='T
                (SPADCALL (SPADCALL |xRefer| (QREFELT $ 40)) (QREFELT $ 51))))
              . #2#)
        (LETT |yRefer| (SPADCALL |ups2| (QREFELT $ 12)) . #2#)
        (LETT |y| (SPADCALL |ups2| (QREFELT $ 13)) . #2#)
        (LETT |yDeg|
              (COND
               ((SPADCALL |y| (QREFELT $ 42))
                (PROGN (LETT #1# (|spadConstant| $ 29) . #2#) (GO #1#)))
               ((SPADCALL |y| (QREFELT $ 43))
                (- (|ISUPS;getExpon| (SPADCALL |y| (QREFELT $ 32)) $) 1))
               (#3#
                (SPADCALL (SPADCALL |yRefer| (QREFELT $ 40)) (QREFELT $ 51))))
              . #2#)
        (LETT |deg| (+ (+ |xDeg| |yDeg|) 1) . #2#)
        (LETT |refer| (SPADCALL (SPADCALL |deg| (QREFELT $ 33)) (QREFELT $ 20))
              . #2#)
        (EXIT
         (SPADCALL |refer|
                   (|ISUPS;iTimes| |x| |xRefer| |y| |yRefer| |refer|
                    (+ |deg| 1) $)
                   (QREFELT $ 11)))))
      #1# (EXIT #1#))))) 

(DEFUN |ISUPS;iDivide| (|x| |xRefer| |y| |yRefer| |rym| |m| |refer| |n| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL
       (CONS #'|ISUPS;iDivide!0|
             (VECTOR |yRefer| |y| |rym| |xRefer| |m| |n| |refer| $ |x|))
       (QREFELT $ 53)))))) 

(DEFUN |ISUPS;iDivide!0| ($$)
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
      (PROG (|nm| |xTerm| |newCoef| |nx| |prodRefer| |prod| |sumRefer| |sum|
             |term| |degr|)
        (RETURN
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT $ 42))
            (SEQ (SPADCALL |refer| (SPADCALL (QREFELT $ 19)) (QREFELT $ 31))
                 (EXIT (SPADCALL (QREFELT $ 14)))))
           ('T
            (SEQ
             (LETT |nm|
                   (SPADCALL (SPADCALL |n| |m| (QREFELT $ 50)) (QREFELT $ 33))
                   NIL)
             (SEQ G190
                  (COND
                   ((NULL
                     (SPADCALL (SPADCALL |xRefer| (QREFELT $ 40)) |nm|
                               (QREFELT $ 41)))
                    (GO G191)))
                  (SEQ (EXIT (SPADCALL |x| (QREFELT $ 44)))) NIL (GO G190) G191
                  (EXIT NIL))
             (EXIT
              (COND
               ((SPADCALL |x| (QREFELT $ 42))
                (SEQ
                 (SPADCALL |refer| (SPADCALL (QREFELT $ 19)) (QREFELT $ 31))
                 (EXIT (SPADCALL (QREFELT $ 14)))))
               ((SPADCALL |x| (QREFELT $ 43))
                (SEQ
                 (LETT |newCoef|
                       (SPADCALL
                        (|ISUPS;getCoef|
                         (LETT |xTerm| (SPADCALL |x| (QREFELT $ 32)) NIL) $)
                        |rym| (QREFELT $ 72))
                       NIL)
                 (LETT |nx| (|ISUPS;getExpon| |xTerm| $) NIL)
                 (LETT |prodRefer|
                       (SPADCALL (SPADCALL |nx| (QREFELT $ 33)) (QREFELT $ 20))
                       NIL)
                 (LETT |prod|
                       (|ISUPS;productByTerm|
                        (SPADCALL |newCoef| (QREFELT $ 85))
                        (SPADCALL |nx| |m| (QREFELT $ 70))
                        (SPADCALL |y| (QREFELT $ 24)) |yRefer| |prodRefer|
                        (|spadConstant| $ 96) $)
                       NIL)
                 (LETT |sumRefer|
                       (SPADCALL (SPADCALL |nx| (QREFELT $ 33)) (QREFELT $ 20))
                       NIL)
                 (LETT |sum|
                       (|ISUPS;iPlus1| (ELT $ 82) (SPADCALL |x| (QREFELT $ 24))
                        |xRefer| |prod| |prodRefer| |sumRefer|
                        (SPADCALL |nx| (|spadConstant| $ 96) (QREFELT $ 50)) $)
                       NIL)
                 (SPADCALL |refer|
                           (SPADCALL (SPADCALL |nx| |m| (QREFELT $ 70))
                                     (QREFELT $ 33))
                           (QREFELT $ 31))
                 (LETT |term|
                       (|ISUPS;makeTerm| (SPADCALL |nx| |m| (QREFELT $ 70))
                        |newCoef| $)
                       NIL)
                 (EXIT
                  (SPADCALL |term|
                            (|ISUPS;iDivide| |sum| |sumRefer| |y| |yRefer|
                             |rym| |m| |refer|
                             (SPADCALL (SPADCALL |nx| |m| (QREFELT $ 70))
                                       (|spadConstant| $ 96) (QREFELT $ 50))
                             $)
                            (QREFELT $ 17)))))
               ('T
                (SEQ
                 (LETT |degr|
                       (SPADCALL (SPADCALL |xRefer| (QREFELT $ 40))
                                 (QREFELT $ 51))
                       NIL)
                 (SPADCALL |refer|
                           (SPADCALL (SPADCALL |degr| |m| (QREFELT $ 70))
                                     (QREFELT $ 33))
                           (QREFELT $ 31))
                 (EXIT
                  (|ISUPS;iDivide| |x| |xRefer| |y| |yRefer| |rym| |m| |refer|
                   (SPADCALL (SPADCALL |degr| |m| (QREFELT $ 70))
                             (|spadConstant| $ 96) (QREFELT $ 50))
                   $)))))))))))))))) 

(DEFUN |ISUPS;divide| (|ups1| |deg1| |ups2| |deg2| |r| $)
  (PROG (|refer| |y| |yRefer| |x| |xRefer|)
    (RETURN
     (SEQ
      (LETT |xRefer| (SPADCALL |ups1| (QREFELT $ 12)) . #1=(|ISUPS;divide|))
      (LETT |x| (SPADCALL |ups1| (QREFELT $ 13)) . #1#)
      (LETT |yRefer| (SPADCALL |ups2| (QREFELT $ 12)) . #1#)
      (LETT |y| (SPADCALL |ups2| (QREFELT $ 13)) . #1#)
      (LETT |refer|
            (SPADCALL (SPADCALL (- |deg1| |deg2|) (QREFELT $ 33))
                      (QREFELT $ 20))
            . #1#)
      (EXIT
       (SPADCALL |refer|
                 (|ISUPS;iDivide| |x| |xRefer| |y| |yRefer| |r| |deg2| |refer|
                  (+ (- |deg1| |deg2|) 1) $)
                 (QREFELT $ 11))))))) 

(DEFUN |ISUPS;iExquo;2$BU;52| (|ups1| |ups2| |taylor?| $)
  (PROG (|nx| #1=#:G932 #2=#:G938 |deg| |nn| |ry| |ny| |yCoef| |yTerm|
         #3=#:G919 |n| |y| |yRefer| |x| |xRefer|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |xRefer| (SPADCALL |ups1| (QREFELT $ 12))
              . #4=(|ISUPS;iExquo;2$BU;52|))
        (LETT |x| (SPADCALL |ups1| (QREFELT $ 13)) . #4#)
        (LETT |yRefer| (SPADCALL |ups2| (QREFELT $ 12)) . #4#)
        (LETT |y| (SPADCALL |ups2| (QREFELT $ 13)) . #4#) (LETT |n| 0 . #4#)
        (SEQ G190
             (COND
              ((NULL (COND ((SPADCALL |y| (QREFELT $ 43)) 'NIL) ('T 'T)))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |y| (QREFELT $ 42))
                 (PROGN (LETT #2# (CONS 1 "failed") . #4#) (GO #2#)))
                ('T
                 (SEQ
                  (EXIT
                   (SEQ (SPADCALL |y| (QREFELT $ 44))
                        (LETT |n| (+ |n| 1) . #4#)
                        (EXIT
                         (COND
                          ((SPADCALL |n| 1000 (QREFELT $ 47))
                           (PROGN
                            (LETT #3#
                                  (PROGN
                                   (LETT #2# (CONS 1 "failed") . #4#)
                                   (GO #2#))
                                  . #4#)
                            (GO #3#)))))))
                  #3# (EXIT #3#))))))
             NIL (GO G190) G191 (EXIT NIL))
        (LETT |yCoef|
              (|ISUPS;getCoef|
               (LETT |yTerm| (SPADCALL |y| (QREFELT $ 32)) . #4#) $)
              . #4#)
        (LETT |ny| (|ISUPS;getExpon| |yTerm| $) . #4#)
        (LETT |ry| (SPADCALL |yCoef| (QREFELT $ 99)) . #4#)
        (EXIT
         (COND ((QEQCAR |ry| 1) (CONS 1 "failed"))
               (#5='T
                (SEQ (LETT |nn| (SPADCALL |ny| (QREFELT $ 33)) . #4#)
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
                                       . #4#)
                                 (GO #2#)))
                               ((SPADCALL |x| (QREFELT $ 43))
                                (PROGN
                                 (LETT #2# (CONS 1 "failed") . #4#)
                                 (GO #2#)))
                               ('T (SPADCALL |x| (QREFELT $ 44))))))
                            NIL (GO G190) G191 (EXIT NIL))))
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |y| (QREFELT $ 24)) (QREFELT $ 23))
                        (CONS 0
                              (|ISUPS;iMap2|
                               (CONS #'|ISUPS;iExquo;2$BU;52!0|
                                     (VECTOR $ |ry|))
                               (CONS #'|ISUPS;iExquo;2$BU;52!1|
                                     (VECTOR $ |ny|))
                               'NIL |ups1| $)))
                       ((SPADCALL |x| (QREFELT $ 42))
                        (CONS 0 (|spadConstant| $ 29)))
                       (#5#
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
                                            (SPADCALL |x| (QREFELT $ 32)) $)
                                           . #4#)
                                     (EXIT
                                      (COND
                                       ((< |deg| |ny|)
                                        (COND
                                         (|taylor?|
                                          (PROGN
                                           (LETT #1#
                                                 (PROGN
                                                  (LETT #2# (CONS 1 "failed")
                                                        . #4#)
                                                  (GO #2#))
                                                 . #4#)
                                           (GO #1#))))))))
                                    (EXIT (- |deg| 1))))
                                  #1# (EXIT #1#)))
                                (#5#
                                 (SPADCALL (SPADCALL |xRefer| (QREFELT $ 40))
                                           (QREFELT $ 51))))
                               . #4#)
                         (EXIT
                          (CONS 0
                                (|ISUPS;divide| |ups1| |nx| |ups2| |ny|
                                 (QCDR |ry|) $)))))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |ISUPS;iExquo;2$BU;52!1| (|z| $$)
  (PROG (|ny| $)
    (LETT |ny| (QREFELT $$ 1) . #1=(|ISUPS;iExquo;2$BU;52|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |z| |ny| (QREFELT $ 70)))))) 

(DEFUN |ISUPS;iExquo;2$BU;52!0| (|y1| |m| $$)
  (PROG (|ry| $)
    (LETT |ry| (QREFELT $$ 1) . #1=(|ISUPS;iExquo;2$BU;52|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |y1| (QCDR |ry|) (QREFELT $ 72)))))) 

(DEFUN |ISUPS;taylorQuoByVar;2$;53| (|ups| $)
  (|ISUPS;iMap2| (LIST #'|ISUPS;taylorQuoByVar;2$;53!0|)
   (CONS #'|ISUPS;taylorQuoByVar;2$;53!1| $) 'NIL
   (SPADCALL |ups|
             (SPADCALL (SPADCALL |ups| 0 (QREFELT $ 57)) 0 (QREFELT $ 22))
             (QREFELT $ 65))
   $)) 

(DEFUN |ISUPS;taylorQuoByVar;2$;53!1| (|z| $)
  (SPADCALL |z| (|spadConstant| $ 49) (QREFELT $ 70))) 

(DEFUN |ISUPS;taylorQuoByVar;2$;53!0| (|y| |n| $$) |y|) 

(DEFUN |ISUPS;compose0|
       (|x| |xRefer| |y| |yRefer| |yOrd| |y1| |yn0| |n0| |refer| |n| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL
       (CONS #'|ISUPS;compose0!2|
             (VECTOR |n0| |yn0| |y1| |yRefer| |y| |xRefer| |yOrd| |n| |refer| $
                     |x|))
       (QREFELT $ 53)))))) 

(DEFUN |ISUPS;compose0!2| ($$)
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
      (PROG (|nn| |yyOrd| |xTerm| |xCoef| |n1| #2=#:G996 |yn1| |z| |zRefer|
             |prodRefer| |prod| |coRefer| |co| |degr|)
        (RETURN
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT $ 42))
            (SEQ (SPADCALL |refer| (SPADCALL (QREFELT $ 19)) (QREFELT $ 31))
                 (EXIT (SPADCALL (QREFELT $ 14)))))
           ('T
            (SEQ (LETT |nn| (SPADCALL |n| (QREFELT $ 33)) NIL)
                 (LETT |yyOrd| (SPADCALL |yOrd| (QREFELT $ 33)) NIL)
                 (SEQ G190
                      (COND
                       ((NULL
                         (SPADCALL
                          (SPADCALL |yyOrd| (SPADCALL |xRefer| (QREFELT $ 40))
                                    (QREFELT $ 102))
                          |nn| (QREFELT $ 41)))
                        (GO G191)))
                      (SEQ (EXIT (SPADCALL |x| (QREFELT $ 44)))) NIL (GO G190)
                      G191 (EXIT NIL))
                 (EXIT
                  (COND
                   ((SPADCALL |x| (QREFELT $ 43))
                    (SEQ
                     (LETT |xCoef|
                           (|ISUPS;getCoef|
                            (LETT |xTerm| (SPADCALL |x| (QREFELT $ 32)) NIL) $)
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
                                     (SPADCALL |x| (QREFELT $ 24)) |xRefer| |y|
                                     |yRefer| |yOrd| |y1| |yn0| |n0| |refer|
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
                                                                        $ 70))
                                                             NIL)
                                                     (|check_subtype|
                                                      (>= #2# 0)
                                                      '(|NonNegativeInteger|)
                                                      #2#))
                                                   (QREFELT $ 104))
                                         (QREFELT $ 97))
                               NIL)
                         (LETT |z| (SPADCALL |yn1| (QREFELT $ 13)) NIL)
                         (LETT |zRefer| (SPADCALL |yn1| (QREFELT $ 12)) NIL)
                         (LETT |degr| (SPADCALL |yOrd| |n1| (QREFELT $ 105))
                               NIL)
                         (LETT |prodRefer|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL |degr| (|spadConstant| $ 96)
                                           (QREFELT $ 70))
                                 (QREFELT $ 33))
                                (QREFELT $ 20))
                               NIL)
                         (LETT |prod|
                               (|ISUPS;iMap1|
                                (CONS #'|ISUPS;compose0!0| (VECTOR $ |xCoef|))
                                (LIST #'|ISUPS;compose0!1|)
                                (|spadConstant| $ 106) |z| |zRefer| |prodRefer|
                                |degr| $)
                               NIL)
                         (LETT |coRefer|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL |degr| |yOrd| (QREFELT $ 50))
                                  (|spadConstant| $ 96) (QREFELT $ 70))
                                 (QREFELT $ 33))
                                (QREFELT $ 20))
                               NIL)
                         (LETT |co|
                               (|ISUPS;compose0| (SPADCALL |x| (QREFELT $ 24))
                                |xRefer| |y| |yRefer| |yOrd| |y1| |yn1| |n1|
                                |coRefer|
                                (SPADCALL |degr| |yOrd| (QREFELT $ 50)) $)
                               NIL)
                         (SPADCALL |refer|
                                   (SPADCALL
                                    (SPADCALL |degr| (|spadConstant| $ 96)
                                              (QREFELT $ 70))
                                    (QREFELT $ 33))
                                   (QREFELT $ 31))
                         (EXIT
                          (|ISUPS;iPlus1| (ELT $ 82) |prod| |prodRefer| |co|
                           |coRefer| |refer| |degr| $))))))))
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
                                          (QREFELT $ 70))
                                (QREFELT $ 33))
                               (QREFELT $ 31))
                     (EXIT
                      (|ISUPS;compose0| |x| |xRefer| |y| |yRefer| |yOrd| |y1|
                       |yn0| |n0| |refer| |degr| $)))))))))))))))) 

(DEFUN |ISUPS;compose0!1| (|m| $$) |m|) 

(DEFUN |ISUPS;compose0!0| (|s| |k| $$)
  (PROG (|xCoef| $)
    (LETT |xCoef| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |xCoef| |s| (QREFELT $ 72)))))) 

(DEFUN |ISUPS;iCompose;3$;55| (|ups1| |ups2| $)
  (PROG (|compRefer| |yOrd| #1=#:G1014 |i| |n| |yRefer| |y| |xRefer| |x|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |x| (SPADCALL |ups1| (QREFELT $ 13))
              . #2=(|ISUPS;iCompose;3$;55|))
        (LETT |xRefer| (SPADCALL |ups1| (QREFELT $ 12)) . #2#)
        (LETT |y| (SPADCALL |ups2| (QREFELT $ 13)) . #2#)
        (LETT |yRefer| (SPADCALL |ups2| (QREFELT $ 12)) . #2#)
        (LETT |n| |$streamCount| . #2#)
        (SEQ (LETT |i| 1 . #2#) G190
             (COND
              ((OR (|greater_SI| |i| |n|)
                   (NULL (COND ((SPADCALL |y| (QREFELT $ 43)) 'NIL) ('T 'T))))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |y| (QREFELT $ 42))
                 (PROGN
                  (LETT #1#
                        (SPADCALL (SPADCALL |ups1| 0 (QREFELT $ 57))
                                  (QREFELT $ 27))
                        . #2#)
                  (GO #1#)))
                ('T (SPADCALL |y| (QREFELT $ 44))))))
             (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
        (EXIT
         (COND
          ((SPADCALL |y| (QREFELT $ 42))
           (SPADCALL (SPADCALL |ups1| 0 (QREFELT $ 57)) (QREFELT $ 27)))
          (#3='T
           (SEQ
            (LETT |yOrd|
                  (COND
                   ((SPADCALL |y| (QREFELT $ 43))
                    (|ISUPS;getExpon| (SPADCALL |y| (QREFELT $ 32)) $))
                   (#3#
                    (SPADCALL (SPADCALL |yRefer| (QREFELT $ 40))
                              (QREFELT $ 51))))
                  . #2#)
            (LETT |compRefer|
                  (SPADCALL (SPADCALL (|spadConstant| $ 107) (QREFELT $ 108))
                            (QREFELT $ 20))
                  . #2#)
            (EXIT
             (SPADCALL |compRefer|
                       (|ISUPS;compose0| |x| |xRefer| |y| |yRefer| |yOrd|
                        |ups2| (|spadConstant| $ 38) 0 |compRefer| 0 $)
                       (QREFELT $ 11)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |ISUPS;integrate;2$;56| (|x| $)
  (|ISUPS;iMap2| (CONS #'|ISUPS;integrate;2$;56!0| $)
   (CONS #'|ISUPS;integrate;2$;56!1| $) 'T |x| $)) 

(DEFUN |ISUPS;integrate;2$;56!1| (|z| $)
  (SPADCALL |z| (|spadConstant| $ 49) (QREFELT $ 50))) 

(DEFUN |ISUPS;integrate;2$;56!0| (|y| |n| $)
  (SPADCALL
   (SPADCALL (|spadConstant| $ 49)
             (SPADCALL |n| (|spadConstant| $ 49) (QREFELT $ 50))
             (QREFELT $ 111))
   |y| (QREFELT $ 112))) 

(DEFUN |ISUPS;integ0| (|x| |intRef| |ansRef| |n| $)
  (PROG ()
    (RETURN
     (SEQ
      (SPADCALL (CONS #'|ISUPS;integ0!0| (VECTOR |ansRef| |x| |intRef| $ |n|))
                (QREFELT $ 53)))))) 

(DEFUN |ISUPS;integ0!0| ($$)
  (PROG (|n| $ |intRef| |x| |ansRef|)
    (LETT |n| (QREFELT $$ 4) . #1=(|ISUPS;integ0|))
    (LETT $ (QREFELT $$ 3) . #1#)
    (LETT |intRef| (QREFELT $$ 2) . #1#)
    (LETT |x| (QREFELT $$ 1) . #1#)
    (LETT |ansRef| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|nLess1| |xTerm| |xCoef| |nx| |n1| |degr|)
        (RETURN
         (SEQ
          (LETT |nLess1|
                (SPADCALL (SPADCALL |n| (|spadConstant| $ 96) (QREFELT $ 70))
                          (QREFELT $ 33))
                NIL)
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL (SPADCALL |intRef| (QREFELT $ 40)) |nLess1|
                            (QREFELT $ 41)))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |x| (QREFELT $ 44)))) NIL (GO G190) G191
               (EXIT NIL))
          (EXIT
           (COND
            ((SPADCALL |x| (QREFELT $ 42))
             (SEQ (SPADCALL |ansRef| (SPADCALL (QREFELT $ 19)) (QREFELT $ 31))
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
                  (SPADCALL (SPADCALL |n1| (QREFELT $ 114)) (QREFELT $ 115))
                  |xCoef| (QREFELT $ 112))
                 $)
                (|ISUPS;integ0| (SPADCALL |x| (QREFELT $ 24)) |intRef| |ansRef|
                 |n1| $)
                (QREFELT $ 17)))))
            ('T
             (SEQ
              (LETT |degr|
                    (SPADCALL (SPADCALL |intRef| (QREFELT $ 40))
                              (QREFELT $ 51))
                    NIL)
              (SPADCALL |ansRef|
                        (SPADCALL
                         (SPADCALL |degr| (|spadConstant| $ 96) (QREFELT $ 50))
                         (QREFELT $ 33))
                        (QREFELT $ 31))
              (EXIT
               (|ISUPS;integ0| |x| |intRef| |ansRef|
                (SPADCALL |degr| 2 (QREFELT $ 50)) $))))))))))))) 

(DEFUN |ISUPS;integ1| (|x| |intRef| |ansRef| $)
  (|ISUPS;integ0| |x| |intRef| |ansRef| 1 $)) 

(DEFUN |ISUPS;lazyInteg| (|a| |xf| |intRef| |ansRef| $)
  (PROG (|ansStr|)
    (RETURN
     (SEQ
      (LETT |ansStr|
            (|ISUPS;integ1| (SPADCALL |xf| (QREFELT $ 53)) |intRef| |ansRef| $)
            |ISUPS;lazyInteg|)
      (EXIT (SPADCALL (|ISUPS;makeTerm| 0 |a| $) |ansStr| (QREFELT $ 17))))))) 

(DEFUN |ISUPS;cPower;$Coef$;60| (|f| |r| $)
  (PROG (|ansStr| |ansRef| |intRef| |yStr| |yRef| |y| |fInv| #1=#:G1058 |fp|)
    (RETURN
     (SEQ
      (LETT |fp| (SPADCALL |f| (QREFELT $ 71)) . #2=(|ISUPS;cPower;$Coef$;60|))
      (LETT |fInv|
            (PROG2
                (LETT #1#
                      (SPADCALL (|spadConstant| $ 38) |f| 'NIL (QREFELT $ 100))
                      . #2#)
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0) $ #1#))
            . #2#)
      (LETT |y|
            (SPADCALL (SPADCALL |r| |fp| (QREFELT $ 116)) |fInv|
                      (QREFELT $ 97))
            . #2#)
      (LETT |yRef| (SPADCALL |y| (QREFELT $ 12)) . #2#)
      (LETT |yStr| (SPADCALL |y| (QREFELT $ 13)) . #2#)
      (LETT |intRef|
            (SPADCALL (SPADCALL (|spadConstant| $ 107) (QREFELT $ 108))
                      (QREFELT $ 20))
            . #2#)
      (LETT |ansRef| (SPADCALL (|spadConstant| $ 117) (QREFELT $ 20)) . #2#)
      (LETT |ansStr|
            (SPADCALL
             (CONS #'|ISUPS;cPower;$Coef$;60!1|
                   (VECTOR |ansRef| |yStr| |yRef| |intRef| $))
             (QREFELT $ 121))
            . #2#)
      (EXIT (SPADCALL |ansRef| |ansStr| (QREFELT $ 11))))))) 

(DEFUN |ISUPS;cPower;$Coef$;60!1| (|s| $$)
  (PROG ($ |intRef| |yRef| |yStr| |ansRef|)
    (LETT $ (QREFELT $$ 4) . #1=(|ISUPS;cPower;$Coef$;60|))
    (LETT |intRef| (QREFELT $$ 3) . #1#)
    (LETT |yRef| (QREFELT $$ 2) . #1#)
    (LETT |yStr| (QREFELT $$ 1) . #1#)
    (LETT |ansRef| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (|ISUPS;lazyInteg| (|spadConstant| $ 39)
          (CONS #'|ISUPS;cPower;$Coef$;60!0|
                (VECTOR $ |intRef| |yRef| |yStr| |ansRef| |s|))
          |intRef| |ansRef| $))))))) 

(DEFUN |ISUPS;cPower;$Coef$;60!0| ($$)
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
       (|spadConstant| $ 118) $))))) 

(DEFUN |ISUPS;iExp| (|f| |cc| $)
  (PROG (|ansStr| |ansRef| |intRef| |fpStr| |fpRef| |fp|)
    (RETURN
     (SEQ (LETT |fp| (SPADCALL |f| (QREFELT $ 71)) . #1=(|ISUPS;iExp|))
          (LETT |fpRef| (SPADCALL |fp| (QREFELT $ 12)) . #1#)
          (LETT |fpStr| (SPADCALL |fp| (QREFELT $ 13)) . #1#)
          (LETT |intRef|
                (SPADCALL (SPADCALL (|spadConstant| $ 107) (QREFELT $ 108))
                          (QREFELT $ 20))
                . #1#)
          (LETT |ansRef| (SPADCALL (|spadConstant| $ 117) (QREFELT $ 20))
                . #1#)
          (LETT |ansStr|
                (SPADCALL
                 (CONS #'|ISUPS;iExp!1|
                       (VECTOR |ansRef| |fpStr| |fpRef| |intRef| $ |cc|))
                 (QREFELT $ 121))
                . #1#)
          (EXIT (SPADCALL |ansRef| |ansStr| (QREFELT $ 11))))))) 

(DEFUN |ISUPS;iExp!1| (|s| $$)
  (PROG (|cc| $ |intRef| |fpRef| |fpStr| |ansRef|)
    (LETT |cc| (QREFELT $$ 5) . #1=(|ISUPS;iExp|))
    (LETT $ (QREFELT $$ 4) . #1#)
    (LETT |intRef| (QREFELT $$ 3) . #1#)
    (LETT |fpRef| (QREFELT $$ 2) . #1#)
    (LETT |fpStr| (QREFELT $$ 1) . #1#)
    (LETT |ansRef| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (|ISUPS;lazyInteg| |cc|
          (CONS #'|ISUPS;iExp!0|
                (VECTOR $ |intRef| |fpRef| |fpStr| |ansRef| |s|))
          |intRef| |ansRef| $))))))) 

(DEFUN |ISUPS;iExp!0| ($$)
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
       (|spadConstant| $ 123) $))))) 

(DEFUN |ISUPS;sincos0|
       (|sinc| |cosc| |list| |sinRef| |cosRef| |fpStr| |fpRef| |fpStr2|
        |fpRef2| $)
  (PROG (|prodStr2| |prodStr1| |prodRef2| |prodRef1| |cosStr| |sinStr|)
    (RETURN
     (SEQ (LETT |sinStr| (|SPADfirst| |list|) . #1=(|ISUPS;sincos0|))
          (LETT |cosStr| (SPADCALL |list| (QREFELT $ 125)) . #1#)
          (LETT |prodRef1|
                (SPADCALL (SPADCALL (|spadConstant| $ 107) (QREFELT $ 108))
                          (QREFELT $ 20))
                . #1#)
          (LETT |prodRef2|
                (SPADCALL (SPADCALL (|spadConstant| $ 107) (QREFELT $ 108))
                          (QREFELT $ 20))
                . #1#)
          (LETT |prodStr1|
                (|ISUPS;iTimes| |cosStr| |cosRef| |fpStr| |fpRef| |prodRef1| 0
                 $)
                . #1#)
          (LETT |prodStr2|
                (|ISUPS;iTimes| |sinStr| |sinRef| |fpStr2| |fpRef2| |prodRef2|
                 0 $)
                . #1#)
          (EXIT
           (LIST
            (|ISUPS;lazyInteg| |sinc| (CONS #'|ISUPS;sincos0!0| |prodStr1|)
             |prodRef1| |sinRef| $)
            (|ISUPS;lazyInteg| |cosc| (CONS #'|ISUPS;sincos0!1| |prodStr2|)
             |prodRef2| |cosRef| $))))))) 

(DEFUN |ISUPS;sincos0!1| (|prodStr2|) |prodStr2|) 

(DEFUN |ISUPS;sincos0!0| (|prodStr1|) |prodStr1|) 

(DEFUN |ISUPS;iSincos| (|f| |sinc| |cosc| |sign| $)
  (PROG (|cosStr| |sinStr| |sincos| |cosRef| |sinRef| |fpStr2| |fpRef2| |fp2|
         |fpStr| |fpRef| |fp|)
    (RETURN
     (SEQ (LETT |fp| (SPADCALL |f| (QREFELT $ 71)) . #1=(|ISUPS;iSincos|))
          (LETT |fpRef| (SPADCALL |fp| (QREFELT $ 12)) . #1#)
          (LETT |fpStr| (SPADCALL |fp| (QREFELT $ 13)) . #1#)
          (LETT |fp2|
                (COND ((EQL |sign| 1) |fp|)
                      (#2='T (SPADCALL |fp| (QREFELT $ 86))))
                . #1#)
          (LETT |fpRef2| (SPADCALL |fp2| (QREFELT $ 12)) . #1#)
          (LETT |fpStr2| (SPADCALL |fp2| (QREFELT $ 13)) . #1#)
          (LETT |sinRef| (SPADCALL (|spadConstant| $ 117) (QREFELT $ 20))
                . #1#)
          (LETT |cosRef| (SPADCALL (|spadConstant| $ 117) (QREFELT $ 20))
                . #1#)
          (LETT |sincos|
                (SPADCALL
                 (CONS #'|ISUPS;iSincos!0|
                       (VECTOR $ |fpRef2| |fpStr2| |fpRef| |fpStr| |cosRef|
                               |sinRef| |cosc| |sinc|))
                 2 (QREFELT $ 127))
                . #1#)
          (LETT |sinStr|
                (COND
                 ((SPADCALL |sinc| (QREFELT $ 16))
                  (SPADCALL (|SPADfirst| |sincos|) (QREFELT $ 24)))
                 (#2# (|SPADfirst| |sincos|)))
                . #1#)
          (LETT |cosStr|
                (COND
                 ((SPADCALL |cosc| (QREFELT $ 16))
                  (SPADCALL (SPADCALL |sincos| (QREFELT $ 125))
                            (QREFELT $ 24)))
                 (#2# (SPADCALL |sincos| (QREFELT $ 125))))
                . #1#)
          (EXIT
           (CONS (SPADCALL |sinRef| |sinStr| (QREFELT $ 11))
                 (SPADCALL |cosRef| |cosStr| (QREFELT $ 11)))))))) 

(DEFUN |ISUPS;iSincos!0| (|s| $$)
  (PROG (|sinc| |cosc| |sinRef| |cosRef| |fpStr| |fpRef| |fpStr2| |fpRef2| $)
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
      (|ISUPS;sincos0| |sinc| |cosc| |s| |sinRef| |cosRef| |fpStr| |fpRef|
       |fpStr2| |fpRef2| $))))) 

(DEFUN |ISUPS;tan0| (|cc| |ansStr| |ansRef| |fpStr| |fpRef| |sign| $)
  (PROG (|intRef| |yStr| |yRef| |oneRef| |oneStr| |one| |sqStr| |sqRef|)
    (RETURN
     (SEQ
      (LETT |sqRef|
            (SPADCALL (SPADCALL (|spadConstant| $ 107) (QREFELT $ 108))
                      (QREFELT $ 20))
            . #1=(|ISUPS;tan0|))
      (LETT |sqStr|
            (|ISUPS;iTimes| |ansStr| |ansRef| |ansStr| |ansRef| |sqRef| 0 $)
            . #1#)
      (LETT |one| (|spadConstant| $ 38) . #1#)
      (LETT |oneStr| (SPADCALL |one| (QREFELT $ 13)) . #1#)
      (LETT |oneRef| (SPADCALL |one| (QREFELT $ 12)) . #1#)
      (LETT |yRef|
            (SPADCALL (SPADCALL (|spadConstant| $ 107) (QREFELT $ 108))
                      (QREFELT $ 20))
            . #1#)
      (LETT |yStr|
            (COND
             ((EQL |sign| 1)
              (|ISUPS;iPlus1| (ELT $ 82) |oneStr| |oneRef| |sqStr| |sqRef|
               |yRef| 0 $))
             ('T
              (|ISUPS;iPlus1| (ELT $ 84) |oneStr| |oneRef| |sqStr| |sqRef|
               |yRef| 0 $)))
            . #1#)
      (LETT |intRef|
            (SPADCALL (SPADCALL (|spadConstant| $ 107) (QREFELT $ 108))
                      (QREFELT $ 20))
            . #1#)
      (EXIT
       (|ISUPS;lazyInteg| |cc|
        (CONS #'|ISUPS;tan0!0|
              (VECTOR $ |intRef| |fpRef| |fpStr| |yRef| |yStr|))
        |intRef| |ansRef| $)))))) 

(DEFUN |ISUPS;tan0!0| ($$)
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
       (|spadConstant| $ 123) $))))) 

(DEFUN |ISUPS;iTan| (|f| |fp| |cc| |sign| $)
  (PROG (|ansStr| |ansRef| |fpStr| |fpRef|)
    (RETURN
     (SEQ (LETT |fpRef| (SPADCALL |fp| (QREFELT $ 12)) . #1=(|ISUPS;iTan|))
          (LETT |fpStr| (SPADCALL |fp| (QREFELT $ 13)) . #1#)
          (LETT |ansRef| (SPADCALL (|spadConstant| $ 117) (QREFELT $ 20))
                . #1#)
          (LETT |ansStr|
                (SPADCALL
                 (CONS #'|ISUPS;iTan!0|
                       (VECTOR $ |sign| |fpRef| |fpStr| |ansRef| |cc|))
                 (QREFELT $ 121))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL |cc| (QREFELT $ 16))
             (SPADCALL |ansRef| (SPADCALL |ansStr| (QREFELT $ 24))
                       (QREFELT $ 11)))
            ('T (SPADCALL |ansRef| |ansStr| (QREFELT $ 11))))))))) 

(DEFUN |ISUPS;iTan!0| (|s| $$)
  (PROG (|cc| |ansRef| |fpStr| |fpRef| |sign| $)
    (LETT |cc| (QREFELT $$ 5) . #1=(|ISUPS;iTan|))
    (LETT |ansRef| (QREFELT $$ 4) . #1#)
    (LETT |fpStr| (QREFELT $$ 3) . #1#)
    (LETT |fpRef| (QREFELT $$ 2) . #1#)
    (LETT |sign| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|ISUPS;tan0| |cc| |s| |ansRef| |fpStr| |fpRef| |sign| $))))) 

(DEFUN |ISUPS;orderOrFailed| (|uts| $)
  (PROG (#1=#:G1094 |n| |x|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |x| (SPADCALL |uts| (QREFELT $ 13)) . #2=(|ISUPS;orderOrFailed|))
        (SEQ (LETT |n| 0 . #2#) G190 (COND ((|greater_SI| |n| 1000) (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |x| (QREFELT $ 42))
                 (PROGN (LETT #1# (CONS 0 -1) . #2#) (GO #1#)))
                ((SPADCALL |x| (QREFELT $ 43))
                 (PROGN
                  (LETT #1#
                        (CONS 0
                              (|ISUPS;getExpon| (SPADCALL |x| (QREFELT $ 32))
                               $))
                        . #2#)
                  (GO #1#)))
                ('T (SPADCALL |x| (QREFELT $ 44))))))
             (LETT |n| (|inc_SI| |n|) . #2#) (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 1 "failed"))))
      #1# (EXIT #1#))))) 

(DEFUN |ISUPS;cRationalPower;$F$;67| (|uts| |r| $)
  (PROG (|uts2| |uts1| |ccPow| #1=#:G1109 #2=#:G1103 |num| |ccInv| |cc| |n|
         |order| |ord0|)
    (RETURN
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
                    (SPADCALL |order| (SPADCALL |r| (QREFELT $ 137))
                              (QREFELT $ 138))
                    . #3#)
              (EXIT
               (COND
                ((QEQCAR |n| 1) (|error| "^: rational power does not exist"))
                (#4#
                 (SEQ (LETT |cc| (SPADCALL |uts| |order| (QREFELT $ 57)) . #3#)
                      (LETT |ccInv| (SPADCALL |cc| (QREFELT $ 99)) . #3#)
                      (EXIT
                       (COND
                        ((QEQCAR |ccInv| 1)
                         (|error|
                          (SPADCALL (STRCONC "^: " (QREFELT $ 134))
                                    (QREFELT $ 141))))
                        (#4#
                         (SEQ
                          (LETT |ccPow|
                                (COND
                                 ((SPADCALL |cc| (|spadConstant| $ 39)
                                            (QREFELT $ 142))
                                  |cc|)
                                 ((EQL (SPADCALL |r| (QREFELT $ 137)) 1)
                                  (COND
                                   ((NULL
                                     (MINUSP
                                      (LETT |num|
                                            (SPADCALL |r| (QREFELT $ 143))
                                            . #3#)))
                                    (SPADCALL |cc|
                                              (PROG1 (LETT #2# |num| . #3#)
                                                (|check_subtype| (>= #2# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 #2#))
                                              (QREFELT $ 144)))
                                   ('T
                                    (SPADCALL (QCDR |ccInv|)
                                              (PROG1 (LETT #1# (- |num|) . #3#)
                                                (|check_subtype| (>= #1# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 #1#))
                                              (QREFELT $ 144)))))
                                 ((QREFELT $ 135)
                                  (SPADCALL |cc| |r| (QREFELT $ 145)))
                                 (#4#
                                  (|error|
                                   "^ rational power of coefficient undefined")))
                                . #3#)
                          (LETT |uts1|
                                (SPADCALL (QCDR |ccInv|) |uts| (QREFELT $ 116))
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
                                         (SPADCALL |r| (QREFELT $ 143)))
                                      (QREFELT $ 22))
                            (SPADCALL |uts2| (SPADCALL |r| (QREFELT $ 146))
                                      (QREFELT $ 122))
                            (QREFELT $ 97))))))))))))))))))) 

(DEFUN |ISUPS;cExp;2$;68| (|uts| $)
  (PROG (|cc|)
    (RETURN
     (COND
      ((SPADCALL
        (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57)) |ISUPS;cExp;2$;68|)
        (QREFELT $ 16))
       (|ISUPS;iExp| |uts| (|spadConstant| $ 39) $))
      ((QREFELT $ 136) (|ISUPS;iExp| |uts| (SPADCALL |cc| (QREFELT $ 148)) $))
      ('T
       (|error|
        (SPADCALL (STRCONC "exp: " (QREFELT $ 128)) (QREFELT $ 141)))))))) 

(DEFUN |ISUPS;cLog;2$;69| (|uts| $)
  (PROG (|y| #1=#:G1122 |cc|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57))
               . #2=(|ISUPS;cLog;2$;69|))
         (QREFELT $ 16))
        (|error| "log: constant coefficient should not be 0"))
       ((SPADCALL |cc| (|spadConstant| $ 39) (QREFELT $ 142))
        (SPADCALL
         (SPADCALL (SPADCALL |uts| (QREFELT $ 71))
                   (PROG2
                       (LETT #1#
                             (SPADCALL (|spadConstant| $ 38) |uts| 'T
                                       (QREFELT $ 100))
                             . #2#)
                       (QCDR #1#)
                     (|check_union| (QEQCAR #1# 0) $ #1#))
                   (QREFELT $ 97))
         (QREFELT $ 113)))
       ((QREFELT $ 136)
        (SEQ
         (LETT |y|
               (PROG2
                   (LETT #1#
                         (SPADCALL (|spadConstant| $ 38) |uts| 'T
                                   (QREFELT $ 100))
                         . #2#)
                   (QCDR #1#)
                 (|check_union| (QEQCAR #1# 0) $ #1#))
               . #2#)
         (EXIT
          (SPADCALL (SPADCALL (SPADCALL |cc| (QREFELT $ 150)) (QREFELT $ 27))
                    (SPADCALL
                     (SPADCALL |y| (SPADCALL |uts| (QREFELT $ 71))
                               (QREFELT $ 97))
                     (QREFELT $ 113))
                    (QREFELT $ 83)))))
       ('T
        (|error|
         (SPADCALL (STRCONC "log: " (QREFELT $ 128)) (QREFELT $ 141))))))))) 

(DEFUN |ISUPS;sincos| (|uts| $)
  (PROG (|cc|)
    (RETURN
     (COND
      ((SPADCALL (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57)) |ISUPS;sincos|)
                 (QREFELT $ 16))
       (|ISUPS;iSincos| |uts| (|spadConstant| $ 30) (|spadConstant| $ 39) -1
        $))
      ((QREFELT $ 136)
       (|ISUPS;iSincos| |uts| (SPADCALL |cc| (QREFELT $ 152))
        (SPADCALL |cc| (QREFELT $ 153)) -1 $))
      ('T
       (|error|
        (SPADCALL (STRCONC "sincos: " (QREFELT $ 128)) (QREFELT $ 141)))))))) 

(DEFUN |ISUPS;cSin;2$;71| (|uts| $) (QCAR (|ISUPS;sincos| |uts| $))) 

(DEFUN |ISUPS;cCos;2$;72| (|uts| $) (QCDR (|ISUPS;sincos| |uts| $))) 

(DEFUN |ISUPS;cTan;2$;73| (|uts| $)
  (PROG (|cc|)
    (RETURN
     (COND
      ((SPADCALL
        (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57)) |ISUPS;cTan;2$;73|)
        (QREFELT $ 16))
       (|ISUPS;iTan| |uts| (SPADCALL |uts| (QREFELT $ 71))
        (|spadConstant| $ 30) 1 $))
      ((QREFELT $ 136)
       (|ISUPS;iTan| |uts| (SPADCALL |uts| (QREFELT $ 71))
        (SPADCALL |cc| (QREFELT $ 156)) 1 $))
      ('T
       (|error|
        (SPADCALL (STRCONC "tan: " (QREFELT $ 128)) (QREFELT $ 141)))))))) 

(DEFUN |ISUPS;cCot;2$;74| (|uts| $)
  (PROG (|cc|)
    (RETURN
     (COND
      ((SPADCALL |uts| (QREFELT $ 64)) (|error| "cot: cot(0) is undefined"))
      ((SPADCALL
        (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57)) |ISUPS;cCot;2$;74|)
        (QREFELT $ 16))
       (|error|
        (|error|
         (SPADCALL (STRCONC "cot: " (QREFELT $ 129)) (QREFELT $ 141)))))
      ((QREFELT $ 136)
       (|ISUPS;iTan| |uts|
        (SPADCALL (SPADCALL |uts| (QREFELT $ 71)) (QREFELT $ 86))
        (SPADCALL |cc| (QREFELT $ 158)) 1 $))
      ('T
       (|error|
        (SPADCALL (STRCONC "cot: " (QREFELT $ 128)) (QREFELT $ 141)))))))) 

(DEFUN |ISUPS;cSec;2$;75| (|uts| $)
  (PROG (#1=#:G1146 |cosUts| |cc|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57))
               . #2=(|ISUPS;cSec;2$;75|))
         (QREFELT $ 16))
        (PROG2
            (LETT #1#
                  (SPADCALL (|spadConstant| $ 38)
                            (SPADCALL |uts| (QREFELT $ 155)) 'T
                            (QREFELT $ 100))
                  . #2#)
            (QCDR #1#)
          (|check_union| (QEQCAR #1# 0) $ #1#)))
       ((QREFELT $ 136)
        (SEQ (LETT |cosUts| (SPADCALL |uts| (QREFELT $ 155)) . #2#)
             (EXIT
              (COND
               ((SPADCALL (SPADCALL |cosUts| 0 (QREFELT $ 57)) (QREFELT $ 16))
                (|error|
                 (SPADCALL (STRCONC "sec: " (QREFELT $ 129)) (QREFELT $ 141))))
               (#3='T
                (PROG2
                    (LETT #1#
                          (SPADCALL (|spadConstant| $ 38) |cosUts| 'T
                                    (QREFELT $ 100))
                          . #2#)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0) $ #1#)))))))
       (#3#
        (|error|
         (SPADCALL (STRCONC "sec: " (QREFELT $ 128)) (QREFELT $ 141))))))))) 

(DEFUN |ISUPS;cCsc;2$;76| (|uts| $)
  (PROG (#1=#:G1153 |sinUts|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |uts| (QREFELT $ 64)) (|error| "csc: csc(0) is undefined"))
       ((QREFELT $ 136)
        (SEQ
         (LETT |sinUts| (SPADCALL |uts| (QREFELT $ 154))
               . #2=(|ISUPS;cCsc;2$;76|))
         (EXIT
          (COND
           ((SPADCALL (SPADCALL |sinUts| 0 (QREFELT $ 57)) (QREFELT $ 16))
            (|error|
             (SPADCALL (STRCONC "csc: " (QREFELT $ 129)) (QREFELT $ 141))))
           (#3='T
            (PROG2
                (LETT #1#
                      (SPADCALL (|spadConstant| $ 38) |sinUts| 'T
                                (QREFELT $ 100))
                      . #2#)
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0) $ #1#)))))))
       (#3#
        (|error|
         (SPADCALL (STRCONC "csc: " (QREFELT $ 128)) (QREFELT $ 141))))))))) 

(DEFUN |ISUPS;cAsin;2$;77| (|uts| $)
  (PROG (|c0| #1=#:G1173 |order| |ord| |x| |cc|)
    (RETURN
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
                      (SPADCALL |uts| |uts| (QREFELT $ 97)) (QREFELT $ 65))
            (SPADCALL (SPADCALL 1 2 (QREFELT $ 111)) (QREFELT $ 162))
            (QREFELT $ 147))
           (SPADCALL |uts| (QREFELT $ 71)) (QREFELT $ 97))
          (QREFELT $ 113)))
        ((QREFELT $ 136)
         (SEQ
          (LETT |x|
                (SPADCALL (|spadConstant| $ 38)
                          (SPADCALL |uts| |uts| (QREFELT $ 97)) (QREFELT $ 65))
                . #2#)
          (COND
           ((OR (SPADCALL |cc| (|spadConstant| $ 39) (QREFELT $ 142))
                (SPADCALL |cc| (SPADCALL (|spadConstant| $ 39) (QREFELT $ 85))
                          (QREFELT $ 142)))
            (EXIT
             (SEQ (LETT |ord| (|ISUPS;orderOrFailed| |x| $) . #2#)
                  (EXIT
                   (COND
                    ((QEQCAR |ord| 1)
                     (|error|
                      (SPADCALL (STRCONC "asin: " (QREFELT $ 131))
                                (QREFELT $ 141))))
                    ((EQL (LETT |order| (QCDR |ord|) . #2#) -1)
                     (PROGN
                      (LETT #1#
                            (SPADCALL (SPADCALL |cc| (QREFELT $ 163))
                                      (QREFELT $ 27))
                            . #2#)
                      (GO #1#)))
                    ((ODDP |order|)
                     (|error|
                      (SPADCALL (STRCONC "asin: " (QREFELT $ 130))
                                (QREFELT $ 141))))
                    (#3='T
                     (SEQ
                      (LETT |c0|
                            (SPADCALL (SPADCALL |cc| (QREFELT $ 163))
                                      (QREFELT $ 27))
                            . #2#)
                      (EXIT
                       (SPADCALL |c0|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL |x|
                                             (SPADCALL
                                              (SPADCALL 1 2 (QREFELT $ 111))
                                              (QREFELT $ 162))
                                             (QREFELT $ 147))
                                   (SPADCALL |uts| (QREFELT $ 71))
                                   (QREFELT $ 97))
                                  (QREFELT $ 113))
                                 (QREFELT $ 83)))))))))))
          (LETT |c0| (SPADCALL (SPADCALL |cc| (QREFELT $ 163)) (QREFELT $ 27))
                . #2#)
          (EXIT
           (SPADCALL |c0|
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL |x|
                                 (SPADCALL (SPADCALL 1 2 (QREFELT $ 111))
                                           (QREFELT $ 162))
                                 (QREFELT $ 147))
                       (SPADCALL |uts| (QREFELT $ 71)) (QREFELT $ 97))
                      (QREFELT $ 113))
                     (QREFELT $ 83)))))
        (#3#
         (|error|
          (SPADCALL (STRCONC "asin: " (QREFELT $ 128)) (QREFELT $ 141))))))
      #1# (EXIT #1#))))) 

(DEFUN |ISUPS;cAcos;2$;78| (|uts| $)
  (PROG (|c0| #1=#:G1189 |order| |ord| |cc| |x|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |uts| (QREFELT $ 64))
         (COND
          ((QREFELT $ 136)
           (SPADCALL (SPADCALL (|spadConstant| $ 30) (QREFELT $ 165))
                     (QREFELT $ 27)))
          (#2='T
           (|error|
            (SPADCALL (STRCONC "acos: " (QREFELT $ 128)) (QREFELT $ 141))))))
        ((QREFELT $ 136)
         (SEQ
          (LETT |x|
                (SPADCALL (|spadConstant| $ 38)
                          (SPADCALL |uts| |uts| (QREFELT $ 97)) (QREFELT $ 65))
                . #3=(|ISUPS;cAcos;2$;78|))
          (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57)) . #3#)
          (COND
           ((OR (SPADCALL |cc| (|spadConstant| $ 39) (QREFELT $ 142))
                (SPADCALL |cc| (SPADCALL (|spadConstant| $ 39) (QREFELT $ 85))
                          (QREFELT $ 142)))
            (EXIT
             (SEQ (LETT |ord| (|ISUPS;orderOrFailed| |x| $) . #3#)
                  (EXIT
                   (COND
                    ((QEQCAR |ord| 1)
                     (|error|
                      (SPADCALL (STRCONC "acos: " (QREFELT $ 131))
                                (QREFELT $ 141))))
                    ((EQL (LETT |order| (QCDR |ord|) . #3#) -1)
                     (PROGN
                      (LETT #1#
                            (SPADCALL (SPADCALL |cc| (QREFELT $ 165))
                                      (QREFELT $ 27))
                            . #3#)
                      (GO #1#)))
                    ((ODDP |order|)
                     (|error|
                      (SPADCALL (STRCONC "acos: " (QREFELT $ 130))
                                (QREFELT $ 141))))
                    (#2#
                     (SEQ
                      (LETT |c0|
                            (SPADCALL (SPADCALL |cc| (QREFELT $ 165))
                                      (QREFELT $ 27))
                            . #3#)
                      (EXIT
                       (SPADCALL |c0|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |x|
                                              (SPADCALL
                                               (SPADCALL 1 2 (QREFELT $ 111))
                                               (QREFELT $ 162))
                                              (QREFELT $ 147))
                                    (SPADCALL |uts| (QREFELT $ 71))
                                    (QREFELT $ 97))
                                   (QREFELT $ 86))
                                  (QREFELT $ 113))
                                 (QREFELT $ 83)))))))))))
          (LETT |c0| (SPADCALL (SPADCALL |cc| (QREFELT $ 165)) (QREFELT $ 27))
                . #3#)
          (EXIT
           (SPADCALL |c0|
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL |x|
                                  (SPADCALL (SPADCALL 1 2 (QREFELT $ 111))
                                            (QREFELT $ 162))
                                  (QREFELT $ 147))
                        (SPADCALL |uts| (QREFELT $ 71)) (QREFELT $ 97))
                       (QREFELT $ 86))
                      (QREFELT $ 113))
                     (QREFELT $ 83)))))
        (#2#
         (|error|
          (SPADCALL (STRCONC "acos: " (QREFELT $ 128)) (QREFELT $ 141))))))
      #1# (EXIT #1#))))) 

(DEFUN |ISUPS;cAtan;2$;79| (|uts| $)
  (PROG (|y| #1=#:G1192 |cc|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57))
               . #2=(|ISUPS;cAtan;2$;79|))
         (QREFELT $ 16))
        (SEQ
         (LETT |y|
               (PROG2
                   (LETT #1#
                         (SPADCALL (|spadConstant| $ 38)
                                   (SPADCALL (|spadConstant| $ 38)
                                             (SPADCALL |uts| |uts|
                                                       (QREFELT $ 97))
                                             (QREFELT $ 83))
                                   'T (QREFELT $ 100))
                         . #2#)
                   (QCDR #1#)
                 (|check_union| (QEQCAR #1# 0) $ #1#))
               . #2#)
         (EXIT
          (SPADCALL
           (SPADCALL |y| (SPADCALL |uts| (QREFELT $ 71)) (QREFELT $ 97))
           (QREFELT $ 113)))))
       ((QREFELT $ 136)
        (SEQ
         (LETT |y|
               (SPADCALL (|spadConstant| $ 38)
                         (SPADCALL (|spadConstant| $ 38)
                                   (SPADCALL |uts| |uts| (QREFELT $ 97))
                                   (QREFELT $ 83))
                         'T (QREFELT $ 100))
               . #2#)
         (EXIT
          (COND
           ((QEQCAR |y| 1)
            (|error|
             (SPADCALL (STRCONC "atan: " (QREFELT $ 132)) (QREFELT $ 141))))
           (#3='T
            (SPADCALL (SPADCALL (SPADCALL |cc| (QREFELT $ 168)) (QREFELT $ 27))
                      (SPADCALL
                       (SPADCALL (QCDR |y|) (SPADCALL |uts| (QREFELT $ 71))
                                 (QREFELT $ 97))
                       (QREFELT $ 113))
                      (QREFELT $ 83)))))))
       (#3#
        (|error|
         (SPADCALL (STRCONC "atan: " (QREFELT $ 128)) (QREFELT $ 141))))))))) 

(DEFUN |ISUPS;cAcot;2$;80| (|uts| $)
  (PROG (|cc| |y|)
    (RETURN
     (SEQ
      (COND
       ((QREFELT $ 136)
        (SEQ
         (LETT |y|
               (SPADCALL (|spadConstant| $ 38)
                         (SPADCALL (|spadConstant| $ 38)
                                   (SPADCALL |uts| |uts| (QREFELT $ 97))
                                   (QREFELT $ 83))
                         'T (QREFELT $ 100))
               . #1=(|ISUPS;cAcot;2$;80|))
         (EXIT
          (COND
           ((QEQCAR |y| 1)
            (|error|
             (SPADCALL (STRCONC "acot: " (QREFELT $ 132)) (QREFELT $ 141))))
           (#2='T
            (SEQ (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57)) . #1#)
                 (EXIT
                  (SPADCALL
                   (SPADCALL (SPADCALL |cc| (QREFELT $ 170)) (QREFELT $ 27))
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (QCDR |y|) (SPADCALL |uts| (QREFELT $ 71))
                               (QREFELT $ 97))
                     (QREFELT $ 86))
                    (QREFELT $ 113))
                   (QREFELT $ 83)))))))))
       (#2#
        (|error|
         (SPADCALL (STRCONC "acot: " (QREFELT $ 128)) (QREFELT $ 141))))))))) 

(DEFUN |ISUPS;cAsec;2$;81| (|uts| $)
  (PROG (|z| |y| #1=#:G1222 |order| |ord| |x| |cc|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL
          (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57))
                . #2=(|ISUPS;cAsec;2$;81|))
          (QREFELT $ 16))
         (|error| "asec: constant coefficient should not be 0"))
        ((QREFELT $ 136)
         (SEQ
          (LETT |x|
                (SPADCALL (SPADCALL |uts| |uts| (QREFELT $ 97))
                          (|spadConstant| $ 38) (QREFELT $ 65))
                . #2#)
          (LETT |y|
                (COND
                 ((OR (SPADCALL |cc| (|spadConstant| $ 39) (QREFELT $ 142))
                      (SPADCALL |cc|
                                (SPADCALL (|spadConstant| $ 39) (QREFELT $ 85))
                                (QREFELT $ 142)))
                  (SEQ (LETT |ord| (|ISUPS;orderOrFailed| |x| $) . #2#)
                       (EXIT
                        (COND
                         ((QEQCAR |ord| 1)
                          (|error|
                           (SPADCALL (STRCONC "asec: " (QREFELT $ 131))
                                     (QREFELT $ 141))))
                         ((EQL (LETT |order| (QCDR |ord|) . #2#) -1)
                          (PROGN
                           (LETT #1#
                                 (SPADCALL (SPADCALL |cc| (QREFELT $ 172))
                                           (QREFELT $ 27))
                                 . #2#)
                           (GO #1#)))
                         ((ODDP |order|)
                          (|error|
                           (SPADCALL (STRCONC "asec: " (QREFELT $ 130))
                                     (QREFELT $ 141))))
                         (#3='T
                          (SPADCALL
                           (SPADCALL |x|
                                     (SPADCALL (SPADCALL 1 2 (QREFELT $ 111))
                                               (QREFELT $ 162))
                                     (QREFELT $ 147))
                           (SPADCALL |uts| (QREFELT $ 71)) (QREFELT $ 97)))))))
                 ('T
                  (SPADCALL
                   (SPADCALL |x|
                             (SPADCALL (SPADCALL 1 2 (QREFELT $ 111))
                                       (QREFELT $ 162))
                             (QREFELT $ 147))
                   (SPADCALL |uts| (QREFELT $ 71)) (QREFELT $ 97))))
                . #2#)
          (LETT |z| (SPADCALL |y| |uts| 'T (QREFELT $ 100)) . #2#)
          (EXIT
           (COND
            ((QEQCAR |z| 1)
             (|error|
              (SPADCALL (STRCONC "asec: " (QREFELT $ 134)) (QREFELT $ 141))))
            (#3#
             (SPADCALL
              (SPADCALL (SPADCALL |cc| (QREFELT $ 172)) (QREFELT $ 27))
              (SPADCALL (QCDR |z|) (QREFELT $ 113)) (QREFELT $ 83)))))))
        (#3#
         (|error|
          (SPADCALL (STRCONC "asec: " (QREFELT $ 128)) (QREFELT $ 141))))))
      #1# (EXIT #1#))))) 

(DEFUN |ISUPS;cAcsc;2$;82| (|uts| $)
  (PROG (|z| |y| #1=#:G1240 |order| |ord| |x| |cc|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL
          (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57))
                . #2=(|ISUPS;cAcsc;2$;82|))
          (QREFELT $ 16))
         (|error| "acsc: constant coefficient should not be 0"))
        ((QREFELT $ 136)
         (SEQ
          (LETT |x|
                (SPADCALL (SPADCALL |uts| |uts| (QREFELT $ 97))
                          (|spadConstant| $ 38) (QREFELT $ 65))
                . #2#)
          (LETT |y|
                (COND
                 ((OR (SPADCALL |cc| (|spadConstant| $ 39) (QREFELT $ 142))
                      (SPADCALL |cc|
                                (SPADCALL (|spadConstant| $ 39) (QREFELT $ 85))
                                (QREFELT $ 142)))
                  (SEQ (LETT |ord| (|ISUPS;orderOrFailed| |x| $) . #2#)
                       (EXIT
                        (COND
                         ((QEQCAR |ord| 1)
                          (|error|
                           (SPADCALL (STRCONC "acsc: " (QREFELT $ 131))
                                     (QREFELT $ 141))))
                         ((EQL (LETT |order| (QCDR |ord|) . #2#) -1)
                          (PROGN
                           (LETT #1#
                                 (SPADCALL (SPADCALL |cc| (QREFELT $ 174))
                                           (QREFELT $ 27))
                                 . #2#)
                           (GO #1#)))
                         ((ODDP |order|)
                          (|error|
                           (SPADCALL (STRCONC "acsc: " (QREFELT $ 130))
                                     (QREFELT $ 141))))
                         (#3='T
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL |x|
                                      (SPADCALL (SPADCALL 1 2 (QREFELT $ 111))
                                                (QREFELT $ 162))
                                      (QREFELT $ 147))
                            (SPADCALL |uts| (QREFELT $ 71)) (QREFELT $ 97))
                           (QREFELT $ 86)))))))
                 ('T
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL |x|
                              (SPADCALL (SPADCALL 1 2 (QREFELT $ 111))
                                        (QREFELT $ 162))
                              (QREFELT $ 147))
                    (SPADCALL |uts| (QREFELT $ 71)) (QREFELT $ 97))
                   (QREFELT $ 86))))
                . #2#)
          (LETT |z| (SPADCALL |y| |uts| 'T (QREFELT $ 100)) . #2#)
          (EXIT
           (COND
            ((QEQCAR |z| 1)
             (|error|
              (SPADCALL (STRCONC "asec: " (QREFELT $ 134)) (QREFELT $ 141))))
            (#3#
             (SPADCALL
              (SPADCALL (SPADCALL |cc| (QREFELT $ 174)) (QREFELT $ 27))
              (SPADCALL (QCDR |z|) (QREFELT $ 113)) (QREFELT $ 83)))))))
        (#3#
         (|error|
          (SPADCALL (STRCONC "acsc: " (QREFELT $ 128)) (QREFELT $ 141))))))
      #1# (EXIT #1#))))) 

(DEFUN |ISUPS;sinhcosh| (|uts| $)
  (PROG (|tmp| |cc|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57)) . #1=(|ISUPS;sinhcosh|))
         (QREFELT $ 16))
        (SEQ
         (LETT |tmp|
               (|ISUPS;iSincos| |uts| (|spadConstant| $ 30)
                (|spadConstant| $ 39) 1 $)
               . #1#)
         (EXIT (CONS (QCAR |tmp|) (QCDR |tmp|)))))
       ((QREFELT $ 136)
        (SEQ
         (LETT |tmp|
               (|ISUPS;iSincos| |uts| (SPADCALL |cc| (QREFELT $ 176))
                (SPADCALL |cc| (QREFELT $ 177)) 1 $)
               . #1#)
         (EXIT (CONS (QCAR |tmp|) (QCDR |tmp|)))))
       ('T
        (|error|
         (SPADCALL (STRCONC "sinhcosh: " (QREFELT $ 128))
                   (QREFELT $ 141))))))))) 

(DEFUN |ISUPS;cSinh;2$;84| (|uts| $) (QCAR (|ISUPS;sinhcosh| |uts| $))) 

(DEFUN |ISUPS;cCosh;2$;85| (|uts| $) (QCDR (|ISUPS;sinhcosh| |uts| $))) 

(DEFUN |ISUPS;cTanh;2$;86| (|uts| $)
  (PROG (|cc|)
    (RETURN
     (COND
      ((SPADCALL
        (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57)) |ISUPS;cTanh;2$;86|)
        (QREFELT $ 16))
       (|ISUPS;iTan| |uts| (SPADCALL |uts| (QREFELT $ 71))
        (|spadConstant| $ 30) -1 $))
      ((QREFELT $ 136)
       (|ISUPS;iTan| |uts| (SPADCALL |uts| (QREFELT $ 71))
        (SPADCALL |cc| (QREFELT $ 180)) -1 $))
      ('T
       (|error|
        (SPADCALL (STRCONC "tanh: " (QREFELT $ 128)) (QREFELT $ 141)))))))) 

(DEFUN |ISUPS;cCoth;2$;87| (|uts| $)
  (PROG (#1=#:G1259 |tanhUts|)
    (RETURN
     (SEQ
      (LETT |tanhUts| (SPADCALL |uts| (QREFELT $ 181))
            . #2=(|ISUPS;cCoth;2$;87|))
      (EXIT
       (COND
        ((SPADCALL |tanhUts| (QREFELT $ 64))
         (|error| "coth: coth(0) is undefined"))
        ((SPADCALL (SPADCALL |tanhUts| 0 (QREFELT $ 57)) (QREFELT $ 16))
         (|error|
          (SPADCALL (STRCONC "coth: " (QREFELT $ 129)) (QREFELT $ 141))))
        ('T
         (PROG2
             (LETT #1#
                   (SPADCALL (|spadConstant| $ 38) |tanhUts| 'T
                             (QREFELT $ 100))
                   . #2#)
             (QCDR #1#)
           (|check_union| (QEQCAR #1# 0) $ #1#))))))))) 

(DEFUN |ISUPS;cSech;2$;88| (|uts| $)
  (PROG (#1=#:G1266 |coshUts|)
    (RETURN
     (SEQ
      (LETT |coshUts| (SPADCALL |uts| (QREFELT $ 179))
            . #2=(|ISUPS;cSech;2$;88|))
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |coshUts| 0 (QREFELT $ 57)) (QREFELT $ 16))
         (|error|
          (SPADCALL (STRCONC "sech: " (QREFELT $ 129)) (QREFELT $ 141))))
        ('T
         (PROG2
             (LETT #1#
                   (SPADCALL (|spadConstant| $ 38) |coshUts| 'T
                             (QREFELT $ 100))
                   . #2#)
             (QCDR #1#)
           (|check_union| (QEQCAR #1# 0) $ #1#))))))))) 

(DEFUN |ISUPS;cCsch;2$;89| (|uts| $)
  (PROG (#1=#:G1272 |sinhUts|)
    (RETURN
     (SEQ
      (LETT |sinhUts| (SPADCALL |uts| (QREFELT $ 178))
            . #2=(|ISUPS;cCsch;2$;89|))
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |sinhUts| 0 (QREFELT $ 57)) (QREFELT $ 16))
         (|error|
          (SPADCALL (STRCONC "csch: " (QREFELT $ 129)) (QREFELT $ 141))))
        ('T
         (PROG2
             (LETT #1#
                   (SPADCALL (|spadConstant| $ 38) |sinhUts| 'T
                             (QREFELT $ 100))
                   . #2#)
             (QCDR #1#)
           (|check_union| (QEQCAR #1# 0) $ #1#))))))))) 

(DEFUN |ISUPS;cAsinh;2$;90| (|uts| $)
  (PROG (#1=#:G1284 |order| |ord| |cc| |x|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |x|
              (SPADCALL (|spadConstant| $ 38)
                        (SPADCALL |uts| |uts| (QREFELT $ 97)) (QREFELT $ 83))
              . #2=(|ISUPS;cAsinh;2$;90|))
        (EXIT
         (COND
          ((SPADCALL (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57)) . #2#)
                     (QREFELT $ 16))
           (SPADCALL
            (SPADCALL |uts|
                      (SPADCALL |x| (SPADCALL 1 2 (QREFELT $ 111))
                                (QREFELT $ 147))
                      (QREFELT $ 83))
            (QREFELT $ 151)))
          ((QREFELT $ 136)
           (SEQ (LETT |ord| (|ISUPS;orderOrFailed| |x| $) . #2#)
                (EXIT
                 (COND
                  ((QEQCAR |ord| 1)
                   (|error|
                    (SPADCALL (STRCONC "asinh: " (QREFELT $ 131))
                              (QREFELT $ 141))))
                  ((EQL (LETT |order| (QCDR |ord|) . #2#) -1)
                   (PROGN
                    (LETT #1#
                          (SPADCALL (SPADCALL |cc| (QREFELT $ 185))
                                    (QREFELT $ 27))
                          . #2#)
                    (GO #1#)))
                  ((ODDP |order|)
                   (|error|
                    (SPADCALL (STRCONC "asinh: " (QREFELT $ 130))
                              (QREFELT $ 141))))
                  (#3='T
                   (SPADCALL
                    (SPADCALL |uts|
                              (SPADCALL |x| (SPADCALL 1 2 (QREFELT $ 111))
                                        (QREFELT $ 147))
                              (QREFELT $ 83))
                    (QREFELT $ 151)))))))
          (#3#
           (|error|
            (SPADCALL (STRCONC "asinh: " (QREFELT $ 128))
                      (QREFELT $ 141))))))))
      #1# (EXIT #1#))))) 

(DEFUN |ISUPS;cAcosh;2$;91| (|uts| $)
  (PROG (#1=#:G1298 |order| |ord| |x| |cc|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |uts| (QREFELT $ 64))
         (COND
          ((QREFELT $ 136)
           (SPADCALL (SPADCALL (|spadConstant| $ 30) (QREFELT $ 187))
                     (QREFELT $ 27)))
          (#2='T
           (|error|
            (SPADCALL (STRCONC "acosh: " (QREFELT $ 128)) (QREFELT $ 141))))))
        ((QREFELT $ 136)
         (SEQ
          (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57))
                . #3=(|ISUPS;cAcosh;2$;91|))
          (LETT |x|
                (SPADCALL (SPADCALL |uts| |uts| (QREFELT $ 97))
                          (|spadConstant| $ 38) (QREFELT $ 65))
                . #3#)
          (COND
           ((OR (SPADCALL |cc| (|spadConstant| $ 39) (QREFELT $ 142))
                (SPADCALL |cc| (SPADCALL (|spadConstant| $ 39) (QREFELT $ 85))
                          (QREFELT $ 142)))
            (EXIT
             (SEQ (LETT |ord| (|ISUPS;orderOrFailed| |x| $) . #3#)
                  (EXIT
                   (COND
                    ((QEQCAR |ord| 1)
                     (|error|
                      (SPADCALL (STRCONC "acosh: " (QREFELT $ 131))
                                (QREFELT $ 141))))
                    ((EQL (LETT |order| (QCDR |ord|) . #3#) -1)
                     (PROGN
                      (LETT #1#
                            (SPADCALL (SPADCALL |cc| (QREFELT $ 187))
                                      (QREFELT $ 27))
                            . #3#)
                      (GO #1#)))
                    ((ODDP |order|)
                     (|error|
                      (SPADCALL (STRCONC "acosh: " (QREFELT $ 130))
                                (QREFELT $ 141))))
                    (#2#
                     (SPADCALL
                      (SPADCALL |uts|
                                (SPADCALL |x| (SPADCALL 1 2 (QREFELT $ 111))
                                          (QREFELT $ 147))
                                (QREFELT $ 83))
                      (QREFELT $ 151)))))))))
          (EXIT
           (SPADCALL
            (SPADCALL |uts|
                      (SPADCALL |x| (SPADCALL 1 2 (QREFELT $ 111))
                                (QREFELT $ 147))
                      (QREFELT $ 83))
            (QREFELT $ 151)))))
        (#2#
         (|error|
          (SPADCALL (STRCONC "acosh: " (QREFELT $ 128)) (QREFELT $ 141))))))
      #1# (EXIT #1#))))) 

(DEFUN |ISUPS;cAtanh;2$;92| (|uts| $)
  (PROG (|cc| |half|)
    (RETURN
     (SEQ
      (LETT |half|
            (SPADCALL (SPADCALL (SPADCALL 2 (QREFELT $ 114)) (QREFELT $ 115))
                      (QREFELT $ 146))
            . #1=(|ISUPS;cAtanh;2$;92|))
      (EXIT
       (COND
        ((SPADCALL (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57)) . #1#)
                   (QREFELT $ 16))
         (SPADCALL |half|
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 38) |uts| (QREFELT $ 83))
                     (QREFELT $ 151))
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 38) |uts| (QREFELT $ 65))
                     (QREFELT $ 151))
                    (QREFELT $ 65))
                   (QREFELT $ 116)))
        ((QREFELT $ 136)
         (COND
          ((OR (SPADCALL |cc| (|spadConstant| $ 39) (QREFELT $ 142))
               (SPADCALL |cc| (SPADCALL (|spadConstant| $ 39) (QREFELT $ 85))
                         (QREFELT $ 142)))
           (|error|
            (SPADCALL (STRCONC "atanh: " (QREFELT $ 132)) (QREFELT $ 141))))
          ('T
           (SPADCALL |half|
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 38) |uts| (QREFELT $ 83))
                       (QREFELT $ 151))
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 38) |uts| (QREFELT $ 65))
                       (QREFELT $ 151))
                      (QREFELT $ 65))
                     (QREFELT $ 116)))))
        ('T
         (|error|
          (SPADCALL (STRCONC "atanh: " (QREFELT $ 128)) (QREFELT $ 141)))))))))) 

(DEFUN |ISUPS;cAcoth;2$;93| (|uts| $)
  (PROG (|half| |cc|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |uts| (QREFELT $ 64))
        (COND
         ((QREFELT $ 136)
          (SPADCALL (SPADCALL (|spadConstant| $ 30) (QREFELT $ 190))
                    (QREFELT $ 27)))
         (#1='T
          (|error|
           (SPADCALL (STRCONC "acoth: " (QREFELT $ 128)) (QREFELT $ 141))))))
       ((QREFELT $ 136)
        (SEQ
         (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57))
               . #2=(|ISUPS;cAcoth;2$;93|))
         (LETT |half|
               (SPADCALL
                (SPADCALL (SPADCALL 2 (QREFELT $ 114)) (QREFELT $ 115))
                (QREFELT $ 146))
               . #2#)
         (COND
          ((OR (SPADCALL |cc| (|spadConstant| $ 39) (QREFELT $ 142))
               (SPADCALL |cc| (SPADCALL (|spadConstant| $ 39) (QREFELT $ 85))
                         (QREFELT $ 142)))
           (EXIT
            (|error|
             (SPADCALL (STRCONC "acoth: " (QREFELT $ 132)) (QREFELT $ 141))))))
         (EXIT
          (SPADCALL |half|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL |uts| (|spadConstant| $ 38) (QREFELT $ 83))
                      (QREFELT $ 151))
                     (SPADCALL
                      (SPADCALL |uts| (|spadConstant| $ 38) (QREFELT $ 65))
                      (QREFELT $ 151))
                     (QREFELT $ 65))
                    (QREFELT $ 116)))))
       (#1#
        (|error|
         (SPADCALL (STRCONC "acoth: " (QREFELT $ 128)) (QREFELT $ 141))))))))) 

(DEFUN |ISUPS;cAsech;2$;94| (|uts| $)
  (PROG (|utsInv| #1=#:G1328 |order| |ord| |x| |cc|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |uts| (QREFELT $ 64))
         (|error| "asech: asech(0) is undefined"))
        ((QREFELT $ 136)
         (COND
          ((SPADCALL
            (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57))
                  . #2=(|ISUPS;cAsech;2$;94|))
            (QREFELT $ 16))
           (|error|
            (SPADCALL (STRCONC "asech: " (QREFELT $ 133)) (QREFELT $ 141))))
          (#3='T
           (SEQ
            (LETT |x|
                  (SPADCALL (|spadConstant| $ 38)
                            (SPADCALL |uts| |uts| (QREFELT $ 97))
                            (QREFELT $ 65))
                  . #2#)
            (COND
             ((OR (SPADCALL |cc| (|spadConstant| $ 39) (QREFELT $ 142))
                  (SPADCALL |cc|
                            (SPADCALL (|spadConstant| $ 39) (QREFELT $ 85))
                            (QREFELT $ 142)))
              (EXIT
               (SEQ (LETT |ord| (|ISUPS;orderOrFailed| |x| $) . #2#)
                    (EXIT
                     (COND
                      ((QEQCAR |ord| 1)
                       (|error|
                        (SPADCALL (STRCONC "asech: " (QREFELT $ 131))
                                  (QREFELT $ 141))))
                      ((EQL (LETT |order| (QCDR |ord|) . #2#) -1)
                       (PROGN
                        (LETT #1#
                              (SPADCALL (SPADCALL |cc| (QREFELT $ 192))
                                        (QREFELT $ 27))
                              . #2#)
                        (GO #1#)))
                      ((ODDP |order|)
                       (|error|
                        (SPADCALL (STRCONC "asech: " (QREFELT $ 130))
                                  (QREFELT $ 141))))
                      (#3#
                       (SEQ
                        (LETT |utsInv|
                              (SPADCALL (|spadConstant| $ 38) |uts| 'T
                                        (QREFELT $ 100))
                              . #2#)
                        (EXIT
                         (COND
                          ((QEQCAR |utsInv| 1)
                           (|error|
                            (SPADCALL (STRCONC "asech: " (QREFELT $ 134))
                                      (QREFELT $ 141))))
                          (#3#
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 38)
                                       (SPADCALL |x|
                                                 (SPADCALL 1 2 (QREFELT $ 111))
                                                 (QREFELT $ 147))
                                       (QREFELT $ 83))
                             (QCDR |utsInv|) (QREFELT $ 97))
                            (QREFELT $ 151)))))))))))))
            (LETT |utsInv|
                  (SPADCALL (|spadConstant| $ 38) |uts| 'T (QREFELT $ 100))
                  . #2#)
            (EXIT
             (COND
              ((QEQCAR |utsInv| 1)
               (|error|
                (SPADCALL (STRCONC "asech: " (QREFELT $ 134))
                          (QREFELT $ 141))))
              (#3#
               (SPADCALL
                (SPADCALL
                 (SPADCALL (|spadConstant| $ 38)
                           (SPADCALL |x| (SPADCALL 1 2 (QREFELT $ 111))
                                     (QREFELT $ 147))
                           (QREFELT $ 83))
                 (QCDR |utsInv|) (QREFELT $ 97))
                (QREFELT $ 151)))))))))
        (#3#
         (|error|
          (SPADCALL (STRCONC "asech: " (QREFELT $ 128)) (QREFELT $ 141))))))
      #1# (EXIT #1#))))) 

(DEFUN |ISUPS;cAcsch;2$;95| (|uts| $)
  (PROG (|utsInv| #1=#:G1342 |order| |ord| |x| |cc|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |uts| (QREFELT $ 64))
         (|error| "acsch: acsch(0) is undefined"))
        ((QREFELT $ 136)
         (COND
          ((SPADCALL
            (LETT |cc| (SPADCALL |uts| 0 (QREFELT $ 57))
                  . #2=(|ISUPS;cAcsch;2$;95|))
            (QREFELT $ 16))
           (|error|
            (SPADCALL (STRCONC "acsch: " (QREFELT $ 133)) (QREFELT $ 141))))
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
               (|error|
                (SPADCALL (STRCONC "acsc: " (QREFELT $ 131)) (QREFELT $ 141))))
              ((EQL (LETT |order| (QCDR |ord|) . #2#) -1)
               (PROGN
                (LETT #1#
                      (SPADCALL (SPADCALL |cc| (QREFELT $ 194)) (QREFELT $ 27))
                      . #2#)
                (GO #1#)))
              ((ODDP |order|)
               (|error|
                (SPADCALL (STRCONC "acsch: " (QREFELT $ 130))
                          (QREFELT $ 141))))
              (#3#
               (SEQ
                (LETT |utsInv|
                      (SPADCALL (|spadConstant| $ 38) |uts| 'T (QREFELT $ 100))
                      . #2#)
                (EXIT
                 (COND
                  ((QEQCAR |utsInv| 1)
                   (|error|
                    (SPADCALL (STRCONC "acsch: " (QREFELT $ 134))
                              (QREFELT $ 141))))
                  (#3#
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 38)
                               (SPADCALL |x| (SPADCALL 1 2 (QREFELT $ 111))
                                         (QREFELT $ 147))
                               (QREFELT $ 83))
                     (QCDR |utsInv|) (QREFELT $ 97))
                    (QREFELT $ 151)))))))))))))
        (#3#
         (|error|
          (SPADCALL (STRCONC "acsch: " (QREFELT $ 128)) (QREFELT $ 141))))))
      #1# (EXIT #1#))))) 

(PUT '|ISUPS;factorials?| '|SPADreplace| '(XLAM NIL 'NIL)) 

(DEFUN |ISUPS;factorials?| ($) 'NIL) 

(DEFUN |ISUPS;termOutput| (|k| |c| |vv| $)
  (PROG (|mon|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |k| (|spadConstant| $ 196) (QREFELT $ 197))
        (SPADCALL |c| (QREFELT $ 198)))
       (#1='T
        (SEQ
         (LETT |mon|
               (COND
                ((SPADCALL |k| (|spadConstant| $ 166) (QREFELT $ 197)) |vv|)
                (#1#
                 (SPADCALL |vv| (SPADCALL |k| (QREFELT $ 199))
                           (QREFELT $ 200))))
               |ISUPS;termOutput|)
         (EXIT
          (COND ((SPADCALL |c| (|spadConstant| $ 39) (QREFELT $ 142)) |mon|)
                ((SPADCALL |c| (SPADCALL (|spadConstant| $ 39) (QREFELT $ 85))
                           (QREFELT $ 142))
                 (SPADCALL |mon| (QREFELT $ 201)))
                (#1#
                 (SPADCALL (SPADCALL |c| (QREFELT $ 198)) |mon|
                           (QREFELT $ 202)))))))))))) 

(PUT '|ISUPS;showAll?| '|SPADreplace| '(XLAM NIL 'T)) 

(DEFUN |ISUPS;showAll?| ($) 'T) 

(DEFUN |ISUPS;seriesToOutputForm;SRSCoefFOf;99|
       (|st| |refer| |var| |cen| |r| $)
  (PROG (|l| |deg| |term| |vv|)
    (RETURN
     (SEQ
      (LETT |vv|
            (COND
             ((SPADCALL |cen| (QREFELT $ 16)) (SPADCALL |var| (QREFELT $ 204)))
             (#1='T
              (SPADCALL
               (SPADCALL (SPADCALL |var| (QREFELT $ 204))
                         (SPADCALL |cen| (QREFELT $ 198)) (QREFELT $ 205))
               (QREFELT $ 206))))
            . #2=(|ISUPS;seriesToOutputForm;SRSCoefFOf;99|))
      (LETT |l| NIL . #2#)
      (SEQ G190 (COND ((NULL (SPADCALL |st| (QREFELT $ 43))) (GO G191)))
           (SEQ (LETT |term| (SPADCALL |st| (QREFELT $ 32)) . #2#)
                (LETT |l|
                      (CONS
                       (|ISUPS;termOutput|
                        (SPADCALL (|ISUPS;getExpon| |term| $) |r|
                                  (QREFELT $ 207))
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
                                    (QREFELT $ 209))
                          . #2#)
                    (EXIT
                     (COND
                      ((QEQCAR |deg| 0)
                       (CONS
                        (SPADCALL "O"
                                  (LIST
                                   (SPADCALL |vv|
                                             (SPADCALL
                                              (SPADCALL (+ (QCDR |deg|) 1) |r|
                                                        (QREFELT $ 207))
                                              (QREFELT $ 199))
                                             (QREFELT $ 200)))
                                  (QREFELT $ 211))
                        |l|))
                      (#1# |l|))))))
            . #2#)
      (EXIT
       (COND ((NULL |l|) (SPADCALL (|spadConstant| $ 30) (QREFELT $ 198)))
             (#1# (SPADCALL (ELT $ 212) (NREVERSE |l|) (QREFELT $ 215))))))))) 

(DEFUN |InnerSparseUnivariatePowerSeries| (#1=#:G1368)
  (PROG ()
    (RETURN
     (PROG (#2=#:G1369)
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
                    '|InnerSparseUnivariatePowerSeries|))))))))))) 

(DEFUN |InnerSparseUnivariatePowerSeries;| (|#1|)
  (PROG (|pv$| #1=#:G1367 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #2=(|InnerSparseUnivariatePowerSeries|))
      (LETT |dv$| (LIST '|InnerSparseUnivariatePowerSeries| DV$1) . #2#)
      (LETT $ (GETREFV 224) . #2#)
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
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|CommutativeRing|))
                                                . #2#)
                                          (OR #1#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
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
                                          (OR
                                           (|HasCategory| |#1| '(|SemiRing|))
                                           (|HasSignature| |#1|
                                                           (LIST '*
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|Integer|)
                                                                  (|devaluate|
                                                                   |#1|)))))
                                          (OR #1#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#1| '(|Ring|))
                                              (|HasSignature| |#1|
                                                              (LIST '*
                                                                    (LIST
                                                                     (|devaluate|
                                                                      |#1|)
                                                                     '(|Integer|)
                                                                     (|devaluate|
                                                                      |#1|)))))
                                          (OR (|HasCategory| |#1| '(|Ring|))
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
                                                          '(|AbelianGroup|))
                                           (|HasCategory| |#1|
                                                          '(|AbelianMonoid|))
                                           (|HasCategory| |#1|
                                                          '(|CancellationAbelianMonoid|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           #1#
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           (|HasCategory| |#1| '(|Ring|))
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
                                                          '(|AbelianGroup|))
                                           (|HasCategory| |#1|
                                                          '(|CancellationAbelianMonoid|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           #1#
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           (|HasCategory| |#1| '(|Ring|))
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
                                                          '(|AbelianGroup|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicNonZero|))
                                           (|HasCategory| |#1|
                                                          '(|CharacteristicZero|))
                                           #1#
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           (|HasCategory| |#1| '(|Ring|))
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
                                           #1#
                                           (|HasCategory| |#1|
                                                          '(|IntegralDomain|))
                                           (|HasCategory| |#1| '(|Ring|))
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
                                          (OR
                                           (|HasCategory| |#1|
                                                          '(|AbelianGroup|))
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
                                                          '(|CancellationAbelianMonoid|))
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
                                                          '(|AbelianMonoid|))
                                           (|HasSignature| |#1|
                                                           (LIST '*
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |#1|)
                                                                  '(|Integer|)
                                                                  (|devaluate|
                                                                   |#1|)))))))
                      . #2#))
      (|haddProp| |$ConstructorCache| '|InnerSparseUnivariatePowerSeries|
                  (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
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
         (QSETREFV $ 113 (CONS (|dispatchFunction| |ISUPS;integrate;2$;56|) $))
         NIL
         NIL
         NIL
         (QSETREFV $ 122
                   (CONS (|dispatchFunction| |ISUPS;cPower;$Coef$;60|) $))
         NIL
         NIL
         NIL
         NIL
         NIL
         (QSETREFV $ 128 "series expansion involves transcendental constants")
         (QSETREFV $ 129 "series expansion has terms of negative degree")
         (QSETREFV $ 130 "series expansion has terms of fractional degree")
         (QSETREFV $ 131
                   "series expansion may have terms of fractional degree")
         (QSETREFV $ 132 "series expansion has logarithmic term")
         (QSETREFV $ 133
                   "series expansion has terms of negative degree or logarithmic term")
         (QSETREFV $ 134 "leading coefficient not invertible")
         NIL
         (QSETREFV $ 135
                   (|HasSignature| |#1|
                                   (LIST '^
                                         (LIST (|devaluate| |#1|)
                                               (|devaluate| |#1|)
                                               '(|Fraction| (|Integer|))))))
         (QSETREFV $ 136
                   (|HasCategory| |#1| '(|TranscendentalFunctionCategory|)))
         (QSETREFV $ 147
                   (CONS (|dispatchFunction| |ISUPS;cRationalPower;$F$;67|) $))
         (QSETREFV $ 149 (CONS (|dispatchFunction| |ISUPS;cExp;2$;68|) $))
         (QSETREFV $ 151 (CONS (|dispatchFunction| |ISUPS;cLog;2$;69|) $))
         NIL
         (QSETREFV $ 154 (CONS (|dispatchFunction| |ISUPS;cSin;2$;71|) $))
         (QSETREFV $ 155 (CONS (|dispatchFunction| |ISUPS;cCos;2$;72|) $))
         (QSETREFV $ 157 (CONS (|dispatchFunction| |ISUPS;cTan;2$;73|) $))
         (QSETREFV $ 159 (CONS (|dispatchFunction| |ISUPS;cCot;2$;74|) $))
         (QSETREFV $ 160 (CONS (|dispatchFunction| |ISUPS;cSec;2$;75|) $))
         (QSETREFV $ 161 (CONS (|dispatchFunction| |ISUPS;cCsc;2$;76|) $))
         (QSETREFV $ 164 (CONS (|dispatchFunction| |ISUPS;cAsin;2$;77|) $))
         (QSETREFV $ 167 (CONS (|dispatchFunction| |ISUPS;cAcos;2$;78|) $))
         (QSETREFV $ 169 (CONS (|dispatchFunction| |ISUPS;cAtan;2$;79|) $))
         (QSETREFV $ 171 (CONS (|dispatchFunction| |ISUPS;cAcot;2$;80|) $))
         (QSETREFV $ 173 (CONS (|dispatchFunction| |ISUPS;cAsec;2$;81|) $))
         (QSETREFV $ 175 (CONS (|dispatchFunction| |ISUPS;cAcsc;2$;82|) $))
         NIL
         (QSETREFV $ 178 (CONS (|dispatchFunction| |ISUPS;cSinh;2$;84|) $))
         (QSETREFV $ 179 (CONS (|dispatchFunction| |ISUPS;cCosh;2$;85|) $))
         (QSETREFV $ 181 (CONS (|dispatchFunction| |ISUPS;cTanh;2$;86|) $))
         (QSETREFV $ 182 (CONS (|dispatchFunction| |ISUPS;cCoth;2$;87|) $))
         (QSETREFV $ 183 (CONS (|dispatchFunction| |ISUPS;cSech;2$;88|) $))
         (QSETREFV $ 184 (CONS (|dispatchFunction| |ISUPS;cCsch;2$;89|) $))
         (QSETREFV $ 186 (CONS (|dispatchFunction| |ISUPS;cAsinh;2$;90|) $))
         (QSETREFV $ 188 (CONS (|dispatchFunction| |ISUPS;cAcosh;2$;91|) $))
         (QSETREFV $ 189 (CONS (|dispatchFunction| |ISUPS;cAtanh;2$;92|) $))
         (QSETREFV $ 191 (CONS (|dispatchFunction| |ISUPS;cAcoth;2$;93|) $))
         (QSETREFV $ 193 (CONS (|dispatchFunction| |ISUPS;cAsech;2$;94|) $))
         (QSETREFV $ 195 (CONS (|dispatchFunction| |ISUPS;cAcsch;2$;95|) $)))))
      $)))) 

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
              (39 . |Zero|) (43 . |setelt|) (49 . |frst|) (54 . |coerce|)
              |ISUPS;series;S$;12| (|NonNegativeInteger|)
              (59 . |characteristic|) |ISUPS;characteristic;Nni;13|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |ISUPS;One;$;15|) $))
              (63 . |One|) (67 . |elt|) (72 . <) (78 . |explicitlyEmpty?|)
              (83 . |explicitEntries?|) (88 . |lazyEvaluate|)
              |ISUPS;extend;$I$;17| |ISUPS;complete;2$;18| (93 . >) (99 . >=)
              (105 . |One|) (109 . +) (115 . |retract|) (|Mapping| $)
              (120 . |delay|) (125 . |minusInfinity|) |ISUPS;truncate;$I$;21|
              |ISUPS;truncate;$2I$;22| |ISUPS;coefficient;$ICoef;24|
              |ISUPS;elt;$ICoef;25| |ISUPS;order;$I;27| |ISUPS;order;$2I;28|
              |ISUPS;terms;$S;29| (|SingleInteger|) (129 . |whatInfinity|)
              |ISUPS;zero?;$B;30| |ISUPS;-;3$;41| |ISUPS;=;2$B;31|
              (|Mapping| 6 6) |ISUPS;map;M2$;34| (134 . *) (140 . -)
              |ISUPS;differentiate;2$;35| (146 . *) (|Mapping| 6 21)
              |ISUPS;multiplyCoefficients;M2$;36| (|PositiveInteger|) (152 . *)
              |ISUPS;multiplyExponents;$Pi$;37| (158 . |false|) (162 . =)
              (168 . <) (174 . |min|) (180 . +) |ISUPS;+;3$;40| (186 . -)
              (192 . -) |ISUPS;-;2$;42| |ISUPS;*;I2$;43| (197 . *)
              |ISUPS;*;Nni2$;44| (203 . *) |ISUPS;*;Pi2$;45| (|Void|)
              (209 . |void|) (213 . +) (219 . |lazy?|) (224 . |One|)
              |ISUPS;*;3$;49| (|Union| $ '"failed") (228 . |recip|)
              |ISUPS;iExquo;2$BU;52| |ISUPS;taylorQuoByVar;2$;53| (233 . *)
              (239 . |zero?|) (244 . ^) (250 . *) (256 . |true|) (260 . |One|)
              (264 . -) |ISUPS;iCompose;3$;55| (|Fraction| 21) (269 . /)
              (275 . *) (281 . |integrate|) (286 . |coerce|) (291 . |inv|)
              (296 . *) (302 . |Zero|) (306 . |Zero|) (|Mapping| 10 10)
              (|ParadoxicalCombinatorsForStreams| 9) (310 . Y) (315 . |cPower|)
              (321 . |Zero|) (|List| 10) (325 . |second|) (|Mapping| 124 124)
              (330 . Y) 'TRCONST 'NPOWERS 'FPOWERS 'MAYFPOW 'LOGS 'NPOWLOG
              'NOTINV 'RATPOWERS 'TRANSFCN (336 . |denom|) (341 . |exquo|)
              (|OutputForm|) (|String|) (347 . |coerce|) (352 . =)
              (358 . |numer|) (363 . ^) (369 . ^) (375 . |coerce|)
              (380 . |cRationalPower|) (386 . |exp|) (391 . |cExp|)
              (396 . |log|) (401 . |cLog|) (406 . |sin|) (411 . |cos|)
              (416 . |cSin|) (421 . |cCos|) (426 . |tan|) (431 . |cTan|)
              (436 . |cot|) (441 . |cCot|) (446 . |cSec|) (451 . |cCsc|)
              (456 . -) (461 . |asin|) (466 . |cAsin|) (471 . |acos|)
              (476 . |One|) (480 . |cAcos|) (485 . |atan|) (490 . |cAtan|)
              (495 . |acot|) (500 . |cAcot|) (505 . |asec|) (510 . |cAsec|)
              (515 . |acsc|) (520 . |cAcsc|) (525 . |sinh|) (530 . |cosh|)
              (535 . |cSinh|) (540 . |cCosh|) (545 . |tanh|) (550 . |cTanh|)
              (555 . |cCoth|) (560 . |cSech|) (565 . |cCsch|) (570 . |asinh|)
              (575 . |cAsinh|) (580 . |acosh|) (585 . |cAcosh|)
              (590 . |cAtanh|) (595 . |acoth|) (600 . |cAcoth|) (605 . |asech|)
              (610 . |cAsech|) (615 . |acsch|) (620 . |cAcsch|) (625 . |Zero|)
              (629 . =) (635 . |coerce|) (640 . |coerce|) (645 . ^) (651 . -)
              (656 . *) (|Symbol|) (662 . |coerce|) (667 . -) (673 . |paren|)
              (678 . *) (|Union| 21 '"failed") (684 . |retractIfCan|)
              (|List| $) (689 . |prefix|) (695 . +) (|Mapping| 139 139 139)
              (|List| 139) (701 . |reduce|)
              |ISUPS;seriesToOutputForm;SRSCoefFOf;99| (|List| 203) (|List| 35)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Stream| 6) (|List| 222) (|SingletonAsOrderedSet|) (|List| 21))
           '#(~= 707 |zero?| 713 |variables| 718 |variable| 723 |unitNormal|
              728 |unitCanonical| 733 |unit?| 738 |truncate| 743 |terms| 756
              |taylorQuoByVar| 761 |subtractIfCan| 766 |seriesToOutputForm| 772
              |series| 781 |sample| 786 |reductum| 790 |recip| 795 |pole?| 800
              |order| 805 |one?| 816 |multiplyExponents| 821
              |multiplyCoefficients| 827 |monomial?| 833 |monomial| 838 |map|
              858 |makeSeries| 864 |leadingMonomial| 870 |leadingCoefficient|
              875 |latex| 880 |integrate| 885 |iExquo| 890 |iCompose| 897
              |hash| 903 |getStream| 908 |getRef| 913 |extend| 918 |exquo| 924
              |eval| 930 |elt| 936 |differentiate| 948 |degree| 985 |complete|
              990 |coerce| 995 |coefficient| 1020 |charthRoot| 1026
              |characteristic| 1031 |center| 1035 |cTanh| 1040 |cTan| 1045
              |cSinh| 1050 |cSin| 1055 |cSech| 1060 |cSec| 1065
              |cRationalPower| 1070 |cPower| 1076 |cLog| 1082 |cExp| 1087
              |cCsch| 1092 |cCsc| 1097 |cCoth| 1102 |cCot| 1107 |cCosh| 1112
              |cCos| 1117 |cAtanh| 1122 |cAtan| 1127 |cAsinh| 1132 |cAsin| 1137
              |cAsech| 1142 |cAsec| 1147 |cAcsch| 1152 |cAcsc| 1157 |cAcoth|
              1162 |cAcot| 1167 |cAcosh| 1172 |cAcos| 1177 |associates?| 1182
              |approximate| 1188 ^ 1194 |Zero| 1206 |One| 1210 D 1214 = 1251 /
              1257 - 1263 + 1274 * 1280)
           'NIL
           (CONS
            (|makeByteWordVec2| 16
                                '(0 0 0 2 1 2 3 1 4 2 2 5 6 3 8 7 0 1 4 15 0 0
                                  1 1 3 10 15 14 9 13 0 9 12 0 0 0 0 0 3 2 11
                                  16))
            (CONS
             '#(|UnivariatePowerSeriesCategory&| |PowerSeriesCategory&|
                |AbelianMonoidRing&| |IntegralDomain&| |Algebra&| |Algebra&|
                |Algebra&| |Module&| NIL |Module&| NIL NIL NIL |Module&|
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL NIL
                |Ring&| NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL
                |Monoid&| |AbelianMonoid&| |AbelianSemiGroup&| |SemiGroup&|
                |SetCategory&| |BasicType&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|UnivariatePowerSeriesCategory| 6 21)
                 (|PowerSeriesCategory| 6 21 222) (|AbelianMonoidRing| 6 21)
                 (|IntegralDomain|) (|Algebra| 110) (|Algebra| $$)
                 (|Algebra| 6) (|Module| 110) (|CommutativeRing|) (|Module| $$)
                 (|EntireRing|) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Module| 6)
                 (|PartialDifferentialRing| 203) (|DifferentialRing|)
                 (|BiModule| 6 6) (|BiModule| 110 110) (|BiModule| $$ $$)
                 (|Ring|) (|LeftModule| 6) (|RightModule| 6) (|LeftModule| 110)
                 (|RightModule| 110) (|RightModule| $$) (|LeftModule| $$)
                 (|Rng|) (|AbelianGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiRng|) (|Monoid|)
                 (|AbelianMonoid|) (|AbelianSemiGroup|) (|SemiGroup|)
                 (|SetCategory|) (|BasicType|) (|CoercibleTo| 139)
                 (|CommutativeStar|) (|noZeroDivisors|) (|unitsKnown|)
                 (|Eltable| $$ $$))
              (|makeByteWordVec2| 223
                                  '(0 10 0 14 1 6 15 0 16 2 10 0 9 0 17 0 18 0
                                    19 1 8 0 18 20 1 10 15 0 23 1 10 0 0 24 1 6
                                    0 21 26 0 6 0 30 2 8 18 0 18 31 1 10 9 0 32
                                    1 18 0 21 33 0 6 35 36 0 6 0 39 1 8 18 0 40
                                    2 18 15 0 0 41 1 10 15 0 42 1 10 15 0 43 1
                                    10 0 0 44 2 21 15 0 0 47 2 18 15 0 0 48 0
                                    21 0 49 2 21 0 0 0 50 1 18 21 0 51 1 10 0
                                    52 53 0 18 0 54 1 18 62 0 63 2 6 0 21 0 69
                                    2 21 0 0 0 70 2 6 0 0 0 72 2 21 0 75 0 76 0
                                    15 0 78 2 21 15 0 0 79 2 21 15 0 0 80 2 18
                                    0 0 0 81 2 6 0 0 0 82 2 6 0 0 0 84 1 6 0 0
                                    85 2 6 0 35 0 88 2 6 0 75 0 90 0 92 0 93 2
                                    18 0 0 0 94 1 10 15 0 95 0 75 0 96 1 6 98 0
                                    99 2 18 0 0 0 102 1 21 15 0 103 2 0 0 0 35
                                    104 2 21 0 21 0 105 0 15 0 106 0 18 0 107 1
                                    18 0 0 108 2 110 0 21 21 111 2 6 0 110 0
                                    112 1 0 0 0 113 1 110 0 21 114 1 110 0 0
                                    115 2 0 0 6 0 116 0 18 0 117 0 35 0 118 1
                                    120 10 119 121 2 0 0 0 6 122 0 21 0 123 1
                                    124 10 0 125 2 120 124 126 21 127 1 110 21
                                    0 137 2 21 98 0 0 138 1 140 139 0 141 2 6
                                    15 0 0 142 1 110 21 0 143 2 6 0 0 35 144 2
                                    6 0 0 110 145 1 6 0 110 146 2 0 0 0 110 147
                                    1 6 0 0 148 1 0 0 0 149 1 6 0 0 150 1 0 0 0
                                    151 1 6 0 0 152 1 6 0 0 153 1 0 0 0 154 1 0
                                    0 0 155 1 6 0 0 156 1 0 0 0 157 1 6 0 0 158
                                    1 0 0 0 159 1 0 0 0 160 1 0 0 0 161 1 110 0
                                    0 162 1 6 0 0 163 1 0 0 0 164 1 6 0 0 165 0
                                    110 0 166 1 0 0 0 167 1 6 0 0 168 1 0 0 0
                                    169 1 6 0 0 170 1 0 0 0 171 1 6 0 0 172 1 0
                                    0 0 173 1 6 0 0 174 1 0 0 0 175 1 6 0 0 176
                                    1 6 0 0 177 1 0 0 0 178 1 0 0 0 179 1 6 0 0
                                    180 1 0 0 0 181 1 0 0 0 182 1 0 0 0 183 1 0
                                    0 0 184 1 6 0 0 185 1 0 0 0 186 1 6 0 0 187
                                    1 0 0 0 188 1 0 0 0 189 1 6 0 0 190 1 0 0 0
                                    191 1 6 0 0 192 1 0 0 0 193 1 6 0 0 194 1 0
                                    0 0 195 0 110 0 196 2 110 15 0 0 197 1 6
                                    139 0 198 1 110 139 0 199 2 139 0 0 0 200 1
                                    139 0 0 201 2 139 0 0 0 202 1 203 139 0 204
                                    2 139 0 0 0 205 1 139 0 0 206 2 110 0 21 0
                                    207 1 18 208 0 209 2 139 0 0 210 211 2 139
                                    0 0 0 212 2 214 139 213 0 215 2 0 15 0 0 1
                                    1 22 15 0 64 1 0 221 0 1 1 0 203 0 1 1 2
                                    219 0 1 1 2 0 0 1 1 2 15 0 1 2 0 0 0 21 55
                                    3 0 0 0 21 21 56 1 0 10 0 61 1 0 0 0 101 2
                                    21 98 0 0 1 5 0 139 10 8 203 6 110 216 1 0
                                    0 10 34 0 22 0 1 1 0 0 0 1 1 9 98 0 1 1 0
                                    15 0 1 2 0 21 0 21 60 1 0 21 0 59 1 9 15 0
                                    1 2 0 0 0 75 77 2 0 0 73 0 74 1 0 15 0 25 3
                                    0 0 0 222 21 1 3 0 0 0 221 223 1 2 0 0 6 21
                                    22 2 0 0 67 0 68 2 0 0 8 10 11 1 0 0 0 1 1
                                    0 6 0 1 1 0 140 0 1 1 1 0 0 113 3 0 98 0 0
                                    15 100 2 0 0 0 0 109 1 0 62 0 1 1 0 10 0 13
                                    1 0 8 0 12 2 0 0 0 21 45 2 2 98 0 0 1 2 18
                                    220 0 6 1 2 16 0 0 0 1 2 0 6 0 21 58 2 8 0
                                    0 217 1 2 8 0 0 203 1 3 8 0 0 217 218 1 3 8
                                    0 0 203 35 1 1 7 0 0 71 2 7 0 0 35 1 1 0 21
                                    0 1 1 0 0 0 46 1 11 0 21 28 1 1 0 110 1 1 3
                                    0 6 27 1 2 0 0 1 1 0 139 0 1 2 0 6 0 21 57
                                    1 5 98 0 1 0 11 35 37 1 0 6 0 1 1 1 0 0 181
                                    1 1 0 0 157 1 1 0 0 178 1 1 0 0 154 1 1 0 0
                                    183 1 1 0 0 160 2 1 0 0 110 147 2 1 0 0 6
                                    122 1 1 0 0 151 1 1 0 0 149 1 1 0 0 184 1 1
                                    0 0 161 1 1 0 0 182 1 1 0 0 159 1 1 0 0 179
                                    1 1 0 0 155 1 1 0 0 189 1 1 0 0 169 1 1 0 0
                                    186 1 1 0 0 164 1 1 0 0 193 1 1 0 0 173 1 1
                                    0 0 195 1 1 0 0 175 1 1 0 0 191 1 1 0 0 171
                                    1 1 0 0 188 1 1 0 0 167 2 2 15 0 0 1 2 19 6
                                    0 21 1 2 9 0 0 35 104 2 0 0 0 75 1 0 22 0
                                    29 0 9 0 38 2 8 0 0 217 1 2 8 0 0 203 1 3 8
                                    0 0 203 35 1 3 8 0 0 217 218 1 1 7 0 0 1 2
                                    7 0 0 35 1 2 0 15 0 0 66 2 17 0 0 6 1 1 20
                                    0 0 86 2 20 0 0 0 65 2 0 0 0 0 83 2 20 0 21
                                    0 87 2 22 0 35 0 89 2 1 0 0 110 1 2 1 0 110
                                    0 1 2 0 0 6 0 116 2 0 0 0 0 97 2 0 0 0 6 1
                                    2 0 0 75 0 91)))))
           '|lookupComplete|)) 
