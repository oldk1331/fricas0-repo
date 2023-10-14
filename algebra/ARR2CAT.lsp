
(DEFPARAMETER |TwoDimensionalArrayCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |TwoDimensionalArrayCategory;|)) 

(DEFPARAMETER |TwoDimensionalArrayCategory;AL| 'NIL) 

(DEFUN |TwoDimensionalArrayCategory| (&REST #1=#:G126)
  (LET (#2=#:G127)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluateList| #1#)
                       |TwoDimensionalArrayCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |TwoDimensionalArrayCategory;AL|
              (|cons5|
               (CONS #3#
                     (SETQ #2# (APPLY #'|TwoDimensionalArrayCategory;| #1#)))
               |TwoDimensionalArrayCategory;AL|))
      #2#)))) 

(DEFUN |TwoDimensionalArrayCategory;| (|t#1| |t#2| |t#3|)
  (PROG (#1=#:G125)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV|
                (PAIR '(|t#1| |t#2| |t#3|)
                      (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)
                            (|devaluate| |t#3|)))
                (COND (|TwoDimensionalArrayCategory;CAT|)
                      ('T
                       (LETT |TwoDimensionalArrayCategory;CAT|
                             (|Join| (|HomogeneousAggregate| '|t#1|)
                                     (|shallowlyMutable|) (|finiteAggregate|)
                                     (|mkCategory|
                                      '(((|new|
                                          ($ (|NonNegativeInteger|)
                                           (|NonNegativeInteger|) |t#1|))
                                         T)
                                        ((|fill!| ($ $ |t#1|)) T)
                                        ((|minRowIndex| ((|Integer|) $)) T)
                                        ((|maxRowIndex| ((|Integer|) $)) T)
                                        ((|minColIndex| ((|Integer|) $)) T)
                                        ((|maxColIndex| ((|Integer|) $)) T)
                                        ((|nrows| ((|NonNegativeInteger|) $))
                                         T)
                                        ((|ncols| ((|NonNegativeInteger|) $))
                                         T)
                                        ((|elt|
                                          (|t#1| $ (|Integer|) (|Integer|)))
                                         T)
                                        ((|qelt|
                                          (|t#1| $ (|Integer|) (|Integer|)))
                                         T)
                                        ((|elt|
                                          (|t#1| $ (|Integer|) (|Integer|)
                                           |t#1|))
                                         T)
                                        ((|row| (|t#2| $ (|Integer|))) T)
                                        ((|column| (|t#3| $ (|Integer|))) T)
                                        ((|parts| ((|List| |t#1|) $)) T)
                                        ((|setelt|
                                          (|t#1| $ (|Integer|) (|Integer|)
                                           |t#1|))
                                         T)
                                        ((|qsetelt!|
                                          (|t#1| $ (|Integer|) (|Integer|)
                                           |t#1|))
                                         T)
                                        ((|setRow!| ($ $ (|Integer|) |t#2|)) T)
                                        ((|setColumn!| ($ $ (|Integer|) |t#3|))
                                         T)
                                        ((|map| ($ (|Mapping| |t#1| |t#1|) $))
                                         T)
                                        ((|map!| ($ (|Mapping| |t#1| |t#1|) $))
                                         T)
                                        ((|map|
                                          ($ (|Mapping| |t#1| |t#1| |t#1|) $
                                           $))
                                         T)
                                        ((|map|
                                          ($ (|Mapping| |t#1| |t#1| |t#1|) $ $
                                           |t#1|))
                                         T))
                                      NIL
                                      '((|Integer|) (|List| |t#1|)
                                        (|NonNegativeInteger|))
                                      NIL))
                             . #2=(|TwoDimensionalArrayCategory|)))))
               . #2#)
       (SETELT #1# 0
               (LIST '|TwoDimensionalArrayCategory| (|devaluate| |t#1|)
                     (|devaluate| |t#2|) (|devaluate| |t#3|))))))) 
