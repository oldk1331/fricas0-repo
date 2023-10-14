
(/VERSIONCHECK 2) 

(DEFPARAMETER |ModularAlgebraicGcdOperations;AL| 'NIL) 

(DEFUN |ModularAlgebraicGcdOperations| (&REST #1=#:G126)
  (LET (#2=#:G127)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluateList| #1#)
                       |ModularAlgebraicGcdOperations;AL|))
      (CDR #2#))
     (T
      (SETQ |ModularAlgebraicGcdOperations;AL|
              (|cons5|
               (CONS #3#
                     (SETQ #2# (APPLY #'|ModularAlgebraicGcdOperations;| #1#)))
               |ModularAlgebraicGcdOperations;AL|))
      #2#)))) 

(DEFUN |ModularAlgebraicGcdOperations;| (|t#1| |t#2|)
  (PROG (#1=#:G125)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV|
                (PAIR '(|t#1| |t#2|)
                      (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                (|Join|
                 (|mkCategory|
                  '(((|pseudoRem| (|t#1| |t#1| |t#1| |t#2|)) T)
                    ((|canonicalIfCan| ((|Union| |t#1| "failed") |t#1| |t#2|))
                     T)
                    ((|pack_modulus|
                      ((|Union| |t#2| "failed")
                       (|List| (|Polynomial| (|Integer|))) (|List| (|Symbol|))
                       (|Integer|)))
                     T)
                    ((|MPtoMPT|
                      (|t#1| (|Polynomial| (|Integer|)) (|Symbol|)
                       (|List| (|Symbol|)) |t#2|))
                     T)
                    ((|zero?| ((|Boolean|) |t#1|)) T)
                    ((|degree| ((|Integer|) |t#1|)) T)
                    ((|pack_exps|
                      ((|SortedExponentVector|) (|Integer|) (|Integer|) |t#2|))
                     T)
                    ((|repack1|
                      ((|Void|) |t#1| (|U32Vector|) (|Integer|) |t#2|))
                     T))
                  NIL
                  '((|Void|) (|U32Vector|) (|Integer|) (|SortedExponentVector|)
                    (|Boolean|) (|Polynomial| (|Integer|)) (|Symbol|)
                    (|List| (|Symbol|)) (|List| (|Polynomial| (|Integer|))))
                  NIL)))
               |ModularAlgebraicGcdOperations|)
       (SETELT #1# 0
               (LIST '|ModularAlgebraicGcdOperations| (|devaluate| |t#1|)
                     (|devaluate| |t#2|))))))) 
