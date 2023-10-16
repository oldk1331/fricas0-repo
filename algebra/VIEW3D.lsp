
(SDEFUN |VIEW3D;checkViewport| ((|viewport| $) ($ |Boolean|))
        (SPROG ((|i| (|Integer|)))
               (SEQ (|sockSendInt| |$ViewportServer| (QVELT |viewport| 0))
                    (LETT |i| (|sockGetInt| |$ViewportServer|))
                    (EXIT
                     (COND
                      ((< |i| 0)
                       (SEQ (QSETVELT |viewport| 0 0)
                            (EXIT
                             (|error|
                              "This viewport has already been closed!"))))
                      ('T 'T)))))) 

(SDEFUN |VIEW3D;doOptions| ((|v| |Rep|) ($ |Void|))
        (SPROG ((|st| (|String|)))
               (SEQ
                (QSETVELT |v| 2
                          (SPADCALL (QVELT |v| 12) "FriCAS3D" (QREFELT $ 29)))
                (LETT |st| (SPADCALL (QVELT |v| 12) "render" (QREFELT $ 30)))
                (COND
                 ((OR (EQUAL |st| "shade") (EQUAL |st| "render"))
                  (QSETVELT (QVELT |v| 7) 1 3))
                 ((OR (EQUAL |st| "solid") (EQUAL |st| "opaque"))
                  (QSETVELT (QVELT |v| 7) 1 7))
                 ((EQUAL |st| "contour") (QSETVELT (QVELT |v| 7) 1 24))
                 ((EQUAL |st| "smooth") (QSETVELT (QVELT |v| 7) 1 22))
                 ((EQUAL |st| "wireMesh") (QSETVELT (QVELT |v| 7) 1 9))
                 ('T (QSETVELT (QVELT |v| 7) 1 3)))
                (EXIT
                 (QSETVELT |v| 5
                           (SPADCALL (QVELT |v| 12)
                                     (VECTOR
                                      (SPADCALL (QREFELT $ 20) (QREFELT $ 31))
                                      (SPADCALL (QREFELT $ 22) (QREFELT $ 31))
                                      (SPADCALL (QREFELT $ 23) (QREFELT $ 31))
                                      1.0 1.0 1.0
                                      (SPADCALL (QREFELT $ 24) (QREFELT $ 31))
                                      (SPADCALL (QREFELT $ 25) (QREFELT $ 31)))
                                     (QREFELT $ 33))))))) 

(SDEFUN |VIEW3D;viewport3D;$;3| (($ $))
        (VECTOR 0 1 "FriCAS3D"
                (CONS (SPADCALL (SPADCALL (QREFELT $ 36)) 1 (QREFELT $ 38))
                      (SPADCALL (SPADCALL (QREFELT $ 36)) 2 (QREFELT $ 38)))
                (CONS (SPADCALL (SPADCALL (QREFELT $ 40)) 1 (QREFELT $ 41))
                      (SPADCALL (SPADCALL (QREFELT $ 40)) 2 (QREFELT $ 41)))
                (VECTOR (SPADCALL (QREFELT $ 20) (QREFELT $ 31))
                        (SPADCALL (QREFELT $ 22) (QREFELT $ 31))
                        (SPADCALL (QREFELT $ 23) (QREFELT $ 31)) 1.0 1.0 1.0
                        (SPADCALL (QREFELT $ 24) (QREFELT $ 31))
                        (SPADCALL (QREFELT $ 25) (QREFELT $ 31)))
                (CONS 0 27) (VECTOR 0 3 1 0 1 0)
                (VECTOR 0.0 0.0 1.0 0.0 0.0 1.0)
                (VECTOR 1 (FLOAT 500 MOST-POSITIVE-DOUBLE-FLOAT)
                        (FLOAT -250 MOST-POSITIVE-DOUBLE-FLOAT))
                (VECTOR 0.0 1.0 0.0 1.0 0.0 1.0 0 1) (SPADCALL (QREFELT $ 43))
                NIL)) 

(PUT '|VIEW3D;subspace;$Ts;4| '|SPADreplace|
     '(XLAM (|viewport|) (QVELT |viewport| 11))) 

(SDEFUN |VIEW3D;subspace;$Ts;4|
        ((|viewport| $) ($ |ThreeSpace| (|DoubleFloat|))) (QVELT |viewport| 11)) 

(SDEFUN |VIEW3D;subspace;$Ts$;5|
        ((|viewport| $) (|space| |ThreeSpace| (|DoubleFloat|)) ($ $))
        (SEQ (QSETVELT |viewport| 11 |space|) (EXIT |viewport|))) 

(PUT '|VIEW3D;options;$L;6| '|SPADreplace|
     '(XLAM (|viewport|) (QVELT |viewport| 12))) 

(SDEFUN |VIEW3D;options;$L;6| ((|viewport| $) ($ |List| (|DrawOption|)))
        (QVELT |viewport| 12)) 

(SDEFUN |VIEW3D;options;$L$;7|
        ((|viewport| $) (|opts| |List| (|DrawOption|)) ($ $))
        (SEQ (QSETVELT |viewport| 12 |opts|) (EXIT |viewport|))) 

(SDEFUN |VIEW3D;makeViewport3D;2$;8| ((|viewport| $) ($ $))
        (|VIEW3D;makeViewport3D0| (MOVEVEC (MAKE_VEC 13) |viewport|) $)) 

(SDEFUN |VIEW3D;makeViewport3D;TsS$;9|
        ((|space| |ThreeSpace| (|DoubleFloat|)) (|Title| |String|) ($ $))
        (SPROG ((|v| ($)))
               (SEQ (LETT |v| (SPADCALL (QREFELT $ 44)))
                    (QSETVELT |v| 11 |space|)
                    (QSETVELT |v| 12 (LIST (SPADCALL |Title| (QREFELT $ 51))))
                    (EXIT (|VIEW3D;makeViewport3D0| |v| $))))) 

(SDEFUN |VIEW3D;makeViewport3D;TsL$;10|
        ((|space| |ThreeSpace| (|DoubleFloat|)) (|opts| |List| (|DrawOption|))
         ($ $))
        (SPROG ((|v| ($)))
               (SEQ (LETT |v| (SPADCALL (QREFELT $ 44)))
                    (QSETVELT |v| 11 |space|) (QSETVELT |v| 12 |opts|)
                    (EXIT (|VIEW3D;makeViewport3D0| |v| $))))) 

(SDEFUN |VIEW3D;makeViewport3D0| ((|viewport| $) ($ $))
        (SPROG
         ((#1=#:G226 NIL) (|oneIndexedPoint| NIL) (#2=#:G224 NIL)
          (|alipts| NIL) (#3=#:G225 NIL) (|tinyprop| NIL) (#4=#:G221 NIL)
          (|allipts| NIL) (#5=#:G222 NIL) (|oneprop| NIL) (#6=#:G223 NIL)
          (|onelprops| NIL) (|aPoint| #7=(|Point| (|DoubleFloat|)))
          (#8=#:G220 NIL) (|pt| NIL) (|n| (|PositiveInteger|)) (#9=#:G219 NIL)
          (|s| (|Set| (|PositiveInteger|)))
          (|lprops| (|List| (|SubSpaceComponentProperty|)))
          (|llprops| (|List| (|List| (|SubSpaceComponentProperty|))))
          (|lllipts| (|List| (|List| (|List| (|NonNegativeInteger|)))))
          (|lpts| (|List| (|Point| (|DoubleFloat|))))
          (|transform| (|Mapping| #7# (|Point| (|DoubleFloat|)))))
         (SEQ (|VIEW3D;doOptions| |viewport| $)
              (SPADCALL "   Transmitting data..." (QREFELT $ 56))
              (LETT |transform|
                    (SPADCALL (QVELT |viewport| 12) (ELT $ 59) (QREFELT $ 61)))
              (SPADCALL (QVELT |viewport| 11) (QREFELT $ 62))
              (LETT |lpts| (SPADCALL (QVELT |viewport| 11) (QREFELT $ 64)))
              (LETT |lllipts| (SPADCALL (QVELT |viewport| 11) (QREFELT $ 66)))
              (LETT |llprops| (SPADCALL (QVELT |viewport| 11) (QREFELT $ 68)))
              (LETT |lprops| (SPADCALL (QVELT |viewport| 11) (QREFELT $ 70)))
              (LETT |s| (SPADCALL (QREFELT $ 72)))
              (SEQ (LETT |pt| NIL) (LETT #9# |lpts|) G190
                   (COND
                    ((OR (ATOM #9#) (PROGN (LETT |pt| (CAR #9#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL (SPADCALL |pt| (QREFELT $ 73)) |s|
                               (QREFELT $ 74))))
                   (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |s| (QREFELT $ 75)) 1 (QREFELT $ 77))
                 (|error| "All points should have the same dimension"))
                (#10='T
                 (SEQ (LETT |n| (|SPADfirst| (SPADCALL |s| (QREFELT $ 78))))
                      (EXIT
                       (COND
                        ((< |n| 3)
                         (|error|
                          "Dimension of points should be greater than 2"))
                        (#10#
                         (SEQ
                          (|sockSendInt| |$ViewportServer|
                                         (QVELT |viewport| 1))
                          (|sockSendInt| |$ViewportServer| -1)
                          (|sockSendString| |$ViewportServer|
                                            (QVELT |viewport| 2))
                          (|sockSendFloat| |$ViewportServer|
                                           (QVELT (QVELT |viewport| 5) 6))
                          (|sockSendFloat| |$ViewportServer|
                                           (QVELT (QVELT |viewport| 5) 7))
                          (|sockSendFloat| |$ViewportServer|
                                           (QVELT (QVELT |viewport| 5) 2))
                          (|sockSendFloat| |$ViewportServer|
                                           (QVELT (QVELT |viewport| 5) 3))
                          (|sockSendFloat| |$ViewportServer|
                                           (QVELT (QVELT |viewport| 5) 4))
                          (|sockSendFloat| |$ViewportServer|
                                           (QVELT (QVELT |viewport| 5) 5))
                          (|sockSendFloat| |$ViewportServer|
                                           (QVELT (QVELT |viewport| 5) 0))
                          (|sockSendFloat| |$ViewportServer|
                                           (QVELT (QVELT |viewport| 5) 1))
                          (|sockSendInt| |$ViewportServer|
                                         (QCAR (QVELT |viewport| 3)))
                          (|sockSendInt| |$ViewportServer|
                                         (QCDR (QVELT |viewport| 3)))
                          (|sockSendInt| |$ViewportServer|
                                         (QCAR (QVELT |viewport| 4)))
                          (|sockSendInt| |$ViewportServer|
                                         (QCDR (QVELT |viewport| 4)))
                          (|sockSendInt| |$ViewportServer|
                                         (QVELT (QVELT |viewport| 7) 0))
                          (|sockSendInt| |$ViewportServer|
                                         (QVELT (QVELT |viewport| 7) 1))
                          (|sockSendInt| |$ViewportServer|
                                         (QVELT (QVELT |viewport| 7) 2))
                          (|sockSendInt| |$ViewportServer|
                                         (QVELT (QVELT |viewport| 7) 3))
                          (|sockSendInt| |$ViewportServer|
                                         (QVELT (QVELT |viewport| 7) 4))
                          (|sockSendInt| |$ViewportServer|
                                         (QVELT (QVELT |viewport| 7) 5))
                          (|sockSendInt| |$ViewportServer|
                                         (QVELT (QVELT |viewport| 10) 6))
                          (|sockSendInt| |$ViewportServer|
                                         (QVELT (QVELT |viewport| 10) 7))
                          (|sockSendInt| |$ViewportServer|
                                         (QCAR (QVELT |viewport| 6)))
                          (|sockSendInt| |$ViewportServer|
                                         (QCDR (QVELT |viewport| 6)))
                          (|sockSendFloat| |$ViewportServer|
                                           (QVELT (QVELT |viewport| 8) 0))
                          (|sockSendFloat| |$ViewportServer|
                                           (QVELT (QVELT |viewport| 8) 1))
                          (|sockSendFloat| |$ViewportServer|
                                           (QVELT (QVELT |viewport| 8) 2))
                          (|sockSendFloat| |$ViewportServer|
                                           (QVELT (QVELT |viewport| 8) 5))
                          (|sockSendInt| |$ViewportServer|
                                         (QVELT (QVELT |viewport| 9) 0))
                          (|sockSendFloat| |$ViewportServer|
                                           (QVELT (QVELT |viewport| 9) 1))
                          (|sockSendInt| |$ViewportServer| (LENGTH |lpts|))
                          (SEQ (LETT |pt| NIL) (LETT #8# |lpts|) G190
                               (COND
                                ((OR (ATOM #8#)
                                     (PROGN (LETT |pt| (CAR #8#)) NIL))
                                 (GO G191)))
                               (SEQ (LETT |aPoint| (SPADCALL |pt| |transform|))
                                    (|sockSendFloat| |$ViewportServer|
                                                     (SPADCALL |aPoint|
                                                               (QREFELT $ 81)))
                                    (|sockSendFloat| |$ViewportServer|
                                                     (SPADCALL |aPoint|
                                                               (QREFELT $ 82)))
                                    (|sockSendFloat| |$ViewportServer|
                                                     (SPADCALL |aPoint|
                                                               (QREFELT $ 83)))
                                    (EXIT
                                     (COND
                                      ((EQL |n| 3)
                                       (|sockSendFloat| |$ViewportServer|
                                                        (SPADCALL |aPoint|
                                                                  (QREFELT $
                                                                           83))))
                                      ('T
                                       (|sockSendFloat| |$ViewportServer|
                                                        (SPADCALL |aPoint|
                                                                  (QREFELT $
                                                                           84)))))))
                               (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
                          (|sockSendInt| |$ViewportServer| (LENGTH |lllipts|))
                          (SEQ (LETT |onelprops| NIL) (LETT #6# |llprops|)
                               (LETT |oneprop| NIL) (LETT #5# |lprops|)
                               (LETT |allipts| NIL) (LETT #4# |lllipts|) G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |allipts| (CAR #4#)) NIL)
                                     (ATOM #5#)
                                     (PROGN (LETT |oneprop| (CAR #5#)) NIL)
                                     (ATOM #6#)
                                     (PROGN (LETT |onelprops| (CAR #6#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (|sockSendInt| |$ViewportServer|
                                               (COND
                                                ((SPADCALL |oneprop|
                                                           (QREFELT $ 86))
                                                 1)
                                                ('T 0)))
                                (|sockSendInt| |$ViewportServer|
                                               (COND
                                                ((SPADCALL |oneprop|
                                                           (QREFELT $ 87))
                                                 1)
                                                ('T 0)))
                                (|sockSendInt| |$ViewportServer|
                                               (LENGTH |allipts|))
                                (EXIT
                                 (SEQ (LETT |tinyprop| NIL)
                                      (LETT #3# |onelprops|)
                                      (LETT |alipts| NIL) (LETT #2# |allipts|)
                                      G190
                                      (COND
                                       ((OR (ATOM #2#)
                                            (PROGN
                                             (LETT |alipts| (CAR #2#))
                                             NIL)
                                            (ATOM #3#)
                                            (PROGN
                                             (LETT |tinyprop| (CAR #3#))
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (|sockSendInt| |$ViewportServer|
                                                      (COND
                                                       ((SPADCALL |tinyprop|
                                                                  (QREFELT $
                                                                           86))
                                                        1)
                                                       ('T 0)))
                                       (|sockSendInt| |$ViewportServer|
                                                      (COND
                                                       ((SPADCALL |tinyprop|
                                                                  (QREFELT $
                                                                           87))
                                                        1)
                                                       ('T 0)))
                                       (|sockSendInt| |$ViewportServer|
                                                      (SPADCALL |alipts|
                                                                (QREFELT $
                                                                         88)))
                                       (EXIT
                                        (SEQ (LETT |oneIndexedPoint| NIL)
                                             (LETT #1# |alipts|) G190
                                             (COND
                                              ((OR (ATOM #1#)
                                                   (PROGN
                                                    (LETT |oneIndexedPoint|
                                                          (CAR #1#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (|sockSendInt| |$ViewportServer|
                                                              |oneIndexedPoint|)))
                                             (LETT #1# (CDR #1#)) (GO G190)
                                             G191 (EXIT NIL))))
                                      (LETT #2#
                                            (PROG1 (CDR #2#)
                                              (LETT #3# (CDR #3#))))
                                      (GO G190) G191 (EXIT NIL))))
                               (LETT #4#
                                     (PROG1 (CDR #4#)
                                       (LETT #5#
                                             (PROG1 (CDR #5#)
                                               (LETT #6# (CDR #6#))))))
                               (GO G190) G191 (EXIT NIL))
                          (QSETVELT |viewport| 0
                                    (|sockGetInt| |$ViewportServer|))
                          (EXIT |viewport|)))))))))))) 

(SDEFUN |VIEW3D;viewThetaDefault;F;12| (($ |Float|))
        (SPADCALL (SPADCALL (QREFELT $ 20) (QREFELT $ 89)) (QREFELT $ 90))) 

(SDEFUN |VIEW3D;viewThetaDefault;2F;13| ((|t| |Float|) ($ |Float|))
        (SEQ
         (SPADCALL (QREFELT $ 20) (SPADCALL |t| (QREFELT $ 17)) (QREFELT $ 92))
         (EXIT |t|))) 

(SDEFUN |VIEW3D;viewPhiDefault;F;14| (($ |Float|))
        (SPADCALL (SPADCALL (QREFELT $ 22) (QREFELT $ 89)) (QREFELT $ 90))) 

(SDEFUN |VIEW3D;viewPhiDefault;2F;15| ((|t| |Float|) ($ |Float|))
        (SEQ
         (SPADCALL (QREFELT $ 22) (SPADCALL |t| (QREFELT $ 17)) (QREFELT $ 92))
         (EXIT |t|))) 

(SDEFUN |VIEW3D;viewZoomDefault;F;16| (($ |Float|))
        (SPADCALL (SPADCALL (QREFELT $ 23) (QREFELT $ 89)) (QREFELT $ 90))) 

(SDEFUN |VIEW3D;viewZoomDefault;2F;17| ((|t| |Float|) ($ |Float|))
        (SEQ
         (SPADCALL (QREFELT $ 23) (SPADCALL |t| (QREFELT $ 17)) (QREFELT $ 92))
         (EXIT |t|))) 

(SDEFUN |VIEW3D;viewDeltaXDefault;F;18| (($ |Float|))
        (SPADCALL (SPADCALL (QREFELT $ 24) (QREFELT $ 89)) (QREFELT $ 90))) 

(SDEFUN |VIEW3D;viewDeltaXDefault;2F;19| ((|t| |Float|) ($ |Float|))
        (SEQ
         (SPADCALL (QREFELT $ 24) (SPADCALL |t| (QREFELT $ 17)) (QREFELT $ 92))
         (EXIT |t|))) 

(SDEFUN |VIEW3D;viewDeltaYDefault;F;20| (($ |Float|))
        (SPADCALL (SPADCALL (QREFELT $ 25) (QREFELT $ 89)) (QREFELT $ 90))) 

(SDEFUN |VIEW3D;viewDeltaYDefault;2F;21| ((|t| |Float|) ($ |Float|))
        (SEQ
         (SPADCALL (QREFELT $ 25) (SPADCALL |t| (QREFELT $ 17)) (QREFELT $ 92))
         (EXIT |t|))) 

(SDEFUN |VIEW3D;lighting;$3FV;22|
        ((|viewport| $) (|Xlight| |Float|) (|Ylight| |Float|)
         (|Zlight| |Float|) ($ |Void|))
        (SPROG ((#1=#:G247 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (QSETVELT (QVELT |viewport| 8) 0
                            (SPADCALL |Xlight| (QREFELT $ 17)))
                  (QSETVELT (QVELT |viewport| 8) 1
                            (SPADCALL |Ylight| (QREFELT $ 17)))
                  (QSETVELT (QVELT |viewport| 8) 2
                            (SPADCALL |Zlight| (QREFELT $ 17)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 102)) 0
                               (QREFELT $ 103))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 108)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 8) 0))
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 8) 1))
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 8) 2))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G245)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;axes;$SV;23| ((|viewport| $) (|onOff| |String|) ($ |Void|))
        (SPROG ((#1=#:G253 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQUAL |onOff| "on") (QSETVELT (QVELT |viewport| 7) 2 1))
                   ('T (QSETVELT (QVELT |viewport| 7) 2 0)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 102)) 0
                               (QREFELT $ 103))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 6)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    (QVELT (QVELT |viewport| 7)
                                                           2))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G251)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;diagonals;$SV;24|
        ((|viewport| $) (|onOff| |String|) ($ |Void|))
        (SPROG ((#1=#:G259 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQUAL |onOff| "on") (QSETVELT (QVELT |viewport| 7) 3 1))
                   ('T (QSETVELT (QVELT |viewport| 7) 3 0)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 102)) 0
                               (QREFELT $ 103))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 26)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    (QVELT (QVELT |viewport| 7)
                                                           3))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G257)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;outlineRender;$SV;25|
        ((|viewport| $) (|onOff| |String|) ($ |Void|))
        (SPROG ((#1=#:G265 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQUAL |onOff| "on") (QSETVELT (QVELT |viewport| 7) 4 1))
                   ('T (QSETVELT (QVELT |viewport| 7) 4 0)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 102)) 0
                               (QREFELT $ 103))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 13)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    (QVELT (QVELT |viewport| 7)
                                                           4))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G263)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;controlPanel;$SV;26|
        ((|viewport| $) (|onOff| |String|) ($ |Void|))
        (SPROG ((#1=#:G271 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQUAL |onOff| "on") (QSETVELT (QVELT |viewport| 7) 0 1))
                   ('T (QSETVELT (QVELT |viewport| 7) 0 0)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 102)) 0
                               (QREFELT $ 103))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 4)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    (QVELT (QVELT |viewport| 7)
                                                           0))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G269)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;drawStyle;$SV;27| ((|viewport| $) (|how| |String|) ($ |Void|))
        (SPROG ((#1=#:G276 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQUAL |how| "shade") (QSETVELT (QVELT |viewport| 7) 1 3))
                   ((EQUAL |how| "solid") (QSETVELT (QVELT |viewport| 7) 1 7))
                   ((EQUAL |how| "contour")
                    (QSETVELT (QVELT |viewport| 7) 1 24))
                   ((EQUAL |how| "smooth")
                    (QSETVELT (QVELT |viewport| 7) 1 22))
                   ('T (QSETVELT (QVELT |viewport| 7) 1 9)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 102)) 0
                               (QREFELT $ 103))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer|
                                                (QVELT (QVELT |viewport| 7) 1))
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (|sockGetInt| |$ViewportServer|))))))
                      (GO #2=#:G274)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;reset;$V;28| ((|viewport| $) ($ |Void|))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |viewport| (QREFELT $ 102)) 0 (QREFELT $ 103))
           (SEQ (|sockSendInt| |$ViewportServer| 1)
                (|sockSendInt| |$ViewportServer| 100)
                (EXIT
                 (COND
                  ((|VIEW3D;checkViewport| |viewport| $)
                   (SEQ (|sockSendInt| |$ViewportServer| 8)
                        (EXIT (|sockGetInt| |$ViewportServer|))))))))
          ('T (SPADCALL (QREFELT $ 110)))))) 

(SDEFUN |VIEW3D;close;$V;29| ((|viewport| $) ($ |Void|))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |viewport| (QREFELT $ 102)) 0 (QREFELT $ 103))
           (SEQ (|sockSendInt| |$ViewportServer| 1)
                (|sockSendInt| |$ViewportServer| 5)
                (EXIT
                 (COND
                  ((|VIEW3D;checkViewport| |viewport| $)
                   (SEQ (|sockGetInt| |$ViewportServer|)
                        (EXIT (QSETVELT |viewport| 0 0))))))))
          ('T (SPADCALL (QREFELT $ 110)))))) 

(SDEFUN |VIEW3D;viewpoint;$R;30|
        ((|viewport| $)
         ($ |Record| (|:| |theta| (|DoubleFloat|)) (|:| |phi| (|DoubleFloat|))
          (|:| |scale| (|DoubleFloat|)) (|:| |scaleX| (|DoubleFloat|))
          (|:| |scaleY| (|DoubleFloat|)) (|:| |scaleZ| (|DoubleFloat|))
          (|:| |deltaX| (|DoubleFloat|)) (|:| |deltaY| (|DoubleFloat|))))
        (SPROG
         ((|phi_sf| (|DoubleFloat|)) (|theta_sf| (|DoubleFloat|))
          (|scaleZ_sf| (|DoubleFloat|)) (|scaleY_sf| (|DoubleFloat|))
          (|scaleX_sf| (|DoubleFloat|)) (|scale_sf| (|DoubleFloat|))
          (|deltaY_sf| (|DoubleFloat|)) (|deltaX_sf| (|DoubleFloat|)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |viewport| (QREFELT $ 102)) 0 (QREFELT $ 103))
            (SEQ (|sockSendInt| |$ViewportServer| 1)
                 (|sockSendInt| |$ViewportServer| 117)
                 (EXIT
                  (COND
                   ((|VIEW3D;checkViewport| |viewport| $)
                    (SEQ (LETT |deltaX_sf| (|sockGetFloat| |$ViewportServer|))
                         (LETT |deltaY_sf| (|sockGetFloat| |$ViewportServer|))
                         (LETT |scale_sf| (|sockGetFloat| |$ViewportServer|))
                         (LETT |scaleX_sf| (|sockGetFloat| |$ViewportServer|))
                         (LETT |scaleY_sf| (|sockGetFloat| |$ViewportServer|))
                         (LETT |scaleZ_sf| (|sockGetFloat| |$ViewportServer|))
                         (LETT |theta_sf| (|sockGetFloat| |$ViewportServer|))
                         (LETT |phi_sf| (|sockGetFloat| |$ViewportServer|))
                         (|sockGetInt| |$ViewportServer|)
                         (EXIT
                          (QSETVELT |viewport| 5
                                    (VECTOR |theta_sf| |phi_sf| |scale_sf|
                                            |scaleX_sf| |scaleY_sf| |scaleZ_sf|
                                            |deltaX_sf| |deltaY_sf|)))))
                   (#1='T (QVELT |viewport| 5))))))
           (#1# (QVELT |viewport| 5)))))) 

(SDEFUN |VIEW3D;viewpoint;$RV;31|
        ((|viewport| $)
         (|viewpt| |Record| (|:| |theta| (|DoubleFloat|))
          (|:| |phi| (|DoubleFloat|)) (|:| |scale| (|DoubleFloat|))
          (|:| |scaleX| (|DoubleFloat|)) (|:| |scaleY| (|DoubleFloat|))
          (|:| |scaleZ| (|DoubleFloat|)) (|:| |deltaX| (|DoubleFloat|))
          (|:| |deltaY| (|DoubleFloat|)))
         ($ |Void|))
        (SPROG ((#1=#:G297 NIL))
               (SEQ
                (EXIT
                 (SEQ (QSETVELT |viewport| 5 |viewpt|)
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |viewport| (QREFELT $ 102)) 0
                                   (QREFELT $ 103))
                         (PROGN
                          (LETT #1#
                                (SEQ (|sockSendInt| |$ViewportServer| 1)
                                     (|sockSendInt| |$ViewportServer| 118)
                                     (EXIT
                                      (COND
                                       ((|VIEW3D;checkViewport| |viewport| $)
                                        (SEQ
                                         (|sockSendFloat| |$ViewportServer|
                                                          (QVELT
                                                           (QVELT |viewport| 5)
                                                           6))
                                         (|sockSendFloat| |$ViewportServer|
                                                          (QVELT
                                                           (QVELT |viewport| 5)
                                                           7))
                                         (|sockSendFloat| |$ViewportServer|
                                                          (QVELT
                                                           (QVELT |viewport| 5)
                                                           2))
                                         (|sockSendFloat| |$ViewportServer|
                                                          (QVELT
                                                           (QVELT |viewport| 5)
                                                           3))
                                         (|sockSendFloat| |$ViewportServer|
                                                          (QVELT
                                                           (QVELT |viewport| 5)
                                                           4))
                                         (|sockSendFloat| |$ViewportServer|
                                                          (QVELT
                                                           (QVELT |viewport| 5)
                                                           5))
                                         (|sockSendFloat| |$ViewportServer|
                                                          (QVELT
                                                           (QVELT |viewport| 5)
                                                           0))
                                         (|sockSendFloat| |$ViewportServer|
                                                          (QVELT
                                                           (QVELT |viewport| 5)
                                                           1))
                                         (EXIT
                                          (|sockGetInt|
                                           |$ViewportServer|))))))))
                          (GO #2=#:G295)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;viewpoint;$5FV;32|
        ((|viewport| $) (|Theta| |Float|) (|Phi| |Float|) (|Scale| |Float|)
         (|DeltaX| |Float|) (|DeltaY| |Float|) ($ |Void|))
        (QSETVELT |viewport| 5
                  (VECTOR (SPADCALL |Theta| (QREFELT $ 17))
                          (SPADCALL |Phi| (QREFELT $ 17))
                          (SPADCALL |Scale| (QREFELT $ 17)) 1.0 1.0 1.0
                          (SPADCALL |DeltaX| (QREFELT $ 17))
                          (SPADCALL |DeltaY| (QREFELT $ 17))))) 

(SDEFUN |VIEW3D;viewpoint;$2I3FV;33|
        ((|viewport| $) (|Theta| |Integer|) (|Phi| |Integer|) (|Scale| |Float|)
         (|DeltaX| |Float|) (|DeltaY| |Float|) ($ |Void|))
        (QSETVELT |viewport| 5
                  (VECTOR
                   (|mul_DF| (FLOAT |Theta| MOST-POSITIVE-DOUBLE-FLOAT)
                             (QREFELT $ 15))
                   (|mul_DF| (FLOAT |Phi| MOST-POSITIVE-DOUBLE-FLOAT)
                             (QREFELT $ 15))
                   (SPADCALL |Scale| (QREFELT $ 17)) 1.0 1.0 1.0
                   (SPADCALL |DeltaX| (QREFELT $ 17))
                   (SPADCALL |DeltaY| (QREFELT $ 17))))) 

(SDEFUN |VIEW3D;viewpoint;$2FV;34|
        ((|viewport| $) (|Theta| |Float|) (|Phi| |Float|) ($ |Void|))
        (SEQ
         (QSETVELT (QVELT |viewport| 5) 0 (SPADCALL |Theta| (QREFELT $ 17)))
         (EXIT
          (QSETVELT (QVELT |viewport| 5) 1 (SPADCALL |Phi| (QREFELT $ 17)))))) 

(SDEFUN |VIEW3D;viewpoint;$3FV;35|
        ((|viewport| $) (X |Float|) (Y |Float|) (Z |Float|) ($ |Void|))
        (SPROG ((|Phi| #1=(|Float|)) (|Theta| #1#) (R (|Float|)))
               (SEQ
                (COND
                 ((SPADCALL X (|spadConstant| $ 9) (QREFELT $ 118))
                  (COND
                   ((SPADCALL Y (|spadConstant| $ 9) (QREFELT $ 118))
                    (SEQ (LETT |Theta| (|spadConstant| $ 9))
                         (EXIT
                          (COND
                           ((SPADCALL Z (|spadConstant| $ 9) (QREFELT $ 119))
                            (LETT |Phi| (|spadConstant| $ 9)))
                           (#2='T (LETT |Phi| (SPADCALL (QREFELT $ 8))))))))
                   (#2#
                    (SEQ
                     (LETT |Theta|
                           (SPADCALL
                            (SPADCALL Y
                                      (LETT R
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL X X (QREFELT $ 120))
                                              (SPADCALL Y Y (QREFELT $ 120))
                                              (QREFELT $ 121))
                                             (QREFELT $ 122)))
                                      (QREFELT $ 13))
                            (QREFELT $ 123)))
                     (EXIT
                      (COND
                       ((SPADCALL Z (|spadConstant| $ 9) (QREFELT $ 118))
                        (LETT |Phi|
                              (SPADCALL (SPADCALL (QREFELT $ 8))
                                        (SPADCALL 2 (QREFELT $ 124))
                                        (QREFELT $ 13))))
                       (#2#
                        (LETT |Phi|
                              (SPADCALL (SPADCALL Z R (QREFELT $ 13))
                                        (QREFELT $ 125))))))))))
                 (#2#
                  (SEQ
                   (LETT |Theta|
                         (SPADCALL
                          (SPADCALL Y
                                    (LETT R
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL X X (QREFELT $ 120))
                                            (SPADCALL Y Y (QREFELT $ 120))
                                            (QREFELT $ 121))
                                           (QREFELT $ 122)))
                                    (QREFELT $ 13))
                          (QREFELT $ 123)))
                   (EXIT
                    (COND
                     ((SPADCALL Z (|spadConstant| $ 9) (QREFELT $ 118))
                      (LETT |Phi|
                            (SPADCALL (SPADCALL (QREFELT $ 8))
                                      (SPADCALL 2 (QREFELT $ 124))
                                      (QREFELT $ 13))))
                     (#2#
                      (LETT |Phi|
                            (SPADCALL (SPADCALL Z R (QREFELT $ 13))
                                      (QREFELT $ 125)))))))))
                (EXIT (SPADCALL |viewport| |Theta| |Phi| (QREFELT $ 126)))))) 

(SDEFUN |VIEW3D;title;$SV;36| ((|viewport| $) (|Title| |String|) ($ |Void|))
        (SPROG ((#1=#:G314 NIL))
               (SEQ
                (EXIT
                 (SEQ (QSETVELT |viewport| 2 |Title|)
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |viewport| (QREFELT $ 102)) 0
                                   (QREFELT $ 103))
                         (PROGN
                          (LETT #1#
                                (SEQ (|sockSendInt| |$ViewportServer| 1)
                                     (|sockSendInt| |$ViewportServer| 104)
                                     (EXIT
                                      (COND
                                       ((|VIEW3D;checkViewport| |viewport| $)
                                        (SEQ
                                         (|sockSendString| |$ViewportServer|
                                                           |Title|)
                                         (EXIT
                                          (|sockGetInt|
                                           |$ViewportServer|))))))))
                          (GO #2=#:G312)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;colorDef;$2CV;37|
        ((|viewport| $) (|HueOffset| |Color|) (|HueNumber| |Color|) ($ |Void|))
        (SPROG ((#1=#:G321 NIL) (|h| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (QSETVELT |viewport| 6
                            (CONS
                             (LETT |h| (SPADCALL |HueOffset| (QREFELT $ 130)))
                             (- (SPADCALL |HueNumber| (QREFELT $ 130)) |h|)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 102)) 0
                               (QREFELT $ 103))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 101)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    (SPADCALL |HueOffset|
                                                              (QREFELT $ 130)))
                                     (|sockSendInt| |$ViewportServer|
                                                    (SPADCALL |HueNumber|
                                                              (QREFELT $ 130)))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G319)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;dimensions;$2Nni2PiV;38|
        ((|viewport| $) (|ViewX| |NonNegativeInteger|)
         (|ViewY| |NonNegativeInteger|) (|ViewWidth| |PositiveInteger|)
         (|ViewHeight| |PositiveInteger|) ($ |Void|))
        (SEQ (QSETVELT |viewport| 3 (CONS |ViewX| |ViewY|))
             (EXIT (QSETVELT |viewport| 4 (CONS |ViewWidth| |ViewHeight|))))) 

(SDEFUN |VIEW3D;move;$2NniV;39|
        ((|viewport| $) (|xLoc| |NonNegativeInteger|)
         (|yLoc| |NonNegativeInteger|) ($ |Void|))
        (SPROG ((#1=#:G332 NIL))
               (SEQ
                (EXIT
                 (SEQ (QSETVELT |viewport| 3 (CONS |xLoc| |yLoc|))
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |viewport| (QREFELT $ 102)) 0
                                   (QREFELT $ 103))
                         (PROGN
                          (LETT #1#
                                (SEQ (|sockSendInt| |$ViewportServer| 1)
                                     (|sockSendInt| |$ViewportServer| 102)
                                     (EXIT
                                      (COND
                                       ((|VIEW3D;checkViewport| |viewport| $)
                                        (SEQ
                                         (|sockSendInt| |$ViewportServer|
                                                        |xLoc|)
                                         (|sockSendInt| |$ViewportServer|
                                                        |yLoc|)
                                         (EXIT
                                          (|sockGetInt|
                                           |$ViewportServer|))))))))
                          (GO #2=#:G330)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;resize;$2PiV;40|
        ((|viewport| $) (|xSize| |PositiveInteger|) (|ySize| |PositiveInteger|)
         ($ |Void|))
        (SPROG ((#1=#:G339 NIL))
               (SEQ
                (EXIT
                 (SEQ (QSETVELT |viewport| 4 (CONS |xSize| |ySize|))
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |viewport| (QREFELT $ 102)) 0
                                   (QREFELT $ 103))
                         (PROGN
                          (LETT #1#
                                (SEQ (|sockSendInt| |$ViewportServer| 1)
                                     (|sockSendInt| |$ViewportServer| 103)
                                     (EXIT
                                      (COND
                                       ((|VIEW3D;checkViewport| |viewport| $)
                                        (SEQ
                                         (|sockSendInt| |$ViewportServer|
                                                        |xSize|)
                                         (|sockSendInt| |$ViewportServer|
                                                        |ySize|)
                                         (EXIT
                                          (|sockGetInt|
                                           |$ViewportServer|))))))))
                          (GO #2=#:G337)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;coerce;$Of;41| ((|viewport| $) ($ |OutputForm|))
        (COND
         ((EQL (SPADCALL |viewport| (QREFELT $ 102)) 0)
          (SPADCALL
           (LIST
            (SPADCALL "Closed or Undefined ThreeDimensionalViewport: "
                      (QREFELT $ 136))
            (SPADCALL (QVELT |viewport| 2) (QREFELT $ 137)))
           (QREFELT $ 139)))
         ('T
          (SPADCALL
           (LIST (SPADCALL "ThreeDimensionalViewport: " (QREFELT $ 136))
                 (SPADCALL (QVELT |viewport| 2) (QREFELT $ 137)))
           (QREFELT $ 139))))) 

(PUT '|VIEW3D;key;$I;42| '|SPADreplace|
     '(XLAM (|viewport|) (QVELT |viewport| 0))) 

(SDEFUN |VIEW3D;key;$I;42| ((|viewport| $) ($ |Integer|)) (QVELT |viewport| 0)) 

(SDEFUN |VIEW3D;rotate;$2IV;43|
        ((|viewport| $) (|Theta| |Integer|) (|Phi| |Integer|) ($ |Void|))
        (SPADCALL |viewport|
                  (SPADCALL (SPADCALL |Theta| (QREFELT $ 124)) (QREFELT $ 14)
                            (QREFELT $ 120))
                  (SPADCALL (SPADCALL |Phi| (QREFELT $ 124)) (QREFELT $ 14)
                            (QREFELT $ 120))
                  (QREFELT $ 126))) 

(SDEFUN |VIEW3D;rotate;$2FV;44|
        ((|viewport| $) (|Theta| |Float|) (|Phi| |Float|) ($ |Void|))
        (SPROG ((#1=#:G350 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (QSETVELT (QVELT |viewport| 5) 0
                            (SPADCALL |Theta| (QREFELT $ 17)))
                  (QSETVELT (QVELT |viewport| 5) 1
                            (SPADCALL |Phi| (QREFELT $ 17)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 102)) 0
                               (QREFELT $ 103))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 0)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 5) 0))
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 5) 1))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G348)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;zoom;$FV;45| ((|viewport| $) (|Scale| |Float|) ($ |Void|))
        (SPROG ((#1=#:G356 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (QSETVELT (QVELT |viewport| 5) 2
                            (SPADCALL |Scale| (QREFELT $ 17)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 102)) 0
                               (QREFELT $ 103))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 1)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 5) 2))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G354)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;zoom;$3FV;46|
        ((|viewport| $) (|ScaleX| |Float|) (|ScaleY| |Float|)
         (|ScaleZ| |Float|) ($ |Void|))
        (SPROG ((#1=#:G362 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (QSETVELT (QVELT |viewport| 5) 3
                            (SPADCALL |ScaleX| (QREFELT $ 17)))
                  (QSETVELT (QVELT |viewport| 5) 4
                            (SPADCALL |ScaleY| (QREFELT $ 17)))
                  (QSETVELT (QVELT |viewport| 5) 5
                            (SPADCALL |ScaleZ| (QREFELT $ 17)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 102)) 0
                               (QREFELT $ 103))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 14)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 5) 3))
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 5) 4))
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 5) 5))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G360)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;translate;$2FV;47|
        ((|viewport| $) (|DeltaX| |Float|) (|DeltaY| |Float|) ($ |Void|))
        (SPROG ((#1=#:G368 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (QSETVELT (QVELT |viewport| 5) 6
                            (SPADCALL |DeltaX| (QREFELT $ 17)))
                  (QSETVELT (QVELT |viewport| 5) 7
                            (SPADCALL |DeltaY| (QREFELT $ 17)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 102)) 0
                               (QREFELT $ 103))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 2)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 5) 6))
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 5) 7))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G366)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;intensity;$FV;48|
        ((|viewport| $) (|Amount| |Float|) ($ |Void|))
        (SPROG ((#1=#:G376 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((OR
                     (SPADCALL |Amount| (|spadConstant| $ 9) (QREFELT $ 145))
                     (SPADCALL |Amount| (|spadConstant| $ 79) (QREFELT $ 146)))
                    (|error|
                     "The intensity must be a value between 0 and 1, inclusively.")))
                  (QSETVELT (QVELT |viewport| 8) 5
                            (SPADCALL |Amount| (QREFELT $ 17)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 102)) 0
                               (QREFELT $ 103))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 109)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 8) 5))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G374)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;write;$3S;49|
        ((|viewport| $) (|Filename| |String|) (|aThingToWrite| |String|)
         ($ |String|))
        (SPADCALL |viewport| |Filename| (LIST |aThingToWrite|) (QREFELT $ 149))) 

(SDEFUN |VIEW3D;write;$2S;50|
        ((|viewport| $) (|Filename| |String|) ($ |String|))
        (SPADCALL |viewport| |Filename| (SPADCALL (QREFELT $ 151))
                  (QREFELT $ 149))) 

(SDEFUN |VIEW3D;write;$SLS;51|
        ((|viewport| $) (|Filename| |String|)
         (|thingsToWrite| |List| (|String|)) ($ |String|))
        (SPROG
         ((#1=#:G389 NIL) (|writeTypeInt| (|Integer|)) (#2=#:G390 NIL)
          (|aTypeOfFile| NIL) (|m| (|Integer|)) (|avail| (|List| (|String|)))
          (|stringToSend| (|String|)))
         (SEQ
          (EXIT
           (SEQ (LETT |stringToSend| "")
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |viewport| (QREFELT $ 102)) 0
                             (QREFELT $ 103))
                   (PROGN
                    (LETT #1#
                          (SEQ (|sockSendInt| |$ViewportServer| 1)
                               (|sockSendInt| |$ViewportServer| 110)
                               (EXIT
                                (COND
                                 ((|VIEW3D;checkViewport| |viewport| $)
                                  (SEQ
                                   (|sockSendString| |$ViewportServer|
                                                     |Filename|)
                                   (LETT |m|
                                         (SPADCALL
                                          (LETT |avail|
                                                (SPADCALL (QREFELT $ 153)))
                                          (QREFELT $ 154)))
                                   (SEQ (LETT |aTypeOfFile| NIL)
                                        (LETT #2# |thingsToWrite|) G190
                                        (COND
                                         ((OR (ATOM #2#)
                                              (PROGN
                                               (LETT |aTypeOfFile| (CAR #2#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (LETT |writeTypeInt|
                                               (-
                                                (SPADCALL
                                                 (SPADCALL |aTypeOfFile|
                                                           (QREFELT $ 155))
                                                 |avail| (QREFELT $ 156))
                                                |m|))
                                         (EXIT
                                          (COND
                                           ((< |writeTypeInt| 0)
                                            (SPADCALL
                                             (LIST "  > " |aTypeOfFile|
                                                   " is not a valid file type for writing a 3D viewport")
                                             (QREFELT $ 157)))
                                           ('T
                                            (|sockSendInt| |$ViewportServer|
                                                           (+ |writeTypeInt|
                                                              1))))))
                                        (LETT #2# (CDR #2#)) (GO G190) G191
                                        (EXIT NIL))
                                   (|sockSendInt| |$ViewportServer| 0)
                                   (|sockGetInt| |$ViewportServer|)
                                   (EXIT |Filename|)))))))
                    (GO #3=#:G387)))))))
          #3# (EXIT #1#)))) 

(SDEFUN |VIEW3D;perspective;$SV;52|
        ((|viewport| $) (|onOff| |String|) ($ |Void|))
        (SPROG ((#1=#:G396 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQUAL |onOff| "on") (QSETVELT (QVELT |viewport| 9) 0 1))
                   ('T (QSETVELT (QVELT |viewport| 9) 0 0)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 102)) 0
                               (QREFELT $ 103))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 27)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    (QVELT (QVELT |viewport| 9)
                                                           0))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G394)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;showRegion;$SV;53|
        ((|viewport| $) (|onOff| |String|) ($ |Void|))
        (SPROG ((#1=#:G402 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQUAL |onOff| "on") (QSETVELT (QVELT |viewport| 7) 5 1))
                   ('T (QSETVELT (QVELT |viewport| 7) 5 0)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 102)) 0
                               (QREFELT $ 103))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 12)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    (QVELT (QVELT |viewport| 7)
                                                           5))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G400)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;showClipRegion;$SV;54|
        ((|viewport| $) (|onOff| |String|) ($ |Void|))
        (SPROG ((#1=#:G408 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQUAL |onOff| "on") (QSETVELT (QVELT |viewport| 10) 6 1))
                   ('T (QSETVELT (QVELT |viewport| 10) 6 0)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 102)) 0
                               (QREFELT $ 103))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 66)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    (QVELT
                                                     (QVELT |viewport| 10) 6))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G406)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;clipSurface;$SV;55|
        ((|viewport| $) (|onOff| |String|) ($ |Void|))
        (SPROG ((#1=#:G414 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQUAL |onOff| "on") (QSETVELT (QVELT |viewport| 10) 7 1))
                   ('T (QSETVELT (QVELT |viewport| 10) 7 0)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 102)) 0
                               (QREFELT $ 103))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 67)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendInt| |$ViewportServer|
                                                    (QVELT
                                                     (QVELT |viewport| 10) 7))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G412)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;eyeDistance;$FV;56|
        ((|viewport| $) (|EyeDistance| |Float|) ($ |Void|))
        (SPROG ((#1=#:G420 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (QSETVELT (QVELT |viewport| 9) 1
                            (SPADCALL |EyeDistance| (QREFELT $ 17)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 102)) 0
                               (QREFELT $ 103))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 111)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 9) 1))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G418)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;hitherPlane;$FV;57|
        ((|viewport| $) (|HitherPlane| |Float|) ($ |Void|))
        (SPROG ((#1=#:G426 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (QSETVELT (QVELT |viewport| 9) 2
                            (SPADCALL |HitherPlane| (QREFELT $ 17)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |viewport| (QREFELT $ 102)) 0
                               (QREFELT $ 103))
                     (PROGN
                      (LETT #1#
                            (SEQ (|sockSendInt| |$ViewportServer| 1)
                                 (|sockSendInt| |$ViewportServer| 116)
                                 (EXIT
                                  (COND
                                   ((|VIEW3D;checkViewport| |viewport| $)
                                    (SEQ
                                     (|sockSendFloat| |$ViewportServer|
                                                      (QVELT
                                                       (QVELT |viewport| 9) 2))
                                     (EXIT
                                      (|sockGetInt| |$ViewportServer|))))))))
                      (GO #2=#:G424)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |VIEW3D;modifyPointData;$NniPV;58|
        ((|viewport| $) (|anIndex| |NonNegativeInteger|)
         (|aPoint| |Point| (|DoubleFloat|)) ($ |Void|))
        (SPROG ((#1=#:G433 NIL) (|n| (|PositiveInteger|)))
               (SEQ (LETT |n| (SPADCALL |aPoint| (QREFELT $ 73)))
                    (EXIT
                     (COND
                      ((< |n| 3)
                       (|error|
                        "The point should have dimension of at least 3"))
                      (#2='T
                       (SEQ
                        (EXIT
                         (SEQ
                          (QSETVELT |viewport| 11
                                    (SPADCALL (QVELT |viewport| 11) |anIndex|
                                              |aPoint| (QREFELT $ 164)))
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |viewport| (QREFELT $ 102)) 0
                                       (QREFELT $ 103))
                             (PROGN
                              (LETT #1#
                                    (SEQ (|sockSendInt| |$ViewportServer| 1)
                                         (|sockSendInt| |$ViewportServer| 114)
                                         (EXIT
                                          (COND
                                           ((|VIEW3D;checkViewport| |viewport|
                                             $)
                                            (SEQ
                                             (|sockSendInt| |$ViewportServer|
                                                            |anIndex|)
                                             (|sockSendFloat| |$ViewportServer|
                                                              (SPADCALL
                                                               |aPoint|
                                                               (QREFELT $ 81)))
                                             (|sockSendFloat| |$ViewportServer|
                                                              (SPADCALL
                                                               |aPoint|
                                                               (QREFELT $ 82)))
                                             (|sockSendFloat| |$ViewportServer|
                                                              (SPADCALL
                                                               |aPoint|
                                                               (QREFELT $ 83)))
                                             (COND
                                              ((EQL |n| 3)
                                               (|sockSendFloat|
                                                |$ViewportServer|
                                                (SPADCALL
                                                 (SPADCALL 5 -1 10
                                                           (QREFELT $ 12))
                                                 (QREFELT $ 17))))
                                              (#2#
                                               (|sockSendFloat|
                                                |$ViewportServer|
                                                (SPADCALL |aPoint|
                                                          (QREFELT $ 84)))))
                                             (EXIT
                                              (|sockGetInt|
                                               |$ViewportServer|))))))))
                              (GO #3=#:G430)))))))
                        #3# (EXIT #1#)))))))) 

(DECLAIM (NOTINLINE |ThreeDimensionalViewport;|)) 

(DEFUN |ThreeDimensionalViewport| ()
  (SPROG NIL
         (PROG (#1=#:G435)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ThreeDimensionalViewport|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ThreeDimensionalViewport|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|ThreeDimensionalViewport;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|ThreeDimensionalViewport|)))))))))) 

(DEFUN |ThreeDimensionalViewport;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|ThreeDimensionalViewport|))
          (LETT $ (GETREFV 168))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ThreeDimensionalViewport| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |key| (|Integer|)) (|:| |fun| (|Integer|))
                              (|:| |title| (|String|))
                              (|:| |moveTo|
                                   (|Record| (|:| X (|NonNegativeInteger|))
                                             (|:| Y (|NonNegativeInteger|))))
                              (|:| |size|
                                   (|Record| (|:| X (|PositiveInteger|))
                                             (|:| Y (|PositiveInteger|))))
                              (|:| |viewpoint|
                                   (|Record| (|:| |theta| (|DoubleFloat|))
                                             (|:| |phi| (|DoubleFloat|))
                                             (|:| |scale| (|DoubleFloat|))
                                             (|:| |scaleX| (|DoubleFloat|))
                                             (|:| |scaleY| (|DoubleFloat|))
                                             (|:| |scaleZ| (|DoubleFloat|))
                                             (|:| |deltaX| (|DoubleFloat|))
                                             (|:| |deltaY| (|DoubleFloat|))))
                              (|:| |colors|
                                   (|Record| (|:| |hueOffset| (|Integer|))
                                             (|:| |hueNumber| (|Integer|))))
                              (|:| |flags|
                                   (|Record| (|:| |showCP| (|Integer|))
                                             (|:| |style| (|Integer|))
                                             (|:| |axesOn| (|Integer|))
                                             (|:| |diagonalsOn| (|Integer|))
                                             (|:| |outlineRenderOn|
                                                  (|Integer|))
                                             (|:| |showRegionField|
                                                  (|Integer|))))
                              (|:| |lighting|
                                   (|Record| (|:| |lightX| (|DoubleFloat|))
                                             (|:| |lightY| (|DoubleFloat|))
                                             (|:| |lightZ| (|DoubleFloat|))
                                             (|:| |lightTheta| (|DoubleFloat|))
                                             (|:| |lightPhi| (|DoubleFloat|))
                                             (|:| |translucence|
                                                  (|DoubleFloat|))))
                              (|:| |perspective|
                                   (|Record|
                                    (|:| |perspectiveField| (|Integer|))
                                    (|:| |eyeDistance| (|DoubleFloat|))
                                    (|:| |hitherPlane| (|DoubleFloat|))))
                              (|:| |volume|
                                   (|Record| (|:| |clipXMin| (|DoubleFloat|))
                                             (|:| |clipXMax| (|DoubleFloat|))
                                             (|:| |clipYMin| (|DoubleFloat|))
                                             (|:| |clipYMax| (|DoubleFloat|))
                                             (|:| |clipZMin| (|DoubleFloat|))
                                             (|:| |clipZMax| (|DoubleFloat|))
                                             (|:| |clipRegionField|
                                                  (|Integer|))
                                             (|:| |clipSurfaceField|
                                                  (|Integer|))))
                              (|:| |space3D| (|ThreeSpace| (|DoubleFloat|)))
                              (|:| |optionsField| (|List| (|DrawOption|)))))
          (QSETREFV $ 14
                    (SPADCALL (SPADCALL (QREFELT $ 8))
                              (SPADCALL 180 0 10 (QREFELT $ 12))
                              (QREFELT $ 13)))
          (QSETREFV $ 15
                    (|div_DF_I| (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT) 180))
          (QSETREFV $ 20
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL (QREFELT $ 8))
                                (SPADCALL 4 0 10 (QREFELT $ 12))
                                (QREFELT $ 13))
                      (QREFELT $ 17))
                     (QREFELT $ 19)))
          (QSETREFV $ 22
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL (QREFELT $ 8))
                                 (SPADCALL 4 0 10 (QREFELT $ 12))
                                 (QREFELT $ 13))
                       (QREFELT $ 21))
                      (QREFELT $ 17))
                     (QREFELT $ 19)))
          (QSETREFV $ 23
                    (SPADCALL
                     (SPADCALL (SPADCALL 12 -1 10 (QREFELT $ 12))
                               (QREFELT $ 17))
                     (QREFELT $ 19)))
          (QSETREFV $ 24 (SPADCALL 0.0 (QREFELT $ 19)))
          (QSETREFV $ 25 (SPADCALL 0.0 (QREFELT $ 19)))
          $))) 

(MAKEPROP '|ThreeDimensionalViewport| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Float|) (0 . |pi|) (4 . |Zero|)
              (|Integer|) (|PositiveInteger|) (8 . |float|) (15 . /) '|degrees|
              '|degreesSF| (|DoubleFloat|) (21 . |convert|) (|Reference| 16)
              (26 . |ref|) '|defaultTheta| (31 . -) '|defaultPhi|
              '|defaultZoom| '|defaultDeltaX| '|defaultDeltaY| (|String|)
              (|List| 50) (|DrawOptionFunctions0|) (36 . |title|)
              (42 . |style|) (48 . |deref|)
              (|Record| (|:| |theta| 16) (|:| |phi| 16) (|:| |scale| 16)
                        (|:| |scaleX| 16) (|:| |scaleY| 16) (|:| |scaleZ| 16)
                        (|:| |deltaX| 16) (|:| |deltaY| 16))
              (53 . |viewpoint|) (|List| 37) (|ViewDefaultsPackage|)
              (59 . |viewPosDefault|) (|NonNegativeInteger|) (63 . |elt|)
              (|List| 11) (69 . |viewSizeDefault|) (73 . |elt|)
              (|ThreeSpace| 16) (79 . |create3Space|) |VIEW3D;viewport3D;$;3|
              |VIEW3D;subspace;$Ts;4| |VIEW3D;subspace;$Ts$;5|
              |VIEW3D;options;$L;6| |VIEW3D;options;$L$;7|
              |VIEW3D;makeViewport3D;2$;8| (|DrawOption|) (83 . |title|)
              |VIEW3D;makeViewport3D;TsS$;9| |VIEW3D;makeViewport3D;TsL$;10|
              (|Void|) (|DisplayPackage|) (88 . |say|) (|Point| 16)
              (|CoordinateSystems| 16) (93 . |cartesian|) (|Mapping| 57 57)
              (98 . |coord|) (104 . |check|) (|List| 57) (109 . |lp|)
              (|List| (|List| 34)) (114 . |lllip|) (|List| 69) (119 . |llprop|)
              (|List| 85) (124 . |lprop|) (|Set| 11) (129 . |empty|)
              (133 . |dimension|) (138 . |insert!|) (144 . |#|) (|Boolean|)
              (149 . >) (155 . |parts|) (160 . |One|) (|PointPackage| 16)
              (164 . |xCoord|) (169 . |yCoord|) (174 . |zCoord|)
              (179 . |color|) (|SubSpaceComponentProperty|) (184 . |closed?|)
              (189 . |solid?|) (194 . |#|) (199 . |elt|) (204 . |convert|)
              |VIEW3D;viewThetaDefault;F;12| (209 . |setelt!|)
              |VIEW3D;viewThetaDefault;2F;13| |VIEW3D;viewPhiDefault;F;14|
              |VIEW3D;viewPhiDefault;2F;15| |VIEW3D;viewZoomDefault;F;16|
              |VIEW3D;viewZoomDefault;2F;17| |VIEW3D;viewDeltaXDefault;F;18|
              |VIEW3D;viewDeltaXDefault;2F;19| |VIEW3D;viewDeltaYDefault;F;20|
              |VIEW3D;viewDeltaYDefault;2F;21| |VIEW3D;key;$I;42| (215 . ~=)
              |VIEW3D;lighting;$3FV;22| |VIEW3D;axes;$SV;23|
              |VIEW3D;diagonals;$SV;24| |VIEW3D;outlineRender;$SV;25|
              |VIEW3D;controlPanel;$SV;26| |VIEW3D;drawStyle;$SV;27|
              (221 . |void|) |VIEW3D;reset;$V;28| |VIEW3D;close;$V;29|
              |VIEW3D;viewpoint;$R;30| |VIEW3D;viewpoint;$RV;31|
              |VIEW3D;viewpoint;$5FV;32| |VIEW3D;viewpoint;$2I3FV;33|
              |VIEW3D;viewpoint;$2FV;34| (225 . =) (231 . >=) (237 . *)
              (243 . +) (249 . |sqrt|) (254 . |asin|) (259 . |coerce|)
              (264 . |atan|) |VIEW3D;rotate;$2FV;44| |VIEW3D;viewpoint;$3FV;35|
              |VIEW3D;title;$SV;36| (|Color|) (269 . |hue|)
              |VIEW3D;colorDef;$2CV;37| |VIEW3D;dimensions;$2Nni2PiV;38|
              |VIEW3D;move;$2NniV;39| |VIEW3D;resize;$2PiV;40| (|OutputForm|)
              (274 . |message|) (279 . |coerce|) (|List| $) (284 . |hconcat|)
              |VIEW3D;coerce;$Of;41| |VIEW3D;rotate;$2IV;43|
              |VIEW3D;zoom;$FV;45| |VIEW3D;zoom;$3FV;46|
              |VIEW3D;translate;$2FV;47| (289 . <) (295 . >)
              |VIEW3D;intensity;$FV;48| (|List| 26) |VIEW3D;write;$SLS;51|
              |VIEW3D;write;$3S;49| (301 . |viewWriteDefault|)
              |VIEW3D;write;$2S;50| (305 . |viewWriteAvailable|)
              (309 . |minIndex|) (314 . |upperCase|) (319 . |position|)
              (325 . |say|) |VIEW3D;perspective;$SV;52|
              |VIEW3D;showRegion;$SV;53| |VIEW3D;showClipRegion;$SV;54|
              |VIEW3D;clipSurface;$SV;55| |VIEW3D;eyeDistance;$FV;56|
              |VIEW3D;hitherPlane;$FV;57| (330 . |modifyPointData|)
              |VIEW3D;modifyPointData;$NniPV;58| (|HashState|)
              (|SingleInteger|))
           '#(~= 337 |zoom| 343 |write| 357 |viewport3D| 377 |viewpoint| 381
              |viewZoomDefault| 427 |viewThetaDefault| 436 |viewPhiDefault| 445
              |viewDeltaYDefault| 454 |viewDeltaXDefault| 463 |translate| 472
              |title| 479 |subspace| 485 |showRegion| 496 |showClipRegion| 502
              |rotate| 508 |resize| 522 |reset| 529 |perspective| 534
              |outlineRender| 540 |options| 546 |move| 557 |modifyPointData|
              564 |makeViewport3D| 571 |lighting| 588 |latex| 596 |key| 601
              |intensity| 606 |hitherPlane| 612 |hashUpdate!| 618 |hash| 624
              |eyeDistance| 629 |drawStyle| 635 |dimensions| 641 |diagonals|
              650 |controlPanel| 656 |colorDef| 662 |coerce| 669 |close| 674
              |clipSurface| 679 |axes| 685 = 691)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 135))
                        (|makeByteWordVec2| 167
                                            '(0 7 0 8 0 7 0 9 3 7 0 10 10 11 12
                                              2 7 0 0 0 13 1 7 16 0 17 1 18 0
                                              16 19 1 7 0 0 21 2 28 26 27 26 29
                                              2 28 26 27 26 30 1 18 16 0 31 2
                                              28 32 27 32 33 0 35 34 36 2 34 37
                                              0 10 38 0 35 39 40 2 39 11 0 10
                                              41 0 42 0 43 1 50 0 26 51 1 55 54
                                              26 56 1 58 57 57 59 2 28 60 27 60
                                              61 1 42 0 0 62 1 42 63 0 64 1 42
                                              65 0 66 1 42 67 0 68 1 42 69 0 70
                                              0 71 0 72 1 57 11 0 73 2 71 0 11
                                              0 74 1 71 37 0 75 2 37 76 0 0 77
                                              1 71 39 0 78 0 7 0 79 1 80 16 57
                                              81 1 80 16 57 82 1 80 16 57 83 1
                                              80 16 57 84 1 85 76 0 86 1 85 76
                                              0 87 1 34 37 0 88 1 18 16 0 89 1
                                              7 0 16 90 2 18 16 0 16 92 2 10 76
                                              0 0 103 0 54 0 110 2 7 76 0 0 118
                                              2 7 76 0 0 119 2 7 0 0 0 120 2 7
                                              0 0 0 121 1 7 0 0 122 1 7 0 0 123
                                              1 7 0 10 124 1 7 0 0 125 1 129 10
                                              0 130 1 135 0 26 136 1 26 135 0
                                              137 1 135 0 138 139 2 7 76 0 0
                                              145 2 7 76 0 0 146 0 35 148 151 0
                                              35 148 153 1 148 10 0 154 1 26 0
                                              0 155 2 148 10 26 0 156 1 55 54
                                              148 157 3 42 0 0 37 57 164 2 0 76
                                              0 0 1 2 0 54 0 7 142 4 0 54 0 7 7
                                              7 143 3 0 26 0 26 148 149 2 0 26
                                              0 26 152 3 0 26 0 26 26 150 0 0 0
                                              44 4 0 54 0 7 7 7 127 6 0 54 0 10
                                              10 7 7 7 116 3 0 54 0 7 7 117 1 0
                                              32 0 113 2 0 54 0 32 114 6 0 54 0
                                              7 7 7 7 7 115 0 0 7 96 1 0 7 7 97
                                              0 0 7 91 1 0 7 7 93 0 0 7 94 1 0
                                              7 7 95 1 0 7 7 101 0 0 7 100 0 0
                                              7 98 1 0 7 7 99 3 0 54 0 7 7 144
                                              2 0 54 0 26 128 2 0 0 0 42 46 1 0
                                              42 0 45 2 0 54 0 26 159 2 0 54 0
                                              26 160 3 0 54 0 7 7 126 3 0 54 0
                                              10 10 141 3 0 54 0 11 11 134 1 0
                                              54 0 111 2 0 54 0 26 158 2 0 54 0
                                              26 107 1 0 27 0 47 2 0 0 0 27 48
                                              3 0 54 0 37 37 133 3 0 54 0 37 57
                                              165 2 0 0 42 27 53 1 0 0 0 49 2 0
                                              0 42 26 52 4 0 54 0 7 7 7 104 1 0
                                              26 0 1 1 0 10 0 102 2 0 54 0 7
                                              147 2 0 54 0 7 163 2 0 166 166 0
                                              1 1 0 167 0 1 2 0 54 0 7 162 2 0
                                              54 0 26 109 5 0 54 0 37 37 11 11
                                              132 2 0 54 0 26 106 2 0 54 0 26
                                              108 3 0 54 0 129 129 131 1 0 135
                                              0 140 1 0 54 0 112 2 0 54 0 26
                                              161 2 0 54 0 26 105 2 0 76 0 0
                                              1)))))
           '|lookupComplete|)) 

(MAKEPROP '|ThreeDimensionalViewport| 'NILADIC T) 
