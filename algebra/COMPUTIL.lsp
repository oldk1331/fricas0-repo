
(/VERSIONCHECK 2) 

(DEFUN |COMPUTIL;Ski2Lambda| (|s| $)
  (PROG (#1=#:G175 |s112| |s12| |s2| |c112| |c111| |subsubnodes2| |c12| |c11|
         |subsubnodes| |s1| |c2| |c1| |subnodes| |strVar3| |strVar2| |strVar1|
         |strVar|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL |s| (QREFELT $ 10))
          (SEQ
           (COND
            ((SPADCALL |s| (QREFELT $ 11))
             (SEQ
              (LETT |strVar| (STRCONC "v" (STRINGIMAGE (QREFELT $ 7)))
                    . #2=(|COMPUTIL;Ski2Lambda|))
              (|sayBrightly|
               (SPADCALL
                (LIST "util coerce rule SL1: Ski[I] = \\" |strVar| ".0")
                (QREFELT $ 14)))
              (SETELT $ 7 (+ (QREFELT $ 7) 1))
              (EXIT
               (PROGN
                (LETT #1#
                      (SPADCALL
                       (SPADCALL (LIST "\\" |strVar| ".0") (QREFELT $ 14))
                       (QREFELT $ 16))
                      . #2#)
                (GO #1#))))))
           (COND
            ((SPADCALL |s| (QREFELT $ 17))
             (SEQ
              (LETT |strVar1| (STRCONC "v" (STRINGIMAGE (QREFELT $ 7))) . #2#)
              (LETT |strVar2| (STRCONC "v" (STRINGIMAGE (+ (QREFELT $ 7) 1)))
                    . #2#)
              (|sayBrightly|
               (SPADCALL
                (LIST "util coerce rule SL2: Ski[K] = \\" |strVar1| ".\\"
                      |strVar2| ".1")
                (QREFELT $ 14)))
              (SETELT $ 7 (+ (QREFELT $ 7) 2))
              (EXIT
               (PROGN
                (LETT #1#
                      (SPADCALL
                       (SPADCALL (LIST "\\" |strVar1| ".\\" |strVar2| ".1")
                                 (QREFELT $ 14))
                       (QREFELT $ 16))
                      . #2#)
                (GO #1#))))))
           (COND
            ((SPADCALL |s| (QREFELT $ 18))
             (SEQ
              (LETT |strVar1| (STRCONC "v" (STRINGIMAGE (QREFELT $ 7))) . #2#)
              (LETT |strVar2| (STRCONC "v" (STRINGIMAGE (+ (QREFELT $ 7) 1)))
                    . #2#)
              (LETT |strVar3| (STRCONC "v" (STRINGIMAGE (+ (QREFELT $ 7) 2)))
                    . #2#)
              (|sayBrightly|
               (SPADCALL
                (LIST "util coerce rule SL3: Ski[S] = \\" |strVar1| ".\\"
                      |strVar2| ".\\" |strVar3| ".(2 0 (1 0))")
                (QREFELT $ 14)))
              (SETELT $ 7 (+ (QREFELT $ 7) 3))
              (EXIT
               (PROGN
                (LETT #1#
                      (SPADCALL
                       (SPADCALL
                        (LIST "\\" |strVar1| ".\\" |strVar2| ".\\" |strVar3|
                              ".(2 0 (1 0))")
                        (QREFELT $ 14))
                       (QREFELT $ 16))
                      . #2#)
                (GO #1#))))))
           (|sayBrightly|
            (SPADCALL
             (LIST "util coerce pass unbound variable "
                   (SPADCALL (SPADCALL |s| (QREFELT $ 19)) (QREFELT $ 20))
                   " unchanged")
             (QREFELT $ 14)))
           (EXIT
            (PROGN
             (LETT #1# (SPADCALL (SPADCALL |s| (QREFELT $ 19)) (QREFELT $ 21))
                   . #2#)
             (GO #1#))))))
        (LETT |subnodes| (SPADCALL |s| (QREFELT $ 22)) . #2#)
        (LETT |c1| (|SPADfirst| |subnodes|) . #2#)
        (LETT |c2| (SPADCALL |subnodes| (QREFELT $ 24)) . #2#)
        (LETT |s1| (SPADCALL |c1| (QREFELT $ 25)) . #2#)
        (LETT |s2| (SPADCALL |c2| (QREFELT $ 25)) . #2#)
        (COND
         ((SPADCALL |c1| (QREFELT $ 11))
          (SEQ
           (|sayBrightly|
            (SPADCALL
             (LIST "util coerce apply rule SL1 in:"
                   (SPADCALL |s| (QREFELT $ 25)))
             (QREFELT $ 14)))
           (EXIT
            (PROGN
             (LETT #1# (|COMPUTIL;Ski2Lambda| |c2| $) . #2#)
             (GO #1#))))))
        (COND
         ((SPADCALL |c1| (QREFELT $ 10))
          (SEQ
           (|sayBrightly|
            (SPADCALL
             (LIST "util coerce rule SL4: Ski[(" |s1| " " |s2| ")] = (Ski["
                   |s1| "] Ski[" |s2| "])")
             (QREFELT $ 14)))
           (EXIT
            (PROGN
             (LETT #1#
                   (SPADCALL (|COMPUTIL;Ski2Lambda| |c1| $)
                             (|COMPUTIL;Ski2Lambda| |c2| $) (QREFELT $ 26))
                   . #2#)
             (GO #1#))))))
        (LETT |subsubnodes| (SPADCALL |c1| (QREFELT $ 22)) . #2#)
        (LETT |c11| (|SPADfirst| |subsubnodes|) . #2#)
        (LETT |c12| (SPADCALL |subsubnodes| (QREFELT $ 24)) . #2#)
        (COND
         ((SPADCALL |c11| (QREFELT $ 17))
          (SEQ
           (LETT |s12|
                 (SPADCALL (SPADCALL |c12| (QREFELT $ 19)) (QREFELT $ 20))
                 . #2#)
           (|sayBrightly|
            (SPADCALL
             (LIST "util coerce apply rule SL2 in:"
                   (SPADCALL |s| (QREFELT $ 25)))
             (QREFELT $ 14)))
           (EXIT
            (PROGN
             (LETT #1# (|COMPUTIL;Ski2Lambda| |c12| $) . #2#)
             (GO #1#))))))
        (COND
         ((SPADCALL |c11| (QREFELT $ 10))
          (SEQ
           (|sayBrightly|
            (SPADCALL
             (LIST "util coerce rule SL4: Ski[(" |s1| " " |s2| ")] = (Ski["
                   |s1| "] Ski[" |s2| "])")
             (QREFELT $ 14)))
           (EXIT
            (PROGN
             (LETT #1#
                   (SPADCALL (|COMPUTIL;Ski2Lambda| |c1| $)
                             (|COMPUTIL;Ski2Lambda| |c2| $) (QREFELT $ 26))
                   . #2#)
             (GO #1#))))))
        (LETT |subsubnodes2| (SPADCALL |c11| (QREFELT $ 22)) . #2#)
        (LETT |c111| (|SPADfirst| |subsubnodes2|) . #2#)
        (LETT |c112| (SPADCALL |subsubnodes2| (QREFELT $ 24)) . #2#)
        (COND
         ((SPADCALL |c111| (QREFELT $ 18))
          (SEQ
           (LETT |s2| (SPADCALL (SPADCALL |c2| (QREFELT $ 19)) (QREFELT $ 20))
                 . #2#)
           (LETT |s12|
                 (SPADCALL (SPADCALL |c12| (QREFELT $ 19)) (QREFELT $ 20))
                 . #2#)
           (LETT |s112|
                 (SPADCALL (SPADCALL |c112| (QREFELT $ 19)) (QREFELT $ 20))
                 . #2#)
           (|sayBrightly|
            (SPADCALL
             (LIST "util coerce apply rule SL3 in:"
                   (SPADCALL |s| (QREFELT $ 25)))
             (QREFELT $ 14)))
           (EXIT
            (PROGN
             (LETT #1#
                   (SPADCALL
                    (SPADCALL (|COMPUTIL;Ski2Lambda| |c112| $)
                              (|COMPUTIL;Ski2Lambda| |c2| $) (QREFELT $ 26))
                    (SPADCALL (|COMPUTIL;Ski2Lambda| |c12| $)
                              (|COMPUTIL;Ski2Lambda| |c2| $) (QREFELT $ 26))
                    (QREFELT $ 26))
                   . #2#)
             (GO #1#))))))
        (|sayBrightly|
         (SPADCALL
          (LIST "util coerce rule SL4: Ski[(" |s1| " " |s2| ")] = (Ski[" |s1|
                "] Ski[" |s2| "])")
          (QREFELT $ 14)))
        (EXIT
         (SPADCALL (|COMPUTIL;Ski2Lambda| |c1| $)
                   (|COMPUTIL;Ski2Lambda| |c2| $) (QREFELT $ 26)))))
      #1# (EXIT #1#))))) 

(DEFUN |COMPUTIL;coerce;SkicL;2| (|s| $)
  (PROG (|term|)
    (RETURN
     (SEQ (SETELT $ 7 0)
          (LETT |term| (|COMPUTIL;Ski2Lambda| |s| $) |COMPUTIL;coerce;SkicL;2|)
          (EXIT |term|))))) 

(DEFUN |COMPUTIL;lambdaOverSki| (|var| |sk| $)
  (PROG (#1=#:G185 |right| |left| |ch|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL |sk| (QREFELT $ 10))
          (SEQ
           (COND
            ((SPADCALL |sk| |var| (QREFELT $ 28))
             (SEQ
              (|sayBrightly|
               (SPADCALL
                (LIST "util coerce rule LS3' applied to: \\"
                      (SPADCALL |var| (QREFELT $ 29)) "."
                      (SPADCALL |sk| (QREFELT $ 25)) " giving K "
                      (SPADCALL |sk| (QREFELT $ 25)))
                (QREFELT $ 14)))
              (EXIT
               (PROGN
                (LETT #1#
                      (SPADCALL (SPADCALL (QREFELT $ 30)) |sk| (QREFELT $ 31))
                      . #2=(|COMPUTIL;lambdaOverSki|))
                (GO #1#))))))
           (|sayBrightly|
            (SPADCALL
             (LIST "util coerce rule LS4' applied to: \\"
                   (SPADCALL |var| (QREFELT $ 29)) "."
                   (SPADCALL |sk| (QREFELT $ 25)) " giving I")
             (QREFELT $ 14)))
           (EXIT
            (PROGN (LETT #1# (SPADCALL (QREFELT $ 32)) . #2#) (GO #1#))))))
        (LETT |ch| (SPADCALL |sk| (QREFELT $ 22)) . #2#)
        (LETT |left| (|SPADfirst| |ch|) . #2#)
        (LETT |right| (SPADCALL |ch| (QREFELT $ 24)) . #2#)
        (COND
         ((SPADCALL |sk| |var| (QREFELT $ 28))
          (SEQ
           (|sayBrightly|
            (SPADCALL
             (LIST "util coerce rule LS3' applied to: \\"
                   (SPADCALL |var| (QREFELT $ 29)) "."
                   (SPADCALL |sk| (QREFELT $ 25)) " giving K \\"
                   (SPADCALL |var| (QREFELT $ 29)) "."
                   (SPADCALL |left| (QREFELT $ 25)) " \\"
                   (SPADCALL |var| (QREFELT $ 29)) "."
                   (SPADCALL |right| (QREFELT $ 25)))
             (QREFELT $ 14)))
           (EXIT
            (PROGN
             (LETT #1#
                   (SPADCALL (SPADCALL (QREFELT $ 30))
                             (SPADCALL |left| |right| (QREFELT $ 31))
                             (QREFELT $ 31))
                   . #2#)
             (GO #1#))))))
        (|sayBrightly|
         (SPADCALL
          (LIST "util coerce rule LS5' applied to: \\"
                (SPADCALL |var| (QREFELT $ 29)) "."
                (SPADCALL |sk| (QREFELT $ 25)) " giving S \\"
                (SPADCALL |var| (QREFELT $ 29)) "."
                (SPADCALL |left| (QREFELT $ 25)) " \\"
                (SPADCALL |var| (QREFELT $ 29)) "."
                (SPADCALL |right| (QREFELT $ 25)))
          (QREFELT $ 14)))
        (EXIT
         (PROGN
          (LETT #1#
                (SPADCALL
                 (SPADCALL (SPADCALL (QREFELT $ 33))
                           (|COMPUTIL;lambdaOverSki| |var| |left| $)
                           (QREFELT $ 31))
                 (|COMPUTIL;lambdaOverSki| |var| |right| $) (QREFELT $ 31))
                . #2#)
          (GO #1#)))))
      #1# (EXIT #1#))))) 

(DEFUN |COMPUTIL;coerce;LSkic;4| (|lam| $)
  (PROG (#1=#:G201 |c32| |c31| |ch3| |cxx| |c33| |s3| |c3| |lamUn| |c2| |c1|
         |ch|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL |lam| (QREFELT $ 34))
          (SEQ
           (|sayBrightly|
            (SPADCALL
             (LIST "util coerce rule LS1 applied to:"
                   (SPADCALL |lam| (QREFELT $ 35)) " giving "
                   (SPADCALL |lam| (QREFELT $ 35)))
             (QREFELT $ 14)))
           (EXIT
            (PROGN
             (LETT #1#
                   (SPADCALL
                    (SPADCALL (SPADCALL |lam| (QREFELT $ 35)) (QREFELT $ 36))
                    (QREFELT $ 37))
                   . #2=(|COMPUTIL;coerce;LSkic;4|))
             (GO #1#))))))
        (COND
         ((SPADCALL |lam| (QREFELT $ 38))
          (SEQ (LETT |ch| (SPADCALL |lam| (QREFELT $ 39)) . #2#)
               (LETT |c1| (|SPADfirst| |ch|) . #2#)
               (LETT |c2| (SPADCALL |ch| (QREFELT $ 41)) . #2#)
               (|sayBrightly|
                (SPADCALL
                 (LIST "util coerce rule LS2 applied to:"
                       (SPADCALL |lam| (QREFELT $ 35)) " giving ("
                       (SPADCALL |c1| (QREFELT $ 35)) " "
                       (SPADCALL |c2| (QREFELT $ 35)) ")")
                 (QREFELT $ 14)))
               (EXIT
                (PROGN
                 (LETT #1#
                       (SPADCALL (SPADCALL |c1| (QREFELT $ 42))
                                 (SPADCALL |c2| (QREFELT $ 42)) (QREFELT $ 31))
                       . #2#)
                 (GO #1#))))))
        (COND
         ((SPADCALL |lam| (QREFELT $ 43))
          (SEQ (LETT |lamUn| (SPADCALL |lam| (QREFELT $ 44)) . #2#)
               (LETT |c3| (|SPADfirst| (SPADCALL |lamUn| (QREFELT $ 39)))
                     . #2#)
               (LETT |s3| (SPADCALL |lam| (QREFELT $ 45)) . #2#)
               (COND
                ((SPADCALL |c3| (QREFELT $ 34))
                 (COND
                  ((EQUAL (SPADCALL |c3| (QREFELT $ 35)) "0")
                   (SEQ
                    (|sayBrightly|
                     (SPADCALL
                      (LIST "util coerce rule LS4 applied to:"
                            (SPADCALL |lam| (QREFELT $ 35)) " giving I")
                      (QREFELT $ 14)))
                    (EXIT
                     (PROGN
                      (LETT #1# (SPADCALL (QREFELT $ 32)) . #2#)
                      (GO #1#))))))))
               (COND
                ((SPADCALL |lam| (QREFELT $ 46))
                 (SEQ
                  (|sayBrightly|
                   (SPADCALL
                    (LIST "util coerce rule LS3 applied to:"
                          (SPADCALL |lam| (QREFELT $ 35)) " giving K "
                          (SPADCALL |c3| (QREFELT $ 35)))
                    (QREFELT $ 14)))
                  (EXIT
                   (PROGN
                    (LETT #1#
                          (SPADCALL (SPADCALL (QREFELT $ 30))
                                    (SPADCALL |c3| (QREFELT $ 42))
                                    (QREFELT $ 31))
                          . #2#)
                    (GO #1#))))))
               (COND
                ((SPADCALL |c3| (QREFELT $ 43))
                 (SEQ
                  (LETT |c33| (|SPADfirst| (SPADCALL |c3| (QREFELT $ 39)))
                        . #2#)
                  (LETT |cxx|
                        (SPADCALL |c33| (SPADCALL |c3| (QREFELT $ 45))
                                  (QREFELT $ 47))
                        . #2#)
                  (|sayBrightly|
                   (SPADCALL
                    (LIST "util coerce rule LS5 applied to:"
                          (SPADCALL |lam| (QREFELT $ 35)) " giving \\"
                          (SPADCALL |s3| (QREFELT $ 29)) "."
                          (SPADCALL |cxx| (QREFELT $ 35)))
                    (QREFELT $ 14)))
                  (EXIT
                   (PROGN
                    (LETT #1#
                          (|COMPUTIL;lambdaOverSki| |s3|
                           (SPADCALL |cxx| (QREFELT $ 42)) $)
                          . #2#)
                    (GO #1#))))))
               (EXIT
                (COND
                 ((SPADCALL |c3| (QREFELT $ 38))
                  (SEQ (LETT |ch3| (SPADCALL |c3| (QREFELT $ 39)) . #2#)
                       (LETT |c31| (|SPADfirst| |ch3|) . #2#)
                       (LETT |c32| (SPADCALL |ch3| (QREFELT $ 41)) . #2#)
                       (|sayBrightly|
                        (SPADCALL
                         (LIST "util coerce rule LS6 applied to:"
                               (SPADCALL |lam| (QREFELT $ 35)) " giving S \\"
                               (SPADCALL |s3| (QREFELT $ 29)) "."
                               (SPADCALL |c31| (QREFELT $ 35)) " \\"
                               (SPADCALL |s3| (QREFELT $ 29)) "."
                               (SPADCALL |c32| (QREFELT $ 35)))
                         (QREFELT $ 14)))
                       (EXIT
                        (PROGN
                         (LETT #1#
                               (SPADCALL
                                (SPADCALL (SPADCALL (QREFELT $ 33))
                                          (|COMPUTIL;lambdaOverSki| |s3|
                                           (SPADCALL |c31| (QREFELT $ 42)) $)
                                          (QREFELT $ 31))
                                (|COMPUTIL;lambdaOverSki| |s3|
                                 (SPADCALL |c32| (QREFELT $ 42)) $)
                                (QREFELT $ 31))
                               . #2#)
                         (GO #1#))))))))))
        (|sayBrightly|
         (SPADCALL
          (LIST "util coerce warning could not match any rule to:"
                (SPADCALL |lam| (QREFELT $ 35)))
          (QREFELT $ 14)))
        (EXIT (SPADCALL (QREFELT $ 32)))))
      #1# (EXIT #1#))))) 

(DEFUN |COMPUTIL;coerce;SkicIl;5| (|s| $)
  (PROG (#1=#:G219 |bc| |ac| |ab| |c| |b| |a| |c112| |c111| |subsubnodes2|
         |c12| |c11| |subsubnodes| |c2| |c1| |subnodes|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL |s| (QREFELT $ 10))
          (SEQ
           (COND
            ((SPADCALL |s| (QREFELT $ 11))
             (SEQ
              (|sayBrightly| "warning I does not have a parameter to act on")
              (|sayBrightly| "creating x")
              (LETT |a| (SPADCALL "x" (QREFELT $ 49))
                    . #2=(|COMPUTIL;coerce;SkicIl;5|))
              (EXIT
               (PROGN
                (LETT #1# (SPADCALL |a| |a| (QREFELT $ 50)) . #2#)
                (GO #1#))))))
           (COND
            ((SPADCALL |s| (QREFELT $ 17))
             (SEQ
              (|sayBrightly| "warning K does not enough parameters to act on")
              (|sayBrightly| "creating x and y")
              (LETT |a| (SPADCALL "x" (QREFELT $ 49)) . #2#)
              (LETT |b| (SPADCALL "y" (QREFELT $ 49)) . #2#)
              (EXIT
               (PROGN
                (LETT #1#
                      (SPADCALL |a| (SPADCALL |b| |a| (QREFELT $ 50))
                                (QREFELT $ 50))
                      . #2#)
                (GO #1#))))))
           (COND
            ((SPADCALL |s| (QREFELT $ 18))
             (SEQ
              (|sayBrightly| "warning S does not enough parameters to act on")
              (|sayBrightly| "creating x,y an z")
              (LETT |a| (SPADCALL "x" (QREFELT $ 49)) . #2#)
              (LETT |b| (SPADCALL "y" (QREFELT $ 49)) . #2#)
              (LETT |c| (SPADCALL "z" (QREFELT $ 49)) . #2#)
              (LETT |ab| (SPADCALL |a| |b| (QREFELT $ 50)) . #2#)
              (LETT |ac| (SPADCALL |a| |c| (QREFELT $ 50)) . #2#)
              (LETT |bc| (SPADCALL |b| |c| (QREFELT $ 50)) . #2#)
              (EXIT
               (PROGN
                (LETT #1#
                      (SPADCALL (SPADCALL |a| |bc| (QREFELT $ 50))
                                (SPADCALL |ab| |ac| (QREFELT $ 50))
                                (QREFELT $ 50))
                      . #2#)
                (GO #1#))))))
           (EXIT
            (PROGN
             (LETT #1#
                   (SPADCALL
                    (SPADCALL (SPADCALL |s| (QREFELT $ 19)) (QREFELT $ 20))
                    (QREFELT $ 49))
                   . #2#)
             (GO #1#))))))
        (LETT |subnodes| (SPADCALL |s| (QREFELT $ 22)) . #2#)
        (LETT |c1| (|SPADfirst| |subnodes|) . #2#)
        (LETT |c2| (SPADCALL |subnodes| (QREFELT $ 24)) . #2#)
        (COND
         ((SPADCALL |c1| (QREFELT $ 11))
          (SEQ
           (|sayBrightly|
            (SPADCALL
             (LIST "util coerce apply rule SI1 in:"
                   (SPADCALL |s| (QREFELT $ 25)))
             (QREFELT $ 14)))
           (LETT |a| (SPADCALL |c1| (QREFELT $ 51)) . #2#)
           (EXIT
            (PROGN
             (LETT #1# (SPADCALL |a| |a| (QREFELT $ 50)) . #2#)
             (GO #1#))))))
        (COND
         ((SPADCALL |c1| (QREFELT $ 10))
          (PROGN
           (LETT #1#
                 (SPADCALL (SPADCALL |c1| (QREFELT $ 51))
                           (SPADCALL |c2| (QREFELT $ 51)) (QREFELT $ 52))
                 . #2#)
           (GO #1#))))
        (LETT |subsubnodes| (SPADCALL |c1| (QREFELT $ 22)) . #2#)
        (LETT |c11| (|SPADfirst| |subsubnodes|) . #2#)
        (LETT |c12| (SPADCALL |subsubnodes| (QREFELT $ 24)) . #2#)
        (COND
         ((SPADCALL |c11| (QREFELT $ 17))
          (SEQ
           (|sayBrightly|
            (SPADCALL
             (LIST "util coerce apply rule SI2 in:"
                   (SPADCALL |s| (QREFELT $ 25)))
             (QREFELT $ 14)))
           (LETT |a| (SPADCALL |c2| (QREFELT $ 51)) . #2#)
           (LETT |b| (SPADCALL |c12| (QREFELT $ 51)) . #2#)
           (EXIT
            (PROGN
             (LETT #1#
                   (SPADCALL |a| (SPADCALL |b| |a| (QREFELT $ 50))
                             (QREFELT $ 50))
                   . #2#)
             (GO #1#))))))
        (COND
         ((SPADCALL |c11| (QREFELT $ 10))
          (PROGN
           (LETT #1#
                 (SPADCALL (SPADCALL |c1| (QREFELT $ 51))
                           (SPADCALL |c2| (QREFELT $ 51)) (QREFELT $ 52))
                 . #2#)
           (GO #1#))))
        (LETT |subsubnodes2| (SPADCALL |c11| (QREFELT $ 22)) . #2#)
        (LETT |c111| (|SPADfirst| |subsubnodes2|) . #2#)
        (LETT |c112| (SPADCALL |subsubnodes2| (QREFELT $ 24)) . #2#)
        (COND
         ((SPADCALL |c111| (QREFELT $ 18))
          (SEQ
           (|sayBrightly|
            (SPADCALL
             (LIST "util coerce apply rule SI3 in:"
                   (SPADCALL |s| (QREFELT $ 25)))
             (QREFELT $ 14)))
           (LETT |a| (SPADCALL |c2| (QREFELT $ 51)) . #2#)
           (LETT |b| (SPADCALL |c12| (QREFELT $ 51)) . #2#)
           (LETT |c| (SPADCALL |c112| (QREFELT $ 51)) . #2#)
           (LETT |ab| (SPADCALL |a| |b| (QREFELT $ 50)) . #2#)
           (LETT |ac| (SPADCALL |a| |c| (QREFELT $ 50)) . #2#)
           (LETT |bc| (SPADCALL |b| |c| (QREFELT $ 50)) . #2#)
           (EXIT
            (PROGN
             (LETT #1#
                   (SPADCALL (SPADCALL |a| |bc| (QREFELT $ 50))
                             (SPADCALL |ab| |ac| (QREFELT $ 50))
                             (QREFELT $ 50))
                   . #2#)
             (GO #1#))))))
        (EXIT
         (SPADCALL (SPADCALL |c1| (QREFELT $ 51))
                   (SPADCALL |c2| (QREFELT $ 51)) (QREFELT $ 52)))))
      #1# (EXIT #1#))))) 

(DEFUN |compUtil| (#1=#:G220)
  (PROG ()
    (RETURN
     (PROG (#2=#:G221)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|compUtil|)
                                           '|domainEqualList|)
                . #3=(|compUtil|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|compUtil;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|compUtil|))))))))))) 

(DEFUN |compUtil;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|compUtil|))
      (LETT |dv$| (LIST '|compUtil| DV$1) . #1#)
      (LETT $ (GETREFV 53) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|compUtil| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 0)
      $)))) 

(MAKEPROP '|compUtil| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|varNum| (|Boolean|)
              (|SKICombinators| 6) (0 . |atom?|) (5 . |isI?|) (|List| $)
              (|String|) (10 . |concat|) (|Lambda| 6) (15 . |parseLambda|)
              (20 . |isK?|) (25 . |isS?|) (30 . |getVariable|) (35 . |getName|)
              (40 . |lambda|) (45 . |getChildren|) (|List| 9) (50 . |second|)
              (55 . |toString|) (60 . |lambda|) |COMPUTIL;coerce;SkicL;2|
              (66 . |freeVariable?|) (72 . |toString|) (77 . K) (81 . |ski|)
              (87 . I) (91 . S) (95 . |atom?|) (100 . |toString|) (105 . |var|)
              (110 . |ski|) (115 . |isCompound?|) (120 . |getChildren|)
              (|List| 15) (125 . |second|) |COMPUTIL;coerce;LSkic;4|
              (130 . |isLambda?|) (135 . |unbind|) (140 . |getVariable|)
              (145 . |free?|) (150 . |lambda|) (|ILogic|) (156 . |proposition|)
              (161 . |implies|) |COMPUTIL;coerce;SkicIl;5| (167 . |\\/|))
           '#(|coerce| 173) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 52
                                                 '(1 9 8 0 10 1 9 8 0 11 1 13 0
                                                   12 14 1 15 0 13 16 1 9 8 0
                                                   17 1 9 8 0 18 1 9 6 0 19 1 6
                                                   13 0 20 1 15 0 6 21 1 9 12 0
                                                   22 1 23 9 0 24 1 9 13 0 25 2
                                                   15 0 0 0 26 2 9 8 0 6 28 1 6
                                                   13 0 29 0 9 0 30 2 9 0 0 0
                                                   31 0 9 0 32 0 9 0 33 1 15 8
                                                   0 34 1 15 13 0 35 1 6 0 13
                                                   36 1 9 0 6 37 1 15 8 0 38 1
                                                   15 12 0 39 1 40 15 0 41 1 15
                                                   8 0 43 1 15 0 0 44 1 15 6 0
                                                   45 1 15 8 0 46 2 15 0 0 6 47
                                                   1 48 0 13 49 2 48 0 0 0 50 2
                                                   48 0 0 0 52 1 0 15 9 27 1 0
                                                   48 9 51 1 0 9 15 42)))))
           '|lookupComplete|)) 
