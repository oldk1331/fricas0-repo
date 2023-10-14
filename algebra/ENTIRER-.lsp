
(/VERSIONCHECK 2) 

(DEFUN |ENTIRER-;unitNormal;SR;1| (|x| $)
  (VECTOR (|spadConstant| $ 7) |x| (|spadConstant| $ 7))) 

(DEFUN |ENTIRER-;unitCanonical;2S;2| (|x| $)
  (QVELT (SPADCALL |x| (QREFELT $ 10)) 1)) 

(DEFUN |ENTIRER-;recip;SU;3| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 13)) (CONS 1 "failed"))
        ('T (SPADCALL (|spadConstant| $ 7) |x| (QREFELT $ 15))))) 

(DEFUN |ENTIRER-;unit?;SB;4| (|x| $)
  (COND ((QEQCAR (SPADCALL |x| (QREFELT $ 17)) 1) 'NIL) ('T 'T))) 

(DEFUN |ENTIRER-;associates?;2SB;5| (|x| |y| $)
  (SPADCALL (QVELT (SPADCALL |x| (QREFELT $ 10)) 1)
            (QVELT (SPADCALL |y| (QREFELT $ 10)) 1) (QREFELT $ 19))) 

(DEFUN |ENTIRER-;associates?;2SB;6| (|x| |y| $)
  (COND ((SPADCALL |x| (QREFELT $ 13)) (SPADCALL |y| (QREFELT $ 13)))
        ((OR (SPADCALL |y| (QREFELT $ 13))
             (OR (QEQCAR (SPADCALL |x| |y| (QREFELT $ 15)) 1)
                 (QEQCAR (SPADCALL |y| |x| (QREFELT $ 15)) 1)))
         'NIL)
        ('T 'T))) 

(DEFUN |EntireRing&| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|EntireRing&|))
      (LETT |dv$| (LIST '|EntireRing&| DV$1) . #1#)
      (LETT $ (GETREFV 21) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (COND ((|HasCategory| |#1| '(|Field|)))
            ('T
             (QSETREFV $ 9
                       (CONS (|dispatchFunction| |ENTIRER-;unitNormal;SR;1|)
                             $))))
      (COND
       ((|HasCategory| |#1| '(|canonicalUnitNormal|))
        (QSETREFV $ 20
                  (CONS (|dispatchFunction| |ENTIRER-;associates?;2SB;5|) $)))
       ('T
        (QSETREFV $ 20
                  (CONS (|dispatchFunction| |ENTIRER-;associates?;2SB;6|) $))))
      $)))) 

(MAKEPROP '|EntireRing&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |One|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (4 . |unitNormal|) (9 . |unitNormal|)
              |ENTIRER-;unitCanonical;2S;2| (|Boolean|) (14 . |zero?|)
              (|Union| $ '"failed") (19 . |exquo|) |ENTIRER-;recip;SU;3|
              (25 . |recip|) |ENTIRER-;unit?;SB;4| (30 . =)
              (36 . |associates?|))
           '#(|unitNormal| 42 |unitCanonical| 47 |unit?| 52 |recip| 57
              |associates?| 62)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 20
                                                 '(0 6 0 7 1 0 8 0 9 1 6 8 0 10
                                                   1 6 12 0 13 2 6 14 0 0 15 1
                                                   6 14 0 17 2 6 12 0 0 19 2 0
                                                   12 0 0 20 1 0 8 0 9 1 0 0 0
                                                   11 1 0 12 0 18 1 0 14 0 16 2
                                                   0 12 0 0 20)))))
           '|lookupComplete|)) 
