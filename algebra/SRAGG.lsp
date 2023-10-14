
(DECLAIM (NOTINLINE |StringAggregate;|)) 

(DEFPARAMETER |StringAggregate;AL| 'NIL) 

(DEFUN |StringAggregate| ()
  (LET (#:G106)
    (COND (|StringAggregate;AL|)
          (T (SETQ |StringAggregate;AL| (|StringAggregate;|)))))) 

(DEFUN |StringAggregate;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(#2=#:G103) (LIST '(|Character|)))
                              (|Join| (|OneDimensionalArrayAggregate| '#2#)
                                      (|mkCategory|
                                       '(((|lowerCase| ($ $)) T)
                                         ((|lowerCase!| ($ $)) T)
                                         ((|upperCase| ($ $)) T)
                                         ((|upperCase!| ($ $)) T)
                                         ((|prefix?| ((|Boolean|) $ $)) T)
                                         ((|suffix?| ((|Boolean|) $ $)) T)
                                         ((|substring?|
                                           ((|Boolean|) $ $ (|Integer|)))
                                          T)
                                         ((|match|
                                           ((|NonNegativeInteger|) $ $
                                            (|Character|)))
                                          T)
                                         ((|match?|
                                           ((|Boolean|) $ $ (|Character|)))
                                          T)
                                         ((|replace|
                                           ($ $
                                            (|UniversalSegment| (|Integer|))
                                            $))
                                          T)
                                         ((|position|
                                           ((|Integer|) $ $ (|Integer|)))
                                          T)
                                         ((|position|
                                           ((|Integer|) (|CharacterClass|) $
                                            (|Integer|)))
                                          T)
                                         ((|coerce| ($ (|Character|))) T)
                                         ((|split|
                                           ((|List| $) $ (|Character|)))
                                          T)
                                         ((|split|
                                           ((|List| $) $ (|CharacterClass|)))
                                          T)
                                         ((|trim| ($ $ (|Character|))) T)
                                         ((|trim| ($ $ (|CharacterClass|))) T)
                                         ((|leftTrim| ($ $ (|Character|))) T)
                                         ((|leftTrim| ($ $ (|CharacterClass|)))
                                          T)
                                         ((|rightTrim| ($ $ (|Character|))) T)
                                         ((|rightTrim|
                                           ($ $ (|CharacterClass|)))
                                          T)
                                         ((|elt| ($ $ $)) T))
                                       NIL
                                       '((|CharacterClass|) (|Character|)
                                         (|List| $) (|Integer|)
                                         (|UniversalSegment| (|Integer|))
                                         (|Boolean|) (|NonNegativeInteger|))
                                       NIL)))
                   |StringAggregate|)
           (SETELT #1# 0 '(|StringAggregate|))))) 

(MAKEPROP '|StringAggregate| 'NILADIC T) 
