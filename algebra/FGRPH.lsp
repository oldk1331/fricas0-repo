
(/VERSIONCHECK 2) 

(DEFPARAMETER |FiniteGraph;CAT| 'NIL) 

(DEFPARAMETER |FiniteGraph;AL| 'NIL) 

(DEFUN |FiniteGraph| (#1=#:G180)
  (LET (#2=#:G181)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |FiniteGraph;AL|)) (CDR #2#))
     (T
      (SETQ |FiniteGraph;AL|
              (|cons5| (CONS #3# (SETQ #2# (|FiniteGraph;| #1#)))
                       |FiniteGraph;AL|))
      #2#)))) 

(DEFUN |FiniteGraph;| (|t#1|)
  (PROG (#1=#:G179)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                          (|sublisV| (PAIR '(#2=#:G178) (LIST '(|OutputForm|)))
                                     (COND (|FiniteGraph;CAT|)
                                           ('T
                                            (LETT |FiniteGraph;CAT|
                                                  (|Join| (|CoercibleTo| '#2#)
                                                          (|SetCategory|)
                                                          (|mkCategory|
                                                           '(((|addObject!|
                                                               ($ $ |t#1|))
                                                              T)
                                                             ((|addObject!|
                                                               ($ $
                                                                (|Record|
                                                                 (|:| |value|
                                                                      |t#1|)
                                                                 (|:| |posX|
                                                                      (|NonNegativeInteger|))
                                                                 (|:| |posY|
                                                                      (|NonNegativeInteger|)))))
                                                              T)
                                                             ((|addArrow!|
                                                               ($ $ (|String|)
                                                                (|NonNegativeInteger|)
                                                                (|NonNegativeInteger|)))
                                                              T)
                                                             ((|addArrow!|
                                                               ($ $ (|String|)
                                                                |t#1| |t#1|))
                                                              T)
                                                             ((|getVertices|
                                                               ((|List|
                                                                 (|Record|
                                                                  (|:| |value|
                                                                       |t#1|)
                                                                  (|:| |posX|
                                                                       (|NonNegativeInteger|))
                                                                  (|:| |posY|
                                                                       (|NonNegativeInteger|))))
                                                                $))
                                                              T)
                                                             ((|getVertexIndex|
                                                               ((|NonNegativeInteger|)
                                                                $ |t#1|))
                                                              T)
                                                             ((|getArrows|
                                                               ((|List|
                                                                 (|Record|
                                                                  (|:| |name|
                                                                       (|String|))
                                                                  (|:|
                                                                   |arrType|
                                                                   (|NonNegativeInteger|))
                                                                  (|:| |fromOb|
                                                                       (|NonNegativeInteger|))
                                                                  (|:| |toOb|
                                                                       (|NonNegativeInteger|))
                                                                  (|:|
                                                                   |xOffset|
                                                                   (|Integer|))
                                                                  (|:|
                                                                   |yOffset|
                                                                   (|Integer|))))
                                                                $))
                                                              T)
                                                             ((|initial| ($))
                                                              T)
                                                             ((|terminal|
                                                               ($ |t#1|))
                                                              T)
                                                             ((|cycleOpen|
                                                               ($
                                                                (|List| |t#1|)
                                                                (|String|)))
                                                              T)
                                                             ((|cycleClosed|
                                                               ($
                                                                (|List| |t#1|)
                                                                (|String|)))
                                                              T)
                                                             ((|unit|
                                                               ($
                                                                (|List| |t#1|)
                                                                (|String|)))
                                                              T)
                                                             ((|kgraph|
                                                               ($
                                                                (|List| |t#1|)
                                                                (|String|)))
                                                              T)
                                                             ((|isDirectSuccessor?|
                                                               ((|Boolean|) $
                                                                (|NonNegativeInteger|)
                                                                (|NonNegativeInteger|)))
                                                              T)
                                                             ((|isGreaterThan?|
                                                               ((|Boolean|) $
                                                                (|NonNegativeInteger|)
                                                                (|NonNegativeInteger|)))
                                                              T)
                                                             ((|max|
                                                               ((|NonNegativeInteger|)
                                                                $))
                                                              T)
                                                             ((|max|
                                                               ((|NonNegativeInteger|)
                                                                $
                                                                (|List|
                                                                 (|NonNegativeInteger|))))
                                                              T)
                                                             ((|min|
                                                               ((|NonNegativeInteger|)
                                                                $))
                                                              T)
                                                             ((|min|
                                                               ((|NonNegativeInteger|)
                                                                $
                                                                (|List|
                                                                 (|NonNegativeInteger|))))
                                                              T)
                                                             ((|isFixPoint?|
                                                               ((|Boolean|) $
                                                                (|NonNegativeInteger|)))
                                                              T)
                                                             ((|arrowName|
                                                               ((|String|) $
                                                                (|NonNegativeInteger|)
                                                                (|NonNegativeInteger|)))
                                                              T)
                                                             ((|getArrowIndex|
                                                               ((|NonNegativeInteger|)
                                                                $
                                                                (|NonNegativeInteger|)
                                                                (|NonNegativeInteger|)))
                                                              T)
                                                             ((|inDegree|
                                                               ((|NonNegativeInteger|)
                                                                $
                                                                (|NonNegativeInteger|)))
                                                              T)
                                                             ((|outDegree|
                                                               ((|NonNegativeInteger|)
                                                                $
                                                                (|NonNegativeInteger|)))
                                                              T)
                                                             ((|nodeFromNode|
                                                               ((|List|
                                                                 (|NonNegativeInteger|))
                                                                $
                                                                (|NonNegativeInteger|)))
                                                              T)
                                                             ((|nodeToNode|
                                                               ((|List|
                                                                 (|NonNegativeInteger|))
                                                                $
                                                                (|NonNegativeInteger|)))
                                                              T)
                                                             ((|arrowsFromNode|
                                                               ((|List|
                                                                 (|NonNegativeInteger|))
                                                                $
                                                                (|NonNegativeInteger|)))
                                                              T)
                                                             ((|arrowsToNode|
                                                               ((|List|
                                                                 (|NonNegativeInteger|))
                                                                $
                                                                (|NonNegativeInteger|)))
                                                              T)
                                                             ((|nodeFromArrow|
                                                               ((|List|
                                                                 (|NonNegativeInteger|))
                                                                $
                                                                (|NonNegativeInteger|)))
                                                              T)
                                                             ((|nodeToArrow|
                                                               ((|List|
                                                                 (|NonNegativeInteger|))
                                                                $
                                                                (|NonNegativeInteger|)))
                                                              T)
                                                             ((|arrowsFromArrow|
                                                               ((|List|
                                                                 (|NonNegativeInteger|))
                                                                $
                                                                (|NonNegativeInteger|)))
                                                              T)
                                                             ((|arrowsToArrow|
                                                               ((|List|
                                                                 (|NonNegativeInteger|))
                                                                $
                                                                (|NonNegativeInteger|)))
                                                              T)
                                                             ((|routeNodes|
                                                               ((|List|
                                                                 (|NonNegativeInteger|))
                                                                $
                                                                (|NonNegativeInteger|)
                                                                (|NonNegativeInteger|)))
                                                              T)
                                                             ((|routeArrows|
                                                               ((|List|
                                                                 (|NonNegativeInteger|))
                                                                $
                                                                (|NonNegativeInteger|)
                                                                (|NonNegativeInteger|)))
                                                              T)
                                                             ((|distance|
                                                               ((|Integer|) $
                                                                (|NonNegativeInteger|)
                                                                (|NonNegativeInteger|)))
                                                              T)
                                                             ((+ ($ $ $)) T)
                                                             ((|merge| ($ $ $))
                                                              T)
                                                             ((|spanningTreeArrow|
                                                               ((|Tree|
                                                                 (|Integer|))
                                                                $
                                                                (|NonNegativeInteger|)))
                                                              T)
                                                             ((|spanningForestArrow|
                                                               ((|List|
                                                                 (|Tree|
                                                                  (|Integer|)))
                                                                $))
                                                              T)
                                                             ((|spanningTreeNode|
                                                               ((|Tree|
                                                                 (|Integer|))
                                                                $
                                                                (|NonNegativeInteger|)))
                                                              T)
                                                             ((|spanningForestNode|
                                                               ((|List|
                                                                 (|Tree|
                                                                  (|Integer|)))
                                                                $))
                                                              T)
                                                             ((|loopsNodes|
                                                               ((|List|
                                                                 (|Loop|))
                                                                $))
                                                              T)
                                                             ((|loopsAtNode|
                                                               ((|List|
                                                                 (|Loop|))
                                                                $
                                                                (|NonNegativeInteger|)))
                                                              T)
                                                             ((|loopsArrows|
                                                               ((|List|
                                                                 (|Loop|))
                                                                $))
                                                              T)
                                                             ((|isAcyclic?|
                                                               ((|Boolean|) $))
                                                              T)
                                                             ((|incidenceMatrix|
                                                               ((|Matrix|
                                                                 (|Integer|))
                                                                $))
                                                              T)
                                                             ((|adjacencyMatrix|
                                                               ((|Matrix|
                                                                 (|NonNegativeInteger|))
                                                                $))
                                                              T)
                                                             ((|laplacianMatrix|
                                                               ((|Matrix|
                                                                 (|Integer|))
                                                                $))
                                                              T)
                                                             ((|distanceMatrix|
                                                               ((|Matrix|
                                                                 (|Integer|))
                                                                $))
                                                              T)
                                                             ((|isFunctional?|
                                                               ((|Boolean|) $))
                                                              T)
                                                             ((|isDirected?|
                                                               ((|Boolean|)))
                                                              T)
                                                             ((|diagramSvg|
                                                               ((|Void|)
                                                                (|String|) $
                                                                (|Boolean|)))
                                                              T)
                                                             ((|diagramWidth|
                                                               ((|NonNegativeInteger|)
                                                                $))
                                                              T)
                                                             ((|diagramHeight|
                                                               ((|NonNegativeInteger|)
                                                                $))
                                                              T)
                                                             ((|createWidth|
                                                               ((|NonNegativeInteger|)
                                                                (|NonNegativeInteger|)))
                                                              T)
                                                             ((|createX|
                                                               ((|NonNegativeInteger|)
                                                                (|NonNegativeInteger|)
                                                                (|NonNegativeInteger|)))
                                                              T)
                                                             ((|createY|
                                                               ((|NonNegativeInteger|)
                                                                (|NonNegativeInteger|)
                                                                (|NonNegativeInteger|)))
                                                              T)
                                                             ((|toString|
                                                               ((|String|) $))
                                                              T)
                                                             ((|looseEquals|
                                                               ((|Boolean|) $
                                                                $))
                                                              T)
                                                             ((|map|
                                                               ($ $
                                                                (|List|
                                                                 (|NonNegativeInteger|))
                                                                (|List| |t#1|)
                                                                (|Integer|)
                                                                (|Integer|)))
                                                              T)
                                                             ((|mapContra|
                                                               ($ $
                                                                (|List|
                                                                 (|NonNegativeInteger|))
                                                                (|List| |t#1|)
                                                                (|Integer|)
                                                                (|Integer|)))
                                                              T))
                                                           NIL
                                                           '((|List|
                                                              (|NonNegativeInteger|))
                                                             (|List| |t#1|)
                                                             (|Integer|)
                                                             (|Boolean|)
                                                             (|String|)
                                                             (|NonNegativeInteger|)
                                                             (|Void|)
                                                             (|Matrix|
                                                              (|Integer|))
                                                             (|Matrix|
                                                              (|NonNegativeInteger|))
                                                             (|List| (|Loop|))
                                                             (|List|
                                                              (|Tree|
                                                               (|Integer|)))
                                                             (|Tree|
                                                              (|Integer|))
                                                             (|List|
                                                              (|Record|
                                                               (|:| |name|
                                                                    (|String|))
                                                               (|:| |arrType|
                                                                    (|NonNegativeInteger|))
                                                               (|:| |fromOb|
                                                                    (|NonNegativeInteger|))
                                                               (|:| |toOb|
                                                                    (|NonNegativeInteger|))
                                                               (|:| |xOffset|
                                                                    (|Integer|))
                                                               (|:| |yOffset|
                                                                    (|Integer|))))
                                                             (|List|
                                                              (|Record|
                                                               (|:| |value|
                                                                    |t#1|)
                                                               (|:| |posX|
                                                                    (|NonNegativeInteger|))
                                                               (|:| |posY|
                                                                    (|NonNegativeInteger|)))))
                                                           NIL))
                                                  . #3=(|FiniteGraph|))))))
               . #3#)
       (SETELT #1# 0 (LIST '|FiniteGraph| (|devaluate| |t#1|))))))) 
