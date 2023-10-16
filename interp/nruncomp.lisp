
; )package "BOOT"

(IN-PACKAGE "BOOT")

; NRTaddDeltaCode(kvec) ==
; --NOTES: This function is called from buildFunctor to initially
; --  fill slots in $template. The $template so created is stored in the
; --  NRLIB. On load, makeDomainTemplate is called on this $template to
; --  create a template which becomes slot 0 of the infovec for the constructor.
; --The template has 6 kinds of entries:
; --  (1) formal arguments and local variables, represented by (QUOTE <entry>)
; --      this conflicts by (5) but is ok since each is explicitly set by
; --      instantiator code;
; --  (2) domains, represented by lazy forms, e.g. (Foo 12 17 6)
; --  (3) latch slots, represented SPADCALLable forms which goGet an operation
; --      from a domain then cache the operation in the same slot
; --  (4) functions, represented by identifiers which are names of functions
; --  (5) identifiers/strings, parts of signatures (now parts of signatures
; --      now must all have slot numbers, represented by (QUOTE <entry>)
; --  (6) constants, like 0 and 1, represented by (CONS .. ) form
;   for i in $NRTbase.. for item in REVERSE $NRTdeltaList
;     for compItem in REVERSE $NRTdeltaListComp
;       |null (s:=kvec.i) repeat
;         $template.i:= deltaTran(item,compItem)
;   $template.5 :=
;     $NRTaddForm =>
;       $NRTaddForm is ["@Tuple", :y] => NREVERSE y
;       NRTencode($NRTaddForm,$addForm)
;     nil

(DEFUN |NRTaddDeltaCode| (|kvec|)
  (PROG (|s| |y|)
    (RETURN
     (PROGN
      ((LAMBDA (|i| |bfVar#1| |item| |bfVar#2| |compItem|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#1|) (PROGN (SETQ |item| (CAR |bfVar#1|)) NIL)
                (ATOM |bfVar#2|) (PROGN (SETQ |compItem| (CAR |bfVar#2|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (NULL (SETQ |s| (ELT |kvec| |i|)))
                 (SETF (ELT |$template| |i|)
                         (|deltaTran| |item| |compItem|)))))
          (SETQ |i| (+ |i| 1))
          (SETQ |bfVar#1| (CDR |bfVar#1|))
          (SETQ |bfVar#2| (CDR |bfVar#2|))))
       |$NRTbase| (REVERSE |$NRTdeltaList|) NIL (REVERSE |$NRTdeltaListComp|)
       NIL)
      (SETF (ELT |$template| 5)
              (COND
               (|$NRTaddForm|
                (COND
                 ((AND (CONSP |$NRTaddForm|) (EQ (CAR |$NRTaddForm|) '|@Tuple|)
                       (PROGN (SETQ |y| (CDR |$NRTaddForm|)) #1#))
                  (NREVERSE |y|))
                 (#1# (|NRTencode| |$NRTaddForm| |$addForm|))))
               (#1# NIL)))))))

; deltaTran(item,compItem) ==
;   item is ['domain,lhs,:.] => NRTencode(lhs,compItem)
;   --NOTE: all items but signatures are wrapped with domain forms
;   [op,:modemap] := item
;   [dcSig,[.,[kind,:.]]] := modemap
;   [dc,:sig] := dcSig
;   sig := substitute('$,dc,substitute("$$",'$,sig))
;   dcCode :=
;     dc = '$ => 0
;     NRTassocIndex dc or keyedSystemError("S2NR0004",[dc])
;   formalSig:= SUBLISLIS($FormalMapVariableList,$formalArgList,sig)
;   kindFlag:= (kind = 'CONST => 'CONST; nil)
;   newSig := [NRTassocIndex x or x for x in formalSig]
;   [newSig,dcCode,op,:kindFlag]

(DEFUN |deltaTran| (|item| |compItem|)
  (PROG (|ISTMP#1| |lhs| |op| |modemap| |dcSig| |kind| |dc| |sig| |dcCode|
         |formalSig| |kindFlag| |newSig|)
    (RETURN
     (COND
      ((AND (CONSP |item|) (EQ (CAR |item|) '|domain|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |item|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN (SETQ |lhs| (CAR |ISTMP#1|)) #1='T))))
       (|NRTencode| |lhs| |compItem|))
      (#1#
       (PROGN
        (SETQ |op| (CAR |item|))
        (SETQ |modemap| (CDR |item|))
        (SETQ |dcSig| (CAR |modemap|))
        (SETQ |kind| (CAR (CADADR |modemap|)))
        (SETQ |dc| (CAR |dcSig|))
        (SETQ |sig| (CDR |dcSig|))
        (SETQ |sig| (|substitute| '$ |dc| (|substitute| '$$ '$ |sig|)))
        (SETQ |dcCode|
                (COND ((EQ |dc| '$) 0)
                      (#1#
                       (OR (|NRTassocIndex| |dc|)
                           (|keyedSystemError| 'S2NR0004 (LIST |dc|))))))
        (SETQ |formalSig|
                (SUBLISLIS |$FormalMapVariableList| |$formalArgList| |sig|))
        (SETQ |kindFlag| (COND ((EQ |kind| 'CONST) 'CONST) (#1# NIL)))
        (SETQ |newSig|
                ((LAMBDA (|bfVar#4| |bfVar#3| |x|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#3|)
                          (PROGN (SETQ |x| (CAR |bfVar#3|)) NIL))
                      (RETURN (NREVERSE |bfVar#4|)))
                     (#1#
                      (SETQ |bfVar#4|
                              (CONS (OR (|NRTassocIndex| |x|) |x|)
                                    |bfVar#4|))))
                    (SETQ |bfVar#3| (CDR |bfVar#3|))))
                 NIL |formalSig| NIL))
        (CONS |newSig| (CONS |dcCode| (CONS |op| |kindFlag|)))))))))

; NRTreplaceAllLocalReferences(form) ==
;   $devaluateList :local := []
;   NRTputInLocalReferences form

(DEFUN |NRTreplaceAllLocalReferences| (|form|)
  (PROG (|$devaluateList|)
    (DECLARE (SPECIAL |$devaluateList|))
    (RETURN
     (PROGN (SETQ |$devaluateList| NIL) (|NRTputInLocalReferences| |form|)))))

; NRTencode(x,y) == encode(x,y,true, true) where
;   encode(x, compForm, firstTime, domain) ==
;       -- converts a domain form to a lazy domain form; everything other than
;       -- the operation name should be assigned a slot
;       not(firstTime) and (k := NRTassocIndex x) =>
;           not(domain) and INTEGERP(k) =>
;               ['NRTEVAL, [($QuickCode => 'QREFELT; 'ELT), "$", k]]
;           k
;       VECP(x) => systemErrorHere '"NRTencode"
;       PAIRP(x) =>
;           QCAR(x) = 'Record or x is ['Union, ['_:, a, b], :.] =>
;               [QCAR(x), :[['_:, a, encode(b, c, false, true)]
;                for [., a, b] in QCDR(x) for [., =a, c] in rest compForm]]
;           constructor?(QCAR(x)) or MEMQ(QCAR x, '(Union Mapping)) =>
;               cosig := rest GETDATABASE(QCAR(x), 'COSIG)
;               if NULL(cosig) then
;                   cosig := [true for y in QCDR(x)]
;               [QCAR x, :[encode(y, z, false, cdom) for y in QCDR(x)
;                           for z in rest compForm for cdom in cosig]]
;           ['NRTEVAL, NRTreplaceAllLocalReferences(
;                              COPY_-TREE(lispize(compForm)))]
;       MEMQ(x, $formalArgList) =>
;           v := $FormalMapVariableList.(POSN1(x, $formalArgList))
;           firstTime => ['local, v]
;           domain => v
;           ['NRTEVAL, [($QuickCode => 'QREFELT; 'ELT), "$", v]]
;       x = '$ => x
;       x = "$$" => x
;       ['QUOTE, x]

(DEFUN |NRTencode| (|x| |y|)
  (PROG () (RETURN (|NRTencode,encode| |x| |y| T T))))
(DEFUN |NRTencode,encode| (|x| |compForm| |firstTime| |domain|)
  (PROG (|k| |ISTMP#1| |ISTMP#2| |ISTMP#3| |a| |ISTMP#4| |b| |c| |cosig| |v|)
    (RETURN
     (COND
      ((AND (NULL |firstTime|) (SETQ |k| (|NRTassocIndex| |x|)))
       (COND
        ((AND (NULL |domain|) (INTEGERP |k|))
         (LIST 'NRTEVAL
               (LIST (COND (|$QuickCode| 'QREFELT) (#1='T 'ELT)) '$ |k|)))
        (#1# |k|)))
      ((VECP |x|) (|systemErrorHere| "NRTencode"))
      ((CONSP |x|)
       (COND
        ((OR (EQ (QCAR |x|) '|Record|)
             (AND (CONSP |x|) (EQ (CAR |x|) '|Union|)
                  (PROGN
                   (SETQ |ISTMP#1| (CDR |x|))
                   (AND (CONSP |ISTMP#1|)
                        (PROGN
                         (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                         (AND (CONSP |ISTMP#2|) (EQ (CAR |ISTMP#2|) '|:|)
                              (PROGN
                               (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                               (AND (CONSP |ISTMP#3|)
                                    (PROGN
                                     (SETQ |a| (CAR |ISTMP#3|))
                                     (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                                     (AND (CONSP |ISTMP#4|)
                                          (EQ (CDR |ISTMP#4|) NIL)
                                          (PROGN
                                           (SETQ |b| (CAR |ISTMP#4|))
                                           #1#)))))))))))
         (CONS (QCAR |x|)
               ((LAMBDA (|bfVar#9| |bfVar#6| |bfVar#5| |bfVar#8| |bfVar#7|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#6|)
                         (PROGN (SETQ |bfVar#5| (CAR |bfVar#6|)) NIL)
                         (ATOM |bfVar#8|)
                         (PROGN (SETQ |bfVar#7| (CAR |bfVar#8|)) NIL))
                     (RETURN (NREVERSE |bfVar#9|)))
                    (#1#
                     (AND (CONSP |bfVar#5|)
                          (PROGN
                           (SETQ |ISTMP#1| (CDR |bfVar#5|))
                           (AND (CONSP |ISTMP#1|)
                                (PROGN
                                 (SETQ |a| (CAR |ISTMP#1|))
                                 (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                 (AND (CONSP |ISTMP#2|)
                                      (EQ (CDR |ISTMP#2|) NIL)
                                      (PROGN
                                       (SETQ |b| (CAR |ISTMP#2|))
                                       #1#)))))
                          (CONSP |bfVar#7|)
                          (PROGN
                           (SETQ |ISTMP#1| (CDR |bfVar#7|))
                           (AND (CONSP |ISTMP#1|) (EQUAL (CAR |ISTMP#1|) |a|)
                                (PROGN
                                 (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                 (AND (CONSP |ISTMP#2|)
                                      (EQ (CDR |ISTMP#2|) NIL)
                                      (PROGN
                                       (SETQ |c| (CAR |ISTMP#2|))
                                       #1#)))))
                          (SETQ |bfVar#9|
                                  (CONS
                                   (LIST '|:| |a|
                                         (|NRTencode,encode| |b| |c| NIL T))
                                   |bfVar#9|)))))
                   (SETQ |bfVar#6| (CDR |bfVar#6|))
                   (SETQ |bfVar#8| (CDR |bfVar#8|))))
                NIL (QCDR |x|) NIL (CDR |compForm|) NIL)))
        ((OR (|constructor?| (QCAR |x|))
             (MEMQ (QCAR |x|) '(|Union| |Mapping|)))
         (PROGN
          (SETQ |cosig| (CDR (GETDATABASE (QCAR |x|) 'COSIG)))
          (COND
           ((NULL |cosig|)
            (SETQ |cosig|
                    ((LAMBDA (|bfVar#11| |bfVar#10| |y|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#10|)
                              (PROGN (SETQ |y| (CAR |bfVar#10|)) NIL))
                          (RETURN (NREVERSE |bfVar#11|)))
                         (#1# (SETQ |bfVar#11| (CONS T |bfVar#11|))))
                        (SETQ |bfVar#10| (CDR |bfVar#10|))))
                     NIL (QCDR |x|) NIL))))
          (CONS (QCAR |x|)
                ((LAMBDA
                     (|bfVar#15| |bfVar#12| |y| |bfVar#13| |z| |bfVar#14|
                      |cdom|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#12|)
                          (PROGN (SETQ |y| (CAR |bfVar#12|)) NIL)
                          (ATOM |bfVar#13|)
                          (PROGN (SETQ |z| (CAR |bfVar#13|)) NIL)
                          (ATOM |bfVar#14|)
                          (PROGN (SETQ |cdom| (CAR |bfVar#14|)) NIL))
                      (RETURN (NREVERSE |bfVar#15|)))
                     (#1#
                      (SETQ |bfVar#15|
                              (CONS (|NRTencode,encode| |y| |z| NIL |cdom|)
                                    |bfVar#15|))))
                    (SETQ |bfVar#12| (CDR |bfVar#12|))
                    (SETQ |bfVar#13| (CDR |bfVar#13|))
                    (SETQ |bfVar#14| (CDR |bfVar#14|))))
                 NIL (QCDR |x|) NIL (CDR |compForm|) NIL |cosig| NIL))))
        (#1#
         (LIST 'NRTEVAL
               (|NRTreplaceAllLocalReferences|
                (COPY-TREE (|lispize| |compForm|)))))))
      ((MEMQ |x| |$formalArgList|)
       (PROGN
        (SETQ |v| (ELT |$FormalMapVariableList| (POSN1 |x| |$formalArgList|)))
        (COND (|firstTime| (LIST '|local| |v|)) (|domain| |v|)
              (#1#
               (LIST 'NRTEVAL
                     (LIST (COND (|$QuickCode| 'QREFELT) (#1# 'ELT)) '$
                           |v|))))))
      ((EQ |x| '$) |x|) ((EQ |x| '$$) |x|) (#1# (LIST 'QUOTE |x|))))))

; listOfBoundVars(form, e) ==
; -- Only called from the function genDeltaEntry below
;   form = '$ => []
;   IDENTP form and (u := get(form, 'value, e)) =>
;     u:=u.expr
;     MEMQ(IFCAR u, '(Union Record)) => listOfBoundVars(u, e)
;     [form]
;   atom form => []
;   first form = 'QUOTE => []
;   EQ(first form, ":") => listOfBoundVars(CADDR form, e)
;   -- We don't want to pick up the tag, only the domain
;   "union"/[listOfBoundVars(x, e) for x in rest form]

(DEFUN |listOfBoundVars| (|form| |e|)
  (PROG (|u|)
    (RETURN
     (COND ((EQ |form| '$) NIL)
           ((AND (IDENTP |form|) (SETQ |u| (|get| |form| '|value| |e|)))
            (PROGN
             (SETQ |u| (CAR |u|))
             (COND
              ((MEMQ (IFCAR |u|) '(|Union| |Record|))
               (|listOfBoundVars| |u| |e|))
              (#1='T (LIST |form|)))))
           ((ATOM |form|) NIL) ((EQ (CAR |form|) 'QUOTE) NIL)
           ((EQ (CAR |form|) '|:|) (|listOfBoundVars| (CADDR |form|) |e|))
           (#1#
            ((LAMBDA (|bfVar#17| |bfVar#16| |x|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#16|)
                      (PROGN (SETQ |x| (CAR |bfVar#16|)) NIL))
                  (RETURN |bfVar#17|))
                 (#1#
                  (SETQ |bfVar#17|
                          (|union| |bfVar#17| (|listOfBoundVars| |x| |e|)))))
                (SETQ |bfVar#16| (CDR |bfVar#16|))))
             NIL (CDR |form|) NIL))))))

; optDeltaEntry(op, sig, dc, eltOrConst, e) ==
;   $killOptimizeIfTrue = true => nil
;   $bootstrapDomains = true =>
;     nil
;   ndc :=
;     dc = '$ => $functorForm
;     atom dc and (dcval := get(dc, 'value, e)) => dcval.expr
;     dc
;   sig := substitute(ndc, dc, sig)
;   not MEMQ(IFCAR ndc, $optimizableConstructorNames) => nil
;   dcval := optCallEval ndc
;   -- substitute guarantees to use EQUAL testing
;   sig := substitute(devaluate dcval, ndc, sig)
;   if rest ndc then
;      for new in rest devaluate dcval for old in rest ndc repeat
;        sig := substitute(new, old, sig)
;      -- optCallEval sends (List X) to (List (Integer)) etc,
;      -- so we should make the same transformation
;   fn := compiledLookup(op,sig,dcval)
;   if null fn then
;     -- following code is to handle selectors like first, rest
;      nsig := [quoteSelector(tt, e) for tt in sig] where
;        quoteSelector(x, e) ==
;          not(IDENTP x) => x
;          get(x, 'value, e) => x
;          x='$ => x
;          MKQ x
;      fn := compiledLookup(op,nsig,dcval)
;      if null fn then return nil
;   eltOrConst="CONST" => ['XLAM,'ignore,MKQ SPADCALL fn]
;   spadreplace := GETL(compileTimeBindingOf first fn,'SPADreplace)
;   if CONSP spadreplace and first spadreplace = 'XLAM then
;       -- if the optimization is a XLAM form, make sure it's a "proper macro",
;       -- i.e. doesn't ignore its argument or evaluate it more than once.
;       lhs := CADR spadreplace
;       rhs := CADDR spadreplace
;       if # lhs = 1 and countXLAM(var := first lhs, rhs) = 0 then
;           -- deal with cases like "minIndex l == 0", which translates to
;           -- "(XLAM (|l|) 0)", prevents argument from evaluation.
;           return ['XLAM, lhs, ['PROGN, var, rhs]]
;       for var in lhs repeat
;           -- ignore argument that is string, e.g. 'elt(x, "first")'
;           if not STRINGP var and (n := countXLAM(var, rhs)) ~= 1 then
;               -- in current code base there are no cases like "f(x, y) == x"
;               -- so throw an error if such case emerges.
;               stackAndThrow [op, " can not be properly inline optimized"]
;               return nil
;   spadreplace

(DEFUN |optDeltaEntry| (|op| |sig| |dc| |eltOrConst| |e|)
  (PROG (|dcval| |ndc| |fn| |nsig| |spadreplace| |lhs| |rhs| |var| |n|)
    (RETURN
     (COND ((EQUAL |$killOptimizeIfTrue| T) NIL)
           ((EQUAL |$bootstrapDomains| T) NIL)
           (#1='T
            (PROGN
             (SETQ |ndc|
                     (COND ((EQ |dc| '$) |$functorForm|)
                           ((AND (ATOM |dc|)
                                 (SETQ |dcval| (|get| |dc| '|value| |e|)))
                            (CAR |dcval|))
                           (#1# |dc|)))
             (SETQ |sig| (|substitute| |ndc| |dc| |sig|))
             (COND
              ((NULL (MEMQ (IFCAR |ndc|) |$optimizableConstructorNames|)) NIL)
              (#1#
               (PROGN
                (SETQ |dcval| (|optCallEval| |ndc|))
                (SETQ |sig| (|substitute| (|devaluate| |dcval|) |ndc| |sig|))
                (COND
                 ((CDR |ndc|)
                  ((LAMBDA (|bfVar#18| |new| |bfVar#19| |old|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#18|)
                            (PROGN (SETQ |new| (CAR |bfVar#18|)) NIL)
                            (ATOM |bfVar#19|)
                            (PROGN (SETQ |old| (CAR |bfVar#19|)) NIL))
                        (RETURN NIL))
                       (#1# (SETQ |sig| (|substitute| |new| |old| |sig|))))
                      (SETQ |bfVar#18| (CDR |bfVar#18|))
                      (SETQ |bfVar#19| (CDR |bfVar#19|))))
                   (CDR (|devaluate| |dcval|)) NIL (CDR |ndc|) NIL)))
                (SETQ |fn| (|compiledLookup| |op| |sig| |dcval|))
                (COND
                 ((NULL |fn|)
                  (SETQ |nsig|
                          ((LAMBDA (|bfVar#21| |bfVar#20| |tt|)
                             (LOOP
                              (COND
                               ((OR (ATOM |bfVar#20|)
                                    (PROGN (SETQ |tt| (CAR |bfVar#20|)) NIL))
                                (RETURN (NREVERSE |bfVar#21|)))
                               (#1#
                                (SETQ |bfVar#21|
                                        (CONS
                                         (|optDeltaEntry,quoteSelector| |tt|
                                          |e|)
                                         |bfVar#21|))))
                              (SETQ |bfVar#20| (CDR |bfVar#20|))))
                           NIL |sig| NIL))
                  (SETQ |fn| (|compiledLookup| |op| |nsig| |dcval|))
                  (COND ((NULL |fn|) (RETURN NIL)))))
                (COND
                 ((EQ |eltOrConst| 'CONST)
                  (LIST 'XLAM '|ignore| (MKQ (SPADCALL |fn|))))
                 (#1#
                  (PROGN
                   (SETQ |spadreplace|
                           (GETL (|compileTimeBindingOf| (CAR |fn|))
                            '|SPADreplace|))
                   (COND
                    ((AND (CONSP |spadreplace|) (EQ (CAR |spadreplace|) 'XLAM))
                     (SETQ |lhs| (CADR |spadreplace|))
                     (SETQ |rhs| (CADDR |spadreplace|))
                     (COND
                      ((AND (EQL (LENGTH |lhs|) 1)
                            (EQL (|countXLAM| (SETQ |var| (CAR |lhs|)) |rhs|)
                                 0))
                       (RETURN (LIST 'XLAM |lhs| (LIST 'PROGN |var| |rhs|)))))
                     ((LAMBDA (|bfVar#22| |var|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#22|)
                               (PROGN (SETQ |var| (CAR |bfVar#22|)) NIL))
                           (RETURN NIL))
                          (#1#
                           (COND
                            ((AND (NULL (STRINGP |var|))
                                  (NOT
                                   (EQL (SETQ |n| (|countXLAM| |var| |rhs|))
                                        1)))
                             (|stackAndThrow|
                              (LIST |op|
                                    '| can not be properly inline optimized|))
                             (RETURN NIL)))))
                         (SETQ |bfVar#22| (CDR |bfVar#22|))))
                      |lhs| NIL)))
                   |spadreplace|))))))))))))
(DEFUN |optDeltaEntry,quoteSelector| (|x| |e|)
  (PROG ()
    (RETURN
     (COND ((NULL (IDENTP |x|)) |x|) ((|get| |x| '|value| |e|) |x|)
           ((EQ |x| '$) |x|) ('T (MKQ |x|))))))

; countXLAM(var, rhs) ==
;     -- return how many times does var appear in rhs
;     not CONSP rhs => if var = rhs then 1 else 0
;     COUNT(var, rhs)

(DEFUN |countXLAM| (|var| |rhs|)
  (PROG ()
    (RETURN
     (COND ((NULL (CONSP |rhs|)) (COND ((EQUAL |var| |rhs|) 1) (#1='T 0)))
           (#1# (COUNT |var| |rhs|))))))

; genDeltaEntry(opMmPair, e) ==
; --called from compApplyModemap
; --$NRTdeltaLength=0.. always equals length of $NRTdeltaList
;   $compUniquelyIfTrue: local:= false
;   [op,[dc,:sig],[.,cform:=[eltOrConst,.,nsig]]] := opMmPair
;   eltOrConst = 'XLAM => cform
;   if atom dc then
;     dc = "$" => nsig := sig
;     if NUMBERP nsig then nsig := substitute('$,dc,substitute("$$","$",sig))
;     -- following hack needed to invert Rep to $ substitution
; --  if odc = 'Rep and cform is [.,.,osig] then sig:=osig
;   newimp := optDeltaEntry(op, nsig, dc, eltOrConst, e) => newimp
;   setDifference(listOfBoundVars(dc, e), $functorLocalParameters) ~= [] =>
;     ['applyFun,['compiledLookupCheck,MKQ op,
;          mkList consSig(nsig, dc, e), consDomainForm(dc, nil, e)]]
;   odc := dc
;   if null atom dc then dc := substitute("$$",'$,dc)
;  --   sig := substitute('$,dc,sig)
;  --   cform := substitute('$,dc,cform)
;   opModemapPair :=
;     -- force pred to T
;     [op, [dc, :[genDeltaSig(x, e) for x in nsig]], ['T,cform]]
;   if null NRTassocIndex dc and dc ~= $NRTaddForm and
;     (member(dc,$functorLocalParameters) or null atom dc) then
;     --create "domain" entry to $NRTdeltaList
;       $NRTdeltaList := [['domain, NRTaddInner(dc, e), :dc], :$NRTdeltaList]
;       saveNRTdeltaListComp:= $NRTdeltaListComp:=[nil,:$NRTdeltaListComp]
;       $NRTdeltaLength := $NRTdeltaLength+1
;       compEntry := (compOrCroak(odc, $EmptyMode, e)).expr
;       RPLACA(saveNRTdeltaListComp,compEntry)
;   u :=
;     [eltOrConst,'$,$NRTbase+$NRTdeltaLength-index] where index ==
;       (n:= POSN1(opModemapPair,$NRTdeltaList)) => n + 1
;         --n + 1 since $NRTdeltaLength is 1 too large
;       $NRTdeltaList:= [opModemapPair,:$NRTdeltaList]
;       $NRTdeltaListComp:=[nil,:$NRTdeltaListComp]
;       $NRTdeltaLength := $NRTdeltaLength+1
;       0
;   u

(DEFUN |genDeltaEntry| (|opMmPair| |e|)
  (PROG (|$compUniquelyIfTrue| |u| |n| |compEntry| |saveNRTdeltaListComp|
         |opModemapPair| |odc| |newimp| |nsig| |eltOrConst| |cform| |sig| |dc|
         |op|)
    (DECLARE (SPECIAL |$compUniquelyIfTrue|))
    (RETURN
     (PROGN
      (SETQ |$compUniquelyIfTrue| NIL)
      (SETQ |op| (CAR |opMmPair|))
      (SETQ |dc| (CAADR . #1=(|opMmPair|)))
      (SETQ |sig| (CDADR . #1#))
      (SETQ |cform| (CAR . #2=((CDADDR . #1#))))
      (SETQ |eltOrConst| (CAAR . #2#))
      (SETQ |nsig| (CADDAR . #2#))
      (COND ((EQ |eltOrConst| 'XLAM) |cform|)
            (#3='T
             (PROGN
              (COND
               ((ATOM |dc|)
                (COND ((EQ |dc| '$) (SETQ |nsig| |sig|))
                      (#3#
                       (COND
                        ((NUMBERP |nsig|)
                         (SETQ |nsig|
                                 (|substitute| '$ |dc|
                                  (|substitute| '$$ '$ |sig|)))))))))
              (COND
               ((SETQ |newimp|
                        (|optDeltaEntry| |op| |nsig| |dc| |eltOrConst| |e|))
                |newimp|)
               ((SETDIFFERENCE (|listOfBoundVars| |dc| |e|)
                               |$functorLocalParameters|)
                (LIST '|applyFun|
                      (LIST '|compiledLookupCheck| (MKQ |op|)
                            (|mkList| (|consSig| |nsig| |dc| |e|))
                            (|consDomainForm| |dc| NIL |e|))))
               (#3#
                (PROGN
                 (SETQ |odc| |dc|)
                 (COND
                  ((NULL (ATOM |dc|)) (SETQ |dc| (|substitute| '$$ '$ |dc|))))
                 (SETQ |opModemapPair|
                         (LIST |op|
                               (CONS |dc|
                                     ((LAMBDA (|bfVar#24| |bfVar#23| |x|)
                                        (LOOP
                                         (COND
                                          ((OR (ATOM |bfVar#23|)
                                               (PROGN
                                                (SETQ |x| (CAR |bfVar#23|))
                                                NIL))
                                           (RETURN (NREVERSE |bfVar#24|)))
                                          (#3#
                                           (SETQ |bfVar#24|
                                                   (CONS
                                                    (|genDeltaSig| |x| |e|)
                                                    |bfVar#24|))))
                                         (SETQ |bfVar#23| (CDR |bfVar#23|))))
                                      NIL |nsig| NIL))
                               (LIST 'T |cform|)))
                 (COND
                  ((AND (NULL (|NRTassocIndex| |dc|))
                        (NOT (EQUAL |dc| |$NRTaddForm|))
                        (OR (|member| |dc| |$functorLocalParameters|)
                            (NULL (ATOM |dc|))))
                   (SETQ |$NRTdeltaList|
                           (CONS
                            (CONS '|domain|
                                  (CONS (|NRTaddInner| |dc| |e|) |dc|))
                            |$NRTdeltaList|))
                   (SETQ |saveNRTdeltaListComp|
                           (SETQ |$NRTdeltaListComp|
                                   (CONS NIL |$NRTdeltaListComp|)))
                   (SETQ |$NRTdeltaLength| (+ |$NRTdeltaLength| 1))
                   (SETQ |compEntry|
                           (CAR (|compOrCroak| |odc| |$EmptyMode| |e|)))
                   (RPLACA |saveNRTdeltaListComp| |compEntry|)))
                 (SETQ |u|
                         (LIST |eltOrConst| '$
                               (- (+ |$NRTbase| |$NRTdeltaLength|)
                                  (COND
                                   ((SETQ |n|
                                            (POSN1 |opModemapPair|
                                             |$NRTdeltaList|))
                                    (+ |n| 1))
                                   (#3#
                                    (PROGN
                                     (SETQ |$NRTdeltaList|
                                             (CONS |opModemapPair|
                                                   |$NRTdeltaList|))
                                     (SETQ |$NRTdeltaListComp|
                                             (CONS NIL |$NRTdeltaListComp|))
                                     (SETQ |$NRTdeltaLength|
                                             (+ |$NRTdeltaLength| 1))
                                     0))))))
                 |u|))))))))))

; genDeltaSig(x, e) ==
;   NRTgetLocalIndex(x, e)

(DEFUN |genDeltaSig| (|x| |e|) (PROG () (RETURN (|NRTgetLocalIndex| |x| |e|))))

; NRTassocIndex x == --returns index of "domain" entry x in al
;   NULL x => x
;   x = $NRTaddForm => 5
;   k := or/[i for i in 1.. for y in $NRTdeltaList
;             | first(y) = 'domain and NTH(1, y) = x] =>
;     $NRTbase + $NRTdeltaLength - k
;   nil

(DEFUN |NRTassocIndex| (|x|)
  (PROG (|k|)
    (RETURN
     (COND ((NULL |x|) |x|) ((EQUAL |x| |$NRTaddForm|) 5)
           ((SETQ |k|
                    ((LAMBDA (|bfVar#26| |i| |bfVar#25| |y|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#25|)
                              (PROGN (SETQ |y| (CAR |bfVar#25|)) NIL))
                          (RETURN |bfVar#26|))
                         (#1='T
                          (AND (EQ (CAR |y|) '|domain|) (EQUAL (NTH 1 |y|) |x|)
                               (PROGN
                                (SETQ |bfVar#26| |i|)
                                (COND (|bfVar#26| (RETURN |bfVar#26|)))))))
                        (SETQ |i| (+ |i| 1))
                        (SETQ |bfVar#25| (CDR |bfVar#25|))))
                     NIL 1 |$NRTdeltaList| NIL))
            (- (+ |$NRTbase| |$NRTdeltaLength|) |k|))
           (#1# NIL)))))

; NRTgetLocalIndex(item, e) ==
;   k := NRTassocIndex item => k
;   item = $NRTaddForm => 5
;   item = '$ => 0
;   item = '_$_$ => 2
;   value:=
;     MEMQ(item,$formalArgList) => item
;     nil
;   atom item and null MEMQ(item,'($ _$_$))
;    and null value =>  --give slots to atoms
;     $NRTdeltaList := [['domain, NRTaddInner(item, e), :value], :$NRTdeltaList]
;     $NRTdeltaListComp:=[item,:$NRTdeltaListComp]
;     $NRTdeltaLength := $NRTdeltaLength+1
;     $NRTbase + $NRTdeltaLength - 1
;   $NRTdeltaList := [['domain, NRTaddInner(item, e), :value], :$NRTdeltaList]
;   saveNRTdeltaListComp:= $NRTdeltaListComp:=[nil,:$NRTdeltaListComp]
;   saveIndex := $NRTbase + $NRTdeltaLength
;   $NRTdeltaLength := $NRTdeltaLength+1
;   compEntry := comp_delta_entry(item, e)
;   RPLACA(saveNRTdeltaListComp,compEntry)
;   saveIndex

(DEFUN |NRTgetLocalIndex| (|item| |e|)
  (PROG (|k| |value| |saveNRTdeltaListComp| |saveIndex| |compEntry|)
    (RETURN
     (COND ((SETQ |k| (|NRTassocIndex| |item|)) |k|)
           ((EQUAL |item| |$NRTaddForm|) 5) ((EQ |item| '$) 0)
           ((EQ |item| '$$) 2)
           (#1='T
            (PROGN
             (SETQ |value|
                     (COND ((MEMQ |item| |$formalArgList|) |item|) (#1# NIL)))
             (COND
              ((AND (ATOM |item|) (NULL (MEMQ |item| '($ $$))) (NULL |value|))
               (PROGN
                (SETQ |$NRTdeltaList|
                        (CONS
                         (CONS '|domain|
                               (CONS (|NRTaddInner| |item| |e|) |value|))
                         |$NRTdeltaList|))
                (SETQ |$NRTdeltaListComp| (CONS |item| |$NRTdeltaListComp|))
                (SETQ |$NRTdeltaLength| (+ |$NRTdeltaLength| 1))
                (- (+ |$NRTbase| |$NRTdeltaLength|) 1)))
              (#1#
               (PROGN
                (SETQ |$NRTdeltaList|
                        (CONS
                         (CONS '|domain|
                               (CONS (|NRTaddInner| |item| |e|) |value|))
                         |$NRTdeltaList|))
                (SETQ |saveNRTdeltaListComp|
                        (SETQ |$NRTdeltaListComp|
                                (CONS NIL |$NRTdeltaListComp|)))
                (SETQ |saveIndex| (+ |$NRTbase| |$NRTdeltaLength|))
                (SETQ |$NRTdeltaLength| (+ |$NRTdeltaLength| 1))
                (SETQ |compEntry| (|comp_delta_entry| |item| |e|))
                (RPLACA |saveNRTdeltaListComp| |compEntry|)
                |saveIndex|)))))))))

; DEFVAR($generatingCall, nil)

(DEFVAR |$generatingCall| NIL)

; comp_delta_entry(item, e) ==
;     $generatingCall and cheap_comp_delta_entry(item) => item
;     (compOrCroak(item, $EmptyMode, e)).expr

(DEFUN |comp_delta_entry| (|item| |e|)
  (PROG ()
    (RETURN
     (COND ((AND |$generatingCall| (|cheap_comp_delta_entry| |item|)) |item|)
           ('T (CAR (|compOrCroak| |item| |$EmptyMode| |e|)))))))

; cheap_comp_delta_entry(item) ==
;     item is [op, :args] =>
;         not(ATOM(op)) => false
;         null(cosig := GETDATABASE(op, 'COSIG)) => false
;         ok := true
;         for arg in args for tp in rest(cosig) while ok repeat
;             ok :=
;                 not(tp) => false
;                 arg = '$ => true
;                 MEMBER(arg, $functorLocalParameters) => true
;                 cheap_comp_delta_entry(arg)
;         ok
;     false

(DEFUN |cheap_comp_delta_entry| (|item|)
  (PROG (|op| |args| |cosig| |ok|)
    (RETURN
     (COND
      ((AND (CONSP |item|)
            (PROGN (SETQ |op| (CAR |item|)) (SETQ |args| (CDR |item|)) #1='T))
       (COND ((NULL (ATOM |op|)) NIL)
             ((NULL (SETQ |cosig| (GETDATABASE |op| 'COSIG))) NIL)
             (#1#
              (PROGN
               (SETQ |ok| T)
               ((LAMBDA (|bfVar#27| |arg| |bfVar#28| |tp|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#27|)
                         (PROGN (SETQ |arg| (CAR |bfVar#27|)) NIL)
                         (ATOM |bfVar#28|)
                         (PROGN (SETQ |tp| (CAR |bfVar#28|)) NIL) (NOT |ok|))
                     (RETURN NIL))
                    (#1#
                     (SETQ |ok|
                             (COND ((NULL |tp|) NIL) ((EQ |arg| '$) T)
                                   ((MEMBER |arg| |$functorLocalParameters|) T)
                                   (#1# (|cheap_comp_delta_entry| |arg|))))))
                   (SETQ |bfVar#27| (CDR |bfVar#27|))
                   (SETQ |bfVar#28| (CDR |bfVar#28|))))
                |args| NIL (CDR |cosig|) NIL)
               |ok|))))
      (#1# NIL)))))

; NRTassignCapsuleFunctionSlot(op, sig, base_shell, e) ==
; --called from compDefineCapsuleFunction
;   opSig := [op,sig]
;   [., ., implementation] := NRTisExported?(opSig, base_shell) or return nil
;     --if opSig is not exported, it is local and need not be assigned
;   if $insideCategoryPackageIfTrue then
;       sig := substitute('$,CADR($functorForm),sig)
;   sig := [genDeltaSig(x, e) for x in sig]
;   opModemapPair := [op,['_$,:sig],['T,implementation]]
;   POSN1(opModemapPair,$NRTdeltaList) => nil   --already there
;   $NRTdeltaList:= [opModemapPair,:$NRTdeltaList]
;   $NRTdeltaListComp := [nil,:$NRTdeltaListComp]
;   $NRTdeltaLength := $NRTdeltaLength+1

(DEFUN |NRTassignCapsuleFunctionSlot| (|op| |sig| |base_shell| |e|)
  (PROG (|opSig| |LETTMP#1| |implementation| |opModemapPair|)
    (RETURN
     (PROGN
      (SETQ |opSig| (LIST |op| |sig|))
      (SETQ |LETTMP#1|
              (OR (|NRTisExported?| |opSig| |base_shell|) (RETURN NIL)))
      (SETQ |implementation| (CADDR |LETTMP#1|))
      (COND
       (|$insideCategoryPackageIfTrue|
        (SETQ |sig| (|substitute| '$ (CADR |$functorForm|) |sig|))))
      (SETQ |sig|
              ((LAMBDA (|bfVar#30| |bfVar#29| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#29|)
                        (PROGN (SETQ |x| (CAR |bfVar#29|)) NIL))
                    (RETURN (NREVERSE |bfVar#30|)))
                   (#1='T
                    (SETQ |bfVar#30|
                            (CONS (|genDeltaSig| |x| |e|) |bfVar#30|))))
                  (SETQ |bfVar#29| (CDR |bfVar#29|))))
               NIL |sig| NIL))
      (SETQ |opModemapPair|
              (LIST |op| (CONS '$ |sig|) (LIST 'T |implementation|)))
      (COND ((POSN1 |opModemapPair| |$NRTdeltaList|) NIL)
            (#1#
             (PROGN
              (SETQ |$NRTdeltaList| (CONS |opModemapPair| |$NRTdeltaList|))
              (SETQ |$NRTdeltaListComp| (CONS NIL |$NRTdeltaListComp|))
              (SETQ |$NRTdeltaLength| (+ |$NRTdeltaLength| 1)))))))))

; NRTisExported?(opSig, base_shell) ==
;   or/[u for u in base_shell.1 | u.0 = opSig]

(DEFUN |NRTisExported?| (|opSig| |base_shell|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#32| |bfVar#31| |u|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#31|) (PROGN (SETQ |u| (CAR |bfVar#31|)) NIL))
           (RETURN |bfVar#32|))
          ('T
           (AND (EQUAL (ELT |u| 0) |opSig|)
                (PROGN
                 (SETQ |bfVar#32| |u|)
                 (COND (|bfVar#32| (RETURN |bfVar#32|)))))))
         (SETQ |bfVar#31| (CDR |bfVar#31|))))
      NIL (ELT |base_shell| 1) NIL))))

; consSig(sig, dc, e) == [consDomainName(sigpart, dc, e) for sigpart in sig]

(DEFUN |consSig| (|sig| |dc| |e|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#34| |bfVar#33| |sigpart|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#33|) (PROGN (SETQ |sigpart| (CAR |bfVar#33|)) NIL))
           (RETURN (NREVERSE |bfVar#34|)))
          ('T
           (SETQ |bfVar#34|
                   (CONS (|consDomainName| |sigpart| |dc| |e|) |bfVar#34|))))
         (SETQ |bfVar#33| (CDR |bfVar#33|))))
      NIL |sig| NIL))))

; consDomainName(x, dc, e) ==
;   x = dc => ''$
;   x = '$ => ''$
;   x = "$$" => ['devaluate,'$]
;   x is [op,:argl] =>
;     (op = 'Record) or (op = 'Union and argl is [[":",:.],:.])  =>
;        mkList [MKQ op,
;          :[['LIST, MKQ '_:, MKQ tag, consDomainName(dom, dc, e)]
;                    for [.,tag,dom] in argl]]
;     isFunctor op or op = 'Mapping or constructor? op =>
;          -- call to constructor? needed if op was compiled in $bootStrapMode
;         mkList [MKQ op, :[consDomainName(y, dc, e) for y in argl]]
;     substitute('$,"$$",x)
;   x = [] => x
;   (y := LASSOC(x,$devaluateList)) => y
;   k:=NRTassocIndex x =>
;     ['devaluate,['ELT,'$,k]]
;   get(x, 'value, e) =>
;     isDomainForm(x, e) => ['devaluate, x]
;     x
;   MKQ x

(DEFUN |consDomainName| (|x| |dc| |e|)
  (PROG (|op| |argl| |ISTMP#1| |tag| |ISTMP#2| |dom| |y| |k|)
    (RETURN
     (COND ((EQUAL |x| |dc|) ''$) ((EQ |x| '$) ''$)
           ((EQ |x| '$$) (LIST '|devaluate| '$))
           ((AND (CONSP |x|)
                 (PROGN (SETQ |op| (CAR |x|)) (SETQ |argl| (CDR |x|)) #1='T))
            (COND
             ((OR (EQ |op| '|Record|)
                  (AND (EQ |op| '|Union|) (CONSP |argl|)
                       (PROGN
                        (SETQ |ISTMP#1| (CAR |argl|))
                        (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|:|)))))
              (|mkList|
               (CONS (MKQ |op|)
                     ((LAMBDA (|bfVar#37| |bfVar#36| |bfVar#35|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#36|)
                               (PROGN (SETQ |bfVar#35| (CAR |bfVar#36|)) NIL))
                           (RETURN (NREVERSE |bfVar#37|)))
                          (#1#
                           (AND (CONSP |bfVar#35|)
                                (PROGN
                                 (SETQ |ISTMP#1| (CDR |bfVar#35|))
                                 (AND (CONSP |ISTMP#1|)
                                      (PROGN
                                       (SETQ |tag| (CAR |ISTMP#1|))
                                       (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                       (AND (CONSP |ISTMP#2|)
                                            (EQ (CDR |ISTMP#2|) NIL)
                                            (PROGN
                                             (SETQ |dom| (CAR |ISTMP#2|))
                                             #1#)))))
                                (SETQ |bfVar#37|
                                        (CONS
                                         (LIST 'LIST (MKQ '|:|) (MKQ |tag|)
                                               (|consDomainName| |dom| |dc|
                                                |e|))
                                         |bfVar#37|)))))
                         (SETQ |bfVar#36| (CDR |bfVar#36|))))
                      NIL |argl| NIL))))
             ((OR (|isFunctor| |op|) (EQ |op| '|Mapping|)
                  (|constructor?| |op|))
              (|mkList|
               (CONS (MKQ |op|)
                     ((LAMBDA (|bfVar#39| |bfVar#38| |y|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#38|)
                               (PROGN (SETQ |y| (CAR |bfVar#38|)) NIL))
                           (RETURN (NREVERSE |bfVar#39|)))
                          (#1#
                           (SETQ |bfVar#39|
                                   (CONS (|consDomainName| |y| |dc| |e|)
                                         |bfVar#39|))))
                         (SETQ |bfVar#38| (CDR |bfVar#38|))))
                      NIL |argl| NIL))))
             (#1# (|substitute| '$ '$$ |x|))))
           ((NULL |x|) |x|) ((SETQ |y| (LASSOC |x| |$devaluateList|)) |y|)
           ((SETQ |k| (|NRTassocIndex| |x|))
            (LIST '|devaluate| (LIST 'ELT '$ |k|)))
           ((|get| |x| '|value| |e|)
            (COND ((|isDomainForm| |x| |e|) (LIST '|devaluate| |x|))
                  (#1# |x|)))
           (#1# (MKQ |x|))))))

; consDomainForm(x, dc, e) ==
;   x = '$ => '$
;   x is [op,:argl] =>
;       op = ":" and argl is [tag, value] =>
;           [op, tag, consDomainForm(value, dc, e)]
;       [op, :[consDomainForm(y, dc, e) for y in argl]]
;   x = [] => x
;   (y := LASSOC(x,$devaluateList)) => y
;   k:=NRTassocIndex x => ['ELT,'$,k]
;   get(x, 'value, e) or get(x, 'mode, e) => x
;   MKQ x

(DEFUN |consDomainForm| (|x| |dc| |e|)
  (PROG (|op| |argl| |tag| |ISTMP#1| |value| |y| |k|)
    (RETURN
     (COND ((EQ |x| '$) '$)
           ((AND (CONSP |x|)
                 (PROGN (SETQ |op| (CAR |x|)) (SETQ |argl| (CDR |x|)) #1='T))
            (COND
             ((AND (EQ |op| '|:|) (CONSP |argl|)
                   (PROGN
                    (SETQ |tag| (CAR |argl|))
                    (SETQ |ISTMP#1| (CDR |argl|))
                    (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                         (PROGN (SETQ |value| (CAR |ISTMP#1|)) #1#))))
              (LIST |op| |tag| (|consDomainForm| |value| |dc| |e|)))
             (#1#
              (CONS |op|
                    ((LAMBDA (|bfVar#41| |bfVar#40| |y|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#40|)
                              (PROGN (SETQ |y| (CAR |bfVar#40|)) NIL))
                          (RETURN (NREVERSE |bfVar#41|)))
                         (#1#
                          (SETQ |bfVar#41|
                                  (CONS (|consDomainForm| |y| |dc| |e|)
                                        |bfVar#41|))))
                        (SETQ |bfVar#40| (CDR |bfVar#40|))))
                     NIL |argl| NIL)))))
           ((NULL |x|) |x|) ((SETQ |y| (LASSOC |x| |$devaluateList|)) |y|)
           ((SETQ |k| (|NRTassocIndex| |x|)) (LIST 'ELT '$ |k|))
           ((OR (|get| |x| '|value| |e|) (|get| |x| '|mode| |e|)) |x|)
           (#1# (MKQ |x|))))))

; get_self_preds2(p, acc) ==
;     p is [op, :l] =>
;         MEMQ(op, '(AND and OR or NOT not)) => get_self_preds1(l, acc)
;         op is "HasCategory" =>
;             first(l) = "$" => CONS(CADR(l), acc)
;             acc
;         acc
;     acc

(DEFUN |get_self_preds2| (|p| |acc|)
  (PROG (|op| |l|)
    (RETURN
     (COND
      ((AND (CONSP |p|)
            (PROGN (SETQ |op| (CAR |p|)) (SETQ |l| (CDR |p|)) #1='T))
       (COND
        ((MEMQ |op| '(AND |and| OR |or| NOT |not|))
         (|get_self_preds1| |l| |acc|))
        ((EQ |op| '|HasCategory|)
         (COND ((EQ (CAR |l|) '$) (CONS (CADR |l|) |acc|)) (#1# |acc|)))
        (#1# |acc|)))
      (#1# |acc|)))))

; get_self_preds1(pl, acc) ==
;     for p in pl repeat
;         acc := get_self_preds2(p, acc)
;     acc

(DEFUN |get_self_preds1| (|pl| |acc|)
  (PROG ()
    (RETURN
     (PROGN
      ((LAMBDA (|bfVar#42| |p|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#42|) (PROGN (SETQ |p| (CAR |bfVar#42|)) NIL))
            (RETURN NIL))
           ('T (SETQ |acc| (|get_self_preds2| |p| |acc|))))
          (SETQ |bfVar#42| (CDR |bfVar#42|))))
       |pl| NIL)
      |acc|))))

; get_self_preds(pl) == REMDUP get_self_preds1(pl, nil)

(DEFUN |get_self_preds| (|pl|)
  (PROG () (RETURN (REMDUP (|get_self_preds1| |pl| NIL)))))

; boolean_subst_and(l, sub_data) ==
;     res := []
;     for cond in l repeat
;         nc := boolean_subst1(cond, sub_data)
;         nc = true => "iterate"
;         not(nc) =>
;             res := [nc]
;             return first(res)
;         res := cons(nc, res)
;     res = [] => true
;     #res = 1 => first(res)
;     ["AND", :nreverse(res)]

(DEFUN |boolean_subst_and| (|l| |sub_data|)
  (PROG (|res| |nc|)
    (RETURN
     (PROGN
      (SETQ |res| NIL)
      ((LAMBDA (|bfVar#43| |cond|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#43|) (PROGN (SETQ |cond| (CAR |bfVar#43|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (SETQ |nc| (|boolean_subst1| |cond| |sub_data|))
             (COND ((EQUAL |nc| T) '|iterate|)
                   ((NULL |nc|)
                    (PROGN (SETQ |res| (LIST |nc|)) (RETURN (CAR |res|))))
                   (#1# (SETQ |res| (CONS |nc| |res|)))))))
          (SETQ |bfVar#43| (CDR |bfVar#43|))))
       |l| NIL)
      (COND ((NULL |res|) T) ((EQL (LENGTH |res|) 1) (CAR |res|))
            (#1# (CONS 'AND (NREVERSE |res|))))))))

; boolean_subst_or(l, sub_data) ==
;     res := []
;     for cond in l repeat
;         nc := boolean_subst1(cond, sub_data)
;         nc = true =>
;             res := [nc]
;             return first(res)
;         not(nc) => "iterate"
;         res := cons(nc, res)
;     res = [] => false
;     #res = 1 => first(res)
;     ["OR", :nreverse(res)]

(DEFUN |boolean_subst_or| (|l| |sub_data|)
  (PROG (|res| |nc|)
    (RETURN
     (PROGN
      (SETQ |res| NIL)
      ((LAMBDA (|bfVar#44| |cond|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#44|) (PROGN (SETQ |cond| (CAR |bfVar#44|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (SETQ |nc| (|boolean_subst1| |cond| |sub_data|))
             (COND
              ((EQUAL |nc| T)
               (PROGN (SETQ |res| (LIST |nc|)) (RETURN (CAR |res|))))
              ((NULL |nc|) '|iterate|) (#1# (SETQ |res| (CONS |nc| |res|)))))))
          (SETQ |bfVar#44| (CDR |bfVar#44|))))
       |l| NIL)
      (COND ((NULL |res|) NIL) ((EQL (LENGTH |res|) 1) (CAR |res|))
            (#1# (CONS 'OR (NREVERSE |res|))))))))

; boolean_subst_not(cond, sub_data) ==
;    sub_data1 := rest(rest(sub_data))
;    nc := boolean_subst1(cond, [FUNCTION boolean_substitute1, nil, :sub_data1])
;    nc = true => false
;    not(nc) => true
;    ["NOT", nc]

(DEFUN |boolean_subst_not| (|cond| |sub_data|)
  (PROG (|sub_data1| |nc|)
    (RETURN
     (PROGN
      (SETQ |sub_data1| (CDR (CDR |sub_data|)))
      (SETQ |nc|
              (|boolean_subst1| |cond|
               (CONS #'|boolean_substitute1| (CONS NIL |sub_data1|))))
      (COND ((EQUAL |nc| T) NIL) ((NULL |nc|) T) ('T (LIST 'NOT |nc|)))))))

; boolean_do_subst1(cond, sub_data) ==
;     fun := first(sub_data)
;     FUNCALL(fun, cond, rest(sub_data))

(DEFUN |boolean_do_subst1| (|cond| |sub_data|)
  (PROG (|fun|)
    (RETURN
     (PROGN
      (SETQ |fun| (CAR |sub_data|))
      (FUNCALL |fun| |cond| (CDR |sub_data|))))))

; boolean_subst1(cond, sub_data) ==
;     cond = true => cond
;     cond is [op, :l] =>
;         MEMQ(op, '(AND and)) => boolean_subst_and(l, sub_data)
;         MEMQ(op, '(OR or)) => boolean_subst_or(l, sub_data)
;         MEMQ(op, '(NOT not)) => boolean_subst_not(first(l), sub_data)
;         boolean_do_subst1(cond, sub_data)
;     cond

(DEFUN |boolean_subst1| (|cond| |sub_data|)
  (PROG (|op| |l|)
    (RETURN
     (COND ((EQUAL |cond| T) |cond|)
           ((AND (CONSP |cond|)
                 (PROGN
                  (SETQ |op| (CAR |cond|))
                  (SETQ |l| (CDR |cond|))
                  #1='T))
            (COND
             ((MEMQ |op| '(AND |and|)) (|boolean_subst_and| |l| |sub_data|))
             ((MEMQ |op| '(OR |or|)) (|boolean_subst_or| |l| |sub_data|))
             ((MEMQ |op| '(NOT |not|))
              (|boolean_subst_not| (CAR |l|) |sub_data|))
             (#1# (|boolean_do_subst1| |cond| |sub_data|))))
           (#1# |cond|)))))

; boolean_substitute1(cond, sub_data) ==
;     sub_data := rest(sub_data)
;     good_preds := first(rest(sub_data))
;     nc := LASSOC(cond, good_preds)
;     nc =>
;         RPLACA(sub_data, true)
;         first(nc)
;     cond

(DEFUN |boolean_substitute1| (|cond| |sub_data|)
  (PROG (|good_preds| |nc|)
    (RETURN
     (PROGN
      (SETQ |sub_data| (CDR |sub_data|))
      (SETQ |good_preds| (CAR (CDR |sub_data|)))
      (SETQ |nc| (LASSOC |cond| |good_preds|))
      (COND (|nc| (PROGN (RPLACA |sub_data| T) (CAR |nc|))) ('T |cond|))))))

; boolean_substitute_cond(cond, sub_data) ==
;     cond = first(sub_data) =>
;         RPLACA(rest(sub_data), true)
;         false
;     boolean_substitute1(cond, sub_data)

(DEFUN |boolean_substitute_cond| (|cond| |sub_data|)
  (PROG ()
    (RETURN
     (COND
      ((EQUAL |cond| (CAR |sub_data|)) (PROGN (RPLACA (CDR |sub_data|) T) NIL))
      ('T (|boolean_substitute1| |cond| |sub_data|))))))

; mk_has_dollar_quote(cat) ==
;     ["HasCategory", "$", ["QUOTE", cat]]

(DEFUN |mk_has_dollar_quote| (|cat|)
  (PROG () (RETURN (LIST '|HasCategory| '$ (LIST 'QUOTE |cat|)))))

; boolean_subst(condCats, cats, sub_data1) ==
;     [boolean_subst1(cond, [FUNCTION boolean_substitute_cond,
;                            mk_has_dollar_quote(cat), :sub_data1])
;           for cond in condCats for cat in cats]

(DEFUN |boolean_subst| (|condCats| |cats| |sub_data1|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#47| |bfVar#45| |cond| |bfVar#46| |cat|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#45|) (PROGN (SETQ |cond| (CAR |bfVar#45|)) NIL)
               (ATOM |bfVar#46|) (PROGN (SETQ |cat| (CAR |bfVar#46|)) NIL))
           (RETURN (NREVERSE |bfVar#47|)))
          ('T
           (SETQ |bfVar#47|
                   (CONS
                    (|boolean_subst1| |cond|
                     (CONS #'|boolean_substitute_cond|
                           (CONS (|mk_has_dollar_quote| |cat|) |sub_data1|)))
                    |bfVar#47|))))
         (SETQ |bfVar#45| (CDR |bfVar#45|))
         (SETQ |bfVar#46| (CDR |bfVar#46|))))
      NIL |condCats| NIL |cats| NIL))))

; simplify_self_preds1(catvecListMaker, condCats) ==
;     self_preds := get_self_preds(condCats)
;     self_preds := [cat for p in self_preds | p is ["QUOTE", cat]]
;     self_preds = [] => [condCats, false]
;     found_preds := []
;     false_preds := []
;     for c1 in self_preds repeat
;         op1 := opOf(c1)
;         hl := []
;         found := false
;         for c2 in catvecListMaker for cond in condCats repeat
;             c1 = c2 =>
;                 found_preds := CONS([c1, cond], found_preds)
;                 found := true
;             if op1 = opOf(c2) then
;                 hl := CONS([c2, cond], hl)
;         if not(found) and not(hl) then
;             false_preds := CONS(c1, false_preds)
;     good_preds := [cc for cc in found_preds |
;                      cc is [cat, cond] and not(isHasDollarPred(cond))]
;     good_preds := [:[[mk_has_dollar_quote(cat), false] for cat in false_preds],
;                    :[[mk_has_dollar_quote(cat), cond] for cc in good_preds
;                       | cc is [cat, cond]]]
;     sub_data1 := [false, good_preds]
;     condCats := boolean_subst(condCats, catvecListMaker, sub_data1)
;     if not(first(sub_data1)) then
;         userError(["simplify_self_preds1: cannot simplify", $op, self_preds])
;     [condCats, first(sub_data1)]

(DEFUN |simplify_self_preds1| (|catvecListMaker| |condCats|)
  (PROG (|self_preds| |ISTMP#1| |cat| |found_preds| |false_preds| |op1| |hl|
         |found| |cond| |good_preds| |sub_data1|)
    (RETURN
     (PROGN
      (SETQ |self_preds| (|get_self_preds| |condCats|))
      (SETQ |self_preds|
              ((LAMBDA (|bfVar#49| |bfVar#48| |p|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#48|)
                        (PROGN (SETQ |p| (CAR |bfVar#48|)) NIL))
                    (RETURN (NREVERSE |bfVar#49|)))
                   (#1='T
                    (AND (CONSP |p|) (EQ (CAR |p|) 'QUOTE)
                         (PROGN
                          (SETQ |ISTMP#1| (CDR |p|))
                          (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                               (PROGN (SETQ |cat| (CAR |ISTMP#1|)) #1#)))
                         (SETQ |bfVar#49| (CONS |cat| |bfVar#49|)))))
                  (SETQ |bfVar#48| (CDR |bfVar#48|))))
               NIL |self_preds| NIL))
      (COND ((NULL |self_preds|) (LIST |condCats| NIL))
            (#1#
             (PROGN
              (SETQ |found_preds| NIL)
              (SETQ |false_preds| NIL)
              ((LAMBDA (|bfVar#50| |c1|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#50|)
                        (PROGN (SETQ |c1| (CAR |bfVar#50|)) NIL))
                    (RETURN NIL))
                   (#1#
                    (PROGN
                     (SETQ |op1| (|opOf| |c1|))
                     (SETQ |hl| NIL)
                     (SETQ |found| NIL)
                     ((LAMBDA (|bfVar#51| |c2| |bfVar#52| |cond|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#51|)
                               (PROGN (SETQ |c2| (CAR |bfVar#51|)) NIL)
                               (ATOM |bfVar#52|)
                               (PROGN (SETQ |cond| (CAR |bfVar#52|)) NIL))
                           (RETURN NIL))
                          (#1#
                           (COND
                            ((EQUAL |c1| |c2|)
                             (PROGN
                              (SETQ |found_preds|
                                      (CONS (LIST |c1| |cond|) |found_preds|))
                              (SETQ |found| T)))
                            (#1#
                             (COND
                              ((EQUAL |op1| (|opOf| |c2|))
                               (SETQ |hl| (CONS (LIST |c2| |cond|) |hl|))))))))
                         (SETQ |bfVar#51| (CDR |bfVar#51|))
                         (SETQ |bfVar#52| (CDR |bfVar#52|))))
                      |catvecListMaker| NIL |condCats| NIL)
                     (COND
                      ((AND (NULL |found|) (NULL |hl|))
                       (SETQ |false_preds| (CONS |c1| |false_preds|)))))))
                  (SETQ |bfVar#50| (CDR |bfVar#50|))))
               |self_preds| NIL)
              (SETQ |good_preds|
                      ((LAMBDA (|bfVar#54| |bfVar#53| |cc|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#53|)
                                (PROGN (SETQ |cc| (CAR |bfVar#53|)) NIL))
                            (RETURN (NREVERSE |bfVar#54|)))
                           (#1#
                            (AND (CONSP |cc|)
                                 (PROGN
                                  (SETQ |cat| (CAR |cc|))
                                  (SETQ |ISTMP#1| (CDR |cc|))
                                  (AND (CONSP |ISTMP#1|)
                                       (EQ (CDR |ISTMP#1|) NIL)
                                       (PROGN
                                        (SETQ |cond| (CAR |ISTMP#1|))
                                        #1#)))
                                 (NULL (|isHasDollarPred| |cond|))
                                 (SETQ |bfVar#54| (CONS |cc| |bfVar#54|)))))
                          (SETQ |bfVar#53| (CDR |bfVar#53|))))
                       NIL |found_preds| NIL))
              (SETQ |good_preds|
                      (APPEND
                       ((LAMBDA (|bfVar#56| |bfVar#55| |cat|)
                          (LOOP
                           (COND
                            ((OR (ATOM |bfVar#55|)
                                 (PROGN (SETQ |cat| (CAR |bfVar#55|)) NIL))
                             (RETURN (NREVERSE |bfVar#56|)))
                            (#1#
                             (SETQ |bfVar#56|
                                     (CONS
                                      (LIST (|mk_has_dollar_quote| |cat|) NIL)
                                      |bfVar#56|))))
                           (SETQ |bfVar#55| (CDR |bfVar#55|))))
                        NIL |false_preds| NIL)
                       ((LAMBDA (|bfVar#58| |bfVar#57| |cc|)
                          (LOOP
                           (COND
                            ((OR (ATOM |bfVar#57|)
                                 (PROGN (SETQ |cc| (CAR |bfVar#57|)) NIL))
                             (RETURN (NREVERSE |bfVar#58|)))
                            (#1#
                             (AND (CONSP |cc|)
                                  (PROGN
                                   (SETQ |cat| (CAR |cc|))
                                   (SETQ |ISTMP#1| (CDR |cc|))
                                   (AND (CONSP |ISTMP#1|)
                                        (EQ (CDR |ISTMP#1|) NIL)
                                        (PROGN
                                         (SETQ |cond| (CAR |ISTMP#1|))
                                         #1#)))
                                  (SETQ |bfVar#58|
                                          (CONS
                                           (LIST (|mk_has_dollar_quote| |cat|)
                                                 |cond|)
                                           |bfVar#58|)))))
                           (SETQ |bfVar#57| (CDR |bfVar#57|))))
                        NIL |good_preds| NIL)))
              (SETQ |sub_data1| (LIST NIL |good_preds|))
              (SETQ |condCats|
                      (|boolean_subst| |condCats| |catvecListMaker|
                       |sub_data1|))
              (COND
               ((NULL (CAR |sub_data1|))
                (|userError|
                 (LIST '|simplify_self_preds1: cannot simplify| |$op|
                       |self_preds|))))
              (LIST |condCats| (CAR |sub_data1|)))))))))

; simplify_self_preds(catvecListMaker, condCats) ==
;     progress := true
;     while progress repeat
;         [condCats, progress] := simplify_self_preds1(catvecListMaker, condCats)
;     condCats

(DEFUN |simplify_self_preds| (|catvecListMaker| |condCats|)
  (PROG (|progress| |LETTMP#1|)
    (RETURN
     (PROGN
      (SETQ |progress| T)
      ((LAMBDA ()
         (LOOP
          (COND ((NOT |progress|) (RETURN NIL))
                ('T
                 (PROGN
                  (SETQ |LETTMP#1|
                          (|simplify_self_preds1| |catvecListMaker|
                           |condCats|))
                  (SETQ |condCats| (CAR |LETTMP#1|))
                  (SETQ |progress| (CADR |LETTMP#1|))
                  |LETTMP#1|))))))
      |condCats|))))

; buildFunctor(definition is [name, :args], sig, code, $locals,
;              base_shell, e) ==
; --PARAMETERS
; --  $definition: constructor form, e.g. (SquareMatrix 10 (RationalNumber))
; --  sig: signature of constructor form
; --  code: result of "doIt", converting body of capsule to CodeDefine forms, e.g.
; --       (PROGN (LET Rep ...)
; --              (: (ListOf x y) $)
; --              (CodeDefine (<op> <signature> <functionName>))
; --              (COND ((HasCategory $ ...) (PROGN ...))) ..)
; --  $locals: list of variables to go into slot 5, e.g. (R Rep R,1 R,2 R,3 R,4)
; --           same as $functorLocalParameters
; --           this list is not augmented by this function
; --GLOBAL VARIABLES REFERENCED:
; --  $QuickCode: compilation flag
;
;   $definition : local := definition
;
;   if code is ['add,.,newstuff] then code := newstuff
;
;   changeDirectoryInSlot1(base_shell, e)  --this extends $NRTslot1PredicateList
;
;   --pp '"=================="
;   --for item in $NRTdeltaList repeat pp item
;
; --LOCAL BOUND FLUID VARIABLES:
;   $GENNO: local:= 0     --bound in compDefineFunctor1, then as parameter here
;   $catvecList: local    --list of vectors v1..vn for each view
;   $SetFunctions: local  --copy of p view with preds telling when fnct defined
;   $MissingFunctionInfo: local --vector marking which functions are assigned
;   $ConstantAssignments: local --code for creation of constants
;   $epilogue: local := nil     --code to set slot 5, things to be done last
;   $extraParms:local  --Set in DomainSubstitutionFunction, used in setVector12
;   $devaluateList : local := [[arg,:b] for arg in args
;                                       for b in $ModeVariableList]
; ------------------------
;   oldtime := get_run_time()
;   [catsig, :argsig] := sig
;   catvecListMaker:=REMDUP
;     [(comp(catsig, $EmptyMode, e)).expr,
;       :[compCategories(first u, e) for u in CADR base_shell.4]]
;   condCats := InvestigateConditions([catsig, :rest catvecListMaker],
;                                     base_shell, e)
;   -- a list, one for each element of catvecListMaker
;   -- indicating under what conditions this
;   -- category should be present.  true => always
;   makeCatvecCode:= first catvecListMaker
;   domainShell := GETREFV (6 + $NRTdeltaLength)
;   for i in 0..4 repeat domainShell.i := base_shell.i
;   $template := GETREFV (6 + $NRTdeltaLength)
;   $SetFunctions:= GETREFV SIZE domainShell
;   $MissingFunctionInfo:= GETREFV SIZE domainShell
;   catNames := ['$, :[GENVAR() for u in rest catvecListMaker]]
;   domname:='dv_$
;
;   condCats := [simpBool(cc) for cc in condCats]
;   condCats := simplify_self_preds(catvecListMaker, condCats)
; -->  Do this now to create predicate vector; then DescendCode can refer
; -->  to predicate vector if it can
;   [$uncondAlist,:$condAlist] :=    --bound in compDefineFunctor1
;       NRTsetVector4Part1(catNames, catvecListMaker, condCats, base_shell, e)
;   [$NRTslot1PredicateList,predBitVectorCode1,:predBitVectorCode2] :=
;       makePredicateBitVector([:ASSOCRIGHT($condAlist),
;                               :$NRTslot1PredicateList], e)
;
;   storeOperationCode := DescendCode(code, true, nil, first catNames,
;                                     domainShell, e)
;   outsideFunctionCode:= NRTaddDeltaCode(domainShell)
;   storeOperationCode:= NRTputInLocalReferences storeOperationCode
;   NRTdescendCodeTran(storeOperationCode,nil) --side effects storeOperationCode
;   codePart2:=
;       argStuffCode :=
;         [['QSETREFV, '$, i, v] for i in 6.. for v in $FormalMapVariableList
;           for arg in rest definition]
;       if MEMQ($NRTaddForm,$locals) then
;          addargname := $FormalMapVariableList.(POSN1($NRTaddForm,$locals))
;          argStuffCode := [['QSETREFV, '$, 5, addargname], :argStuffCode]
;       [['stuffDomainSlots,'$],:argStuffCode,
;          :predBitVectorCode2, ['SETF, 'pv_$, ['QREFELT, '$, 3]],
;             storeOperationCode]
;
;   $CheckVectorList := NRTcheckVector domainShell
; --CODE: part 1
;   codePart1:= [:devaluateCode, createDomainCode,
;                 createViewCode,setVector0Code, slot3Code,:slamCode] where
;     -- FIXME: should devaluate only domain arguments
;     devaluateCode:= [['LET,b,['devaluate,a]] for [a,:b] in $devaluateList]
;     createDomainCode:=
;         ['LET, domname, ['LIST, MKQ first definition,
;                          :ASSOCRIGHT $devaluateList]]
;     createViewCode:= ['LET,'$,['GETREFV, 6+$NRTdeltaLength]]
;     setVector0Code := ['QSETREFV, '$, 0, 'dv_$]
;     slot3Code := ['QSETREFV,'$,3,['LET,'pv_$,predBitVectorCode1]]
;     slamCode:=
;         isCategoryPackageName(opOf(definition)) => nil
;         [NRTaddToSlam(definition, '$)]
;
; --CODE: part 3
;   $ConstantAssignments :=
;       [NRTputInLocalReferences code for code in $ConstantAssignments]
;   codePart3:= [:$ConstantAssignments,:$epilogue]
;   ans :=
;     ['PROGN,:optFunctorPROGN [:codePart1,:codePart2,:codePart3], '$]
;   ans:= minimalise ans
;   SAY ['"time taken in buildFunctor: ", get_run_time() - oldtime]
;   --sayBrightly '"------------------functor code: -------------------"
;   --pp ans
;   ans

(DEFUN |buildFunctor| (|definition| |sig| |code| |$locals| |base_shell| |e|)
  (DECLARE (SPECIAL |$locals|))
  (PROG (|$devaluateList| |$extraParms| |$epilogue| |$ConstantAssignments|
         |$MissingFunctionInfo| |$SetFunctions| |$catvecList| $GENNO
         |$definition| |ans| |codePart3| |codePart1| |slamCode| |slot3Code|
         |setVector0Code| |createViewCode| |createDomainCode| |devaluateCode|
         |b| |a| |codePart2| |addargname| |argStuffCode| |outsideFunctionCode|
         |storeOperationCode| |predBitVectorCode2| |predBitVectorCode1|
         |LETTMP#1| |domname| |catNames| |domainShell| |makeCatvecCode|
         |condCats| |catvecListMaker| |argsig| |catsig| |oldtime| |newstuff|
         |ISTMP#2| |ISTMP#1| |args| |name|)
    (DECLARE
     (SPECIAL |$devaluateList| |$extraParms| |$epilogue| |$ConstantAssignments|
      |$MissingFunctionInfo| |$SetFunctions| |$catvecList| $GENNO
      |$definition|))
    (RETURN
     (PROGN
      (SETQ |name| (CAR |definition|))
      (SETQ |args| (CDR |definition|))
      (SETQ |$definition| |definition|)
      (COND
       ((AND (CONSP |code|) (EQ (CAR |code|) '|add|)
             (PROGN
              (SETQ |ISTMP#1| (CDR |code|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN
                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                         (PROGN (SETQ |newstuff| (CAR |ISTMP#2|)) #1='T))))))
        (SETQ |code| |newstuff|)))
      (|changeDirectoryInSlot1| |base_shell| |e|)
      (SETQ $GENNO 0)
      (SETQ |$catvecList| NIL)
      (SETQ |$SetFunctions| NIL)
      (SETQ |$MissingFunctionInfo| NIL)
      (SETQ |$ConstantAssignments| NIL)
      (SETQ |$epilogue| NIL)
      (SETQ |$extraParms| NIL)
      (SETQ |$devaluateList|
              ((LAMBDA (|bfVar#61| |bfVar#59| |arg| |bfVar#60| |b|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#59|)
                        (PROGN (SETQ |arg| (CAR |bfVar#59|)) NIL)
                        (ATOM |bfVar#60|)
                        (PROGN (SETQ |b| (CAR |bfVar#60|)) NIL))
                    (RETURN (NREVERSE |bfVar#61|)))
                   (#1# (SETQ |bfVar#61| (CONS (CONS |arg| |b|) |bfVar#61|))))
                  (SETQ |bfVar#59| (CDR |bfVar#59|))
                  (SETQ |bfVar#60| (CDR |bfVar#60|))))
               NIL |args| NIL |$ModeVariableList| NIL))
      (SETQ |oldtime| (|get_run_time|))
      (SETQ |catsig| (CAR |sig|))
      (SETQ |argsig| (CDR |sig|))
      (SETQ |catvecListMaker|
              (REMDUP
               (CONS (CAR (|comp| |catsig| |$EmptyMode| |e|))
                     ((LAMBDA (|bfVar#63| |bfVar#62| |u|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#62|)
                               (PROGN (SETQ |u| (CAR |bfVar#62|)) NIL))
                           (RETURN (NREVERSE |bfVar#63|)))
                          (#1#
                           (SETQ |bfVar#63|
                                   (CONS (|compCategories| (CAR |u|) |e|)
                                         |bfVar#63|))))
                         (SETQ |bfVar#62| (CDR |bfVar#62|))))
                      NIL (CADR (ELT |base_shell| 4)) NIL))))
      (SETQ |condCats|
              (|InvestigateConditions| (CONS |catsig| (CDR |catvecListMaker|))
               |base_shell| |e|))
      (SETQ |makeCatvecCode| (CAR |catvecListMaker|))
      (SETQ |domainShell| (GETREFV (+ 6 |$NRTdeltaLength|)))
      ((LAMBDA (|i|)
         (LOOP
          (COND ((> |i| 4) (RETURN NIL))
                (#1# (SETF (ELT |domainShell| |i|) (ELT |base_shell| |i|))))
          (SETQ |i| (+ |i| 1))))
       0)
      (SETQ |$template| (GETREFV (+ 6 |$NRTdeltaLength|)))
      (SETQ |$SetFunctions| (GETREFV (SIZE |domainShell|)))
      (SETQ |$MissingFunctionInfo| (GETREFV (SIZE |domainShell|)))
      (SETQ |catNames|
              (CONS '$
                    ((LAMBDA (|bfVar#65| |bfVar#64| |u|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#64|)
                              (PROGN (SETQ |u| (CAR |bfVar#64|)) NIL))
                          (RETURN (NREVERSE |bfVar#65|)))
                         (#1# (SETQ |bfVar#65| (CONS (GENVAR) |bfVar#65|))))
                        (SETQ |bfVar#64| (CDR |bfVar#64|))))
                     NIL (CDR |catvecListMaker|) NIL)))
      (SETQ |domname| '|dv$|)
      (SETQ |condCats|
              ((LAMBDA (|bfVar#67| |bfVar#66| |cc|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#66|)
                        (PROGN (SETQ |cc| (CAR |bfVar#66|)) NIL))
                    (RETURN (NREVERSE |bfVar#67|)))
                   (#1# (SETQ |bfVar#67| (CONS (|simpBool| |cc|) |bfVar#67|))))
                  (SETQ |bfVar#66| (CDR |bfVar#66|))))
               NIL |condCats| NIL))
      (SETQ |condCats| (|simplify_self_preds| |catvecListMaker| |condCats|))
      (SETQ |LETTMP#1|
              (|NRTsetVector4Part1| |catNames| |catvecListMaker| |condCats|
               |base_shell| |e|))
      (SETQ |$uncondAlist| (CAR |LETTMP#1|))
      (SETQ |$condAlist| (CDR |LETTMP#1|))
      (SETQ |LETTMP#1|
              (|makePredicateBitVector|
               (APPEND (ASSOCRIGHT |$condAlist|) |$NRTslot1PredicateList|)
               |e|))
      (SETQ |$NRTslot1PredicateList| (CAR |LETTMP#1|))
      (SETQ |predBitVectorCode1| (CADR . #2=(|LETTMP#1|)))
      (SETQ |predBitVectorCode2| (CDDR . #2#))
      (SETQ |storeOperationCode|
              (|DescendCode| |code| T NIL (CAR |catNames|) |domainShell| |e|))
      (SETQ |outsideFunctionCode| (|NRTaddDeltaCode| |domainShell|))
      (SETQ |storeOperationCode|
              (|NRTputInLocalReferences| |storeOperationCode|))
      (|NRTdescendCodeTran| |storeOperationCode| NIL)
      (SETQ |codePart2|
              (PROGN
               (SETQ |argStuffCode|
                       ((LAMBDA
                            (|bfVar#70| |i| |bfVar#68| |v| |bfVar#69| |arg|)
                          (LOOP
                           (COND
                            ((OR (ATOM |bfVar#68|)
                                 (PROGN (SETQ |v| (CAR |bfVar#68|)) NIL)
                                 (ATOM |bfVar#69|)
                                 (PROGN (SETQ |arg| (CAR |bfVar#69|)) NIL))
                             (RETURN (NREVERSE |bfVar#70|)))
                            (#1#
                             (SETQ |bfVar#70|
                                     (CONS (LIST 'QSETREFV '$ |i| |v|)
                                           |bfVar#70|))))
                           (SETQ |i| (+ |i| 1))
                           (SETQ |bfVar#68| (CDR |bfVar#68|))
                           (SETQ |bfVar#69| (CDR |bfVar#69|))))
                        NIL 6 |$FormalMapVariableList| NIL (CDR |definition|)
                        NIL))
               (COND
                ((MEMQ |$NRTaddForm| |$locals|)
                 (SETQ |addargname|
                         (ELT |$FormalMapVariableList|
                              (POSN1 |$NRTaddForm| |$locals|)))
                 (SETQ |argStuffCode|
                         (CONS (LIST 'QSETREFV '$ 5 |addargname|)
                               |argStuffCode|))))
               (CONS (LIST '|stuffDomainSlots| '$)
                     (APPEND |argStuffCode|
                             (APPEND |predBitVectorCode2|
                                     (CONS
                                      (LIST 'SETF '|pv$| (LIST 'QREFELT '$ 3))
                                      (CONS |storeOperationCode| NIL)))))))
      (SETQ |$CheckVectorList| (|NRTcheckVector| |domainShell|))
      (SETQ |devaluateCode|
              ((LAMBDA (|bfVar#73| |bfVar#72| |bfVar#71|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#72|)
                        (PROGN (SETQ |bfVar#71| (CAR |bfVar#72|)) NIL))
                    (RETURN (NREVERSE |bfVar#73|)))
                   (#1#
                    (AND (CONSP |bfVar#71|)
                         (PROGN
                          (SETQ |a| (CAR |bfVar#71|))
                          (SETQ |b| (CDR |bfVar#71|))
                          #1#)
                         (SETQ |bfVar#73|
                                 (CONS (LIST 'LET |b| (LIST '|devaluate| |a|))
                                       |bfVar#73|)))))
                  (SETQ |bfVar#72| (CDR |bfVar#72|))))
               NIL |$devaluateList| NIL))
      (SETQ |createDomainCode|
              (LIST 'LET |domname|
                    (CONS 'LIST
                          (CONS (MKQ (CAR |definition|))
                                (ASSOCRIGHT |$devaluateList|)))))
      (SETQ |createViewCode|
              (LIST 'LET '$ (LIST 'GETREFV (+ 6 |$NRTdeltaLength|))))
      (SETQ |setVector0Code| (LIST 'QSETREFV '$ 0 '|dv$|))
      (SETQ |slot3Code|
              (LIST 'QSETREFV '$ 3 (LIST 'LET '|pv$| |predBitVectorCode1|)))
      (SETQ |slamCode|
              (COND ((|isCategoryPackageName| (|opOf| |definition|)) NIL)
                    (#1# (LIST (|NRTaddToSlam| |definition| '$)))))
      (SETQ |codePart1|
              (APPEND |devaluateCode|
                      (CONS |createDomainCode|
                            (CONS |createViewCode|
                                  (CONS |setVector0Code|
                                        (CONS |slot3Code| |slamCode|))))))
      (SETQ |$ConstantAssignments|
              ((LAMBDA (|bfVar#75| |bfVar#74| |code|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#74|)
                        (PROGN (SETQ |code| (CAR |bfVar#74|)) NIL))
                    (RETURN (NREVERSE |bfVar#75|)))
                   (#1#
                    (SETQ |bfVar#75|
                            (CONS (|NRTputInLocalReferences| |code|)
                                  |bfVar#75|))))
                  (SETQ |bfVar#74| (CDR |bfVar#74|))))
               NIL |$ConstantAssignments| NIL))
      (SETQ |codePart3| (APPEND |$ConstantAssignments| |$epilogue|))
      (SETQ |ans|
              (CONS 'PROGN
                    (APPEND
                     (|optFunctorPROGN|
                      (APPEND |codePart1| (APPEND |codePart2| |codePart3|)))
                     (CONS '$ NIL))))
      (SETQ |ans| (|minimalise| |ans|))
      (SAY
       (LIST "time taken in buildFunctor: " (- (|get_run_time|) |oldtime|)))
      |ans|))))

; NRTcheckVector domainShell ==
; --RETURNS: an alist (((op,sig),:pred) ...) of missing functions
;   alist := nil
;   for i in 6..MAXINDEX domainShell repeat
; --Vector elements can be one of
; -- (a) T           -- item was marked
; -- (b) NIL         -- item is a domain; will be filled in by setVector4part3
; -- (c) categoryForm-- it was a domain view; now irrelevant
; -- (d) op-signature-- store missing function info in $CheckVectorList
;     v:= domainShell.i
;     v=true => nil  --item is marked; ignore
;     null v => nil  --a domain, which setVector4part3 will fill in
;     atom v => systemErrorHere '"CheckVector"
;     atom first v => nil  --category form; ignore
;     assoc(first v,alist) => nil
;     alist:=
;       [[first v,:$SetFunctions.i],:alist]
;   alist

(DEFUN |NRTcheckVector| (|domainShell|)
  (PROG (|alist| |v|)
    (RETURN
     (PROGN
      (SETQ |alist| NIL)
      ((LAMBDA (|bfVar#76| |i|)
         (LOOP
          (COND ((> |i| |bfVar#76|) (RETURN NIL))
                (#1='T
                 (PROGN
                  (SETQ |v| (ELT |domainShell| |i|))
                  (COND ((EQUAL |v| T) NIL) ((NULL |v|) NIL)
                        ((ATOM |v|) (|systemErrorHere| "CheckVector"))
                        ((ATOM (CAR |v|)) NIL)
                        ((|assoc| (CAR |v|) |alist|) NIL)
                        (#1#
                         (SETQ |alist|
                                 (CONS
                                  (CONS (CAR |v|) (ELT |$SetFunctions| |i|))
                                  |alist|)))))))
          (SETQ |i| (+ |i| 1))))
       (MAXINDEX |domainShell|) 6)
      |alist|))))

; NRTsetVector4Part1(sigs, forms, conds, base_shell, e) ==
;     uncond_list := nil
;     cond_list := nil
;     for sig in reverse sigs for form in reverse forms
;            for cond in reverse conds repeat
;         sig = '$ =>
;             domainList :=
;                 [optimize COPY IFCAR comp(d, $EmptyMode, e) or
;                    d for d in base_shell.4.0]
;             uncond_list := APPEND(domainList, uncond_list)
;             if isCategoryForm(form) then
;                 uncond_list := [form, :uncond_list]
;         evalform := eval mkEvalableCategoryForm(form, e)
;         cond = true =>
;             uncond_list := [form, :APPEND(evalform.4.0, uncond_list)]
;         cond_list := [[cond,[form, :evalform.4.0]], :cond_list]
;
;     reducedUncondlist := REMDUP uncond_list
;     reducedConlist := [[x, :y] for [x,z] in cond_list |
;                          y := SETDIFFERENCE(z, reducedUncondlist)]
;     revCondlist := reverseCondlist reducedConlist
;     orCondlist := [[x, :MKPF(y, 'OR)] for [x, :y] in revCondlist]
;     [reducedUncondlist, :orCondlist]

(DEFUN |NRTsetVector4Part1| (|sigs| |forms| |conds| |base_shell| |e|)
  (PROG (|uncond_list| |cond_list| |domainList| |evalform| |reducedUncondlist|
         |x| |ISTMP#1| |z| |y| |reducedConlist| |revCondlist| |orCondlist|)
    (RETURN
     (PROGN
      (SETQ |uncond_list| NIL)
      (SETQ |cond_list| NIL)
      ((LAMBDA (|bfVar#77| |sig| |bfVar#78| |form| |bfVar#79| |cond|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#77|) (PROGN (SETQ |sig| (CAR |bfVar#77|)) NIL)
                (ATOM |bfVar#78|) (PROGN (SETQ |form| (CAR |bfVar#78|)) NIL)
                (ATOM |bfVar#79|) (PROGN (SETQ |cond| (CAR |bfVar#79|)) NIL))
            (RETURN NIL))
           (#1='T
            (COND
             ((EQ |sig| '$)
              (PROGN
               (SETQ |domainList|
                       ((LAMBDA (|bfVar#81| |bfVar#80| |d|)
                          (LOOP
                           (COND
                            ((OR (ATOM |bfVar#80|)
                                 (PROGN (SETQ |d| (CAR |bfVar#80|)) NIL))
                             (RETURN (NREVERSE |bfVar#81|)))
                            (#1#
                             (SETQ |bfVar#81|
                                     (CONS
                                      (OR
                                       (|optimize|
                                        (COPY
                                         (IFCAR
                                          (|comp| |d| |$EmptyMode| |e|))))
                                       |d|)
                                      |bfVar#81|))))
                           (SETQ |bfVar#80| (CDR |bfVar#80|))))
                        NIL (ELT (ELT |base_shell| 4) 0) NIL))
               (SETQ |uncond_list| (APPEND |domainList| |uncond_list|))
               (COND
                ((|isCategoryForm| |form|)
                 (SETQ |uncond_list| (CONS |form| |uncond_list|))))))
             (#1#
              (PROGN
               (SETQ |evalform| (|eval| (|mkEvalableCategoryForm| |form| |e|)))
               (COND
                ((EQUAL |cond| T)
                 (SETQ |uncond_list|
                         (CONS |form|
                               (APPEND (ELT (ELT |evalform| 4) 0)
                                       |uncond_list|))))
                (#1#
                 (SETQ |cond_list|
                         (CONS
                          (LIST |cond|
                                (CONS |form| (ELT (ELT |evalform| 4) 0)))
                          |cond_list|)))))))))
          (SETQ |bfVar#77| (CDR |bfVar#77|))
          (SETQ |bfVar#78| (CDR |bfVar#78|))
          (SETQ |bfVar#79| (CDR |bfVar#79|))))
       (REVERSE |sigs|) NIL (REVERSE |forms|) NIL (REVERSE |conds|) NIL)
      (SETQ |reducedUncondlist| (REMDUP |uncond_list|))
      (SETQ |reducedConlist|
              ((LAMBDA (|bfVar#84| |bfVar#83| |bfVar#82|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#83|)
                        (PROGN (SETQ |bfVar#82| (CAR |bfVar#83|)) NIL))
                    (RETURN (NREVERSE |bfVar#84|)))
                   (#1#
                    (AND (CONSP |bfVar#82|)
                         (PROGN
                          (SETQ |x| (CAR |bfVar#82|))
                          (SETQ |ISTMP#1| (CDR |bfVar#82|))
                          (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                               (PROGN (SETQ |z| (CAR |ISTMP#1|)) #1#)))
                         (SETQ |y| (SETDIFFERENCE |z| |reducedUncondlist|))
                         (SETQ |bfVar#84| (CONS (CONS |x| |y|) |bfVar#84|)))))
                  (SETQ |bfVar#83| (CDR |bfVar#83|))))
               NIL |cond_list| NIL))
      (SETQ |revCondlist| (|reverseCondlist| |reducedConlist|))
      (SETQ |orCondlist|
              ((LAMBDA (|bfVar#87| |bfVar#86| |bfVar#85|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#86|)
                        (PROGN (SETQ |bfVar#85| (CAR |bfVar#86|)) NIL))
                    (RETURN (NREVERSE |bfVar#87|)))
                   (#1#
                    (AND (CONSP |bfVar#85|)
                         (PROGN
                          (SETQ |x| (CAR |bfVar#85|))
                          (SETQ |y| (CDR |bfVar#85|))
                          #1#)
                         (SETQ |bfVar#87|
                                 (CONS (CONS |x| (MKPF |y| 'OR))
                                       |bfVar#87|)))))
                  (SETQ |bfVar#86| (CDR |bfVar#86|))))
               NIL |revCondlist| NIL))
      (CONS |reducedUncondlist| |orCondlist|)))))

; reverseCondlist cl ==
;   alist := nil
;   for [x,:y] in cl repeat
;     for z in y repeat
;       u := assoc(z,alist)
;       null u => alist := [[z,x],:alist]
;       member(x, rest u) => nil
;       RPLACD(u, [x, :rest u])
;   alist

(DEFUN |reverseCondlist| (|cl|)
  (PROG (|alist| |x| |y| |u|)
    (RETURN
     (PROGN
      (SETQ |alist| NIL)
      ((LAMBDA (|bfVar#89| |bfVar#88|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#89|)
                (PROGN (SETQ |bfVar#88| (CAR |bfVar#89|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#88|)
                 (PROGN
                  (SETQ |x| (CAR |bfVar#88|))
                  (SETQ |y| (CDR |bfVar#88|))
                  #1#)
                 ((LAMBDA (|bfVar#90| |z|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#90|)
                           (PROGN (SETQ |z| (CAR |bfVar#90|)) NIL))
                       (RETURN NIL))
                      (#1#
                       (PROGN
                        (SETQ |u| (|assoc| |z| |alist|))
                        (COND
                         ((NULL |u|)
                          (SETQ |alist| (CONS (LIST |z| |x|) |alist|)))
                         ((|member| |x| (CDR |u|)) NIL)
                         (#1# (RPLACD |u| (CONS |x| (CDR |u|))))))))
                     (SETQ |bfVar#90| (CDR |bfVar#90|))))
                  |y| NIL))))
          (SETQ |bfVar#89| (CDR |bfVar#89|))))
       |cl| NIL)
      |alist|))))

; NRTmakeSlot1Info(form, base_shell) ==
; -- 4 cases:
; -- a:T == b add c  --- slot1 directory has #s for entries defined in c
; -- a:T == b        --- slot1 has all slot #s = NIL (see compFunctorBody)
; -- a == b add c    --- not allowed (line 7 of getTargetFromRhs)
;   pairlis :=
;     $insideCategoryPackageIfTrue = true =>
;       [:argl, dollarName] := rest(form)
;       [[dollarName,:'_$],:mkSlot1sublis argl]
;     mkSlot1sublis(rest(form))
;   lisplibOpAlist := transformOperationAlist(SUBLIS(pairlis, base_shell.1))
;   opList :=
;     $insideCategoryPackageIfTrue = true => slot1Filter lisplibOpAlist
;     lisplibOpAlist
;   addList := SUBLIS(pairlis,$NRTaddForm)
;   [first(form), [addList, :opList]]

(DEFUN |NRTmakeSlot1Info| (|form| |base_shell|)
  (PROG (|LETTMP#1| |LETTMP#2| |dollarName| |argl| |pairlis| |lisplibOpAlist|
         |opList| |addList|)
    (RETURN
     (PROGN
      (SETQ |pairlis|
              (COND
               ((EQUAL |$insideCategoryPackageIfTrue| T)
                (PROGN
                 (SETQ |LETTMP#1| (CDR |form|))
                 (SETQ |LETTMP#2| (REVERSE |LETTMP#1|))
                 (SETQ |dollarName| (CAR |LETTMP#2|))
                 (SETQ |argl| (NREVERSE (CDR |LETTMP#2|)))
                 (CONS (CONS |dollarName| '$) (|mkSlot1sublis| |argl|))))
               (#1='T (|mkSlot1sublis| (CDR |form|)))))
      (SETQ |lisplibOpAlist|
              (|transformOperationAlist|
               (SUBLIS |pairlis| (ELT |base_shell| 1))))
      (SETQ |opList|
              (COND
               ((EQUAL |$insideCategoryPackageIfTrue| T)
                (|slot1Filter| |lisplibOpAlist|))
               (#1# |lisplibOpAlist|)))
      (SETQ |addList| (SUBLIS |pairlis| |$NRTaddForm|))
      (LIST (CAR |form|) (CONS |addList| |opList|))))))

; mkSlot1sublis argl ==
;   [[a,:b] for a in argl for b in $FormalMapVariableList]

(DEFUN |mkSlot1sublis| (|argl|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#93| |bfVar#91| |a| |bfVar#92| |b|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#91|) (PROGN (SETQ |a| (CAR |bfVar#91|)) NIL)
               (ATOM |bfVar#92|) (PROGN (SETQ |b| (CAR |bfVar#92|)) NIL))
           (RETURN (NREVERSE |bfVar#93|)))
          ('T (SETQ |bfVar#93| (CONS (CONS |a| |b|) |bfVar#93|))))
         (SETQ |bfVar#91| (CDR |bfVar#91|))
         (SETQ |bfVar#92| (CDR |bfVar#92|))))
      NIL |argl| NIL |$FormalMapVariableList| NIL))))

; slot1Filter opList ==
; --include only those ops which are defined within the capsule
;   [u for x in opList | u := fn x] where
;     fn [op,:l] ==
;       u := [entry for entry in l | INTEGERP CADR entry] => [op,:u]
;       nil

(DEFUN |slot1Filter| (|opList|)
  (PROG (|u|)
    (RETURN
     ((LAMBDA (|bfVar#95| |bfVar#94| |x|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#94|) (PROGN (SETQ |x| (CAR |bfVar#94|)) NIL))
           (RETURN (NREVERSE |bfVar#95|)))
          ('T
           (AND (SETQ |u| (|slot1Filter,fn| |x|))
                (SETQ |bfVar#95| (CONS |u| |bfVar#95|)))))
         (SETQ |bfVar#94| (CDR |bfVar#94|))))
      NIL |opList| NIL))))
(DEFUN |slot1Filter,fn| (|bfVar#98|)
  (PROG (|op| |l| |u|)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |bfVar#98|))
      (SETQ |l| (CDR |bfVar#98|))
      (COND
       ((SETQ |u|
                ((LAMBDA (|bfVar#97| |bfVar#96| |entry|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#96|)
                          (PROGN (SETQ |entry| (CAR |bfVar#96|)) NIL))
                      (RETURN (NREVERSE |bfVar#97|)))
                     (#1='T
                      (AND (INTEGERP (CADR |entry|))
                           (SETQ |bfVar#97| (CONS |entry| |bfVar#97|)))))
                    (SETQ |bfVar#96| (CDR |bfVar#96|))))
                 NIL |l| NIL))
        (CONS |op| |u|))
       (#1# NIL))))))

; NRTaddToSlam([name,:argnames],shell) ==
;   $mutableDomain => return nil
;   null argnames => addToConstructorCache(name,nil,shell)
;   args:= ['LIST,:ASSOCRIGHT $devaluateList]
;   addToConstructorCache(name,args,shell)

(DEFUN |NRTaddToSlam| (|bfVar#99| |shell|)
  (PROG (|name| |argnames| |args|)
    (RETURN
     (PROGN
      (SETQ |name| (CAR |bfVar#99|))
      (SETQ |argnames| (CDR |bfVar#99|))
      (COND (|$mutableDomain| (RETURN NIL))
            ((NULL |argnames|) (|addToConstructorCache| |name| NIL |shell|))
            ('T
             (PROGN
              (SETQ |args| (CONS 'LIST (ASSOCRIGHT |$devaluateList|)))
              (|addToConstructorCache| |name| |args| |shell|))))))))

; genOperationAlist(base_shell) ==
;   $lisplibOperationAlist := [sigloc entry for entry in base_shell.1] where
;     sigloc [opsig,pred,fnsel] ==
;         if pred ~= 'T then
;           pred := simpBool pred
;           $NRTslot1PredicateList := insert(pred,$NRTslot1PredicateList)
;         fnsel is [op,a,:.] and (op = 'ELT or op = 'CONST) =>
;           if $insideCategoryPackageIfTrue then
;               opsig := substitute('$,CADR($functorForm),opsig)
;           [opsig,pred,[op,a,vectorLocation(first opsig,CADR opsig)]]
;         [opsig,pred,fnsel]

(DEFUN |genOperationAlist| (|base_shell|)
  (PROG ()
    (RETURN
     (SETQ |$lisplibOperationAlist|
             ((LAMBDA (|bfVar#101| |bfVar#100| |entry|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#100|)
                       (PROGN (SETQ |entry| (CAR |bfVar#100|)) NIL))
                   (RETURN (NREVERSE |bfVar#101|)))
                  ('T
                   (SETQ |bfVar#101|
                           (CONS (|genOperationAlist,sigloc| |entry|)
                                 |bfVar#101|))))
                 (SETQ |bfVar#100| (CDR |bfVar#100|))))
              NIL (ELT |base_shell| 1) NIL)))))
(DEFUN |genOperationAlist,sigloc| (|bfVar#102|)
  (PROG (|opsig| |pred| |fnsel| |op| |ISTMP#1| |a|)
    (RETURN
     (PROGN
      (SETQ |opsig| (CAR |bfVar#102|))
      (SETQ |pred| (CADR . #1=(|bfVar#102|)))
      (SETQ |fnsel| (CADDR . #1#))
      (COND
       ((NOT (EQ |pred| 'T)) (SETQ |pred| (|simpBool| |pred|))
        (SETQ |$NRTslot1PredicateList|
                (|insert| |pred| |$NRTslot1PredicateList|))))
      (COND
       ((AND (CONSP |fnsel|)
             (PROGN
              (SETQ |op| (CAR |fnsel|))
              (SETQ |ISTMP#1| (CDR |fnsel|))
              (AND (CONSP |ISTMP#1|) (PROGN (SETQ |a| (CAR |ISTMP#1|)) #2='T)))
             (OR (EQ |op| 'ELT) (EQ |op| 'CONST)))
        (PROGN
         (COND
          (|$insideCategoryPackageIfTrue|
           (SETQ |opsig| (|substitute| '$ (CADR |$functorForm|) |opsig|))))
         (LIST |opsig| |pred|
               (LIST |op| |a|
                     (|vectorLocation| (CAR |opsig|) (CADR |opsig|))))))
       (#2# (LIST |opsig| |pred| |fnsel|)))))))

; changeDirectoryInSlot1(base_shell, e) ==  --called by buildFunctor
;   genOperationAlist(base_shell)
;   sortedOplist := listSort(function GLESSEQP,
;                            COPY_-LIST $lisplibOperationAlist,function CADR)
;   $lastPred :local := nil
;   $newEnv : local := e
;   base_shell.1 := [fn(entry, e) for entry in sortedOplist] where
;     fn([[op, sig], pred, fnsel], e) ==
;        if $lastPred ~= pred then
;             $newEnv := deepChaseInferences(pred, e)
;             $lastPred := pred
;        [[op, genSlotSig(sig, $newEnv)], pred, fnsel]

(DEFUN |changeDirectoryInSlot1| (|base_shell| |e|)
  (PROG (|$newEnv| |$lastPred| |sortedOplist|)
    (DECLARE (SPECIAL |$newEnv| |$lastPred|))
    (RETURN
     (PROGN
      (|genOperationAlist| |base_shell|)
      (SETQ |sortedOplist|
              (|listSort| #'GLESSEQP (COPY-LIST |$lisplibOperationAlist|)
               #'CADR))
      (SETQ |$lastPred| NIL)
      (SETQ |$newEnv| |e|)
      (SETF (ELT |base_shell| 1)
              ((LAMBDA (|bfVar#104| |bfVar#103| |entry|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#103|)
                        (PROGN (SETQ |entry| (CAR |bfVar#103|)) NIL))
                    (RETURN (NREVERSE |bfVar#104|)))
                   ('T
                    (SETQ |bfVar#104|
                            (CONS (|changeDirectoryInSlot1,fn| |entry| |e|)
                                  |bfVar#104|))))
                  (SETQ |bfVar#103| (CDR |bfVar#103|))))
               NIL |sortedOplist| NIL))))))
(DEFUN |changeDirectoryInSlot1,fn| (|bfVar#105| |e|)
  (PROG (|op| |sig| |pred| |fnsel|)
    (RETURN
     (PROGN
      (SETQ |op| (CAAR . #1=(|bfVar#105|)))
      (SETQ |sig| (CADAR . #1#))
      (SETQ |pred| (CADR . #2=(|bfVar#105|)))
      (SETQ |fnsel| (CADDR . #2#))
      (COND
       ((NOT (EQUAL |$lastPred| |pred|))
        (SETQ |$newEnv| (|deepChaseInferences| |pred| |e|))
        (SETQ |$lastPred| |pred|)))
      (LIST (LIST |op| (|genSlotSig| |sig| |$newEnv|)) |pred| |fnsel|)))))

; genSlotSig(sig, e) ==
;    [genDeltaSig(t, e) for t in sig]

(DEFUN |genSlotSig| (|sig| |e|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#107| |bfVar#106| |t|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#106|) (PROGN (SETQ |t| (CAR |bfVar#106|)) NIL))
           (RETURN (NREVERSE |bfVar#107|)))
          ('T (SETQ |bfVar#107| (CONS (|genDeltaSig| |t| |e|) |bfVar#107|))))
         (SETQ |bfVar#106| (CDR |bfVar#106|))))
      NIL |sig| NIL))))

; DEFPARAMETER($infoHash, nil)

(DEFPARAMETER |$infoHash| NIL)

; deepChaseInferences(pred, e) ==
;     $infoHash : local := MAKE_HASHTABLE('EQUAL)
;     deepChaseInferences1(pred, e)

(DEFUN |deepChaseInferences| (|pred| |e|)
  (PROG (|$infoHash|)
    (DECLARE (SPECIAL |$infoHash|))
    (RETURN
     (PROGN
      (SETQ |$infoHash| (MAKE_HASHTABLE 'EQUAL))
      (|deepChaseInferences1| |pred| |e|)))))

; deepChaseInferences1(pred, e) ==
;     pred is ['AND,:preds] or pred is ['and,:preds] =>
;         for p in preds repeat e := deepChaseInferences1(p, e)
;         e
;     pred is ['OR, pred1, :.] or pred is ['or, pred1, :.] => e
;     --    deepChaseInferences1(pred1, e)
;     pred is 'T or pred is ['NOT, :.] or pred is ['not, :.] => e
;     chaseInferences(pred, e)

(DEFUN |deepChaseInferences1| (|pred| |e|)
  (PROG (|preds| |ISTMP#1| |pred1|)
    (RETURN
     (COND
      ((OR
        (AND (CONSP |pred|) (EQ (CAR |pred|) 'AND)
             (PROGN (SETQ |preds| (CDR |pred|)) #1='T))
        (AND (CONSP |pred|) (EQ (CAR |pred|) '|and|)
             (PROGN (SETQ |preds| (CDR |pred|)) #1#)))
       (PROGN
        ((LAMBDA (|bfVar#108| |p|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#108|) (PROGN (SETQ |p| (CAR |bfVar#108|)) NIL))
              (RETURN NIL))
             (#1# (SETQ |e| (|deepChaseInferences1| |p| |e|))))
            (SETQ |bfVar#108| (CDR |bfVar#108|))))
         |preds| NIL)
        |e|))
      ((OR
        (AND (CONSP |pred|) (EQ (CAR |pred|) 'OR)
             (PROGN
              (SETQ |ISTMP#1| (CDR |pred|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN (SETQ |pred1| (CAR |ISTMP#1|)) #1#))))
        (AND (CONSP |pred|) (EQ (CAR |pred|) '|or|)
             (PROGN
              (SETQ |ISTMP#1| (CDR |pred|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN (SETQ |pred1| (CAR |ISTMP#1|)) #1#)))))
       |e|)
      ((OR (EQ |pred| 'T) (AND (CONSP |pred|) (EQ (CAR |pred|) 'NOT))
           (AND (CONSP |pred|) (EQ (CAR |pred|) '|not|)))
       |e|)
      (#1# (|chaseInferences| |pred| |e|))))))

; vectorLocation(op,sig) ==
;   u := or/[i for i in 1.. for u in $NRTdeltaList
;         | u is [=op,[='$,: xsig],:.] and sig=NRTsubstDelta(xsig) ]
;   u => $NRTdeltaLength - u + 6
;   nil    -- this signals that calls should be forwarded

(DEFUN |vectorLocation| (|op| |sig|)
  (PROG (|ISTMP#1| |ISTMP#2| |xsig| |u|)
    (RETURN
     (PROGN
      (SETQ |u|
              ((LAMBDA (|bfVar#110| |i| |bfVar#109| |u|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#109|)
                        (PROGN (SETQ |u| (CAR |bfVar#109|)) NIL))
                    (RETURN |bfVar#110|))
                   (#1='T
                    (AND (CONSP |u|) (EQUAL (CAR |u|) |op|)
                         (PROGN
                          (SETQ |ISTMP#1| (CDR |u|))
                          (AND (CONSP |ISTMP#1|)
                               (PROGN
                                (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                                (AND (CONSP |ISTMP#2|)
                                     (EQUAL (CAR |ISTMP#2|) '$)
                                     (PROGN
                                      (SETQ |xsig| (CDR |ISTMP#2|))
                                      #1#)))))
                         (EQUAL |sig| (|NRTsubstDelta| |xsig|))
                         (PROGN
                          (SETQ |bfVar#110| |i|)
                          (COND (|bfVar#110| (RETURN |bfVar#110|)))))))
                  (SETQ |i| (+ |i| 1))
                  (SETQ |bfVar#109| (CDR |bfVar#109|))))
               NIL 1 |$NRTdeltaList| NIL))
      (COND (|u| (+ (- |$NRTdeltaLength| |u|) 6)) (#1# NIL))))))

; NRTsubstDelta(initSig) ==
;   sig := [replaceSlotTypes s for s in initSig] where
;      replaceSlotTypes(t) ==
;         atom t =>
;           not INTEGERP t => t
;           t = 0 => '$
;           t = 2 => '_$_$
;           t = 5 => $NRTaddForm
;           u:= $NRTdeltaList.($NRTdeltaLength+5-t)
;           first u = 'domain => CADR u
;           error "bad $NRTdeltaList entry"
;         MEMQ(first t, '(Mapping Union Record _:)) =>
;            [first t, :[replaceSlotTypes(x) for x in rest t]]
;         t

(DEFUN |NRTsubstDelta| (|initSig|)
  (PROG (|sig|)
    (RETURN
     (SETQ |sig|
             ((LAMBDA (|bfVar#112| |bfVar#111| |s|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#111|)
                       (PROGN (SETQ |s| (CAR |bfVar#111|)) NIL))
                   (RETURN (NREVERSE |bfVar#112|)))
                  ('T
                   (SETQ |bfVar#112|
                           (CONS (|NRTsubstDelta,replaceSlotTypes| |s|)
                                 |bfVar#112|))))
                 (SETQ |bfVar#111| (CDR |bfVar#111|))))
              NIL |initSig| NIL)))))
(DEFUN |NRTsubstDelta,replaceSlotTypes| (|t|)
  (PROG (|u|)
    (RETURN
     (COND
      ((ATOM |t|)
       (COND ((NULL (INTEGERP |t|)) |t|) ((EQL |t| 0) '$) ((EQL |t| 2) '$$)
             ((EQL |t| 5) |$NRTaddForm|)
             (#1='T
              (PROGN
               (SETQ |u| (ELT |$NRTdeltaList| (- (+ |$NRTdeltaLength| 5) |t|)))
               (COND ((EQ (CAR |u|) '|domain|) (CADR |u|))
                     (#1# (|error| '|bad $NRTdeltaList entry|)))))))
      ((MEMQ (CAR |t|) '(|Mapping| |Union| |Record| |:|))
       (CONS (CAR |t|)
             ((LAMBDA (|bfVar#114| |bfVar#113| |x|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#113|)
                       (PROGN (SETQ |x| (CAR |bfVar#113|)) NIL))
                   (RETURN (NREVERSE |bfVar#114|)))
                  (#1#
                   (SETQ |bfVar#114|
                           (CONS (|NRTsubstDelta,replaceSlotTypes| |x|)
                                 |bfVar#114|))))
                 (SETQ |bfVar#113| (CDR |bfVar#113|))))
              NIL (CDR |t|) NIL)))
      (#1# |t|)))))

; NRTputInLocalReferences bod ==
;   $elt: local := ($QuickCode => 'QREFELT; 'ELT)
;   NRTputInHead bod

(DEFUN |NRTputInLocalReferences| (|bod|)
  (PROG (|$elt|)
    (DECLARE (SPECIAL |$elt|))
    (RETURN
     (PROGN
      (SETQ |$elt| (COND (|$QuickCode| 'QREFELT) ('T 'ELT)))
      (|NRTputInHead| |bod|)))))

; NRTputInHead bod ==
;   atom bod => bod
;   bod is ['SPADCALL,:args,fn] =>
;     NRTputInTail rest bod --NOTE: args = COPY of rest bod
;     -- The following test allows function-returning expressions
;     fn is [elt,dom,ind] and not (dom='$) and MEMQ(elt,'(ELT QREFELT CONST)) =>
;       k:= NRTassocIndex dom => RPLACA(LASTNODE bod,[$elt,'_$,k])
;       nil
;     NRTputInHead fn
;     bod
;   bod is ["COND",:clauses] =>
;     for cc in clauses repeat NRTputInTail cc
;     bod
;   bod is ["QUOTE",:.] => bod
;   bod is ["CLOSEDFN",:.] => bod
;   bod is ["SPADCONST", dom, ind] => BREAK()
;   NRTputInHead first bod
;   NRTputInTail rest bod
;   bod

(DEFUN |NRTputInHead| (|bod|)
  (PROG (|ISTMP#1| |ISTMP#2| |fn| |args| |elt| |dom| |ind| |k| |clauses|)
    (RETURN
     (COND ((ATOM |bod|) |bod|)
           ((AND (CONSP |bod|) (EQ (CAR |bod|) 'SPADCALL)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |bod|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN (SETQ |ISTMP#2| (REVERSE |ISTMP#1|)) #1='T)
                       (CONSP |ISTMP#2|)
                       (PROGN
                        (SETQ |fn| (CAR |ISTMP#2|))
                        (SETQ |args| (CDR |ISTMP#2|))
                        #1#)
                       (PROGN (SETQ |args| (NREVERSE |args|)) #1#))))
            (PROGN
             (|NRTputInTail| (CDR |bod|))
             (COND
              ((AND (CONSP |fn|)
                    (PROGN
                     (SETQ |elt| (CAR |fn|))
                     (SETQ |ISTMP#1| (CDR |fn|))
                     (AND (CONSP |ISTMP#1|)
                          (PROGN
                           (SETQ |dom| (CAR |ISTMP#1|))
                           (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                           (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                (PROGN (SETQ |ind| (CAR |ISTMP#2|)) #1#)))))
                    (NULL (EQ |dom| '$)) (MEMQ |elt| '(ELT QREFELT CONST)))
               (COND
                ((SETQ |k| (|NRTassocIndex| |dom|))
                 (RPLACA (LASTNODE |bod|) (LIST |$elt| '$ |k|)))
                (#1# NIL)))
              (#1# (PROGN (|NRTputInHead| |fn|) |bod|)))))
           ((AND (CONSP |bod|) (EQ (CAR |bod|) 'COND)
                 (PROGN (SETQ |clauses| (CDR |bod|)) #1#))
            (PROGN
             ((LAMBDA (|bfVar#115| |cc|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#115|)
                       (PROGN (SETQ |cc| (CAR |bfVar#115|)) NIL))
                   (RETURN NIL))
                  (#1# (|NRTputInTail| |cc|)))
                 (SETQ |bfVar#115| (CDR |bfVar#115|))))
              |clauses| NIL)
             |bod|))
           ((AND (CONSP |bod|) (EQ (CAR |bod|) 'QUOTE)) |bod|)
           ((AND (CONSP |bod|) (EQ (CAR |bod|) 'CLOSEDFN)) |bod|)
           ((AND (CONSP |bod|) (EQ (CAR |bod|) 'SPADCONST)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |bod|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |dom| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                             (PROGN (SETQ |ind| (CAR |ISTMP#2|)) #1#))))))
            (BREAK))
           (#1#
            (PROGN
             (|NRTputInHead| (CAR |bod|))
             (|NRTputInTail| (CDR |bod|))
             |bod|))))))

; NRTputInTail x ==
;   for y in tails x repeat
;     atom (u := first y) =>
;       EQ(u,'$) or LASSOC(u,$devaluateList) => nil
;       k:= NRTassocIndex u =>
;         atom u => RPLACA(y,[$elt,'_$,k])
;         -- u atomic means that the slot will always contain a vector
;         BREAK()
;       --this reference must check that slot is a vector
;       nil
;     NRTputInHead u
;   x

(DEFUN |NRTputInTail| (|x|)
  (PROG (|u| |k|)
    (RETURN
     (PROGN
      ((LAMBDA (|y|)
         (LOOP
          (COND ((ATOM |y|) (RETURN NIL))
                (#1='T
                 (COND
                  ((ATOM (SETQ |u| (CAR |y|)))
                   (COND ((OR (EQ |u| '$) (LASSOC |u| |$devaluateList|)) NIL)
                         ((SETQ |k| (|NRTassocIndex| |u|))
                          (COND ((ATOM |u|) (RPLACA |y| (LIST |$elt| '$ |k|)))
                                (#1# (BREAK))))
                         (#1# NIL)))
                  (#1# (|NRTputInHead| |u|)))))
          (SETQ |y| (CDR |y|))))
       |x|)
      |x|))))

; NRTdescendCodeTran(u, condList) ==
;     -- buildFunctor calls NRTdescendCodeTran to fill $template slots
;     -- with names of compiled functions
;     null u => nil
;     u is ['LIST] => nil
;     u is [op, ., i, a] and MEMQ(op, '(SETELT QSETREFV)) =>
;         null condList and a is ['CONS, fn, :.] =>
;             RPLACA(u, 'LIST)
;             RPLACD(u, nil)
;             $template.i :=
;                 fn = 'IDENTITY => a
;                 fn is ['dispatchFunction, fn'] => fn'
;                 fn
;         a is ['CONS, 'IDENTITY, ['FUNCALL, fn, "$"]] =>
;             na := [['FUNCTION, 'makeSpadConstant], ["LIST", fn, "$", i]]
;             RPLACD(a, na)
;             nil
;         nil   --code for this will be generated by the instantiator
;     u is ['COND, :c] =>
;         for [pred, :y] in c|y repeat
;             NRTdescendCodeTran(first y, [pred, :condList])
;     u is ['PROGN, :c] => for x in c repeat NRTdescendCodeTran(x, condList)
;     nil

(DEFUN |NRTdescendCodeTran| (|u| |condList|)
  (PROG (|op| |ISTMP#1| |ISTMP#2| |i| |ISTMP#3| |a| |fn| |fn'| |ISTMP#4|
         |ISTMP#5| |na| |c| |pred| |y|)
    (RETURN
     (COND ((NULL |u|) NIL)
           ((AND (CONSP |u|) (EQ (CDR |u|) NIL) (EQ (CAR |u|) 'LIST)) NIL)
           ((AND (CONSP |u|)
                 (PROGN
                  (SETQ |op| (CAR |u|))
                  (SETQ |ISTMP#1| (CDR |u|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|)
                             (PROGN
                              (SETQ |i| (CAR |ISTMP#2|))
                              (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                              (AND (CONSP |ISTMP#3|) (EQ (CDR |ISTMP#3|) NIL)
                                   (PROGN
                                    (SETQ |a| (CAR |ISTMP#3|))
                                    #1='T)))))))
                 (MEMQ |op| '(SETELT QSETREFV)))
            (COND
             ((AND (NULL |condList|) (CONSP |a|) (EQ (CAR |a|) 'CONS)
                   (PROGN
                    (SETQ |ISTMP#1| (CDR |a|))
                    (AND (CONSP |ISTMP#1|)
                         (PROGN (SETQ |fn| (CAR |ISTMP#1|)) #1#))))
              (PROGN
               (RPLACA |u| 'LIST)
               (RPLACD |u| NIL)
               (SETF (ELT |$template| |i|)
                       (COND ((EQ |fn| 'IDENTITY) |a|)
                             ((AND (CONSP |fn|)
                                   (EQ (CAR |fn|) '|dispatchFunction|)
                                   (PROGN
                                    (SETQ |ISTMP#1| (CDR |fn|))
                                    (AND (CONSP |ISTMP#1|)
                                         (EQ (CDR |ISTMP#1|) NIL)
                                         (PROGN
                                          (SETQ |fn'| (CAR |ISTMP#1|))
                                          #1#))))
                              |fn'|)
                             (#1# |fn|)))))
             ((AND (CONSP |a|) (EQ (CAR |a|) 'CONS)
                   (PROGN
                    (SETQ |ISTMP#1| (CDR |a|))
                    (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) 'IDENTITY)
                         (PROGN
                          (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                          (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                               (PROGN
                                (SETQ |ISTMP#3| (CAR |ISTMP#2|))
                                (AND (CONSP |ISTMP#3|)
                                     (EQ (CAR |ISTMP#3|) 'FUNCALL)
                                     (PROGN
                                      (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                                      (AND (CONSP |ISTMP#4|)
                                           (PROGN
                                            (SETQ |fn| (CAR |ISTMP#4|))
                                            (SETQ |ISTMP#5| (CDR |ISTMP#4|))
                                            (AND (CONSP |ISTMP#5|)
                                                 (EQ (CDR |ISTMP#5|) NIL)
                                                 (EQ (CAR |ISTMP#5|)
                                                     '$))))))))))))
              (PROGN
               (SETQ |na|
                       (LIST (LIST 'FUNCTION '|makeSpadConstant|)
                             (LIST 'LIST |fn| '$ |i|)))
               (RPLACD |a| |na|)
               NIL))
             (#1# NIL)))
           ((AND (CONSP |u|) (EQ (CAR |u|) 'COND)
                 (PROGN (SETQ |c| (CDR |u|)) #1#))
            ((LAMBDA (|bfVar#117| |bfVar#116|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#117|)
                      (PROGN (SETQ |bfVar#116| (CAR |bfVar#117|)) NIL))
                  (RETURN NIL))
                 (#1#
                  (AND (CONSP |bfVar#116|)
                       (PROGN
                        (SETQ |pred| (CAR |bfVar#116|))
                        (SETQ |y| (CDR |bfVar#116|))
                        #1#)
                       |y|
                       (|NRTdescendCodeTran| (CAR |y|)
                        (CONS |pred| |condList|)))))
                (SETQ |bfVar#117| (CDR |bfVar#117|))))
             |c| NIL))
           ((AND (CONSP |u|) (EQ (CAR |u|) 'PROGN)
                 (PROGN (SETQ |c| (CDR |u|)) #1#))
            ((LAMBDA (|bfVar#118| |x|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#118|)
                      (PROGN (SETQ |x| (CAR |bfVar#118|)) NIL))
                  (RETURN NIL))
                 (#1# (|NRTdescendCodeTran| |x| |condList|)))
                (SETQ |bfVar#118| (CDR |bfVar#118|))))
             |c| NIL))
           (#1# NIL)))))

; NRTaddInner(x, e) ==
; --called by genDeltaEntry and others that affect $NRTdeltaList
;   PROGN
;     atom x => nil
;     x is ['Record, :l] =>
;         for [., ., y] in l repeat NRTinnerGetLocalIndex(y, e)
;     first x in '(Union Mapping) =>
;         for y in rest x repeat
;             y is [":", ., z] => NRTinnerGetLocalIndex(z, e)
;             NRTinnerGetLocalIndex(y, e)
;     x is ['SubDomain, y, :.] => NRTinnerGetLocalIndex(y, e)
;     getConstructorSignature x is [., :ml] =>
;         for y in rest x for m in ml | not (y = '$) repeat
;             isCategoryForm(m) => NRTinnerGetLocalIndex(y, e)
;     keyedSystemError("S2NR0003", [x])
;   x

(DEFUN |NRTaddInner| (|x| |e|)
  (PROG (|l| |ISTMP#1| |ISTMP#2| |y| |z| |ml|)
    (RETURN
     (PROGN
      (COND ((ATOM |x|) NIL)
            ((AND (CONSP |x|) (EQ (CAR |x|) '|Record|)
                  (PROGN (SETQ |l| (CDR |x|)) #1='T))
             ((LAMBDA (|bfVar#120| |bfVar#119|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#120|)
                       (PROGN (SETQ |bfVar#119| (CAR |bfVar#120|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (AND (CONSP |bfVar#119|)
                        (PROGN
                         (SETQ |ISTMP#1| (CDR |bfVar#119|))
                         (AND (CONSP |ISTMP#1|)
                              (PROGN
                               (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                               (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                    (PROGN (SETQ |y| (CAR |ISTMP#2|)) #1#)))))
                        (|NRTinnerGetLocalIndex| |y| |e|))))
                 (SETQ |bfVar#120| (CDR |bfVar#120|))))
              |l| NIL))
            ((|member| (CAR |x|) '(|Union| |Mapping|))
             ((LAMBDA (|bfVar#121| |y|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#121|)
                       (PROGN (SETQ |y| (CAR |bfVar#121|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (COND
                    ((AND (CONSP |y|) (EQ (CAR |y|) '|:|)
                          (PROGN
                           (SETQ |ISTMP#1| (CDR |y|))
                           (AND (CONSP |ISTMP#1|)
                                (PROGN
                                 (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                 (AND (CONSP |ISTMP#2|)
                                      (EQ (CDR |ISTMP#2|) NIL)
                                      (PROGN
                                       (SETQ |z| (CAR |ISTMP#2|))
                                       #1#))))))
                     (|NRTinnerGetLocalIndex| |z| |e|))
                    (#1# (|NRTinnerGetLocalIndex| |y| |e|)))))
                 (SETQ |bfVar#121| (CDR |bfVar#121|))))
              (CDR |x|) NIL))
            ((AND (CONSP |x|) (EQ (CAR |x|) '|SubDomain|)
                  (PROGN
                   (SETQ |ISTMP#1| (CDR |x|))
                   (AND (CONSP |ISTMP#1|)
                        (PROGN (SETQ |y| (CAR |ISTMP#1|)) #1#))))
             (|NRTinnerGetLocalIndex| |y| |e|))
            ((PROGN
              (SETQ |ISTMP#1| (|getConstructorSignature| |x|))
              (AND (CONSP |ISTMP#1|) (PROGN (SETQ |ml| (CDR |ISTMP#1|)) #1#)))
             ((LAMBDA (|bfVar#122| |y| |bfVar#123| |m|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#122|)
                       (PROGN (SETQ |y| (CAR |bfVar#122|)) NIL)
                       (ATOM |bfVar#123|)
                       (PROGN (SETQ |m| (CAR |bfVar#123|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (AND (NULL (EQ |y| '$))
                        (COND
                         ((|isCategoryForm| |m|)
                          (IDENTITY (|NRTinnerGetLocalIndex| |y| |e|)))))))
                 (SETQ |bfVar#122| (CDR |bfVar#122|))
                 (SETQ |bfVar#123| (CDR |bfVar#123|))))
              (CDR |x|) NIL |ml| NIL))
            (#1# (|keyedSystemError| 'S2NR0003 (LIST |x|))))
      |x|))))

; NRTinnerGetLocalIndex(x, e) ==
;     atom x => x
;     -- following test should skip Unions, Records, Mapping
;     MEMQ(opOf x, '(Union Record Mapping)) => NRTgetLocalIndex(x, e)
;     constructor?(x) => NRTgetLocalIndex(x, e)
;     NRTaddInner(x, e)

(DEFUN |NRTinnerGetLocalIndex| (|x| |e|)
  (PROG ()
    (RETURN
     (COND ((ATOM |x|) |x|)
           ((MEMQ (|opOf| |x|) '(|Union| |Record| |Mapping|))
            (|NRTgetLocalIndex| |x| |e|))
           ((|constructor?| |x|) (|NRTgetLocalIndex| |x| |e|))
           ('T (|NRTaddInner| |x| |e|))))))
