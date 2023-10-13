
(/VERSIONCHECK 2) 

(DEFPARAMETER |RealNumberSystem;AL| 'NIL) 

(DEFUN |RealNumberSystem| ()
  (LET (#:G136)
    (COND (|RealNumberSystem;AL|)
          (T (SETQ |RealNumberSystem;AL| (|RealNumberSystem;|)))))) 

(DEFUN |RealNumberSystem;| ()
  (PROG (#1=#:G134)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV|
                (PAIR '(#2=#:G130 #3=#:G131 #4=#:G132 #5=#:G133)
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
                           ((|fractionPart| ($ $)) T) ((|truncate| ($ $)) T)
                           ((|round| ($ $)) T) ((|abs| ($ $)) T))
                         NIL '((|Integer|)) NIL)))
               |RealNumberSystem|)
       (SETELT #1# 0 '(|RealNumberSystem|)))))) 

(MAKEPROP '|RealNumberSystem| 'NILADIC T) 
