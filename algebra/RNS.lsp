
(DECLAIM (NOTINLINE |RealNumberSystem;|)) 

(DEFPARAMETER |RealNumberSystem;AL| 'NIL) 

(DEFUN |RealNumberSystem| ()
  (LET (#:G114)
    (COND (|RealNumberSystem;AL|)
          (T (SETQ |RealNumberSystem;AL| (|RealNumberSystem;|)))))) 

(DEFUN |RealNumberSystem;| ()
  (SPROG ((#1=#:G112 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(#2=#:G108 #3=#:G109 #4=#:G110 #5=#:G111)
                          (LIST '(|Integer|) '(|Fraction| (|Integer|))
                                '(|Pattern| (|Float|)) '(|Float|)))
                    (|Join| (|Field|) (|OrderedRing|) (|RealConstant|)
                            (|RetractableTo| '#2#) (|RetractableTo| '#3#)
                            (|RadicalCategory|) (|ConvertibleTo| '#4#)
                            (|PatternMatchable| '#5#) (|CharacteristicZero|)
                            (|mkCategory|
                             '(((|norm| ($ $)) T) ((|ceiling| ($ $)) T)
                               ((|floor| ($ $)) T)
                               ((|wholePart| ((|Integer|) $)) T)
                               ((|fractionPart| ($ $)) T)
                               ((|truncate| ($ $)) T) ((|round| ($ $)) T)
                               ((|abs| ($ $)) T))
                             NIL '((|Integer|)) NIL)))
                   |RealNumberSystem|)
           (SETELT #1# 0 '(|RealNumberSystem|))))) 

(MAKEPROP '|RealNumberSystem| 'NILADIC T) 
