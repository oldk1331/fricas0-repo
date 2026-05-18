
; )package "BOOT"

(IN-PACKAGE "BOOT")

; get_op_implementation(op, sig, pred, predicates, dom, domname) ==
;     $returnNowhereFromGoGet: local := true
;     predValue := evalDomainOpPred(dom, pred, predicates)
;     null predValue =>
;         'unexported
;     slot := compiledLookup(op, sig, dom) =>
;         [f, :r] := slot
;         f = 'nowhere => 'nowhere           --see replaceGoGetSlot
;         f = function makeSpadConstant => 'constant
;         f = function IDENTITY => 'constant
;         f = function newGoGet =>
;             substitute('_%, domname, devaluate(first(r)))
;         null VECP r => systemError devaluateList r
;         substitute('_%, domname, devaluate(r))
;     'nowhere

(DEFUN |get_op_implementation| (|op| |sig| |pred| |predicates| |dom| |domname|)
  (PROG (|$returnNowhereFromGoGet| |r| |f| |slot| |predValue|)
    (DECLARE (SPECIAL |$returnNowhereFromGoGet|))
    (RETURN
     (PROGN
      (SETQ |$returnNowhereFromGoGet| T)
      (SETQ |predValue| (|evalDomainOpPred| |dom| |pred| |predicates|))
      (COND ((NULL |predValue|) '|unexported|)
            ((SETQ |slot| (|compiledLookup| |op| |sig| |dom|))
             (PROGN
              (SETQ |f| (CAR |slot|))
              (SETQ |r| (CDR |slot|))
              (COND ((EQ |f| '|nowhere|) '|nowhere|)
                    ((EQUAL |f| #'|makeSpadConstant|) '|constant|)
                    ((EQUAL |f| #'IDENTITY) '|constant|)
                    ((EQUAL |f| #'|newGoGet|)
                     (|substitute| '% |domname| (|devaluate| (CAR |r|))))
                    ((NULL (VECP |r|)) (|systemError| (|devaluateList| |r|)))
                    (#1='T (|substitute| '% |domname| (|devaluate| |r|))))))
            (#1# '|nowhere|))))))

; ht_add_strings(page, strings) ==
;     for str in strings repeat
;         ht_add_string(page, str)

(DEFUN |ht_add_strings| (|page| |strings|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#1| |str|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#1|) (PROGN (SETQ |str| (CAR |bfVar#1|)) NIL))
           (RETURN NIL))
          ('T (|ht_add_string| |page| |str|)))
         (SETQ |bfVar#1| (CDR |bfVar#1|))))
      |strings| NIL))))
