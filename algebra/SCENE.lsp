
(/VERSIONCHECK 2) 

(DEFUN |SCENE;createSceneRoot;R$;1| (|bb| $) (VECTOR 'ROOT NIL (CONS 3 |bb|))) 

(DEFUN |SCENE;createSceneRoot;4I$;2| (|minx| |miny| |maxx| |maxy| $)
  (PROG (|bb|)
    (RETURN
     (SEQ
      (LETT |bb|
            (CONS (SPADCALL |minx| |miny| (QREFELT $ 11))
                  (SPADCALL |maxx| |maxy| (QREFELT $ 11)))
            |SCENE;createSceneRoot;4I$;2|)
      (EXIT (VECTOR 'ROOT NIL (CONS 3 |bb|))))))) 

(DEFUN |SCENE;createSceneRoot;$;3| ($)
  (PROG (|bb|)
    (RETURN
     (SEQ
      (LETT |bb|
            (CONS (SPADCALL 0 0 (QREFELT $ 11))
                  (SPADCALL 1200 800 (QREFELT $ 11)))
            |SCENE;createSceneRoot;$;3|)
      (EXIT (VECTOR 'ROOT NIL (CONS 3 |bb|))))))) 

(DEFUN |SCENE;createSceneGroup;$;4| ($) (VECTOR 'GROUP NIL (CONS 9 "empty"))) 

(DEFUN |SCENE;addSceneGroup;2$;5| (|n| $)
  (PROG (|c|)
    (RETURN
     (SEQ (LETT |c| (SPADCALL (QREFELT $ 14)) |SCENE;addSceneGroup;2$;5|)
          (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneLine;L$;6| (|line| $)
  (VECTOR 'LINE NIL (CONS 0 (LIST |line|)))) 

(DEFUN |SCENE;addSceneLine;$L$;7| (|n| |line| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |line| (QREFELT $ 19)) |SCENE;addSceneLine;$L$;7|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneLines;L$;8| (|lines| $)
  (VECTOR 'LINE NIL (CONS 0 |lines|))) 

(DEFUN |SCENE;addSceneLines;$L$;9| (|n| |lines| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |lines| (QREFELT $ 22)) |SCENE;addSceneLines;$L$;9|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneArrows;L2S$;10| (|lines| |ls| |le| $)
  (PROG (|ar|)
    (RETURN
     (SEQ
      (LETT |ar| (VECTOR |lines| |ls| |le|) |SCENE;createSceneArrows;L2S$;10|)
      (EXIT (VECTOR 'ARROWS NIL (CONS 6 |ar|))))))) 

(DEFUN |SCENE;addSceneArrows;$L2S$;11| (|n| |lines| |ls| |le| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |lines| |ls| |le| (QREFELT $ 25))
            |SCENE;addSceneArrows;$L2S$;11|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneArrow;2SPT2S$;12| (|st| |en| |offset| |ls| |le| $)
  (PROG (|ar|)
    (RETURN
     (SEQ
      (LETT |ar| (VECTOR |st| |en| |offset| |ls| |le|)
            |SCENE;createSceneArrow;2SPT2S$;12|)
      (EXIT (VECTOR 'ARROW NIL (CONS 7 |ar|))))))) 

(DEFUN |SCENE;addSceneArrow;$2SPT2S$;13| (|n| |st| |en| |offset| |ls| |le| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |st| |en| |offset| |ls| |le| (QREFELT $ 28))
            |SCENE;addSceneArrow;$2SPT2S$;13|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneNamedPoints;Snp$;14| (|np| $)
  (VECTOR 'NAMEDPOINTS NIL (CONS 8 |np|))) 

(DEFUN |SCENE;addSceneNamedPoints;$Snp$;15| (|n| |np| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |np| (QREFELT $ 31))
            |SCENE;addSceneNamedPoints;$Snp$;15|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneIFS;LL$;16| (|inx1| |pts1| $)
  (VECTOR 'IFS NIL (CONS 5 (CONS |inx1| |pts1|)))) 

(DEFUN |SCENE;addSceneIFS;$LL$;17| (|n| |inx1| |pts1| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |inx1| |pts1| (QREFELT $ 34))
            |SCENE;addSceneIFS;$LL$;17|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneIFS;Sifs$;18| (|in1| $)
  (PROG (|pts1| |inx1|)
    (RETURN
     (SEQ
      (LETT |inx1| (SPADCALL |in1| (QREFELT $ 37))
            . #1=(|SCENE;createSceneIFS;Sifs$;18|))
      (LETT |pts1| (SPADCALL |in1| (QREFELT $ 38)) . #1#)
      (EXIT (VECTOR 'IFS NIL (CONS 5 (CONS |inx1| |pts1|)))))))) 

(DEFUN |SCENE;addSceneIFS;$Sifs$;19| (|n| |in1| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |in1| (QREFELT $ 39)) |SCENE;addSceneIFS;$Sifs$;19|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneBox;Df$;20| (|size| $)
  (PROG (|inx| |pts|)
    (RETURN
     (SEQ
      (LETT |pts|
            (LIST (SPADCALL |size| (|minus_DF| |size|) |size| (QREFELT $ 42))
                  (SPADCALL |size| |size| |size| (QREFELT $ 42))
                  (SPADCALL (|minus_DF| |size|) |size| |size| (QREFELT $ 42))
                  (SPADCALL (|minus_DF| |size|) (|minus_DF| |size|) |size|
                            (QREFELT $ 42))
                  (SPADCALL (|minus_DF| |size|) (|minus_DF| |size|)
                            (|minus_DF| |size|) (QREFELT $ 42))
                  (SPADCALL (|minus_DF| |size|) |size| (|minus_DF| |size|)
                            (QREFELT $ 42))
                  (SPADCALL |size| |size| (|minus_DF| |size|) (QREFELT $ 42))
                  (SPADCALL |size| (|minus_DF| |size|) (|minus_DF| |size|)
                            (QREFELT $ 42)))
            . #1=(|SCENE;createSceneBox;Df$;20|))
      (LETT |inx|
            (LIST (LIST 0 1 2 3) (LIST 4 5 6 7) (LIST 7 6 1 0) (LIST 3 2 5 4)
                  (LIST 1 6 5 2) (LIST 3 4 7 0))
            . #1#)
      (EXIT (SPADCALL |inx| |pts| (QREFELT $ 34))))))) 

(DEFUN |SCENE;addSceneBox;$Df$;21| (|n| |size| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |size| (QREFELT $ 43)) |SCENE;addSceneBox;$Df$;21|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneText;R$;22| (|text| $)
  (VECTOR 'TEXT NIL (CONS 2 |text|))) 

(DEFUN |SCENE;addSceneText;$R$;23| (|n| |text| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |text| (QREFELT $ 46)) |SCENE;addSceneText;$R$;23|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneText;SNniPT$;24| (|str| |sz| |pz| $)
  (PROG (|text|)
    (RETURN
     (SEQ
      (LETT |text| (VECTOR |str| |sz| |pz| NIL)
            |SCENE;createSceneText;SNniPT$;24|)
      (EXIT (VECTOR 'TEXT NIL (CONS 2 |text|))))))) 

(DEFUN |SCENE;addSceneText;$SNniPT$;25| (|n| |str| |sz| |pz| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |str| |sz| |pz| (QREFELT $ 49))
            |SCENE;addSceneText;$SNniPT$;25|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneText;LNniPT$;26| (|str| |sz| |pz| $)
  (PROG (|text|)
    (RETURN
     (SEQ
      (LETT |text| (VECTOR (|SPADfirst| |str|) |sz| |pz| |str|)
            |SCENE;createSceneText;LNniPT$;26|)
      (EXIT (VECTOR 'TEXT NIL (CONS 2 |text|))))))) 

(DEFUN |SCENE;addSceneText;$LNniPT$;27| (|n| |str| |sz| |pz| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |str| |sz| |pz| (QREFELT $ 52))
            |SCENE;addSceneText;$LNniPT$;27|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneClip;R$;28| (|bb| $) (VECTOR 'CLIP NIL (CONS 3 |bb|))) 

(DEFUN |SCENE;addSceneClip;$R$;29| (|n| |bb| $)
  (PROG (|c|)
    (RETURN
     (SEQ (LETT |c| (SPADCALL |bb| (QREFELT $ 54)) |SCENE;addSceneClip;$R$;29|)
          (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneGrid;DfR$;30| (|stepSize| |bb| $)
  (PROG (|ln| |i| |gp| |stepsy| #1=#:G513 |stepsx| #2=#:G512 |maxy| |maxx|
         |miny| |minx|)
    (RETURN
     (SEQ
      (LETT |minx| (SPADCALL (QCAR |bb|) (QREFELT $ 56))
            . #3=(|SCENE;createSceneGrid;DfR$;30|))
      (LETT |miny| (SPADCALL (QCAR |bb|) (QREFELT $ 57)) . #3#)
      (LETT |maxx| (SPADCALL (QCDR |bb|) (QREFELT $ 56)) . #3#)
      (LETT |maxy| (SPADCALL (QCDR |bb|) (QREFELT $ 57)) . #3#)
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
      (LETT |gp| (SPADCALL (QREFELT $ 14)) . #3#)
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
                               |miny| (QREFELT $ 58))
                              (SPADCALL
                               (|add_DF| |minx|
                                         (|mul_DF|
                                          (FLOAT |i|
                                                 MOST-POSITIVE-DOUBLE-FLOAT)
                                          |stepSize|))
                               |maxy| (QREFELT $ 58)))
                             (QREFELT $ 20))
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
                                        (QREFELT $ 58))
                              (SPADCALL |maxx|
                                        (|add_DF| |miny|
                                                  (|mul_DF|
                                                   (FLOAT |i|
                                                          MOST-POSITIVE-DOUBLE-FLOAT)
                                                   |stepSize|))
                                        (QREFELT $ 58)))
                             (QREFELT $ 20))
                   . #3#)))
           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |gp|))))) 

(DEFUN |SCENE;addSceneGrid;$DfR$;31| (|n| |stepSize| |bb| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |stepSize| |bb| (QREFELT $ 59))
            |SCENE;addSceneGrid;$DfR$;31|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneGrid;R$;32| (|bb| $)
  (PROG (|gd3| |mt3| |gd2| |mt2| |gd1| |mt1| |gp| |stepSize| |maxx| |minx|)
    (RETURN
     (SEQ
      (LETT |minx| (SPADCALL (QCAR |bb|) (QREFELT $ 56))
            . #1=(|SCENE;createSceneGrid;R$;32|))
      (LETT |maxx| (SPADCALL (QCDR |bb|) (QREFELT $ 56)) . #1#)
      (LETT |stepSize| (|div_DF_I| (|sub_DF| |maxx| |minx|) 100) . #1#)
      (LETT |gp| (SPADCALL (QREFELT $ 14)) . #1#)
      (LETT |mt1|
            (SPADCALL |gp|
                      (VECTOR 1.0 "blue" "blue"
                              (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 63))
                                        (QREFELT $ 64)))
                      (QREFELT $ 66))
            . #1#)
      (LETT |gd1| (SPADCALL |mt1| |stepSize| |bb| (QREFELT $ 60)) . #1#)
      (LETT |mt2|
            (SPADCALL |gp|
                      (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "blue"
                              "blue"
                              (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 63))
                                        (QREFELT $ 64)))
                      (QREFELT $ 66))
            . #1#)
      (LETT |gd2|
            (SPADCALL |mt2|
                      (|mul_DF| |stepSize|
                                (FLOAT 5 MOST-POSITIVE-DOUBLE-FLOAT))
                      |bb| (QREFELT $ 60))
            . #1#)
      (LETT |mt3|
            (SPADCALL |gp|
                      (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "red" "red"
                              (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 63))
                                        (QREFELT $ 64)))
                      (QREFELT $ 66))
            . #1#)
      (LETT |gd3|
            (SPADCALL |mt3|
                      (|mul_DF| |stepSize|
                                (FLOAT 10 MOST-POSITIVE-DOUBLE-FLOAT))
                      |bb| (QREFELT $ 60))
            . #1#)
      (EXIT |gp|))))) 

(DEFUN |SCENE;addSceneGrid;$R$;33| (|n| |bb| $)
  (PROG (|c|)
    (RETURN
     (SEQ (LETT |c| (SPADCALL |bb| (QREFELT $ 67)) |SCENE;addSceneGrid;$R$;33|)
          (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createScenePattern1| (|step| |bb| $)
  (PROG (|ln| |pts| |j| #1=#:G539 |i| |mt2| #2=#:G538 |mt1| |gp| |stepSize|
         |maxy| |maxx| |miny| |minx|)
    (RETURN
     (SEQ
      (LETT |minx| (SPADCALL (QCAR |bb|) (QREFELT $ 56))
            . #3=(|SCENE;createScenePattern1|))
      (LETT |miny| (SPADCALL (QCAR |bb|) (QREFELT $ 57)) . #3#)
      (LETT |maxx| (SPADCALL (QCDR |bb|) (QREFELT $ 56)) . #3#)
      (LETT |maxy| (SPADCALL (QCDR |bb|) (QREFELT $ 57)) . #3#)
      (LETT |stepSize| (|div_DF_I| (|sub_DF| |maxx| |minx|) 1200) . #3#)
      (LETT |gp| (SPADCALL (QREFELT $ 14)) . #3#)
      (LETT |mt1|
            (SPADCALL |gp|
                      (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "blue"
                              "blue"
                              (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 63))
                                        (QREFELT $ 64)))
                      (QREFELT $ 66))
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
                                  (QREFELT $ 58))
                                 #2#)
                                . #3#)))
                        (LETT |j| (|add_SI| |j| |step|) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  . #3#)
            (EXIT (LETT |ln| (SPADCALL |mt1| |pts| (QREFELT $ 20)) . #3#)))
           (LETT |i| (+ |i| |step|) . #3#) (GO G190) G191 (EXIT NIL))
      (LETT |mt2|
            (SPADCALL |gp|
                      (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "red" "red"
                              (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 63))
                                        (QREFELT $ 64)))
                      (QREFELT $ 66))
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
                                  (QREFELT $ 58))
                                 #1#)
                                . #3#)))
                        (LETT |j| (|add_SI| |j| |step|) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #1#))))
                  . #3#)
            (EXIT (LETT |ln| (SPADCALL |mt2| |pts| (QREFELT $ 20)) . #3#)))
           (LETT |i| (|add_SI| |i| |step|) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |gp|))))) 

(DEFUN |SCENE;createScenePattern2| (|level| |bb| $)
  (PROG (|ifs2| |ifs| |face1| |midx| |maxy| |maxx| |miny| |minx|)
    (RETURN
     (SEQ
      (LETT |minx| (SPADCALL (QCAR |bb|) (QREFELT $ 56))
            . #1=(|SCENE;createScenePattern2|))
      (LETT |miny| (SPADCALL (QCAR |bb|) (QREFELT $ 57)) . #1#)
      (LETT |maxx| (SPADCALL (QCDR |bb|) (QREFELT $ 56)) . #1#)
      (LETT |maxy| (SPADCALL (QCDR |bb|) (QREFELT $ 57)) . #1#)
      (LETT |midx|
            (|mul_DF| (|add_DF| |minx| |maxx|)
                      (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 63))
                                (QREFELT $ 64)))
            . #1#)
      (LETT |face1|
            (LIST (SPADCALL |midx| |miny| (QREFELT $ 58))
                  (SPADCALL |minx| |maxy| (QREFELT $ 58))
                  (SPADCALL |maxx| |maxy| (QREFELT $ 58)))
            . #1#)
      (LETT |ifs| (SPADCALL |face1| (QREFELT $ 69)) . #1#)
      (LETT |ifs2| (SPADCALL |ifs| |level| (QREFELT $ 70)) . #1#)
      (EXIT
       (SPADCALL (SPADCALL |ifs2| (QREFELT $ 37))
                 (SPADCALL |ifs2| (QREFELT $ 38)) (QREFELT $ 34))))))) 

(DEFUN |SCENE;subdivideLine| (|level| |inLine| $)
  (PROG (#1=#:G547 |res| |lastPt| |midpt| #2=#:G550 |x|)
    (RETURN
     (SEQ
      (COND ((EQL |level| 0) |inLine|)
            ('T
             (SEQ (LETT |res| NIL . #3=(|SCENE;subdivideLine|))
                  (SEQ (LETT |x| 1 . #3#) (LETT #2# (LENGTH |inLine|) . #3#)
                       G190 (COND ((|greater_SI| |x| #2#) (GO G191)))
                       (SEQ
                        (COND
                         ((SPADCALL |x| 1 (QREFELT $ 72))
                          (SEQ
                           (LETT |midpt|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 63))
                                            (QREFELT $ 64))
                                  (SPADCALL |lastPt|
                                            (SPADCALL |inLine| |x|
                                                      (QREFELT $ 73))
                                            (QREFELT $ 74))
                                  (QREFELT $ 75))
                                 . #3#)
                           (EXIT
                            (LETT |res| (SPADCALL |res| |midpt| (QREFELT $ 76))
                                  . #3#)))))
                        (LETT |lastPt| (SPADCALL |inLine| |x| (QREFELT $ 73))
                              . #3#)
                        (EXIT
                         (LETT |res|
                               (SPADCALL |res|
                                         (SPADCALL |inLine| |x| (QREFELT $ 73))
                                         (QREFELT $ 76))
                               . #3#)))
                       (LETT |x| (|inc_SI| |x|) . #3#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT
                   (|SCENE;subdivideLine|
                    (PROG1 (LETT #1# (- |level| 1) . #3#)
                      (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                    |res| $))))))))) 

(DEFUN |SCENE;createScenePattern3| (|level| |bb| $)
  (PROG (|ln| |lev2| |pts2| #1=#:G563 |l2| |pts| #2=#:G562 |j| #3=#:G561
         #4=#:G560 |i| #5=#:G559 |ycoords| |xcoords| |scale| |maxy| |maxx|
         |miny| |minx|)
    (RETURN
     (SEQ
      (LETT |minx| (SPADCALL (QCAR |bb|) (QREFELT $ 56))
            . #6=(|SCENE;createScenePattern3|))
      (LETT |miny| (SPADCALL (QCAR |bb|) (QREFELT $ 57)) . #6#)
      (LETT |maxx| (SPADCALL (QCDR |bb|) (QREFELT $ 56)) . #6#)
      (LETT |maxy| (SPADCALL (QCDR |bb|) (QREFELT $ 57)) . #6#)
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
                                        (SPADCALL |xcoords| |i| (QREFELT $ 78))
                                        (QREFELT $ 79))
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
                                                                           78))
                                                        |j| (QREFELT $ 80))
                                                       MOST-POSITIVE-DOUBLE-FLOAT)
                                                      |scale|))
                                           (|add_DF| |miny|
                                                     (|mul_DF|
                                                      (FLOAT
                                                       (SPADCALL
                                                        (SPADCALL |ycoords| |i|
                                                                  (QREFELT $
                                                                           78))
                                                        |j| (QREFELT $ 80))
                                                       MOST-POSITIVE-DOUBLE-FLOAT)
                                                      |scale|))
                                           (QREFELT $ 58))
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
                            (QREFELT $ 81))
                  . #6#)
            (EXIT (COND ((EQL |lev2| |level|) (LETT |lev2| 2 . #6#)))))
           (LETT #1# (CDR #1#) . #6#) (GO G190) G191 (EXIT NIL))
      (EXIT (LETT |ln| (SPADCALL |pts2| (QREFELT $ 22)) . #6#)))))) 

(DEFUN |SCENE;createScenePattern;SNniR$;38| (|ptype| |step| |bb| $)
  (PROG (#1=#:G566)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((EQUAL |ptype| 'GRID)
          (PROGN
           (LETT #1# (|SCENE;createScenePattern1| |step| |bb| $)
                 . #2=(|SCENE;createScenePattern;SNniR$;38|))
           (GO #1#))))
        (COND
         ((EQUAL |ptype| 'SIERPINSKI)
          (PROGN
           (LETT #1# (|SCENE;createScenePattern2| |step| |bb| $) . #2#)
           (GO #1#))))
        (EXIT (|SCENE;createScenePattern3| |step| |bb| $))))
      #1# (EXIT #1#))))) 

(DEFUN |SCENE;addScenePattern;$SNniR$;39| (|n| |ptype| |step| |bb| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |ptype| |step| |bb| (QREFELT $ 82))
            |SCENE;addScenePattern;$SNniR$;39|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneRuler;SPTR$;40| (|ptype| |offset| |bb| $)
  (PROG (|str| |d| |pz| #1=#:G593 |x| |stepI| |gp| |suffix| |zeroes|
         |maxPrimaryNorm| |minPrimaryNorm| |divn| |expStep| |stepSize|
         |maxSecondary| |maxPrimary| |minSecondary| |minPrimary|)
    (RETURN
     (SEQ
      (LETT |minPrimary| (SPADCALL (QCAR |bb|) (QREFELT $ 56))
            . #2=(|SCENE;createSceneRuler;SPTR$;40|))
      (LETT |minSecondary| (SPADCALL (QCAR |bb|) (QREFELT $ 57)) . #2#)
      (LETT |maxPrimary| (SPADCALL (QCDR |bb|) (QREFELT $ 56)) . #2#)
      (LETT |maxSecondary| (SPADCALL (QCDR |bb|) (QREFELT $ 57)) . #2#)
      (COND
       ((EQUAL |ptype| 'VERTICAL)
        (SEQ (LETT |minPrimary| (SPADCALL (QCAR |bb|) (QREFELT $ 57)) . #2#)
             (LETT |minSecondary| (SPADCALL (QCAR |bb|) (QREFELT $ 56)) . #2#)
             (LETT |maxPrimary| (SPADCALL (QCDR |bb|) (QREFELT $ 57)) . #2#)
             (EXIT
              (LETT |maxSecondary| (SPADCALL (QCDR |bb|) (QREFELT $ 56))
                    . #2#)))))
      (LETT |stepSize| (|sub_DF| |maxPrimary| |minPrimary|) . #2#)
      (LETT |expStep|
            (- (TRUNCATE (SPADCALL (|add_DF| |stepSize| 1.0) (QREFELT $ 84)))
               1)
            . #2#)
      (LETT |divn|
            (|expt_DF_I| (FLOAT 10 MOST-POSITIVE-DOUBLE-FLOAT) |expStep|)
            . #2#)
      (LETT |minPrimaryNorm| (|div_DF| |minPrimary| |divn|) . #2#)
      (LETT |maxPrimaryNorm| (|div_DF| |maxPrimary| |divn|) . #2#)
      (LETT |suffix| "" . #2#) (LETT |zeroes| |expStep| . #2#)
      (COND
       ((SPADCALL |zeroes| 2 (QREFELT $ 85))
        (SEQ (LETT |zeroes| (- |zeroes| 3) . #2#) (LETT |suffix| "K" . #2#)
             (EXIT
              (COND
               ((SPADCALL |zeroes| 2 (QREFELT $ 85))
                (SEQ (LETT |zeroes| (- |zeroes| 3) . #2#)
                     (LETT |suffix| "M" . #2#)
                     (EXIT
                      (COND
                       ((SPADCALL |zeroes| 2 (QREFELT $ 85))
                        (SEQ (LETT |zeroes| (- |zeroes| 3) . #2#)
                             (LETT |suffix| "G" . #2#)
                             (EXIT
                              (COND
                               ((SPADCALL |zeroes| 2 (QREFELT $ 85))
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
       ((SPADCALL |zeroes| 0 (QREFELT $ 85))
        (LETT |suffix| (STRCONC "0" |suffix|) . #2#)))
      (COND
       ((SPADCALL |zeroes| 1 (QREFELT $ 85))
        (LETT |suffix| (STRCONC "0" |suffix|) . #2#)))
      (LETT |gp| (SPADCALL (QREFELT $ 14)) . #2#)
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
                        0.0 (QREFELT $ 58))
                       |offset| (QREFELT $ 74))
                      . #2#)
                (COND
                 ((EQUAL |ptype| 'VERTICAL)
                  (LETT |pz|
                        (SPADCALL
                         (SPADCALL 0.0
                                   (|mul_DF|
                                    (FLOAT |x| MOST-POSITIVE-DOUBLE-FLOAT)
                                    |divn|)
                                   (QREFELT $ 58))
                         |offset| (QREFELT $ 74))
                        . #2#)))
                (COND
                 ((EQL |expStep| -1)
                  (SEQ
                   (COND
                    ((SPADCALL |x| 0 (QREFELT $ 85))
                     (COND
                      ((< |x| 10) (LETT |str| (STRCONC "0." |str|) . #2#)))))
                   (COND ((EQL |x| 10) (LETT |str| "1" . #2#)))
                   (COND
                    ((SPADCALL |x| 10 (QREFELT $ 85))
                     (SEQ (LETT |d| (DIVIDE2 |x| 10) . #2#)
                          (EXIT
                           (LETT |str|
                                 (SPADCALL
                                  (LIST (STRINGIMAGE (QCAR |d|)) "."
                                        (STRINGIMAGE (QCDR |d|)))
                                  (QREFELT $ 87))
                                 . #2#)))))
                   (COND
                    ((< |x| 0)
                     (COND
                      ((SPADCALL |x| -10 (QREFELT $ 85))
                       (LETT |str|
                             (SPADCALL
                              (LIST "-0." (|mathObject2String| (- |x|)))
                              (QREFELT $ 87))
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
                                   (QREFELT $ 87))
                                  . #2#))))))))
                 ((SPADCALL |x| 0 (QREFELT $ 88))
                  (LETT |str| (STRCONC |str| |suffix|) . #2#)))
                (EXIT (SPADCALL |gp| |str| 20 |pz| (QREFELT $ 50))))
           (LETT |x| (+ |x| |stepI|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |gp|))))) 

(DEFUN |SCENE;addSceneRuler;$SPTR$;41| (|n| |ptype| |offset| |bb| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |ptype| |offset| |bb| (QREFELT $ 89))
            |SCENE;addSceneRuler;$SPTR$;41|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneMaterial;R$;42| (|mat| $)
  (VECTOR 'MATERIAL NIL (CONS 1 |mat|))) 

(DEFUN |SCENE;addSceneMaterial;$R$;43| (|n| |mat| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |mat| (QREFELT $ 91))
            |SCENE;addSceneMaterial;$R$;43|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneMaterial;Df2S$;44| (|lineW| |lineC| |fillC| $)
  (PROG (|mat|)
    (RETURN
     (SEQ
      (LETT |mat| (VECTOR |lineW| |lineC| |fillC| 1.0)
            |SCENE;createSceneMaterial;Df2S$;44|)
      (EXIT (VECTOR 'MATERIAL NIL (CONS 1 |mat|))))))) 

(DEFUN |SCENE;addSceneMaterial;$Df2S$;45| (|n| |lineW| |lineC| |fillC| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |lineW| |lineC| |fillC| (QREFELT $ 92))
            |SCENE;addSceneMaterial;$Df2S$;45|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneTransform;St$;46| (|tran| $)
  (VECTOR 'TRANSFORM NIL (CONS 4 |tran|))) 

(DEFUN |SCENE;addSceneTransform;$St$;47| (|n| |tran| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |tran| (QREFELT $ 95))
            |SCENE;addSceneTransform;$St$;47|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createArrows2Din2D;M2SNni$;48| (|ptFun| |uSeg| |vSeg| |numPts| $)
  (PROG (|someV| |arrows| |someU| |lp| |outpt| |inPt| |iu| |iv| |vstep|
         |ustep|)
    (RETURN
     (SEQ (LETT |arrows| NIL . #1=(|SCENE;createArrows2Din2D;M2SNni$;48|))
          (LETT |ustep|
                (|div_DF_I|
                 (|sub_DF| (SPADCALL |uSeg| (QREFELT $ 98))
                           (SPADCALL |uSeg| (QREFELT $ 99)))
                 |numPts|)
                . #1#)
          (LETT |vstep|
                (|div_DF_I|
                 (|sub_DF| (SPADCALL |vSeg| (QREFELT $ 98))
                           (SPADCALL |vSeg| (QREFELT $ 99)))
                 |numPts|)
                . #1#)
          (LETT |someV| (SPADCALL |vSeg| (QREFELT $ 99)) . #1#)
          (SEQ (LETT |iv| |numPts| . #1#) G190 (COND ((< |iv| 0) (GO G191)))
               (SEQ
                (COND
                 ((ZEROP |iv|)
                  (LETT |someV| (SPADCALL |vSeg| (QREFELT $ 98)) . #1#)))
                (LETT |lp| NIL . #1#)
                (LETT |someU| (SPADCALL |uSeg| (QREFELT $ 99)) . #1#)
                (SEQ (LETT |iu| |numPts| . #1#) G190
                     (COND ((< |iu| 0) (GO G191)))
                     (SEQ
                      (COND
                       ((ZEROP |iu|)
                        (LETT |someU| (SPADCALL |uSeg| (QREFELT $ 98)) . #1#)))
                      (LETT |inPt| (SPADCALL |someU| |someV| (QREFELT $ 58))
                            . #1#)
                      (LETT |outpt| (SPADCALL |inPt| |ptFun|) . #1#)
                      (LETT |lp| (LIST |inPt| |outpt|) . #1#)
                      (LETT |someU| (|add_DF| |someU| |ustep|) . #1#)
                      (EXIT (LETT |arrows| (CONS |lp| |arrows|) . #1#)))
                     (LETT |iu| (+ |iu| -1) . #1#) (GO G190) G191 (EXIT NIL))
                (EXIT (LETT |someV| (|add_DF| |someV| |vstep|) . #1#)))
               (LETT |iv| (+ |iv| -1) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |arrows| '|medium| '|medium| (QREFELT $ 25))))))) 

(DEFUN |SCENE;addArrows2Din2D;$M2SNni$;49|
       (|n| |ptFun| |uSeg| |vSeg| |numPts| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |ptFun| |uSeg| |vSeg| |numPts| (QREFELT $ 101))
            |SCENE;addArrows2Din2D;$M2SNni$;49|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;addChild!;2$V;50| (|n| |c| $)
  (QSETVELT |n| 1 (SPADCALL (QVELT |n| 1) |c| (QREFELT $ 104)))) 

(PUT '|SCENE;removeChild!;2$V;51| '|SPADreplace|
     '(XLAM (|n| |c|) (|error| "removeChild! not yet implemented"))) 

(DEFUN |SCENE;removeChild!;2$V;51| (|n| |c| $)
  (|error| "removeChild! not yet implemented")) 

(DEFUN |SCENE;setTransform!;$StV;52| (|n| |tran| $)
  (COND
   ((SPADCALL (QVELT |n| 0) 'TRANSFORM (QREFELT $ 106))
    (|error| "use setTransform! on transform only"))
   ('T (QSETVELT |n| 2 (CONS 4 |tran|))))) 

(DEFUN |SCENE;pathString| (|pts| |tran| |bb| |sc| |clipEn| |useInteger| $)
  (PROG (|lastValid| |ptStr| |thisStr| |minusy| |pntNum| |valid| |param2|
         #1=#:G701 |param| #2=#:G700 |line|)
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
                                 (SPADCALL |tran| |param| (QREFELT $ 108))
                                 . #3#)
                           (LETT |valid|
                                 (COND
                                  (|clipEn|
                                   (SPADCALL |param| (QCAR |bb|) (QCDR |bb|)
                                             (QREFELT $ 109)))
                                  ('T 'T))
                                 . #3#)
                           (COND
                            (|valid|
                             (SEQ (LETT |pntNum| (+ |pntNum| 1) . #3#)
                                  (COND
                                   ((SPADCALL |ptStr| "" (QREFELT $ 110))
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
                                          (SPADCALL |param2| (QREFELT $ 57))
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
                                                         (QREFELT $ 56))
                                               |sc|)))
                                            ","
                                            (STRINGIMAGE (TRUNCATE |minusy|)))
                                           (QREFELT $ 87))
                                          . #3#))
                                   ('T
                                    (LETT |thisStr|
                                          (SPADCALL
                                           (LIST
                                            (|mathObject2String|
                                             (|mul_DF|
                                              (SPADCALL |param2|
                                                        (QREFELT $ 56))
                                              |sc|))
                                            "," (|mathObject2String| |minusy|))
                                           (QREFELT $ 87))
                                          . #3#)))
                                  (EXIT
                                   (LETT |ptStr| (STRCONC |ptStr| |thisStr|)
                                         . #3#)))))
                           (EXIT (LETT |lastValid| |valid| . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |ptStr|))))) 

(DEFUN |SCENE;lineArrow| (|pts| |tran| |bb| |mat| |sc| |clipEn| $)
  (PROG (|nodeEles| |x| |nodeAtts| |linWidth| |ptStr| |thisStr| |minusy|
         |endPoint| |startPoint| |pntNum| |valid| |param2| #1=#:G716 |param|
         #2=#:G715 |line|)
    (RETURN
     (SEQ (LETT |nodeEles| NIL . #3=(|SCENE;lineArrow|))
          (SEQ (LETT |line| NIL . #3#) (LETT #2# |pts| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |line| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |pntNum| 0 . #3#) (LETT |ptStr| "" . #3#)
                    (LETT |startPoint| (SPADCALL 0 0 (QREFELT $ 11)) . #3#)
                    (LETT |endPoint| (SPADCALL 0 0 (QREFELT $ 11)) . #3#)
                    (SEQ (LETT |param| NIL . #3#) (LETT #1# |line| . #3#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |param| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |param2|
                                (SPADCALL |tran| |param| (QREFELT $ 108))
                                . #3#)
                          (LETT |valid|
                                (COND
                                 (|clipEn|
                                  (SPADCALL |param| (QCAR |bb|) (QCDR |bb|)
                                            (QREFELT $ 109)))
                                 ('T 'T))
                                . #3#)
                          (EXIT
                           (COND
                            (|valid|
                             (SEQ (LETT |pntNum| (+ |pntNum| 1) . #3#)
                                  (COND
                                   ((SPADCALL |ptStr| "" (QREFELT $ 110))
                                    (LETT |ptStr| (STRCONC |ptStr| " ")
                                          . #3#)))
                                  (COND
                                   ((EQL |pntNum| 1)
                                    (SEQ
                                     (LETT |ptStr| (STRCONC |ptStr| "M") . #3#)
                                     (EXIT
                                      (LETT |startPoint| |param2| . #3#))))
                                   ('T (LETT |endPoint| |param2| . #3#)))
                                  (COND
                                   ((EQL |pntNum| 2)
                                    (LETT |ptStr| (STRCONC |ptStr| "L")
                                          . #3#)))
                                  (LETT |minusy|
                                        (|minus_DF|
                                         (|mul_DF|
                                          (SPADCALL |param2| (QREFELT $ 57))
                                          |sc|))
                                        . #3#)
                                  (LETT |thisStr|
                                        (SPADCALL
                                         (LIST
                                          (|mathObject2String|
                                           (|mul_DF|
                                            (SPADCALL |param2| (QREFELT $ 56))
                                            |sc|))
                                          "," (|mathObject2String| |minusy|))
                                         (QREFELT $ 87))
                                        . #3#)
                                  (EXIT
                                   (LETT |ptStr| (STRCONC |ptStr| |thisStr|)
                                         . #3#)))))))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND
                      ((SPADCALL |ptStr| "" (QREFELT $ 110))
                       (SEQ
                        (LETT |linWidth|
                              (|div_DF|
                               (SPADCALL |startPoint| |endPoint|
                                         (QREFELT $ 111))
                               (FLOAT 10 MOST-POSITIVE-DOUBLE-FLOAT))
                              . #3#)
                        (LETT |nodeAtts|
                              (LIST (SPADCALL "d" |ptStr| (QREFELT $ 113))
                                    (SPADCALL "fill" "none" (QREFELT $ 113))
                                    (SPADCALL "stroke" (QVELT |mat| 1)
                                              (QREFELT $ 113))
                                    (SPADCALL "stroke-width"
                                              (|mathObject2String| |linWidth|)
                                              (QREFELT $ 113))
                                    (SPADCALL "style" "marker-end:url(#Arrow)"
                                              (QREFELT $ 113)))
                              . #3#)
                        (LETT |x|
                              (SPADCALL "path" NIL |nodeAtts| (QREFELT $ 116))
                              . #3#)
                        (EXIT
                         (LETT |nodeEles|
                               (SPADCALL |nodeEles| |x| (QREFELT $ 118))
                               . #3#)))))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |nodeEles|))))) 

(DEFUN |SCENE;faceString| (|faces| |tran| |bb| |sc| |clipEn| $)
  (PROG (|ptStr| |lastValid| |thisStr| |minusy| |pntNum| |valid| |param2|
         |param| #1=#:G730 |i| #2=#:G729 |ln|)
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
                                          (QREFELT $ 73))
                                . #3#)
                          (LETT |param2|
                                (SPADCALL |tran| |param| (QREFELT $ 108))
                                . #3#)
                          (LETT |valid|
                                (COND
                                 (|clipEn|
                                  (SPADCALL |param| (QCAR |bb|) (QCDR |bb|)
                                            (QREFELT $ 109)))
                                 ('T 'T))
                                . #3#)
                          (COND
                           (|valid|
                            (SEQ (LETT |pntNum| (+ |pntNum| 1) . #3#)
                                 (COND
                                  ((SPADCALL |ptStr| "" (QREFELT $ 110))
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
                                         (SPADCALL |param2| (QREFELT $ 57))
                                         |sc|))
                                       . #3#)
                                 (LETT |thisStr|
                                       (SPADCALL
                                        (LIST
                                         (|mathObject2String|
                                          (|mul_DF|
                                           (SPADCALL |param2| (QREFELT $ 56))
                                           |sc|))
                                         "," (|mathObject2String| |minusy|))
                                        (QREFELT $ 87))
                                       . #3#)
                                 (EXIT
                                  (LETT |ptStr| (STRCONC |ptStr| |thisStr|)
                                        . #3#)))))
                          (EXIT (LETT |lastValid| |valid| . #3#)))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |ptStr| (STRCONC |ptStr| "z") . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |ptStr|))))) 

(DEFUN |SCENE;toSVG;$RStRDf2BSnpXe;56|
       (|n| |mat| |tran| |bb| |scale| |clipEn| |useInteger| |npt| $)
  (PROG (|nodeEles| |xch| #1=#:G789 |ch| |nodeName| |np2| #2=#:G746 |nodeAtts|
         |linWidth| |ptStr| |endPointM| |startPointM| |endPoint| #3=#:G745
         |startPoint| #4=#:G744 #5=#:G787 #6=#:G743 |bb2| |mx2| #7=#:G741 |mn2|
         |clipEn2| |tran2| #8=#:G742 #9=#:G740 |param2| |nodeAttsTxt|
         #10=#:G788 |nam| |mat2| #11=#:G739 #12=#:G738 |viewBoxStr| |offsety|
         |offsetx| |scale2| |maxy| |maxx| |miny| |minx| |mkr| |mkrAtts| |pth|
         |pthAtts|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |nodeName| "" . #13=(|SCENE;toSVG;$RStRDf2BSnpXe;56|))
            (LETT |bb2| |bb| . #13#) (LETT |tran2| |tran| . #13#)
            (LETT |mat2| |mat| . #13#) (LETT |np2| |npt| . #13#)
            (LETT |clipEn2| |clipEn| . #13#) (LETT |scale2| |scale| . #13#)
            (LETT |nodeEles| NIL . #13#) (LETT |nodeAtts| NIL . #13#)
            (COND
             ((EQUAL (QVELT |n| 0) 'ROOT)
              (SEQ (LETT |nodeName| "svg" . #13#)
                   (LETT |pthAtts|
                         (LIST
                          (SPADCALL "d"
                                    "M 0.0,0.0 L 5.0,-5.0 L -12.5,0.0 L 5.0,5.0 L 0.0,0.0 z "
                                    (QREFELT $ 113))
                          (SPADCALL "style"
                                    "fill-rule:evenodd;stroke:#000000;stroke-width:1.0pt;marker-start:none;"
                                    (QREFELT $ 113))
                          (SPADCALL "transform"
                                    "scale(0.4) rotate(180) translate(10,0)"
                                    (QREFELT $ 113)))
                         . #13#)
                   (LETT |pth| (SPADCALL "path" NIL |pthAtts| (QREFELT $ 116))
                         . #13#)
                   (LETT |mkrAtts|
                         (LIST (SPADCALL "orient" "auto" (QREFELT $ 113))
                               (SPADCALL "refY" "0.0" (QREFELT $ 113))
                               (SPADCALL "refX" "0.0" (QREFELT $ 113))
                               (SPADCALL "id" "Arrow" (QREFELT $ 113))
                               (SPADCALL "style" "overflow:visible"
                                         (QREFELT $ 113)))
                         . #13#)
                   (LETT |mkr|
                         (SPADCALL "marker" (LIST |pth|) |mkrAtts|
                                   (QREFELT $ 116))
                         . #13#)
                   (LETT |nodeEles|
                         (LIST
                          (SPADCALL "defs" (LIST |mkr|) NIL (QREFELT $ 116)))
                         . #13#)
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 3))
                     (|error| "toSVG parameter type not valid for root node")))
                   (LETT |bb2|
                         (PROG2 (LETT #7# (QVELT |n| 2) . #13#)
                             (QCDR #7#)
                           (|check_union| (QEQCAR #7# 3)
                                          (|Record| (|:| |mins| (QREFELT $ 6))
                                                    (|:| |maxs| (QREFELT $ 6)))
                                          #7#))
                         . #13#)
                   (LETT |minx| (SPADCALL (QCAR |bb2|) (QREFELT $ 56)) . #13#)
                   (LETT |miny| (SPADCALL (QCAR |bb2|) (QREFELT $ 57)) . #13#)
                   (LETT |maxx| (SPADCALL (QCDR |bb2|) (QREFELT $ 56)) . #13#)
                   (LETT |maxy| (SPADCALL (QCDR |bb2|) (QREFELT $ 57)) . #13#)
                   (LETT |scale2|
                         (|div_DF| (FLOAT 1000 MOST-POSITIVE-DOUBLE-FLOAT)
                                   (|sub_DF| |maxx| |minx|))
                         . #13#)
                   (LETT |offsetx| (|minus_DF| |minx|) . #13#)
                   (LETT |offsety| (|minus_DF| |maxy|) . #13#)
                   (LETT |tran2|
                         (SPADCALL |offsetx| |offsety| 0.0 1.0 1.0 1.0
                                   (QREFELT $ 119))
                         . #13#)
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
                            (QREFELT $ 87))
                           . #13#))
                    (#14='T
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
                            (QREFELT $ 87))
                           . #13#)))
                   (EXIT
                    (LETT |nodeAtts|
                          (LIST
                           (SPADCALL "xmlns" "http://www.w3.org/2000/svg"
                                     (QREFELT $ 113))
                           (SPADCALL "width" "12cm" (QREFELT $ 113))
                           (SPADCALL "height" "8cm" (QREFELT $ 113))
                           (SPADCALL "viewBox" |viewBoxStr| (QREFELT $ 113)))
                          . #13#)))))
            (COND ((EQUAL (QVELT |n| 0) 'GROUP) (LETT |nodeName| "g" . #13#)))
            (COND
             ((EQUAL (QVELT |n| 0) 'LINE)
              (SEQ
               (COND
                ((NULL (QEQCAR (QVELT |n| 2) 0))
                 (|error| "toSVG parameter type not valid for line node")))
               (LETT |nodeName| "path" . #13#)
               (LETT |nodeAtts|
                     (LIST
                      (SPADCALL "d"
                                (|SCENE;pathString|
                                 (PROG2 (LETT #12# (QVELT |n| 2) . #13#)
                                     (QCDR #12#)
                                   (|check_union| (QEQCAR #12# 0)
                                                  (|List|
                                                   (|List| (QREFELT $ 6)))
                                                  #12#))
                                 |tran2| |bb2| |scale2| |clipEn2| |useInteger|
                                 $)
                                (QREFELT $ 113))
                      (SPADCALL "fill" "none" (QREFELT $ 113))
                      (SPADCALL "stroke" (QVELT |mat2| 1) (QREFELT $ 113))
                      (SPADCALL "stroke-width"
                                (|mathObject2String| (QVELT |mat2| 0))
                                (QREFELT $ 113))
                      (SPADCALL "stroke-linecap" "butt" (QREFELT $ 113))
                      (SPADCALL "stroke-linejoin" "miter" (QREFELT $ 113)))
                     . #13#)
               (EXIT
                (COND
                 ((|less_DF| (QVELT |mat2| 3)
                             (SPADCALL (SPADCALL 95 -2 10 (QREFELT $ 63))
                                       (QREFELT $ 64)))
                  (LETT |nodeAtts|
                        (SPADCALL |nodeAtts|
                                  (SPADCALL "stroke-opacity"
                                            (|mathObject2String|
                                             (QVELT |mat2| 3))
                                            (QREFELT $ 113))
                                  (QREFELT $ 120))
                        . #13#)))))))
            (COND
             ((EQUAL (QVELT |n| 0) 'MATERIAL)
              (SEQ (LETT |nodeName| "g" . #13#)
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 1))
                     (|error|
                      "toSVG parameter type not valid for material node")))
                   (EXIT
                    (LETT |mat2|
                          (PROG2 (LETT #11# (QVELT |n| 2) . #13#)
                              (QCDR #11#)
                            (|check_union| (QEQCAR #11# 1)
                                           (|Record|
                                            (|:| |lineWidth| (|DoubleFloat|))
                                            (|:| |lineCol| (|String|))
                                            (|:| |fillCol| (|String|))
                                            (|:| |matOpacity| (|DoubleFloat|)))
                                           #11#))
                          . #13#)))))
            (COND
             ((EQUAL (QVELT |n| 0) 'TEXT)
              (SEQ (LETT |nodeName| "text" . #13#)
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 2))
                     (|error| "toSVG parameter type not valid for text node")))
                   (COND
                    ((SPADCALL
                      (QVELT
                       (PROG2 (LETT #9# (QVELT |n| 2) . #13#)
                           (QCDR #9#)
                         (|check_union| (QEQCAR #9# 2)
                                        (|Record| (|:| |txt| (|String|))
                                                  (|:| |siz|
                                                       (|NonNegativeInteger|))
                                                  (|:| |pos| (QREFELT $ 6))
                                                  (|:| |np|
                                                       (|List| (|String|))))
                                        #9#))
                       3)
                      NIL (QREFELT $ 121))
                     (SEQ
                      (SEQ (LETT |nam| NIL . #13#)
                           (LETT #10#
                                 (QVELT
                                  (PROG2 (LETT #9# (QVELT |n| 2) . #13#)
                                      (QCDR #9#)
                                    (|check_union| (QEQCAR #9# 2)
                                                   (|Record|
                                                    (|:| |txt| (|String|))
                                                    (|:| |siz|
                                                         (|NonNegativeInteger|))
                                                    (|:| |pos| (QREFELT $ 6))
                                                    (|:| |np|
                                                         (|List| (|String|))))
                                                   #9#))
                                  3)
                                 . #13#)
                           G190
                           (COND
                            ((OR (ATOM #10#)
                                 (PROGN (LETT |nam| (CAR #10#) . #13#) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |param2|
                                  (SPADCALL |tran|
                                            (SPADCALL
                                             (SPADCALL |np2| |nam|
                                                       (QREFELT $ 122))
                                             (QVELT
                                              (PROG2
                                                  (LETT #9# (QVELT |n| 2)
                                                        . #13#)
                                                  (QCDR #9#)
                                                (|check_union| (QEQCAR #9# 2)
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
                                                               #9#))
                                              2)
                                             (QREFELT $ 74))
                                            (QREFELT $ 108))
                                  . #13#)
                            (LETT |nodeAttsTxt|
                                  (LIST
                                   (SPADCALL "font-size"
                                             (STRINGIMAGE
                                              (QVELT
                                               (PROG2
                                                   (LETT #9# (QVELT |n| 2)
                                                         . #13#)
                                                   (QCDR #9#)
                                                 (|check_union| (QEQCAR #9# 2)
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
                                                                #9#))
                                               1))
                                             (QREFELT $ 113))
                                   (SPADCALL "x"
                                             (|mathObject2String|
                                              (|mul_DF|
                                               (SPADCALL |param2|
                                                         (QREFELT $ 56))
                                               |scale2|))
                                             (QREFELT $ 113))
                                   (SPADCALL "y"
                                             (|mathObject2String|
                                              (|minus_DF|
                                               (|mul_DF|
                                                (SPADCALL |param2|
                                                          (QREFELT $ 57))
                                                |scale2|)))
                                             (QREFELT $ 113))
                                   (SPADCALL "style"
                                             (STRCONC "fill:" (QVELT |mat2| 2))
                                             (QREFELT $ 113)))
                                  . #13#)
                            (LETT |xch|
                                  (SPADCALL |nodeName| |nam| |nodeAttsTxt|
                                            (QREFELT $ 123))
                                  . #13#)
                            (EXIT
                             (COND
                              ((NULL (SPADCALL |xch| (QREFELT $ 124)))
                               (LETT |nodeEles|
                                     (SPADCALL |nodeEles| |xch|
                                               (QREFELT $ 118))
                                     . #13#)))))
                           (LETT #10# (CDR #10#) . #13#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (PROGN
                        (LETT #5#
                              (SPADCALL "g" |nodeEles| |nodeAtts|
                                        (QREFELT $ 116))
                              . #13#)
                        (GO #5#))))))
                   (LETT |param2|
                         (SPADCALL |tran|
                                   (QVELT
                                    (PROG2 (LETT #9# (QVELT |n| 2) . #13#)
                                        (QCDR #9#)
                                      (|check_union| (QEQCAR #9# 2)
                                                     (|Record|
                                                      (|:| |txt| (|String|))
                                                      (|:| |siz|
                                                           (|NonNegativeInteger|))
                                                      (|:| |pos| (QREFELT $ 6))
                                                      (|:| |np|
                                                           (|List|
                                                            (|String|))))
                                                     #9#))
                                    2)
                                   (QREFELT $ 108))
                         . #13#)
                   (LETT |nodeAtts|
                         (LIST
                          (SPADCALL "font-size"
                                    (STRINGIMAGE
                                     (QVELT
                                      (PROG2 (LETT #9# (QVELT |n| 2) . #13#)
                                          (QCDR #9#)
                                        (|check_union| (QEQCAR #9# 2)
                                                       (|Record|
                                                        (|:| |txt| (|String|))
                                                        (|:| |siz|
                                                             (|NonNegativeInteger|))
                                                        (|:| |pos|
                                                             (QREFELT $ 6))
                                                        (|:| |np|
                                                             (|List|
                                                              (|String|))))
                                                       #9#))
                                      1))
                                    (QREFELT $ 113))
                          (SPADCALL "x"
                                    (|mathObject2String|
                                     (|mul_DF|
                                      (SPADCALL |param2| (QREFELT $ 56))
                                      |scale2|))
                                    (QREFELT $ 113))
                          (SPADCALL "y"
                                    (|mathObject2String|
                                     (|minus_DF|
                                      (|mul_DF|
                                       (SPADCALL |param2| (QREFELT $ 57))
                                       |scale2|)))
                                    (QREFELT $ 113))
                          (SPADCALL "style" (STRCONC "fill:" (QVELT |mat2| 2))
                                    (QREFELT $ 113)))
                         . #13#)
                   (EXIT
                    (PROGN
                     (LETT #5#
                           (SPADCALL |nodeName|
                                     (QVELT
                                      (PROG2 (LETT #9# (QVELT |n| 2) . #13#)
                                          (QCDR #9#)
                                        (|check_union| (QEQCAR #9# 2)
                                                       (|Record|
                                                        (|:| |txt| (|String|))
                                                        (|:| |siz|
                                                             (|NonNegativeInteger|))
                                                        (|:| |pos|
                                                             (QREFELT $ 6))
                                                        (|:| |np|
                                                             (|List|
                                                              (|String|))))
                                                       #9#))
                                      0)
                                     |nodeAtts| (QREFELT $ 123))
                           . #13#)
                     (GO #5#))))))
            (COND
             ((EQUAL (QVELT |n| 0) 'TRANSFORM)
              (SEQ (LETT |nodeName| "g" . #13#)
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 4))
                     (|error|
                      "toSVG parameter type not valid for trans node")))
                   (EXIT
                    (LETT |tran2|
                          (SPADCALL
                           (PROG2 (LETT #8# (QVELT |n| 2) . #13#)
                               (QCDR #8#)
                             (|check_union| (QEQCAR #8# 4)
                                            (|STransform| (QREFELT $ 6)) #8#))
                           |tran| (QREFELT $ 125))
                          . #13#)))))
            (COND
             ((EQUAL (QVELT |n| 0) 'CLIP)
              (SEQ (LETT |nodeName| "g" . #13#) (LETT |clipEn2| 'T . #13#)
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 3))
                     (|error| "toSVG parameter type not valid for clip node")))
                   (LETT |mn2|
                         (QCAR
                          (PROG2 (LETT #7# (QVELT |n| 2) . #13#)
                              (QCDR #7#)
                            (|check_union| (QEQCAR #7# 3)
                                           (|Record| (|:| |mins| (QREFELT $ 6))
                                                     (|:| |maxs|
                                                          (QREFELT $ 6)))
                                           #7#)))
                         . #13#)
                   (LETT |mx2|
                         (QCDR
                          (PROG2 (LETT #7# (QVELT |n| 2) . #13#)
                              (QCDR #7#)
                            (|check_union| (QEQCAR #7# 3)
                                           (|Record| (|:| |mins| (QREFELT $ 6))
                                                     (|:| |maxs|
                                                          (QREFELT $ 6)))
                                           #7#)))
                         . #13#)
                   (EXIT (LETT |bb2| (CONS |mn2| |mx2|) . #13#)))))
            (COND
             ((EQUAL (QVELT |n| 0) 'IFS)
              (SEQ (LETT |nodeName| "path" . #13#)
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 5))
                     (|error| "toSVG parameter type not valid for ifs node")))
                   (LETT |nodeAtts|
                         (LIST
                          (SPADCALL "d"
                                    (|SCENE;faceString|
                                     (PROG2 (LETT #6# (QVELT |n| 2) . #13#)
                                         (QCDR #6#)
                                       (|check_union| (QEQCAR #6# 5)
                                                      (|Record|
                                                       (|:| |inx|
                                                            (|List|
                                                             (|List|
                                                              (|NonNegativeInteger|))))
                                                       (|:| |pts|
                                                            (|List|
                                                             (QREFELT $ 6))))
                                                      #6#))
                                     |tran2| |bb2| |scale2| |clipEn2| $)
                                    (QREFELT $ 113))
                          (SPADCALL "fill" (QVELT |mat2| 2) (QREFELT $ 113))
                          (SPADCALL "stroke" (QVELT |mat2| 1) (QREFELT $ 113))
                          (SPADCALL "stroke-width"
                                    (|mathObject2String| (QVELT |mat2| 0))
                                    (QREFELT $ 113)))
                         . #13#)
                   (EXIT
                    (PROGN
                     (LETT #5#
                           (SPADCALL |nodeName| NIL |nodeAtts| (QREFELT $ 116))
                           . #13#)
                     (GO #5#))))))
            (COND
             ((EQUAL (QVELT |n| 0) 'ARROWS)
              (SEQ (LETT |nodeName| "g" . #13#)
                   (COND
                    ((NULL (QEQCAR (QVELT |n| 2) 6))
                     (|error|
                      "toSVG parameter type not valid for arrws node")))
                   (EXIT
                    (LETT |nodeEles|
                          (|SCENE;lineArrow|
                           (QVELT
                            (PROG2 (LETT #4# (QVELT |n| 2) . #13#)
                                (QCDR #4#)
                              (|check_union| (QEQCAR #4# 6)
                                             (|Record|
                                              (|:| |ln|
                                                   (|List|
                                                    (|List| (QREFELT $ 6))))
                                              (|:| |lstart| (|Symbol|))
                                              (|:| |lend| (|Symbol|)))
                                             #4#))
                            0)
                           |tran2| |bb2| |mat2| |scale2| |clipEn2| $)
                          . #13#)))))
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
                                               (LETT #3# (QVELT |n| 2) . #13#)
                                               (QCDR #3#)
                                             (|check_union| (QEQCAR #3# 7)
                                                            (|Record|
                                                             (|:| |st|
                                                                  (|String|))
                                                             (|:| |en|
                                                                  (|String|))
                                                             (|:| |offset|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |lstart|
                                                                  (|Symbol|))
                                                             (|:| |lend|
                                                                  (|Symbol|)))
                                                            #3#))
                                           0)
                                          (QREFELT $ 122))
                                (QVELT
                                 (PROG2 (LETT #3# (QVELT |n| 2) . #13#)
                                     (QCDR #3#)
                                   (|check_union| (QEQCAR #3# 7)
                                                  (|Record|
                                                   (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT $ 6))
                                                   (|:| |lstart| (|Symbol|))
                                                   (|:| |lend| (|Symbol|)))
                                                  #3#))
                                 2)
                                (QREFELT $ 74))
                               (QREFELT $ 108))
                     . #13#)
               (LETT |endPoint|
                     (SPADCALL |tran|
                               (SPADCALL
                                (SPADCALL |np2|
                                          (QVELT
                                           (PROG2
                                               (LETT #3# (QVELT |n| 2) . #13#)
                                               (QCDR #3#)
                                             (|check_union| (QEQCAR #3# 7)
                                                            (|Record|
                                                             (|:| |st|
                                                                  (|String|))
                                                             (|:| |en|
                                                                  (|String|))
                                                             (|:| |offset|
                                                                  (QREFELT $
                                                                           6))
                                                             (|:| |lstart|
                                                                  (|Symbol|))
                                                             (|:| |lend|
                                                                  (|Symbol|)))
                                                            #3#))
                                           1)
                                          (QREFELT $ 122))
                                (QVELT
                                 (PROG2 (LETT #3# (QVELT |n| 2) . #13#)
                                     (QCDR #3#)
                                   (|check_union| (QEQCAR #3# 7)
                                                  (|Record|
                                                   (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT $ 6))
                                                   (|:| |lstart| (|Symbol|))
                                                   (|:| |lend| (|Symbol|)))
                                                  #3#))
                                 2)
                                (QREFELT $ 74))
                               (QREFELT $ 108))
                     . #13#)
               (LETT |startPointM|
                     (|minus_DF|
                      (|mul_DF| (SPADCALL |startPoint| (QREFELT $ 57))
                                |scale|))
                     . #13#)
               (LETT |endPointM|
                     (|minus_DF|
                      (|mul_DF| (SPADCALL |endPoint| (QREFELT $ 57)) |scale|))
                     . #13#)
               (LETT |ptStr|
                     (SPADCALL
                      (LIST "M"
                            (|mathObject2String|
                             (|mul_DF| (SPADCALL |startPoint| (QREFELT $ 56))
                                       |scale|))
                            "," (|mathObject2String| |startPointM|) "L"
                            (|mathObject2String|
                             (|mul_DF| (SPADCALL |endPoint| (QREFELT $ 56))
                                       |scale|))
                            "," (|mathObject2String| |endPointM|))
                      (QREFELT $ 87))
                     . #13#)
               (LETT |linWidth| (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) . #13#)
               (LETT |nodeAtts|
                     (LIST (SPADCALL "d" |ptStr| (QREFELT $ 113))
                           (SPADCALL "fill" "none" (QREFELT $ 113))
                           (SPADCALL "stroke" (QVELT |mat| 1) (QREFELT $ 113))
                           (SPADCALL "stroke-width"
                                     (|mathObject2String| |linWidth|)
                                     (QREFELT $ 113))
                           (SPADCALL "style" "marker-end:url(#Arrow)"
                                     (QREFELT $ 113)))
                     . #13#)
               (LETT |nodeEles|
                     (LIST (SPADCALL "path" NIL |nodeAtts| (QREFELT $ 116)))
                     . #13#)
               (EXIT (LETT |nodeName| "g" . #13#)))))
            (COND
             ((EQUAL (QVELT |n| 0) 'NAMEDPOINTS)
              (SEQ
               (COND
                ((NULL (QEQCAR (QVELT |n| 2) 8))
                 (|error| "toSVG parameter type not valid for np node")))
               (LETT |np2|
                     (PROG2 (LETT #2# (QVELT |n| 2) . #13#)
                         (QCDR #2#)
                       (|check_union| (QEQCAR #2# 8)
                                      (|SceneNamedPoints| (QREFELT $ 6)) #2#))
                     . #13#)
               (EXIT (LETT |nodeName| "g" . #13#)))))
            (EXIT
             (COND
              ((< (SPADCALL (QVELT |n| 1) (QREFELT $ 126)) 1)
               (SPADCALL |nodeName| |nodeEles| |nodeAtts| (QREFELT $ 116)))
              (#14#
               (SEQ
                (SEQ (LETT |ch| NIL . #13#) (LETT #1# (QVELT |n| 1) . #13#)
                     G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |ch| (CAR #1#) . #13#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |xch|
                            (SPADCALL |ch| |mat2| |tran2| |bb2| |scale2|
                                      |clipEn2| |useInteger| |np2|
                                      (QREFELT $ 127))
                            . #13#)
                      (EXIT
                       (COND
                        ((NULL (SPADCALL |xch| (QREFELT $ 124)))
                         (LETT |nodeEles|
                               (SPADCALL |nodeEles| |xch| (QREFELT $ 118))
                               . #13#)))))
                     (LETT #1# (CDR #1#) . #13#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (SPADCALL |nodeName| |nodeEles| |nodeAtts|
                           (QREFELT $ 116)))))))))
      #5# (EXIT #5#))))) 

(DEFUN |SCENE;writeSvg;$SV;57| (|n| |filename| $)
  (PROG (|defaultBounds| |defaultTransform| |defaultMaterial|)
    (RETURN
     (SEQ
      (LETT |defaultMaterial|
            (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "black" "black" 1.0)
            . #1=(|SCENE;writeSvg;$SV;57|))
      (LETT |defaultTransform| (SPADCALL (QREFELT $ 128)) . #1#)
      (LETT |defaultBounds|
            (CONS
             (SPADCALL (|minus_DF| (FLOAT 9000 MOST-POSITIVE-DOUBLE-FLOAT))
                       (|minus_DF| (FLOAT 9000 MOST-POSITIVE-DOUBLE-FLOAT))
                       (QREFELT $ 58))
             (SPADCALL (FLOAT 9000 MOST-POSITIVE-DOUBLE-FLOAT)
                       (FLOAT 9000 MOST-POSITIVE-DOUBLE-FLOAT) (QREFELT $ 58)))
            . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL |n| |defaultMaterial| |defaultTransform| |defaultBounds| 1.0
                  'NIL 'NIL (SPADCALL NIL NIL (QREFELT $ 129)) (QREFELT $ 127))
        |filename| (QREFELT $ 131))))))) 

(DEFUN |SCENE;writeSvgQuantised;$SV;58| (|n| |filename| $)
  (PROG (|defaultBounds| |defaultTransform| |defaultMaterial|)
    (RETURN
     (SEQ
      (LETT |defaultMaterial|
            (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "black" "black" 1.0)
            . #1=(|SCENE;writeSvgQuantised;$SV;58|))
      (LETT |defaultTransform| (SPADCALL (QREFELT $ 128)) . #1#)
      (LETT |defaultBounds|
            (CONS
             (SPADCALL (|minus_DF| (FLOAT 9000 MOST-POSITIVE-DOUBLE-FLOAT))
                       (|minus_DF| (FLOAT 9000 MOST-POSITIVE-DOUBLE-FLOAT))
                       (QREFELT $ 58))
             (SPADCALL (FLOAT 9000 MOST-POSITIVE-DOUBLE-FLOAT)
                       (FLOAT 9000 MOST-POSITIVE-DOUBLE-FLOAT) (QREFELT $ 58)))
            . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL |n| |defaultMaterial| |defaultTransform| |defaultBounds| 1.0
                  'NIL 'T (SPADCALL NIL NIL (QREFELT $ 129)) (QREFELT $ 127))
        |filename| (QREFELT $ 131))))))) 

(DEFUN |SCENE;pointString| (|pts| |tran| |bb| $)
  (PROG (|ptStr| |thisStr| |param2| #1=#:G803 |param| |lastValid|)
    (RETURN
     (SEQ (LETT |ptStr| NIL . #2=(|SCENE;pointString|))
          (LETT |lastValid| 'T . #2#)
          (SEQ (LETT |param| NIL . #2#) (LETT #1# |pts| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |param| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |param2| (SPADCALL |tran| |param| (QREFELT $ 108)) . #2#)
                (LETT |thisStr|
                      (SPADCALL
                       (LIST
                        (|mathObject2String|
                         (SPADCALL |param2| (QREFELT $ 56)))
                        " "
                        (|mathObject2String|
                         (SPADCALL |param2| (QREFELT $ 57)))
                        " "
                        (|mathObject2String|
                         (SPADCALL |param2| (QREFELT $ 134))))
                       (QREFELT $ 87))
                      . #2#)
                (EXIT
                 (LETT |ptStr| (SPADCALL |ptStr| |thisStr| (QREFELT $ 135))
                       . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |ptStr|))))) 

(DEFUN |SCENE;pointIndexString| (|pts| |tran| |bb| $)
  (PROG (|ptStr| #1=#:G811 |param| #2=#:G810 |line|)
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
                                       (QREFELT $ 135))
                             . #3#)))
                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (LETT |ptStr| (SPADCALL |ptStr| "-1" (QREFELT $ 135)) . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |ptStr|))))) 

(DEFUN |SCENE;setX3DNodeName| (|typ| $)
  (PROG (|nodeName|)
    (RETURN
     (SEQ (LETT |nodeName| "" . #1=(|SCENE;setX3DNodeName|))
          (COND ((EQUAL |typ| 'ROOT) (LETT |nodeName| "X3D" . #1#)))
          (COND ((EQUAL |typ| 'GROUP) (LETT |nodeName| "Group" . #1#)))
          (COND ((EQUAL |typ| 'LINE) (LETT |nodeName| "IndexedFaceSet" . #1#)))
          (COND ((EQUAL |typ| 'MATERIAL) (LETT |nodeName| "Group" . #1#)))
          (COND ((EQUAL |typ| 'TEXT) (LETT |nodeName| "Text" . #1#)))
          (COND ((EQUAL |typ| 'TRANSFORM) (LETT |nodeName| "Transform" . #1#)))
          (COND ((EQUAL |typ| 'CLIP) (LETT |nodeName| "Group" . #1#)))
          (COND ((EQUAL |typ| 'IFS) (LETT |nodeName| "IndexedFaceSet" . #1#)))
          (COND
           ((EQUAL |typ| 'ARROWS) (LETT |nodeName| "IndexedFaceSet" . #1#)))
          (EXIT |nodeName|))))) 

(DEFUN |SCENE;toX3D;$RStRXe;62| (|n| |mat| |tran| |bb| $)
  (PROG (|nodeEles| |xch| #1=#:G861 |ch| #2=#:G859 |ifset| |coord| #3=#:G826
         |nodeAtts| |ifsR| |meshR| #4=#:G827 #5=#:G821 #6=#:G823 |bb2| |mx2|
         #7=#:G824 |mn2| |tran2| #8=#:G825 |mat2| #9=#:G822 |inner| #10=#:G860
         |nodeName|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |nodeName| (|SCENE;setX3DNodeName| (QVELT |n| 0) $)
              . #11=(|SCENE;toX3D;$RStRXe;62|))
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
                   (|check_union| (QEQCAR #7# 3)
                                  (|Record| (|:| |mins| (QREFELT $ 6))
                                            (|:| |maxs| (QREFELT $ 6)))
                                  #7#))
                 . #11#)
           (LETT |bb2|
                 (PROG2 (LETT #7# (QVELT |n| 2) . #11#)
                     (QCDR #7#)
                   (|check_union| (QEQCAR #7# 3)
                                  (|Record| (|:| |mins| (QREFELT $ 6))
                                            (|:| |maxs| (QREFELT $ 6)))
                                  #7#))
                 . #11#)
           (LETT |nodeEles| NIL . #11#)
           (SEQ (LETT |ch| NIL . #11#) (LETT #10# (QVELT |n| 1) . #11#) G190
                (COND
                 ((OR (ATOM #10#) (PROGN (LETT |ch| (CAR #10#) . #11#) NIL))
                  (GO G191)))
                (SEQ
                 (LETT |xch|
                       (SPADCALL |ch| |mat2| |tran2| |bb2| (QREFELT $ 136))
                       . #11#)
                 (EXIT
                  (COND
                   ((NULL (SPADCALL |xch| (QREFELT $ 124)))
                    (LETT |nodeEles|
                          (SPADCALL |nodeEles| |xch| (QREFELT $ 118))
                          . #11#)))))
                (LETT #10# (CDR #10#) . #11#) (GO G190) G191 (EXIT NIL))
           (LETT |inner|
                 (SPADCALL "Scene" |nodeEles| |nodeAtts| (QREFELT $ 116))
                 . #11#)
           (EXIT
            (PROGN
             (LETT #2#
                   (SPADCALL |nodeName| (LIST |inner|) |nodeAtts|
                             (QREFELT $ 116))
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
                   |tran| (QREFELT $ 125))
                  . #11#)))))
        (COND
         ((EQUAL (QVELT |n| 0) 'CLIP)
          (SEQ
           (COND
            ((NULL (QEQCAR (QVELT |n| 2) 3))
             (|error| "toX3D parameter type not valid for clip node")))
           (LETT |mn2|
                 (QCAR
                  (PROG2 (LETT #7# (QVELT |n| 2) . #11#)
                      (QCDR #7#)
                    (|check_union| (QEQCAR #7# 3)
                                   (|Record| (|:| |mins| (QREFELT $ 6))
                                             (|:| |maxs| (QREFELT $ 6)))
                                   #7#)))
                 . #11#)
           (LETT |mx2|
                 (QCDR
                  (PROG2 (LETT #7# (QVELT |n| 2) . #11#)
                      (QCDR #7#)
                    (|check_union| (QEQCAR #7# 3)
                                   (|Record| (|:| |mins| (QREFELT $ 6))
                                             (|:| |maxs| (QREFELT $ 6)))
                                   #7#)))
                 . #11#)
           (EXIT (LETT |bb2| (CONS |mn2| |mx2|) . #11#)))))
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
                             (QREFELT $ 113)))
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
                  (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 63)) (QREFELT $ 64))
                  8 (QREFELT $ 137))
                 . #11#)
           (LETT |ifsR| (SPADCALL |meshR| 'NIL (QREFELT $ 138)) . #11#)
           (LETT |nodeAtts|
                 (LIST
                  (SPADCALL "coordIndex"
                            (|SCENE;pointIndexString|
                             (SPADCALL |ifsR| (QREFELT $ 37)) |tran| |bb| $)
                            (QREFELT $ 139)))
                 . #11#)
           (LETT |coord|
                 (SPADCALL "Coordinate" NIL
                           (LIST
                            (SPADCALL "point"
                                      (|SCENE;pointString|
                                       (SPADCALL |ifsR| (QREFELT $ 38)) |tran|
                                       |bb| $)
                                      (QREFELT $ 139)))
                           (QREFELT $ 116))
                 . #11#)
           (LETT |ifset|
                 (SPADCALL |nodeName| (LIST |coord|) |nodeAtts|
                           (QREFELT $ 116))
                 . #11#)
           (EXIT
            (PROGN
             (LETT #2# (SPADCALL "Shape" (LIST |ifset|) NIL (QREFELT $ 116))
                   . #11#)
             (GO #2#))))))
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
                                      (|:| |lstart| (|Symbol|))
                                      (|:| |lend| (|Symbol|)))
                                     #4#))
                    0))
                  (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 63)) (QREFELT $ 64))
                  8 (QREFELT $ 137))
                 . #11#)
           (LETT |ifsR| (SPADCALL |meshR| 'NIL (QREFELT $ 138)) . #11#)
           (LETT |nodeAtts|
                 (LIST
                  (SPADCALL "coordIndex"
                            (|SCENE;pointIndexString|
                             (SPADCALL |ifsR| (QREFELT $ 37)) |tran| |bb| $)
                            (QREFELT $ 139)))
                 . #11#)
           (LETT |coord|
                 (SPADCALL "Coordinate" NIL
                           (LIST
                            (SPADCALL "point"
                                      (|SCENE;pointString|
                                       (SPADCALL |ifsR| (QREFELT $ 38)) |tran|
                                       |bb| $)
                                      (QREFELT $ 139)))
                           (QREFELT $ 116))
                 . #11#)
           (LETT |ifset|
                 (SPADCALL |nodeName| (LIST |coord|) |nodeAtts|
                           (QREFELT $ 116))
                 . #11#)
           (EXIT
            (PROGN
             (LETT #2# (SPADCALL "Shape" (LIST |ifset|) NIL (QREFELT $ 116))
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
                            (QREFELT $ 139)))
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
                                      (QREFELT $ 139)))
                           (QREFELT $ 116))
                 . #11#)
           (LETT |ifset|
                 (SPADCALL |nodeName| (LIST |coord|) |nodeAtts|
                           (QREFELT $ 116))
                 . #11#)
           (EXIT
            (PROGN
             (LETT #2# (SPADCALL "Shape" (LIST |ifset|) NIL (QREFELT $ 116))
                   . #11#)
             (GO #2#))))))
        (EXIT
         (COND
          ((< (SPADCALL (QVELT |n| 1) (QREFELT $ 126)) 1)
           (SPADCALL |nodeName| NIL |nodeAtts| (QREFELT $ 116)))
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
                                      (QREFELT $ 136))
                            . #11#)
                      (EXIT
                       (COND
                        ((NULL (SPADCALL |xch| (QREFELT $ 124)))
                         (LETT |nodeEles|
                               (SPADCALL |nodeEles| |xch| (QREFELT $ 118))
                               . #11#)))))
                     (LETT #1# (CDR #1#) . #11#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (SPADCALL |nodeName| |nodeEles| |nodeAtts|
                           (QREFELT $ 116)))))))))
      #2# (EXIT #2#))))) 

(DEFUN |SCENE;writeX3d;$SV;63| (|n| |filename| $)
  (PROG (|defaultBounds| |defaultTransform| |defaultMaterial|)
    (RETURN
     (SEQ
      (LETT |defaultMaterial|
            (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "black" "black" 1.0)
            . #1=(|SCENE;writeX3d;$SV;63|))
      (LETT |defaultTransform| (SPADCALL (QREFELT $ 128)) . #1#)
      (LETT |defaultBounds|
            (CONS
             (SPADCALL (|minus_DF| (FLOAT 9000 MOST-POSITIVE-DOUBLE-FLOAT))
                       (|minus_DF| (FLOAT 9000 MOST-POSITIVE-DOUBLE-FLOAT))
                       (QREFELT $ 58))
             (SPADCALL (FLOAT 9000 MOST-POSITIVE-DOUBLE-FLOAT)
                       (FLOAT 9000 MOST-POSITIVE-DOUBLE-FLOAT) (QREFELT $ 58)))
            . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL |n| |defaultMaterial| |defaultTransform| |defaultBounds|
                  (QREFELT $ 136))
        |filename| (QREFELT $ 131))))))) 

(DEFUN |SCENE;toObj;$RRRStRV;64|
       (|n| |ptLst| |indexLst| |indexNxt| |tran| |bb| $)
  (PROG (#1=#:G928 |ch| #2=#:G914 |i2| #3=#:G927 |j| #4=#:G926 #5=#:G925 |k|
         #6=#:G924 |p1| #7=#:G878 |i1| #8=#:G923 #9=#:G922 #10=#:G921
         #11=#:G920 |ifsR| |meshR| #12=#:G873 #13=#:G919 #14=#:G918 #15=#:G917
         #16=#:G916 |bb2| |mx2| #17=#:G876 |mn2| |tran2| #18=#:G877 #19=#:G915
         |mx| |mn| |offsety| |offsetRequired| |offsetx| |miny| |minx|
         |nodeName|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |nodeName| (|SCENE;setX3DNodeName| (QVELT |n| 0) $)
              . #20=(|SCENE;toObj;$RRRStRV;64|))
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
                   (|check_union| (QEQCAR #17# 3)
                                  (|Record| (|:| |mins| (QREFELT $ 6))
                                            (|:| |maxs| (QREFELT $ 6)))
                                  #17#))
                 . #20#)
           (LETT |minx| (SPADCALL (QCAR |bb2|) (QREFELT $ 56)) . #20#)
           (LETT |miny| (SPADCALL (QCAR |bb2|) (QREFELT $ 57)) . #20#)
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
                     (|add_DF| (SPADCALL (QCAR |bb2|) (QREFELT $ 56))
                               |offsetx|)
                     (|add_DF| (SPADCALL (QCAR |bb2|) (QREFELT $ 57))
                               |offsety|)
                     (QREFELT $ 58))
                    . #20#)
              (LETT |mx|
                    (SPADCALL
                     (|add_DF| (SPADCALL (QCDR |bb2|) (QREFELT $ 56))
                               |offsetx|)
                     (|add_DF| (SPADCALL (QCDR |bb2|) (QREFELT $ 57))
                               |offsety|)
                     (QREFELT $ 58))
                    . #20#)
              (LETT |bb2| (CONS |mn| |mx|) . #20#)
              (EXIT
               (LETT |tran2|
                     (SPADCALL |offsetx| |offsety| 0.0 1.0 1.0 1.0
                               (QREFELT $ 119))
                     . #20#)))))
           (SEQ (LETT |ch| NIL . #20#) (LETT #19# (QVELT |n| 1) . #20#) G190
                (COND
                 ((OR (ATOM #19#) (PROGN (LETT |ch| (CAR #19#) . #20#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (SPADCALL |ch| |ptLst| |indexLst| |indexNxt| |tran2| |bb2|
                            (QREFELT $ 144))))
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
                   |tran| (QREFELT $ 125))
                  . #20#)))))
        (COND
         ((EQUAL (QVELT |n| 0) 'CLIP)
          (SEQ
           (COND
            ((NULL (QEQCAR (QVELT |n| 2) 3))
             (|error| "toObj parameter type not valid for clip node")))
           (LETT |mn2|
                 (QCAR
                  (PROG2 (LETT #17# (QVELT |n| 2) . #20#)
                      (QCDR #17#)
                    (|check_union| (QEQCAR #17# 3)
                                   (|Record| (|:| |mins| (QREFELT $ 6))
                                             (|:| |maxs| (QREFELT $ 6)))
                                   #17#)))
                 . #20#)
           (LETT |mx2|
                 (QCDR
                  (PROG2 (LETT #17# (QVELT |n| 2) . #20#)
                      (QCDR #17#)
                    (|check_union| (QEQCAR #17# 3)
                                   (|Record| (|:| |mins| (QREFELT $ 6))
                                             (|:| |maxs| (QREFELT $ 6)))
                                   #17#)))
                 . #20#)
           (LETT |bb2| (CONS |mn2| |mx2|) . #20#)
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
                  (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 63)) (QREFELT $ 64))
                  8 (QREFELT $ 137))
                 . #20#)
           (LETT |ifsR| (SPADCALL |meshR| 'NIL (QREFELT $ 138)) . #20#)
           (LETT |i1| (SPADCALL |ifsR| (QREFELT $ 37)) . #20#)
           (LETT |p1| (SPADCALL |ifsR| (QREFELT $ 38)) . #20#)
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
                                                            (QREFELT $ 145)))
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
                     (SPADCALL (SPADCALL |ptLst| (QREFELT $ 146)) |p1|
                               (QREFELT $ 147))
                     (QREFELT $ 148))
           (SPADCALL |indexLst|
                     (SPADCALL (SPADCALL |indexLst| (QREFELT $ 149)) |i2|
                               (QREFELT $ 150))
                     (QREFELT $ 151))
           (SPADCALL |indexNxt|
                     (+ (SPADCALL |indexNxt| (QREFELT $ 145)) (LENGTH |p1|))
                     (QREFELT $ 152))
           (EXIT (PROGN (LETT #2# (|Void|) . #20#) (GO #2#))))))
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
                  (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 63)) (QREFELT $ 64))
                  8 (QREFELT $ 137))
                 . #20#)
           (LETT |ifsR| (SPADCALL |meshR| 'NIL (QREFELT $ 138)) . #20#)
           (LETT |i1| (SPADCALL |ifsR| (QREFELT $ 37)) . #20#)
           (LETT |p1| (SPADCALL |ifsR| (QREFELT $ 38)) . #20#)
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
                                                            (QREFELT $ 145)))
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
                     (SPADCALL (SPADCALL |ptLst| (QREFELT $ 146)) |p1|
                               (QREFELT $ 147))
                     (QREFELT $ 148))
           (SPADCALL |indexLst|
                     (SPADCALL (SPADCALL |indexLst| (QREFELT $ 149)) |i2|
                               (QREFELT $ 150))
                     (QREFELT $ 151))
           (SPADCALL |indexNxt|
                     (+ (SPADCALL |indexNxt| (QREFELT $ 145)) (LENGTH |p1|))
                     (QREFELT $ 152))
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
                                                            (QREFELT $ 145)))
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
                     (SPADCALL (SPADCALL |ptLst| (QREFELT $ 146)) |p1|
                               (QREFELT $ 147))
                     (QREFELT $ 148))
           (SPADCALL |indexLst|
                     (SPADCALL (SPADCALL |indexLst| (QREFELT $ 149)) |i2|
                               (QREFELT $ 150))
                     (QREFELT $ 151))
           (SPADCALL |indexNxt|
                     (+ (SPADCALL |indexNxt| (QREFELT $ 145)) (LENGTH |p1|))
                     (QREFELT $ 152))
           (EXIT (PROGN (LETT #2# (|Void|) . #20#) (GO #2#))))))
        (EXIT
         (COND ((< (SPADCALL (QVELT |n| 1) (QREFELT $ 126)) 1) (|Void|))
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
                                  |bb2| (QREFELT $ 144))))
                      (LETT #1# (CDR #1#) . #20#) (GO G190) G191 (EXIT NIL))
                 (EXIT (|Void|))))))))
      #2# (EXIT #2#))))) 

(DEFUN |SCENE;writeObj;$SV;65| (|n| |filename| $)
  (PROG (|s| #1=#:G938 |i| #2=#:G937 |row| #3=#:G936 |v| |f1| |defaultBounds|
         |defaultTransform| |indexNxt| |indexLst| |ptLst|)
    (RETURN
     (SEQ
      (LETT |ptLst| (SPADCALL NIL (QREFELT $ 153))
            . #4=(|SCENE;writeObj;$SV;65|))
      (LETT |indexLst| (SPADCALL NIL (QREFELT $ 154)) . #4#)
      (LETT |indexNxt| (SPADCALL 0 (QREFELT $ 155)) . #4#)
      (LETT |defaultTransform| (SPADCALL (QREFELT $ 128)) . #4#)
      (LETT |defaultBounds|
            (CONS
             (SPADCALL (|minus_DF| (FLOAT 9000 MOST-POSITIVE-DOUBLE-FLOAT))
                       (|minus_DF| (FLOAT 9000 MOST-POSITIVE-DOUBLE-FLOAT))
                       (QREFELT $ 58))
             (SPADCALL (FLOAT 9000 MOST-POSITIVE-DOUBLE-FLOAT)
                       (FLOAT 9000 MOST-POSITIVE-DOUBLE-FLOAT) (QREFELT $ 58)))
            . #4#)
      (SPADCALL |n| |ptLst| |indexLst| |indexNxt| |defaultTransform|
                |defaultBounds| (QREFELT $ 144))
      (LETT |f1|
            (SPADCALL (SPADCALL |filename| (QREFELT $ 157)) "output"
                      (QREFELT $ 159))
            . #4#)
      (SPADCALL |f1| "# mesh generated by axiom" (QREFELT $ 160))
      (SEQ (LETT |v| NIL . #4#)
           (LETT #3# (SPADCALL |ptLst| (QREFELT $ 146)) . #4#) G190
           (COND
            ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#) . #4#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |f1|
                       (SPADCALL
                        (LIST "v "
                              (|mathObject2String|
                               (SPADCALL |v| (QREFELT $ 56)))
                              " "
                              (|mathObject2String|
                               (SPADCALL |v| (QREFELT $ 57)))
                              " "
                              (|mathObject2String|
                               (SPADCALL |v| (QREFELT $ 134))))
                        (QREFELT $ 87))
                       (QREFELT $ 160))))
           (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
      (LETT |s| "" . #4#)
      (SEQ (LETT |row| NIL . #4#)
           (LETT #2# (SPADCALL |indexLst| (QREFELT $ 149)) . #4#) G190
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
                                       (QREFELT $ 87))
                             . #4#)))
                     (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL |f1| |s| (QREFELT $ 160))))
           (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
      (SPADCALL |f1| (QREFELT $ 161)) (EXIT (|Void|)))))) 

(DEFUN |SCENE;writeVRML;$SV;66| (|n| |filename| $)
  (PROG (|defaultBounds| |defaultTransform| |defaultMaterial|)
    (RETURN
     (SEQ
      (LETT |defaultMaterial|
            (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "black" "black" 1.0)
            . #1=(|SCENE;writeVRML;$SV;66|))
      (LETT |defaultTransform| (SPADCALL (QREFELT $ 128)) . #1#)
      (LETT |defaultBounds|
            (CONS
             (SPADCALL (|minus_DF| (FLOAT 9000 MOST-POSITIVE-DOUBLE-FLOAT))
                       (|minus_DF| (FLOAT 9000 MOST-POSITIVE-DOUBLE-FLOAT))
                       (QREFELT $ 58))
             (SPADCALL (FLOAT 9000 MOST-POSITIVE-DOUBLE-FLOAT)
                       (FLOAT 9000 MOST-POSITIVE-DOUBLE-FLOAT) (QREFELT $ 58)))
            . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL |n| |defaultMaterial| |defaultTransform| |defaultBounds|
                  (QREFELT $ 136))
        |filename| (QREFELT $ 163))))))) 

(DEFUN |SCENE;Fnan?| (|x| $) (SPADCALL |x| |x| (QREFELT $ 165))) 

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
                     ((SPADCALL |r| MOST-POSITIVE-DOUBLE-FLOAT (QREFELT $ 166))
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
                     ((SPADCALL |r| MOST-POSITIVE-DOUBLE-FLOAT (QREFELT $ 166))
                      MOST-POSITIVE-DOUBLE-FLOAT)
                     ((|less_DF| |r| MOST-NEGATIVE-DOUBLE-FLOAT)
                      MOST-NEGATIVE-DOUBLE-FLOAT)
                     (#2# |r|))))))))))) 

(DEFUN |SCENE;normalize| (|seg| $)
  (PROG (|b| |a|)
    (RETURN
     (SEQ (LETT |a| (SPADCALL |seg| (QREFELT $ 98)) . #1=(|SCENE;normalize|))
          (LETT |b| (SPADCALL |seg| (QREFELT $ 99)) . #1#)
          (EXIT
           (COND
            ((|eql_DF| |a| |b|) (|error| "The range specified is too small"))
            ((|less_DF| |a| |b|) (SPADCALL |a| |b| (QREFELT $ 167)))
            ('T (SPADCALL |b| |a| (QREFELT $ 167))))))))) 

(DEFUN |SCENE;checkRange| (|r| $)
  (COND
   ((SPADCALL (SPADCALL |r| (QREFELT $ 98)) (SPADCALL |r| (QREFELT $ 99))
              (QREFELT $ 166))
    (|error| "ranges cannot be negative"))
   ('T |r|))) 

(DEFUN |SCENE;createPlot1Din2D;MSNni$;72| (|f| |tRange| |numPts| $)
  (PROG (|branches| |newl| #1=#:G971 |p| |p0| |t| |l| #2=#:G970 |i| |s| |h|)
    (RETURN
     (SEQ (|SCENE;checkRange| |tRange| $)
          (LETT |l| (SPADCALL |tRange| (QREFELT $ 98))
                . #3=(|SCENE;createPlot1Din2D;MSNni$;72|))
          (LETT |h| (SPADCALL |tRange| (QREFELT $ 99)) . #3#)
          (LETT |t| (SPADCALL |l| (QREFELT $ 169)) . #3#)
          (LETT |p0| (SPADCALL (SPADCALL |l| |f|) (QREFELT $ 170)) . #3#)
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
                  ((SPADCALL |p| (QREFELT $ 171))
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
          (EXIT (SPADCALL |branches| (QREFELT $ 22))))))) 

(DEFUN |SCENE;addPlot1Din2D;$MSNni$;73| (|n| |f| |tRange| |numPts| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |f| |tRange| |numPts| (QREFELT $ 173))
            |SCENE;addPlot1Din2D;$MSNni$;73|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createPlot1Din2D;MSNni$;74| (|f| |seg| |numPts| $)
  (PROG (|ff|)
    (RETURN
     (SEQ
      (LETT |ff|
            (LIST (CONS #'|SCENE;createPlot1Din2D;MSNni$;74!0| (VECTOR $ |f|)))
            |SCENE;createPlot1Din2D;MSNni$;74|)
      (EXIT
       (SPADCALL (SPADCALL |ff| (QREFELT $ 176)) (|SCENE;normalize| |seg| $)
                 |numPts| (QREFELT $ 173))))))) 

(DEFUN |SCENE;createPlot1Din2D;MSNni$;74!0| (|x| $$)
  (PROG (|f| $)
    (LETT |f| (QREFELT $$ 1) . #1=(|SCENE;createPlot1Din2D;MSNni$;74|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL |x| (|SCENE;applyfxTrap| |f| |x| $) (QREFELT $ 58)))))) 

(DEFUN |SCENE;addPlot1Din2D;$MSNni$;75| (|n| |f| |seg| |numPts| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |f| |seg| |numPts| (QREFELT $ 178))
            |SCENE;addPlot1Din2D;$MSNni$;75|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createPlot1Din2Dparametric;PpcSNni$;76| (|ppc| |seg| |numPts| $)
  (PROG (|fcn| |g| |f|)
    (RETURN
     (SEQ
      (LETT |f| (SPADCALL |ppc| 1 (QREFELT $ 181))
            . #1=(|SCENE;createPlot1Din2Dparametric;PpcSNni$;76|))
      (LETT |g| (SPADCALL |ppc| 2 (QREFELT $ 181)) . #1#)
      (LETT |fcn|
            (LIST
             (CONS #'|SCENE;createPlot1Din2Dparametric;PpcSNni$;76!0|
                   (VECTOR |g| $ |f|)))
            . #1#)
      (EXIT
       (SPADCALL (SPADCALL |fcn| (QREFELT $ 176)) (|SCENE;normalize| |seg| $)
                 |numPts| (QREFELT $ 173))))))) 

(DEFUN |SCENE;createPlot1Din2Dparametric;PpcSNni$;76!0| (|x| $$)
  (PROG (|f| $ |g|)
    (LETT |f| (QREFELT $$ 2)
          . #1=(|SCENE;createPlot1Din2Dparametric;PpcSNni$;76|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |g| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (|SCENE;applyfxTrap| |f| |x| $) (|SCENE;applyfxTrap| |g| |x| $)
                (QREFELT $ 58)))))) 

(DEFUN |SCENE;addPlot1Din2Dparametric;$PpcSNni$;77|
       (|n| |ppc| |seg| |numPts| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |ppc| |seg| |numPts| (QREFELT $ 182))
            |SCENE;addPlot1Din2Dparametric;$PpcSNni$;77|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createPlot1Din3Dparametric;PscSNni$;78| (|psc| |seg| |numPts| $)
  (PROG (|fcn| |h| |g| |f|)
    (RETURN
     (SEQ
      (LETT |f| (SPADCALL |psc| 1 (QREFELT $ 185))
            . #1=(|SCENE;createPlot1Din3Dparametric;PscSNni$;78|))
      (LETT |g| (SPADCALL |psc| 2 (QREFELT $ 185)) . #1#)
      (LETT |h| (SPADCALL |psc| 3 (QREFELT $ 185)) . #1#)
      (LETT |fcn|
            (CONS #'|SCENE;createPlot1Din3Dparametric;PscSNni$;78!0|
                  (VECTOR |h| |g| $ |f|))
            . #1#)
      (EXIT (SPADCALL |fcn| |seg| |numPts| (QREFELT $ 186))))))) 

(DEFUN |SCENE;createPlot1Din3Dparametric;PscSNni$;78!0| (|x| $$)
  (PROG (|f| $ |g| |h|)
    (LETT |f| (QREFELT $$ 3)
          . #1=(|SCENE;createPlot1Din3Dparametric;PscSNni$;78|))
    (LETT $ (QREFELT $$ 2) . #1#)
    (LETT |g| (QREFELT $$ 1) . #1#)
    (LETT |h| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (|SCENE;applyfxTrap| |f| |x| $) (|SCENE;applyfxTrap| |g| |x| $)
                (|SCENE;applyfxTrap| |h| |x| $) (QREFELT $ 42)))))) 

(DEFUN |SCENE;addPlot1Din3Dparametric;$PscSNni$;79|
       (|n| |psc| |seg| |numPts| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |psc| |seg| |numPts| (QREFELT $ 187))
            |SCENE;addPlot1Din3Dparametric;$PscSNni$;79|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createPlot1Din3Dparametric;MSNni$;80| (|psc| |seg| |numPts| $)
  (PROG (|p| |t| |l| #1=#:G1010 |i| |s| |h| |tRange| |f|)
    (RETURN
     (SEQ (LETT |f| |psc| . #2=(|SCENE;createPlot1Din3Dparametric;MSNni$;80|))
          (LETT |tRange| (|SCENE;normalize| |seg| $) . #2#)
          (|SCENE;checkRange| |tRange| $)
          (LETT |l| (SPADCALL |tRange| (QREFELT $ 98)) . #2#)
          (LETT |h| (SPADCALL |tRange| (QREFELT $ 99)) . #2#)
          (LETT |t| (SPADCALL |l| (QREFELT $ 169)) . #2#)
          (LETT |p| (SPADCALL (SPADCALL |l| |f|) (QREFELT $ 170)) . #2#)
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
          (EXIT (SPADCALL |p| (QREFELT $ 19))))))) 

(DEFUN |SCENE;addPlot1Din3Dparametric;$MSNni$;81| (|n| |psc| |seg| |numPts| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |psc| |seg| |numPts| (QREFELT $ 186))
            |SCENE;addPlot1Din3Dparametric;$MSNni$;81|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createPlot2Din3D;M2SNni$;82| (|ptFun| |uSeg| |vSeg| |numPts| $)
  (PROG (|someV| |llp| |someU| |lp| |pt| |iu| |iv| |vstep| |ustep|)
    (RETURN
     (SEQ (LETT |llp| NIL . #1=(|SCENE;createPlot2Din3D;M2SNni$;82|))
          (LETT |ustep|
                (|div_DF_I|
                 (|sub_DF| (SPADCALL |uSeg| (QREFELT $ 98))
                           (SPADCALL |uSeg| (QREFELT $ 99)))
                 |numPts|)
                . #1#)
          (LETT |vstep|
                (|div_DF_I|
                 (|sub_DF| (SPADCALL |vSeg| (QREFELT $ 98))
                           (SPADCALL |vSeg| (QREFELT $ 99)))
                 |numPts|)
                . #1#)
          (LETT |someV| (SPADCALL |vSeg| (QREFELT $ 99)) . #1#)
          (SEQ (LETT |iv| |numPts| . #1#) G190 (COND ((< |iv| 0) (GO G191)))
               (SEQ
                (COND
                 ((ZEROP |iv|)
                  (LETT |someV| (SPADCALL |vSeg| (QREFELT $ 98)) . #1#)))
                (LETT |lp| NIL . #1#)
                (LETT |someU| (SPADCALL |uSeg| (QREFELT $ 99)) . #1#)
                (SEQ (LETT |iu| |numPts| . #1#) G190
                     (COND ((< |iu| 0) (GO G191)))
                     (SEQ
                      (COND
                       ((ZEROP |iu|)
                        (LETT |someU| (SPADCALL |uSeg| (QREFELT $ 98)) . #1#)))
                      (LETT |pt| (SPADCALL |someU| |someV| |ptFun|) . #1#)
                      (LETT |lp| (CONS |pt| |lp|) . #1#)
                      (EXIT (LETT |someU| (|add_DF| |someU| |ustep|) . #1#)))
                     (LETT |iu| (+ |iu| -1) . #1#) (GO G190) G191 (EXIT NIL))
                (LETT |llp| (CONS |lp| |llp|) . #1#)
                (EXIT (LETT |someV| (|add_DF| |someV| |vstep|) . #1#)))
               (LETT |iv| (+ |iv| -1) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (SPADCALL |llp| 'NIL (QREFELT $ 138)) (QREFELT $ 39))))))) 

(DEFUN |SCENE;createPlot2Din3D;M2SNni$;83| (|f| |xSeg| |ySeg| |numPts| $)
  (PROG (|fcn|)
    (RETURN
     (SEQ
      (LETT |fcn|
            (LIST
             (CONS #'|SCENE;createPlot2Din3D;M2SNni$;83!0| (VECTOR $ |f|)))
            |SCENE;createPlot2Din3D;M2SNni$;83|)
      (EXIT
       (SPADCALL (SPADCALL |fcn| (QREFELT $ 193)) (|SCENE;normalize| |xSeg| $)
                 (|SCENE;normalize| |ySeg| $) |numPts| (QREFELT $ 191))))))) 

(DEFUN |SCENE;createPlot2Din3D;M2SNni$;83!0| (|x| |y| $$)
  (PROG (|f| $)
    (LETT |f| (QREFELT $$ 1) . #1=(|SCENE;createPlot2Din3D;M2SNni$;83|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (|SCENE;applyfxyTrap| |f| |x| |y| $) |x| |y| (QREFELT $ 42)))))) 

(DEFUN |SCENE;addPlot2Din3D;$M2SNni$;84| (|n| |f| |xSeg| |ySeg| |numPts| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |f| |xSeg| |ySeg| |numPts| (QREFELT $ 195))
            |SCENE;addPlot2Din3D;$M2SNni$;84|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createPlot2Din3Dparametric;Ps2SNni$;85|
       (|s| |uSeg| |vSeg| |numPts| $)
  (PROG (|fcn| |h| |g| |f|)
    (RETURN
     (SEQ
      (LETT |f| (LIST (SPADCALL |s| (|spadConstant| $ 198) (QREFELT $ 200)))
            . #1=(|SCENE;createPlot2Din3Dparametric;Ps2SNni$;85|))
      (LETT |g| (LIST (SPADCALL |s| 2 (QREFELT $ 200))) . #1#)
      (LETT |h| (LIST (SPADCALL |s| 3 (QREFELT $ 200))) . #1#)
      (LETT |fcn|
            (LIST
             (CONS #'|SCENE;createPlot2Din3Dparametric;Ps2SNni$;85!0|
                   (VECTOR |h| |g| $ |f|)))
            . #1#)
      (EXIT
       (SPADCALL (SPADCALL |fcn| (QREFELT $ 193)) (|SCENE;normalize| |uSeg| $)
                 (|SCENE;normalize| |vSeg| $) |numPts| (QREFELT $ 191))))))) 

(DEFUN |SCENE;createPlot2Din3Dparametric;Ps2SNni$;85!0| (|x| |y| $$)
  (PROG (|f| $ |g| |h|)
    (LETT |f| (QREFELT $$ 3)
          . #1=(|SCENE;createPlot2Din3Dparametric;Ps2SNni$;85|))
    (LETT $ (QREFELT $$ 2) . #1#)
    (LETT |g| (QREFELT $$ 1) . #1#)
    (LETT |h| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (|SCENE;applyfxyTrap| (SPADCALL |f| (QREFELT $ 202)) |x| |y| $)
                (|SCENE;applyfxyTrap| (SPADCALL |g| (QREFELT $ 202)) |x| |y| $)
                (|SCENE;applyfxyTrap| (SPADCALL |h| (QREFELT $ 202)) |x| |y| $)
                (QREFELT $ 42)))))) 

(DEFUN |SCENE;addPlot2Din3Dparametric;$Ps2SNni$;86|
       (|n| |s| |uSeg| |vSeg| |numPts| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |s| |uSeg| |vSeg| |numPts| (QREFELT $ 203))
            |SCENE;addPlot2Din3Dparametric;$Ps2SNni$;86|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createPlot2Din3Dparametric;M2SNni$;87|
       (|s| |uSeg| |vSeg| |numPts| $)
  (PROG (|fcn|)
    (RETURN
     (SEQ (LETT |fcn| (LIST |s|) |SCENE;createPlot2Din3Dparametric;M2SNni$;87|)
          (EXIT
           (SPADCALL (SPADCALL |fcn| (QREFELT $ 193))
                     (|SCENE;normalize| |uSeg| $) (|SCENE;normalize| |vSeg| $)
                     |numPts| (QREFELT $ 191))))))) 

(DEFUN |SCENE;addPlot2Din3Dparametric;$M2SNni$;88|
       (|n| |s| |uSeg| |vSeg| |numPts| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |s| |uSeg| |vSeg| |numPts| (QREFELT $ 205))
            |SCENE;addPlot2Din3Dparametric;$M2SNni$;88|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;coerce;$Of;89| (|n| $)
  (PROG (|s|)
    (RETURN
     (SEQ (LETT |s| "scene " . #1=(|SCENE;coerce;$Of;89|))
          (COND
           ((EQUAL (QVELT |n| 0) 'ROOT) (LETT |s| (STRCONC |s| "root") . #1#)))
          (COND
           ((EQUAL (QVELT |n| 0) 'GROUP)
            (LETT |s| (STRCONC |s| "group") . #1#)))
          (COND
           ((EQUAL (QVELT |n| 0) 'LINE) (LETT |s| (STRCONC |s| "line") . #1#)))
          (COND
           ((EQUAL (QVELT |n| 0) 'MATERIAL)
            (LETT |s| (STRCONC |s| "material") . #1#)))
          (COND
           ((EQUAL (QVELT |n| 0) 'TEXT) (LETT |s| (STRCONC |s| "text") . #1#)))
          (COND
           ((EQUAL (QVELT |n| 0) 'TRANSFORM)
            (LETT |s| (STRCONC |s| "transform") . #1#)))
          (COND
           ((EQUAL (QVELT |n| 0) 'CLIP) (LETT |s| (STRCONC |s| "clip") . #1#)))
          (COND
           ((EQUAL (QVELT |n| 0) 'IFS) (LETT |s| (STRCONC |s| "ifs") . #1#)))
          (COND
           ((EQUAL (QVELT |n| 0) 'ARROWS)
            (LETT |s| (STRCONC |s| "arrow") . #1#)))
          (LETT |s|
                (SPADCALL
                 (LIST |s| " #ch="
                       (STRINGIMAGE (SPADCALL (QVELT |n| 1) (QREFELT $ 126))))
                 (QREFELT $ 87))
                . #1#)
          (EXIT (SPADCALL |s| (QREFELT $ 208))))))) 

(DEFUN |Scene| (#1=#:G1085)
  (PROG ()
    (RETURN
     (PROG (#2=#:G1086)
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
      (LETT $ (GETREFV 210) . #1#)
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
                                        (|:| |boundbox|
                                             (|Record| (|:| |mins| |#1|)
                                                       (|:| |maxs| |#1|)))
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
                                              (|:| |lstart| (|Symbol|))
                                              (|:| |lend| (|Symbol|))))
                                        (|:| |arrw|
                                             (|Record| (|:| |st| (|String|))
                                                       (|:| |en| (|String|))
                                                       (|:| |offset| |#1|)
                                                       (|:| |lstart|
                                                            (|Symbol|))
                                                       (|:| |lend|
                                                            (|Symbol|))))
                                        (|:| |np| (|SceneNamedPoints| |#1|))
                                        (|:| |empty| "empty")))))
      $)))) 

(MAKEPROP '|Scene| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|Record| (|:| |mins| 6) (|:| |maxs| 6))
              |SCENE;createSceneRoot;R$;1| (|Integer|) (0 . |sipnt|)
              |SCENE;createSceneRoot;4I$;2| |SCENE;createSceneRoot;$;3|
              |SCENE;createSceneGroup;$;4| (|Void|) |SCENE;addChild!;2$V;50|
              |SCENE;addSceneGroup;2$;5| (|List| 6)
              |SCENE;createSceneLine;L$;6| |SCENE;addSceneLine;$L$;7|
              (|List| 18) |SCENE;createSceneLines;L$;8|
              |SCENE;addSceneLines;$L$;9| (|Symbol|)
              |SCENE;createSceneArrows;L2S$;10| |SCENE;addSceneArrows;$L2S$;11|
              (|String|) |SCENE;createSceneArrow;2SPT2S$;12|
              |SCENE;addSceneArrow;$2SPT2S$;13| (|SceneNamedPoints| 6)
              |SCENE;createSceneNamedPoints;Snp$;14|
              |SCENE;addSceneNamedPoints;$Snp$;15| (|List| 77)
              |SCENE;createSceneIFS;LL$;16| |SCENE;addSceneIFS;$LL$;17|
              (|SceneIFS| 6) (6 . |indexes|) (11 . |pointList|)
              |SCENE;createSceneIFS;Sifs$;18| |SCENE;addSceneIFS;$Sifs$;19|
              (|DoubleFloat|) (16 . |spnt|) |SCENE;createSceneBox;Df$;20|
              |SCENE;addSceneBox;$Df$;21|
              (|Record| (|:| |txt| 27) (|:| |siz| 48) (|:| |pos| 6)
                        (|:| |np| 51))
              |SCENE;createSceneText;R$;22| |SCENE;addSceneText;$R$;23|
              (|NonNegativeInteger|) |SCENE;createSceneText;SNniPT$;24|
              |SCENE;addSceneText;$SNniPT$;25| (|List| 27)
              |SCENE;createSceneText;LNniPT$;26|
              |SCENE;addSceneText;$LNniPT$;27| |SCENE;createSceneClip;R$;28|
              |SCENE;addSceneClip;$R$;29| (23 . |screenCoordX|)
              (28 . |screenCoordY|) (33 . |spnt|)
              |SCENE;createSceneGrid;DfR$;30| |SCENE;addSceneGrid;$DfR$;31|
              (|PositiveInteger|) (|Float|) (39 . |float|) (46 . |coerce|)
              (|Record| (|:| |lineWidth| 41) (|:| |lineCol| 27)
                        (|:| |fillCol| 27) (|:| |matOpacity| 41))
              |SCENE;addSceneMaterial;$R$;43| |SCENE;createSceneGrid;R$;32|
              |SCENE;addSceneGrid;$R$;33| (51 . |singleFace|)
              (56 . |sierpinskiDivide|) (|Boolean|) (62 . ~=) (68 . |elt|)
              (74 . +) (80 . *) (86 . |concat|) (|List| 48) (92 . |elt|)
              (98 . |#|) (103 . |elt|) (109 . |concat|)
              |SCENE;createScenePattern;SNniR$;38|
              |SCENE;addScenePattern;$SNniR$;39| (115 . |log10|) (120 . >)
              (|List| $) (126 . |concat|) (131 . ~=)
              |SCENE;createSceneRuler;SPTR$;40| |SCENE;addSceneRuler;$SPTR$;41|
              |SCENE;createSceneMaterial;R$;42|
              |SCENE;createSceneMaterial;Df2S$;44|
              |SCENE;addSceneMaterial;$Df2S$;45| (|STransform| 6)
              |SCENE;createSceneTransform;St$;46|
              |SCENE;addSceneTransform;$St$;47| (|Segment| 41) (137 . |lo|)
              (142 . |hi|) (|Mapping| 6 6)
              |SCENE;createArrows2Din2D;M2SNni$;48|
              |SCENE;addArrows2Din2D;$M2SNni$;49| (|List| $$) (147 . |concat|)
              |SCENE;removeChild!;2$V;51| (153 . ~=)
              |SCENE;setTransform!;$StV;52| (159 . |xform|) (165 . |inBounds?|)
              (172 . ~=) (178 . |distance|) (|XmlAttribute|)
              (184 . |xmlAttribute|) (|List| 112) (|XmlElement|)
              (190 . |xmlElement|) (|List| 115) (197 . |concat|)
              (203 . |stranslate|) (213 . |concat|) (219 . ~=)
              (225 . |findPoint|) (231 . |xmlElement|) (238 . |empty?|)
              (243 . |compound|) (249 . |#|) |SCENE;toSVG;$RStRDf2BSnpXe;56|
              (254 . |identity|) (258 . |namedPoints|) (|ExportXml|)
              (264 . |writeXml|) |SCENE;writeSvg;$SV;57|
              |SCENE;writeSvgQuantised;$SV;58| (270 . |screenCoordZ|)
              (275 . |concat|) |SCENE;toX3D;$RStRXe;62| (281 . |curveLoops|)
              (288 . |smesh|) (294 . |xmlAttribute|) |SCENE;writeX3d;$SV;63|
              (|Reference| 18) (|Reference| 33) (|Reference| 48)
              |SCENE;toObj;$RRRStRV;64| (300 . |elt|) (305 . |elt|)
              (310 . |concat|) (316 . |setelt|) (322 . |elt|) (327 . |concat|)
              (333 . |setelt|) (339 . |setelt|) (345 . |ref|) (350 . |ref|)
              (355 . |ref|) (|FileName|) (360 . |coerce|) (|TextFile|)
              (365 . |open|) (371 . |writeLine!|) (377 . |close!|)
              |SCENE;writeObj;$SV;65| (382 . |writeVRML|)
              |SCENE;writeVRML;$SV;66| (388 . ~=) (394 . >) (400 . |segment|)
              (|List| 41) (406 . |list|) (411 . |list|) (416 . |Pnan?|)
              (|Mapping| 6 41) |SCENE;createPlot1Din2D;MSNni$;72|
              |SCENE;addPlot1Din2D;$MSNni$;73| (|List| 172) (421 . |first|)
              (|Mapping| 41 41) |SCENE;createPlot1Din2D;MSNni$;74|
              |SCENE;addPlot1Din2D;$MSNni$;75| (|ParametricPlaneCurve| 177)
              (426 . |coordinate|)
              |SCENE;createPlot1Din2Dparametric;PpcSNni$;76|
              |SCENE;addPlot1Din2Dparametric;$PpcSNni$;77|
              (|ParametricSpaceCurve| 177) (432 . |coordinate|)
              |SCENE;createPlot1Din3Dparametric;MSNni$;80|
              |SCENE;createPlot1Din3Dparametric;PscSNni$;78|
              |SCENE;addPlot1Din3Dparametric;$PscSNni$;79|
              |SCENE;addPlot1Din3Dparametric;$MSNni$;81| (|Mapping| 6 41 41)
              |SCENE;createPlot2Din3D;M2SNni$;82| (|List| 190) (438 . |first|)
              (|Mapping| 41 41 41) |SCENE;createPlot2Din3D;M2SNni$;83|
              |SCENE;addPlot2Din3D;$M2SNni$;84| (443 . |One|) (447 . |One|)
              (|ParametricSurface| 194) (451 . |coordinate|) (|List| 194)
              (457 . |first|) |SCENE;createPlot2Din3Dparametric;Ps2SNni$;85|
              |SCENE;addPlot2Din3Dparametric;$Ps2SNni$;86|
              |SCENE;createPlot2Din3Dparametric;M2SNni$;87|
              |SCENE;addPlot2Din3Dparametric;$M2SNni$;88| (|OutputForm|)
              (462 . |coerce|) |SCENE;coerce;$Of;89|)
           '#(|writeX3d| 467 |writeVRML| 473 |writeSvgQuantised| 479 |writeSvg|
              485 |writeObj| 491 |toX3D| 497 |toSVG| 505 |toObj| 517
              |setTransform!| 527 |removeChild!| 533 |createSceneTransform| 539
              |createSceneText| 544 |createSceneRuler| 563 |createSceneRoot|
              570 |createScenePattern| 587 |createSceneNamedPoints| 594
              |createSceneMaterial| 599 |createSceneLines| 611
              |createSceneLine| 616 |createSceneIFS| 621 |createSceneGroup| 632
              |createSceneGrid| 636 |createSceneClip| 647 |createSceneBox| 652
              |createSceneArrows| 657 |createSceneArrow| 664
              |createPlot2Din3Dparametric| 673 |createPlot2Din3D| 689
              |createPlot1Din3Dparametric| 705 |createPlot1Din2Dparametric| 719
              |createPlot1Din2D| 726 |createArrows2Din2D| 740 |coerce| 748
              |addSceneTransform| 753 |addSceneText| 759 |addSceneRuler| 781
              |addScenePattern| 789 |addSceneNamedPoints| 797
              |addSceneMaterial| 803 |addSceneLines| 817 |addSceneLine| 823
              |addSceneIFS| 829 |addSceneGroup| 842 |addSceneGrid| 847
              |addSceneClip| 860 |addSceneBox| 866 |addSceneArrows| 872
              |addSceneArrow| 880 |addPlot2Din3Dparametric| 890 |addPlot2Din3D|
              908 |addPlot1Din3Dparametric| 917 |addPlot1Din2Dparametric| 933
              |addPlot1Din2D| 941 |addChild!| 957 |addArrows2Din2D| 963)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 209
                                                 '(2 6 0 10 10 11 1 36 33 0 37
                                                   1 36 18 0 38 3 6 0 41 41 41
                                                   42 1 6 41 0 56 1 6 41 0 57 2
                                                   6 0 41 41 58 3 62 0 10 10 61
                                                   63 1 62 41 0 64 1 36 0 18 69
                                                   2 36 0 0 48 70 2 48 71 0 0
                                                   72 2 18 6 0 10 73 2 6 0 0 0
                                                   74 2 6 0 41 0 75 2 18 0 0 6
                                                   76 2 33 77 0 10 78 1 77 48 0
                                                   79 2 77 48 0 10 80 2 21 0 0
                                                   18 81 1 41 0 0 84 2 10 71 0
                                                   0 85 1 27 0 86 87 2 10 71 0
                                                   0 88 1 97 41 0 98 1 97 41 0
                                                   99 2 103 0 0 2 104 2 24 71 0
                                                   0 106 2 94 6 0 6 108 3 6 71
                                                   0 0 0 109 2 27 71 0 0 110 2
                                                   6 41 0 0 111 2 112 0 27 27
                                                   113 3 115 0 27 86 114 116 2
                                                   117 0 0 115 118 6 94 0 41 41
                                                   41 41 41 41 119 2 114 0 0
                                                   112 120 2 51 71 0 0 121 2 30
                                                   6 0 27 122 3 115 0 27 27 114
                                                   123 1 115 71 0 124 2 94 0 0
                                                   0 125 1 103 48 0 126 0 94 0
                                                   128 2 30 0 18 51 129 2 130
                                                   15 115 27 131 1 6 41 0 134 2
                                                   51 0 0 27 135 3 36 21 18 41
                                                   10 137 2 36 0 21 71 138 2
                                                   112 0 27 51 139 1 143 48 0
                                                   145 1 141 18 0 146 2 18 0 0
                                                   0 147 2 141 18 0 18 148 1
                                                   142 33 0 149 2 33 0 0 0 150
                                                   2 142 33 0 33 151 2 143 48 0
                                                   48 152 1 141 0 18 153 1 142
                                                   0 33 154 1 143 0 48 155 1
                                                   156 0 27 157 2 158 0 156 27
                                                   159 2 158 27 0 27 160 1 158
                                                   0 0 161 2 130 15 115 27 163
                                                   2 41 71 0 0 165 2 41 71 0 0
                                                   166 2 97 0 41 41 167 1 168 0
                                                   41 169 1 18 0 6 170 1 6 71 0
                                                   171 1 175 172 0 176 2 180
                                                   177 0 48 181 2 184 177 0 48
                                                   185 1 192 190 0 193 0 41 0
                                                   197 0 48 0 198 2 199 194 0
                                                   48 200 1 201 194 0 202 1 27
                                                   207 0 208 2 0 15 0 27 140 2
                                                   0 15 0 27 164 2 0 15 0 27
                                                   133 2 0 15 0 27 132 2 0 15 0
                                                   27 162 4 0 115 0 65 94 8 136
                                                   8 0 115 0 65 94 8 41 71 71
                                                   30 127 6 0 15 0 141 142 143
                                                   94 8 144 2 0 15 0 94 107 2 0
                                                   15 0 0 105 1 0 0 94 95 1 0 0
                                                   45 46 3 0 0 27 48 6 49 3 0 0
                                                   51 48 6 52 3 0 0 24 6 8 89 1
                                                   0 0 8 9 0 0 0 13 4 0 0 10 10
                                                   10 10 12 3 0 0 24 48 8 82 1
                                                   0 0 30 31 1 0 0 65 91 3 0 0
                                                   41 27 27 92 1 0 0 21 22 1 0
                                                   0 18 19 2 0 0 33 18 34 1 0 0
                                                   36 39 0 0 0 14 2 0 0 41 8 59
                                                   1 0 0 8 67 1 0 0 8 54 1 0 0
                                                   41 43 3 0 0 21 24 24 25 5 0
                                                   0 27 27 6 24 24 28 4 0 0 190
                                                   97 97 48 205 4 0 0 199 97 97
                                                   48 203 4 0 0 194 97 97 48
                                                   195 4 0 0 190 97 97 48 191 3
                                                   0 0 184 97 48 187 3 0 0 172
                                                   97 48 186 3 0 0 180 97 48
                                                   182 3 0 0 172 97 48 173 3 0
                                                   0 177 97 48 178 4 0 0 100 97
                                                   97 48 101 1 0 207 0 209 2 0
                                                   0 0 94 96 2 0 0 0 45 47 4 0
                                                   0 0 27 48 6 50 4 0 0 0 51 48
                                                   6 53 4 0 0 0 24 6 8 90 4 0 0
                                                   0 24 48 8 83 2 0 0 0 30 32 2
                                                   0 0 0 65 66 4 0 0 0 41 27 27
                                                   93 2 0 0 0 21 23 2 0 0 0 18
                                                   20 3 0 0 0 33 18 35 2 0 0 0
                                                   36 40 1 0 0 0 17 3 0 0 0 41
                                                   8 60 2 0 0 0 8 68 2 0 0 0 8
                                                   55 2 0 0 0 41 44 4 0 0 0 21
                                                   24 24 26 6 0 0 0 27 27 6 24
                                                   24 29 5 0 0 0 190 97 97 48
                                                   206 5 0 0 0 199 97 97 48 204
                                                   5 0 0 0 194 97 97 48 196 4 0
                                                   0 0 184 97 48 188 4 0 0 0
                                                   172 97 48 189 4 0 0 0 180 97
                                                   48 183 4 0 0 0 172 97 48 174
                                                   4 0 0 0 177 97 48 179 2 0 15
                                                   0 0 16 5 0 0 0 100 97 97 48
                                                   102)))))
           '|lookupComplete|)) 
