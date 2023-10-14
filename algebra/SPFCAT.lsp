
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |SpecialFunctionCategory;|)) 

(DEFPARAMETER |SpecialFunctionCategory;AL| 'NIL) 

(DEFUN |SpecialFunctionCategory| ()
  (LET (#:G129)
    (COND (|SpecialFunctionCategory;AL|)
          (T
           (SETQ |SpecialFunctionCategory;AL| (|SpecialFunctionCategory;|)))))) 

(DEFUN |SpecialFunctionCategory;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join|
                (|mkCategory|
                 '(((|abs| ($ $)) T) ((|Gamma| ($ $)) T) ((|Beta| ($ $ $)) T)
                   ((|digamma| ($ $)) T) ((|polygamma| ($ $ $)) T)
                   ((|Gamma| ($ $ $)) T) ((|besselJ| ($ $ $)) T)
                   ((|besselY| ($ $ $)) T) ((|besselI| ($ $ $)) T)
                   ((|besselK| ($ $ $)) T) ((|airyAi| ($ $)) T)
                   ((|airyAiPrime| ($ $)) T) ((|airyBi| ($ $)) T)
                   ((|airyBiPrime| ($ $)) T) ((|lambertW| ($ $)) T)
                   ((|polylog| ($ $ $)) T) ((|weierstrassP| ($ $ $ $)) T)
                   ((|weierstrassPPrime| ($ $ $ $)) T)
                   ((|weierstrassSigma| ($ $ $ $)) T)
                   ((|weierstrassZeta| ($ $ $ $)) T)
                   ((|whittakerM| ($ $ $ $)) T) ((|whittakerW| ($ $ $ $)) T)
                   ((|angerJ| ($ $ $)) T) ((|weberE| ($ $ $)) T)
                   ((|struveH| ($ $ $)) T) ((|struveL| ($ $ $)) T)
                   ((|hankelH1| ($ $ $)) T) ((|hankelH2| ($ $ $)) T)
                   ((|lommelS1| ($ $ $ $)) T) ((|lommelS2| ($ $ $ $)) T)
                   ((|kummerM| ($ $ $ $)) T) ((|kummerU| ($ $ $ $)) T)
                   ((|legendreP| ($ $ $ $)) T) ((|legendreQ| ($ $ $ $)) T)
                   ((|kelvinBei| ($ $ $)) T) ((|kelvinBer| ($ $ $)) T)
                   ((|kelvinKei| ($ $ $)) T) ((|kelvinKer| ($ $ $)) T)
                   ((|ellipticK| ($ $)) T) ((|ellipticE| ($ $)) T)
                   ((|ellipticE| ($ $ $)) T) ((|ellipticF| ($ $ $)) T)
                   ((|ellipticPi| ($ $ $ $)) T) ((|jacobiSn| ($ $ $)) T)
                   ((|jacobiCn| ($ $ $)) T) ((|jacobiDn| ($ $ $)) T)
                   ((|jacobiZeta| ($ $ $)) T) ((|jacobiTheta| ($ $ $)) T)
                   ((|lerchPhi| ($ $ $ $)) T) ((|riemannZeta| ($ $)) T)
                   ((|hypergeometricF| ($ (|List| $) (|List| $) $))
                    (|has| $ (|RetractableTo| (|Integer|))))
                   ((|meijerG|
                     ($ (|List| $) (|List| $) (|List| $) (|List| $) $))
                    (|has| $ (|RetractableTo| (|Integer|)))))
                 NIL '((|List| $)) NIL))
               |SpecialFunctionCategory|)
       (SETELT #1# 0 '(|SpecialFunctionCategory|)))))) 

(MAKEPROP '|SpecialFunctionCategory| 'NILADIC T) 
