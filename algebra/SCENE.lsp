
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

(DEFUN |SCENE;createSceneArrows;LSDf$;10| (|lines| |mode| |size| $)
  (PROG (|ar|)
    (RETURN
     (SEQ
      (LETT |ar| (VECTOR |lines| |mode| |size|)
            |SCENE;createSceneArrows;LSDf$;10|)
      (EXIT (VECTOR 'ARROWS NIL (CONS 6 |ar|))))))) 

(DEFUN |SCENE;addSceneArrows;$LSDf$;11| (|n| |lines| |mode| |size| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |lines| |mode| |size| (QREFELT $ 26))
            |SCENE;addSceneArrows;$LSDf$;11|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneArrow;2SPTSDf$;12|
       (|st| |en| |offset| |mode| |size| $)
  (PROG (|ar|)
    (RETURN
     (SEQ
      (LETT |ar| (VECTOR |st| |en| |offset| |mode| |size|)
            |SCENE;createSceneArrow;2SPTSDf$;12|)
      (EXIT (VECTOR 'ARROW NIL (CONS 7 |ar|))))))) 

(DEFUN |SCENE;addSceneArrow;$2SPTSDf$;13|
       (|n| |st| |en| |offset| |mode| |size| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |st| |en| |offset| |mode| |size| (QREFELT $ 29))
            |SCENE;addSceneArrow;$2SPTSDf$;13|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneNamedPoints;Snp$;14| (|np| $)
  (VECTOR 'NAMEDPOINTS NIL (CONS 8 |np|))) 

(DEFUN |SCENE;addSceneNamedPoints;$Snp$;15| (|n| |np| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |np| (QREFELT $ 32))
            |SCENE;addSceneNamedPoints;$Snp$;15|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneIFS;LL$;16| (|inx1| |pts1| $)
  (VECTOR 'IFS NIL (CONS 5 (CONS |inx1| |pts1|)))) 

(DEFUN |SCENE;addSceneIFS;$LL$;17| (|n| |inx1| |pts1| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |inx1| |pts1| (QREFELT $ 35))
            |SCENE;addSceneIFS;$LL$;17|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createSceneIFS;Sifs$;18| (|in1| $)
  (PROG (|pts1| |inx1|)
    (RETURN
     (SEQ
      (LETT |inx1| (SPADCALL |in1| (QREFELT $ 38))
            . #1=(|SCENE;createSceneIFS;Sifs$;18|))
      (LETT |pts1| (SPADCALL |in1| (QREFELT $ 39)) . #1#)
      (EXIT (VECTOR 'IFS NIL (CONS 5 (CONS |inx1| |pts1|)))))))) 

(DEFUN |SCENE;addSceneIFS;$Sifs$;19| (|n| |in1| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |in1| (QREFELT $ 40)) |SCENE;addSceneIFS;$Sifs$;19|)
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
      (EXIT (SPADCALL |inx| |pts| (QREFELT $ 35))))))) 

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
  (PROG (|ln| |i| |gp| |stepsy| #1=#:G520 |stepsx| #2=#:G519 |maxy| |maxx|
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
  (PROG (|ln| |pts| |j| #1=#:G546 |i| |mt2| #2=#:G545 |mt1| |gp| |stepSize|
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
       (SPADCALL (SPADCALL |ifs2| (QREFELT $ 38))
                 (SPADCALL |ifs2| (QREFELT $ 39)) (QREFELT $ 35))))))) 

(DEFUN |SCENE;subdivideLine| (|level| |inLine| $)
  (PROG (#1=#:G554 |res| |lastPt| |midpt| #2=#:G557 |x|)
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
  (PROG (|ln| |lev2| |pts2| #1=#:G570 |l2| |pts| #2=#:G569 |j| #3=#:G568
         #4=#:G567 |i| #5=#:G566 |ycoords| |xcoords| |scale| |maxy| |maxx|
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
  (PROG (#1=#:G573)
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
  (PROG (|str| |d| |pz| #1=#:G600 |x| |stepI| |gp| |suffix| |zeroes|
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
          (EXIT
           (SPADCALL |arrows| '|variable|
                     (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 63))
                               (QREFELT $ 64))
                     (QREFELT $ 26))))))) 

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
         #1=#:G708 |param| #2=#:G707 |line|)
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

(DEFUN |SCENE;shorternArrow| (|pts| |bb| $)
  (PROG (|newend| |newstart| |relpt| #1=#:G714 |reductionFactor| |arrLength|
         |endpt| |startpt| |totalwidth|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |totalwidth|
              (SPADCALL (SPADCALL (QCDR |bb|) (QCAR |bb|) (QREFELT $ 111))
                        (QREFELT $ 56))
              . #2=(|SCENE;shorternArrow|))
        (LETT |startpt| (QCAR |pts|) . #2#) (LETT |endpt| (QCDR |pts|) . #2#)
        (LETT |arrLength| (SPADCALL |startpt| |endpt| (QREFELT $ 112)) . #2#)
        (COND
         ((|less_DF| |arrLength|
                     (SPADCALL (SPADCALL 1 -1 10 (QREFELT $ 63))
                               (QREFELT $ 64)))
          (PROGN (LETT #1# |pts| . #2#) (GO #1#))))
        (LETT |reductionFactor|
              (|div_DF| |totalwidth|
                        (|mul_DF|
                         (SPADCALL (SPADCALL 40 0 10 (QREFELT $ 63))
                                   (QREFELT $ 64))
                         |arrLength|))
              . #2#)
        (COND
         ((SPADCALL |reductionFactor|
                    (SPADCALL (SPADCALL 4 -1 10 (QREFELT $ 63)) (QREFELT $ 64))
                    (QREFELT $ 115))
          (PROGN (LETT #1# |pts| . #2#) (GO #1#))))
        (LETT |relpt| (SPADCALL |endpt| |startpt| (QREFELT $ 111)) . #2#)
        (LETT |newstart|
              (SPADCALL |startpt|
                        (SPADCALL |reductionFactor| |relpt| (QREFELT $ 75))
                        (QREFELT $ 74))
              . #2#)
        (LETT |newend|
              (SPADCALL |startpt|
                        (SPADCALL
                         (|sub_DF|
                          (SPADCALL (SPADCALL 1 0 10 (QREFELT $ 63))
                                    (QREFELT $ 64))
                          |reductionFactor|)
                         |relpt| (QREFELT $ 75))
                        (QREFELT $ 74))
              . #2#)
        (EXIT (CONS |newstart| |newend|))))
      #1# (EXIT #1#))))) 

(DEFUN |SCENE;lineArrow|
       (|pts| |tran| |bb| |mat| |sc| |clipEn| |mode| |size| $)
  (PROG (|nodeEles| |x| |nodeAtts| |linWidth| |ptStr| |thisStr| |minusEndy|
         |endPoint| |minusStarty| |aline| |startPoint| |pntNum| |valid|
         |param2| #1=#:G732 |param| #2=#:G731 |line|)
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
                                                           (QREFELT $ 57))
                                                 |sc|))
                                               . #3#)
                                         (LETT |minusEndy|
                                               (|minus_DF|
                                                (|mul_DF|
                                                 (SPADCALL (QCDR |aline|)
                                                           (QREFELT $ 57))
                                                 |sc|))
                                               . #3#)
                                         (LETT |thisStr|
                                               (SPADCALL
                                                (LIST
                                                 (|mathObject2String|
                                                  (|mul_DF|
                                                   (SPADCALL (QCAR |aline|)
                                                             (QREFELT $ 56))
                                                   |sc|))
                                                 ","
                                                 (|mathObject2String|
                                                  |minusStarty|)
                                                 "L"
                                                 (|mathObject2String|
                                                  (|mul_DF|
                                                   (SPADCALL (QCDR |aline|)
                                                             (QREFELT $ 56))
                                                   |sc|))
                                                 ","
                                                 (|mathObject2String|
                                                  |minusEndy|))
                                                (QREFELT $ 87))
                                               . #3#)
                                         (EXIT
                                          (LETT |ptStr|
                                                (STRCONC |ptStr| |thisStr|)
                                                . #3#)))))
                                  (EXIT
                                   (COND
                                    ((SPADCALL |pntNum| 2 (QREFELT $ 116))
                                     (SEQ (LETT |endPoint| |param2| . #3#)
                                          (LETT |minusEndy|
                                                (|minus_DF|
                                                 (|mul_DF|
                                                  (SPADCALL |endPoint|
                                                            (QREFELT $ 57))
                                                  |sc|))
                                                . #3#)
                                          (LETT |thisStr|
                                                (SPADCALL
                                                 (LIST "L"
                                                       (|mathObject2String|
                                                        (|mul_DF|
                                                         (SPADCALL |endPoint|
                                                                   (QREFELT $
                                                                            56))
                                                         |sc|))
                                                       ","
                                                       (|mathObject2String|
                                                        |minusEndy|))
                                                 (QREFELT $ 87))
                                                . #3#)
                                          (EXIT
                                           (LETT |ptStr|
                                                 (STRCONC |ptStr| |thisStr|)
                                                 . #3#)))))))))))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND
                      ((SPADCALL |ptStr| "" (QREFELT $ 110))
                       (SEQ
                        (COND
                         ((|less_DF|
                           (SPADCALL |startPoint| |endPoint| (QREFELT $ 112))
                           (SPADCALL (SPADCALL 1 -2 10 (QREFELT $ 63))
                                     (QREFELT $ 64)))
                          (LETT |ptStr|
                                (SPADCALL
                                 (LIST "M "
                                       (|mathObject2String|
                                        (|mul_DF|
                                         (SPADCALL |startPoint| (QREFELT $ 56))
                                         |sc|))
                                       ","
                                       (|mathObject2String|
                                        (|minus_DF|
                                         (|mul_DF|
                                          (SPADCALL |startPoint|
                                                    (QREFELT $ 57))
                                          |sc|)))
                                       "c -50,25 -50,-50 0,-25")
                                 (QREFELT $ 87))
                                . #3#)))
                        (LETT |linWidth| (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)
                              . #3#)
                        (COND
                         ((EQUAL |mode| '|proportional|)
                          (LETT |linWidth|
                                (|mul_DF|
                                 (SPADCALL
                                  (SPADCALL (QCDR |bb|) (QCAR |bb|)
                                            (QREFELT $ 111))
                                  (QREFELT $ 56))
                                 |size|)
                                . #3#)))
                        (COND
                         ((EQUAL |mode| '|variable|)
                          (LETT |linWidth|
                                (|mul_DF|
                                 (SPADCALL |startPoint| |endPoint|
                                           (QREFELT $ 112))
                                 |size|)
                                . #3#)))
                        (LETT |nodeAtts|
                              (LIST (SPADCALL "d" |ptStr| (QREFELT $ 118))
                                    (SPADCALL "fill" "none" (QREFELT $ 118))
                                    (SPADCALL "stroke" (QVELT |mat| 1)
                                              (QREFELT $ 118))
                                    (SPADCALL "stroke-width"
                                              (|mathObject2String| |linWidth|)
                                              (QREFELT $ 118))
                                    (SPADCALL "style" "marker-end:url(#Arrow)"
                                              (QREFELT $ 118)))
                              . #3#)
                        (LETT |x|
                              (SPADCALL "path" NIL |nodeAtts| (QREFELT $ 121))
                              . #3#)
                        (EXIT
                         (LETT |nodeEles|
                               (SPADCALL |nodeEles| |x| (QREFELT $ 123))
                               . #3#)))))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |nodeEles|))))) 

(DEFUN |SCENE;faceString| (|faces| |tran| |bb| |sc| |clipEn| $)
  (PROG (|ptStr| |lastValid| |thisStr| |minusy| |pntNum| |valid| |param2|
         |param| #1=#:G746 |i| #2=#:G745 |ln|)
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

(DEFUN |SCENE;toSVG;$RStRDf2BSnpXe;57|
       (|n| |mat| |tran| |bb| |scale| |clipEn| |useInteger| |npt| $)
  (PROG (|nodeEles| |xch| #1=#:G808 |ch| |nodeName| |np2| #2=#:G762 |nodeAtts|
         |linWidth| #3=#:G761 |ptStr| |endPointM| |startPointM| |endPoint|
         |startPoint| #4=#:G760 #5=#:G806 #6=#:G759 |bb2| |mx2| #7=#:G757 |mn2|
         |clipEn2| |tran2| #8=#:G758 #9=#:G756 |param2| |nodeAttsTxt|
         #10=#:G807 |nam| |mat2| #11=#:G755 #12=#:G754 |viewBoxStr| |offsety|
         |offsetx| |scale2| |maxy| |maxx| |miny| |minx| |mkr| |mkrAtts| |pth|
         |pthAtts|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |nodeName| "" . #13=(|SCENE;toSVG;$RStRDf2BSnpXe;57|))
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
                                    (QREFELT $ 118))
                          (SPADCALL "style"
                                    "fill-rule:evenodd;stroke:#000000;stroke-width:1.0pt;marker-start:none;"
                                    (QREFELT $ 118))
                          (SPADCALL "transform"
                                    "scale(0.4) rotate(180) translate(10,0)"
                                    (QREFELT $ 118)))
                         . #13#)
                   (LETT |pth| (SPADCALL "path" NIL |pthAtts| (QREFELT $ 121))
                         . #13#)
                   (LETT |mkrAtts|
                         (LIST (SPADCALL "orient" "auto" (QREFELT $ 118))
                               (SPADCALL "refY" "0.0" (QREFELT $ 118))
                               (SPADCALL "refX" "0.0" (QREFELT $ 118))
                               (SPADCALL "id" "Arrow" (QREFELT $ 118))
                               (SPADCALL "style" "overflow:visible"
                                         (QREFELT $ 118)))
                         . #13#)
                   (LETT |mkr|
                         (SPADCALL "marker" (LIST |pth|) |mkrAtts|
                                   (QREFELT $ 121))
                         . #13#)
                   (LETT |nodeEles|
                         (LIST
                          (SPADCALL "defs" (LIST |mkr|) NIL (QREFELT $ 121)))
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
                                   (QREFELT $ 124))
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
                                     (QREFELT $ 118))
                           (SPADCALL "width" "12cm" (QREFELT $ 118))
                           (SPADCALL "height" "8cm" (QREFELT $ 118))
                           (SPADCALL "viewBox" |viewBoxStr| (QREFELT $ 118)))
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
                                (QREFELT $ 118))
                      (SPADCALL "fill" "none" (QREFELT $ 118))
                      (SPADCALL "stroke" (QVELT |mat2| 1) (QREFELT $ 118))
                      (SPADCALL "stroke-width"
                                (|mathObject2String| (QVELT |mat2| 0))
                                (QREFELT $ 118))
                      (SPADCALL "stroke-linecap" "butt" (QREFELT $ 118))
                      (SPADCALL "stroke-linejoin" "miter" (QREFELT $ 118)))
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
                                            (QREFELT $ 118))
                                  (QREFELT $ 125))
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
                      NIL (QREFELT $ 126))
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
                                                       (QREFELT $ 127))
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
                                             (QREFELT $ 118))
                                   (SPADCALL "x"
                                             (|mathObject2String|
                                              (|mul_DF|
                                               (SPADCALL |param2|
                                                         (QREFELT $ 56))
                                               |scale2|))
                                             (QREFELT $ 118))
                                   (SPADCALL "y"
                                             (|mathObject2String|
                                              (|minus_DF|
                                               (|mul_DF|
                                                (SPADCALL |param2|
                                                          (QREFELT $ 57))
                                                |scale2|)))
                                             (QREFELT $ 118))
                                   (SPADCALL "style"
                                             (STRCONC "fill:" (QVELT |mat2| 2))
                                             (QREFELT $ 118)))
                                  . #13#)
                            (LETT |xch|
                                  (SPADCALL |nodeName| |nam| |nodeAttsTxt|
                                            (QREFELT $ 128))
                                  . #13#)
                            (EXIT
                             (COND
                              ((NULL (SPADCALL |xch| (QREFELT $ 129)))
                               (LETT |nodeEles|
                                     (SPADCALL |nodeEles| |xch|
                                               (QREFELT $ 123))
                                     . #13#)))))
                           (LETT #10# (CDR #10#) . #13#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (PROGN
                        (LETT #5#
                              (SPADCALL "g" |nodeEles| |nodeAtts|
                                        (QREFELT $ 121))
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
                                    (QREFELT $ 118))
                          (SPADCALL "x"
                                    (|mathObject2String|
                                     (|mul_DF|
                                      (SPADCALL |param2| (QREFELT $ 56))
                                      |scale2|))
                                    (QREFELT $ 118))
                          (SPADCALL "y"
                                    (|mathObject2String|
                                     (|minus_DF|
                                      (|mul_DF|
                                       (SPADCALL |param2| (QREFELT $ 57))
                                       |scale2|)))
                                    (QREFELT $ 118))
                          (SPADCALL "style" (STRCONC "fill:" (QVELT |mat2| 2))
                                    (QREFELT $ 118)))
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
                                     |nodeAtts| (QREFELT $ 128))
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
                           |tran| (QREFELT $ 130))
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
                                    (QREFELT $ 118))
                          (SPADCALL "fill" (QVELT |mat2| 2) (QREFELT $ 118))
                          (SPADCALL "stroke" (QVELT |mat2| 1) (QREFELT $ 118))
                          (SPADCALL "stroke-width"
                                    (|mathObject2String| (QVELT |mat2| 0))
                                    (QREFELT $ 118)))
                         . #13#)
                   (EXIT
                    (PROGN
                     (LETT #5#
                           (SPADCALL |nodeName| NIL |nodeAtts| (QREFELT $ 121))
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
                                              (|:| |mode| (|Symbol|))
                                              (|:| |size| (|DoubleFloat|)))
                                             #4#))
                            0)
                           |tran2| |bb2| |mat2| |scale2| |clipEn2|
                           (QVELT
                            (PROG2 (LETT #4# (QVELT |n| 2) . #13#)
                                (QCDR #4#)
                              (|check_union| (QEQCAR #4# 6)
                                             (|Record|
                                              (|:| |ln|
                                                   (|List|
                                                    (|List| (QREFELT $ 6))))
                                              (|:| |mode| (|Symbol|))
                                              (|:| |size| (|DoubleFloat|)))
                                             #4#))
                            1)
                           (QVELT
                            (PROG2 (LETT #4# (QVELT |n| 2) . #13#)
                                (QCDR #4#)
                              (|check_union| (QEQCAR #4# 6)
                                             (|Record|
                                              (|:| |ln|
                                                   (|List|
                                                    (|List| (QREFELT $ 6))))
                                              (|:| |mode| (|Symbol|))
                                              (|:| |size| (|DoubleFloat|)))
                                             #4#))
                            2)
                           $)
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
                                                             (|:| |mode|
                                                                  (|Symbol|))
                                                             (|:| |size|
                                                                  (|DoubleFloat|)))
                                                            #3#))
                                           0)
                                          (QREFELT $ 127))
                                (QVELT
                                 (PROG2 (LETT #3# (QVELT |n| 2) . #13#)
                                     (QCDR #3#)
                                   (|check_union| (QEQCAR #3# 7)
                                                  (|Record|
                                                   (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT $ 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|)))
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
                                                             (|:| |mode|
                                                                  (|Symbol|))
                                                             (|:| |size|
                                                                  (|DoubleFloat|)))
                                                            #3#))
                                           1)
                                          (QREFELT $ 127))
                                (QVELT
                                 (PROG2 (LETT #3# (QVELT |n| 2) . #13#)
                                     (QCDR #3#)
                                   (|check_union| (QEQCAR #3# 7)
                                                  (|Record|
                                                   (|:| |st| (|String|))
                                                   (|:| |en| (|String|))
                                                   (|:| |offset| (QREFELT $ 6))
                                                   (|:| |mode| (|Symbol|))
                                                   (|:| |size|
                                                        (|DoubleFloat|)))
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
               (COND
                ((EQUAL
                  (QVELT
                   (PROG2 (LETT #3# (QVELT |n| 2) . #13#)
                       (QCDR #3#)
                     (|check_union| (QEQCAR #3# 7)
                                    (|Record| (|:| |st| (|String|))
                                              (|:| |en| (|String|))
                                              (|:| |offset| (QREFELT $ 6))
                                              (|:| |mode| (|Symbol|))
                                              (|:| |size| (|DoubleFloat|)))
                                    #3#))
                   0)
                  (QVELT
                   (PROG2 (LETT #3# (QVELT |n| 2) . #13#)
                       (QCDR #3#)
                     (|check_union| (QEQCAR #3# 7)
                                    (|Record| (|:| |st| (|String|))
                                              (|:| |en| (|String|))
                                              (|:| |offset| (QREFELT $ 6))
                                              (|:| |mode| (|Symbol|))
                                              (|:| |size| (|DoubleFloat|)))
                                    #3#))
                   1))
                 (LETT |ptStr|
                       (SPADCALL
                        (LIST "M"
                              (|mathObject2String|
                               (|mul_DF| (SPADCALL |startPoint| (QREFELT $ 56))
                                         |scale|))
                              "," (|mathObject2String| |startPointM|)
                              "c -50,25 -50,-50 0,-25")
                        (QREFELT $ 87))
                       . #13#))
                (#14#
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
                       . #13#)))
               (LETT |linWidth|
                     (QVELT
                      (PROG2 (LETT #3# (QVELT |n| 2) . #13#)
                          (QCDR #3#)
                        (|check_union| (QEQCAR #3# 7)
                                       (|Record| (|:| |st| (|String|))
                                                 (|:| |en| (|String|))
                                                 (|:| |offset| (QREFELT $ 6))
                                                 (|:| |mode| (|Symbol|))
                                                 (|:| |size| (|DoubleFloat|)))
                                       #3#))
                      4)
                     . #13#)
               (COND
                ((EQUAL
                  (QVELT
                   (PROG2 (LETT #3# (QVELT |n| 2) . #13#)
                       (QCDR #3#)
                     (|check_union| (QEQCAR #3# 7)
                                    (|Record| (|:| |st| (|String|))
                                              (|:| |en| (|String|))
                                              (|:| |offset| (QREFELT $ 6))
                                              (|:| |mode| (|Symbol|))
                                              (|:| |size| (|DoubleFloat|)))
                                    #3#))
                   3)
                  '|proportional|)
                 (LETT |linWidth|
                       (|mul_DF|
                        (SPADCALL
                         (SPADCALL (QCDR |bb|) (QCAR |bb|) (QREFELT $ 111))
                         (QREFELT $ 56))
                        (QVELT
                         (PROG2 (LETT #3# (QVELT |n| 2) . #13#)
                             (QCDR #3#)
                           (|check_union| (QEQCAR #3# 7)
                                          (|Record| (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT $ 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|)))
                                          #3#))
                         4))
                       . #13#)))
               (COND
                ((EQUAL
                  (QVELT
                   (PROG2 (LETT #3# (QVELT |n| 2) . #13#)
                       (QCDR #3#)
                     (|check_union| (QEQCAR #3# 7)
                                    (|Record| (|:| |st| (|String|))
                                              (|:| |en| (|String|))
                                              (|:| |offset| (QREFELT $ 6))
                                              (|:| |mode| (|Symbol|))
                                              (|:| |size| (|DoubleFloat|)))
                                    #3#))
                   3)
                  '|variable|)
                 (LETT |linWidth|
                       (|mul_DF|
                        (SPADCALL |startPoint| |endPoint| (QREFELT $ 112))
                        (QVELT
                         (PROG2 (LETT #3# (QVELT |n| 2) . #13#)
                             (QCDR #3#)
                           (|check_union| (QEQCAR #3# 7)
                                          (|Record| (|:| |st| (|String|))
                                                    (|:| |en| (|String|))
                                                    (|:| |offset|
                                                         (QREFELT $ 6))
                                                    (|:| |mode| (|Symbol|))
                                                    (|:| |size|
                                                         (|DoubleFloat|)))
                                          #3#))
                         4))
                       . #13#)))
               (LETT |nodeAtts|
                     (LIST (SPADCALL "d" |ptStr| (QREFELT $ 118))
                           (SPADCALL "fill" "none" (QREFELT $ 118))
                           (SPADCALL "stroke" (QVELT |mat| 1) (QREFELT $ 118))
                           (SPADCALL "stroke-width"
                                     (|mathObject2String| |linWidth|)
                                     (QREFELT $ 118))
                           (SPADCALL "style" "marker-end:url(#Arrow)"
                                     (QREFELT $ 118)))
                     . #13#)
               (LETT |nodeEles|
                     (LIST (SPADCALL "path" NIL |nodeAtts| (QREFELT $ 121)))
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
              ((< (SPADCALL (QVELT |n| 1) (QREFELT $ 131)) 1)
               (SPADCALL |nodeName| |nodeEles| |nodeAtts| (QREFELT $ 121)))
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
                                      (QREFELT $ 132))
                            . #13#)
                      (EXIT
                       (COND
                        ((NULL (SPADCALL |xch| (QREFELT $ 129)))
                         (LETT |nodeEles|
                               (SPADCALL |nodeEles| |xch| (QREFELT $ 123))
                               . #13#)))))
                     (LETT #1# (CDR #1#) . #13#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (SPADCALL |nodeName| |nodeEles| |nodeAtts|
                           (QREFELT $ 121)))))))))
      #5# (EXIT #5#))))) 

(DEFUN |SCENE;writeSvg;$SV;58| (|n| |filename| $)
  (PROG (|defaultBounds| |defaultTransform| |defaultMaterial|)
    (RETURN
     (SEQ
      (LETT |defaultMaterial|
            (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "black" "black" 1.0)
            . #1=(|SCENE;writeSvg;$SV;58|))
      (LETT |defaultTransform| (SPADCALL (QREFELT $ 133)) . #1#)
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
                  'NIL 'NIL (SPADCALL NIL NIL (QREFELT $ 134)) (QREFELT $ 132))
        |filename| (QREFELT $ 136))))))) 

(DEFUN |SCENE;writeSvgQuantised;$SV;59| (|n| |filename| $)
  (PROG (|defaultBounds| |defaultTransform| |defaultMaterial|)
    (RETURN
     (SEQ
      (LETT |defaultMaterial|
            (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "black" "black" 1.0)
            . #1=(|SCENE;writeSvgQuantised;$SV;59|))
      (LETT |defaultTransform| (SPADCALL (QREFELT $ 133)) . #1#)
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
                  'NIL 'T (SPADCALL NIL NIL (QREFELT $ 134)) (QREFELT $ 132))
        |filename| (QREFELT $ 136))))))) 

(DEFUN |SCENE;pointString| (|pts| |tran| |bb| $)
  (PROG (|ptStr| |thisStr| |param2| #1=#:G822 |param| |lastValid|)
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
                         (SPADCALL |param2| (QREFELT $ 139))))
                       (QREFELT $ 87))
                      . #2#)
                (EXIT
                 (LETT |ptStr| (SPADCALL |ptStr| |thisStr| (QREFELT $ 140))
                       . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |ptStr|))))) 

(DEFUN |SCENE;pointIndexString| (|pts| |tran| |bb| $)
  (PROG (|ptStr| #1=#:G830 |param| #2=#:G829 |line|)
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
                                       (QREFELT $ 140))
                             . #3#)))
                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (LETT |ptStr| (SPADCALL |ptStr| "-1" (QREFELT $ 140)) . #3#)))
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

(DEFUN |SCENE;toX3D;$RStRXe;63| (|n| |mat| |tran| |bb| $)
  (PROG (|nodeEles| |xch| #1=#:G880 |ch| #2=#:G878 |ifset| |coord| #3=#:G845
         |nodeAtts| |ifsR| |meshR| #4=#:G846 #5=#:G840 #6=#:G842 |bb2| |mx2|
         #7=#:G843 |mn2| |tran2| #8=#:G844 |mat2| #9=#:G841 |inner| #10=#:G879
         |nodeName|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |nodeName| (|SCENE;setX3DNodeName| (QVELT |n| 0) $)
              . #11=(|SCENE;toX3D;$RStRXe;63|))
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
                       (SPADCALL |ch| |mat2| |tran2| |bb2| (QREFELT $ 141))
                       . #11#)
                 (EXIT
                  (COND
                   ((NULL (SPADCALL |xch| (QREFELT $ 129)))
                    (LETT |nodeEles|
                          (SPADCALL |nodeEles| |xch| (QREFELT $ 123))
                          . #11#)))))
                (LETT #10# (CDR #10#) . #11#) (GO G190) G191 (EXIT NIL))
           (LETT |inner|
                 (SPADCALL "Scene" |nodeEles| |nodeAtts| (QREFELT $ 121))
                 . #11#)
           (EXIT
            (PROGN
             (LETT #2#
                   (SPADCALL |nodeName| (LIST |inner|) |nodeAtts|
                             (QREFELT $ 121))
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
                   |tran| (QREFELT $ 130))
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
                             (QREFELT $ 118)))
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
                  8 (QREFELT $ 142))
                 . #11#)
           (LETT |ifsR| (SPADCALL |meshR| 'NIL (QREFELT $ 143)) . #11#)
           (LETT |nodeAtts|
                 (LIST
                  (SPADCALL "coordIndex"
                            (|SCENE;pointIndexString|
                             (SPADCALL |ifsR| (QREFELT $ 38)) |tran| |bb| $)
                            (QREFELT $ 144)))
                 . #11#)
           (LETT |coord|
                 (SPADCALL "Coordinate" NIL
                           (LIST
                            (SPADCALL "point"
                                      (|SCENE;pointString|
                                       (SPADCALL |ifsR| (QREFELT $ 39)) |tran|
                                       |bb| $)
                                      (QREFELT $ 144)))
                           (QREFELT $ 121))
                 . #11#)
           (LETT |ifset|
                 (SPADCALL |nodeName| (LIST |coord|) |nodeAtts|
                           (QREFELT $ 121))
                 . #11#)
           (EXIT
            (PROGN
             (LETT #2# (SPADCALL "Shape" (LIST |ifset|) NIL (QREFELT $ 121))
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
                                      (|:| |mode| (|Symbol|))
                                      (|:| |size| (|DoubleFloat|)))
                                     #4#))
                    0))
                  (SPADCALL (SPADCALL 25 -2 10 (QREFELT $ 63)) (QREFELT $ 64))
                  8 (QREFELT $ 142))
                 . #11#)
           (LETT |ifsR| (SPADCALL |meshR| 'NIL (QREFELT $ 143)) . #11#)
           (LETT |nodeAtts|
                 (LIST
                  (SPADCALL "coordIndex"
                            (|SCENE;pointIndexString|
                             (SPADCALL |ifsR| (QREFELT $ 38)) |tran| |bb| $)
                            (QREFELT $ 144)))
                 . #11#)
           (LETT |coord|
                 (SPADCALL "Coordinate" NIL
                           (LIST
                            (SPADCALL "point"
                                      (|SCENE;pointString|
                                       (SPADCALL |ifsR| (QREFELT $ 39)) |tran|
                                       |bb| $)
                                      (QREFELT $ 144)))
                           (QREFELT $ 121))
                 . #11#)
           (LETT |ifset|
                 (SPADCALL |nodeName| (LIST |coord|) |nodeAtts|
                           (QREFELT $ 121))
                 . #11#)
           (EXIT
            (PROGN
             (LETT #2# (SPADCALL "Shape" (LIST |ifset|) NIL (QREFELT $ 121))
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
                            (QREFELT $ 144)))
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
                                      (QREFELT $ 144)))
                           (QREFELT $ 121))
                 . #11#)
           (LETT |ifset|
                 (SPADCALL |nodeName| (LIST |coord|) |nodeAtts|
                           (QREFELT $ 121))
                 . #11#)
           (EXIT
            (PROGN
             (LETT #2# (SPADCALL "Shape" (LIST |ifset|) NIL (QREFELT $ 121))
                   . #11#)
             (GO #2#))))))
        (EXIT
         (COND
          ((< (SPADCALL (QVELT |n| 1) (QREFELT $ 131)) 1)
           (SPADCALL |nodeName| NIL |nodeAtts| (QREFELT $ 121)))
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
                                      (QREFELT $ 141))
                            . #11#)
                      (EXIT
                       (COND
                        ((NULL (SPADCALL |xch| (QREFELT $ 129)))
                         (LETT |nodeEles|
                               (SPADCALL |nodeEles| |xch| (QREFELT $ 123))
                               . #11#)))))
                     (LETT #1# (CDR #1#) . #11#) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (SPADCALL |nodeName| |nodeEles| |nodeAtts|
                           (QREFELT $ 121)))))))))
      #2# (EXIT #2#))))) 

(DEFUN |SCENE;writeX3d;$SV;64| (|n| |filename| $)
  (PROG (|defaultBounds| |defaultTransform| |defaultMaterial|)
    (RETURN
     (SEQ
      (LETT |defaultMaterial|
            (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "black" "black" 1.0)
            . #1=(|SCENE;writeX3d;$SV;64|))
      (LETT |defaultTransform| (SPADCALL (QREFELT $ 133)) . #1#)
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
                  (QREFELT $ 141))
        |filename| (QREFELT $ 136))))))) 

(DEFUN |SCENE;toObj;$RRRStRV;65|
       (|n| |ptLst| |indexLst| |indexNxt| |tran| |bb| $)
  (PROG (#1=#:G947 |ch| #2=#:G933 |i2| #3=#:G946 |j| #4=#:G945 #5=#:G944 |k|
         #6=#:G943 |p1| #7=#:G897 |i1| #8=#:G942 #9=#:G941 #10=#:G940
         #11=#:G939 |ifsR| |meshR| #12=#:G892 #13=#:G938 #14=#:G937 #15=#:G936
         #16=#:G935 |bb2| |mx2| #17=#:G895 |mn2| |tran2| #18=#:G896 #19=#:G934
         |mx| |mn| |offsety| |offsetRequired| |offsetx| |miny| |minx|
         |nodeName|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |nodeName| (|SCENE;setX3DNodeName| (QVELT |n| 0) $)
              . #20=(|SCENE;toObj;$RRRStRV;65|))
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
                               (QREFELT $ 124))
                     . #20#)))))
           (SEQ (LETT |ch| NIL . #20#) (LETT #19# (QVELT |n| 1) . #20#) G190
                (COND
                 ((OR (ATOM #19#) (PROGN (LETT |ch| (CAR #19#) . #20#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (SPADCALL |ch| |ptLst| |indexLst| |indexNxt| |tran2| |bb2|
                            (QREFELT $ 149))))
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
                   |tran| (QREFELT $ 130))
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
                  8 (QREFELT $ 142))
                 . #20#)
           (LETT |ifsR| (SPADCALL |meshR| 'NIL (QREFELT $ 143)) . #20#)
           (LETT |i1| (SPADCALL |ifsR| (QREFELT $ 38)) . #20#)
           (LETT |p1| (SPADCALL |ifsR| (QREFELT $ 39)) . #20#)
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
                                                            (QREFELT $ 150)))
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
                     (SPADCALL (SPADCALL |ptLst| (QREFELT $ 151)) |p1|
                               (QREFELT $ 152))
                     (QREFELT $ 153))
           (SPADCALL |indexLst|
                     (SPADCALL (SPADCALL |indexLst| (QREFELT $ 154)) |i2|
                               (QREFELT $ 155))
                     (QREFELT $ 156))
           (SPADCALL |indexNxt|
                     (+ (SPADCALL |indexNxt| (QREFELT $ 150)) (LENGTH |p1|))
                     (QREFELT $ 157))
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
                  8 (QREFELT $ 142))
                 . #20#)
           (LETT |ifsR| (SPADCALL |meshR| 'NIL (QREFELT $ 143)) . #20#)
           (LETT |i1| (SPADCALL |ifsR| (QREFELT $ 38)) . #20#)
           (LETT |p1| (SPADCALL |ifsR| (QREFELT $ 39)) . #20#)
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
                                                            (QREFELT $ 150)))
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
                     (SPADCALL (SPADCALL |ptLst| (QREFELT $ 151)) |p1|
                               (QREFELT $ 152))
                     (QREFELT $ 153))
           (SPADCALL |indexLst|
                     (SPADCALL (SPADCALL |indexLst| (QREFELT $ 154)) |i2|
                               (QREFELT $ 155))
                     (QREFELT $ 156))
           (SPADCALL |indexNxt|
                     (+ (SPADCALL |indexNxt| (QREFELT $ 150)) (LENGTH |p1|))
                     (QREFELT $ 157))
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
                                                            (QREFELT $ 150)))
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
                     (SPADCALL (SPADCALL |ptLst| (QREFELT $ 151)) |p1|
                               (QREFELT $ 152))
                     (QREFELT $ 153))
           (SPADCALL |indexLst|
                     (SPADCALL (SPADCALL |indexLst| (QREFELT $ 154)) |i2|
                               (QREFELT $ 155))
                     (QREFELT $ 156))
           (SPADCALL |indexNxt|
                     (+ (SPADCALL |indexNxt| (QREFELT $ 150)) (LENGTH |p1|))
                     (QREFELT $ 157))
           (EXIT (PROGN (LETT #2# (|Void|) . #20#) (GO #2#))))))
        (EXIT
         (COND ((< (SPADCALL (QVELT |n| 1) (QREFELT $ 131)) 1) (|Void|))
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
                                  |bb2| (QREFELT $ 149))))
                      (LETT #1# (CDR #1#) . #20#) (GO G190) G191 (EXIT NIL))
                 (EXIT (|Void|))))))))
      #2# (EXIT #2#))))) 

(DEFUN |SCENE;writeObj;$SV;66| (|n| |filename| $)
  (PROG (|s| #1=#:G957 |i| #2=#:G956 |row| #3=#:G955 |v| |f1| |defaultBounds|
         |defaultTransform| |indexNxt| |indexLst| |ptLst|)
    (RETURN
     (SEQ
      (LETT |ptLst| (SPADCALL NIL (QREFELT $ 158))
            . #4=(|SCENE;writeObj;$SV;66|))
      (LETT |indexLst| (SPADCALL NIL (QREFELT $ 159)) . #4#)
      (LETT |indexNxt| (SPADCALL 0 (QREFELT $ 160)) . #4#)
      (LETT |defaultTransform| (SPADCALL (QREFELT $ 133)) . #4#)
      (LETT |defaultBounds|
            (CONS
             (SPADCALL (|minus_DF| (FLOAT 9000 MOST-POSITIVE-DOUBLE-FLOAT))
                       (|minus_DF| (FLOAT 9000 MOST-POSITIVE-DOUBLE-FLOAT))
                       (QREFELT $ 58))
             (SPADCALL (FLOAT 9000 MOST-POSITIVE-DOUBLE-FLOAT)
                       (FLOAT 9000 MOST-POSITIVE-DOUBLE-FLOAT) (QREFELT $ 58)))
            . #4#)
      (SPADCALL |n| |ptLst| |indexLst| |indexNxt| |defaultTransform|
                |defaultBounds| (QREFELT $ 149))
      (LETT |f1|
            (SPADCALL (SPADCALL |filename| (QREFELT $ 162)) "output"
                      (QREFELT $ 164))
            . #4#)
      (SPADCALL |f1| "# mesh generated by axiom" (QREFELT $ 165))
      (SEQ (LETT |v| NIL . #4#)
           (LETT #3# (SPADCALL |ptLst| (QREFELT $ 151)) . #4#) G190
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
                               (SPADCALL |v| (QREFELT $ 139))))
                        (QREFELT $ 87))
                       (QREFELT $ 165))))
           (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
      (LETT |s| "" . #4#)
      (SEQ (LETT |row| NIL . #4#)
           (LETT #2# (SPADCALL |indexLst| (QREFELT $ 154)) . #4#) G190
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
                (EXIT (SPADCALL |f1| |s| (QREFELT $ 165))))
           (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
      (SPADCALL |f1| (QREFELT $ 166)) (EXIT (|Void|)))))) 

(DEFUN |SCENE;writeVRML;$SV;67| (|n| |filename| $)
  (PROG (|defaultBounds| |defaultTransform| |defaultMaterial|)
    (RETURN
     (SEQ
      (LETT |defaultMaterial|
            (VECTOR (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT) "black" "black" 1.0)
            . #1=(|SCENE;writeVRML;$SV;67|))
      (LETT |defaultTransform| (SPADCALL (QREFELT $ 133)) . #1#)
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
                  (QREFELT $ 141))
        |filename| (QREFELT $ 168))))))) 

(DEFUN |SCENE;Fnan?| (|x| $) (SPADCALL |x| |x| (QREFELT $ 170))) 

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
                     ((SPADCALL |r| MOST-POSITIVE-DOUBLE-FLOAT (QREFELT $ 115))
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
                     ((SPADCALL |r| MOST-POSITIVE-DOUBLE-FLOAT (QREFELT $ 115))
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
            ((|less_DF| |a| |b|) (SPADCALL |a| |b| (QREFELT $ 171)))
            ('T (SPADCALL |b| |a| (QREFELT $ 171))))))))) 

(DEFUN |SCENE;checkRange| (|r| $)
  (COND
   ((SPADCALL (SPADCALL |r| (QREFELT $ 98)) (SPADCALL |r| (QREFELT $ 99))
              (QREFELT $ 115))
    (|error| "ranges cannot be negative"))
   ('T |r|))) 

(DEFUN |SCENE;createPlot1Din2D;MSNni$;73| (|f| |tRange| |numPts| $)
  (PROG (|branches| |newl| #1=#:G990 |p| |p0| |t| |l| #2=#:G989 |i| |s| |h|)
    (RETURN
     (SEQ (|SCENE;checkRange| |tRange| $)
          (LETT |l| (SPADCALL |tRange| (QREFELT $ 98))
                . #3=(|SCENE;createPlot1Din2D;MSNni$;73|))
          (LETT |h| (SPADCALL |tRange| (QREFELT $ 99)) . #3#)
          (LETT |t| (SPADCALL |l| (QREFELT $ 173)) . #3#)
          (LETT |p0| (SPADCALL (SPADCALL |l| |f|) (QREFELT $ 174)) . #3#)
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
                  ((SPADCALL |p| (QREFELT $ 175))
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

(DEFUN |SCENE;addPlot1Din2D;$MSNni$;74| (|n| |f| |tRange| |numPts| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |f| |tRange| |numPts| (QREFELT $ 177))
            |SCENE;addPlot1Din2D;$MSNni$;74|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createPlot1Din2D;MSNni$;75| (|f| |seg| |numPts| $)
  (PROG (|ff|)
    (RETURN
     (SEQ
      (LETT |ff|
            (LIST (CONS #'|SCENE;createPlot1Din2D;MSNni$;75!0| (VECTOR $ |f|)))
            |SCENE;createPlot1Din2D;MSNni$;75|)
      (EXIT
       (SPADCALL (SPADCALL |ff| (QREFELT $ 180)) (|SCENE;normalize| |seg| $)
                 |numPts| (QREFELT $ 177))))))) 

(DEFUN |SCENE;createPlot1Din2D;MSNni$;75!0| (|x| $$)
  (PROG (|f| $)
    (LETT |f| (QREFELT $$ 1) . #1=(|SCENE;createPlot1Din2D;MSNni$;75|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL |x| (|SCENE;applyfxTrap| |f| |x| $) (QREFELT $ 58)))))) 

(DEFUN |SCENE;addPlot1Din2D;$MSNni$;76| (|n| |f| |seg| |numPts| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |f| |seg| |numPts| (QREFELT $ 182))
            |SCENE;addPlot1Din2D;$MSNni$;76|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createPlot1Din2Dparametric;PpcSNni$;77| (|ppc| |seg| |numPts| $)
  (PROG (|fcn| |g| |f|)
    (RETURN
     (SEQ
      (LETT |f| (SPADCALL |ppc| 1 (QREFELT $ 185))
            . #1=(|SCENE;createPlot1Din2Dparametric;PpcSNni$;77|))
      (LETT |g| (SPADCALL |ppc| 2 (QREFELT $ 185)) . #1#)
      (LETT |fcn|
            (LIST
             (CONS #'|SCENE;createPlot1Din2Dparametric;PpcSNni$;77!0|
                   (VECTOR |g| $ |f|)))
            . #1#)
      (EXIT
       (SPADCALL (SPADCALL |fcn| (QREFELT $ 180)) (|SCENE;normalize| |seg| $)
                 |numPts| (QREFELT $ 177))))))) 

(DEFUN |SCENE;createPlot1Din2Dparametric;PpcSNni$;77!0| (|x| $$)
  (PROG (|f| $ |g|)
    (LETT |f| (QREFELT $$ 2)
          . #1=(|SCENE;createPlot1Din2Dparametric;PpcSNni$;77|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |g| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (|SCENE;applyfxTrap| |f| |x| $) (|SCENE;applyfxTrap| |g| |x| $)
                (QREFELT $ 58)))))) 

(DEFUN |SCENE;addPlot1Din2Dparametric;$PpcSNni$;78|
       (|n| |ppc| |seg| |numPts| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |ppc| |seg| |numPts| (QREFELT $ 186))
            |SCENE;addPlot1Din2Dparametric;$PpcSNni$;78|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createPlot1Din3Dparametric;PscSNni$;79| (|psc| |seg| |numPts| $)
  (PROG (|fcn| |h| |g| |f|)
    (RETURN
     (SEQ
      (LETT |f| (SPADCALL |psc| 1 (QREFELT $ 189))
            . #1=(|SCENE;createPlot1Din3Dparametric;PscSNni$;79|))
      (LETT |g| (SPADCALL |psc| 2 (QREFELT $ 189)) . #1#)
      (LETT |h| (SPADCALL |psc| 3 (QREFELT $ 189)) . #1#)
      (LETT |fcn|
            (CONS #'|SCENE;createPlot1Din3Dparametric;PscSNni$;79!0|
                  (VECTOR |h| |g| $ |f|))
            . #1#)
      (EXIT (SPADCALL |fcn| |seg| |numPts| (QREFELT $ 190))))))) 

(DEFUN |SCENE;createPlot1Din3Dparametric;PscSNni$;79!0| (|x| $$)
  (PROG (|f| $ |g| |h|)
    (LETT |f| (QREFELT $$ 3)
          . #1=(|SCENE;createPlot1Din3Dparametric;PscSNni$;79|))
    (LETT $ (QREFELT $$ 2) . #1#)
    (LETT |g| (QREFELT $$ 1) . #1#)
    (LETT |h| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (|SCENE;applyfxTrap| |f| |x| $) (|SCENE;applyfxTrap| |g| |x| $)
                (|SCENE;applyfxTrap| |h| |x| $) (QREFELT $ 42)))))) 

(DEFUN |SCENE;addPlot1Din3Dparametric;$PscSNni$;80|
       (|n| |psc| |seg| |numPts| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |psc| |seg| |numPts| (QREFELT $ 191))
            |SCENE;addPlot1Din3Dparametric;$PscSNni$;80|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createPlot1Din3Dparametric;MSNni$;81| (|psc| |seg| |numPts| $)
  (PROG (|p| |t| |l| #1=#:G1029 |i| |s| |h| |tRange| |f|)
    (RETURN
     (SEQ (LETT |f| |psc| . #2=(|SCENE;createPlot1Din3Dparametric;MSNni$;81|))
          (LETT |tRange| (|SCENE;normalize| |seg| $) . #2#)
          (|SCENE;checkRange| |tRange| $)
          (LETT |l| (SPADCALL |tRange| (QREFELT $ 98)) . #2#)
          (LETT |h| (SPADCALL |tRange| (QREFELT $ 99)) . #2#)
          (LETT |t| (SPADCALL |l| (QREFELT $ 173)) . #2#)
          (LETT |p| (SPADCALL (SPADCALL |l| |f|) (QREFELT $ 174)) . #2#)
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

(DEFUN |SCENE;addPlot1Din3Dparametric;$MSNni$;82| (|n| |psc| |seg| |numPts| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |psc| |seg| |numPts| (QREFELT $ 190))
            |SCENE;addPlot1Din3Dparametric;$MSNni$;82|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createPlot2Din3D;M2SNni$;83| (|ptFun| |uSeg| |vSeg| |numPts| $)
  (PROG (|someV| |llp| |someU| |lp| |pt| |iu| |iv| |vstep| |ustep|)
    (RETURN
     (SEQ (LETT |llp| NIL . #1=(|SCENE;createPlot2Din3D;M2SNni$;83|))
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
           (SPADCALL (SPADCALL |llp| 'NIL (QREFELT $ 143)) (QREFELT $ 40))))))) 

(DEFUN |SCENE;createPlot2Din3D;M2SNni$;84| (|f| |xSeg| |ySeg| |numPts| $)
  (PROG (|fcn|)
    (RETURN
     (SEQ
      (LETT |fcn|
            (LIST
             (CONS #'|SCENE;createPlot2Din3D;M2SNni$;84!0| (VECTOR $ |f|)))
            |SCENE;createPlot2Din3D;M2SNni$;84|)
      (EXIT
       (SPADCALL (SPADCALL |fcn| (QREFELT $ 197)) (|SCENE;normalize| |xSeg| $)
                 (|SCENE;normalize| |ySeg| $) |numPts| (QREFELT $ 195))))))) 

(DEFUN |SCENE;createPlot2Din3D;M2SNni$;84!0| (|x| |y| $$)
  (PROG (|f| $)
    (LETT |f| (QREFELT $$ 1) . #1=(|SCENE;createPlot2Din3D;M2SNni$;84|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (|SCENE;applyfxyTrap| |f| |x| |y| $) |x| |y| (QREFELT $ 42)))))) 

(DEFUN |SCENE;addPlot2Din3D;$M2SNni$;85| (|n| |f| |xSeg| |ySeg| |numPts| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |f| |xSeg| |ySeg| |numPts| (QREFELT $ 199))
            |SCENE;addPlot2Din3D;$M2SNni$;85|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createPlot2Din3Dparametric;Ps2SNni$;86|
       (|s| |uSeg| |vSeg| |numPts| $)
  (PROG (|fcn| |h| |g| |f|)
    (RETURN
     (SEQ
      (LETT |f| (LIST (SPADCALL |s| (|spadConstant| $ 202) (QREFELT $ 204)))
            . #1=(|SCENE;createPlot2Din3Dparametric;Ps2SNni$;86|))
      (LETT |g| (LIST (SPADCALL |s| 2 (QREFELT $ 204))) . #1#)
      (LETT |h| (LIST (SPADCALL |s| 3 (QREFELT $ 204))) . #1#)
      (LETT |fcn|
            (LIST
             (CONS #'|SCENE;createPlot2Din3Dparametric;Ps2SNni$;86!0|
                   (VECTOR |h| |g| $ |f|)))
            . #1#)
      (EXIT
       (SPADCALL (SPADCALL |fcn| (QREFELT $ 197)) (|SCENE;normalize| |uSeg| $)
                 (|SCENE;normalize| |vSeg| $) |numPts| (QREFELT $ 195))))))) 

(DEFUN |SCENE;createPlot2Din3Dparametric;Ps2SNni$;86!0| (|x| |y| $$)
  (PROG (|f| $ |g| |h|)
    (LETT |f| (QREFELT $$ 3)
          . #1=(|SCENE;createPlot2Din3Dparametric;Ps2SNni$;86|))
    (LETT $ (QREFELT $$ 2) . #1#)
    (LETT |g| (QREFELT $$ 1) . #1#)
    (LETT |h| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (|SCENE;applyfxyTrap| (SPADCALL |f| (QREFELT $ 206)) |x| |y| $)
                (|SCENE;applyfxyTrap| (SPADCALL |g| (QREFELT $ 206)) |x| |y| $)
                (|SCENE;applyfxyTrap| (SPADCALL |h| (QREFELT $ 206)) |x| |y| $)
                (QREFELT $ 42)))))) 

(DEFUN |SCENE;addPlot2Din3Dparametric;$Ps2SNni$;87|
       (|n| |s| |uSeg| |vSeg| |numPts| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |s| |uSeg| |vSeg| |numPts| (QREFELT $ 207))
            |SCENE;addPlot2Din3Dparametric;$Ps2SNni$;87|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;createPlot2Din3Dparametric;M2SNni$;88|
       (|s| |uSeg| |vSeg| |numPts| $)
  (PROG (|fcn|)
    (RETURN
     (SEQ (LETT |fcn| (LIST |s|) |SCENE;createPlot2Din3Dparametric;M2SNni$;88|)
          (EXIT
           (SPADCALL (SPADCALL |fcn| (QREFELT $ 197))
                     (|SCENE;normalize| |uSeg| $) (|SCENE;normalize| |vSeg| $)
                     |numPts| (QREFELT $ 195))))))) 

(DEFUN |SCENE;addPlot2Din3Dparametric;$M2SNni$;89|
       (|n| |s| |uSeg| |vSeg| |numPts| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (SPADCALL |s| |uSeg| |vSeg| |numPts| (QREFELT $ 209))
            |SCENE;addPlot2Din3Dparametric;$M2SNni$;89|)
      (SPADCALL |n| |c| (QREFELT $ 16)) (EXIT |c|))))) 

(DEFUN |SCENE;coerce;$Of;90| (|n| $)
  (PROG (|s|)
    (RETURN
     (SEQ (LETT |s| "scene " . #1=(|SCENE;coerce;$Of;90|))
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
                       (STRINGIMAGE (SPADCALL (QVELT |n| 1) (QREFELT $ 131))))
                 (QREFELT $ 87))
                . #1#)
          (EXIT (SPADCALL |s| (QREFELT $ 212))))))) 

(DEFUN |Scene| (#1=#:G1104)
  (PROG ()
    (RETURN
     (PROG (#2=#:G1105)
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
      (LETT $ (GETREFV 214) . #1#)
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
                                              (|:| |mode| (|Symbol|))
                                              (|:| |size| (|DoubleFloat|))))
                                        (|:| |arrw|
                                             (|Record| (|:| |st| (|String|))
                                                       (|:| |en| (|String|))
                                                       (|:| |offset| |#1|)
                                                       (|:| |mode| (|Symbol|))
                                                       (|:| |size|
                                                            (|DoubleFloat|))))
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
              |SCENE;addSceneLines;$L$;9| (|Symbol|) (|DoubleFloat|)
              |SCENE;createSceneArrows;LSDf$;10|
              |SCENE;addSceneArrows;$LSDf$;11| (|String|)
              |SCENE;createSceneArrow;2SPTSDf$;12|
              |SCENE;addSceneArrow;$2SPTSDf$;13| (|SceneNamedPoints| 6)
              |SCENE;createSceneNamedPoints;Snp$;14|
              |SCENE;addSceneNamedPoints;$Snp$;15| (|List| 77)
              |SCENE;createSceneIFS;LL$;16| |SCENE;addSceneIFS;$LL$;17|
              (|SceneIFS| 6) (6 . |indexes|) (11 . |pointList|)
              |SCENE;createSceneIFS;Sifs$;18| |SCENE;addSceneIFS;$Sifs$;19|
              (16 . |spnt|) |SCENE;createSceneBox;Df$;20|
              |SCENE;addSceneBox;$Df$;21|
              (|Record| (|:| |txt| 28) (|:| |siz| 48) (|:| |pos| 6)
                        (|:| |np| 51))
              |SCENE;createSceneText;R$;22| |SCENE;addSceneText;$R$;23|
              (|NonNegativeInteger|) |SCENE;createSceneText;SNniPT$;24|
              |SCENE;addSceneText;$SNniPT$;25| (|List| 28)
              |SCENE;createSceneText;LNniPT$;26|
              |SCENE;addSceneText;$LNniPT$;27| |SCENE;createSceneClip;R$;28|
              |SCENE;addSceneClip;$R$;29| (23 . |screenCoordX|)
              (28 . |screenCoordY|) (33 . |spnt|)
              |SCENE;createSceneGrid;DfR$;30| |SCENE;addSceneGrid;$DfR$;31|
              (|PositiveInteger|) (|Float|) (39 . |float|) (46 . |coerce|)
              (|Record| (|:| |lineWidth| 25) (|:| |lineCol| 28)
                        (|:| |fillCol| 28) (|:| |matOpacity| 25))
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
              |SCENE;addSceneTransform;$St$;47| (|Segment| 25) (137 . |lo|)
              (142 . |hi|) (|Mapping| 6 6)
              |SCENE;createArrows2Din2D;M2SNni$;48|
              |SCENE;addArrows2Din2D;$M2SNni$;49| (|List| $$) (147 . |concat|)
              |SCENE;removeChild!;2$V;51| (153 . ~=)
              |SCENE;setTransform!;$StV;52| (159 . |xform|) (165 . |inBounds?|)
              (172 . ~=) (178 . -) (184 . |distance|) (190 . |One|)
              (194 . |Zero|) (198 . >) (204 . >) (|XmlAttribute|)
              (210 . |xmlAttribute|) (|List| 117) (|XmlElement|)
              (216 . |xmlElement|) (|List| 120) (223 . |concat|)
              (229 . |stranslate|) (239 . |concat|) (245 . ~=)
              (251 . |findPoint|) (257 . |xmlElement|) (264 . |empty?|)
              (269 . |compound|) (275 . |#|) |SCENE;toSVG;$RStRDf2BSnpXe;57|
              (280 . |identity|) (284 . |namedPoints|) (|ExportXml|)
              (290 . |writeXml|) |SCENE;writeSvg;$SV;58|
              |SCENE;writeSvgQuantised;$SV;59| (296 . |screenCoordZ|)
              (301 . |concat|) |SCENE;toX3D;$RStRXe;63| (307 . |curveLoops|)
              (314 . |smesh|) (320 . |xmlAttribute|) |SCENE;writeX3d;$SV;64|
              (|Reference| 18) (|Reference| 34) (|Reference| 48)
              |SCENE;toObj;$RRRStRV;65| (326 . |elt|) (331 . |elt|)
              (336 . |concat|) (342 . |setelt|) (348 . |elt|) (353 . |concat|)
              (359 . |setelt|) (365 . |setelt|) (371 . |ref|) (376 . |ref|)
              (381 . |ref|) (|FileName|) (386 . |coerce|) (|TextFile|)
              (391 . |open|) (397 . |writeLine!|) (403 . |close!|)
              |SCENE;writeObj;$SV;66| (408 . |writeVRML|)
              |SCENE;writeVRML;$SV;67| (414 . ~=) (420 . |segment|) (|List| 25)
              (426 . |list|) (431 . |list|) (436 . |Pnan?|) (|Mapping| 6 25)
              |SCENE;createPlot1Din2D;MSNni$;73|
              |SCENE;addPlot1Din2D;$MSNni$;74| (|List| 176) (441 . |first|)
              (|Mapping| 25 25) |SCENE;createPlot1Din2D;MSNni$;75|
              |SCENE;addPlot1Din2D;$MSNni$;76| (|ParametricPlaneCurve| 181)
              (446 . |coordinate|)
              |SCENE;createPlot1Din2Dparametric;PpcSNni$;77|
              |SCENE;addPlot1Din2Dparametric;$PpcSNni$;78|
              (|ParametricSpaceCurve| 181) (452 . |coordinate|)
              |SCENE;createPlot1Din3Dparametric;MSNni$;81|
              |SCENE;createPlot1Din3Dparametric;PscSNni$;79|
              |SCENE;addPlot1Din3Dparametric;$PscSNni$;80|
              |SCENE;addPlot1Din3Dparametric;$MSNni$;82| (|Mapping| 6 25 25)
              |SCENE;createPlot2Din3D;M2SNni$;83| (|List| 194) (458 . |first|)
              (|Mapping| 25 25 25) |SCENE;createPlot2Din3D;M2SNni$;84|
              |SCENE;addPlot2Din3D;$M2SNni$;85| (463 . |One|) (467 . |One|)
              (|ParametricSurface| 198) (471 . |coordinate|) (|List| 198)
              (477 . |first|) |SCENE;createPlot2Din3Dparametric;Ps2SNni$;86|
              |SCENE;addPlot2Din3Dparametric;$Ps2SNni$;87|
              |SCENE;createPlot2Din3Dparametric;M2SNni$;88|
              |SCENE;addPlot2Din3Dparametric;$M2SNni$;89| (|OutputForm|)
              (482 . |coerce|) |SCENE;coerce;$Of;90|)
           '#(|writeX3d| 487 |writeVRML| 493 |writeSvgQuantised| 499 |writeSvg|
              505 |writeObj| 511 |toX3D| 517 |toSVG| 525 |toObj| 537
              |setTransform!| 547 |removeChild!| 553 |createSceneTransform| 559
              |createSceneText| 564 |createSceneRuler| 583 |createSceneRoot|
              590 |createScenePattern| 607 |createSceneNamedPoints| 614
              |createSceneMaterial| 619 |createSceneLines| 631
              |createSceneLine| 636 |createSceneIFS| 641 |createSceneGroup| 652
              |createSceneGrid| 656 |createSceneClip| 667 |createSceneBox| 672
              |createSceneArrows| 677 |createSceneArrow| 684
              |createPlot2Din3Dparametric| 693 |createPlot2Din3D| 709
              |createPlot1Din3Dparametric| 725 |createPlot1Din2Dparametric| 739
              |createPlot1Din2D| 746 |createArrows2Din2D| 760 |coerce| 768
              |addSceneTransform| 773 |addSceneText| 779 |addSceneRuler| 801
              |addScenePattern| 809 |addSceneNamedPoints| 817
              |addSceneMaterial| 823 |addSceneLines| 837 |addSceneLine| 843
              |addSceneIFS| 849 |addSceneGroup| 862 |addSceneGrid| 867
              |addSceneClip| 880 |addSceneBox| 886 |addSceneArrows| 892
              |addSceneArrow| 900 |addPlot2Din3Dparametric| 910 |addPlot2Din3D|
              928 |addPlot1Din3Dparametric| 937 |addPlot1Din2Dparametric| 953
              |addPlot1Din2D| 961 |addChild!| 977 |addArrows2Din2D| 983)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 213
                                                 '(2 6 0 10 10 11 1 37 34 0 38
                                                   1 37 18 0 39 3 6 0 25 25 25
                                                   42 1 6 25 0 56 1 6 25 0 57 2
                                                   6 0 25 25 58 3 62 0 10 10 61
                                                   63 1 62 25 0 64 1 37 0 18 69
                                                   2 37 0 0 48 70 2 48 71 0 0
                                                   72 2 18 6 0 10 73 2 6 0 0 0
                                                   74 2 6 0 25 0 75 2 18 0 0 6
                                                   76 2 34 77 0 10 78 1 77 48 0
                                                   79 2 77 48 0 10 80 2 21 0 0
                                                   18 81 1 25 0 0 84 2 10 71 0
                                                   0 85 1 28 0 86 87 2 10 71 0
                                                   0 88 1 97 25 0 98 1 97 25 0
                                                   99 2 103 0 0 2 104 2 24 71 0
                                                   0 106 2 94 6 0 6 108 3 6 71
                                                   0 0 0 109 2 28 71 0 0 110 2
                                                   6 0 0 0 111 2 6 25 0 0 112 0
                                                   62 0 113 0 62 0 114 2 25 71
                                                   0 0 115 2 48 71 0 0 116 2
                                                   117 0 28 28 118 3 120 0 28
                                                   86 119 121 2 122 0 0 120 123
                                                   6 94 0 25 25 25 25 25 25 124
                                                   2 119 0 0 117 125 2 51 71 0
                                                   0 126 2 31 6 0 28 127 3 120
                                                   0 28 28 119 128 1 120 71 0
                                                   129 2 94 0 0 0 130 1 103 48
                                                   0 131 0 94 0 133 2 31 0 18
                                                   51 134 2 135 15 120 28 136 1
                                                   6 25 0 139 2 51 0 0 28 140 3
                                                   37 21 18 25 10 142 2 37 0 21
                                                   71 143 2 117 0 28 51 144 1
                                                   148 48 0 150 1 146 18 0 151
                                                   2 18 0 0 0 152 2 146 18 0 18
                                                   153 1 147 34 0 154 2 34 0 0
                                                   0 155 2 147 34 0 34 156 2
                                                   148 48 0 48 157 1 146 0 18
                                                   158 1 147 0 34 159 1 148 0
                                                   48 160 1 161 0 28 162 2 163
                                                   0 161 28 164 2 163 28 0 28
                                                   165 1 163 0 0 166 2 135 15
                                                   120 28 168 2 25 71 0 0 170 2
                                                   97 0 25 25 171 1 172 0 25
                                                   173 1 18 0 6 174 1 6 71 0
                                                   175 1 179 176 0 180 2 184
                                                   181 0 48 185 2 188 181 0 48
                                                   189 1 196 194 0 197 0 25 0
                                                   201 0 48 0 202 2 203 198 0
                                                   48 204 1 205 198 0 206 1 28
                                                   211 0 212 2 0 15 0 28 145 2
                                                   0 15 0 28 169 2 0 15 0 28
                                                   138 2 0 15 0 28 137 2 0 15 0
                                                   28 167 4 0 120 0 65 94 8 141
                                                   8 0 120 0 65 94 8 25 71 71
                                                   31 132 6 0 15 0 146 147 148
                                                   94 8 149 2 0 15 0 94 107 2 0
                                                   15 0 0 105 1 0 0 94 95 1 0 0
                                                   45 46 3 0 0 28 48 6 49 3 0 0
                                                   51 48 6 52 3 0 0 24 6 8 89 1
                                                   0 0 8 9 0 0 0 13 4 0 0 10 10
                                                   10 10 12 3 0 0 24 48 8 82 1
                                                   0 0 31 32 1 0 0 65 91 3 0 0
                                                   25 28 28 92 1 0 0 21 22 1 0
                                                   0 18 19 2 0 0 34 18 35 1 0 0
                                                   37 40 0 0 0 14 2 0 0 25 8 59
                                                   1 0 0 8 67 1 0 0 8 54 1 0 0
                                                   25 43 3 0 0 21 24 25 26 5 0
                                                   0 28 28 6 24 25 29 4 0 0 194
                                                   97 97 48 209 4 0 0 203 97 97
                                                   48 207 4 0 0 198 97 97 48
                                                   199 4 0 0 194 97 97 48 195 3
                                                   0 0 188 97 48 191 3 0 0 176
                                                   97 48 190 3 0 0 184 97 48
                                                   186 3 0 0 176 97 48 177 3 0
                                                   0 181 97 48 182 4 0 0 100 97
                                                   97 48 101 1 0 211 0 213 2 0
                                                   0 0 94 96 2 0 0 0 45 47 4 0
                                                   0 0 28 48 6 50 4 0 0 0 51 48
                                                   6 53 4 0 0 0 24 6 8 90 4 0 0
                                                   0 24 48 8 83 2 0 0 0 31 33 2
                                                   0 0 0 65 66 4 0 0 0 25 28 28
                                                   93 2 0 0 0 21 23 2 0 0 0 18
                                                   20 3 0 0 0 34 18 36 2 0 0 0
                                                   37 41 1 0 0 0 17 3 0 0 0 25
                                                   8 60 2 0 0 0 8 68 2 0 0 0 8
                                                   55 2 0 0 0 25 44 4 0 0 0 21
                                                   24 25 27 6 0 0 0 28 28 6 24
                                                   25 30 5 0 0 0 194 97 97 48
                                                   210 5 0 0 0 203 97 97 48 208
                                                   5 0 0 0 198 97 97 48 200 4 0
                                                   0 0 188 97 48 192 4 0 0 0
                                                   176 97 48 193 4 0 0 0 184 97
                                                   48 187 4 0 0 0 176 97 48 178
                                                   4 0 0 0 181 97 48 183 2 0 15
                                                   0 0 16 5 0 0 0 100 97 97 48
                                                   102)))))
           '|lookupComplete|)) 
