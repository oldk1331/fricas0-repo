
(/VERSIONCHECK 2) 

(DEFUN |SCENE;createSceneRoot;Sb$;1| (|bb| $) (VECTOR 'ROOT NIL (CONS 3 |bb|))) 

(DEFUN |SCENE;createSceneRoot;R$;2| (|bb| $)
  (SPADCALL (SPADCALL (QCAR |bb|) (QCDR |bb|) (QREFELT $ 10)) (QREFELT $ 9))) 

(DEFUN |SCENE;createSceneRoot;4I$;3| (|minx| |miny| |maxx| |maxy| $)
  (PROG (|bb|)
    (RETURN
     (SEQ
      (LETT |bb|
            (SPADCALL (SPADCALL |minx| |miny| (QREFELT $ 14))
                      (SPADCALL |maxx| |maxy| (QREFELT $ 14)) (QREFELT $ 10))
            |SCENE;createSceneRoot;4I$;3|)
      (EXIT (VECTOR 'ROOT NIL (CONS 3 |bb|))))))) 

(DEFUN |SCENE;createSceneRoot;$;4| ($)
  (VECTOR 'ROOT NIL (CONS 3 (SPADCALL (QREFELT $ 16))))) 

(DEFUN |SCENE;createSceneGroup;$;5| ($) (VECTOR 'GROUP NIL (CONS 11 "empty"))) 

(DEFUN |SCENE;addSceneGroup;2$;6| (|n| $)
  (PROG (|c|)
    (RETURN
     (SEQ (LETT |c| (SPADCALL (QREFELT $ 18)) |SCENE;addSceneGroup;2$;6|)
          (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneLine;L$;7| (|line| $)
  (VECTOR 'LINE NIL (CONS 0 (LIST |line|)))) 

(DEFUN |SCENE;addSceneLine;$L$;8| (|n| |line| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |line| (QREFELT $ 23)) |SCENE;addSceneLine;$L$;8|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneLine;2$Df$;9| (|st| |en| |fontScale| $)
  (PROG (|enPoint| |stPoint| |enBoundary| |stBoundary|)
    (RETURN
     (SEQ
      (LETT |stBoundary| (SPADCALL |st| |fontScale| (QREFELT $ 26))
            . #1=(|SCENE;createSceneLine;2$Df$;9|))
      (LETT |enBoundary| (SPADCALL |en| |fontScale| (QREFELT $ 26)) . #1#)
      (LETT |stPoint|
            (SPADCALL |enBoundary| (SPADCALL |stBoundary| (QREFELT $ 27))
                      (QREFELT $ 28))
            . #1#)
      (LETT |enPoint|
            (SPADCALL |stBoundary| (SPADCALL |enBoundary| (QREFELT $ 27))
                      (QREFELT $ 28))
            . #1#)
      (EXIT (VECTOR 'LINE NIL (CONS 0 (LIST (LIST |stPoint| |enPoint|))))))))) 

(DEFUN |SCENE;addSceneLine;3$Df$;10| (|n| |st| |en| |fontScale| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |st| |en| |fontScale| (QREFELT $ 29))
            |SCENE;addSceneLine;3$Df$;10|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneLines;L$;11| (|lines| $)
  (VECTOR 'LINE NIL (CONS 0 |lines|))) 

(DEFUN |SCENE;addSceneLines;$L$;12| (|n| |lines| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |lines| (QREFELT $ 32)) |SCENE;addSceneLines;$L$;12|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneShape;R$;13| (|shape| $)
  (VECTOR 'SHAPE NIL (CONS 8 |shape|))) 

(DEFUN |SCENE;addSceneShape;$R$;14| (|n| |shape| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |shape| (QREFELT $ 35)) |SCENE;addSceneShape;$R$;14|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneShape;Sb$;15| (|shape| $)
  (PROG (|sh| |mn| |mx|)
    (RETURN
     (SEQ
      (LETT |mx| (SPADCALL |shape| (QREFELT $ 37))
            . #1=(|SCENE;createSceneShape;Sb$;15|))
      (LETT |mn| (SPADCALL |shape| (QREFELT $ 38)) . #1#)
      (LETT |sh| (VECTOR '|rect| |mn| (SPADCALL |mx| |mn| (QREFELT $ 39)) 'NIL)
            . #1#)
      (EXIT (VECTOR 'SHAPE NIL (CONS 8 |sh|))))))) 

(DEFUN |SCENE;addSceneShape;$Sb$;16| (|n| |shape| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |shape| (QREFELT $ 40))
            |SCENE;addSceneShape;$Sb$;16|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneDef;S2$;17| (|nam| |nde| $)
  (PROG (|nn|)
    (RETURN
     (SEQ (LETT |nn| (CONS |nam| |nde|) |SCENE;createSceneDef;S2$;17|)
          (EXIT (VECTOR 'DEF NIL (CONS 9 |nn|))))))) 

(DEFUN |SCENE;addSceneDef;$S2$;18| (|n| |nam| |nde| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |nam| |nde| (QREFELT $ 43))
            |SCENE;addSceneDef;$S2$;18|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneUse;S$;19| (|nam| $)
  (PROG (|nn|)
    (RETURN
     (SEQ
      (LETT |nn| (CONS |nam| (VECTOR 'GROUP NIL (CONS 11 "empty")))
            |SCENE;createSceneUse;S$;19|)
      (EXIT (VECTOR 'USE NIL (CONS 9 |nn|))))))) 

(DEFUN |SCENE;addSceneUse;$S$;20| (|n| |nam| $)
  (PROG (|c|)
    (RETURN
     (SEQ (LETT |c| (SPADCALL |nam| (QREFELT $ 45)) |SCENE;addSceneUse;$S$;20|)
          (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneArrows;LSDf$;21| (|lines| |mode| |size| $)
  (PROG (|ar|)
    (RETURN
     (SEQ
      (LETT |ar| (VECTOR |lines| |mode| |size|)
            |SCENE;createSceneArrows;LSDf$;21|)
      (EXIT (VECTOR 'ARROWS NIL (CONS 6 |ar|))))))) 

(DEFUN |SCENE;addSceneArrows;$LSDf$;22| (|n| |lines| |mode| |size| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |lines| |mode| |size| (QREFELT $ 48))
            |SCENE;addSceneArrows;$LSDf$;22|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneArrow;2SPTSDf$;23|
       (|st| |en| |offset| |mode| |size| $)
  (PROG (|ar|)
    (RETURN
     (SEQ
      (LETT |ar| (VECTOR |st| |en| |offset| |mode| |size|)
            |SCENE;createSceneArrow;2SPTSDf$;23|)
      (EXIT (VECTOR 'ARROW NIL (CONS 7 |ar|))))))) 

(DEFUN |SCENE;addSceneArrow;$2SPTSDf$;24|
       (|n| |st| |en| |offset| |mode| |size| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |st| |en| |offset| |mode| |size| (QREFELT $ 50))
            |SCENE;addSceneArrow;$2SPTSDf$;24|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneArrow;2$PTS2Df$;25|
       (|st| |en| |offset| |mode| |size| |fontScale| $)
  (PROG (|ar| |enPoint| |stPoint| |enBoundary| |stBoundary|)
    (RETURN
     (SEQ
      (LETT |stBoundary| (SPADCALL |st| |fontScale| (QREFELT $ 26))
            . #1=(|SCENE;createSceneArrow;2$PTS2Df$;25|))
      (LETT |enBoundary| (SPADCALL |en| |fontScale| (QREFELT $ 26)) . #1#)
      (LETT |stPoint|
            (SPADCALL |stBoundary| (SPADCALL |enBoundary| (QREFELT $ 27))
                      (QREFELT $ 28))
            . #1#)
      (LETT |enPoint|
            (SPADCALL |enBoundary| (SPADCALL |stBoundary| (QREFELT $ 27))
                      (QREFELT $ 28))
            . #1#)
      (LETT |ar| (VECTOR (LIST (LIST |stPoint| |enPoint|)) |mode| |size|)
            . #1#)
      (EXIT (VECTOR 'ARROWS NIL (CONS 6 |ar|))))))) 

(DEFUN |SCENE;addSceneArrow;3$PTS2Df$;26|
       (|n| |st| |en| |offset| |mode| |size| |fontScale| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c|
            (SPADCALL |st| |en| |offset| |mode| |size| |fontScale|
                      (QREFELT $ 52))
            |SCENE;addSceneArrow;3$PTS2Df$;26|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneNamedPoints;Snp$;27| (|np| $)
  (VECTOR 'NAMEDPOINTS NIL (CONS 10 |np|))) 

(DEFUN |SCENE;addSceneNamedPoints;$Snp$;28| (|n| |np| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |np| (QREFELT $ 55))
            |SCENE;addSceneNamedPoints;$Snp$;28|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneIFS;LL$;29| (|inx1| |pts1| $)
  (VECTOR 'IFS NIL (CONS 5 (CONS |inx1| |pts1|)))) 

(DEFUN |SCENE;addSceneIFS;$LL$;30| (|n| |inx1| |pts1| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |inx1| |pts1| (QREFELT $ 58))
            |SCENE;addSceneIFS;$LL$;30|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneIFS;Sifs$;31| (|in1| $)
  (PROG (|pts1| |inx1|)
    (RETURN
     (SEQ
      (LETT |inx1| (SPADCALL |in1| (QREFELT $ 61))
            . #1=(|SCENE;createSceneIFS;Sifs$;31|))
      (LETT |pts1| (SPADCALL |in1| (QREFELT $ 62)) . #1#)
      (EXIT (VECTOR 'IFS NIL (CONS 5 (CONS |inx1| |pts1|)))))))) 

(DEFUN |SCENE;addSceneIFS;$Sifs$;32| (|n| |in1| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |in1| (QREFELT $ 63)) |SCENE;addSceneIFS;$Sifs$;32|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneBox;Df$;33| (|size| $)
  (PROG (|inx| |pts|)
    (RETURN
     (SEQ
      (LETT |pts|
            (LIST (SPADCALL |size| (|minus_DF| |size|) |size| (QREFELT $ 65))
                  (SPADCALL |size| |size| |size| (QREFELT $ 65))
                  (SPADCALL (|minus_DF| |size|) |size| |size| (QREFELT $ 65))
                  (SPADCALL (|minus_DF| |size|) (|minus_DF| |size|) |size|
                            (QREFELT $ 65))
                  (SPADCALL (|minus_DF| |size|) (|minus_DF| |size|)
                            (|minus_DF| |size|) (QREFELT $ 65))
                  (SPADCALL (|minus_DF| |size|) |size| (|minus_DF| |size|)
                            (QREFELT $ 65))
                  (SPADCALL |size| |size| (|minus_DF| |size|) (QREFELT $ 65))
                  (SPADCALL |size| (|minus_DF| |size|) (|minus_DF| |size|)
                            (QREFELT $ 65)))
            . #1=(|SCENE;createSceneBox;Df$;33|))
      (LETT |inx|
            (LIST (LIST 0 1 2 3) (LIST 4 5 6 7) (LIST 7 6 1 0) (LIST 3 2 5 4)
                  (LIST 1 6 5 2) (LIST 3 4 7 0))
            . #1#)
      (EXIT (SPADCALL |inx| |pts| (QREFELT $ 58))))))) 

(DEFUN |SCENE;addSceneBox;$Df$;34| (|n| |size| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |size| (QREFELT $ 66)) |SCENE;addSceneBox;$Df$;34|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneText;R$;35| (|text| $)
  (VECTOR 'TEXT NIL (CONS 2 |text|))) 

(DEFUN |SCENE;addSceneText;$R$;36| (|n| |text| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |text| (QREFELT $ 69)) |SCENE;addSceneText;$R$;36|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneText;SNniPT$;37| (|str| |sz| |pz| $)
  (PROG (|text|)
    (RETURN
     (SEQ
      (LETT |text| (VECTOR |str| |sz| |pz| NIL)
            |SCENE;createSceneText;SNniPT$;37|)
      (EXIT (VECTOR 'TEXT NIL (CONS 2 |text|))))))) 

(DEFUN |SCENE;addSceneText;$SNniPT$;38| (|n| |str| |sz| |pz| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |str| |sz| |pz| (QREFELT $ 72))
            |SCENE;addSceneText;$SNniPT$;38|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneText;LNniPT$;39| (|str| |sz| |pz| $)
  (PROG (|text|)
    (RETURN
     (SEQ
      (LETT |text| (VECTOR (|SPADfirst| |str|) |sz| |pz| |str|)
            |SCENE;createSceneText;LNniPT$;39|)
      (EXIT (VECTOR 'TEXT NIL (CONS 2 |text|))))))) 

(DEFUN |SCENE;addSceneText;$LNniPT$;40| (|n| |str| |sz| |pz| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |str| |sz| |pz| (QREFELT $ 75))
            |SCENE;addSceneText;$LNniPT$;40|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneClip;Sb$;41| (|bb| $) (VECTOR 'CLIP NIL (CONS 3 |bb|))) 

(DEFUN |SCENE;addSceneClip;$Sb$;42| (|n| |bb| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |bb| (QREFELT $ 77)) |SCENE;addSceneClip;$Sb$;42|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneClip;R$;43| (|bb| $)
  (SPADCALL (SPADCALL (QCAR |bb|) (QCDR |bb|) (QREFELT $ 10)) (QREFELT $ 77))) 

(DEFUN |SCENE;addSceneClip;$R$;44| (|n| |bb| $)
  (PROG (|c|)
    (RETURN
     (SEQ (LETT |c| (SPADCALL |bb| (QREFELT $ 79)) |SCENE;addSceneClip;$R$;44|)
          (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneGrid;DfSb$;45| (|stepSize| |bb| $)
  (PROG (|ln| |i| |gp| |stepsy| #1=#:G767 |stepsx| #2=#:G766 |maxy| |maxx|
         |miny| |minx|)
    (RETURN
     (SEQ
      (LETT |minx| (SPADCALL (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 81))
            . #3=(|SCENE;createSceneGrid;DfSb$;45|))
      (LETT |miny| (SPADCALL (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 82))
            . #3#)
      (LETT |maxx| (SPADCALL (SPADCALL |bb| (QREFELT $ 37)) (QREFELT $ 81))
            . #3#)
      (LETT |maxy| (SPADCALL (SPADCALL |bb| (QREFELT $ 37)) (QREFELT $ 82))
            . #3#)
      (LETT |stepsx|
            (PROG1
                (LETT #2#
                      (TRUNCATE (|div_DF| (|sub_DF| |maxx| |minx|) |stepSize|))
                      . #3#)
              (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
            . #3#)
      (LETT |stepsy|
            (PROG1
                (LETT #1#
                      (TRUNCATE (|div_DF| (|sub_DF| |maxy| |miny|) |stepSize|))
                      . #3#)
              (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
            . #3#)
      (LETT |gp| (SPADCALL (QREFELT $ 18)) . #3#)
      (SEQ (LETT |i| 1 . #3#) G190
           (COND ((|greater_SI| |i| |stepsx|) (GO G191)))
           (SEQ
            (EXIT
             (LETT |ln|
                   (SPADCALL |gp|
                             (LIST
                              (SPADCALL
                               (|add_DF| |minx|
                                         (|mul_DF|
                                          (FLOAT |i|
                                                 MOST-POSITIVE-DOUBLE-FLOAT)
                                          |stepSize|))
                               |miny| (QREFELT $ 83))
                              (SPADCALL
                               (|add_DF| |minx|
                                         (|mul_DF|
                                          (FLOAT |i|
                                                 MOST-POSITIVE-DOUBLE-FLOAT)
                                          |stepSize|))
                               |maxy| (QREFELT $ 83)))
                             (QREFELT $ 24))
                   . #3#)))
           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
      (SEQ (LETT |i| 1 . #3#) G190
           (COND ((|greater_SI| |i| |stepsy|) (GO G191)))
           (SEQ
            (EXIT
             (LETT |ln|
                   (SPADCALL |gp|
                             (LIST
                              (SPADCALL |minx|
                                        (|add_DF| |miny|
                                                  (|mul_DF|
                                                   (FLOAT |i|
                                                          MOST-POSITIVE-DOUBLE-FLOAT)
                                                   |stepSize|))
                                        (QREFELT $ 83))
                              (SPADCALL |maxx|
                                        (|add_DF| |miny|
                                                  (|mul_DF|
                                                   (FLOAT |i|
                                                          MOST-POSITIVE-DOUBLE-FLOAT)
                                                   |stepSize|))
                                        (QREFELT $ 83)))
                             (QREFELT $ 24))
                   . #3#)))
           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |gp|))))) 

(DEFUN |SCENE;addSceneGrid;$DfSb$;46| (|n| |stepSize| |bb| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |stepSize| |bb| (QREFELT $ 84))
            |SCENE;addSceneGrid;$DfSb$;46|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneGrid;DfR$;47| (|stepSize| |bb| $)
  (SPADCALL |stepSize| (SPADCALL (QCAR |bb|) (QCDR |bb|) (QREFELT $ 10))
            (QREFELT $ 84))) 

(DEFUN |SCENE;addSceneGrid;$DfR$;48| (|n| |stepSize| |bb| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |stepSize| |bb| (QREFELT $ 86))
            |SCENE;addSceneGrid;$DfR$;48|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneGrid;Sb$;49| (|bb| $)
  (PROG (|gd3| |mt3| |gd2| |mt2| |gd1| |mt1| |gp| |stepSize| |maxx| |minx|)
    (RETURN
     (SEQ
      (LETT |minx| (SPADCALL (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 81))
            . #1=(|SCENE;createSceneGrid;Sb$;49|))
      (LETT |maxx| (SPADCALL (SPADCALL |bb| (QREFELT $ 37)) (QREFELT $ 81))
            . #1#)
      (LETT |stepSize| (|div_DF_I| (|sub_DF| |maxx| |minx|) 100) . #1#)
      (LETT |gp| (SPADCALL (QREFELT $ 18)) . #1#)
      (LETT |mt1|
            (SPADCALL |gp|
                      (VECTOR 1.0 "blue" "blue"
                              (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 90))
                                        (QREFELT $ 91)))
                      (QREFELT $ 93))
            . #1#)
      (LETT |gd1| (SPADCALL |mt1| |stepSize| |bb| (QREFELT $ 85)) . #1#)
      (LETT |mt2|
            (SPADCALL |gp|
                      (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "blue"
                              "blue"
                              (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 90))
                                        (QREFELT $ 91)))
                      (QREFELT $ 93))
            . #1#)
      (LETT |gd2|
            (SPADCALL |mt2|
                      (|mul_DF| |stepSize|
                                (FLOAT 5 MOST-POSITIVE-DOUBLE-FLOAT))
                      |bb| (QREFELT $ 85))
            . #1#)
      (LETT |mt3|
            (SPADCALL |gp|
                      (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "red" "red"
                              (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 90))
                                        (QREFELT $ 91)))
                      (QREFELT $ 93))
            . #1#)
      (LETT |gd3|
            (SPADCALL |mt3|
                      (|mul_DF| |stepSize|
                                (FLOAT 10 MOST-POSITIVE-DOUBLE-FLOAT))
                      |bb| (QREFELT $ 85))
            . #1#)
      (EXIT |gp|))))) 

(DEFUN |SCENE;addSceneGrid;$Sb$;50| (|n| |bb| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |bb| (QREFELT $ 94)) |SCENE;addSceneGrid;$Sb$;50|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneGrid;R$;51| (|bb| $)
  (SPADCALL (SPADCALL (QCAR |bb|) (QCDR |bb|) (QREFELT $ 10)) (QREFELT $ 94))) 

(DEFUN |SCENE;addSceneGrid;$R$;52| (|n| |bb| $)
  (PROG (|c|)
    (RETURN
     (SEQ (LETT |c| (SPADCALL |bb| (QREFELT $ 96)) |SCENE;addSceneGrid;$R$;52|)
          (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createScenePattern1| (|step| |bb| $)
  (PROG (|ln| |pts| |j| #1=#:G800 |i| |mt2| #2=#:G799 |mt1| |gp| |stepSize|
         |maxy| |maxx| |miny| |minx|)
    (RETURN
     (SEQ
      (LETT |minx| (SPADCALL (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 81))
            . #3=(|SCENE;createScenePattern1|))
      (LETT |miny| (SPADCALL (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 82))
            . #3#)
      (LETT |maxx| (SPADCALL (SPADCALL |bb| (QREFELT $ 37)) (QREFELT $ 81))
            . #3#)
      (LETT |maxy| (SPADCALL (SPADCALL |bb| (QREFELT $ 37)) (QREFELT $ 82))
            . #3#)
      (LETT |stepSize| (|div_DF_I| (|sub_DF| |maxx| |minx|) 1200) . #3#)
      (LETT |gp| (SPADCALL (QREFELT $ 18)) . #3#)
      (LETT |mt1|
            (SPADCALL |gp|
                      (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "blue"
                              "blue"
                              (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 90))
                                        (QREFELT $ 91)))
                      (QREFELT $ 93))
            . #3#)
      (SEQ (LETT |i| 1 . #3#) G190
           (COND
            ((IF (MINUSP |step|)
                 (< |i| 1200)
                 (> |i| 1200))
             (GO G191)))
           (SEQ
            (LETT |pts|
                  (PROGN
                   (LETT #2# NIL . #3#)
                   (SEQ (LETT |j| 1 . #3#) G190
                        (COND
                         ((IF (|negative?_SI| |step|)
                              (|less_SI| |j| 1200)
                              (|greater_SI| |j| 1200))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (SPADCALL
                                  (|add_DF| |minx|
                                            (|mul_DF|
                                             (FLOAT |i|
                                                    MOST-POSITIVE-DOUBLE-FLOAT)
                                             |stepSize|))
                                  (|add_DF| |miny|
                                            (|mul_DF|
                                             (FLOAT |j|
                                                    MOST-POSITIVE-DOUBLE-FLOAT)
                                             |stepSize|))
                                  (QREFELT $ 83))
                                 #2#)
                                . #3#)))
                        (LETT |j| (|add_SI| |j| |step|) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  . #3#)
            (EXIT (LETT |ln| (SPADCALL |mt1| |pts| (QREFELT $ 24)) . #3#)))
           (LETT |i| (+ |i| |step|) . #3#) (GO G190) G191 (EXIT NIL))
      (LETT |mt2|
            (SPADCALL |gp|
                      (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "red" "red"
                              (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 90))
                                        (QREFELT $ 91)))
                      (QREFELT $ 93))
            . #3#)
      (SEQ (LETT |i| 1 . #3#) G190
           (COND
            ((IF (|negative?_SI| |step|)
                 (|less_SI| |i| 1000)
                 (|greater_SI| |i| 1000))
             (GO G191)))
           (SEQ
            (LETT |pts|
                  (PROGN
                   (LETT #1# NIL . #3#)
                   (SEQ (LETT |j| 1 . #3#) G190
                        (COND
                         ((IF (|negative?_SI| |step|)
                              (|less_SI| |j| 1200)
                              (|greater_SI| |j| 1200))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #1#
                                (CONS
                                 (SPADCALL
                                  (|add_DF| |minx|
                                            (|mul_DF|
                                             (FLOAT |j|
                                                    MOST-POSITIVE-DOUBLE-FLOAT)
                                             |stepSize|))
                                  (|add_DF| |miny|
                                            (|mul_DF|
                                             (FLOAT |i|
                                                    MOST-POSITIVE-DOUBLE-FLOAT)
                                             |stepSize|))
                                  (QREFELT $ 83))
                                 #1#)
                                . #3#)))
                        (LETT |j| (|add_SI| |j| |step|) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #1#))))
                  . #3#)
            (EXIT (LETT |ln| (SPADCALL |mt2| |pts| (QREFELT $ 24)) . #3#)))
           (LETT |i| (|add_SI| |i| |step|) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |gp|))))) 

(DEFUN |SCENE;createScenePattern2| (|level| |bb| $)
  (PROG (|ifs2| |ifs| |face1| |midx| |maxy| |maxx| |miny| |minx|)
    (RETURN
     (SEQ
      (LETT |minx| (SPADCALL (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 81))
            . #1=(|SCENE;createScenePattern2|))
      (LETT |miny| (SPADCALL (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 82))
            . #1#)
      (LETT |maxx| (SPADCALL (SPADCALL |bb| (QREFELT $ 37)) (QREFELT $ 81))
            . #1#)
      (LETT |maxy| (SPADCALL (SPADCALL |bb| (QREFELT $ 37)) (QREFELT $ 82))
            . #1#)
      (LETT |midx|
            (|mul_DF| (|add_DF| |minx| |maxx|)
                      (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 90))
                                (QREFELT $ 91)))
            . #1#)
      (LETT |face1|
            (LIST (SPADCALL |midx| |miny| (QREFELT $ 83))
                  (SPADCALL |minx| |maxy| (QREFELT $ 83))
                  (SPADCALL |maxx| |maxy| (QREFELT $ 83)))
            . #1#)
      (LETT |ifs| (SPADCALL |face1| (QREFELT $ 98)) . #1#)
      (LETT |ifs2| (SPADCALL |ifs| |level| (QREFELT $ 99)) . #1#)
      (EXIT
       (SPADCALL (SPADCALL |ifs2| (QREFELT $ 61))
                 (SPADCALL |ifs2| (QREFELT $ 62)) (QREFELT $ 58))))))) 

(DEFUN |SCENE;subdivideLine| (|level| |inLine| $)
  (PROG (#1=#:G807 |res| |lastPt| |midpt| #2=#:G810 |x|)
    (RETURN
     (SEQ
      (COND ((EQL |level| 0) |inLine|)
            ('T
             (SEQ (LETT |res| NIL . #3=(|SCENE;subdivideLine|))
                  (SEQ (LETT |x| 1 . #3#) (LETT #2# (LENGTH |inLine|) . #3#)
                       G190 (COND ((|greater_SI| |x| #2#) (GO G191)))
                       (SEQ
                        (COND
                         ((SPADCALL |x| 1 (QREFELT $ 101))
                          (SEQ
                           (LETT |midpt|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 90))
                                            (QREFELT $ 91))
                                  (SPADCALL |lastPt|
                                            (SPADCALL |inLine| |x|
                                                      (QREFELT $ 102))
                                            (QREFELT $ 103))
                                  (QREFELT $ 104))
                                 . #3#)
                           (EXIT
                            (LETT |res|
                                  (SPADCALL |res| |midpt| (QREFELT $ 105))
                                  . #3#)))))
                        (LETT |lastPt| (SPADCALL |inLine| |x| (QREFELT $ 102))
                              . #3#)
                        (EXIT
                         (LETT |res|
                               (SPADCALL |res|
                                         (SPADCALL |inLine| |x|
                                                   (QREFELT $ 102))
                                         (QREFELT $ 105))
                               . #3#)))
                       (LETT |x| (|inc_SI| |x|) . #3#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT
                   (|SCENE;subdivideLine|
                    (PROG1 (LETT #1# (- |level| 1) . #3#)
                      (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                    |res| $))))))))) 

(DEFUN |SCENE;createScenePattern3| (|level| |bb| $)
  (PROG (|ln| |lev2| |pts2| #1=#:G822 |l2| |pts| #2=#:G821 |j| #3=#:G820
         #4=#:G819 |i| #5=#:G818 |ycoords| |xcoords| |scale| |maxy| |maxx|
         |miny| |minx|)
    (RETURN
     (SEQ
      (LETT |minx| (SPADCALL (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 81))
            . #6=(|SCENE;createScenePattern3|))
      (LETT |miny| (SPADCALL (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 82))
            . #6#)
      (LETT |maxx| (SPADCALL (SPADCALL |bb| (QREFELT $ 37)) (QREFELT $ 81))
            . #6#)
      (LETT |maxy| (SPADCALL (SPADCALL |bb| (QREFELT $ 37)) (QREFELT $ 82))
            . #6#)
      (LETT |scale| (|div_DF_I| (|sub_DF| |maxx| |minx|) 1000) . #6#)
      (LETT |xcoords|
            (LIST (LIST 0 0 500 1000 1000 0) (LIST 150 350 350 150 150)
                  (LIST 100 400 400 100 100) (LIST 600 900 900 600 600)
                  (LIST 600 900 900 600 600))
            . #6#)
      (LETT |ycoords|
            (LIST (LIST 0 800 1000 800 0 0) (LIST 0 0 300 300 0)
                  (LIST 500 500 700 700 500) (LIST 500 500 700 700 500)
                  (LIST 100 100 300 300 100))
            . #6#)
      (LETT |pts|
            (PROGN
             (LETT #5# NIL . #6#)
             (SEQ (LETT |i| 1 . #6#) (LETT #4# (LENGTH |xcoords|) . #6#) G190
                  (COND ((|greater_SI| |i| #4#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #5#
                          (CONS
                           (PROGN
                            (LETT #3# NIL . #6#)
                            (SEQ (LETT |j| 1 . #6#)
                                 (LETT #2#
                                       (SPADCALL
                                        (SPADCALL |xcoords| |i|
                                                  (QREFELT $ 107))
                                        (QREFELT $ 108))
                                       . #6#)
                                 G190 (COND ((|greater_SI| |j| #2#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #3#
                                         (CONS
                                          (SPADCALL
                                           (|add_DF| |minx|
                                                     (|mul_DF|
                                                      (FLOAT
                                                       (SPADCALL
                                                        (SPADCALL |xcoords| |i|
                                                                  (QREFELT $
                                                                           107))
                                                        |j| (QREFELT $ 109))
                                                       MOST-POSITIVE-DOUBLE-FLOAT)
                                                      |scale|))
                                           (|add_DF| |miny|
                                                     (|mul_DF|
                                                      (FLOAT
                                                       (SPADCALL
                                                        (SPADCALL |ycoords| |i|
                                                                  (QREFELT $
                                                                           107))
                                                        |j| (QREFELT $ 109))
                                                       MOST-POSITIVE-DOUBLE-FLOAT)
                                                      |scale|))
                                           (QREFELT $ 83))
                                          #3#)
                                         . #6#)))
                                 (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191
                                 (EXIT (NREVERSE #3#))))
                           #5#)
                          . #6#)))
                  (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                  (EXIT (NREVERSE #5#))))
            . #6#)
      (LETT |pts2| NIL . #6#) (LETT |lev2| |level| . #6#)
      (SEQ (LETT |l2| NIL . #6#) (LETT #1# |pts| . #6#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |l2| (CAR #1#) . #6#) NIL))
             (GO G191)))
           (SEQ
            (LETT |pts2|
                  (SPADCALL |pts2| (|SCENE;subdivideLine| |lev2| |l2| $)
                            (QREFELT $ 110))
                  . #6#)
            (EXIT (COND ((EQL |lev2| |level|) (LETT |lev2| 2 . #6#)))))
           (LETT #1# (CDR #1#) . #6#) (GO G190) G191 (EXIT NIL))
      (EXIT (LETT |ln| (SPADCALL |pts2| (QREFELT $ 32)) . #6#)))))) 

(DEFUN |SCENE;createScenePattern;SNniSb$;57| (|ptype| |step| |bb| $)
  (PROG (#1=#:G824)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((EQUAL |ptype| 'GRID)
          (PROGN
           (LETT #1# (|SCENE;createScenePattern1| |step| |bb| $)
                 . #2=(|SCENE;createScenePattern;SNniSb$;57|))
           (GO #1#))))
        (COND
         ((EQUAL |ptype| 'SIERPINSKI)
          (PROGN
           (LETT #1# (|SCENE;createScenePattern2| |step| |bb| $) . #2#)
           (GO #1#))))
        (EXIT (|SCENE;createScenePattern3| |step| |bb| $))))
      #1# (EXIT #1#))))) 

(DEFUN |SCENE;addScenePattern;$SNniSb$;58| (|n| |ptype| |step| |bb| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |ptype| |step| |bb| (QREFELT $ 111))
            |SCENE;addScenePattern;$SNniSb$;58|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createScenePattern;SNniR$;59| (|ptype| |step| |bb| $)
  (SPADCALL |ptype| |step| (SPADCALL (QCAR |bb|) (QCDR |bb|) (QREFELT $ 10))
            (QREFELT $ 111))) 

(DEFUN |SCENE;addScenePattern;$SNniR$;60| (|n| |ptype| |step| |bb| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |ptype| |step| |bb| (QREFELT $ 113))
            |SCENE;addScenePattern;$SNniR$;60|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneRuler;SPTSb$;61| (|ptype| |offset| |bb| $)
  (PROG (|str| |d| |pz| #1=#:G854 |x| |stepI| |gp| |suffix| |zeroes|
         |maxPrimaryNorm| |minPrimaryNorm| |divn| |expStep| |stepSize|
         |maxSecondary| |maxPrimary| |minSecondary| |minPrimary|)
    (RETURN
     (SEQ
      (LETT |minPrimary|
            (SPADCALL (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 81))
            . #2=(|SCENE;createSceneRuler;SPTSb$;61|))
      (LETT |minSecondary|
            (SPADCALL (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 82)) . #2#)
      (LETT |maxPrimary|
            (SPADCALL (SPADCALL |bb| (QREFELT $ 37)) (QREFELT $ 81)) . #2#)
      (LETT |maxSecondary|
            (SPADCALL (SPADCALL |bb| (QREFELT $ 37)) (QREFELT $ 82)) . #2#)
      (COND
       ((EQUAL |ptype| 'VERTICAL)
        (SEQ
         (LETT |minPrimary|
               (SPADCALL (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 82)) . #2#)
         (LETT |minSecondary|
               (SPADCALL (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 81)) . #2#)
         (LETT |maxPrimary|
               (SPADCALL (SPADCALL |bb| (QREFELT $ 37)) (QREFELT $ 82)) . #2#)
         (EXIT
          (LETT |maxSecondary|
                (SPADCALL (SPADCALL |bb| (QREFELT $ 37)) (QREFELT $ 81))
                . #2#)))))
      (LETT |stepSize| (|sub_DF| |maxPrimary| |minPrimary|) . #2#)
      (LETT |expStep|
            (- (TRUNCATE (SPADCALL (|add_DF| |stepSize| 1.0) (QREFELT $ 115)))
               1)
            . #2#)
      (LETT |divn|
            (|expt_DF_I| (FLOAT 10 MOST-POSITIVE-DOUBLE-FLOAT) |expStep|)
            . #2#)
      (LETT |minPrimaryNorm| (|div_DF| |minPrimary| |divn|) . #2#)
      (LETT |maxPrimaryNorm| (|div_DF| |maxPrimary| |divn|) . #2#)
      (LETT |suffix| "" . #2#) (LETT |zeroes| |expStep| . #2#)
      (COND
       ((SPADCALL |zeroes| 2 (QREFELT $ 116))
        (SEQ (LETT |zeroes| (- |zeroes| 3) . #2#) (LETT |suffix| "K" . #2#)
             (EXIT
              (COND
               ((SPADCALL |zeroes| 2 (QREFELT $ 116))
                (SEQ (LETT |zeroes| (- |zeroes| 3) . #2#)
                     (LETT |suffix| "M" . #2#)
                     (EXIT
                      (COND
                       ((SPADCALL |zeroes| 2 (QREFELT $ 116))
                        (SEQ (LETT |zeroes| (- |zeroes| 3) . #2#)
                             (LETT |suffix| "G" . #2#)
                             (EXIT
                              (COND
                               ((SPADCALL |zeroes| 2 (QREFELT $ 116))
                                (SEQ (LETT |zeroes| (- |zeroes| 3) . #2#)
                                     (EXIT
                                      (LETT |suffix| "T" . #2#)))))))))))))))))
      (COND
       ((< |zeroes| 0)
        (SEQ (LETT |zeroes| (+ |zeroes| 3) . #2#) (LETT |suffix| "m" . #2#)
             (EXIT
              (COND
               ((< |zeroes| 0)
                (SEQ (LETT |zeroes| (+ |zeroes| 3) . #2#)
                     (LETT |suffix| "u" . #2#)
                     (EXIT
                      (COND
                       ((< |zeroes| 0)
                        (SEQ (LETT |zeroes| (+ |zeroes| 3) . #2#)
                             (LETT |suffix| "n" . #2#)
                             (EXIT
                              (COND
                               ((< |zeroes| 0)
                                (SEQ (LETT |zeroes| (+ |zeroes| 3) . #2#)
                                     (EXIT
                                      (LETT |suffix| "p" . #2#)))))))))))))))))
      (COND
       ((SPADCALL |zeroes| 0 (QREFELT $ 116))
        (LETT |suffix| (STRCONC "0" |suffix|) . #2#)))
      (COND
       ((SPADCALL |zeroes| 1 (QREFELT $ 116))
        (LETT |suffix| (STRCONC "0" |suffix|) . #2#)))
      (LETT |gp| (SPADCALL (QREFELT $ 18)) . #2#)
      (LETT |stepI| (COND ((EQUAL |ptype| 'HORIZONTAL) 2) ('T 1)) . #2#)
      (SEQ (LETT |x| (TRUNCATE |minPrimaryNorm|) . #2#)
           (LETT #1# (TRUNCATE |maxPrimaryNorm|) . #2#) G190
           (COND
            ((IF (MINUSP |stepI|)
                 (< |x| #1#)
                 (> |x| #1#))
             (GO G191)))
           (SEQ (LETT |str| (|mathObject2String| |x|) . #2#)
                (LETT |pz|
                      (SPADCALL
                       (SPADCALL
                        (|mul_DF| (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT)
                                  |divn|)
                        0.0 (QREFELT $ 83))
                       |offset| (QREFELT $ 103))
                      . #2#)
                (COND
                 ((EQUAL |ptype| 'VERTICAL)
                  (LETT |pz|
                        (SPADCALL
                         (SPADCALL 0.0
                                   (|mul_DF|
                                    (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT)
                                    |divn|)
                                   (QREFELT $ 83))
                         |offset| (QREFELT $ 103))
                        . #2#)))
                (COND
                 ((EQL |expStep| -1)
                  (SEQ
                   (COND
                    ((SPADCALL |x| 0 (QREFELT $ 116))
                     (COND
                      ((< |x| 10) (LETT |str| (STRCONC "0." |str|) . #2#)))))
                   (COND ((EQL |x| 10) (LETT |str| "1" . #2#)))
                   (COND
                    ((SPADCALL |x| 10 (QREFELT $ 116))
                     (SEQ (LETT |d| (DIVIDE2 |x| 10) . #2#)
                          (EXIT
                           (LETT |str|
                                 (SPADCALL
                                  (LIST (STRINGIMAGE (QCAR |d|)) "."
                                        (STRINGIMAGE (QCDR |d|)))
                                  (QREFELT $ 118))
                                 . #2#)))))
                   (COND
                    ((< |x| 0)
                     (COND
                      ((SPADCALL |x| -10 (QREFELT $ 116))
                       (LETT |str|
                             (SPADCALL
                              (LIST "-0." (|mathObject2String| (- |x|)))
                              (QREFELT $ 118))
                             . #2#)))))
                   (COND ((EQL |x| -10) (LETT |str| "-1" . #2#)))
                   (EXIT
                    (COND
                     ((< |x| -10)
                      (SEQ (LETT |d| (DIVIDE2 (- |x|) 10) . #2#)
                           (EXIT
                            (LETT |str|
                                  (SPADCALL
                                   (LIST "-" (STRINGIMAGE (QCAR |d|)) "."
                                         (STRINGIMAGE (QCDR |d|)))
                                   (QREFELT $ 118))
                                  . #2#))))))))
                 ((SPADCALL |x| 0 (QREFELT $ 119))
                  (LETT |str| (STRCONC |str| |suffix|) . #2#)))
                (EXIT (SPADCALL |gp| |str| 20 |pz| (QREFELT $ 73))))
           (LETT |x| (+ |x| |stepI|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |gp|))))) 

(DEFUN |SCENE;addSceneRuler;$SPTSb$;62| (|n| |ptype| |offset| |bb| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |ptype| |offset| |bb| (QREFELT $ 120))
            |SCENE;addSceneRuler;$SPTSb$;62|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneRuler;SPTR$;63| (|ptype| |offset| |bb| $)
  (SPADCALL |ptype| |offset| (SPADCALL (QCAR |bb|) (QCDR |bb|) (QREFELT $ 10))
            (QREFELT $ 120))) 

(DEFUN |SCENE;addSceneRuler;$SPTR$;64| (|n| |ptype| |offset| |bb| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |ptype| |offset| |bb| (QREFELT $ 122))
            |SCENE;addSceneRuler;$SPTR$;64|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneGraph;Dg2NniB$;65| (|g| |x| |y| |dispArrowName| $)
  (PROG (|tr|)
    (RETURN
     (SEQ
      (LETT |tr|
            (SPADCALL
             (SPADCALL (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT)
                       (FLOAT |y| MOST-POSITIVE-DOUBLE-FLOAT) 0.0
                       (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 90))
                                 (QREFELT $ 91))
                       (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 90))
                                 (QREFELT $ 91))
                       (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 90))
                                 (QREFELT $ 91))
                       (QREFELT $ 125))
             (QREFELT $ 127))
            |SCENE;createSceneGraph;Dg2NniB$;65|)
      (SPADCALL |tr| |g| |dispArrowName| 'NIL (QREFELT $ 129)) (EXIT |tr|))))) 

(DEFUN |SCENE;addSceneGraph;$Dg2NniB$;66| (|n| |g| |x| |y| |dispArrowName| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |g| |x| |y| |dispArrowName| (QREFELT $ 130))
            |SCENE;addSceneGraph;$Dg2NniB$;66|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneMaterial;R$;67| (|mat| $)
  (VECTOR 'MATERIAL NIL (CONS 1 |mat|))) 

(DEFUN |SCENE;addSceneMaterial;$R$;68| (|n| |mat| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |mat| (QREFELT $ 132))
            |SCENE;addSceneMaterial;$R$;68|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneMaterial;Df2S$;69| (|lineW| |lineC| |fillC| $)
  (PROG (|mat|)
    (RETURN
     (SEQ
      (LETT |mat| (VECTOR |lineW| |lineC| |fillC| 1.0)
            |SCENE;createSceneMaterial;Df2S$;69|)
      (EXIT (VECTOR 'MATERIAL NIL (CONS 1 |mat|))))))) 

(DEFUN |SCENE;addSceneMaterial;$Df2S$;70| (|n| |lineW| |lineC| |fillC| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |lineW| |lineC| |fillC| (QREFELT $ 133))
            |SCENE;addSceneMaterial;$Df2S$;70|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneTransform;St$;71| (|tran| $)
  (VECTOR 'TRANSFORM NIL (CONS 4 |tran|))) 

(DEFUN |SCENE;addSceneTransform;$St$;72| (|n| |tran| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |tran| (QREFELT $ 136))
            |SCENE;addSceneTransform;$St$;72|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createArrows2Din2D;M2SNni$;73| (|ptFun| |uSeg| |vSeg| |numPts| $)
  (PROG (|someV| |arrows| |someU| |lp| |outpt| |inPt| |iu| |iv| |vstep|
         |ustep|)
    (RETURN
     (SEQ (LETT |arrows| NIL . #1=(|SCENE;createArrows2Din2D;M2SNni$;73|))
          (LETT |ustep|
                (|div_DF_I|
                 (|sub_DF| (SPADCALL |uSeg| (QREFELT $ 139))
                           (SPADCALL |uSeg| (QREFELT $ 140)))
                 |numPts|)
                . #1#)
          (LETT |vstep|
                (|div_DF_I|
                 (|sub_DF| (SPADCALL |vSeg| (QREFELT $ 139))
                           (SPADCALL |vSeg| (QREFELT $ 140)))
                 |numPts|)
                . #1#)
          (LETT |someV| (SPADCALL |vSeg| (QREFELT $ 140)) . #1#)
          (SEQ (LETT |iv| |numPts| . #1#) G190 (COND ((< |iv| 0) (GO G191)))
               (SEQ
                (COND
                 ((ZEROP |iv|)
                  (LETT |someV| (SPADCALL |vSeg| (QREFELT $ 139)) . #1#)))
                (LETT |lp| NIL . #1#)
                (LETT |someU| (SPADCALL |uSeg| (QREFELT $ 140)) . #1#)
                (SEQ (LETT |iu| |numPts| . #1#) G190
                     (COND ((< |iu| 0) (GO G191)))
                     (SEQ
                      (COND
                       ((ZEROP |iu|)
                        (LETT |someU| (SPADCALL |uSeg| (QREFELT $ 139))
                              . #1#)))
                      (LETT |inPt| (SPADCALL |someU| |someV| (QREFELT $ 83))
                            . #1#)
                      (LETT |outpt| (SPADCALL |inPt| |ptFun|) . #1#)
                      (LETT |lp| (LIST |inPt| |outpt|) . #1#)
                      (LETT |someU| (|add_DF| |someU| |ustep|) . #1#)
                      (EXIT (LETT |arrows| (CONS |lp| |arrows|) . #1#)))
                     (LETT |iu| (+ |iu| -1) . #1#) (GO G190) G191 (EXIT NIL))
                (EXIT (LETT |someV| (|add_DF| |someV| |vstep|) . #1#)))
               (LETT |iv| (+ |iv| -1) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL |arrows| '|variable|
                     (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 90))
                               (QREFELT $ 91))
                     (QREFELT $ 48))))))) 

(DEFUN |SCENE;addArrows2Din2D;$M2SNni$;74|
       (|n| |ptFun| |uSeg| |vSeg| |numPts| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |ptFun| |uSeg| |vSeg| |numPts| (QREFELT $ 142))
            |SCENE;addArrows2Din2D;$M2SNni$;74|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;addChild!;2$V;75| (|n| |c| $)
  (QSETVELT |n| 1 (SPADCALL (QVELT |n| 1) |c| (QREFELT $ 145)))) 

(PUT '|SCENE;removeChild!;2$V;76| '|SPADreplace|
     '(XLAM (|n| |c|) (|error| "removeChild! not yet implemented"))) 

(DEFUN |SCENE;removeChild!;2$V;76| (|n| |c| $)
  (|error| "removeChild! not yet implemented")) 

(DEFUN |SCENE;setTransform!;$StV;77| (|n| |tran| $)
  (COND
   ((SPADCALL (QVELT |n| 0) 'TRANSFORM (QREFELT $ 147))
    (|error| "use setTransform! on transform only"))
   ('T (QSETVELT |n| 2 (CONS 4 |tran|))))) 

(DEFUN |SCENE;pathString| (|pts| |tran| |bb| |sc| |clipEn| |useInteger| $)
  (PROG (|lastValid| |ptStr| |thisStr| |minusy| |pntNum| |valid| |param2|
         #1=#:G982 |param| #2=#:G981 |line|)
    (RETURN
     (SEQ (LETT |ptStr| "" . #3=(|SCENE;pathString|))
          (LETT |lastValid| 'T . #3#)
          (SEQ (LETT |line| NIL . #3#) (LETT #2# |pts| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |line| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |pntNum| 0 . #3#)
                    (EXIT
                     (SEQ (LETT |param| NIL . #3#) (LETT #1# |line| . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |param| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |param2|
                                 (SPADCALL |tran| |param| (QREFELT $ 149))
                                 . #3#)
                           (LETT |valid|
                                 (COND
                                  (|clipEn|
                                   (SPADCALL |bb| |param| (QREFELT $ 150)))
                                  ('T 'T))
                                 . #3#)
                           (COND
                            (|valid|
                             (SEQ (LETT |pntNum| (+ |pntNum| 1) . #3#)
                                  (COND
                                   ((SPADCALL |ptStr| "" (QREFELT $ 151))
                                    (LETT |ptStr| (STRCONC |ptStr| " ")
                                          . #3#)))
                                  (COND
                                   (|lastValid|
                                    (SEQ
                                     (COND
                                      ((EQL |pntNum| 1)
                                       (LETT |ptStr| (STRCONC |ptStr| "M")
                                             . #3#)))
                                     (EXIT
                                      (COND
                                       ((EQL |pntNum| 2)
                                        (LETT |ptStr| (STRCONC |ptStr| "L")
                                              . #3#)))))))
                                  (COND
                                   ((NULL |lastValid|)
                                    (LETT |ptStr| (STRCONC |ptStr| "M")
                                          . #3#)))
                                  (LETT |minusy|
                                        (|minus_DF|
                                         (|mul_DF|
                                          (SPADCALL |param2| (QREFELT $ 82))
                                          |sc|))
                                        . #3#)
                                  (COND
                                   (|useInteger|
                                    (LETT |thisStr|
                                          (SPADCALL
                                           (LIST
                                            (STRINGIMAGE
                                             (TRUNCATE
                                              (|mul_DF|
                                               (SPADCALL |param2|
                                                         (QREFELT $ 81))
                                               |sc|)))
                                            ","
                                            (STRINGIMAGE (TRUNCATE |minusy|)))
                                           (QREFELT $ 118))
                                          . #3#))
                                   ('T
                                    (LETT |thisStr|
                                          (SPADCALL
                                           (LIST
                                            (|mathObject2String|
                                             (|mul_DF|
                                              (SPADCALL |param2|
                                                        (QREFELT $ 81))
                                              |sc|))
                                            "," (|mathObject2String| |minusy|))
                                           (QREFELT $ 118))
                                          . #3#)))
                                  (EXIT
                                   (LETT |ptStr| (STRCONC |ptStr| |thisStr|)
                                         . #3#)))))
                           (EXIT (LETT |lastValid| |valid| . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |ptStr|))))) 

(DEFUN |SCENE;shorternArrow| (|pts| |bb| $)
  (PROG (|newend| |newstart| |relpt| #1=#:G987 |reductionFactor| |arrLength|
         |endpt| |startpt| |totalwidth|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |totalwidth|
              (SPADCALL
               (SPADCALL (SPADCALL |bb| (QREFELT $ 37))
                         (SPADCALL |bb| (QREFELT $ 38)) (QREFELT $ 39))
               (QREFELT $ 81))
              . #2=(|SCENE;shorternArrow|))
        (LETT |startpt| (QCAR |pts|) . #2#) (LETT |endpt| (QCDR |pts|) . #2#)
        (LETT |arrLength| (SPADCALL |startpt| |endpt| (QREFELT $ 152)) . #2#)
        (COND
         ((|less_DF| |arrLength|
                     (SPADCALL (SPADCALL 1 -1 10 (QREFELT $ 90))
                               (QREFELT $ 91)))
          (PROGN (LETT #1# |pts| . #2#) (GO #1#))))
        (LETT |reductionFactor|
              (|div_DF| |totalwidth|
                        (|mul_DF|
                         (SPADCALL (SPADCALL 40 0 10 (QREFELT $ 90))
                                   (QREFELT $ 91))
                         |arrLength|))
              . #2#)
        (COND
         ((SPADCALL |reductionFactor|
                    (SPADCALL (SPADCALL 4 -1 10 (QREFELT $ 90)) (QREFELT $ 91))
                    (QREFELT $ 155))
          (PROGN (LETT #1# |pts| . #2#) (GO #1#))))
        (LETT |relpt| (SPADCALL |endpt| |startpt| (QREFELT $ 39)) . #2#)
        (LETT |newstart|
              (SPADCALL |startpt|
                        (SPADCALL |reductionFactor| |relpt| (QREFELT $ 104))
                        (QREFELT $ 103))
              . #2#)
        (LETT |newend|
              (SPADCALL |startpt|
                        (SPADCALL
                         (|sub_DF|
                          (SPADCALL (SPADCALL 1 0 10 (QREFELT $ 90))
                                    (QREFELT $ 91))
                          |reductionFactor|)
                         |relpt| (QREFELT $ 104))
                        (QREFELT $ 103))
              . #2#)
        (EXIT (CONS |newstart| |newend|))))
      #1# (EXIT #1#))))) 

(DEFUN |SCENE;lineArrow|
       (|pts| |tran| |bb| |mat| |sc| |clipEn| |mode| |size| $)
  (PROG (|nodeEles| |x| |nodeAtts| |linWidth| |ptStr| |thisStr| |minusEndy|
         |endPoint| |minusStarty| |aline| |startPoint| |pntNum| |valid|
         |param2| #1=#:G1004 |param| #2=#:G1003 |line|)
    (RETURN
     (SEQ (LETT |nodeEles| NIL . #3=(|SCENE;lineArrow|))
          (SEQ (LETT |line| NIL . #3#) (LETT #2# |pts| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |line| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |pntNum| 0 . #3#) (LETT |ptStr| "" . #3#)
                    (LETT |startPoint| (SPADCALL 0 0 (QREFELT $ 14)) . #3#)
                    (LETT |endPoint| (SPADCALL 0 0 (QREFELT $ 14)) . #3#)
                    (SEQ (LETT |param| NIL . #3#) (LETT #1# |line| . #3#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |param| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |param2|
                                (SPADCALL |tran| |param| (QREFELT $ 149))
                                . #3#)
                          (LETT |valid|
                                (COND
                                 (|clipEn|
                                  (SPADCALL |bb| |param| (QREFELT $ 150)))
                                 ('T 'T))
                                . #3#)
                          (EXIT
                           (COND
                            (|valid|
                             (SEQ (LETT |pntNum| (+ |pntNum| 1) . #3#)
                                  (COND
                                   ((SPADCALL |ptStr| "" (QREFELT $ 151))
                                    (LETT |ptStr| (STRCONC |ptStr| " ")
                                          . #3#)))
                                  (COND
                                   ((EQL |pntNum| 1)
                                    (SEQ
                                     (LETT |ptStr| (STRCONC |ptStr| "M") . #3#)
                                     (EXIT
                                      (LETT |startPoint| |param2| . #3#)))))
                                  (COND
                                   ((EQL |pntNum| 2)
                                    (SEQ (LETT |endPoint| |param2| . #3#)
                                         (LETT |aline|
                                               (CONS |startPoint| |endPoint|)
                                               . #3#)
                                         (COND
                                          ((EQUAL |mode| '|proportional|)
                                           (LETT |aline|
                                                 (|SCENE;shorternArrow|
                                                  (CONS |startPoint|
                                                        |endPoint|)
                                                  |bb| $)
                                                 . #3#)))
                                         (LETT |minusStarty|
                                               (|minus_DF|
                                                (|mul_DF|
                                                 (SPADCALL (QCAR |aline|)
                                                           (QREFELT $ 82))
                                                 |sc|))
                                               . #3#)
                                         (LETT |minusEndy|
                                               (|minus_DF|
                                                (|mul_DF|
                                                 (SPADCALL (QCDR |aline|)
                                                           (QREFELT $ 82))
                                                 |sc|))
                                               . #3#)
                                         (LETT |thisStr|
                                               (SPADCALL
                                                (LIST
                                                 (|mathObject2String|
                                                  (|mul_DF|
                                                   (SPADCALL (QCAR |aline|)
                                                             (QREFELT $ 81))
                                                   |sc|))
                                                 ","
                                                 (|mathObject2String|
                                                  |minusStarty|)
                                                 "L"
                                                 (|mathObject2String|
                                                  (|mul_DF|
                                                   (SPADCALL (QCDR |aline|)
                                                             (QREFELT $ 81))
                                                   |sc|))
                                                 ","
                                                 (|mathObject2String|
                                                  |minusEndy|))
                                                (QREFELT $ 118))
                                               . #3#)
                                         (EXIT
                                          (LETT |ptStr|
                                                (STRCONC |ptStr| |thisStr|)
                                                . #3#)))))
                                  (EXIT
                                   (COND
                                    ((SPADCALL |pntNum| 2 (QREFELT $ 156))
                                     (SEQ (LETT |endPoint| |param2| . #3#)
                                          (LETT |minusEndy|
                                                (|minus_DF|
                                                 (|mul_DF|
                                                  (SPADCALL |endPoint|
                                                            (QREFELT $ 82))
                                                  |sc|))
                                                . #3#)
                                          (LETT |thisStr|
                                                (SPADCALL
                                                 (LIST "L"
                                                       (|mathObject2String|
                                                        (|mul_DF|
                                                         (SPADCALL |endPoint|
                                                                   (QREFELT $
                                                                            81))
                                                         |sc|))
                                                       ","
                                                       (|mathObject2String|
                                                        |minusEndy|))
                                                 (QREFELT $ 118))
                                                . #3#)
                                          (EXIT
                                           (LETT |ptStr|
                                                 (STRCONC |ptStr| |thisStr|)
                                                 . #3#)))))))))))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND
                      ((SPADCALL |ptStr| "" (QREFELT $ 151))
                       (SEQ
                        (COND
                         ((|less_DF|
                           (SPADCALL |startPoint| |endPoint| (QREFELT $ 152))
                           (SPADCALL (SPADCALL 1 -2 10 (QREFELT $ 90))
                                     (QREFELT $ 91)))
                          (LETT |ptStr|
                                (SPADCALL
                                 (LIST "M "
                                       (|mathObject2String|
                                        (|mul_DF|
                                         (SPADCALL |startPoint| (QREFELT $ 81))
                                         |sc|))
                                       ","
                                       (|mathObject2String|
                                        (|minus_DF|
                                         (|mul_DF|
                                          (SPADCALL |startPoint|
                                                    (QREFELT $ 82))
                                          |sc|)))
                                       "c -50,25 -50,-50 0,-25")
                                 (QREFELT $ 118))
                                . #3#)))
                        (LETT |linWidth| (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)
                              . #3#)
                        (COND
                         ((EQUAL |mode| '|proportional|)
                          (LETT |linWidth|
                                (|mul_DF|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |bb| (QREFELT $ 37))
                                            (SPADCALL |bb| (QREFELT $ 38))
                                            (QREFELT $ 39))
                                  (QREFELT $ 81))
                                 |size|)
                                . #3#)))
                        (COND
                         ((EQUAL |mode| '|variable|)
                          (LETT |linWidth|
                                (|mul_DF|
                                 (SPADCALL |startPoint| |endPoint|
                                           (QREFELT $ 152))
                                 |size|)
                                . #3#)))
                        (LETT |nodeAtts|
                              (LIST (SPADCALL "d" |ptStr| (QREFELT $ 158))
                                    (SPADCALL "fill" "none" (QREFELT $ 158))
                                    (SPADCALL "stroke" (QVELT |mat| 1)
                                              (QREFELT $ 158))
                                    (SPADCALL "stroke-width"
                                              (|mathObject2String| |linWidth|)
                                              (QREFELT $ 158))
                                    (SPADCALL "style" "marker-end:url(#Arrow)"
                                              (QREFELT $ 158)))
                              . #3#)
                        (LETT |x|
                              (SPADCALL "path" NIL |nodeAtts| (QREFELT $ 161))
                              . #3#)
                        (EXIT
                         (LETT |nodeEles|
                               (SPADCALL |nodeEles| |x| (QREFELT $ 163))
                               . #3#)))))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |nodeEles|))))) 

(DEFUN |SCENE;faceString| (|faces| |tran| |bb| |sc| |clipEn| $)
  (PROG (|ptStr| |lastValid| |thisStr| |minusy| |pntNum| |valid| |param2|
         |param| #1=#:G1017 |i| #2=#:G1016 |ln|)
    (RETURN
     (SEQ (LETT |ptStr| "" . #3=(|SCENE;faceString|))
          (LETT |lastValid| 'T . #3#)
          (SEQ (LETT |ln| NIL . #3#) (LETT #2# (QCAR |faces|) . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |ln| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |pntNum| 0 . #3#)
                    (SEQ (LETT |i| NIL . #3#) (LETT #1# |ln| . #3#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |i| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |param|
                                (SPADCALL (QCDR |faces|) (+ |i| 1)
                                          (QREFELT $ 102))
                                . #3#)
                          (LETT |param2|
                                (SPADCALL |tran| |param| (QREFELT $ 149))
                                . #3#)
                          (LETT |valid|
                                (COND
                                 (|clipEn|
                                  (SPADCALL |bb| |param| (QREFELT $ 150)))
                                 ('T 'T))
                                . #3#)
                          (COND
                           (|valid|
                            (SEQ (LETT |pntNum| (+ |pntNum| 1) . #3#)
                                 (COND
                                  ((SPADCALL |ptStr| "" (QREFELT $ 151))
                                   (LETT |ptStr| (STRCONC |ptStr| " ") . #3#)))
                                 (COND
                                  (|lastValid|
                                   (SEQ
                                    (COND
                                     ((EQL |pntNum| 1)
                                      (LETT |ptStr| (STRCONC |ptStr| "M")
                                            . #3#)))
                                    (EXIT
                                     (COND
                                      ((EQL |pntNum| 2)
                                       (LETT |ptStr| (STRCONC |ptStr| "L")
                                             . #3#)))))))
                                 (COND
                                  ((NULL |lastValid|)
                                   (LETT |ptStr| (STRCONC |ptStr| "M") . #3#)))
                                 (LETT |minusy|
                                       (|minus_DF|
                                        (|mul_DF|
                                         (SPADCALL |param2| (QREFELT $ 82))
                                         |sc|))
                                       . #3#)
                                 (LETT |thisStr|
                                       (SPADCALL
                                        (LIST
                                         (|mathObject2String|
                                          (|mul_DF|
                                           (SPADCALL |param2| (QREFELT $ 81))
                                           |sc|))
                                         "," (|mathObject2String| |minusy|))
                                        (QREFELT $ 118))
                                       . #3#)
                                 (EXIT
                                  (LETT |ptStr| (STRCONC |ptStr| |thisStr|)
                                        . #3#)))))
                          (EXIT (LETT |lastValid| |valid| . #3#)))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |ptStr| (STRCONC |ptStr| "z") . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |ptStr|))))) 

(DEFUN |SCENE;toSVG;$RStSbDf2BSnpXe;82|
       (|n| |mat| |tran| |bb| |scale| |clipEn| |useInteger| |npt| $)
  (PROG (|nodeEles| |xch| #1=#:G1102 |ch| |nodeName| |nde| |name| |nn|
         #2=#:G1035 #3=#:G1036 |nodeAtts| |linWidth| #4=#:G1033 |ptStr|
         |endPointM| |startPointM| |endPoint| |startPoint| #5=#:G1032
         #6=#:G1100 #7=#:G1031 |bb2| #8=#:G1029 |clipEn2| |tran2| #9=#:G1030
         #10=#:G1028 |param2| |nodeAttsTxt| #11=#:G1101 |nam| |mat2|
         #12=#:G1027 #13=#:G1034 |sh| |sw| |sy| |sx| |ry| |rx| |r2| #14=#:G1026
         |viewBoxStr| |offsety| |offsetx| |scale2| |maxy| |maxx| |miny| |minx|
         |mkr| |mkrAtts| |pth| |pthAtts| |np2|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |bb2| |bb| . #15=(|SCENE;toSVG;$RStSbDf2BSnpXe;82|))
            (LETT |tran2| |tran| . #15#) (LETT |mat2| |mat| . #15#)
            (LETT |np2| |npt| . #15#) (LETT |clipEn2| |clipEn| . #15#)
            (LETT |scale2| |scale| . #15#) (LETT |nodeEles| NIL . #15#)
            (LETT |nodeAtts| NIL . #15#) (LETT |nodeName| "" . #15#)
            (COND
             ((EQUAL (QVELT |n| 0) 'ROOT)
              (SEQ (LETT |nodeName| "svg" . #15#)
                   (LETT |pthAtts|
                         (LIST
                          (SPADCALL "d"
                                    "M 0.0,0.0 L 5.0,-5.0 L -12.5,0.0 L 5.0,5.0 L 0.0,0.0 z "
                                    (QREFELT $ 158))
                          (SPADCALL "style"
                                    "fill-rule:evenodd;stroke:#000000;stroke-width:1.0pt;marker-start:none;"
                                    (QREFELT $ 158))
                          (SPADCALL "transform"
                                    "scale(0.4) rotate(180) translate(10,0)"
                                    (QREFELT $ 158)))
                         . #15#)
                   (LETT |pth| (SPADCALL "path" NIL |pthAtts| (QREFELT $ 161))
                         . #15#)
                   (LETT |mkrAtts|
                         (LIST (SPADCALL "orient" "auto" (QREFELT $ 158))
                               (SPADCALL "refY" "0.0" (QREFELT $ 158))
                               (SPADCALL "refX" "0.0" (QREFELT $ 158))
                               (SPADCALL "id" "Arrow" (QREFELT $ 158))
                               (SPADCALL "style" "overflow:visible"
                                         (QREFELT $ 158)))
                         . #15#)
                   (LETT |mkr|
                         (SPADCALL "marker" (LIST |pth|) |mkrAtts|
                                   (QREFELT $ 161))
                         . #15#)
                   (LETT |nodeEles|
                         (LIST
                          (SPADCALL "defs" (LIST |mkr|) NIL (QREFELT $ 161)))
                         . #15#)
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 3))
                     (|error| "toSVG parameter type not valid for root node")))
                   (LETT |bb2|
                         (PROG2 (LETT #8# (QVELT |n| 2) . #15#)
                             (QCDR #8#)
                           (|check_union| (QEQCAR #8# 3)
                                          (|SBoundary| (QREFELT $ 6)) #8#))
                         . #15#)
                   (COND
                    ((SPADCALL |bb2| (QREFELT $ 164))
                     (LETT |bb2| (SPADCALL |n| 1.0 (QREFELT $ 26)) . #15#)))
                   (COND
                    ((SPADCALL |bb2| (QREFELT $ 164))
                     (|error| "scene contains no drawable elements")))
                   (LETT |minx|
                         (SPADCALL (SPADCALL |bb2| (QREFELT $ 38))
                                   (QREFELT $ 81))
                         . #15#)
                   (LETT |miny|
                         (SPADCALL (SPADCALL |bb2| (QREFELT $ 38))
                                   (QREFELT $ 82))
                         . #15#)
                   (LETT |maxx|
                         (SPADCALL (SPADCALL |bb2| (QREFELT $ 37))
                                   (QREFELT $ 81))
                         . #15#)
                   (LETT |maxy|
                         (SPADCALL (SPADCALL |bb2| (QREFELT $ 37))
                                   (QREFELT $ 82))
                         . #15#)
                   (LETT |scale2|
                         (|div_DF| (FLOAT 1000 MOST-POSITIVE-DOUBLE-FLOAT)
                                   (|sub_DF| |maxx| |minx|))
                         . #15#)
                   (LETT |offsetx| (|minus_DF| |minx|) . #15#)
                   (LETT |offsety| (|minus_DF| |maxy|) . #15#)
                   (LETT |tran2|
                         (SPADCALL |offsetx| |offsety| 0.0 1.0 1.0 1.0
                                   (QREFELT $ 165))
                         . #15#)
                   (COND
                    (|useInteger|
                     (LETT |viewBoxStr|
                           (SPADCALL
                            (LIST "0 0 "
                                  (|mathObject2String|
                                   (TRUNCATE
                                    (|mul_DF| (|sub_DF| |maxx| |minx|)
                                              |scale2|)))
                                  " "
                                  (|mathObject2String|
                                   (TRUNCATE
                                    (|mul_DF| (|sub_DF| |maxy| |miny|)
                                              |scale2|))))
                            (QREFELT $ 118))
                           . #15#))
                    (#16='T
                     (LETT |viewBoxStr|
                           (SPADCALL
                            (LIST "0.0 0.0 "
                                  (|mathObject2String|
                                   (|mul_DF| (|sub_DF| |maxx| |minx|)
                                             |scale2|))
                                  " "
                                  (|mathObject2String|
                                   (|mul_DF| (|sub_DF| |maxy| |miny|)
                                             |scale2|)))
                            (QREFELT $ 118))
                           . #15#)))
                   (EXIT
                    (LETT |nodeAtts|
                          (LIST
                           (SPADCALL "xmlns" "http://www.w3.org/2000/svg"
                                     (QREFELT $ 158))
                           (SPADCALL "width" "12cm" (QREFELT $ 158))
                           (SPADCALL "height" "8cm" (QREFELT $ 158))
                           (SPADCALL "viewBox" |viewBoxStr| (QREFELT $ 158)))
                          . #15#)))))
            (COND ((EQUAL (QVELT |n| 0) 'GROUP) (LETT |nodeName| "g" . #15#)))
            (COND
             ((EQUAL (QVELT |n| 0) 'LINE)
              (SEQ
               (COND
                ((NULL (QEQCAR (QVELT |n| 2) 0))
                 (|error| "toSVG parameter type not valid for line node")))
               (LETT |nodeName| "path" . #15#)
               (LETT |nodeAtts|
                     (LIST
                      (SPADCALL "d"
                                (|SCENE;pathString|
                                 (PROG2 (LETT #14# (QVELT |n| 2) . #15#)
                                     (QCDR #14#)
                                   (|check_union| (QEQCAR #14# 0)
                                                  (|List|
                                                   (|List| (QREFELT $ 6)))
                                                  #14#))
                                 |tran2| |bb2| |scale2| |clipEn2| |useInteger|
                                 $)
                                (QREFELT $ 158))
                      (SPADCALL "fill" "none" (QREFELT $ 158))
                      (SPADCALL "stroke" (QVELT |mat2| 1) (QREFELT $ 158))
                      (SPADCALL "stroke-width"
                                (|mathObject2String| (QVELT |mat2| 0))
                                (QREFELT $ 158))
                      (SPADCALL "stroke-linecap" "butt" (QREFELT $ 158))
                      (SPADCALL "stroke-linejoin" "miter" (QREFELT $ 158)))
                     . #15#)
               (EXIT
                (COND
                 ((|less_DF| (QVELT |mat2| 3)
                             (SPADCALL (SPADCALL 95 -2 10 (QREFELT $ 90))
                                       (QREFELT $ 91)))
                  (LETT |nodeAtts|
                        (SPADCALL |nodeAtts|
                                  (SPADCALL "stroke-opacity"
                                            (|mathObject2String|
                                             (QVELT |mat2| 3))
                                            (QREFELT $ 158))
                                  (QREFELT $ 166))
                        . #15#)))))))
            (COND
             ((EQUAL (QVELT |n| 0) 'SHAPE)
              (SEQ
               (COND
                ((NULL (QEQCAR (QVELT |n| 2) 8))
                 (|error| "toSVG parameter type not valid for shape node")))
               (LETT |param2|
                     (SPADCALL |tran|
                               (QVELT
                                (PROG2 (LETT #13# (QVELT |n| 2) . #15#)
                                    (QCDR #13#)
                                  (|check_union| (QEQCAR #13# 8)
                                                 (|Record|
                                                  (|:| |shptype| (|Symbol|))
                                                  (|:| |centre| (QREFELT $ 6))
                                                  (|:| |size| (QREFELT $ 6))
                                                  (|:| |fill| (|Boolean|)))
                                                 #13#))
                                1)
                               (QREFELT $ 149))
                     . #15#)
               (LETT |r2|
                     (SPADCALL |tran|
                               (QVELT
                                (PROG2 (LETT #13# (QVELT |n| 2) . #15#)
                                    (QCDR #13#)
                                  (|check_union| (QEQCAR #13# 8)
                                                 (|Record|
                                                  (|:| |shptype| (|Symbol|))
                                                  (|:| |centre| (QREFELT $ 6))
                                                  (|:| |size| (QREFELT $ 6))
                                                  (|:| |fill| (|Boolean|)))
                                                 #13#))
                                2)
                               (QREFELT $ 149))
                     . #15#)
               (LETT |rx| (|mul_DF| (SPADCALL |r2| (QREFELT $ 81)) |scale2|)
                     . #15#)
               (LETT |ry| (|mul_DF| (SPADCALL |r2| (QREFELT $ 82)) |scale2|)
                     . #15#)
               (LETT |nodeName| "ellipse" . #15#) (LETT |sx| "x" . #15#)
               (LETT |sy| "y" . #15#) (LETT |sw| "width" . #15#)
               (LETT |sh| "height" . #15#)
               (COND
                ((EQUAL
                  (QVELT
                   (PROG2 (LETT #13# (QVELT |n| 2) . #15#)
                       (QCDR #13#)
                     (|check_union| (QEQCAR #13# 8)
                                    (|Record| (|:| |shptype| (|Symbol|))
                                              (|:| |centre| (QREFELT $ 6))
                                              (|:| |size| (QREFELT $ 6))
                                              (|:| |fill| (|Boolean|)))
                                    #13#))
                   0)
                  '|rect|)
                 (SEQ (LETT |nodeName| "rect" . #15#) (LETT |sx| "x" . #15#)
                      (LETT |sy| "y" . #15#) (LETT |sw| "width" . #15#)
                      (LETT |sh| "height" . #15#)
                      (EXIT
                       (LETT |param2|
                             (SPADCALL |param2|
                                       (SPADCALL 0.0
                                                 (SPADCALL |r2| (QREFELT $ 82))
                                                 (QREFELT $ 83))
                                       (QREFELT $ 103))
                             . #15#)))))
               (COND
                ((EQUAL
                  (QVELT
                   (PROG2 (LETT #13# (QVELT |n| 2) . #15#)
                       (QCDR #13#)
                     (|check_union| (QEQCAR #13# 8)
                                    (|Record| (|:| |shptype| (|Symbol|))
                                              (|:| |centre| (QREFELT $ 6))
                                              (|:| |size| (QREFELT $ 6))
                                              (|:| |fill| (|Boolean|)))
                                    #13#))
                   0)
                  '|ellipse|)
                 (SEQ (LETT |nodeName| "ellipse" . #15#)
                      (LETT |sx| "cx" . #15#) (LETT |sy| "cy" . #15#)
                      (LETT |sw| "rx" . #15#) (EXIT (LETT |sh| "ry" . #15#)))))
               (COND
                ((EQUAL
                  (QVELT
                   (PROG2 (LETT #13# (QVELT |n| 2) . #15#)
                       (QCDR #13#)
                     (|check_union| (QEQCAR #13# 8)
                                    (|Record| (|:| |shptype| (|Symbol|))
                                              (|:| |centre| (QREFELT $ 6))
                                              (|:| |size| (QREFELT $ 6))
                                              (|:| |fill| (|Boolean|)))
                                    #13#))
                   0)
                  '|box|)
                 (SEQ (LETT |nodeName| "rect" . #15#) (LETT |sx| "x" . #15#)
                      (LETT |sy| "y" . #15#) (LETT |sw| "width" . #15#)
                      (LETT |sh| "height" . #15#)
                      (EXIT
                       (LETT |param2|
                             (SPADCALL |param2|
                                       (SPADCALL 0.0
                                                 (SPADCALL |r2| (QREFELT $ 82))
                                                 (QREFELT $ 83))
                                       (QREFELT $ 103))
                             . #15#)))))
               (COND
                ((EQUAL
                  (QVELT
                   (PROG2 (LETT #13# (QVELT |n| 2) . #15#)
                       (QCDR #13#)
                     (|check_union| (QEQCAR #13# 8)
                                    (|Record| (|:| |shptype| (|Symbol|))
                                              (|:| |centre| (QREFELT $ 6))
                                              (|:| |size| (QREFELT $ 6))
                                              (|:| |fill| (|Boolean|)))
                                    #13#))
                   0)
                  '|sphere|)
                 (SEQ (LETT |nodeName| "ellipse" . #15#)
                      (LETT |sx| "cx" . #15#) (LETT |sy| "cy" . #15#)
                      (LETT |sw| "rx" . #15#) (EXIT (LETT |sh| "ry" . #15#)))))
               (LETT |nodeAtts|
                     (LIST (SPADCALL "stroke" (QVELT |mat2| 1) (QREFELT $ 158))
                           (SPADCALL "stroke-width"
                                     (|mathObject2String| (QVELT |mat2| 0))
                                     (QREFELT $ 158))
                           (SPADCALL |sx|
                                     (|mathObject2String|
                                      (|mul_DF|
                                       (SPADCALL |param2| (QREFELT $ 81))
                                       |scale2|))
                                     (QREFELT $ 158))
                           (SPADCALL |sy|
                                     (|mathObject2String|
                                      (|minus_DF|
                                       (|mul_DF|
                                        (SPADCALL |param2| (QREFELT $ 82))
                                        |scale2|)))
                                     (QREFELT $ 158))
                           (SPADCALL |sw| (|mathObject2String| |rx|)
                                     (QREFELT $ 158))
                           (SPADCALL |sh| (|mathObject2String| |ry|)
                                     (QREFELT $ 158)))
                     . #15#)
               (COND
                ((QVELT
                  (PROG2 (LETT #13# (QVELT |n| 2) . #15#)
                      (QCDR #13#)
                    (|check_union| (QEQCAR #13# 8)
                                   (|Record| (|:| |shptype| (|Symbol|))
                                             (|:| |centre| (QREFELT $ 6))
                                             (|:| |size| (QREFELT $ 6))
                                             (|:| |fill| (|Boolean|)))
                                   #13#))
                  3)
                 (LETT |nodeAtts|
                       (SPADCALL |nodeAtts|
                                 (SPADCALL "fill"
                                           (|mathObject2String|
                                            (QVELT |mat2| 2))
                                           (QREFELT $ 158))
                                 (QREFELT $ 166))
                       . #15#))
                (#16#
                 (LETT |nodeAtts|
                       (SPADCALL |nodeAtts|
                                 (SPADCALL "fill" "none" (QREFELT $ 158))
                                 (QREFELT $ 166))
                       . #15#)))
               (EXIT
                (COND
                 ((|less_DF| (QVELT |mat2| 3)
                             (SPADCALL (SPADCALL 95 -2 10 (QREFELT $ 90))
                                       (QREFELT $ 91)))
                  (LETT |nodeAtts|
                        (SPADCALL |nodeAtts|
                                  (SPADCALL "opacity"
                                            (|mathObject2String|
                                             (QVELT |mat2| 3))
                                            (QREFELT $ 158))
                                  (QREFELT $ 166))
                        . #15#)))))))
            (COND
             ((EQUAL (QVELT |n| 0) 'MATERIAL)
              (SEQ (LETT |nodeName| "g" . #15#)
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 1))
                     (|error|
                      "toSVG parameter type not valid for material node")))
                   (EXIT
                    (LETT |mat2|
                          (PROG2 (LETT #12# (QVELT |n| 2) . #15#)
                              (QCDR #12#)
                            (|check_union| (QEQCAR #12# 1)
                                           (|Record|
                                            (|:| |lineWidth| (|DoubleFloat|))
                                            (|:| |lineCol| (|String|))
                                            (|:| |fillCol| (|String|))
                                            (|:| |matOpacity| (|DoubleFloat|)))
                                           #12#))
                          . #15#)))))
            (COND
             ((EQUAL (QVELT |n| 0) 'TEXT)
              (SEQ (LETT |nodeName| "text" . #15#)
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 2))
                     (|error| "toSVG parameter type not valid for text node")))
                   (COND
                    ((SPADCALL
                      (QVELT
                       (PROG2 (LETT #10# (QVELT |n| 2) . #15#)
                           (QCDR #10#)
                         (|check_union| (QEQCAR #10# 2)
                                        (|Record| (|:| |txt| (|String|))
                                                  (|:| |siz|
                                                       (|NonNegativeInteger|))
                                                  (|:| |pos| (QREFELT $ 6))
                                                  (|:| |np|
                                                       (|List| (|String|))))
                                        #10#))
                       3)
                      NIL (QREFELT $ 167))
                     (SEQ
                      (SEQ (LETT |nam| NIL . #15#)
                           (LETT #11#
                                 (QVELT
                                  (PROG2 (LETT #10# (QVELT |n| 2) . #15#)
                                      (QCDR #10#)
                                    (|check_union| (QEQCAR #10# 2)
                                                   (|Record|
                                                    (|:| |txt| (|String|))
                                                    (|:| |siz|
                                                         (|NonNegativeInteger|))
                                                    (|:| |pos| (QREFELT $ 6))
                                                    (|:| |np|
                                                         (|List| (|String|))))
                                                   #10#))
                                  3)
                                 . #15#)
                           G190
                           (COND
                            ((OR (ATOM #11#)
                                 (PROGN (LETT |nam| (CAR #11#) . #15#) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |param2|
                                  (SPADCALL |tran|
                                            (SPADCALL
                                             (SPADCALL |np2| |nam|
                                                       (QREFELT $ 168))
                                             (QVELT
                                              (PROG2
                                                  (LETT #10# (QVELT |n| 2)
                                                        . #15#)
                                                  (QCDR #10#)
                                                (|check_union| (QEQCAR #10# 2)
                                                               (|Record|
                                                                (|:| |txt|
                                                                     (|String|))
                                                                (|:| |siz|
                                                                     (|NonNegativeInteger|))
                                                                (|:| |pos|
                                                                     (QREFELT $
                                                                              6))
                                                                (|:| |np|
                                                                     (|List|
                                                                      (|String|))))
                                                               #10#))
                                              2)
                                             (QREFELT $ 103))
                                            (QREFELT $ 149))
                                  . #15#)
                            (LETT |nodeAttsTxt|
                                  (LIST
                                   (SPADCALL "font-size"
                                             (STRINGIMAGE
                                              (QVELT
                                               (PROG2
                                                   (LETT #10# (QVELT |n| 2)
                                                         . #15#)
                                                   (QCDR #10#)
                                                 (|check_union| (QEQCAR #10# 2)
                                                                (|Record|
                                                                 (|:| |txt|
                                                                      (|String|))
                                                                 (|:| |siz|
                                                                      (|NonNegativeInteger|))
                                                                 (|:| |pos|
                                                                      (QREFELT
                                                                       $ 6))
                                                                 (|:| |np|
                                                                      (|List|
                                                                       (|String|))))
                                                                #10#))
                                               1))
                                             (QREFELT $ 158))
                                   (SPADCALL "x"
                                             (|mathObject2String|
                                              (|mul_DF|
                                               (SPADCALL |param2|
                                                         (QREFELT $ 81))
                                               |scale2|))
                                             (QREFELT $ 158))
                                   (SPADCALL "y"
                                             (|mathObject2String|
                                              (|minus_DF|
                                               (|mul_DF|
                                                (SPADCALL |param2|
                                                          (QREFELT $ 82))
                                                |scale2|)))
                                             (QREFELT $ 158))
                                   (SPADCALL "style"
                                             (STRCONC "fill:" (QVELT |mat2| 2))
                                             (QREFELT $ 158)))
                                  . #15#)
                            (LETT |xch|
                                  (SPADCALL |nodeName| |nam| |nodeAttsTxt|
                                            (QREFELT $ 169))
                                  . #15#)
                            (EXIT
                             (COND
                              ((NULL (SPADCALL |xch| (QREFELT $ 170)))
                               (LETT |nodeEles|
                                     (SPADCALL |nodeEles| |xch|
                                               (QREFELT $ 163))
                                     . #15#)))))
                           (LETT #11# (CDR #11#) . #15#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (PROGN
                        (LETT #6#
                              (SPADCALL "g" |nodeEles| |nodeAtts|
                                        (QREFELT $ 161))
                              . #15#)
                        (GO #6#))))))
                   (LETT |param2|
                         (SPADCALL |tran|
                                   (QVELT
                                    (PROG2 (LETT #10# (QVELT |n| 2) . #15#)
                                        (QCDR #10#)
                                      (|check_union| (QEQCAR #10# 2)
                                                     (|Record|
                                                      (|:| |txt| (|String|))
                                                      (|:| |siz|
                                                           (|NonNegativeInteger|))
                                                      (|:| |pos| (QREFELT $ 6))
                                                      (|:| |np|
                                                           (|List|
                                                            (|String|))))
                                                     #10#))
                                    2)
                                   (QREFELT $ 149))
                         . #15#)
                   (LETT |nodeAtts|
                         (LIST
                          (SPADCALL "font-size"
                                    (STRINGIMAGE
                                     (QVELT
                                      (PROG2 (LETT #10# (QVELT |n| 2) . #15#)
                                          (QCDR #10#)
                                        (|check_union| (QEQCAR #10# 2)
                                                       (|Record|
                                                        (|:| |txt| (|String|))
                                                        (|:| |siz|
                                                             (|NonNegativeInteger|))
                                                        (|:| |pos|
                                                             (QREFELT $ 6))
                                                        (|:| |np|
                                                             (|List|
                                                              (|String|))))
                                                       #10#))
                                      1))
                                    (QREFELT $ 158))
                          (SPADCALL "x"
                                    (|mathObject2String|
                                     (|mul_DF|
                                      (SPADCALL |param2| (QREFELT $ 81))
                                      |scale2|))
                                    (QREFELT $ 158))
                          (SPADCALL "y"
                                    (|mathObject2String|
                                     (|minus_DF|
                                      (|mul_DF|
                                       (SPADCALL |param2| (QREFELT $ 82))
                                       |scale2|)))
                                    (QREFELT $ 158))
                          (SPADCALL "style" (STRCONC "fill:" (QVELT |mat2| 2))
                                    (QREFELT $ 158)))
                         . #15#)
                   (EXIT
                    (PROGN
                     (LETT #6#
                           (SPADCALL |nodeName|
                                     (QVELT
                                      (PROG2 (LETT #10# (QVELT |n| 2) . #15#)
                                          (QCDR #10#)
                                        (|check_union| (QEQCAR #10# 2)
                                                       (|Record|
                                                        (|:| |txt| (|String|))
                                                        (|:| |siz|
                                                             (|NonNegativeInteger|))
                                                        (|:| |pos|
                                                             (QREFELT $ 6))
                                                        (|:| |np|
                                                             (|List|
                                                              (|String|))))
                                                       #10#))
                                      0)
                                     |nodeAtts| (QREFELT $ 169))
                           . #15#)
                     (GO #6#))))))
            (COND
             ((EQUAL (QVELT |n| 0) 'TRANSFORM)
              (SEQ (LETT |nodeName| "g" . #15#)
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 4))
                     (|error|
                      "toSVG parameter type not valid for trans node")))
                   (EXIT
                    (LETT |tran2|
                          (SPADCALL
                           (PROG2 (LETT #9# (QVELT |n| 2) . #15#)
                               (QCDR #9#)
                             (|check_union| (QEQCAR #9# 4)
                                            (|STransform| (QREFELT $ 6)) #9#))
                           |tran| (QREFELT $ 171))
                          . #15#)))))
            (COND
             ((EQUAL (QVELT |n| 0) 'CLIP)
              (SEQ (LETT |nodeName| "g" . #15#) (LETT |clipEn2| 'T . #15#)
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 3))
                     (|error| "toSVG parameter type not valid for clip node")))
                   (EXIT
                    (LETT |bb2|
                          (PROG2 (LETT #8# (QVELT |n| 2) . #15#)
                              (QCDR #8#)
                            (|check_union| (QEQCAR #8# 3)
                                           (|SBoundary| (QREFELT $ 6)) #8#))
                          . #15#)))))
            (COND
             ((EQUAL (QVELT |n| 0) 'IFS)
              (SEQ (LETT |nodeName| "path" . #15#)
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 5))
                     (|error| "toSVG parameter type not valid for ifs node")))
                   (LETT |nodeAtts|
                         (LIST
                          (SPADCALL "d"
                                    (|SCENE;faceString|
                                     (PROG2 (LETT #7# (QVELT |n| 2) . #15#)
                                         (QCDR #7#)
                                       (|check_union| (QEQCAR #7# 5)
                                                      (|Record|
                                                       (|:| |inx|
                                                            (|List|
                                                             (|List|
                                                              (|NonNegativeInteger|))))
                                                       (|:| |pts|
                                                            (|List|
                                                             (QREFELT $ 6))))
                                                      #7#))
                                     |tran2| |bb2| |scale2| |clipEn2| $)
                                    (QREFELT $ 158))
                          (SPADCALL "fill" (QVELT |mat2| 2) (QREFELT $ 158))
                          (SPADCALL "stroke" (QVELT |mat2| 1) (QREFELT $ 158))
                          (SPADCALL "stroke-width"
                                    (|mathObject2String| (QVELT |mat2| 0))
                                    (QREFELT $ 158)))
                         . #15#)
                   (EXIT
                    (PROGN
                     (LETT #6#
                           (SPADCALL |nodeName| NIL |nodeAtts| (QREFELT $ 161))
                           . #15#)
                     (GO #6#))))))
            (COND
             ((EQUAL (QVELT |n| 0) 'ARROWS)
              (SEQ (LETT |nodeName| "g" . #15#)
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 6))
                     (|error|
                      "toSVG parameter type not valid for arrws node")))
                   (EXIT
                    (LETT |nodeEles|
                          (|SCENE;lineArrow|
                           (QVELT
                            (PROG2 (LETT #5# (QVELT |n| 2) . #15#)
                                (QCDR #5#)
                              (|check_union| (QEQCAR #5# 6)
                                             (|Record|
                                              (|:| |ln|
                                                   (|List|
                                                    (|List| (QREFELT $ 6))))
                                              (|:| |mode| (|Symbol|))
                                              (|:| |size| (|DoubleFloat|)))
                                             #5#))
                            0)
                           |tran2| |bb2| |mat2| |scale2| |clipEn2|
                           (QVELT
                            (PROG2 (LETT #5# (QVELT |n| 2) . #15#)
                                (QCDR #5#)
                              (|check_union| (QEQCAR #5# 6)
                                             (|Record|
                                              (|:| |ln|
                                                   (|List|
                                                    (|List| (QREFELT $ 6))))
                                              (|:| |mode| (|Symbol|))
                                              (|:| |size| (|DoubleFloat|)))
                                             #5#))
                            1)
                           (QVELT
                            (PROG2 (LETT #5# (QVELT |n| 2) . #15#)
                                (QCDR #5#)
                              (|check_union| (QEQCAR #5# 6)
                                             (|Record|
                                              (|:| |ln|
                                                   (|List|
                                                    (|List| (QREFELT $ 6))))
                                              (|:| |mode| (|Symbol|))
                                              (|:| |size| (|DoubleFloat|)))
                                             #5#))
                            2)
                           $)
                          . #15#)))))
            (COND
             ((EQUAL (QVELT |n| 0) 'ARROW)
              (SEQ
               (COND
                ((NULL (QEQCAR (QVELT |n| 2) 7))
                 (|error| "toSVG parameter type not valid for arrw node")))
               (LETT |startPoint|
                     (SPADCALL |tran|
                               (SPADCALL
                                (SPADCALL |np2|
                                          (QVELT
                                           (PROG2
                                               (LETT #4# (QVELT |n| 2) . #15#)
                                               (QCDR #4#)
                                             (|check_union| (QEQCAR #4# 7)
                                                            (|Record|
                                                             (|:| |st|
                                                                  (|String|))
                                                             (|:| |en|
                                                                  (|String|))
                                                             (|:| |offset|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |mode|
                                                                  (|Symbol|))
                                                             (|:| |size|
                                                                  (|DoubleFloat|)))
                                                            #4#))
                                           0)
                                          (QREFELT $ 168))
                                (QVELT
                                 (PROG2 (LETT #4# (QVELT |n| 2) . #15#)
                                     (QCDR #4#)
                                   (|check_union| (QEQCAR #4# 7)
                                                  (|Record|
                                                   (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT $ 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|)))
                                                  #4#))
                                 2)
                                (QREFELT $ 103))
                               (QREFELT $ 149))
                     . #15#)
               (LETT |endPoint|
                     (SPADCALL |tran|
                               (SPADCALL
                                (SPADCALL |np2|
                                          (QVELT
                                           (PROG2
                                               (LETT #4# (QVELT |n| 2) . #15#)
                                               (QCDR #4#)
                                             (|check_union| (QEQCAR #4# 7)
                                                            (|Record|
                                                             (|:| |st|
                                                                  (|String|))
                                                             (|:| |en|
                                                                  (|String|))
                                                             (|:| |offset|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |mode|
                                                                  (|Symbol|))
                                                             (|:| |size|
                                                                  (|DoubleFloat|)))
                                                            #4#))
                                           1)
                                          (QREFELT $ 168))
                                (QVELT
                                 (PROG2 (LETT #4# (QVELT |n| 2) . #15#)
                                     (QCDR #4#)
                                   (|check_union| (QEQCAR #4# 7)
                                                  (|Record|
                                                   (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT $ 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|)))
                                                  #4#))
                                 2)
                                (QREFELT $ 103))
                               (QREFELT $ 149))
                     . #15#)
               (LETT |startPointM|
                     (|minus_DF|
                      (|mul_DF| (SPADCALL |startPoint| (QREFELT $ 82))
                                |scale|))
                     . #15#)
               (LETT |endPointM|
                     (|minus_DF|
                      (|mul_DF| (SPADCALL |endPoint| (QREFELT $ 82)) |scale|))
                     . #15#)
               (COND
                ((EQUAL
                  (QVELT
                   (PROG2 (LETT #4# (QVELT |n| 2) . #15#)
                       (QCDR #4#)
                     (|check_union| (QEQCAR #4# 7)
                                    (|Record| (|:| |st| (|String|))
                                              (|:| |en| (|String|))
                                              (|:| |offset| (QREFELT $ 6))
                                              (|:| |mode| (|Symbol|))
                                              (|:| |size| (|DoubleFloat|)))
                                    #4#))
                   0)
                  (QVELT
                   (PROG2 (LETT #4# (QVELT |n| 2) . #15#)
                       (QCDR #4#)
                     (|check_union| (QEQCAR #4# 7)
                                    (|Record| (|:| |st| (|String|))
                                              (|:| |en| (|String|))
                                              (|:| |offset| (QREFELT $ 6))
                                              (|:| |mode| (|Symbol|))
                                              (|:| |size| (|DoubleFloat|)))
                                    #4#))
                   1))
                 (LETT |ptStr|
                       (SPADCALL
                        (LIST "M"
                              (|mathObject2String|
                               (|mul_DF| (SPADCALL |startPoint| (QREFELT $ 81))
                                         |scale|))
                              "," (|mathObject2String| |startPointM|)
                              "c -50,25 -50,-50 0,-25")
                        (QREFELT $ 118))
                       . #15#))
                (#16#
                 (LETT |ptStr|
                       (SPADCALL
                        (LIST "M"
                              (|mathObject2String|
                               (|mul_DF| (SPADCALL |startPoint| (QREFELT $ 81))
                                         |scale|))
                              "," (|mathObject2String| |startPointM|) "L"
                              (|mathObject2String|
                               (|mul_DF| (SPADCALL |endPoint| (QREFELT $ 81))
                                         |scale|))
                              "," (|mathObject2String| |endPointM|))
                        (QREFELT $ 118))
                       . #15#)))
               (LETT |linWidth|
                     (QVELT
                      (PROG2 (LETT #4# (QVELT |n| 2) . #15#)
                          (QCDR #4#)
                        (|check_union| (QEQCAR #4# 7)
                                       (|Record| (|:| |st| (|String|))
                                                 (|:| |en| (|String|))
                                                 (|:| |offset| (QREFELT $ 6))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|)))
                                       #4#))
                      4)
                     . #15#)
               (COND
                ((EQUAL
                  (QVELT
                   (PROG2 (LETT #4# (QVELT |n| 2) . #15#)
                       (QCDR #4#)
                     (|check_union| (QEQCAR #4# 7)
                                    (|Record| (|:| |st| (|String|))
                                              (|:| |en| (|String|))
                                              (|:| |offset| (QREFELT $ 6))
                                              (|:| |mode| (|Symbol|))
                                              (|:| |size| (|DoubleFloat|)))
                                    #4#))
                   3)
                  '|proportional|)
                 (LETT |linWidth|
                       (|mul_DF|
                        (SPADCALL
                         (SPADCALL (SPADCALL |bb2| (QREFELT $ 37))
                                   (SPADCALL |bb2| (QREFELT $ 38))
                                   (QREFELT $ 39))
                         (QREFELT $ 81))
                        (QVELT
                         (PROG2 (LETT #4# (QVELT |n| 2) . #15#)
                             (QCDR #4#)
                           (|check_union| (QEQCAR #4# 7)
                                          (|Record| (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT $ 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|)))
                                          #4#))
                         4))
                       . #15#)))
               (COND
                ((EQUAL
                  (QVELT
                   (PROG2 (LETT #4# (QVELT |n| 2) . #15#)
                       (QCDR #4#)
                     (|check_union| (QEQCAR #4# 7)
                                    (|Record| (|:| |st| (|String|))
                                              (|:| |en| (|String|))
                                              (|:| |offset| (QREFELT $ 6))
                                              (|:| |mode| (|Symbol|))
                                              (|:| |size| (|DoubleFloat|)))
                                    #4#))
                   3)
                  '|variable|)
                 (LETT |linWidth|
                       (|mul_DF|
                        (SPADCALL |startPoint| |endPoint| (QREFELT $ 152))
                        (QVELT
                         (PROG2 (LETT #4# (QVELT |n| 2) . #15#)
                             (QCDR #4#)
                           (|check_union| (QEQCAR #4# 7)
                                          (|Record| (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT $ 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|)))
                                          #4#))
                         4))
                       . #15#)))
               (LETT |nodeAtts|
                     (LIST (SPADCALL "d" |ptStr| (QREFELT $ 158))
                           (SPADCALL "fill" "none" (QREFELT $ 158))
                           (SPADCALL "stroke" (QVELT |mat| 1) (QREFELT $ 158))
                           (SPADCALL "stroke-width"
                                     (|mathObject2String| |linWidth|)
                                     (QREFELT $ 158))
                           (SPADCALL "style" "marker-end:url(#Arrow)"
                                     (QREFELT $ 158)))
                     . #15#)
               (LETT |nodeEles|
                     (LIST (SPADCALL "path" NIL |nodeAtts| (QREFELT $ 161)))
                     . #15#)
               (EXIT (LETT |nodeName| "g" . #15#)))))
            (COND
             ((EQUAL (QVELT |n| 0) 'NAMEDPOINTS)
              (SEQ
               (COND
                ((NULL (QEQCAR (QVELT |n| 2) 10))
                 (|error| "toSVG parameter type not valid for np node")))
               (SPADCALL |np2| "points"
                         (PROG2 (LETT #3# (QVELT |n| 2) . #15#)
                             (QCDR #3#)
                           (|check_union| (QEQCAR #3# 10)
                                          (|SceneNamedPoints| (QREFELT $ 6))
                                          #3#))
                         (QREFELT $ 172))
               (EXIT (LETT |nodeName| "g" . #15#)))))
            (COND
             ((EQUAL (QVELT |n| 0) 'DEF)
              (SEQ
               (COND
                ((NULL (QEQCAR (QVELT |n| 2) 9))
                 (|error| "toSVG parameter type not valid for def node")))
               (LETT |nn|
                     (PROG2 (LETT #2# (QVELT |n| 2) . #15#)
                         (QCDR #2#)
                       (|check_union| (QEQCAR #2# 9)
                                      (|Record| (|:| |nme| (|String|))
                                                (|:| |node| $))
                                      #2#))
                     . #15#)
               (LETT |name| (QCAR |nn|) . #15#) (LETT |nde| (QCDR |nn|) . #15#)
               (LETT |nodeName| "g" . #15#)
               (SPADCALL |np2| |name| |nde| (QREFELT $ 174))
               (LETT |xch|
                     (SPADCALL |nde| |mat2| |tran2| |bb2| |scale2| |clipEn2|
                               |useInteger| |np2| (QREFELT $ 175))
                     . #15#)
               (EXIT
                (COND
                 ((NULL (SPADCALL |xch| (QREFELT $ 170)))
                  (LETT |nodeEles| (SPADCALL |nodeEles| |xch| (QREFELT $ 163))
                        . #15#)))))))
            (COND
             ((EQUAL (QVELT |n| 0) 'USE)
              (SEQ
               (COND
                ((NULL (QEQCAR (QVELT |n| 2) 9))
                 (|error| "toSVG parameter type not valid for use node")))
               (LETT |nn|
                     (PROG2 (LETT #2# (QVELT |n| 2) . #15#)
                         (QCDR #2#)
                       (|check_union| (QEQCAR #2# 9)
                                      (|Record| (|:| |nme| (|String|))
                                                (|:| |node| $))
                                      #2#))
                     . #15#)
               (LETT |name| (QCAR |nn|) . #15#)
               (LETT |nde| (SPADCALL |np2| |name| (QREFELT $ 176)) . #15#)
               (LETT |nodeName| "g" . #15#)
               (LETT |xch|
                     (SPADCALL |nde| |mat2| |tran2| |bb2| |scale2| |clipEn2|
                               |useInteger| |np2| (QREFELT $ 175))
                     . #15#)
               (EXIT
                (COND
                 ((NULL (SPADCALL |xch| (QREFELT $ 170)))
                  (LETT |nodeEles| (SPADCALL |nodeEles| |xch| (QREFELT $ 163))
                        . #15#)))))))
            (EXIT
             (COND
              ((< (SPADCALL (QVELT |n| 1) (QREFELT $ 177)) 1)
               (SPADCALL |nodeName| |nodeEles| |nodeAtts| (QREFELT $ 161)))
              (#16#
               (SEQ
                (SEQ (LETT |ch| NIL . #15#) (LETT #1# (QVELT |n| 1) . #15#)
                     G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |ch| (CAR #1#) . #15#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |xch|
                            (SPADCALL |ch| |mat2| |tran2| |bb2| |scale2|
                                      |clipEn2| |useInteger| |np2|
                                      (QREFELT $ 175))
                            . #15#)
                      (EXIT
                       (COND
                        ((NULL (SPADCALL |xch| (QREFELT $ 170)))
                         (LETT |nodeEles|
                               (SPADCALL |nodeEles| |xch| (QREFELT $ 163))
                               . #15#)))))
                     (LETT #1# (CDR #1#) . #15#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (SPADCALL |nodeName| |nodeEles| |nodeAtts|
                           (QREFELT $ 161)))))))))
      #6# (EXIT #6#))))) 

(DEFUN |SCENE;toSVG;$RStRDf2BSnpXe;83|
       (|n| |mat| |tran| |bb| |scale| |clipEn| |useInteger| |npt| $)
  (SPADCALL |n| |mat| |tran| (SPADCALL (QCAR |bb|) (QCDR |bb|) (QREFELT $ 10))
            |scale| |clipEn| |useInteger| |npt| (QREFELT $ 175))) 

(DEFUN |SCENE;writeSvg;$SV;84| (|n| |filename| $)
  (PROG (|defaultBounds| |defaultTransform| |defaultMaterial|)
    (RETURN
     (SEQ
      (LETT |defaultMaterial|
            (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "black" "black" 1.0)
            . #1=(|SCENE;writeSvg;$SV;84|))
      (LETT |defaultTransform| (SPADCALL (QREFELT $ 179)) . #1#)
      (LETT |defaultBounds| (SPADCALL (QREFELT $ 16)) . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL |n| |defaultMaterial| |defaultTransform| |defaultBounds| 1.0
                  'NIL 'NIL (SPADCALL NIL NIL (QREFELT $ 180)) (QREFELT $ 175))
        |filename| (QREFELT $ 182))))))) 

(DEFUN |SCENE;writeSvgQuantised;$SV;85| (|n| |filename| $)
  (PROG (|defaultBounds| |defaultTransform| |defaultMaterial|)
    (RETURN
     (SEQ
      (LETT |defaultMaterial|
            (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "black" "black" 1.0)
            . #1=(|SCENE;writeSvgQuantised;$SV;85|))
      (LETT |defaultTransform| (SPADCALL (QREFELT $ 179)) . #1#)
      (LETT |defaultBounds| (SPADCALL (QREFELT $ 16)) . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL |n| |defaultMaterial| |defaultTransform| |defaultBounds| 1.0
                  'NIL 'T (SPADCALL NIL NIL (QREFELT $ 180)) (QREFELT $ 175))
        |filename| (QREFELT $ 182))))))) 

(DEFUN |SCENE;boundary1| (|n| |tran| |scale| |useInteger| |npt| |fontScale| $)
  (PROG (|res| |res2| #1=#:G1169 |ch| #2=#:G1168 |p| #3=#:G1167 |lp| |pts2|
         #4=#:G1126 #5=#:G1166 #6=#:G1125 |tran2| #7=#:G1124 |pt2| |pt1|
         #8=#:G1122 |w| |h| #9=#:G1163 #10=#:G1128 #11=#:G1165 #12=#:G1164
         |pts| #13=#:G1120 |fontScale2| |maxx| |minx| |bb2| #14=#:G1123)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |res| (SPADCALL (QREFELT $ 16)) . #15=(|SCENE;boundary1|))
            (LETT |fontScale2| |fontScale| . #15#) (LETT |tran2| |tran| . #15#)
            (COND
             ((EQUAL (QVELT |n| 0) 'ROOT)
              (SEQ
               (LETT |bb2|
                     (PROG2 (LETT #14# (QVELT |n| 2) . #15#)
                         (QCDR #14#)
                       (|check_union| (QEQCAR #14# 3)
                                      (|SBoundary| (QREFELT $ 6)) #14#))
                     . #15#)
               (COND
                ((NULL (SPADCALL |bb2| (QREFELT $ 164)))
                 (SEQ
                  (LETT |minx|
                        (SPADCALL (SPADCALL |bb2| (QREFELT $ 38))
                                  (QREFELT $ 81))
                        . #15#)
                  (LETT |maxx|
                        (SPADCALL (SPADCALL |bb2| (QREFELT $ 37))
                                  (QREFELT $ 81))
                        . #15#)
                  (EXIT
                   (LETT |fontScale2|
                         (|div_DF| (|sub_DF| |maxx| |minx|)
                                   (FLOAT 1000 MOST-POSITIVE-DOUBLE-FLOAT))
                         . #15#)))))
               (EXIT (LETT |res| (SPADCALL (QREFELT $ 16)) . #15#)))))
            (COND
             ((EQUAL (QVELT |n| 0) 'GROUP)
              (LETT |res| (SPADCALL (QREFELT $ 16)) . #15#)))
            (COND
             ((EQUAL (QVELT |n| 0) 'LINE)
              (SEQ
               (LETT |pts|
                     (PROG2 (LETT #13# (QVELT |n| 2) . #15#)
                         (QCDR #13#)
                       (|check_union| (QEQCAR #13# 0)
                                      (|List| (|List| (QREFELT $ 6))) #13#))
                     . #15#)
               (EXIT
                (SEQ (LETT |lp| NIL . #15#) (LETT #12# |pts| . #15#) G190
                     (COND
                      ((OR (ATOM #12#)
                           (PROGN (LETT |lp| (CAR #12#) . #15#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |p| NIL . #15#) (LETT #11# |lp| . #15#) G190
                            (COND
                             ((OR (ATOM #11#)
                                  (PROGN (LETT |p| (CAR #11#) . #15#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |res|
                                    (SPADCALL |res|
                                              (SPADCALL |tran| |p|
                                                        (QREFELT $ 149))
                                              (QREFELT $ 185))
                                    . #15#)))
                            (LETT #11# (CDR #11#) . #15#) (GO G190) G191
                            (EXIT NIL))))
                     (LETT #12# (CDR #12#) . #15#) (GO G190) G191
                     (EXIT NIL))))))
            (COND
             ((EQUAL (QVELT |n| 0) 'SHAPE)
              (SEQ
               (LETT |pt1|
                     (QVELT
                      (PROG2 (LETT #10# (QVELT |n| 2) . #15#)
                          (QCDR #10#)
                        (|check_union| (QEQCAR #10# 8)
                                       (|Record| (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|)))
                                       #10#))
                      1)
                     . #15#)
               (LETT |pt2|
                     (QVELT
                      (PROG2 (LETT #10# (QVELT |n| 2) . #15#)
                          (QCDR #10#)
                        (|check_union| (QEQCAR #10# 8)
                                       (|Record| (|:| |shptype| (|Symbol|))
                                                 (|:| |centre| (QREFELT $ 6))
                                                 (|:| |size| (QREFELT $ 6))
                                                 (|:| |fill| (|Boolean|)))
                                       #10#))
                      2)
                     . #15#)
               (COND
                ((EQUAL
                  (QVELT
                   (PROG2 (LETT #10# (QVELT |n| 2) . #15#)
                       (QCDR #10#)
                     (|check_union| (QEQCAR #10# 8)
                                    (|Record| (|:| |shptype| (|Symbol|))
                                              (|:| |centre| (QREFELT $ 6))
                                              (|:| |size| (QREFELT $ 6))
                                              (|:| |fill| (|Boolean|)))
                                    #10#))
                   0)
                  '|ellipse|)
                 (PROGN
                  (LETT #9#
                        (SPADCALL (SPADCALL |tran| |pt1| (QREFELT $ 149)) |pt2|
                                  (QREFELT $ 186))
                        . #15#)
                  (GO #9#))))
               (LETT |res|
                     (SPADCALL |res| (SPADCALL |tran| |pt1| (QREFELT $ 149))
                               (QREFELT $ 185))
                     . #15#)
               (EXIT
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL |tran|
                                          (SPADCALL |pt1| |pt2|
                                                    (QREFELT $ 103))
                                          (QREFELT $ 149))
                                (QREFELT $ 185))
                      . #15#)))))
            (COND
             ((EQUAL (QVELT |n| 0) 'MATERIAL)
              (LETT |res| (SPADCALL (QREFELT $ 16)) . #15#)))
            (COND
             ((EQUAL (QVELT |n| 0) 'TEXT)
              (SEQ
               (LETT |h|
                     (|mul_DF| |fontScale|
                               (FLOAT
                                (QVELT
                                 (PROG2 (LETT #8# (QVELT |n| 2) . #15#)
                                     (QCDR #8#)
                                   (|check_union| (QEQCAR #8# 2)
                                                  (|Record|
                                                   (|:| |txt| (|String|))
                                                   (|:| |siz|
                                                        (|NonNegativeInteger|))
                                                   (|:| |pos| (QREFELT $ 6))
                                                   (|:| |np|
                                                        (|List| (|String|))))
                                                  #8#))
                                 1)
                                MOST-POSITIVE-DOUBLE-FLOAT))
                     . #15#)
               (LETT |w|
                     (|mul_DF|
                      (|mul_DF|
                       (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 90))
                                 (QREFELT $ 91))
                       |h|)
                      (FLOAT
                       (QCSIZE
                        (QVELT
                         (PROG2 (LETT #8# (QVELT |n| 2) . #15#)
                             (QCDR #8#)
                           (|check_union| (QEQCAR #8# 2)
                                          (|Record| (|:| |txt| (|String|))
                                                    (|:| |siz|
                                                         (|NonNegativeInteger|))
                                                    (|:| |pos| (QREFELT $ 6))
                                                    (|:| |np|
                                                         (|List| (|String|))))
                                          #8#))
                         0))
                       MOST-POSITIVE-DOUBLE-FLOAT))
                     . #15#)
               (LETT |pt1|
                     (QVELT
                      (PROG2 (LETT #8# (QVELT |n| 2) . #15#)
                          (QCDR #8#)
                        (|check_union| (QEQCAR #8# 2)
                                       (|Record| (|:| |txt| (|String|))
                                                 (|:| |siz|
                                                      (|NonNegativeInteger|))
                                                 (|:| |pos| (QREFELT $ 6))
                                                 (|:| |np|
                                                      (|List| (|String|))))
                                       #8#))
                      2)
                     . #15#)
               (LETT |res|
                     (SPADCALL |res| (SPADCALL |tran| |pt1| (QREFELT $ 149))
                               (QREFELT $ 185))
                     . #15#)
               (LETT |pt2|
                     (SPADCALL |pt1| (SPADCALL |w| |h| (QREFELT $ 83))
                               (QREFELT $ 103))
                     . #15#)
               (EXIT
                (LETT |res|
                      (SPADCALL |res| (SPADCALL |tran| |pt2| (QREFELT $ 149))
                                (QREFELT $ 185))
                      . #15#)))))
            (COND
             ((EQUAL (QVELT |n| 0) 'TRANSFORM)
              (LETT |tran2|
                    (SPADCALL
                     (PROG2 (LETT #7# (QVELT |n| 2) . #15#)
                         (QCDR #7#)
                       (|check_union| (QEQCAR #7# 4)
                                      (|STransform| (QREFELT $ 6)) #7#))
                     |tran| (QREFELT $ 171))
                    . #15#)))
            (COND
             ((EQUAL (QVELT |n| 0) 'CLIP)
              (LETT |res| (SPADCALL (QREFELT $ 16)) . #15#)))
            (COND
             ((EQUAL (QVELT |n| 0) 'IFS)
              (SEQ
               (LETT |pts2|
                     (QCDR
                      (PROG2 (LETT #6# (QVELT |n| 2) . #15#)
                          (QCDR #6#)
                        (|check_union| (QEQCAR #6# 5)
                                       (|Record|
                                        (|:| |inx|
                                             (|List|
                                              (|List| (|NonNegativeInteger|))))
                                        (|:| |pts| (|List| (QREFELT $ 6))))
                                       #6#)))
                     . #15#)
               (EXIT
                (SEQ (LETT |p| NIL . #15#) (LETT #5# |pts2| . #15#) G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |p| (CAR #5#) . #15#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |res|
                             (SPADCALL |res|
                                       (SPADCALL |tran| |p| (QREFELT $ 149))
                                       (QREFELT $ 185))
                             . #15#)))
                     (LETT #5# (CDR #5#) . #15#) (GO G190) G191 (EXIT NIL))))))
            (COND
             ((EQUAL (QVELT |n| 0) 'ARROWS)
              (SEQ
               (LETT |pts2|
                     (QVELT
                      (PROG2 (LETT #4# (QVELT |n| 2) . #15#)
                          (QCDR #4#)
                        (|check_union| (QEQCAR #4# 6)
                                       (|Record|
                                        (|:| |ln|
                                             (|List| (|List| (QREFELT $ 6))))
                                        (|:| |mode| (|Symbol|))
                                        (|:| |size| (|DoubleFloat|)))
                                       #4#))
                      0)
                     . #15#)
               (EXIT
                (SEQ (LETT |lp| NIL . #15#) (LETT #3# |pts2| . #15#) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |lp| (CAR #3#) . #15#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |p| NIL . #15#) (LETT #2# |lp| . #15#) G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |p| (CAR #2#) . #15#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |res|
                                    (SPADCALL |res|
                                              (SPADCALL |tran| |p|
                                                        (QREFELT $ 149))
                                              (QREFELT $ 185))
                                    . #15#)))
                            (LETT #2# (CDR #2#) . #15#) (GO G190) G191
                            (EXIT NIL))))
                     (LETT #3# (CDR #3#) . #15#) (GO G190) G191 (EXIT NIL))))))
            (COND
             ((EQUAL (QVELT |n| 0) 'ARROW)
              (LETT |res| (SPADCALL (QREFELT $ 16)) . #15#)))
            (COND
             ((EQUAL (QVELT |n| 0) 'NAMEDPOINTS)
              (LETT |res| (SPADCALL (QREFELT $ 16)) . #15#)))
            (COND
             ((EQUAL (QVELT |n| 0) 'DEF)
              (LETT |res| (SPADCALL (QREFELT $ 16)) . #15#)))
            (COND
             ((EQUAL (QVELT |n| 0) 'USE)
              (LETT |res| (SPADCALL (QREFELT $ 16)) . #15#)))
            (SEQ (LETT |ch| NIL . #15#) (LETT #1# (QVELT |n| 1) . #15#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |ch| (CAR #1#) . #15#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |res2|
                        (|SCENE;boundary1| |ch| |tran2| |scale| |useInteger|
                         |npt| |fontScale2| $)
                        . #15#)
                  (EXIT
                   (LETT |res| (SPADCALL |res| |res2| (QREFELT $ 187))
                         . #15#)))
                 (LETT #1# (CDR #1#) . #15#) (GO G190) G191 (EXIT NIL))
            (EXIT |res|)))
      #9# (EXIT #9#))))) 

(DEFUN |SCENE;boundary;$DfSb;87| (|n| |fontScale| $)
  (PROG (|defaultTransform|)
    (RETURN
     (SEQ
      (LETT |defaultTransform| (SPADCALL (QREFELT $ 179))
            |SCENE;boundary;$DfSb;87|)
      (EXIT
       (|SCENE;boundary1| |n| |defaultTransform| 1.0 'NIL
        (SPADCALL NIL NIL (QREFELT $ 180))
        (|div_DF| |fontScale| (FLOAT 1000 MOST-POSITIVE-DOUBLE-FLOAT)) $)))))) 

(DEFUN |SCENE;pointString| (|pts| |tran| |bb| $)
  (PROG (|ptStr| |thisStr| |param2| #1=#:G1176 |param| |lastValid|)
    (RETURN
     (SEQ (LETT |ptStr| NIL . #2=(|SCENE;pointString|))
          (LETT |lastValid| 'T . #2#)
          (SEQ (LETT |param| NIL . #2#) (LETT #1# |pts| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |param| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |param2| (SPADCALL |tran| |param| (QREFELT $ 149)) . #2#)
                (LETT |thisStr|
                      (SPADCALL
                       (LIST
                        (|mathObject2String|
                         (SPADCALL |param2| (QREFELT $ 81)))
                        " "
                        (|mathObject2String|
                         (SPADCALL |param2| (QREFELT $ 82)))
                        " "
                        (|mathObject2String|
                         (SPADCALL |param2| (QREFELT $ 188))))
                       (QREFELT $ 118))
                      . #2#)
                (EXIT
                 (LETT |ptStr| (SPADCALL |ptStr| |thisStr| (QREFELT $ 189))
                       . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |ptStr|))))) 

(DEFUN |SCENE;pointIndexString| (|pts| |tran| |bb| $)
  (PROG (|ptStr| #1=#:G1183 |param| #2=#:G1182 |line|)
    (RETURN
     (SEQ (LETT |ptStr| NIL . #3=(|SCENE;pointIndexString|))
          (SEQ (LETT |line| NIL . #3#) (LETT #2# |pts| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |line| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (SEQ (LETT |param| NIL . #3#) (LETT #1# |line| . #3#) G190
                     (COND
                      ((OR (ATOM #1#)
                           (PROGN (LETT |param| (CAR #1#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |ptStr|
                             (SPADCALL |ptStr| (|mathObject2String| |param|)
                                       (QREFELT $ 189))
                             . #3#)))
                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (LETT |ptStr| (SPADCALL |ptStr| "-1" (QREFELT $ 189)) . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |ptStr|))))) 

(DEFUN |SCENE;setX3DNodeName| (|typ| $)
  (PROG (|nodeName|)
    (RETURN
     (SEQ (LETT |nodeName| "" . #1=(|SCENE;setX3DNodeName|))
          (COND ((EQUAL |typ| 'ROOT) (LETT |nodeName| "X3D" . #1#)))
          (COND ((EQUAL |typ| 'GROUP) (LETT |nodeName| "Group" . #1#)))
          (COND ((EQUAL |typ| 'LINE) (LETT |nodeName| "IndexedFaceSet" . #1#)))
          (COND ((EQUAL |typ| 'SHAPE) (LETT |nodeName| "Sphere" . #1#)))
          (COND ((EQUAL |typ| 'MATERIAL) (LETT |nodeName| "Group" . #1#)))
          (COND ((EQUAL |typ| 'TEXT) (LETT |nodeName| "Text" . #1#)))
          (COND ((EQUAL |typ| 'TRANSFORM) (LETT |nodeName| "Transform" . #1#)))
          (COND ((EQUAL |typ| 'CLIP) (LETT |nodeName| "Group" . #1#)))
          (COND ((EQUAL |typ| 'IFS) (LETT |nodeName| "IndexedFaceSet" . #1#)))
          (COND
           ((EQUAL |typ| 'ARROWS) (LETT |nodeName| "IndexedFaceSet" . #1#)))
          (COND ((EQUAL |typ| 'DEF) (LETT |nodeName| "Group" . #1#)))
          (COND ((EQUAL |typ| 'USE) (LETT |nodeName| "Group" . #1#)))
          (EXIT |nodeName|))))) 

(DEFUN |SCENE;toX3D;$RStSbXe;91| (|n| |mat| |tran| |bb| $)
  (PROG (|nodeEles| |xch| #1=#:G1244 |ch| #2=#:G1242 |ifset| |coord| #3=#:G1199
         |nodeAtts| |ifsR| |meshR| #4=#:G1200 #5=#:G1194 #6=#:G1196 |bb2|
         #7=#:G1197 |tran2| #8=#:G1198 |mat2| #9=#:G1195 |inner| #10=#:G1243
         |nodeName|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |nodeName| (|SCENE;setX3DNodeName| (QVELT |n| 0) $)
              . #11=(|SCENE;toX3D;$RStSbXe;91|))
        (LETT |bb2| |bb| . #11#) (LETT |tran2| |tran| . #11#)
        (LETT |mat2| |mat| . #11#) (LETT |nodeAtts| NIL . #11#)
        (COND
         ((EQUAL (QVELT |n| 0) 'ROOT)
          (SEQ
           (COND
            ((NULL (QEQCAR (QVELT |n| 2) 3))
             (|error| "toX3D parameter type not valid for root node")))
           (LETT |bb2|
                 (PROG2 (LETT #7# (QVELT |n| 2) . #11#)
                     (QCDR #7#)
                   (|check_union| (QEQCAR #7# 3) (|SBoundary| (QREFELT $ 6))
                                  #7#))
                 . #11#)
           (COND
            ((SPADCALL |bb2| (QREFELT $ 164))
             (LETT |bb2| (SPADCALL |n| 1.0 (QREFELT $ 26)) . #11#)))
           (COND
            ((SPADCALL |bb2| (QREFELT $ 164))
             (|error| "scene contains no drawable elements")))
           (LETT |nodeEles| NIL . #11#)
           (SEQ (LETT |ch| NIL . #11#) (LETT #10# (QVELT |n| 1) . #11#) G190
                (COND
                 ((OR (ATOM #10#) (PROGN (LETT |ch| (CAR #10#) . #11#) NIL))
                  (GO G191)))
                (SEQ
                 (LETT |xch|
                       (SPADCALL |ch| |mat2| |tran2| |bb2| (QREFELT $ 190))
                       . #11#)
                 (EXIT
                  (COND
                   ((NULL (SPADCALL |xch| (QREFELT $ 170)))
                    (LETT |nodeEles|
                          (SPADCALL |nodeEles| |xch| (QREFELT $ 163))
                          . #11#)))))
                (LETT #10# (CDR #10#) . #11#) (GO G190) G191 (EXIT NIL))
           (LETT |inner|
                 (SPADCALL "Scene" |nodeEles| |nodeAtts| (QREFELT $ 161))
                 . #11#)
           (EXIT
            (PROGN
             (LETT #2#
                   (SPADCALL |nodeName| (LIST |inner|) |nodeAtts|
                             (QREFELT $ 161))
                   . #11#)
             (GO #2#))))))
        (COND
         ((EQUAL (QVELT |n| 0) 'MATERIAL)
          (LETT |mat2|
                (PROG2 (LETT #9# (QVELT |n| 2) . #11#)
                    (QCDR #9#)
                  (|check_union| (QEQCAR #9# 1)
                                 (|Record| (|:| |lineWidth| (|DoubleFloat|))
                                           (|:| |lineCol| (|String|))
                                           (|:| |fillCol| (|String|))
                                           (|:| |matOpacity| (|DoubleFloat|)))
                                 #9#))
                . #11#)))
        (COND
         ((EQUAL (QVELT |n| 0) 'TRANSFORM)
          (SEQ
           (COND
            ((NULL (QEQCAR (QVELT |n| 2) 4))
             (|error| "toX3D parameter type not valid for trans node")))
           (EXIT
            (LETT |tran2|
                  (SPADCALL
                   (PROG2 (LETT #8# (QVELT |n| 2) . #11#)
                       (QCDR #8#)
                     (|check_union| (QEQCAR #8# 4) (|STransform| (QREFELT $ 6))
                                    #8#))
                   |tran| (QREFELT $ 171))
                  . #11#)))))
        (COND
         ((EQUAL (QVELT |n| 0) 'CLIP)
          (SEQ
           (COND
            ((NULL (QEQCAR (QVELT |n| 2) 3))
             (|error| "toX3D parameter type not valid for clip node")))
           (EXIT
            (LETT |bb2|
                  (PROG2 (LETT #7# (QVELT |n| 2) . #11#)
                      (QCDR #7#)
                    (|check_union| (QEQCAR #7# 3) (|SBoundary| (QREFELT $ 6))
                                   #7#))
                  . #11#)))))
        (COND
         ((EQUAL (QVELT |n| 0) 'TEXT)
          (SEQ
           (COND
            ((NULL (QEQCAR (QVELT |n| 2) 2))
             (|error| "toX3D parameter type not valid for text node")))
           (EXIT
            (LETT |nodeAtts|
                  (LIST
                   (SPADCALL "string"
                             (QVELT
                              (PROG2 (LETT #6# (QVELT |n| 2) . #11#)
                                  (QCDR #6#)
                                (|check_union| (QEQCAR #6# 2)
                                               (|Record| (|:| |txt| (|String|))
                                                         (|:| |siz|
                                                              (|NonNegativeInteger|))
                                                         (|:| |pos|
                                                              (QREFELT $ 6))
                                                         (|:| |np|
                                                              (|List|
                                                               (|String|))))
                                               #6#))
                              0)
                             (QREFELT $ 158)))
                  . #11#)))))
        (COND
         ((EQUAL (QVELT |n| 0) 'LINE)
          (SEQ
           (COND
            ((NULL (QEQCAR (QVELT |n| 2) 0))
             (|error| "toX3D parameter type not valid for line node")))
           (LETT |meshR|
                 (SPADCALL
                  (|SPADfirst|
                   (PROG2 (LETT #5# (QVELT |n| 2) . #11#)
                       (QCDR #5#)
                     (|check_union| (QEQCAR #5# 0)
                                    (|List| (|List| (QREFELT $ 6))) #5#)))
                  (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 90)) (QREFELT $ 91))
                  8 (QREFELT $ 191))
                 . #11#)
           (LETT |ifsR| (SPADCALL |meshR| 'NIL (QREFELT $ 192)) . #11#)
           (LETT |nodeAtts|
                 (LIST
                  (SPADCALL "coordIndex"
                            (|SCENE;pointIndexString|
                             (SPADCALL |ifsR| (QREFELT $ 61)) |tran| |bb| $)
                            (QREFELT $ 193)))
                 . #11#)
           (LETT |coord|
                 (SPADCALL "Coordinate" NIL
                           (LIST
                            (SPADCALL "point"
                                      (|SCENE;pointString|
                                       (SPADCALL |ifsR| (QREFELT $ 62)) |tran|
                                       |bb| $)
                                      (QREFELT $ 193)))
                           (QREFELT $ 161))
                 . #11#)
           (LETT |ifset|
                 (SPADCALL |nodeName| (LIST |coord|) |nodeAtts|
                           (QREFELT $ 161))
                 . #11#)
           (EXIT
            (PROGN
             (LETT #2# (SPADCALL "Shape" (LIST |ifset|) NIL (QREFELT $ 161))
                   . #11#)
             (GO #2#))))))
        (COND
         ((EQUAL (QVELT |n| 0) 'SHAPE)
          (COND
           ((NULL (QEQCAR (QVELT |n| 2) 8))
            (|error| "toX3D parameter type not valid for text node")))))
        (COND
         ((EQUAL (QVELT |n| 0) 'ARROWS)
          (SEQ
           (COND
            ((NULL (QEQCAR (QVELT |n| 2) 6))
             (|error| "toX3D parameter type not valid for arrws node")))
           (LETT |meshR|
                 (SPADCALL
                  (|SPADfirst|
                   (QVELT
                    (PROG2 (LETT #4# (QVELT |n| 2) . #11#)
                        (QCDR #4#)
                      (|check_union| (QEQCAR #4# 6)
                                     (|Record|
                                      (|:| |ln|
                                           (|List| (|List| (QREFELT $ 6))))
                                      (|:| |mode| (|Symbol|))
                                      (|:| |size| (|DoubleFloat|)))
                                     #4#))
                    0))
                  (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 90)) (QREFELT $ 91))
                  8 (QREFELT $ 191))
                 . #11#)
           (LETT |ifsR| (SPADCALL |meshR| 'NIL (QREFELT $ 192)) . #11#)
           (LETT |nodeAtts|
                 (LIST
                  (SPADCALL "coordIndex"
                            (|SCENE;pointIndexString|
                             (SPADCALL |ifsR| (QREFELT $ 61)) |tran| |bb| $)
                            (QREFELT $ 193)))
                 . #11#)
           (LETT |coord|
                 (SPADCALL "Coordinate" NIL
                           (LIST
                            (SPADCALL "point"
                                      (|SCENE;pointString|
                                       (SPADCALL |ifsR| (QREFELT $ 62)) |tran|
                                       |bb| $)
                                      (QREFELT $ 193)))
                           (QREFELT $ 161))
                 . #11#)
           (LETT |ifset|
                 (SPADCALL |nodeName| (LIST |coord|) |nodeAtts|
                           (QREFELT $ 161))
                 . #11#)
           (EXIT
            (PROGN
             (LETT #2# (SPADCALL "Shape" (LIST |ifset|) NIL (QREFELT $ 161))
                   . #11#)
             (GO #2#))))))
        (COND
         ((EQUAL (QVELT |n| 0) 'IFS)
          (SEQ
           (COND
            ((NULL (QEQCAR (QVELT |n| 2) 5))
             (|error| "toX3D parameter type not valid for ifs node")))
           (LETT |nodeAtts|
                 (LIST
                  (SPADCALL "coordIndex"
                            (|SCENE;pointIndexString|
                             (QCAR
                              (PROG2 (LETT #3# (QVELT |n| 2) . #11#)
                                  (QCDR #3#)
                                (|check_union| (QEQCAR #3# 5)
                                               (|Record|
                                                (|:| |inx|
                                                     (|List|
                                                      (|List|
                                                       (|NonNegativeInteger|))))
                                                (|:| |pts|
                                                     (|List| (QREFELT $ 6))))
                                               #3#)))
                             |tran| |bb| $)
                            (QREFELT $ 193)))
                 . #11#)
           (LETT |coord|
                 (SPADCALL "Coordinate" NIL
                           (LIST
                            (SPADCALL "point"
                                      (|SCENE;pointString|
                                       (QCDR
                                        (PROG2 (LETT #3# (QVELT |n| 2) . #11#)
                                            (QCDR #3#)
                                          (|check_union| (QEQCAR #3# 5)
                                                         (|Record|
                                                          (|:| |inx|
                                                               (|List|
                                                                (|List|
                                                                 (|NonNegativeInteger|))))
                                                          (|:| |pts|
                                                               (|List|
                                                                (QREFELT $
                                                                         6))))
                                                         #3#)))
                                       |tran2| |bb2| $)
                                      (QREFELT $ 193)))
                           (QREFELT $ 161))
                 . #11#)
           (LETT |ifset|
                 (SPADCALL |nodeName| (LIST |coord|) |nodeAtts|
                           (QREFELT $ 161))
                 . #11#)
           (EXIT
            (PROGN
             (LETT #2# (SPADCALL "Shape" (LIST |ifset|) NIL (QREFELT $ 161))
                   . #11#)
             (GO #2#))))))
        (COND
         ((EQUAL (QVELT |n| 0) 'DEF)
          (COND
           ((NULL (QEQCAR (QVELT |n| 2) 9))
            (|error| "toSVG parameter type not valid for def node")))))
        (COND
         ((EQUAL (QVELT |n| 0) 'USE)
          (COND
           ((NULL (QEQCAR (QVELT |n| 2) 9))
            (|error| "toSVG parameter type not valid for use node")))))
        (EXIT
         (COND
          ((< (SPADCALL (QVELT |n| 1) (QREFELT $ 177)) 1)
           (SPADCALL |nodeName| NIL |nodeAtts| (QREFELT $ 161)))
          ('T
           (SEQ (LETT |nodeEles| NIL . #11#)
                (SEQ (LETT |ch| NIL . #11#) (LETT #1# (QVELT |n| 1) . #11#)
                     G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |ch| (CAR #1#) . #11#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |xch|
                            (SPADCALL |ch| |mat2| |tran2| |bb2|
                                      (QREFELT $ 190))
                            . #11#)
                      (EXIT
                       (COND
                        ((NULL (SPADCALL |xch| (QREFELT $ 170)))
                         (LETT |nodeEles|
                               (SPADCALL |nodeEles| |xch| (QREFELT $ 163))
                               . #11#)))))
                     (LETT #1# (CDR #1#) . #11#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (SPADCALL |nodeName| |nodeEles| |nodeAtts|
                           (QREFELT $ 161)))))))))
      #2# (EXIT #2#))))) 

(DEFUN |SCENE;toX3D;$RStRXe;92| (|n| |mat| |tran| |bb| $)
  (SPADCALL |n| |mat| |tran| (SPADCALL (QCAR |bb|) (QCDR |bb|) (QREFELT $ 10))
            (QREFELT $ 190))) 

(DEFUN |SCENE;writeX3d;$SV;93| (|n| |filename| $)
  (PROG (|defaultBounds| |defaultTransform| |defaultMaterial|)
    (RETURN
     (SEQ
      (LETT |defaultMaterial|
            (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "black" "black" 1.0)
            . #1=(|SCENE;writeX3d;$SV;93|))
      (LETT |defaultTransform| (SPADCALL (QREFELT $ 179)) . #1#)
      (LETT |defaultBounds| (SPADCALL (QREFELT $ 16)) . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL |n| |defaultMaterial| |defaultTransform| |defaultBounds|
                  (QREFELT $ 190))
        |filename| (QREFELT $ 182))))))) 

(DEFUN |SCENE;toObj;$RRRStSbV;94|
       (|n| |ptLst| |indexLst| |indexNxt| |tran| |bb| $)
  (PROG (#1=#:G1324 |ch| #2=#:G1310 |i2| #3=#:G1323 |j| #4=#:G1322 #5=#:G1321
         |k| #6=#:G1320 |p1| #7=#:G1264 |i1| #8=#:G1319 #9=#:G1318 #10=#:G1317
         #11=#:G1316 |ifsR| |meshR| #12=#:G1259 #13=#:G1315 #14=#:G1314
         #15=#:G1313 #16=#:G1312 |bb2| #17=#:G1262 |tran2| #18=#:G1263
         #19=#:G1311 |mx| |mn| |offsety| |offsetRequired| |offsetx| |miny|
         |minx| |nodeName|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |nodeName| (|SCENE;setX3DNodeName| (QVELT |n| 0) $)
              . #20=(|SCENE;toObj;$RRRStSbV;94|))
        (LETT |bb2| |bb| . #20#) (LETT |tran2| |tran| . #20#)
        (COND
         ((EQUAL (QVELT |n| 0) 'ROOT)
          (SEQ
           (COND
            ((NULL (QEQCAR (QVELT |n| 2) 3))
             (|error| "toObj parameter type not valid for root node")))
           (LETT |bb2|
                 (PROG2 (LETT #17# (QVELT |n| 2) . #20#)
                     (QCDR #17#)
                   (|check_union| (QEQCAR #17# 3) (|SBoundary| (QREFELT $ 6))
                                  #17#))
                 . #20#)
           (COND
            ((SPADCALL |bb2| (QREFELT $ 164))
             (LETT |bb2| (SPADCALL |n| 1.0 (QREFELT $ 26)) . #20#)))
           (COND
            ((SPADCALL |bb2| (QREFELT $ 164))
             (|error| "scene contains no drawable elements")))
           (LETT |minx|
                 (SPADCALL (SPADCALL |bb2| (QREFELT $ 38)) (QREFELT $ 81))
                 . #20#)
           (LETT |miny|
                 (SPADCALL (SPADCALL |bb2| (QREFELT $ 38)) (QREFELT $ 82))
                 . #20#)
           (LETT |offsetx| 0.0 . #20#) (LETT |offsety| 0.0 . #20#)
           (LETT |offsetRequired| 'NIL . #20#)
           (COND
            ((|less_DF| |minx| 0.0)
             (SEQ (LETT |offsetRequired| 'T . #20#)
                  (EXIT (LETT |offsetx| (|minus_DF| |minx|) . #20#)))))
           (COND
            ((|less_DF| |miny| 0.0)
             (SEQ (LETT |offsetRequired| 'T . #20#)
                  (EXIT (LETT |offsety| (|minus_DF| |miny|) . #20#)))))
           (COND
            (|offsetRequired|
             (SEQ
              (LETT |mn|
                    (SPADCALL
                     (|add_DF|
                      (SPADCALL (SPADCALL |bb2| (QREFELT $ 38)) (QREFELT $ 81))
                      |offsetx|)
                     (|add_DF|
                      (SPADCALL (SPADCALL |bb2| (QREFELT $ 38)) (QREFELT $ 82))
                      |offsety|)
                     (QREFELT $ 83))
                    . #20#)
              (LETT |mx|
                    (SPADCALL
                     (|add_DF|
                      (SPADCALL (SPADCALL |bb2| (QREFELT $ 37)) (QREFELT $ 81))
                      |offsetx|)
                     (|add_DF|
                      (SPADCALL (SPADCALL |bb2| (QREFELT $ 37)) (QREFELT $ 82))
                      |offsety|)
                     (QREFELT $ 83))
                    . #20#)
              (LETT |bb2| (SPADCALL |mn| |mx| (QREFELT $ 10)) . #20#)
              (EXIT
               (LETT |tran2|
                     (SPADCALL |offsetx| |offsety| 0.0 1.0 1.0 1.0
                               (QREFELT $ 165))
                     . #20#)))))
           (SEQ (LETT |ch| NIL . #20#) (LETT #19# (QVELT |n| 1) . #20#) G190
                (COND
                 ((OR (ATOM #19#) (PROGN (LETT |ch| (CAR #19#) . #20#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (SPADCALL |ch| |ptLst| |indexLst| |indexNxt| |tran2| |bb2|
                            (QREFELT $ 199))))
                (LETT #19# (CDR #19#) . #20#) (GO G190) G191 (EXIT NIL))
           (EXIT (PROGN (LETT #2# (|Void|) . #20#) (GO #2#))))))
        (COND
         ((EQUAL (QVELT |n| 0) 'TRANSFORM)
          (SEQ
           (COND
            ((NULL (QEQCAR (QVELT |n| 2) 4))
             (|error| "toObj parameter type not valid for trans node")))
           (EXIT
            (LETT |tran2|
                  (SPADCALL
                   (PROG2 (LETT #18# (QVELT |n| 2) . #20#)
                       (QCDR #18#)
                     (|check_union| (QEQCAR #18# 4)
                                    (|STransform| (QREFELT $ 6)) #18#))
                   |tran| (QREFELT $ 171))
                  . #20#)))))
        (COND
         ((EQUAL (QVELT |n| 0) 'CLIP)
          (SEQ
           (COND
            ((NULL (QEQCAR (QVELT |n| 2) 3))
             (|error| "toObj parameter type not valid for clip node")))
           (LETT |bb2|
                 (PROG2 (LETT #17# (QVELT |n| 2) . #20#)
                     (QCDR #17#)
                   (|check_union| (QEQCAR #17# 3) (|SBoundary| (QREFELT $ 6))
                                  #17#))
                 . #20#)
           (EXIT (PROGN (LETT #2# (|Void|) . #20#) (GO #2#))))))
        (COND
         ((EQUAL (QVELT |n| 0) 'LINE)
          (SEQ
           (COND
            ((NULL (QEQCAR (QVELT |n| 2) 0))
             (|error| "toObj parameter type not valid for line node")))
           (LETT |meshR|
                 (SPADCALL
                  (|SPADfirst|
                   (PROG2 (LETT #12# (QVELT |n| 2) . #20#)
                       (QCDR #12#)
                     (|check_union| (QEQCAR #12# 0)
                                    (|List| (|List| (QREFELT $ 6))) #12#)))
                  (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 90)) (QREFELT $ 91))
                  8 (QREFELT $ 191))
                 . #20#)
           (LETT |ifsR| (SPADCALL |meshR| 'NIL (QREFELT $ 192)) . #20#)
           (LETT |i1| (SPADCALL |ifsR| (QREFELT $ 61)) . #20#)
           (LETT |p1| (SPADCALL |ifsR| (QREFELT $ 62)) . #20#)
           (LETT |i2|
                 (PROGN
                  (LETT #16# NIL . #20#)
                  (SEQ (LETT |k| NIL . #20#) (LETT #15# |i1| . #20#) G190
                       (COND
                        ((OR (ATOM #15#)
                             (PROGN (LETT |k| (CAR #15#) . #20#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #16#
                               (CONS
                                (PROGN
                                 (LETT #14# NIL . #20#)
                                 (SEQ (LETT |j| NIL . #20#)
                                      (LETT #13# |k| . #20#) G190
                                      (COND
                                       ((OR (ATOM #13#)
                                            (PROGN
                                             (LETT |j| (CAR #13#) . #20#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #14#
                                              (CONS
                                               (+ |j|
                                                  (SPADCALL |indexNxt|
                                                            (QREFELT $ 200)))
                                               #14#)
                                              . #20#)))
                                      (LETT #13# (CDR #13#) . #20#) (GO G190)
                                      G191 (EXIT (NREVERSE #14#))))
                                #16#)
                               . #20#)))
                       (LETT #15# (CDR #15#) . #20#) (GO G190) G191
                       (EXIT (NREVERSE #16#))))
                 . #20#)
           (SPADCALL |ptLst|
                     (SPADCALL (SPADCALL |ptLst| (QREFELT $ 201)) |p1|
                               (QREFELT $ 202))
                     (QREFELT $ 203))
           (SPADCALL |indexLst|
                     (SPADCALL (SPADCALL |indexLst| (QREFELT $ 204)) |i2|
                               (QREFELT $ 205))
                     (QREFELT $ 206))
           (SPADCALL |indexNxt|
                     (+ (SPADCALL |indexNxt| (QREFELT $ 200)) (LENGTH |p1|))
                     (QREFELT $ 207))
           (EXIT (PROGN (LETT #2# (|Void|) . #20#) (GO #2#))))))
        (COND
         ((EQUAL (QVELT |n| 0) 'SHAPE)
          (COND
           ((NULL (QEQCAR (QVELT |n| 2) 8))
            (|error| "toObj parameter type not valid for shape node")))))
        (COND
         ((EQUAL (QVELT |n| 0) 'ARROWS)
          (SEQ
           (COND
            ((NULL (QEQCAR (QVELT |n| 2) 0))
             (|error| "toObj parameter type not valid for arrows node")))
           (LETT |meshR|
                 (SPADCALL
                  (|SPADfirst|
                   (PROG2 (LETT #12# (QVELT |n| 2) . #20#)
                       (QCDR #12#)
                     (|check_union| (QEQCAR #12# 0)
                                    (|List| (|List| (QREFELT $ 6))) #12#)))
                  (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 90)) (QREFELT $ 91))
                  8 (QREFELT $ 191))
                 . #20#)
           (LETT |ifsR| (SPADCALL |meshR| 'NIL (QREFELT $ 192)) . #20#)
           (LETT |i1| (SPADCALL |ifsR| (QREFELT $ 61)) . #20#)
           (LETT |p1| (SPADCALL |ifsR| (QREFELT $ 62)) . #20#)
           (LETT |i2|
                 (PROGN
                  (LETT #11# NIL . #20#)
                  (SEQ (LETT |k| NIL . #20#) (LETT #10# |i1| . #20#) G190
                       (COND
                        ((OR (ATOM #10#)
                             (PROGN (LETT |k| (CAR #10#) . #20#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #11#
                               (CONS
                                (PROGN
                                 (LETT #9# NIL . #20#)
                                 (SEQ (LETT |j| NIL . #20#)
                                      (LETT #8# |k| . #20#) G190
                                      (COND
                                       ((OR (ATOM #8#)
                                            (PROGN
                                             (LETT |j| (CAR #8#) . #20#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #9#
                                              (CONS
                                               (+ |j|
                                                  (SPADCALL |indexNxt|
                                                            (QREFELT $ 200)))
                                               #9#)
                                              . #20#)))
                                      (LETT #8# (CDR #8#) . #20#) (GO G190)
                                      G191 (EXIT (NREVERSE #9#))))
                                #11#)
                               . #20#)))
                       (LETT #10# (CDR #10#) . #20#) (GO G190) G191
                       (EXIT (NREVERSE #11#))))
                 . #20#)
           (SPADCALL |ptLst|
                     (SPADCALL (SPADCALL |ptLst| (QREFELT $ 201)) |p1|
                               (QREFELT $ 202))
                     (QREFELT $ 203))
           (SPADCALL |indexLst|
                     (SPADCALL (SPADCALL |indexLst| (QREFELT $ 204)) |i2|
                               (QREFELT $ 205))
                     (QREFELT $ 206))
           (SPADCALL |indexNxt|
                     (+ (SPADCALL |indexNxt| (QREFELT $ 200)) (LENGTH |p1|))
                     (QREFELT $ 207))
           (EXIT (PROGN (LETT #2# (|Void|) . #20#) (GO #2#))))))
        (COND
         ((EQUAL (QVELT |n| 0) 'IFS)
          (SEQ
           (COND
            ((NULL (QEQCAR (QVELT |n| 2) 5))
             (|error| "toObj parameter type not valid for ifs node")))
           (LETT |i1|
                 (QCAR
                  (PROG2 (LETT #7# (QVELT |n| 2) . #20#)
                      (QCDR #7#)
                    (|check_union| (QEQCAR #7# 5)
                                   (|Record|
                                    (|:| |inx|
                                         (|List|
                                          (|List| (|NonNegativeInteger|))))
                                    (|:| |pts| (|List| (QREFELT $ 6))))
                                   #7#)))
                 . #20#)
           (LETT |p1|
                 (QCDR
                  (PROG2 (LETT #7# (QVELT |n| 2) . #20#)
                      (QCDR #7#)
                    (|check_union| (QEQCAR #7# 5)
                                   (|Record|
                                    (|:| |inx|
                                         (|List|
                                          (|List| (|NonNegativeInteger|))))
                                    (|:| |pts| (|List| (QREFELT $ 6))))
                                   #7#)))
                 . #20#)
           (LETT |i2|
                 (PROGN
                  (LETT #6# NIL . #20#)
                  (SEQ (LETT |k| NIL . #20#) (LETT #5# |i1| . #20#) G190
                       (COND
                        ((OR (ATOM #5#)
                             (PROGN (LETT |k| (CAR #5#) . #20#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #6#
                               (CONS
                                (PROGN
                                 (LETT #4# NIL . #20#)
                                 (SEQ (LETT |j| NIL . #20#)
                                      (LETT #3# |k| . #20#) G190
                                      (COND
                                       ((OR (ATOM #3#)
                                            (PROGN
                                             (LETT |j| (CAR #3#) . #20#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #4#
                                              (CONS
                                               (+ |j|
                                                  (SPADCALL |indexNxt|
                                                            (QREFELT $ 200)))
                                               #4#)
                                              . #20#)))
                                      (LETT #3# (CDR #3#) . #20#) (GO G190)
                                      G191 (EXIT (NREVERSE #4#))))
                                #6#)
                               . #20#)))
                       (LETT #5# (CDR #5#) . #20#) (GO G190) G191
                       (EXIT (NREVERSE #6#))))
                 . #20#)
           (SPADCALL |ptLst|
                     (SPADCALL (SPADCALL |ptLst| (QREFELT $ 201)) |p1|
                               (QREFELT $ 202))
                     (QREFELT $ 203))
           (SPADCALL |indexLst|
                     (SPADCALL (SPADCALL |indexLst| (QREFELT $ 204)) |i2|
                               (QREFELT $ 205))
                     (QREFELT $ 206))
           (SPADCALL |indexNxt|
                     (+ (SPADCALL |indexNxt| (QREFELT $ 200)) (LENGTH |p1|))
                     (QREFELT $ 207))
           (EXIT (PROGN (LETT #2# (|Void|) . #20#) (GO #2#))))))
        (COND
         ((EQUAL (QVELT |n| 0) 'DEF)
          (COND
           ((NULL (QEQCAR (QVELT |n| 2) 9))
            (|error| "toSVG parameter type not valid for def node")))))
        (COND
         ((EQUAL (QVELT |n| 0) 'USE)
          (COND
           ((NULL (QEQCAR (QVELT |n| 2) 9))
            (|error| "toSVG parameter type not valid for use node")))))
        (EXIT
         (COND ((< (SPADCALL (QVELT |n| 1) (QREFELT $ 177)) 1) (|Void|))
               ('T
                (SEQ
                 (SEQ (LETT |ch| NIL . #20#) (LETT #1# (QVELT |n| 1) . #20#)
                      G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |ch| (CAR #1#) . #20#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |ch| |ptLst| |indexLst| |indexNxt| |tran2|
                                  |bb2| (QREFELT $ 199))))
                      (LETT #1# (CDR #1#) . #20#) (GO G190) G191 (EXIT NIL))
                 (EXIT (|Void|))))))))
      #2# (EXIT #2#))))) 

(DEFUN |SCENE;toObj;$RRRStRV;95|
       (|n| |ptLst| |indexLst| |indexNxt| |tran| |bb| $)
  (SPADCALL |n| |ptLst| |indexLst| |indexNxt| |tran|
            (SPADCALL (QCAR |bb|) (QCDR |bb|) (QREFELT $ 10)) (QREFELT $ 199))) 

(DEFUN |SCENE;writeObj;$SV;96| (|n| |filename| $)
  (PROG (|s| #1=#:G1335 |i| #2=#:G1334 |row| #3=#:G1333 |v| |f1|
         |defaultBounds| |defaultTransform| |indexNxt| |indexLst| |ptLst|)
    (RETURN
     (SEQ
      (LETT |ptLst| (SPADCALL NIL (QREFELT $ 209))
            . #4=(|SCENE;writeObj;$SV;96|))
      (LETT |indexLst| (SPADCALL NIL (QREFELT $ 210)) . #4#)
      (LETT |indexNxt| (SPADCALL 0 (QREFELT $ 211)) . #4#)
      (LETT |defaultTransform| (SPADCALL (QREFELT $ 179)) . #4#)
      (LETT |defaultBounds| (SPADCALL (QREFELT $ 16)) . #4#)
      (SPADCALL |n| |ptLst| |indexLst| |indexNxt| |defaultTransform|
                |defaultBounds| (QREFELT $ 199))
      (LETT |f1|
            (SPADCALL (SPADCALL |filename| (QREFELT $ 213)) "output"
                      (QREFELT $ 215))
            . #4#)
      (SPADCALL |f1| "# mesh generated by axiom" (QREFELT $ 216))
      (SEQ (LETT |v| NIL . #4#)
           (LETT #3# (SPADCALL |ptLst| (QREFELT $ 201)) . #4#) G190
           (COND
            ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#) . #4#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |f1|
                       (SPADCALL
                        (LIST "v "
                              (|mathObject2String|
                               (SPADCALL |v| (QREFELT $ 81)))
                              " "
                              (|mathObject2String|
                               (SPADCALL |v| (QREFELT $ 82)))
                              " "
                              (|mathObject2String|
                               (SPADCALL |v| (QREFELT $ 188))))
                        (QREFELT $ 118))
                       (QREFELT $ 216))))
           (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
      (LETT |s| "" . #4#)
      (SEQ (LETT |row| NIL . #4#)
           (LETT #2# (SPADCALL |indexLst| (QREFELT $ 204)) . #4#) G190
           (COND
            ((OR (ATOM #2#) (PROGN (LETT |row| (CAR #2#) . #4#) NIL))
             (GO G191)))
           (SEQ (LETT |s| "f" . #4#)
                (SEQ (LETT |i| NIL . #4#) (LETT #1# |row| . #4#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #4#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |s|
                             (SPADCALL (LIST |s| " " (STRINGIMAGE (+ |i| 1)))
                                       (QREFELT $ 118))
                             . #4#)))
                     (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL |f1| |s| (QREFELT $ 216))))
           (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
      (SPADCALL |f1| (QREFELT $ 217)) (EXIT (|Void|)))))) 

(DEFUN |SCENE;writeVRML;$SV;97| (|n| |filename| $)
  (PROG (|defaultBounds| |defaultTransform| |defaultMaterial|)
    (RETURN
     (SEQ
      (LETT |defaultMaterial|
            (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "black" "black" 1.0)
            . #1=(|SCENE;writeVRML;$SV;97|))
      (LETT |defaultTransform| (SPADCALL (QREFELT $ 179)) . #1#)
      (LETT |defaultBounds| (SPADCALL (QREFELT $ 16)) . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL |n| |defaultMaterial| |defaultTransform| |defaultBounds|
                  (QREFELT $ 190))
        |filename| (QREFELT $ 219))))))) 

(DEFUN |SCENE;Fnan?| (|x| $) (SPADCALL |x| |x| (QREFELT $ 221))) 

(DEFUN |SCENE;applyfxTrap| (|ff| |f| $)
  (PROG (|r| |s|)
    (RETURN
     (SEQ
      (LETT |s| (|trapNumericErrors| (SPADCALL |f| |ff|))
            . #1=(|SCENE;applyfxTrap|))
      (EXIT
       (COND ((QEQCAR |s| 1) 0.0)
             (#2='T
              (SEQ (LETT |r| (QCDR |s|) . #1#)
                   (EXIT
                    (COND
                     ((SPADCALL |r| MOST-POSITIVE-DOUBLE-FLOAT (QREFELT $ 155))
                      MOST-POSITIVE-DOUBLE-FLOAT)
                     ((|less_DF| |r| MOST-NEGATIVE-DOUBLE-FLOAT)
                      MOST-NEGATIVE-DOUBLE-FLOAT)
                     (#2# |r|))))))))))) 

(DEFUN |SCENE;applyfxyTrap| (|ff| |u| |v| $)
  (PROG (|r| |s|)
    (RETURN
     (SEQ
      (LETT |s| (|trapNumericErrors| (SPADCALL |u| |v| |ff|))
            . #1=(|SCENE;applyfxyTrap|))
      (EXIT
       (COND ((QEQCAR |s| 1) 0.0)
             (#2='T
              (SEQ (LETT |r| (QCDR |s|) . #1#)
                   (EXIT
                    (COND
                     ((SPADCALL |r| MOST-POSITIVE-DOUBLE-FLOAT (QREFELT $ 155))
                      MOST-POSITIVE-DOUBLE-FLOAT)
                     ((|less_DF| |r| MOST-NEGATIVE-DOUBLE-FLOAT)
                      MOST-NEGATIVE-DOUBLE-FLOAT)
                     (#2# |r|))))))))))) 

(DEFUN |SCENE;normalize| (|seg| $)
  (PROG (|b| |a|)
    (RETURN
     (SEQ (LETT |a| (SPADCALL |seg| (QREFELT $ 139)) . #1=(|SCENE;normalize|))
          (LETT |b| (SPADCALL |seg| (QREFELT $ 140)) . #1#)
          (EXIT
           (COND
            ((|eql_DF| |a| |b|) (|error| "The range specified is too small"))
            ((|less_DF| |a| |b|) (SPADCALL |a| |b| (QREFELT $ 222)))
            ('T (SPADCALL |b| |a| (QREFELT $ 222))))))))) 

(DEFUN |SCENE;checkRange| (|r| $)
  (COND
   ((SPADCALL (SPADCALL |r| (QREFELT $ 139)) (SPADCALL |r| (QREFELT $ 140))
              (QREFELT $ 155))
    (|error| "ranges cannot be negative"))
   ('T |r|))) 

(DEFUN |SCENE;createPlot1Din2D;MSNni$;103| (|f| |tRange| |numPts| $)
  (PROG (|branches| |newl| #1=#:G1367 |p| |p0| |t| |l| #2=#:G1366 |i| |s| |h|)
    (RETURN
     (SEQ (|SCENE;checkRange| |tRange| $)
          (LETT |l| (SPADCALL |tRange| (QREFELT $ 139))
                . #3=(|SCENE;createPlot1Din2D;MSNni$;103|))
          (LETT |h| (SPADCALL |tRange| (QREFELT $ 140)) . #3#)
          (LETT |t| (SPADCALL |l| (QREFELT $ 224)) . #3#)
          (LETT |p0| (SPADCALL (SPADCALL |l| |f|) (QREFELT $ 225)) . #3#)
          (LETT |s|
                (|div_DF| (|sub_DF| |h| |l|)
                          (FLOAT (- |numPts| 1) MOST-POSITIVE-DOUBLE-FLOAT))
                . #3#)
          (SEQ (LETT |i| 2 . #3#) (LETT #2# (- |numPts| 1) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ (LETT |l| (|add_DF| |l| |s|) . #3#)
                    (LETT |t| (CONS |l| |t|) . #3#)
                    (EXIT (LETT |p0| (CONS (SPADCALL |l| |f|) |p0|) . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (LETT |t| (NREVERSE (CONS |h| |t|)) . #3#)
          (LETT |p0| (NREVERSE (CONS (SPADCALL |h| |f|) |p0|)) . #3#)
          (LETT |branches| NIL . #3#) (LETT |newl| NIL . #3#)
          (SEQ (LETT |p| NIL . #3#) (LETT #1# |p0| . #3#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |p| (QREFELT $ 226))
                   (COND
                    ((NULL (NULL |newl|))
                     (SEQ
                      (LETT |branches|
                            (CONS (LETT |newl| (NREVERSE |newl|) . #3#)
                                  |branches|)
                            . #3#)
                      (EXIT (LETT |newl| NIL . #3#))))))
                  ('T (LETT |newl| (CONS |p| |newl|) . #3#)))))
               (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
          (COND
           ((NULL (NULL |newl|))
            (LETT |branches|
                  (CONS (LETT |newl| (NREVERSE |newl|) . #3#) |branches|)
                  . #3#)))
          (EXIT (SPADCALL |branches| (QREFELT $ 32))))))) 

(DEFUN |SCENE;addPlot1Din2D;$MSNni$;104| (|n| |f| |tRange| |numPts| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |f| |tRange| |numPts| (QREFELT $ 228))
            |SCENE;addPlot1Din2D;$MSNni$;104|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createPlot1Din2D;MSNni$;105| (|f| |seg| |numPts| $)
  (PROG (|ff|)
    (RETURN
     (SEQ
      (LETT |ff|
            (LIST
             (CONS #'|SCENE;createPlot1Din2D;MSNni$;105!0| (VECTOR $ |f|)))
            |SCENE;createPlot1Din2D;MSNni$;105|)
      (EXIT
       (SPADCALL (SPADCALL |ff| (QREFELT $ 231)) (|SCENE;normalize| |seg| $)
                 |numPts| (QREFELT $ 228))))))) 

(DEFUN |SCENE;createPlot1Din2D;MSNni$;105!0| (|x| $$)
  (PROG (|f| $)
    (LETT |f| (QREFELT $$ 1) . #1=(|SCENE;createPlot1Din2D;MSNni$;105|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL |x| (|SCENE;applyfxTrap| |f| |x| $) (QREFELT $ 83)))))) 

(DEFUN |SCENE;addPlot1Din2D;$MSNni$;106| (|n| |f| |seg| |numPts| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |f| |seg| |numPts| (QREFELT $ 233))
            |SCENE;addPlot1Din2D;$MSNni$;106|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createPlot1Din2Dparametric;PpcSNni$;107| (|ppc| |seg| |numPts| $)
  (PROG (|fcn| |g| |f|)
    (RETURN
     (SEQ
      (LETT |f| (SPADCALL |ppc| 1 (QREFELT $ 236))
            . #1=(|SCENE;createPlot1Din2Dparametric;PpcSNni$;107|))
      (LETT |g| (SPADCALL |ppc| 2 (QREFELT $ 236)) . #1#)
      (LETT |fcn|
            (LIST
             (CONS #'|SCENE;createPlot1Din2Dparametric;PpcSNni$;107!0|
                   (VECTOR |g| $ |f|)))
            . #1#)
      (EXIT
       (SPADCALL (SPADCALL |fcn| (QREFELT $ 231)) (|SCENE;normalize| |seg| $)
                 |numPts| (QREFELT $ 228))))))) 

(DEFUN |SCENE;createPlot1Din2Dparametric;PpcSNni$;107!0| (|x| $$)
  (PROG (|f| $ |g|)
    (LETT |f| (QREFELT $$ 2)
          . #1=(|SCENE;createPlot1Din2Dparametric;PpcSNni$;107|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |g| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (|SCENE;applyfxTrap| |f| |x| $) (|SCENE;applyfxTrap| |g| |x| $)
                (QREFELT $ 83)))))) 

(DEFUN |SCENE;addPlot1Din2Dparametric;$PpcSNni$;108|
       (|n| |ppc| |seg| |numPts| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |ppc| |seg| |numPts| (QREFELT $ 237))
            |SCENE;addPlot1Din2Dparametric;$PpcSNni$;108|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createPlot1Din3Dparametric;PscSNni$;109| (|psc| |seg| |numPts| $)
  (PROG (|fcn| |h| |g| |f|)
    (RETURN
     (SEQ
      (LETT |f| (SPADCALL |psc| 1 (QREFELT $ 240))
            . #1=(|SCENE;createPlot1Din3Dparametric;PscSNni$;109|))
      (LETT |g| (SPADCALL |psc| 2 (QREFELT $ 240)) . #1#)
      (LETT |h| (SPADCALL |psc| 3 (QREFELT $ 240)) . #1#)
      (LETT |fcn|
            (CONS #'|SCENE;createPlot1Din3Dparametric;PscSNni$;109!0|
                  (VECTOR |h| |g| $ |f|))
            . #1#)
      (EXIT (SPADCALL |fcn| |seg| |numPts| (QREFELT $ 241))))))) 

(DEFUN |SCENE;createPlot1Din3Dparametric;PscSNni$;109!0| (|x| $$)
  (PROG (|f| $ |g| |h|)
    (LETT |f| (QREFELT $$ 3)
          . #1=(|SCENE;createPlot1Din3Dparametric;PscSNni$;109|))
    (LETT $ (QREFELT $$ 2) . #1#)
    (LETT |g| (QREFELT $$ 1) . #1#)
    (LETT |h| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (|SCENE;applyfxTrap| |f| |x| $) (|SCENE;applyfxTrap| |g| |x| $)
                (|SCENE;applyfxTrap| |h| |x| $) (QREFELT $ 65)))))) 

(DEFUN |SCENE;addPlot1Din3Dparametric;$PscSNni$;110|
       (|n| |psc| |seg| |numPts| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |psc| |seg| |numPts| (QREFELT $ 242))
            |SCENE;addPlot1Din3Dparametric;$PscSNni$;110|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createPlot1Din3Dparametric;MSNni$;111| (|psc| |seg| |numPts| $)
  (PROG (|p| |t| |l| #1=#:G1406 |i| |s| |h| |tRange| |f|)
    (RETURN
     (SEQ (LETT |f| |psc| . #2=(|SCENE;createPlot1Din3Dparametric;MSNni$;111|))
          (LETT |tRange| (|SCENE;normalize| |seg| $) . #2#)
          (|SCENE;checkRange| |tRange| $)
          (LETT |l| (SPADCALL |tRange| (QREFELT $ 139)) . #2#)
          (LETT |h| (SPADCALL |tRange| (QREFELT $ 140)) . #2#)
          (LETT |t| (SPADCALL |l| (QREFELT $ 224)) . #2#)
          (LETT |p| (SPADCALL (SPADCALL |l| |f|) (QREFELT $ 225)) . #2#)
          (LETT |s|
                (|div_DF| (|sub_DF| |h| |l|)
                          (FLOAT (- |numPts| 1) MOST-POSITIVE-DOUBLE-FLOAT))
                . #2#)
          (SEQ (LETT |i| 2 . #2#) (LETT #1# (- |numPts| 1) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ (LETT |l| (|add_DF| |l| |s|) . #2#)
                    (LETT |t| (CONS |l| |t|) . #2#)
                    (EXIT (LETT |p| (CONS (SPADCALL |l| |f|) |p|) . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (LETT |t| (NREVERSE (CONS |h| |t|)) . #2#)
          (LETT |p| (NREVERSE (CONS (SPADCALL |h| |f|) |p|)) . #2#)
          (EXIT (SPADCALL |p| (QREFELT $ 23))))))) 

(DEFUN |SCENE;addPlot1Din3Dparametric;$MSNni$;112| (|n| |psc| |seg| |numPts| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |psc| |seg| |numPts| (QREFELT $ 241))
            |SCENE;addPlot1Din3Dparametric;$MSNni$;112|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createPlot2Din3D;M2SNni$;113| (|ptFun| |uSeg| |vSeg| |numPts| $)
  (PROG (|someV| |llp| |someU| |lp| |pt| |iu| |iv| |vstep| |ustep|)
    (RETURN
     (SEQ (LETT |llp| NIL . #1=(|SCENE;createPlot2Din3D;M2SNni$;113|))
          (LETT |ustep|
                (|div_DF_I|
                 (|sub_DF| (SPADCALL |uSeg| (QREFELT $ 139))
                           (SPADCALL |uSeg| (QREFELT $ 140)))
                 |numPts|)
                . #1#)
          (LETT |vstep|
                (|div_DF_I|
                 (|sub_DF| (SPADCALL |vSeg| (QREFELT $ 139))
                           (SPADCALL |vSeg| (QREFELT $ 140)))
                 |numPts|)
                . #1#)
          (LETT |someV| (SPADCALL |vSeg| (QREFELT $ 140)) . #1#)
          (SEQ (LETT |iv| |numPts| . #1#) G190 (COND ((< |iv| 0) (GO G191)))
               (SEQ
                (COND
                 ((ZEROP |iv|)
                  (LETT |someV| (SPADCALL |vSeg| (QREFELT $ 139)) . #1#)))
                (LETT |lp| NIL . #1#)
                (LETT |someU| (SPADCALL |uSeg| (QREFELT $ 140)) . #1#)
                (SEQ (LETT |iu| |numPts| . #1#) G190
                     (COND ((< |iu| 0) (GO G191)))
                     (SEQ
                      (COND
                       ((ZEROP |iu|)
                        (LETT |someU| (SPADCALL |uSeg| (QREFELT $ 139))
                              . #1#)))
                      (LETT |pt| (SPADCALL |someU| |someV| |ptFun|) . #1#)
                      (LETT |lp| (CONS |pt| |lp|) . #1#)
                      (EXIT (LETT |someU| (|add_DF| |someU| |ustep|) . #1#)))
                     (LETT |iu| (+ |iu| -1) . #1#) (GO G190) G191 (EXIT NIL))
                (LETT |llp| (CONS |lp| |llp|) . #1#)
                (EXIT (LETT |someV| (|add_DF| |someV| |vstep|) . #1#)))
               (LETT |iv| (+ |iv| -1) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (SPADCALL |llp| 'NIL (QREFELT $ 192)) (QREFELT $ 63))))))) 

(DEFUN |SCENE;createPlot2Din3D;M2SNni$;114| (|f| |xSeg| |ySeg| |numPts| $)
  (PROG (|fcn|)
    (RETURN
     (SEQ
      (LETT |fcn|
            (LIST
             (CONS #'|SCENE;createPlot2Din3D;M2SNni$;114!0| (VECTOR $ |f|)))
            |SCENE;createPlot2Din3D;M2SNni$;114|)
      (EXIT
       (SPADCALL (SPADCALL |fcn| (QREFELT $ 248)) (|SCENE;normalize| |xSeg| $)
                 (|SCENE;normalize| |ySeg| $) |numPts| (QREFELT $ 246))))))) 

(DEFUN |SCENE;createPlot2Din3D;M2SNni$;114!0| (|x| |y| $$)
  (PROG (|f| $)
    (LETT |f| (QREFELT $$ 1) . #1=(|SCENE;createPlot2Din3D;M2SNni$;114|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (|SCENE;applyfxyTrap| |f| |x| |y| $) |x| |y| (QREFELT $ 65)))))) 

(DEFUN |SCENE;addPlot2Din3D;$M2SNni$;115| (|n| |f| |xSeg| |ySeg| |numPts| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |f| |xSeg| |ySeg| |numPts| (QREFELT $ 250))
            |SCENE;addPlot2Din3D;$M2SNni$;115|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createPlot2Din3Dparametric;Ps2SNni$;116|
       (|s| |uSeg| |vSeg| |numPts| $)
  (PROG (|fcn| |h| |g| |f|)
    (RETURN
     (SEQ
      (LETT |f| (LIST (SPADCALL |s| (|spadConstant| $ 253) (QREFELT $ 255)))
            . #1=(|SCENE;createPlot2Din3Dparametric;Ps2SNni$;116|))
      (LETT |g| (LIST (SPADCALL |s| 2 (QREFELT $ 255))) . #1#)
      (LETT |h| (LIST (SPADCALL |s| 3 (QREFELT $ 255))) . #1#)
      (LETT |fcn|
            (LIST
             (CONS #'|SCENE;createPlot2Din3Dparametric;Ps2SNni$;116!0|
                   (VECTOR |h| |g| $ |f|)))
            . #1#)
      (EXIT
       (SPADCALL (SPADCALL |fcn| (QREFELT $ 248)) (|SCENE;normalize| |uSeg| $)
                 (|SCENE;normalize| |vSeg| $) |numPts| (QREFELT $ 246))))))) 

(DEFUN |SCENE;createPlot2Din3Dparametric;Ps2SNni$;116!0| (|x| |y| $$)
  (PROG (|f| $ |g| |h|)
    (LETT |f| (QREFELT $$ 3)
          . #1=(|SCENE;createPlot2Din3Dparametric;Ps2SNni$;116|))
    (LETT $ (QREFELT $$ 2) . #1#)
    (LETT |g| (QREFELT $$ 1) . #1#)
    (LETT |h| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (|SCENE;applyfxyTrap| (SPADCALL |f| (QREFELT $ 257)) |x| |y| $)
                (|SCENE;applyfxyTrap| (SPADCALL |g| (QREFELT $ 257)) |x| |y| $)
                (|SCENE;applyfxyTrap| (SPADCALL |h| (QREFELT $ 257)) |x| |y| $)
                (QREFELT $ 65)))))) 

(DEFUN |SCENE;addPlot2Din3Dparametric;$Ps2SNni$;117|
       (|n| |s| |uSeg| |vSeg| |numPts| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |s| |uSeg| |vSeg| |numPts| (QREFELT $ 258))
            |SCENE;addPlot2Din3Dparametric;$Ps2SNni$;117|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;createPlot2Din3Dparametric;M2SNni$;118|
       (|s| |uSeg| |vSeg| |numPts| $)
  (PROG (|fcn|)
    (RETURN
     (SEQ
      (LETT |fcn| (LIST |s|) |SCENE;createPlot2Din3Dparametric;M2SNni$;118|)
      (EXIT
       (SPADCALL (SPADCALL |fcn| (QREFELT $ 248)) (|SCENE;normalize| |uSeg| $)
                 (|SCENE;normalize| |vSeg| $) |numPts| (QREFELT $ 246))))))) 

(DEFUN |SCENE;addPlot2Din3Dparametric;$M2SNni$;119|
       (|n| |s| |uSeg| |vSeg| |numPts| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |s| |uSeg| |vSeg| |numPts| (QREFELT $ 260))
            |SCENE;addPlot2Din3Dparametric;$M2SNni$;119|)
      (SPADCALL |n| |c| (QREFELT $ 20)) (EXIT |c|))))) 

(DEFUN |SCENE;outputLPoints| (|ps| $)
  (PROG (#1=#:G1471)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((< (LENGTH |ps|) 4)
          (PROGN
           (LETT #1# (SPADCALL |ps| (QREFELT $ 263)) |SCENE;outputLPoints|)
           (GO #1#))))
        (EXIT
         (SPADCALL
          (LIST (SPADCALL (|SPADfirst| |ps|) (QREFELT $ 264))
                (SPADCALL (SPADCALL |ps| (QREFELT $ 265)) (QREFELT $ 264))
                "....")
          (QREFELT $ 266)))))
      #1# (EXIT #1#))))) 

(DEFUN |SCENE;outputLLPoints| (|ps| $)
  (PROG (#1=#:G1475 #2=#:G1477 |x| #3=#:G1476)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((< (LENGTH |ps|) 4)
          (PROGN
           (LETT #1#
                 (SPADCALL
                  (PROGN
                   (LETT #3# NIL . #4=(|SCENE;outputLLPoints|))
                   (SEQ (LETT |x| NIL . #4#) (LETT #2# |ps| . #4#) G190
                        (COND
                         ((OR (ATOM #2#)
                              (PROGN (LETT |x| (CAR #2#) . #4#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #3# (CONS (|SCENE;outputLPoints| |x| $) #3#)
                                . #4#)))
                        (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                        (EXIT (NREVERSE #3#))))
                  (QREFELT $ 266))
                 . #4#)
           (GO #1#))))
        (EXIT
         (SPADCALL
          (LIST (|SCENE;outputLPoints| (|SPADfirst| |ps|) $)
                (|SCENE;outputLPoints| (SPADCALL |ps| (QREFELT $ 267)) $)
                "....")
          (QREFELT $ 266)))))
      #1# (EXIT #1#))))) 

(DEFUN |SCENE;outputLIndexes| (|ps| $)
  (PROG (#1=#:G1480)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((< (SPADCALL |ps| (QREFELT $ 108)) 4)
          (PROGN
           (LETT #1# (SPADCALL |ps| (QREFELT $ 268)) |SCENE;outputLIndexes|)
           (GO #1#))))
        (EXIT
         (SPADCALL
          (LIST (SPADCALL (|SPADfirst| |ps|) (QREFELT $ 269))
                (SPADCALL (SPADCALL |ps| (QREFELT $ 270)) (QREFELT $ 269))
                "....")
          (QREFELT $ 266)))))
      #1# (EXIT #1#))))) 

(DEFUN |SCENE;outputLLIndexes| (|ps| $)
  (PROG (#1=#:G1484 #2=#:G1486 |x| #3=#:G1485)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((< (LENGTH |ps|) 4)
          (PROGN
           (LETT #1#
                 (SPADCALL
                  (PROGN
                   (LETT #3# NIL . #4=(|SCENE;outputLLIndexes|))
                   (SEQ (LETT |x| NIL . #4#) (LETT #2# |ps| . #4#) G190
                        (COND
                         ((OR (ATOM #2#)
                              (PROGN (LETT |x| (CAR #2#) . #4#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #3# (CONS (|SCENE;outputLIndexes| |x| $) #3#)
                                . #4#)))
                        (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                        (EXIT (NREVERSE #3#))))
                  (QREFELT $ 266))
                 . #4#)
           (GO #1#))))
        (EXIT
         (SPADCALL
          (LIST (|SCENE;outputLIndexes| (|SPADfirst| |ps|) $)
                (|SCENE;outputLIndexes| (SPADCALL |ps| (QREFELT $ 271)) $)
                "....")
          (QREFELT $ 266)))))
      #1# (EXIT #1#))))) 

(DEFUN |SCENE;coerce;$Of;124| (|n| $)
  (PROG (|s| |nam| #1=#:G1505 |nn| #2=#:G1504 |sz| #3=#:G1502 |md| |ofs| |ena|
         |str| #4=#:G1501 |m| |pts| |pt| #5=#:G1500 |ix| #6=#:G1498 |tr|
         #7=#:G1499 |npt| #8=#:G1497 |p| |t| |mo| #9=#:G1496 |fc| |lc| |lw|
         |pt2| #10=#:G1503 |pt1| |tp| #11=#:G1495)
    (RETURN
     (SEQ (LETT |s| "scene " . #12=(|SCENE;coerce;$Of;124|))
          (COND
           ((EQUAL (QVELT |n| 0) 'ROOT)
            (LETT |s|
                  (SPADCALL
                   (LIST |s| "root "
                         (SPADCALL
                          (PROG2 (LETT #6# (QVELT |n| 2) . #12#)
                              (QCDR #6#)
                            (|check_union| (QEQCAR #6# 3)
                                           (|SBoundary| (QREFELT $ 6)) #6#))
                          (QREFELT $ 272)))
                   (QREFELT $ 273))
                  . #12#)))
          (COND
           ((EQUAL (QVELT |n| 0) 'GROUP)
            (LETT |s| (SPADCALL |s| "group" (QREFELT $ 274)) . #12#)))
          (COND
           ((EQUAL (QVELT |n| 0) 'LINE)
            (LETT |s|
                  (SPADCALL
                   (LIST |s| "line "
                         (|SCENE;outputLLPoints|
                          (PROG2 (LETT #11# (QVELT |n| 2) . #12#)
                              (QCDR #11#)
                            (|check_union| (QEQCAR #11# 0)
                                           (|List| (|List| (QREFELT $ 6)))
                                           #11#))
                          $))
                   (QREFELT $ 273))
                  . #12#)))
          (COND
           ((EQUAL (QVELT |n| 0) 'SHAPE)
            (SEQ
             (LETT |tp|
                   (QVELT
                    (PROG2 (LETT #10# (QVELT |n| 2) . #12#)
                        (QCDR #10#)
                      (|check_union| (QEQCAR #10# 8)
                                     (|Record| (|:| |shptype| (|Symbol|))
                                               (|:| |centre| (QREFELT $ 6))
                                               (|:| |size| (QREFELT $ 6))
                                               (|:| |fill| (|Boolean|)))
                                     #10#))
                    0)
                   . #12#)
             (LETT |pt1|
                   (QVELT
                    (PROG2 (LETT #10# (QVELT |n| 2) . #12#)
                        (QCDR #10#)
                      (|check_union| (QEQCAR #10# 8)
                                     (|Record| (|:| |shptype| (|Symbol|))
                                               (|:| |centre| (QREFELT $ 6))
                                               (|:| |size| (QREFELT $ 6))
                                               (|:| |fill| (|Boolean|)))
                                     #10#))
                    1)
                   . #12#)
             (LETT |pt2|
                   (QVELT
                    (PROG2 (LETT #10# (QVELT |n| 2) . #12#)
                        (QCDR #10#)
                      (|check_union| (QEQCAR #10# 8)
                                     (|Record| (|:| |shptype| (|Symbol|))
                                               (|:| |centre| (QREFELT $ 6))
                                               (|:| |size| (QREFELT $ 6))
                                               (|:| |fill| (|Boolean|)))
                                     #10#))
                    2)
                   . #12#)
             (EXIT
              (LETT |s|
                    (SPADCALL
                     (LIST |s| "shape" " type=" (SPADCALL |tp| (QREFELT $ 275))
                           " pt1=" (SPADCALL |pt1| (QREFELT $ 264)) " pt2="
                           (SPADCALL |pt2| (QREFELT $ 264)))
                     (QREFELT $ 273))
                    . #12#)))))
          (COND
           ((EQUAL (QVELT |n| 0) 'MATERIAL)
            (SEQ
             (LETT |lw|
                   (QVELT
                    (PROG2 (LETT #9# (QVELT |n| 2) . #12#)
                        (QCDR #9#)
                      (|check_union| (QEQCAR #9# 1)
                                     (|Record|
                                      (|:| |lineWidth| (|DoubleFloat|))
                                      (|:| |lineCol| (|String|))
                                      (|:| |fillCol| (|String|))
                                      (|:| |matOpacity| (|DoubleFloat|)))
                                     #9#))
                    0)
                   . #12#)
             (LETT |lc|
                   (QVELT
                    (PROG2 (LETT #9# (QVELT |n| 2) . #12#)
                        (QCDR #9#)
                      (|check_union| (QEQCAR #9# 1)
                                     (|Record|
                                      (|:| |lineWidth| (|DoubleFloat|))
                                      (|:| |lineCol| (|String|))
                                      (|:| |fillCol| (|String|))
                                      (|:| |matOpacity| (|DoubleFloat|)))
                                     #9#))
                    1)
                   . #12#)
             (LETT |fc|
                   (QVELT
                    (PROG2 (LETT #9# (QVELT |n| 2) . #12#)
                        (QCDR #9#)
                      (|check_union| (QEQCAR #9# 1)
                                     (|Record|
                                      (|:| |lineWidth| (|DoubleFloat|))
                                      (|:| |lineCol| (|String|))
                                      (|:| |fillCol| (|String|))
                                      (|:| |matOpacity| (|DoubleFloat|)))
                                     #9#))
                    2)
                   . #12#)
             (LETT |mo|
                   (QVELT
                    (PROG2 (LETT #9# (QVELT |n| 2) . #12#)
                        (QCDR #9#)
                      (|check_union| (QEQCAR #9# 1)
                                     (|Record|
                                      (|:| |lineWidth| (|DoubleFloat|))
                                      (|:| |lineCol| (|String|))
                                      (|:| |fillCol| (|String|))
                                      (|:| |matOpacity| (|DoubleFloat|)))
                                     #9#))
                    3)
                   . #12#)
             (EXIT
              (LETT |s|
                    (SPADCALL
                     (LIST |s| "material" " lw="
                           (SPADCALL |lw| (QREFELT $ 276)) " lc="
                           (SPADCALL |lc| (QREFELT $ 277)) " fc="
                           (SPADCALL |fc| (QREFELT $ 277)) " mo="
                           (SPADCALL |mo| (QREFELT $ 276)))
                     (QREFELT $ 273))
                    . #12#)))))
          (COND
           ((EQUAL (QVELT |n| 0) 'TEXT)
            (SEQ
             (LETT |t|
                   (QVELT
                    (PROG2 (LETT #8# (QVELT |n| 2) . #12#)
                        (QCDR #8#)
                      (|check_union| (QEQCAR #8# 2)
                                     (|Record| (|:| |txt| (|String|))
                                               (|:| |siz|
                                                    (|NonNegativeInteger|))
                                               (|:| |pos| (QREFELT $ 6))
                                               (|:| |np| (|List| (|String|))))
                                     #8#))
                    0)
                   . #12#)
             (LETT |sz|
                   (QVELT
                    (PROG2 (LETT #8# (QVELT |n| 2) . #12#)
                        (QCDR #8#)
                      (|check_union| (QEQCAR #8# 2)
                                     (|Record| (|:| |txt| (|String|))
                                               (|:| |siz|
                                                    (|NonNegativeInteger|))
                                               (|:| |pos| (QREFELT $ 6))
                                               (|:| |np| (|List| (|String|))))
                                     #8#))
                    1)
                   . #12#)
             (LETT |p|
                   (QVELT
                    (PROG2 (LETT #8# (QVELT |n| 2) . #12#)
                        (QCDR #8#)
                      (|check_union| (QEQCAR #8# 2)
                                     (|Record| (|:| |txt| (|String|))
                                               (|:| |siz|
                                                    (|NonNegativeInteger|))
                                               (|:| |pos| (QREFELT $ 6))
                                               (|:| |np| (|List| (|String|))))
                                     #8#))
                    2)
                   . #12#)
             (LETT |npt|
                   (QVELT
                    (PROG2 (LETT #8# (QVELT |n| 2) . #12#)
                        (QCDR #8#)
                      (|check_union| (QEQCAR #8# 2)
                                     (|Record| (|:| |txt| (|String|))
                                               (|:| |siz|
                                                    (|NonNegativeInteger|))
                                               (|:| |pos| (QREFELT $ 6))
                                               (|:| |np| (|List| (|String|))))
                                     #8#))
                    3)
                   . #12#)
             (EXIT
              (LETT |s|
                    (SPADCALL
                     (LIST |s| "text=" (SPADCALL |t| (QREFELT $ 277)) " sz="
                           (SPADCALL |sz| (QREFELT $ 269)) " p="
                           (SPADCALL |p| (QREFELT $ 264)) " npt="
                           (SPADCALL |npt| (QREFELT $ 278)))
                     (QREFELT $ 273))
                    . #12#)))))
          (COND
           ((EQUAL (QVELT |n| 0) 'TRANSFORM)
            (SEQ
             (LETT |tr|
                   (PROG2 (LETT #7# (QVELT |n| 2) . #12#)
                       (QCDR #7#)
                     (|check_union| (QEQCAR #7# 4) (|STransform| (QREFELT $ 6))
                                    #7#))
                   . #12#)
             (EXIT
              (LETT |s|
                    (SPADCALL
                     (LIST |s| "transform" " tr="
                           (SPADCALL |tr| (QREFELT $ 279)))
                     (QREFELT $ 273))
                    . #12#)))))
          (COND
           ((EQUAL (QVELT |n| 0) 'CLIP)
            (LETT |s|
                  (SPADCALL
                   (LIST |s| "clip "
                         (SPADCALL
                          (PROG2 (LETT #6# (QVELT |n| 2) . #12#)
                              (QCDR #6#)
                            (|check_union| (QEQCAR #6# 3)
                                           (|SBoundary| (QREFELT $ 6)) #6#))
                          (QREFELT $ 272)))
                   (QREFELT $ 273))
                  . #12#)))
          (COND
           ((EQUAL (QVELT |n| 0) 'IFS)
            (SEQ
             (LETT |ix|
                   (QCAR
                    (PROG2 (LETT #5# (QVELT |n| 2) . #12#)
                        (QCDR #5#)
                      (|check_union| (QEQCAR #5# 5)
                                     (|Record|
                                      (|:| |inx|
                                           (|List|
                                            (|List| (|NonNegativeInteger|))))
                                      (|:| |pts| (|List| (QREFELT $ 6))))
                                     #5#)))
                   . #12#)
             (LETT |pt|
                   (QCDR
                    (PROG2 (LETT #5# (QVELT |n| 2) . #12#)
                        (QCDR #5#)
                      (|check_union| (QEQCAR #5# 5)
                                     (|Record|
                                      (|:| |inx|
                                           (|List|
                                            (|List| (|NonNegativeInteger|))))
                                      (|:| |pts| (|List| (QREFELT $ 6))))
                                     #5#)))
                   . #12#)
             (EXIT
              (LETT |s|
                    (SPADCALL
                     (LIST |s| "ifs" " ix=" (|SCENE;outputLLIndexes| |ix| $)
                           " pt=" (|SCENE;outputLPoints| |pt| $))
                     (QREFELT $ 273))
                    . #12#)))))
          (COND
           ((EQUAL (QVELT |n| 0) 'ARROWS)
            (SEQ
             (LETT |pts|
                   (QVELT
                    (PROG2 (LETT #4# (QVELT |n| 2) . #12#)
                        (QCDR #4#)
                      (|check_union| (QEQCAR #4# 6)
                                     (|Record|
                                      (|:| |ln|
                                           (|List| (|List| (QREFELT $ 6))))
                                      (|:| |mode| (|Symbol|))
                                      (|:| |size| (|DoubleFloat|)))
                                     #4#))
                    0)
                   . #12#)
             (LETT |m|
                   (QVELT
                    (PROG2 (LETT #4# (QVELT |n| 2) . #12#)
                        (QCDR #4#)
                      (|check_union| (QEQCAR #4# 6)
                                     (|Record|
                                      (|:| |ln|
                                           (|List| (|List| (QREFELT $ 6))))
                                      (|:| |mode| (|Symbol|))
                                      (|:| |size| (|DoubleFloat|)))
                                     #4#))
                    1)
                   . #12#)
             (LETT |sz|
                   (QVELT
                    (PROG2 (LETT #4# (QVELT |n| 2) . #12#)
                        (QCDR #4#)
                      (|check_union| (QEQCAR #4# 6)
                                     (|Record|
                                      (|:| |ln|
                                           (|List| (|List| (QREFELT $ 6))))
                                      (|:| |mode| (|Symbol|))
                                      (|:| |size| (|DoubleFloat|)))
                                     #4#))
                    2)
                   . #12#)
             (EXIT
              (LETT |s|
                    (SPADCALL
                     (LIST |s| "arrows" " pts="
                           (|SCENE;outputLLPoints| |pts| $) " m="
                           (SPADCALL |m| (QREFELT $ 275)) " sz="
                           (SPADCALL |sz| (QREFELT $ 276)))
                     (QREFELT $ 273))
                    . #12#)))))
          (COND
           ((EQUAL (QVELT |n| 0) 'ARROW)
            (SEQ
             (LETT |str|
                   (QVELT
                    (PROG2 (LETT #3# (QVELT |n| 2) . #12#)
                        (QCDR #3#)
                      (|check_union| (QEQCAR #3# 7)
                                     (|Record| (|:| |st| (|String|))
                                               (|:| |en| (|String|))
                                               (|:| |offset| (QREFELT $ 6))
                                               (|:| |mode| (|Symbol|))
                                               (|:| |size| (|DoubleFloat|)))
                                     #3#))
                    0)
                   . #12#)
             (LETT |ena|
                   (QVELT
                    (PROG2 (LETT #3# (QVELT |n| 2) . #12#)
                        (QCDR #3#)
                      (|check_union| (QEQCAR #3# 7)
                                     (|Record| (|:| |st| (|String|))
                                               (|:| |en| (|String|))
                                               (|:| |offset| (QREFELT $ 6))
                                               (|:| |mode| (|Symbol|))
                                               (|:| |size| (|DoubleFloat|)))
                                     #3#))
                    1)
                   . #12#)
             (LETT |ofs|
                   (QVELT
                    (PROG2 (LETT #3# (QVELT |n| 2) . #12#)
                        (QCDR #3#)
                      (|check_union| (QEQCAR #3# 7)
                                     (|Record| (|:| |st| (|String|))
                                               (|:| |en| (|String|))
                                               (|:| |offset| (QREFELT $ 6))
                                               (|:| |mode| (|Symbol|))
                                               (|:| |size| (|DoubleFloat|)))
                                     #3#))
                    2)
                   . #12#)
             (LETT |md|
                   (QVELT
                    (PROG2 (LETT #3# (QVELT |n| 2) . #12#)
                        (QCDR #3#)
                      (|check_union| (QEQCAR #3# 7)
                                     (|Record| (|:| |st| (|String|))
                                               (|:| |en| (|String|))
                                               (|:| |offset| (QREFELT $ 6))
                                               (|:| |mode| (|Symbol|))
                                               (|:| |size| (|DoubleFloat|)))
                                     #3#))
                    3)
                   . #12#)
             (LETT |sz|
                   (QVELT
                    (PROG2 (LETT #3# (QVELT |n| 2) . #12#)
                        (QCDR #3#)
                      (|check_union| (QEQCAR #3# 7)
                                     (|Record| (|:| |st| (|String|))
                                               (|:| |en| (|String|))
                                               (|:| |offset| (QREFELT $ 6))
                                               (|:| |mode| (|Symbol|))
                                               (|:| |size| (|DoubleFloat|)))
                                     #3#))
                    4)
                   . #12#)
             (EXIT
              (LETT |s|
                    (SPADCALL
                     (LIST |s| "arrows" " str="
                           (SPADCALL |str| (QREFELT $ 277)) " ena="
                           (SPADCALL |ena| (QREFELT $ 277)) " ofs="
                           (SPADCALL |ofs| (QREFELT $ 264)) " md="
                           (SPADCALL |md| (QREFELT $ 275)) " sz="
                           (SPADCALL |sz| (QREFELT $ 276)))
                     (QREFELT $ 273))
                    . #12#)))))
          (COND
           ((EQUAL (QVELT |n| 0) 'DEF)
            (SEQ
             (LETT |nn|
                   (QCAR
                    (PROG2 (LETT #2# (QVELT |n| 2) . #12#)
                        (QCDR #2#)
                      (|check_union| (QEQCAR #2# 9)
                                     (|Record| (|:| |nme| (|String|))
                                               (|:| |node| $))
                                     #2#)))
                   . #12#)
             (EXIT
              (LETT |s|
                    (SPADCALL
                     (LIST |s| "def" " nn=" (SPADCALL |nn| (QREFELT $ 277)))
                     (QREFELT $ 273))
                    . #12#)))))
          (COND
           ((EQUAL (QVELT |n| 0) 'USE)
            (SEQ
             (LETT |nn|
                   (QCAR
                    (PROG2 (LETT #2# (QVELT |n| 2) . #12#)
                        (QCDR #2#)
                      (|check_union| (QEQCAR #2# 9)
                                     (|Record| (|:| |nme| (|String|))
                                               (|:| |node| $))
                                     #2#)))
                   . #12#)
             (EXIT
              (LETT |s|
                    (SPADCALL
                     (LIST |s| "use" " nn=" (SPADCALL |nn| (QREFELT $ 277)))
                     (QREFELT $ 273))
                    . #12#)))))
          (COND
           ((EQUAL (QVELT |n| 0) 'NAMEDPOINTS)
            (SEQ
             (LETT |nam|
                   (PROG2 (LETT #1# (QVELT |n| 2) . #12#)
                       (QCDR #1#)
                     (|check_union| (QEQCAR #1# 10)
                                    (|SceneNamedPoints| (QREFELT $ 6)) #1#))
                   . #12#)
             (EXIT
              (LETT |s|
                    (SPADCALL
                     (LIST |s| "namedpoints" " n="
                           (SPADCALL |nam| (QREFELT $ 280)))
                     (QREFELT $ 273))
                    . #12#)))))
          (LETT |s|
                (SPADCALL
                 (LIST |s| " #ch="
                       (SPADCALL (SPADCALL (QVELT |n| 1) (QREFELT $ 177))
                                 (QREFELT $ 269)))
                 (QREFELT $ 273))
                . #12#)
          (EXIT |s|))))) 

(DEFUN |Scene| (#1=#:G1533)
  (PROG ()
    (RETURN
     (PROG (#2=#:G1534)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache| '|Scene|)
                                           '|domainEqualList|)
                . #3=(|Scene|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|Scene;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|Scene|))))))))))) 

(DEFUN |Scene;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|Scene|))
      (LETT |dv$| (LIST '|Scene| DV$1) . #1#)
      (LETT $ (GETREFV 282) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|Scene| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7
                (|Record| (|:| |type| (|Symbol|)) (|:| |children| (|List| $))
                          (|:| |parameters|
                               (|Union| (|:| |points| (|List| (|List| |#1|)))
                                        (|:| |material|
                                             (|Record|
                                              (|:| |lineWidth| (|DoubleFloat|))
                                              (|:| |lineCol| (|String|))
                                              (|:| |fillCol| (|String|))
                                              (|:| |matOpacity|
                                                   (|DoubleFloat|))))
                                        (|:| |text|
                                             (|Record| (|:| |txt| (|String|))
                                                       (|:| |siz|
                                                            (|NonNegativeInteger|))
                                                       (|:| |pos| |#1|)
                                                       (|:| |np|
                                                            (|List|
                                                             (|String|)))))
                                        (|:| |boundbox| (|SBoundary| |#1|))
                                        (|:| |trans| (|STransform| |#1|))
                                        (|:| |ifs|
                                             (|Record|
                                              (|:| |inx|
                                                   (|List|
                                                    (|List|
                                                     (|NonNegativeInteger|))))
                                              (|:| |pts| (|List| |#1|))))
                                        (|:| |arrws|
                                             (|Record|
                                              (|:| |ln| (|List| (|List| |#1|)))
                                              (|:| |mode| (|Symbol|))
                                              (|:| |size| (|DoubleFloat|))))
                                        (|:| |arrw|
                                             (|Record| (|:| |st| (|String|))
                                                       (|:| |en| (|String|))
                                                       (|:| |offset| |#1|)
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
                                        (|:| |shpe|
                                             (|Record|
                                              (|:| |shptype| (|Symbol|))
                                              (|:| |centre| |#1|)
                                              (|:| |size| |#1|)
                                              (|:| |fill| (|Boolean|))))
                                        (|:| |nodename|
                                             (|Record| (|:| |nme| (|String|))
                                                       (|:| |node| $)))
                                        (|:| |np| (|SceneNamedPoints| |#1|))
                                        (|:| |empty| "empty")))))
      $)))) 

(MAKEPROP '|Scene| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|SBoundary| 6)
              |SCENE;createSceneRoot;Sb$;1| (0 . |boxBoundary|)
              (|Record| (|:| |mins| 6) (|:| |maxs| 6))
              |SCENE;createSceneRoot;R$;2| (|Integer|) (6 . |sipnt|)
              |SCENE;createSceneRoot;4I$;3| (12 . |nullBoundary|)
              |SCENE;createSceneRoot;$;4| |SCENE;createSceneGroup;$;5| (|Void|)
              |SCENE;addChild!;2$V;75| |SCENE;addSceneGroup;2$;6| (|List| 6)
              |SCENE;createSceneLine;L$;7| |SCENE;addSceneLine;$L$;8|
              (|DoubleFloat|) |SCENE;boundary;$DfSb;87| (16 . |getCentre|)
              (21 . |lineIntersect|) |SCENE;createSceneLine;2$Df$;9|
              |SCENE;addSceneLine;3$Df$;10| (|List| 22)
              |SCENE;createSceneLines;L$;11| |SCENE;addSceneLines;$L$;12|
              (|Record| (|:| |shptype| 47) (|:| |centre| 6) (|:| |size| 6)
                        (|:| |fill| 100))
              |SCENE;createSceneShape;R$;13| |SCENE;addSceneShape;$R$;14|
              (27 . |getMax|) (32 . |getMin|) (37 . -)
              |SCENE;createSceneShape;Sb$;15| |SCENE;addSceneShape;$Sb$;16|
              (|String|) |SCENE;createSceneDef;S2$;17|
              |SCENE;addSceneDef;$S2$;18| |SCENE;createSceneUse;S$;19|
              |SCENE;addSceneUse;$S$;20| (|Symbol|)
              |SCENE;createSceneArrows;LSDf$;21|
              |SCENE;addSceneArrows;$LSDf$;22|
              |SCENE;createSceneArrow;2SPTSDf$;23|
              |SCENE;addSceneArrow;$2SPTSDf$;24|
              |SCENE;createSceneArrow;2$PTS2Df$;25|
              |SCENE;addSceneArrow;3$PTS2Df$;26| (|SceneNamedPoints| 6)
              |SCENE;createSceneNamedPoints;Snp$;27|
              |SCENE;addSceneNamedPoints;$Snp$;28| (|List| 106)
              |SCENE;createSceneIFS;LL$;29| |SCENE;addSceneIFS;$LL$;30|
              (|SceneIFS| 6) (43 . |indexes|) (48 . |pointList|)
              |SCENE;createSceneIFS;Sifs$;31| |SCENE;addSceneIFS;$Sifs$;32|
              (53 . |spnt|) |SCENE;createSceneBox;Df$;33|
              |SCENE;addSceneBox;$Df$;34|
              (|Record| (|:| |txt| 42) (|:| |siz| 71) (|:| |pos| 6)
                        (|:| |np| 74))
              |SCENE;createSceneText;R$;35| |SCENE;addSceneText;$R$;36|
              (|NonNegativeInteger|) |SCENE;createSceneText;SNniPT$;37|
              |SCENE;addSceneText;$SNniPT$;38| (|List| 42)
              |SCENE;createSceneText;LNniPT$;39|
              |SCENE;addSceneText;$LNniPT$;40| |SCENE;createSceneClip;Sb$;41|
              |SCENE;addSceneClip;$Sb$;42| |SCENE;createSceneClip;R$;43|
              |SCENE;addSceneClip;$R$;44| (60 . |screenCoordX|)
              (65 . |screenCoordY|) (70 . |spnt|)
              |SCENE;createSceneGrid;DfSb$;45| |SCENE;addSceneGrid;$DfSb$;46|
              |SCENE;createSceneGrid;DfR$;47| |SCENE;addSceneGrid;$DfR$;48|
              (|PositiveInteger|) (|Float|) (76 . |float|) (83 . |coerce|)
              (|Record| (|:| |lineWidth| 25) (|:| |lineCol| 42)
                        (|:| |fillCol| 42) (|:| |matOpacity| 25))
              |SCENE;addSceneMaterial;$R$;68| |SCENE;createSceneGrid;Sb$;49|
              |SCENE;addSceneGrid;$Sb$;50| |SCENE;createSceneGrid;R$;51|
              |SCENE;addSceneGrid;$R$;52| (88 . |singleFace|)
              (93 . |sierpinskiDivide|) (|Boolean|) (99 . ~=) (105 . |elt|)
              (111 . +) (117 . *) (123 . |concat|) (|List| 71) (129 . |elt|)
              (135 . |#|) (140 . |elt|) (146 . |concat|)
              |SCENE;createScenePattern;SNniSb$;57|
              |SCENE;addScenePattern;$SNniSb$;58|
              |SCENE;createScenePattern;SNniR$;59|
              |SCENE;addScenePattern;$SNniR$;60| (152 . |log10|) (157 . >)
              (|List| $) (163 . |concat|) (168 . ~=)
              |SCENE;createSceneRuler;SPTSb$;61|
              |SCENE;addSceneRuler;$SPTSb$;62|
              |SCENE;createSceneRuler;SPTR$;63| |SCENE;addSceneRuler;$SPTR$;64|
              (|STransform| (|SCartesian| '2)) (174 . |stranslate|)
              (|Scene| (|SCartesian| '2)) (184 . |createSceneTransform|)
              (|DirectedGraph| 42) (189 . |subdiagramSvg|)
              |SCENE;createSceneGraph;Dg2NniB$;65|
              |SCENE;addSceneGraph;$Dg2NniB$;66|
              |SCENE;createSceneMaterial;R$;67|
              |SCENE;createSceneMaterial;Df2S$;69|
              |SCENE;addSceneMaterial;$Df2S$;70| (|STransform| 6)
              |SCENE;createSceneTransform;St$;71|
              |SCENE;addSceneTransform;$St$;72| (|Segment| 25) (197 . |lo|)
              (202 . |hi|) (|Mapping| 6 6)
              |SCENE;createArrows2Din2D;M2SNni$;73|
              |SCENE;addArrows2Din2D;$M2SNni$;74| (|List| $$) (207 . |concat|)
              |SCENE;removeChild!;2$V;76| (213 . ~=)
              |SCENE;setTransform!;$StV;77| (219 . |xform|)
              (225 . |containsPoint?|) (231 . ~=) (237 . |distance|)
              (243 . |One|) (247 . |Zero|) (251 . >) (257 . >) (|XmlAttribute|)
              (263 . |xmlAttribute|) (|List| 157) (|XmlElement|)
              (269 . |xmlElement|) (|List| 160) (276 . |concat|)
              (282 . |isNull?|) (287 . |stranslate|) (297 . |concat|)
              (303 . ~=) (309 . |findPoint|) (315 . |xmlElement|)
              (322 . |empty?|) (327 . |compound|) (333 . |addPoints!|)
              (|Scene| 6) (340 . |addNode!|) |SCENE;toSVG;$RStSbDf2BSnpXe;82|
              (347 . |findNode|) (353 . |#|) |SCENE;toSVG;$RStRDf2BSnpXe;83|
              (358 . |identity|) (362 . |namedBranch|) (|ExportXml|)
              (368 . |writeXml|) |SCENE;writeSvg;$SV;84|
              |SCENE;writeSvgQuantised;$SV;85| (374 . |extendToPoint|)
              (380 . |ellipseBoundary|) (386 . |sunion|) (392 . |screenCoordZ|)
              (397 . |concat|) |SCENE;toX3D;$RStSbXe;91| (403 . |curveLoops|)
              (410 . |smesh|) (416 . |xmlAttribute|) |SCENE;toX3D;$RStRXe;92|
              |SCENE;writeX3d;$SV;93| (|Reference| 22) (|Reference| 57)
              (|Reference| 71) |SCENE;toObj;$RRRStSbV;94| (422 . |elt|)
              (427 . |elt|) (432 . |concat|) (438 . |setelt|) (444 . |elt|)
              (449 . |concat|) (455 . |setelt|) (461 . |setelt|)
              |SCENE;toObj;$RRRStRV;95| (467 . |ref|) (472 . |ref|)
              (477 . |ref|) (|FileName|) (482 . |coerce|) (|TextFile|)
              (487 . |open|) (493 . |writeLine!|) (499 . |close!|)
              |SCENE;writeObj;$SV;96| (504 . |writeVRML|)
              |SCENE;writeVRML;$SV;97| (510 . ~=) (516 . |segment|) (|List| 25)
              (522 . |list|) (527 . |list|) (532 . |Pnan?|) (|Mapping| 6 25)
              |SCENE;createPlot1Din2D;MSNni$;103|
              |SCENE;addPlot1Din2D;$MSNni$;104| (|List| 227) (537 . |first|)
              (|Mapping| 25 25) |SCENE;createPlot1Din2D;MSNni$;105|
              |SCENE;addPlot1Din2D;$MSNni$;106| (|ParametricPlaneCurve| 232)
              (542 . |coordinate|)
              |SCENE;createPlot1Din2Dparametric;PpcSNni$;107|
              |SCENE;addPlot1Din2Dparametric;$PpcSNni$;108|
              (|ParametricSpaceCurve| 232) (548 . |coordinate|)
              |SCENE;createPlot1Din3Dparametric;MSNni$;111|
              |SCENE;createPlot1Din3Dparametric;PscSNni$;109|
              |SCENE;addPlot1Din3Dparametric;$PscSNni$;110|
              |SCENE;addPlot1Din3Dparametric;$MSNni$;112| (|Mapping| 6 25 25)
              |SCENE;createPlot2Din3D;M2SNni$;113| (|List| 245) (554 . |first|)
              (|Mapping| 25 25 25) |SCENE;createPlot2Din3D;M2SNni$;114|
              |SCENE;addPlot2Din3D;$M2SNni$;115| (559 . |One|) (563 . |One|)
              (|ParametricSurface| 249) (567 . |coordinate|) (|List| 249)
              (573 . |first|) |SCENE;createPlot2Din3Dparametric;Ps2SNni$;116|
              |SCENE;addPlot2Din3Dparametric;$Ps2SNni$;117|
              |SCENE;createPlot2Din3Dparametric;M2SNni$;118|
              |SCENE;addPlot2Din3Dparametric;$M2SNni$;119| (|OutputForm|)
              (578 . |coerce|) (583 . |coerce|) (588 . |second|)
              (593 . |bracket|) (598 . |second|) (603 . |coerce|)
              (608 . |coerce|) (613 . |second|) (618 . |second|)
              (623 . |coerce|) (628 . |hconcat|) (633 . |hconcat|)
              (639 . |coerce|) (644 . |coerce|) (649 . |coerce|)
              (654 . |coerce|) (659 . |coerce|) (664 . |coerce|)
              |SCENE;coerce;$Of;124|)
           '#(|writeX3d| 669 |writeVRML| 675 |writeSvgQuantised| 681 |writeSvg|
              687 |writeObj| 693 |toX3D| 699 |toSVG| 715 |toObj| 739
              |setTransform!| 759 |removeChild!| 765 |createSceneUse| 771
              |createSceneTransform| 776 |createSceneText| 781
              |createSceneShape| 800 |createSceneRuler| 810 |createSceneRoot|
              824 |createScenePattern| 846 |createSceneNamedPoints| 860
              |createSceneMaterial| 865 |createSceneLines| 877
              |createSceneLine| 882 |createSceneIFS| 894 |createSceneGroup| 905
              |createSceneGrid| 909 |createSceneGraph| 931 |createSceneDef| 939
              |createSceneClip| 945 |createSceneBox| 955 |createSceneArrows|
              960 |createSceneArrow| 967 |createPlot2Din3Dparametric| 986
              |createPlot2Din3D| 1002 |createPlot1Din3Dparametric| 1018
              |createPlot1Din2Dparametric| 1032 |createPlot1Din2D| 1039
              |createArrows2Din2D| 1053 |coerce| 1061 |boundary| 1066
              |addSceneUse| 1072 |addSceneTransform| 1078 |addSceneText| 1084
              |addSceneShape| 1106 |addSceneRuler| 1118 |addScenePattern| 1134
              |addSceneNamedPoints| 1150 |addSceneMaterial| 1156
              |addSceneLines| 1170 |addSceneLine| 1176 |addSceneIFS| 1190
              |addSceneGroup| 1203 |addSceneGrid| 1208 |addSceneGraph| 1234
              |addSceneDef| 1243 |addSceneClip| 1250 |addSceneBox| 1262
              |addSceneArrows| 1268 |addSceneArrow| 1276
              |addPlot2Din3Dparametric| 1297 |addPlot2Din3D| 1315
              |addPlot1Din3Dparametric| 1324 |addPlot1Din2Dparametric| 1340
              |addPlot1Din2D| 1348 |addChild!| 1364 |addArrows2Din2D| 1370)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 281
                                                 '(2 8 0 6 6 10 2 6 0 13 13 14
                                                   0 8 0 16 1 8 6 0 27 2 8 6 0
                                                   6 28 1 8 6 0 37 1 8 6 0 38 2
                                                   6 0 0 0 39 1 60 57 0 61 1 60
                                                   22 0 62 3 6 0 25 25 25 65 1
                                                   6 25 0 81 1 6 25 0 82 2 6 0
                                                   25 25 83 3 89 0 13 13 88 90
                                                   1 89 25 0 91 1 60 0 22 98 2
                                                   60 0 0 71 99 2 71 100 0 0
                                                   101 2 22 6 0 13 102 2 6 0 0
                                                   0 103 2 6 0 25 0 104 2 22 0
                                                   0 6 105 2 57 106 0 13 107 1
                                                   106 71 0 108 2 106 71 0 13
                                                   109 2 31 0 0 22 110 1 25 0 0
                                                   115 2 13 100 0 0 116 1 42 0
                                                   117 118 2 13 100 0 0 119 6
                                                   124 0 25 25 25 25 25 25 125
                                                   1 126 0 124 127 4 128 19 126
                                                   0 100 100 129 1 138 25 0 139
                                                   1 138 25 0 140 2 144 0 0 2
                                                   145 2 47 100 0 0 147 2 135 6
                                                   0 6 149 2 8 100 0 6 150 2 42
                                                   100 0 0 151 2 6 25 0 0 152 0
                                                   89 0 153 0 89 0 154 2 25 100
                                                   0 0 155 2 71 100 0 0 156 2
                                                   157 0 42 42 158 3 160 0 42
                                                   117 159 161 2 162 0 0 160
                                                   163 1 8 100 0 164 6 135 0 25
                                                   25 25 25 25 25 165 2 159 0 0
                                                   157 166 2 74 100 0 0 167 2
                                                   54 6 0 42 168 3 160 0 42 42
                                                   159 169 1 160 100 0 170 2
                                                   135 0 0 0 171 3 54 0 0 42 0
                                                   172 3 54 0 0 42 173 174 2 54
                                                   173 0 42 176 1 144 71 0 177
                                                   0 135 0 179 2 54 0 117 74
                                                   180 2 181 19 160 42 182 2 8
                                                   0 0 6 185 2 8 0 6 6 186 2 8
                                                   0 0 0 187 1 6 25 0 188 2 74
                                                   0 0 42 189 3 60 31 22 25 13
                                                   191 2 60 0 31 100 192 2 157
                                                   0 42 74 193 1 198 71 0 200 1
                                                   196 22 0 201 2 22 0 0 0 202
                                                   2 196 22 0 22 203 1 197 57 0
                                                   204 2 57 0 0 0 205 2 197 57
                                                   0 57 206 2 198 71 0 71 207 1
                                                   196 0 22 209 1 197 0 57 210
                                                   1 198 0 71 211 1 212 0 42
                                                   213 2 214 0 212 42 215 2 214
                                                   42 0 42 216 1 214 0 0 217 2
                                                   181 19 160 42 219 2 25 100 0
                                                   0 221 2 138 0 25 25 222 1
                                                   223 0 25 224 1 22 0 6 225 1
                                                   6 100 0 226 1 230 227 0 231
                                                   2 235 232 0 71 236 2 239 232
                                                   0 71 240 1 247 245 0 248 0
                                                   25 0 252 0 71 0 253 2 254
                                                   249 0 71 255 1 256 249 0 257
                                                   1 22 262 0 263 1 6 262 0 264
                                                   1 22 6 0 265 1 262 0 117 266
                                                   1 31 22 0 267 1 106 262 0
                                                   268 1 71 262 0 269 1 106 71
                                                   0 270 1 57 106 0 271 1 8 262
                                                   0 272 1 262 0 117 273 2 262
                                                   0 0 0 274 1 47 262 0 275 1
                                                   25 262 0 276 1 42 262 0 277
                                                   1 74 262 0 278 1 135 262 0
                                                   279 1 54 262 0 280 2 0 19 0
                                                   42 195 2 0 19 0 42 220 2 0
                                                   19 0 42 184 2 0 19 0 42 183
                                                   2 0 19 0 42 218 4 0 160 0 92
                                                   135 8 190 4 0 160 0 92 135
                                                   11 194 8 0 160 0 92 135 11
                                                   25 100 100 54 178 8 0 160 0
                                                   92 135 8 25 100 100 54 175 6
                                                   0 19 0 196 197 198 135 8 199
                                                   6 0 19 0 196 197 198 135 11
                                                   208 2 0 19 0 135 148 2 0 19
                                                   0 0 146 1 0 0 42 45 1 0 0
                                                   135 136 1 0 0 68 69 3 0 0 42
                                                   71 6 72 3 0 0 74 71 6 75 1 0
                                                   0 34 35 1 0 0 8 40 3 0 0 47
                                                   6 8 120 3 0 0 47 6 11 122 0
                                                   0 0 17 1 0 0 11 12 1 0 0 8 9
                                                   4 0 0 13 13 13 13 15 3 0 0
                                                   47 71 8 111 3 0 0 47 71 11
                                                   113 1 0 0 54 55 1 0 0 92 132
                                                   3 0 0 25 42 42 133 1 0 0 31
                                                   32 1 0 0 22 23 3 0 0 0 0 25
                                                   29 2 0 0 57 22 58 1 0 0 60
                                                   63 0 0 0 18 2 0 0 25 8 84 2
                                                   0 0 25 11 86 1 0 0 8 94 1 0
                                                   0 11 96 4 0 0 128 71 71 100
                                                   130 2 0 0 42 0 43 1 0 0 8 77
                                                   1 0 0 11 79 1 0 0 25 66 3 0
                                                   0 31 47 25 48 5 0 0 42 42 6
                                                   47 25 50 6 0 0 0 0 6 47 25
                                                   25 52 4 0 0 245 138 138 71
                                                   260 4 0 0 254 138 138 71 258
                                                   4 0 0 249 138 138 71 250 4 0
                                                   0 245 138 138 71 246 3 0 0
                                                   239 138 71 242 3 0 0 227 138
                                                   71 241 3 0 0 235 138 71 237
                                                   3 0 0 227 138 71 228 3 0 0
                                                   232 138 71 233 4 0 0 141 138
                                                   138 71 142 1 0 262 0 281 2 0
                                                   8 0 25 26 2 0 0 0 42 46 2 0
                                                   0 0 135 137 2 0 0 0 68 70 4
                                                   0 0 0 42 71 6 73 4 0 0 0 74
                                                   71 6 76 2 0 0 0 34 36 2 0 0
                                                   0 8 41 4 0 0 0 47 6 8 121 4
                                                   0 0 0 47 6 11 123 4 0 0 0 47
                                                   71 8 112 4 0 0 0 47 71 11
                                                   114 2 0 0 0 54 56 2 0 0 0 92
                                                   93 4 0 0 0 25 42 42 134 2 0
                                                   0 0 31 33 2 0 0 0 22 24 4 0
                                                   0 0 0 0 25 30 3 0 0 0 57 22
                                                   59 2 0 0 0 60 64 1 0 0 0 21
                                                   3 0 0 0 25 8 85 3 0 0 0 25
                                                   11 87 2 0 0 0 8 95 2 0 0 0
                                                   11 97 5 0 0 0 128 71 71 100
                                                   131 3 0 0 0 42 0 44 2 0 0 0
                                                   8 78 2 0 0 0 11 80 2 0 0 0
                                                   25 67 4 0 0 0 31 47 25 49 6
                                                   0 0 0 42 42 6 47 25 51 7 0 0
                                                   0 0 0 6 47 25 25 53 5 0 0 0
                                                   245 138 138 71 261 5 0 0 0
                                                   254 138 138 71 259 5 0 0 0
                                                   249 138 138 71 251 4 0 0 0
                                                   239 138 71 243 4 0 0 0 227
                                                   138 71 244 4 0 0 0 235 138
                                                   71 238 4 0 0 0 227 138 71
                                                   229 4 0 0 0 232 138 71 234 2
                                                   0 19 0 0 20 5 0 0 0 141 138
                                                   138 71 143)))))
           '|lookupComplete|)) 
