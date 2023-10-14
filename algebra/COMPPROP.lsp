
(PUT '|COMPPROP;closed?;$B;1| '|SPADreplace| 'QCAR) 

(SDEFUN |COMPPROP;closed?;$B;1| ((|p| $) ($ |Boolean|)) (QCAR |p|)) 

(PUT '|COMPPROP;solid?;$B;2| '|SPADreplace| 'QCDR) 

(SDEFUN |COMPPROP;solid?;$B;2| ((|p| $) ($ |Boolean|)) (QCDR |p|)) 

(SDEFUN |COMPPROP;close;$2B;3| ((|p| $) (|b| |Boolean|) ($ |Boolean|))
        (PROGN (RPLACA |p| |b|) (QCAR |p|))) 

(SDEFUN |COMPPROP;solid;$2B;4| ((|p| $) (|b| |Boolean|) ($ |Boolean|))
        (PROGN (RPLACD |p| |b|) (QCDR |p|))) 

(SDEFUN |COMPPROP;new;$;5| (($ $)) (CONS 'NIL 'NIL)) 

(SDEFUN |COMPPROP;copy;2$;6| ((|p| $) ($ $))
        (SPROG ((|annuderOne| ($)))
               (SEQ
                (LETT |annuderOne| (SPADCALL (QREFELT $ 12))
                      |COMPPROP;copy;2$;6|)
                (SPADCALL |annuderOne| (SPADCALL |p| (QREFELT $ 8))
                          (QREFELT $ 10))
                (SPADCALL |annuderOne| (SPADCALL |p| (QREFELT $ 9))
                          (QREFELT $ 11))
                (EXIT |annuderOne|)))) 

(SDEFUN |COMPPROP;coerce;$Of;7| ((|p| $) ($ |OutputForm|))
        (SPADCALL
         (LIST "Component is "
               (COND ((SPADCALL |p| (QREFELT $ 8)) "") (#1='T "not "))
               "closed, " (COND ((SPADCALL |p| (QREFELT $ 9)) "") (#1# "not "))
               "solid")
         (QREFELT $ 16))) 

(DECLAIM (NOTINLINE |SubSpaceComponentProperty;|)) 

(DEFUN |SubSpaceComponentProperty| ()
  (SPROG NIL
         (PROG (#1=#:G119)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|SubSpaceComponentProperty|)
                    . #2=(|SubSpaceComponentProperty|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|SubSpaceComponentProperty|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|SubSpaceComponentProperty;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|SubSpaceComponentProperty|)))))))))) 

(DEFUN |SubSpaceComponentProperty;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|SubSpaceComponentProperty|)
                . #1=(|SubSpaceComponentProperty|))
          (LETT $ (GETREFV 21) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|SubSpaceComponentProperty| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |closed| (|Boolean|))
                              (|:| |solid| (|Boolean|))))
          $))) 

(MAKEPROP '|SubSpaceComponentProperty| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Boolean|)
              |COMPPROP;closed?;$B;1| |COMPPROP;solid?;$B;2|
              |COMPPROP;close;$2B;3| |COMPPROP;solid;$2B;4| |COMPPROP;new;$;5|
              |COMPPROP;copy;2$;6| (|List| $) (|OutputForm|) (0 . |hconcat|)
              |COMPPROP;coerce;$Of;7| (|String|) (|SingleInteger|)
              (|HashState|))
           '#(~= 5 |solid?| 11 |solid| 16 |new| 22 |latex| 26 |hashUpdate!| 31
              |hash| 37 |copy| 42 |coerce| 47 |closed?| 52 |close| 57 = 63)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 15))
                        (|makeByteWordVec2| 20
                                            '(1 15 0 14 16 2 0 7 0 0 1 1 0 7 0
                                              9 2 0 7 0 7 11 0 0 0 12 1 0 18 0
                                              1 2 0 20 20 0 1 1 0 19 0 1 1 0 0
                                              0 13 1 0 15 0 17 1 0 7 0 8 2 0 7
                                              0 7 10 2 0 7 0 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|SubSpaceComponentProperty| 'NILADIC T) 
