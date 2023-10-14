
(/VERSIONCHECK 2) 

(DEFUN |PERM;smallerElement?| (|a| |b| $)
  (COND
   ((|HasCategory| (QREFELT $ 6) '(|OrderedSet|))
    (SPADCALL |a| |b| (QREFELT $ 9)))
   ((|HasCategory| (QREFELT $ 6) '(|Finite|))
    (< (SPADCALL |a| (QREFELT $ 11)) (SPADCALL |b| (QREFELT $ 11))))
   ('T 'NIL))) 

(DEFUN |PERM;rotateCycle| (|cyc| $)
  (PROG (#1=#:G156 #2=#:G155 |minpos| |min| #3=#:G159 |i|)
    (RETURN
     (SEQ (LETT |min| (|SPADfirst| |cyc|) . #4=(|PERM;rotateCycle|))
          (LETT |minpos| 1 . #4#)
          (SEQ (LETT |i| 2 . #4#)
               (LETT #3# (SPADCALL |cyc| (QREFELT $ 14)) . #4#) G190
               (COND ((|greater_SI| |i| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((|PERM;smallerElement?| (SPADCALL |cyc| |i| (QREFELT $ 15))
                    |min| $)
                   (SEQ (LETT |min| (SPADCALL |cyc| |i| (QREFELT $ 15)) . #4#)
                        (EXIT (LETT |minpos| |i| . #4#)))))))
               (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND ((EQL |minpos| 1) |cyc|)
                 ('T
                  (SPADCALL
                   (SPADCALL |cyc|
                             (PROG1
                                 (LETT #2# (+ (- (LENGTH |cyc|) |minpos|) 1)
                                       . #4#)
                               (|check_subtype| (>= #2# 0)
                                                '(|NonNegativeInteger|) #2#))
                             (QREFELT $ 18))
                   (SPADCALL |cyc|
                             (PROG1 (LETT #1# (- |minpos| 1) . #4#)
                               (|check_subtype| (>= #1# 0)
                                                '(|NonNegativeInteger|) #1#))
                             (QREFELT $ 19))
                   (QREFELT $ 20))))))))) 

(DEFUN |PERM;coerceCycle| (|lls| $)
  (PROG (|perm| #1=#:G163 |lists|)
    (RETURN
     (SEQ (LETT |perm| (|spadConstant| $ 16) . #2=(|PERM;coerceCycle|))
          (SEQ (LETT |lists| NIL . #2#) (LETT #1# (REVERSE |lls|) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |lists| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |perm|
                       (SPADCALL (SPADCALL |lists| (QREFELT $ 21)) |perm|
                                 (QREFELT $ 22))
                       . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |perm|))))) 

(DEFUN |PERM;smallerCycle?| (|cyca| |cycb| $)
  (PROG (#1=#:G165 #2=#:G168 #3=#:G169 |i| #4=#:G170 |j|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL (LENGTH |cyca|) (LENGTH |cycb|) (QREFELT $ 23))
         (< (LENGTH |cyca|) (LENGTH |cycb|)))
        ('T
         (SEQ
          (SEQ
           (EXIT
            (SEQ (LETT |j| NIL . #5=(|PERM;smallerCycle?|))
                 (LETT #4# |cycb| . #5#) (LETT |i| NIL . #5#)
                 (LETT #3# |cyca| . #5#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#) . #5#) NIL)
                       (ATOM #4#) (PROGN (LETT |j| (CAR #4#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |i| |j| (QREFELT $ 24))
                     (PROGN
                      (LETT #1#
                            (PROGN
                             (LETT #2# (|PERM;smallerElement?| |i| |j| $)
                                   . #5#)
                             (GO #2#))
                            . #5#)
                      (GO #1#))))))
                 (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#) . #5#)) . #5#)
                 (GO G190) G191 (EXIT NIL)))
           #1# (EXIT #1#))
          (EXIT 'NIL)))))
      #2# (EXIT #2#))))) 

(DEFUN |PERM;shorterCycle?| (|cyca| |cycb| $)
  (< (LENGTH |cyca|) (LENGTH |cycb|))) 

(DEFUN |PERM;permord| (|pa| |pb| $)
  (PROG (#1=#:G174 #2=#:G176 #3=#:G177 |i| #4=#:G178 |j|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |j| NIL . #5=(|PERM;permord|))
               (LETT #4# (QCAR |pb|) . #5#) (LETT |i| NIL . #5#)
               (LETT #3# (QCAR |pa|) . #5#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#) . #5#) NIL)
                     (ATOM #4#) (PROGN (LETT |j| (CAR #4#) . #5#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |i| |j| (QREFELT $ 25))
                   (PROGN
                    (LETT #1#
                          (PROGN
                           (LETT #2# (|PERM;smallerCycle?| |i| |j| $) . #5#)
                           (GO #2#))
                          . #5#)
                    (GO #1#))))))
               (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#) . #5#)) . #5#)
               (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT (< (LENGTH (QCAR |pa|)) (LENGTH (QCAR |pb|))))))
      #2# (EXIT #2#))))) 

(DEFUN |PERM;coerceToCycle| (|p| |doSorting?| $)
  (PROG (|cycles| |nextCycle| |im| |nextEltInCycle| |preim| |i|
         |firstEltInCycle|)
    (RETURN
     (SEQ
      (LETT |preim| (SPADCALL |p| 1 (QREFELT $ 26))
            . #1=(|PERM;coerceToCycle|))
      (LETT |im| (SPADCALL |p| 2 (QREFELT $ 26)) . #1#)
      (LETT |cycles| NIL . #1#)
      (SEQ G190 (COND ((NULL (COND ((NULL |preim|) 'NIL) ('T 'T))) (GO G191)))
           (SEQ (LETT |firstEltInCycle| (|SPADfirst| |preim|) . #1#)
                (LETT |nextCycle| (SPADCALL |firstEltInCycle| (QREFELT $ 27))
                      . #1#)
                (LETT |preim| (CDR |preim|) . #1#)
                (LETT |nextEltInCycle| (|SPADfirst| |im|) . #1#)
                (LETT |im| (CDR |im|) . #1#)
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |nextEltInCycle| |firstEltInCycle|
                                  (QREFELT $ 24)))
                       (GO G191)))
                     (SEQ
                      (LETT |nextCycle| (CONS |nextEltInCycle| |nextCycle|)
                            . #1#)
                      (LETT |i|
                            (SPADCALL |nextEltInCycle| |preim| (QREFELT $ 28))
                            . #1#)
                      (LETT |preim| (SPADCALL |preim| |i| (QREFELT $ 29))
                            . #1#)
                      (LETT |nextEltInCycle| (SPADCALL |im| |i| (QREFELT $ 15))
                            . #1#)
                      (EXIT
                       (LETT |im| (SPADCALL |im| |i| (QREFELT $ 29)) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (LETT |nextCycle| (REVERSE |nextCycle|) . #1#)
                (EXIT
                 (COND
                  ((NULL (NULL (CDR |nextCycle|)))
                   (SEQ
                    (COND
                     (|doSorting?|
                      (COND
                       ((OR (|HasCategory| (QREFELT $ 6) '(|OrderedSet|))
                            (|HasCategory| (QREFELT $ 6) '(|Finite|)))
                        (LETT |nextCycle| (|PERM;rotateCycle| |nextCycle| $)
                              . #1#)))))
                    (EXIT
                     (LETT |cycles| (CONS |nextCycle| |cycles|) . #1#)))))))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT
       (COND
        (|doSorting?|
         (COND
          ((OR (|HasCategory| (QREFELT $ 6) '(|OrderedSet|))
               (|HasCategory| (QREFELT $ 6) '(|Finite|)))
           (SPADCALL (CONS (|function| |PERM;smallerCycle?|) $) |cycles|
                     (QREFELT $ 32)))
          ('T
           (SPADCALL (CONS (|function| |PERM;shorterCycle?|) $) |cycles|
                     (QREFELT $ 32)))))
        ('T |cycles|))))))) 

(DEFUN |PERM;duplicates?| (|ls| $)
  (PROG (|x| #1=#:G196)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |x| (SPADCALL |ls| (QREFELT $ 33)) . #2=(|PERM;duplicates?|))
            (SEQ G190
                 (COND ((NULL (COND ((NULL |x|) 'NIL) ('T 'T))) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL (|SPADfirst| |x|) (CDR |x|) (QREFELT $ 34))
                     (PROGN (LETT #1# 'T . #2#) (GO #1#)))
                    ('T (LETT |x| (CDR |x|) . #2#)))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT 'NIL)))
      #1# (EXIT #1#))))) 

(DEFUN |PERM;listRepresentation;$R;9| (|p| $)
  (PROG (|s|)
    (RETURN
     (LETT |s|
           (CONS (SPADCALL |p| 1 (QREFELT $ 26))
                 (SPADCALL |p| 2 (QREFELT $ 26)))
           |PERM;listRepresentation;$R;9|)))) 

(DEFUN |PERM;coercePreimagesImages;L$;10| (|preImageAndImage| $)
  (PROG (|image| |preImage| #1=#:G205 |i| #2=#:G206 |pi|)
    (RETURN
     (SEQ (LETT |preImage| NIL . #3=(|PERM;coercePreimagesImages;L$;10|))
          (LETT |image| NIL . #3#)
          (SEQ (LETT |pi| NIL . #3#)
               (LETT #2# (SPADCALL |preImageAndImage| 2 (QREFELT $ 37)) . #3#)
               (LETT |i| NIL . #3#)
               (LETT #1# (SPADCALL |preImageAndImage| 1 (QREFELT $ 37)) . #3#)
               G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #3#) NIL)
                     (ATOM #2#) (PROGN (LETT |pi| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |i| |pi| (QREFELT $ 24))
                   (SEQ (LETT |preImage| (CONS |i| |preImage|) . #3#)
                        (EXIT (LETT |image| (CONS |pi| |image|) . #3#)))))))
               (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#)) . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR |preImage| |image|)))))) 

(DEFUN |PERM;movedPoints;$S;11| (|p| $)
  (SPADCALL (SPADCALL |p| 1 (QREFELT $ 26)) (QREFELT $ 40))) 

(DEFUN |PERM;degree;$Nni;12| (|p| $)
  (SPADCALL (SPADCALL |p| (QREFELT $ 41)) (QREFELT $ 42))) 

(DEFUN |PERM;=;2$B;13| (|p| |q| $)
  (PROG (#1=#:G211 #2=#:G216 |pos| #3=#:G217 |i| |preimq| |preimp|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL
          (LENGTH
           (LETT |preimp| (SPADCALL |p| 1 (QREFELT $ 26))
                 . #4=(|PERM;=;2$B;13|)))
          (LENGTH (LETT |preimq| (SPADCALL |q| 1 (QREFELT $ 26)) . #4#))
          (QREFELT $ 23))
         'NIL)
        ('T
         (SEQ
          (SEQ (LETT |i| 1 . #4#)
               (LETT #3# (SPADCALL |preimp| (QREFELT $ 14)) . #4#) G190
               (COND ((|greater_SI| |i| #3#) (GO G191)))
               (SEQ
                (LETT |pos|
                      (SPADCALL (SPADCALL |preimp| |i| (QREFELT $ 15)) |preimq|
                                (QREFELT $ 28))
                      . #4#)
                (EXIT
                 (COND ((EQL |pos| 0) (PROGN (LETT #2# 'NIL . #4#) (GO #2#)))
                       ('T
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL
                             (SPADCALL (SPADCALL |p| 2 (QREFELT $ 26)) |i|
                                       (QREFELT $ 15))
                             (SPADCALL (SPADCALL |q| 2 (QREFELT $ 26)) |pos|
                                       (QREFELT $ 15))
                             (QREFELT $ 24))
                            (PROGN
                             (LETT #1# (PROGN (LETT #2# 'NIL . #4#) (GO #2#))
                                   . #4#)
                             (GO #1#)))))
                         #1# (EXIT #1#))))))
               (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT 'T)))))
      #2# (EXIT #2#))))) 

(DEFUN |PERM;orbit;$SS;14| (|p| |el| $)
  (PROG (|el2| |out|)
    (RETURN
     (SEQ
      (LETT |out| (SPADCALL (SPADCALL |el| (QREFELT $ 27)) (QREFELT $ 45))
            . #1=(|PERM;orbit;$SS;14|))
      (LETT |el2| (SPADCALL |p| |el| (QREFELT $ 46)) . #1#)
      (SEQ G190 (COND ((NULL (SPADCALL |el2| |el| (QREFELT $ 24))) (GO G191)))
           (SEQ (SPADCALL |el2| |out| (QREFELT $ 47))
                (EXIT (LETT |el2| (SPADCALL |p| |el2| (QREFELT $ 46)) . #1#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT |out|))))) 

(DEFUN |PERM;cyclePartition;$P;15| (|p| $)
  (PROG (#1=#:G225 |c| #2=#:G224)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|PERM;cyclePartition;$P;15|))
        (SEQ (LETT |c| NIL . #3#)
             (LETT #1# (|PERM;coerceToCycle| |p| 'NIL $) . #3#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ (EXIT (LETT #2# (CONS (LENGTH |c|) #2#) . #3#)))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       (QREFELT $ 51)))))) 

(DEFUN |PERM;order;$Nni;16| (|p| $)
  (PROG (#1=#:G226 |ord|)
    (RETURN
     (SEQ
      (LETT |ord|
            (SPADCALL
             (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 52)) (QREFELT $ 53))
                       (QREFELT $ 54))
             (QREFELT $ 56))
            . #2=(|PERM;order;$Nni;16|))
      (EXIT
       (PROG1 (LETT #1# |ord| . #2#)
         (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))))))) 

(DEFUN |PERM;sign;$I;17| (|p| $)
  (COND ((SPADCALL |p| (QREFELT $ 58)) 1) ('T -1))) 

(DEFUN |PERM;even?;$B;18| (|p| $)
  (SPADCALL
   (- (LENGTH (SPADCALL |p| 1 (QREFELT $ 26))) (SPADCALL |p| (QREFELT $ 60)))
   (QREFELT $ 61))) 

(DEFUN |PERM;odd?;$B;19| (|p| $)
  (ODDP
   (- (LENGTH (SPADCALL |p| 1 (QREFELT $ 26))) (SPADCALL |p| (QREFELT $ 60))))) 

(DEFUN |PERM;<;2$B;20| (|pa| |pb| $)
  (PROG (#1=#:G234 #2=#:G236 #3=#:G237 |i| #4=#:G238 |j| |pbcyc| |pacyc|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |pacyc| (|PERM;coerceToCycle| |pa| 'T $) . #5=(|PERM;<;2$B;20|))
        (LETT |pbcyc| (|PERM;coerceToCycle| |pb| 'T $) . #5#)
        (SEQ
         (EXIT
          (SEQ (LETT |j| NIL . #5#) (LETT #4# |pbcyc| . #5#)
               (LETT |i| NIL . #5#) (LETT #3# |pacyc| . #5#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#) . #5#) NIL)
                     (ATOM #4#) (PROGN (LETT |j| (CAR #4#) . #5#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |i| |j| (QREFELT $ 25))
                   (PROGN
                    (LETT #1#
                          (PROGN
                           (LETT #2# (|PERM;smallerCycle?| |i| |j| $) . #5#)
                           (GO #2#))
                          . #5#)
                    (GO #1#))))))
               (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#) . #5#)) . #5#)
               (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT
         (< (SPADCALL |pacyc| (QREFELT $ 63))
            (SPADCALL |pbcyc| (QREFELT $ 63))))))
      #2# (EXIT #2#))))) 

(DEFUN |PERM;coerce;L$;21| (|lls| $) (|PERM;coerceCycle| |lls| $)) 

(DEFUN |PERM;coerce;L$;22| (|ls| $) (SPADCALL |ls| (QREFELT $ 21))) 

(DEFUN |PERM;sort;2L;23| (|inList| $)
  (PROG (|outList| #1=#:G250 |rec| |ownList| #2=#:G249 |sigma|)
    (RETURN
     (SEQ
      (COND
       ((NULL (|HasCategory| (QREFELT $ 6) '(|OrderedSet|)))
        (COND
         ((NULL (|HasCategory| (QREFELT $ 6) '(|Finite|))) (EXIT |inList|)))))
      (LETT |ownList| NIL . #3=(|PERM;sort;2L;23|))
      (SEQ (LETT |sigma| NIL . #3#) (LETT #2# |inList| . #3#) G190
           (COND
            ((OR (ATOM #2#) (PROGN (LETT |sigma| (CAR #2#) . #3#) NIL))
             (GO G191)))
           (SEQ
            (EXIT
             (LETT |ownList|
                   (SPADCALL (CONS (|PERM;coerceToCycle| |sigma| 'T $) |sigma|)
                             |ownList| (QREFELT $ 69))
                   . #3#)))
           (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
      (LETT |ownList|
            (SPADCALL (CONS (|function| |PERM;permord|) $) |ownList|
                      (QREFELT $ 71))
            . #3#)
      (LETT |outList| (SPADCALL (QREFELT $ 73)) . #3#)
      (SEQ (LETT |rec| NIL . #3#) (LETT #1# |ownList| . #3#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#) . #3#) NIL))
             (GO G191)))
           (SEQ
            (EXIT
             (LETT |outList| (SPADCALL (QCDR |rec|) |outList| (QREFELT $ 74))
                   . #3#)))
           (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |outList| (QREFELT $ 75))))))) 

(DEFUN |PERM;coerce;$Of;24| (|p| $)
  (PROG (|outfmL| |outcycL| #1=#:G258 |elt| #2=#:G257 |cycle| |cycles|)
    (RETURN
     (SEQ
      (LETT |cycles| (|PERM;coerceToCycle| |p| 'T $)
            . #3=(|PERM;coerce;$Of;24|))
      (LETT |outfmL| NIL . #3#)
      (SEQ (LETT |cycle| NIL . #3#) (LETT #2# |cycles| . #3#) G190
           (COND
            ((OR (ATOM #2#) (PROGN (LETT |cycle| (CAR #2#) . #3#) NIL))
             (GO G191)))
           (SEQ (LETT |outcycL| NIL . #3#)
                (SEQ (LETT |elt| NIL . #3#) (LETT #1# |cycle| . #3#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |elt| (CAR #1#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |outcycL|
                             (CONS (SPADCALL |elt| (QREFELT $ 78)) |outcycL|)
                             . #3#)))
                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (LETT |outfmL|
                       (CONS
                        (SPADCALL (SPADCALL (REVERSE |outcycL|) (QREFELT $ 79))
                                  (QREFELT $ 80))
                        |outfmL|)
                       . #3#)))
           (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (COND ((NULL |outfmL|) (SPADCALL 1 (QREFELT $ 81)))
             ((NULL (CDR |outfmL|)) (|SPADfirst| |outfmL|))
             ('T (SPADCALL (REVERSE |outfmL|) (QREFELT $ 82))))))))) 

(DEFUN |PERM;cycles;L$;25| (|vs| $) (|PERM;coerceCycle| |vs| $)) 

(DEFUN |PERM;cycle;L$;26| (|ls| $)
  (COND ((< (LENGTH |ls|) 2) (|spadConstant| $ 16))
        ((|PERM;duplicates?| |ls| $)
         (|error| "cycle: the input contains duplicates"))
        ('T
         (VECTOR |ls|
                 (APPEND (CDR |ls|)
                         (SPADCALL (|SPADfirst| |ls|) (QREFELT $ 27))))))) 

(DEFUN |PERM;coerceListOfPairs;L$;27| (|loP| $)
  (PROG (|im| |preim| #1=#:G271 |pair|)
    (RETURN
     (SEQ (LETT |preim| NIL . #2=(|PERM;coerceListOfPairs;L$;27|))
          (LETT |im| NIL . #2#)
          (SEQ (LETT |pair| NIL . #2#) (LETT #1# |loP| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |pair| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (|SPADfirst| |pair|)
                             (SPADCALL |pair| (QREFELT $ 85)) (QREFELT $ 24))
                   (SEQ
                    (LETT |preim| (CONS (|SPADfirst| |pair|) |preim|) . #2#)
                    (EXIT
                     (LETT |im| (CONS (SPADCALL |pair| (QREFELT $ 85)) |im|)
                           . #2#)))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (COND
           ((OR (|PERM;duplicates?| |preim| $)
                (OR (|PERM;duplicates?| |im| $)
                    (SPADCALL (SPADCALL |preim| (QREFELT $ 45))
                              (SPADCALL |im| (QREFELT $ 45)) (QREFELT $ 86))))
            (EXIT
             (|error|
              "coerceListOfPairs: the input cannot be interpreted as a permutation"))))
          (EXIT (VECTOR |preim| |im|)))))) 

(DEFUN |PERM;*;3$;28| (|q| |p| $)
  (PROG (|imOfq| |preimOfq| |imOfqp| |preimOfqp| |el| |j| #1=#:G282 |i| |imOfp|
         |preimOfp|)
    (RETURN
     (SEQ
      (LETT |preimOfp|
            (SPADCALL (SPADCALL |p| 1 (QREFELT $ 26)) (QREFELT $ 89))
            . #2=(|PERM;*;3$;28|))
      (LETT |imOfp| (SPADCALL (SPADCALL |p| 2 (QREFELT $ 26)) (QREFELT $ 89))
            . #2#)
      (LETT |preimOfq| (SPADCALL |q| 1 (QREFELT $ 26)) . #2#)
      (LETT |imOfq| (SPADCALL |q| 2 (QREFELT $ 26)) . #2#)
      (LETT |preimOfqp| NIL . #2#) (LETT |imOfqp| NIL . #2#)
      (SEQ (LETT |i| 1 . #2#) (LETT #1# (QVSIZE |preimOfp|) . #2#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ
            (LETT |j|
                  (SPADCALL (SPADCALL |imOfp| |i| (QREFELT $ 90)) |preimOfq|
                            (QREFELT $ 28))
                  . #2#)
            (EXIT
             (COND
              ((EQL |j| 0)
               (SEQ
                (LETT |preimOfqp|
                      (CONS (SPADCALL |preimOfp| |i| (QREFELT $ 90))
                            |preimOfqp|)
                      . #2#)
                (EXIT
                 (LETT |imOfqp|
                       (CONS (SPADCALL |imOfp| |i| (QREFELT $ 90)) |imOfqp|)
                       . #2#))))
              ('T
               (SEQ (LETT |el| (SPADCALL |imOfq| |j| (QREFELT $ 15)) . #2#)
                    (COND
                     ((SPADCALL |el| (SPADCALL |preimOfp| |i| (QREFELT $ 90))
                                (QREFELT $ 24))
                      (SEQ
                       (LETT |preimOfqp|
                             (CONS (SPADCALL |preimOfp| |i| (QREFELT $ 90))
                                   |preimOfqp|)
                             . #2#)
                       (EXIT (LETT |imOfqp| (CONS |el| |imOfqp|) . #2#)))))
                    (LETT |preimOfq| (SPADCALL |preimOfq| |j| (QREFELT $ 29))
                          . #2#)
                    (EXIT
                     (LETT |imOfq| (SPADCALL |imOfq| |j| (QREFELT $ 29))
                           . #2#)))))))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (VECTOR (APPEND |preimOfqp| |preimOfq|) (APPEND |imOfqp| |imOfq|))))))) 

(PUT '|PERM;One;$;29| '|SPADreplace| '(XLAM NIL (MAKEARR1 2 NIL))) 

(DEFUN |PERM;One;$;29| ($) (MAKEARR1 2 NIL)) 

(DEFUN |PERM;inv;2$;30| (|p| $)
  (VECTOR (SPADCALL |p| 2 (QREFELT $ 26)) (SPADCALL |p| 1 (QREFELT $ 26)))) 

(DEFUN |PERM;eval;$2S;31| (|p| |el| $)
  (PROG (|pos|)
    (RETURN
     (SEQ
      (LETT |pos|
            (SPADCALL |el| (SPADCALL |p| 1 (QREFELT $ 26)) (QREFELT $ 28))
            |PERM;eval;$2S;31|)
      (EXIT
       (COND ((EQL |pos| 0) |el|)
             ('T
              (SPADCALL (SPADCALL |p| 2 (QREFELT $ 26)) |pos|
                        (QREFELT $ 15))))))))) 

(DEFUN |PERM;elt;$2S;32| (|p| |el| $) (SPADCALL |p| |el| (QREFELT $ 46))) 

(DEFUN |PERM;numberOfCycles;$Nni;33| (|p| $)
  (LENGTH (|PERM;coerceToCycle| |p| 'NIL $))) 

(DEFUN |PERM;coerceImages;L$;34| (|image| $)
  (PROG (|preImage| #1=#:G293 |i| #2=#:G292)
    (RETURN
     (SEQ
      (LETT |preImage|
            (PROGN
             (LETT #2# NIL . #3=(|PERM;coerceImages;L$;34|))
             (SEQ (LETT |i| 1 . #3#)
                  (LETT #1# (SPADCALL |image| (QREFELT $ 14)) . #3#) G190
                  (COND ((|greater_SI| |i| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2# (CONS (SPADCALL |i| (QREFELT $ 93)) #2#) . #3#)))
                  (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT (SPADCALL (LIST |preImage| |image|) (QREFELT $ 38))))))) 

(DEFUN |PERM;coerceImages;L$;35| (|image| $)
  (PROG (|preImage| #1=#:G295 #2=#:G300 |i| #3=#:G299)
    (RETURN
     (SEQ
      (LETT |preImage|
            (PROGN
             (LETT #3# NIL . #4=(|PERM;coerceImages;L$;35|))
             (SEQ (LETT |i| 1 . #4#)
                  (LETT #2# (SPADCALL |image| (QREFELT $ 14)) . #4#) G190
                  (COND ((|greater_SI| |i| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #3#
                          (CONS
                           (SPADCALL
                            (PROG1 (LETT #1# |i| . #4#)
                              (|check_subtype| (> #1# 0) '(|PositiveInteger|)
                                               #1#))
                            (QREFELT $ 95))
                           #3#)
                          . #4#)))
                  (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                  (EXIT (NREVERSE #3#))))
            . #4#)
      (EXIT (SPADCALL (LIST |preImage| |image|) (QREFELT $ 38))))))) 

(DEFUN |PERM;fixedPoints;$S;36| (|p| $)
  (SPADCALL (SPADCALL |p| (QREFELT $ 41)) (QREFELT $ 96))) 

(DEFUN |PERM;cyclePartition;$P;37| (|p| $)
  (PROG (|pt| #1=#:G306 |c| #2=#:G305)
    (RETURN
     (SEQ
      (LETT |pt|
            (SPADCALL
             (PROGN
              (LETT #2# NIL . #3=(|PERM;cyclePartition;$P;37|))
              (SEQ (LETT |c| NIL . #3#)
                   (LETT #1# (|PERM;coerceToCycle| |p| 'NIL $) . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (LETT #2# (CONS (LENGTH |c|) #2#) . #3#)))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                   (EXIT (NREVERSE #2#))))
             (QREFELT $ 51))
            . #3#)
      (EXIT
       (SPADCALL |pt|
                 (SPADCALL
                  (SPADCALL
                   (LIST
                    (SPADCALL (SPADCALL |p| (QREFELT $ 97)) (QREFELT $ 42)))
                   (QREFELT $ 51))
                  (QREFELT $ 98))
                 (QREFELT $ 99))))))) 

(DECLAIM (NOTINLINE |Permutation;|)) 

(DEFUN |Permutation| (#1=#:G311)
  (PROG ()
    (RETURN
     (PROG (#2=#:G312)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|Permutation|)
                                           '|domainEqualList|)
                . #3=(|Permutation|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|Permutation;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|Permutation|))))))))))) 

(DEFUN |Permutation;| (|#1|)
  (PROG (|pv$| #1=#:G310 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #2=(|Permutation|))
      (LETT |dv$| (LIST '|Permutation| DV$1) . #2#)
      (LETT $ (GETREFV 104) . #2#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|Finite|))
                                                . #2#)
                                          (OR #1#
                                              (|HasCategory| |#1|
                                                             '(|OrderedSet|)))))
                      . #2#))
      (|haddProp| |$ConstructorCache| '|Permutation| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 (|Vector| (|List| |#1|)))
      (COND
       ((|HasCategory| |#1| '(|IntegerNumberSystem|))
        (QSETREFV $ 94
                  (CONS (|dispatchFunction| |PERM;coerceImages;L$;34|) $))))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 94
                   (CONS (|dispatchFunction| |PERM;coerceImages;L$;35|) $))
         (QSETREFV $ 97 (CONS (|dispatchFunction| |PERM;fixedPoints;$S;36|) $))
         (QSETREFV $ 52
                   (CONS (|dispatchFunction| |PERM;cyclePartition;$P;37|)
                         $)))))
      $)))) 

(MAKEPROP '|Permutation| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Boolean|) (0 . <)
              (|PositiveInteger|) (6 . |lookup|) (|Integer|) (|List| 6)
              (11 . |maxIndex|) (16 . |elt|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |PERM;One;$;29|) $))
              (|NonNegativeInteger|) (22 . |last|) (28 . |first|)
              (34 . |concat|) |PERM;cycle;L$;26| |PERM;*;3$;28| (40 . ~=)
              (46 . ~=) (52 . ~=) (58 . |elt|) (64 . |list|) (69 . |position|)
              (75 . |delete|) (|Mapping| 8 13 13) (|List| 13) (81 . |sort|)
              (87 . |copy|) (92 . |member?|)
              (|Record| (|:| |preimage| 13) (|:| |image| 13))
              |PERM;listRepresentation;$R;9| (98 . |elt|)
              |PERM;coercePreimagesImages;L$;10| (|Set| 6) (104 . |construct|)
              |PERM;movedPoints;$S;11| (109 . |#|) |PERM;degree;$Nni;12|
              |PERM;=;2$B;13| (114 . |brace|) |PERM;eval;$2S;31|
              (119 . |insert!|) |PERM;orbit;$SS;14| (|List| 12) (|Partition|)
              (125 . |partition|) |PERM;cyclePartition;$P;15| (130 . |convert|)
              (135 . |removeDuplicates|) (|List| $) (140 . |lcm|)
              |PERM;order;$Nni;16| |PERM;even?;$B;18| |PERM;sign;$I;17|
              |PERM;numberOfCycles;$Nni;33| (145 . |even?|) |PERM;odd?;$B;19|
              (150 . |maxIndex|) |PERM;<;2$B;20| |PERM;coerce;L$;21|
              |PERM;coerce;L$;22| (|Record| (|:| |cycl| 31) (|:| |permut| $$))
              (|List| 67) (155 . |cons|) (|Mapping| 8 67 67) (161 . |sort|)
              (|List| $$) (167 . |nil|) (171 . |cons|) (177 . |reverse|)
              |PERM;sort;2L;23| (|OutputForm|) (182 . |coerce|)
              (187 . |blankSeparate|) (192 . |paren|) (197 . |outputForm|)
              (202 . |hconcat|) |PERM;coerce;$Of;24| |PERM;cycles;L$;25|
              (207 . |second|) (212 . ~=) |PERM;coerceListOfPairs;L$;27|
              (|Vector| 6) (218 . |construct|) (223 . |elt|) |PERM;inv;2$;30|
              |PERM;elt;$2S;32| (229 . |coerce|) (234 . |coerceImages|)
              (239 . |index|) (244 . |complement|) (249 . |fixedPoints|)
              (254 . |conjugate|) (259 . +) (|Union| $ '"failed") (|String|)
              (|SingleInteger|) (|HashState|))
           '#(~= 265 |sort| 271 |smaller?| 276 |sign| 282 |sample| 287 |recip|
              291 |order| 296 |orbit| 301 |one?| 307 |odd?| 312
              |numberOfCycles| 317 |movedPoints| 322 |min| 327 |max| 333
              |listRepresentation| 339 |latex| 344 |inv| 349 |hashUpdate!| 354
              |hash| 360 |fixedPoints| 365 |even?| 370 |eval| 375 |elt| 381
              |degree| 387 |cycles| 392 |cyclePartition| 397 |cycle| 402
              |conjugate| 407 |commutator| 413 |coercePreimagesImages| 419
              |coerceListOfPairs| 424 |coerceImages| 429 |coerce| 434 ^ 449
              |One| 467 >= 471 > 477 = 483 <= 489 < 495 / 501 * 507)
           'NIL
           (CONS (|makeByteWordVec2| 2 '(0 0 0 2 0 2 0 0 0 0 2))
                 (CONS
                  '#(NIL |Group&| |Monoid&| |OrderedSet&| |SemiGroup&| NIL
                     |SetCategory&| |BasicType&| NIL NIL |PartialOrder&|)
                  (CONS
                   '#((|PermutationCategory| 6) (|Group|) (|Monoid|)
                      (|OrderedSet|) (|SemiGroup|) (|Comparable|)
                      (|SetCategory|) (|BasicType|) (|unitsKnown|)
                      (|CoercibleTo| 77) (|PartialOrder|))
                   (|makeByteWordVec2| 103
                                       '(2 6 8 0 0 9 1 6 10 0 11 1 13 12 0 14 2
                                         13 6 0 12 15 2 13 0 0 17 18 2 13 0 0
                                         17 19 2 13 0 0 0 20 2 12 8 0 0 23 2 6
                                         8 0 0 24 2 13 8 0 0 25 2 7 13 0 12 26
                                         1 13 0 6 27 2 13 12 6 0 28 2 13 0 0 12
                                         29 2 31 0 30 0 32 1 13 0 0 33 2 13 8 6
                                         0 34 2 31 13 0 12 37 1 39 0 13 40 1 39
                                         17 0 42 1 39 0 13 45 2 39 0 6 0 47 1
                                         50 0 49 51 1 50 49 0 53 1 49 0 0 54 1
                                         12 0 55 56 1 12 8 0 61 1 31 12 0 63 2
                                         68 0 67 0 69 2 68 0 70 0 71 0 72 0 73
                                         2 72 0 2 0 74 1 72 0 0 75 1 6 77 0 78
                                         1 77 0 55 79 1 77 0 0 80 1 77 0 12 81
                                         1 77 0 55 82 1 13 6 0 85 2 39 8 0 0 86
                                         1 88 0 13 89 2 88 6 0 12 90 1 6 0 12
                                         93 1 0 0 13 94 1 6 0 10 95 1 39 0 0 96
                                         1 0 39 0 97 1 50 0 0 98 2 50 0 0 0 99
                                         2 0 8 0 0 1 1 0 55 55 76 2 2 8 0 0 1 1
                                         0 12 0 59 0 0 0 1 1 0 100 0 1 1 0 17 0
                                         57 2 0 39 0 6 48 1 0 8 0 1 1 0 8 0 62
                                         1 0 17 0 60 1 0 39 0 41 2 2 0 0 0 1 2
                                         2 0 0 0 1 1 0 35 0 36 1 0 101 0 1 1 0
                                         0 0 91 2 0 103 103 0 1 1 0 102 0 1 1 1
                                         39 0 97 1 0 8 0 58 2 0 6 0 6 46 2 0 6
                                         0 6 92 1 0 17 0 43 1 0 0 31 84 1 0 50
                                         0 52 1 0 0 13 21 2 0 0 0 0 1 2 0 0 0 0
                                         1 1 0 0 31 38 1 0 0 31 87 1 0 0 13 94
                                         1 0 0 31 65 1 0 0 13 66 1 0 77 0 83 2
                                         0 0 0 12 1 2 0 0 0 17 1 2 0 0 0 10 1 0
                                         0 0 16 2 2 8 0 0 1 2 2 8 0 0 1 2 0 8 0
                                         0 44 2 2 8 0 0 1 2 0 8 0 0 64 2 0 0 0
                                         0 1 2 0 0 0 0 22)))))
           '|lookupComplete|)) 
