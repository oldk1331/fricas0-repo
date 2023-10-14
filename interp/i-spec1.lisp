 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; DEFPARAMETER($repeatLabel, NIL)
 
(DEFPARAMETER |$repeatLabel| NIL)
 
; DEFPARAMETER($breakCount, 0)
 
(DEFPARAMETER |$breakCount| 0)
 
; DEFPARAMETER($anonymousMapCounter, 0)
 
(DEFPARAMETER |$anonymousMapCounter| 0)
 
; voidValue() == '"()"
 
(DEFUN |voidValue| () (PROG () (RETURN "()")))
 
; upADEF t ==
;   t isnt [.,[vars,types,.,body],pred,.] => NIL
;   -- do some checking on what we got
;   for var in vars repeat
;     if not IDENTP(var) then throwKeyedMsg("S2IS0057",[var])
;   -- unabbreviate types
;   types := [(if t then evaluateType unabbrev t else NIL) for t in types]
;   -- we do not allow partial types
;   if isPartialMode(m := first types) then throwKeyedMsg("S2IS0058",[m])
; 
;   -- we want everything to be declared or nothing. The exception is that
;   -- we do not require a target type since we will compute one anyway.
;   if null(m) and rest types then
;     m := first rest types
;     types' := rest rest types
;   else
;     types' := rest types
;   for type in types' repeat
;     if (type and null m) or (m and null type) then
;       throwKeyedMsg("S2IS0059",NIL)
;     if isPartialMode type  then throwKeyedMsg("S2IS0058",[type])
; 
; --  $localVars: local := nil
; --  $freeVars:  local := nil
; --  $env:       local := [[NIL]]
;   $compilingMap : local := true
; 
;   -- if there is a predicate, merge it in with the body
;   if pred ~= true then body := ['IF,pred,body,'noMapVal]
; 
;   tar := getTarget t
;   null m and tar is ['Mapping,.,:argTypes] and (#vars = #argTypes) =>
;     if isPartialMode tar then throwKeyedMsg("S2IS0058",[tar])
;     evalTargetedADEF(t,vars,rest tar,body)
;   null m => evalUntargetedADEF(t,vars,types,body)
;   evalTargetedADEF(t,vars,types,body)
 
(DEFUN |upADEF| (|t|)
  (PROG (|$compilingMap| |argTypes| |tar| |types'| |m| |ISTMP#7| |pred|
         |ISTMP#6| |body| |ISTMP#5| |ISTMP#4| |types| |ISTMP#3| |vars|
         |ISTMP#2| |ISTMP#1|)
    (DECLARE (SPECIAL |$compilingMap|))
    (RETURN
     (COND
      ((NOT
        (AND (CONSP |t|)
             (PROGN
              (SETQ |ISTMP#1| (CDR |t|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN
                    (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|)
                         (PROGN
                          (SETQ |vars| (CAR |ISTMP#2|))
                          (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                          (AND (CONSP |ISTMP#3|)
                               (PROGN
                                (SETQ |types| (CAR |ISTMP#3|))
                                (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                                (AND (CONSP |ISTMP#4|)
                                     (PROGN
                                      (SETQ |ISTMP#5| (CDR |ISTMP#4|))
                                      (AND (CONSP |ISTMP#5|)
                                           (EQ (CDR |ISTMP#5|) NIL)
                                           (PROGN
                                            (SETQ |body| (CAR |ISTMP#5|))
                                            #1='T)))))))))
                   (PROGN
                    (SETQ |ISTMP#6| (CDR |ISTMP#1|))
                    (AND (CONSP |ISTMP#6|)
                         (PROGN
                          (SETQ |pred| (CAR |ISTMP#6|))
                          (SETQ |ISTMP#7| (CDR |ISTMP#6|))
                          (AND (CONSP |ISTMP#7|)
                               (EQ (CDR |ISTMP#7|) NIL)))))))))
       NIL)
      (#1#
       (PROGN
        ((LAMBDA (|bfVar#1| |var|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#1|) (PROGN (SETQ |var| (CAR |bfVar#1|)) NIL))
              (RETURN NIL))
             (#1#
              (COND
               ((NULL (IDENTP |var|))
                (|throwKeyedMsg| 'S2IS0057 (LIST |var|))))))
            (SETQ |bfVar#1| (CDR |bfVar#1|))))
         |vars| NIL)
        (SETQ |types|
                ((LAMBDA (|bfVar#3| |bfVar#2| |t|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#2|)
                          (PROGN (SETQ |t| (CAR |bfVar#2|)) NIL))
                      (RETURN (NREVERSE |bfVar#3|)))
                     (#1#
                      (SETQ |bfVar#3|
                              (CONS
                               (COND (|t| (|evaluateType| (|unabbrev| |t|)))
                                     (#1# NIL))
                               |bfVar#3|))))
                    (SETQ |bfVar#2| (CDR |bfVar#2|))))
                 NIL |types| NIL))
        (COND
         ((|isPartialMode| (SETQ |m| (CAR |types|)))
          (|throwKeyedMsg| 'S2IS0058 (LIST |m|))))
        (COND
         ((AND (NULL |m|) (CDR |types|)) (SETQ |m| (CAR (CDR |types|)))
          (SETQ |types'| (CDR (CDR |types|))))
         (#1# (SETQ |types'| (CDR |types|))))
        ((LAMBDA (|bfVar#4| |type|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#4|) (PROGN (SETQ |type| (CAR |bfVar#4|)) NIL))
              (RETURN NIL))
             (#1#
              (PROGN
               (COND
                ((OR (AND |type| (NULL |m|)) (AND |m| (NULL |type|)))
                 (|throwKeyedMsg| 'S2IS0059 NIL)))
               (COND
                ((|isPartialMode| |type|)
                 (|throwKeyedMsg| 'S2IS0058 (LIST |type|)))))))
            (SETQ |bfVar#4| (CDR |bfVar#4|))))
         |types'| NIL)
        (SETQ |$compilingMap| T)
        (COND
         ((NOT (EQUAL |pred| T))
          (SETQ |body| (LIST 'IF |pred| |body| '|noMapVal|))))
        (SETQ |tar| (|getTarget| |t|))
        (COND
         ((AND (NULL |m|) (CONSP |tar|) (EQ (CAR |tar|) '|Mapping|)
               (PROGN
                (SETQ |ISTMP#1| (CDR |tar|))
                (AND (CONSP |ISTMP#1|)
                     (PROGN (SETQ |argTypes| (CDR |ISTMP#1|)) #1#)))
               (EQL (LENGTH |vars|) (LENGTH |argTypes|)))
          (PROGN
           (COND
            ((|isPartialMode| |tar|) (|throwKeyedMsg| 'S2IS0058 (LIST |tar|))))
           (|evalTargetedADEF| |t| |vars| (CDR |tar|) |body|)))
         ((NULL |m|) (|evalUntargetedADEF| |t| |vars| |types| |body|))
         (#1# (|evalTargetedADEF| |t| |vars| |types| |body|)))))))))
 
; evalUntargetedADEF(t,vars,types,body) ==
;   -- recreate a parse form
;   if vars is [var]
;     then vars := var
;     else vars := ['Tuple,:vars]
;   val := objNewWrap(["+->",vars,body],$AnonymousFunction)
;   putValue(t,val)
;   putModeSet(t,[objMode val])
 
(DEFUN |evalUntargetedADEF| (|t| |vars| |types| |body|)
  (PROG (|var| |val|)
    (RETURN
     (PROGN
      (COND
       ((AND (CONSP |vars|) (EQ (CDR |vars|) NIL)
             (PROGN (SETQ |var| (CAR |vars|)) #1='T))
        (SETQ |vars| |var|))
       (#1# (SETQ |vars| (CONS '|Tuple| |vars|))))
      (SETQ |val|
              (|objNewWrap| (LIST '+-> |vars| |body|) |$AnonymousFunction|))
      (|putValue| |t| |val|)
      (|putModeSet| |t| (LIST (|objMode| |val|)))))))
 
; evalTargetedADEF(t,vars,types,body) ==
;   $mapName : local := makeInternalMapName('"anonymousFunction",
;     #vars,$anonymousMapCounter,'"internal")
;   $anonymousMapCounter := 1 + $anonymousMapCounter
;   $compilingMap   : local := true  -- state that we are trying to compile
;   $mapThrowCount  : local := 0     -- number of "return"s encountered
;   $mapReturnTypes : local := nil   -- list of types from returns
;   $repeatLabel    : local := nil   -- for loops; see upREPEAT
;   $breakCount     : local := 0     -- breaks from loops; ditto
; 
;   -- now substitute formal names for the parm variables
;   -- this is used in the interpret-code case, but isn't so bad any way
;   -- since it makes the bodies look more like regular map bodies
; 
;   sublist := [[var,:GENSYM()] for var in vars]
;   body := sublisNQ(sublist,body)
;   vars := [rest v for v in sublist]
; 
;   for m in rest types for var in vars repeat
;     $env:= put(var,'mode,m,$env)
;     mkLocalVar($mapName,var)
;   for lvar in getLocalVars($mapName,body) repeat
;     mkLocalVar($mapName,lvar)
;   -- set up catch point for interpret-code mode
;   x := CATCH('mapCompiler,compileTargetedADEF(t,vars,types,body))
;   x = 'tryInterpOnly => mkInterpTargetedADEF(t,vars,types,body)
;   x
 
(DEFUN |evalTargetedADEF| (|t| |vars| |types| |body|)
  (PROG (|$breakCount| |$repeatLabel| |$mapReturnTypes| |$mapThrowCount|
         |$compilingMap| |$mapName| |x| |sublist|)
    (DECLARE
     (SPECIAL |$breakCount| |$repeatLabel| |$mapReturnTypes| |$mapThrowCount|
      |$compilingMap| |$mapName|))
    (RETURN
     (PROGN
      (SETQ |$mapName|
              (|makeInternalMapName| "anonymousFunction" (LENGTH |vars|)
               |$anonymousMapCounter| "internal"))
      (SETQ |$anonymousMapCounter| (+ 1 |$anonymousMapCounter|))
      (SETQ |$compilingMap| T)
      (SETQ |$mapThrowCount| 0)
      (SETQ |$mapReturnTypes| NIL)
      (SETQ |$repeatLabel| NIL)
      (SETQ |$breakCount| 0)
      (SETQ |sublist|
              ((LAMBDA (|bfVar#6| |bfVar#5| |var|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#5|)
                        (PROGN (SETQ |var| (CAR |bfVar#5|)) NIL))
                    (RETURN (NREVERSE |bfVar#6|)))
                   (#1='T
                    (SETQ |bfVar#6| (CONS (CONS |var| (GENSYM)) |bfVar#6|))))
                  (SETQ |bfVar#5| (CDR |bfVar#5|))))
               NIL |vars| NIL))
      (SETQ |body| (|sublisNQ| |sublist| |body|))
      (SETQ |vars|
              ((LAMBDA (|bfVar#8| |bfVar#7| |v|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#7|)
                        (PROGN (SETQ |v| (CAR |bfVar#7|)) NIL))
                    (RETURN (NREVERSE |bfVar#8|)))
                   (#1# (SETQ |bfVar#8| (CONS (CDR |v|) |bfVar#8|))))
                  (SETQ |bfVar#7| (CDR |bfVar#7|))))
               NIL |sublist| NIL))
      ((LAMBDA (|bfVar#9| |m| |bfVar#10| |var|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#9|) (PROGN (SETQ |m| (CAR |bfVar#9|)) NIL)
                (ATOM |bfVar#10|) (PROGN (SETQ |var| (CAR |bfVar#10|)) NIL))
            (RETURN NIL))
           (#1#
            (PROGN
             (SETQ |$env| (|put| |var| '|mode| |m| |$env|))
             (|mkLocalVar| |$mapName| |var|))))
          (SETQ |bfVar#9| (CDR |bfVar#9|))
          (SETQ |bfVar#10| (CDR |bfVar#10|))))
       (CDR |types|) NIL |vars| NIL)
      ((LAMBDA (|bfVar#11| |lvar|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#11|) (PROGN (SETQ |lvar| (CAR |bfVar#11|)) NIL))
            (RETURN NIL))
           (#1# (|mkLocalVar| |$mapName| |lvar|)))
          (SETQ |bfVar#11| (CDR |bfVar#11|))))
       (|getLocalVars| |$mapName| |body|) NIL)
      (SETQ |x|
              (CATCH '|mapCompiler|
                (|compileTargetedADEF| |t| |vars| |types| |body|)))
      (COND
       ((EQ |x| '|tryInterpOnly|)
        (|mkInterpTargetedADEF| |t| |vars| |types| |body|))
       (#1# |x|))))))
 
; mkInterpTargetedADEF(t,vars,types,oldBody) ==
;   null first types =>
;     throwKeyedMsg("S2IS0056",NIL)
;     throwMessage '"   map result type needed but not present."
;   arglCode := ['LIST,:[argCode for type in rest types for var in vars]]
;     where argCode == ['putValueValue,['mkAtreeNode,MKQ var],
;       objNewCode(['wrap,var],type)]
;   put($mapName,'mapBody,oldBody,$e)
;   body := ['rewriteMap1,MKQ $mapName,arglCode,MKQ types]
;   compileADEFBody(t,vars,types,body,first types)
 
(DEFUN |mkInterpTargetedADEF| (|t| |vars| |types| |oldBody|)
  (PROG (|arglCode| |body|)
    (RETURN
     (COND
      ((NULL (CAR |types|))
       (PROGN
        (|throwKeyedMsg| 'S2IS0056 NIL)
        (|throwMessage| "   map result type needed but not present.")))
      (#1='T
       (PROGN
        (SETQ |arglCode|
                (CONS 'LIST
                      ((LAMBDA (|bfVar#14| |bfVar#12| |type| |bfVar#13| |var|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#12|)
                                (PROGN (SETQ |type| (CAR |bfVar#12|)) NIL)
                                (ATOM |bfVar#13|)
                                (PROGN (SETQ |var| (CAR |bfVar#13|)) NIL))
                            (RETURN (NREVERSE |bfVar#14|)))
                           (#1#
                            (SETQ |bfVar#14|
                                    (CONS
                                     (LIST '|putValueValue|
                                           (LIST '|mkAtreeNode| (MKQ |var|))
                                           (|objNewCode| (LIST '|wrap| |var|)
                                            |type|))
                                     |bfVar#14|))))
                          (SETQ |bfVar#12| (CDR |bfVar#12|))
                          (SETQ |bfVar#13| (CDR |bfVar#13|))))
                       NIL (CDR |types|) NIL |vars| NIL)))
        (|put| |$mapName| '|mapBody| |oldBody| |$e|)
        (SETQ |body|
                (LIST '|rewriteMap1| (MKQ |$mapName|) |arglCode|
                      (MKQ |types|)))
        (|compileADEFBody| |t| |vars| |types| |body| (CAR |types|))))))))
 
; compileTargetedADEF(t,vars,types,body) ==
;   val := compileBody(body, first types)
;   computedResultType := objMode val
;   body := wrapMapBodyWithCatch flattenCOND objVal val
;   compileADEFBody(t,vars,types,body,computedResultType)
 
(DEFUN |compileTargetedADEF| (|t| |vars| |types| |body|)
  (PROG (|val| |computedResultType|)
    (RETURN
     (PROGN
      (SETQ |val| (|compileBody| |body| (CAR |types|)))
      (SETQ |computedResultType| (|objMode| |val|))
      (SETQ |body| (|wrapMapBodyWithCatch| (|flattenCOND| (|objVal| |val|))))
      (|compileADEFBody| |t| |vars| |types| |body| |computedResultType|)))))
 
; compileADEFBody(t,vars,types,body,computedResultType) ==
; --+
;   $compiledOpNameList := [$mapName]
;   minivectorName := makeInternalMapMinivectorName(PNAME $mapName)
;   $minivectorNames := [[$mapName,:minivectorName],:$minivectorNames]
;   body := SUBST(minivectorName,"$$$",body)
;   if $compilingInputFile then
;     $minivectorCode := [:$minivectorCode,minivectorName]
;   SET(minivectorName,LIST2REFVEC $minivector)
; 
;   -- The use of the three variables $definingMap, $genValue and $compilingMap
;   -- is to cover the following cases:
;   --
;   -- $definingMap: This is set in analyzeMap and covers examples like:
;   --  addx x == ((y: Integer): Integer +-> x + y)
;   --  g := addx 10
;   --  g 3
;   -- i.e. we are storing the mapping as an object.
;   --
;   -- $compilingMap: This covers mappings which are created and applied "on the
;   -- "fly", for example:
;   --  [map(h +-> D(h, t), v) for v in [t]]
;   --
;   -- $genValue: This seems to be needed when we create a map as an argument
;   -- for a constructor, e.g.:
;   --  Dx: LODO(EXPR INT, f +-> D(f, x)) := D()
;   --
;   -- MCD 13/3/96
;   if not $definingMap and ($genValue or $compilingMap) then
;     fun := compileInteractive [$mapName,['LAMBDA,[:vars,'envArg],body]]
;     code := wrap RPLACA(fun, SYMBOL_-FUNCTION first fun)
;   else
;     $freeVariables := []
;     $boundVariables := [minivectorName,:vars]
;     -- CCL does not support upwards funargs, so we check for any free variables
;     -- and pass them into the lambda as part of envArg.
;     body := checkForFreeVariables(body,"ALL")
;     fun := ['function,['LAMBDA,[:vars,'envArg],body]]
;     code := ['CONS, fun, ["VECTOR", :reverse $freeVariables]]
; 
;   val := objNew(code,rt := ['Mapping,computedResultType,:rest types])
;   putValue(t,val)
;   putModeSet(t,[rt])
 
(DEFUN |compileADEFBody| (|t| |vars| |types| |body| |computedResultType|)
  (PROG (|minivectorName| |fun| |code| |rt| |val|)
    (RETURN
     (PROGN
      (SETQ |$compiledOpNameList| (LIST |$mapName|))
      (SETQ |minivectorName|
              (|makeInternalMapMinivectorName| (PNAME |$mapName|)))
      (SETQ |$minivectorNames|
              (CONS (CONS |$mapName| |minivectorName|) |$minivectorNames|))
      (SETQ |body| (SUBST |minivectorName| '$$$ |body|))
      (COND
       (|$compilingInputFile|
        (SETQ |$minivectorCode|
                (APPEND |$minivectorCode| (CONS |minivectorName| NIL)))))
      (SET |minivectorName| (LIST2REFVEC |$minivector|))
      (COND
       ((AND (NULL |$definingMap|) (OR |$genValue| |$compilingMap|))
        (SETQ |fun|
                (|compileInteractive|
                 (LIST |$mapName|
                       (LIST 'LAMBDA (APPEND |vars| (CONS '|envArg| NIL))
                             |body|))))
        (SETQ |code| (|wrap| (RPLACA |fun| (SYMBOL-FUNCTION (CAR |fun|))))))
       ('T (SETQ |$freeVariables| NIL)
        (SETQ |$boundVariables| (CONS |minivectorName| |vars|))
        (SETQ |body| (|checkForFreeVariables| |body| 'ALL))
        (SETQ |fun|
                (LIST '|function|
                      (LIST 'LAMBDA (APPEND |vars| (CONS '|envArg| NIL))
                            |body|)))
        (SETQ |code|
                (LIST 'CONS |fun| (CONS 'VECTOR (REVERSE |$freeVariables|))))))
      (SETQ |val|
              (|objNew| |code|
               (SETQ |rt|
                       (CONS '|Mapping|
                             (CONS |computedResultType| (CDR |types|))))))
      (|putValue| |t| |val|)
      (|putModeSet| |t| (LIST |rt|))))))
 
; upAlgExtension t ==
;   -- handler for algebraic extension declaration.  These are of
;   --  the form "a | a**2+1", and have the effect that "a" is declared
;   --  to be a simple algebraic extension, with respect to the given
;   --  polynomial, and given the value "a" in this type.
;   t isnt [op,var,eq] => nil
;   null $genValue => throwKeyedMsg("S2IS0001",NIL)
;   a := getUnname var
;   clearCmdParts ['propert,a]  --clear properties of a
;   algExtension:= eq2AlgExtension eq
;   upmode := ['UnivariatePolynomial,a,$EmptyMode]
;   $declaredMode : local := upmode
;   putTarget(algExtension,upmode)
;   ms:= bottomUp algExtension
;   triple:= getValue algExtension
;   upmode:= resolveTMOrCroak(objMode(triple),upmode)
;   null (T:= coerceInteractive(triple,upmode)) =>
;     throwKeyedMsgCannotCoerceWithValue(objVal(triple),
;       objMode(triple),upmode)
;   newmode := objMode T
;   (field := resolveTCat(CADDR newmode,'(Field))) or
;     throwKeyedMsg("S2IS0002",[eq])
;   pd:= ['UnivariatePolynomial,a,field]
;   null (canonicalAE:= coerceInteractive(T,pd)) =>
;     throwKeyedMsgCannotCoerceWithValue(objVal T,objMode T,pd)
;   sae:= ['SimpleAlgebraicExtension,field,pd,objValUnwrap canonicalAE]
;   saeTypeSynonym := INTERN STRCONC('"SAE",STRINGIMAGE a)
;   saeTypeSynonymValue := objNew(sae,'(Type))
;   fun := getFunctionFromDomain('generator,sae,NIL)
;   expr:= wrap SPADCALL(fun)
;   putHist(saeTypeSynonym,'value,saeTypeSynonymValue,$e)
;   putHist(a,'mode,sae,$e)
;   putHist(a,'value,T2:= objNew(expr,sae),$e)
;   clearDependencies(a,true)
;   if $printTypeIfTrue then
;     sayKeyedMsg("S2IS0003",NIL)
;     sayMSG concat ['%l,'"   ",saeTypeSynonym,'" := ",
;       :prefix2String objVal saeTypeSynonymValue]
;     sayMSG concat ['"   ",a,'" : ",saeTypeSynonym,'" := ",a]
;   putValue(op,T2)
;   putModeSet(op,[sae])
 
(DEFUN |upAlgExtension| (|t|)
  (PROG (|$declaredMode| T2 |expr| |fun| |saeTypeSynonymValue| |saeTypeSynonym|
         |sae| |canonicalAE| |pd| |field| |newmode| T$ |triple| |ms| |upmode|
         |algExtension| |a| |eq| |ISTMP#2| |var| |ISTMP#1| |op|)
    (DECLARE (SPECIAL |$declaredMode|))
    (RETURN
     (COND
      ((NOT
        (AND (CONSP |t|)
             (PROGN
              (SETQ |op| (CAR |t|))
              (SETQ |ISTMP#1| (CDR |t|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN
                    (SETQ |var| (CAR |ISTMP#1|))
                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                         (PROGN (SETQ |eq| (CAR |ISTMP#2|)) #1='T)))))))
       NIL)
      ((NULL |$genValue|) (|throwKeyedMsg| 'S2IS0001 NIL))
      (#1#
       (PROGN
        (SETQ |a| (|getUnname| |var|))
        (|clearCmdParts| (LIST '|propert| |a|))
        (SETQ |algExtension| (|eq2AlgExtension| |eq|))
        (SETQ |upmode| (LIST '|UnivariatePolynomial| |a| |$EmptyMode|))
        (SETQ |$declaredMode| |upmode|)
        (|putTarget| |algExtension| |upmode|)
        (SETQ |ms| (|bottomUp| |algExtension|))
        (SETQ |triple| (|getValue| |algExtension|))
        (SETQ |upmode| (|resolveTMOrCroak| (|objMode| |triple|) |upmode|))
        (COND
         ((NULL (SETQ T$ (|coerceInteractive| |triple| |upmode|)))
          (|throwKeyedMsgCannotCoerceWithValue| (|objVal| |triple|)
           (|objMode| |triple|) |upmode|))
         (#1#
          (PROGN
           (SETQ |newmode| (|objMode| T$))
           (OR (SETQ |field| (|resolveTCat| (CADDR |newmode|) '(|Field|)))
               (|throwKeyedMsg| 'S2IS0002 (LIST |eq|)))
           (SETQ |pd| (LIST '|UnivariatePolynomial| |a| |field|))
           (COND
            ((NULL (SETQ |canonicalAE| (|coerceInteractive| T$ |pd|)))
             (|throwKeyedMsgCannotCoerceWithValue| (|objVal| T$) (|objMode| T$)
              |pd|))
            (#1#
             (PROGN
              (SETQ |sae|
                      (LIST '|SimpleAlgebraicExtension| |field| |pd|
                            (|objValUnwrap| |canonicalAE|)))
              (SETQ |saeTypeSynonym|
                      (INTERN (STRCONC "SAE" (STRINGIMAGE |a|))))
              (SETQ |saeTypeSynonymValue| (|objNew| |sae| '(|Type|)))
              (SETQ |fun| (|getFunctionFromDomain| '|generator| |sae| NIL))
              (SETQ |expr| (|wrap| (SPADCALL |fun|)))
              (|putHist| |saeTypeSynonym| '|value| |saeTypeSynonymValue| |$e|)
              (|putHist| |a| '|mode| |sae| |$e|)
              (|putHist| |a| '|value| (SETQ T2 (|objNew| |expr| |sae|)) |$e|)
              (|clearDependencies| |a| T)
              (COND
               (|$printTypeIfTrue| (|sayKeyedMsg| 'S2IS0003 NIL)
                (|sayMSG|
                 (|concat|
                  (CONS '|%l|
                        (CONS "   "
                              (CONS |saeTypeSynonym|
                                    (CONS " := "
                                          (|prefix2String|
                                           (|objVal|
                                            |saeTypeSynonymValue|))))))))
                (|sayMSG|
                 (|concat|
                  (LIST "   " |a| " : " |saeTypeSynonym| " := " |a|)))))
              (|putValue| |op| T2)
              (|putModeSet| |op| (LIST |sae|))))))))))))))
 
; eq2AlgExtension eq ==
;   -- transforms "a=b" to a-b for processing
;   eq is [op,:l] and VECP op and (getUnname op='equation) =>
;     [mkAtreeNode "-",:l]
;   eq
 
(DEFUN |eq2AlgExtension| (|eq|)
  (PROG (|op| |l|)
    (RETURN
     (COND
      ((AND (CONSP |eq|)
            (PROGN (SETQ |op| (CAR |eq|)) (SETQ |l| (CDR |eq|)) #1='T)
            (VECP |op|) (EQ (|getUnname| |op|) '|equation|))
       (CONS (|mkAtreeNode| '-) |l|))
      (#1# |eq|)))))
 
; upand x ==
;   -- generates code for  and  forms. The second argument is only
;   -- evaluated if the first argument is true.
;   x isnt [op,term1,term2] => NIL
;   putTarget(term1,$Boolean)
;   putTarget(term2,$Boolean)
;   ms := bottomUp term1
;   ms isnt [=$Boolean] => throwKeyedMsgSP("S2IS0054",[1,'"_"and_""],term1)
;   $genValue =>
;     BooleanEquality(objValUnwrap(getValue term1),
;       getConstantFromDomain('(false),$Boolean)) =>
;         putValue(x,getValue term1)
;         putModeSet(x,ms)
;     -- first term is true, so look at the second one
;     ms := bottomUp term2
;     ms isnt [=$Boolean] => throwKeyedMsgSP("S2IS0054",[2,'"_"and_""],term2)
;     putValue(x,getValue term2)
;     putModeSet(x,ms)
; 
;   ms := bottomUp term2
;   ms isnt [=$Boolean] => throwKeyedMsgSP("S2IS0054",[2,'"_"and_""],term2)
;   -- generate an IF expression and let the rest of the code handle it
;   cond := [mkAtreeNode "=",mkAtree 'false,term1]
;   putTarget(cond,$Boolean)
;   code := [mkAtreeNode 'IF,cond,mkAtree 'false,term2]
;   putTarget(code,$Boolean)
;   bottomUp code
;   putValue(x,getValue code)
;   putModeSet(x,ms)
 
(DEFUN |upand| (|x|)
  (PROG (|op| |ISTMP#1| |term1| |ISTMP#2| |term2| |ms| |cond| |code|)
    (RETURN
     (COND
      ((NOT
        (AND (CONSP |x|)
             (PROGN
              (SETQ |op| (CAR |x|))
              (SETQ |ISTMP#1| (CDR |x|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN
                    (SETQ |term1| (CAR |ISTMP#1|))
                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                         (PROGN (SETQ |term2| (CAR |ISTMP#2|)) #1='T)))))))
       NIL)
      (#1#
       (PROGN
        (|putTarget| |term1| |$Boolean|)
        (|putTarget| |term2| |$Boolean|)
        (SETQ |ms| (|bottomUp| |term1|))
        (COND
         ((NOT
           (AND (CONSP |ms|) (EQ (CDR |ms|) NIL)
                (EQUAL (CAR |ms|) |$Boolean|)))
          (|throwKeyedMsgSP| 'S2IS0054 (LIST 1 "\"and\"") |term1|))
         (|$genValue|
          (COND
           ((|BooleanEquality| (|objValUnwrap| (|getValue| |term1|))
             (|getConstantFromDomain| '(|false|) |$Boolean|))
            (PROGN
             (|putValue| |x| (|getValue| |term1|))
             (|putModeSet| |x| |ms|)))
           (#1#
            (PROGN
             (SETQ |ms| (|bottomUp| |term2|))
             (COND
              ((NOT
                (AND (CONSP |ms|) (EQ (CDR |ms|) NIL)
                     (EQUAL (CAR |ms|) |$Boolean|)))
               (|throwKeyedMsgSP| 'S2IS0054 (LIST 2 "\"and\"") |term2|))
              (#1#
               (PROGN
                (|putValue| |x| (|getValue| |term2|))
                (|putModeSet| |x| |ms|))))))))
         (#1#
          (PROGN
           (SETQ |ms| (|bottomUp| |term2|))
           (COND
            ((NOT
              (AND (CONSP |ms|) (EQ (CDR |ms|) NIL)
                   (EQUAL (CAR |ms|) |$Boolean|)))
             (|throwKeyedMsgSP| 'S2IS0054 (LIST 2 "\"and\"") |term2|))
            (#1#
             (PROGN
              (SETQ |cond|
                      (LIST (|mkAtreeNode| '=) (|mkAtree| '|false|) |term1|))
              (|putTarget| |cond| |$Boolean|)
              (SETQ |code|
                      (LIST (|mkAtreeNode| 'IF) |cond| (|mkAtree| '|false|)
                            |term2|))
              (|putTarget| |code| |$Boolean|)
              (|bottomUp| |code|)
              (|putValue| |x| (|getValue| |code|))
              (|putModeSet| |x| |ms|)))))))))))))
 
; upor x ==
;   -- generates code for  or  forms. The second argument is only
;   -- evaluated if the first argument is false.
;   x isnt [op,term1,term2] => NIL
;   putTarget(term1,$Boolean)
;   putTarget(term2,$Boolean)
;   ms := bottomUp term1
;   ms isnt [=$Boolean] => throwKeyedMsgSP("S2IS0054",[1,'"_"or_""],term1)
;   $genValue =>
;     BooleanEquality(objValUnwrap(getValue term1),
;       getConstantFromDomain('(true),$Boolean)) =>
;         putValue(x,getValue term1)
;         putModeSet(x,ms)
;     -- first term is false, so look at the second one
;     ms := bottomUp term2
;     ms isnt [=$Boolean] => throwKeyedMsgSP("S2IS0054",[2,'"_"or_""],term2)
;     putValue(x,getValue term2)
;     putModeSet(x,ms)
; 
;   ms := bottomUp term2
;   ms isnt [=$Boolean] => throwKeyedMsgSP("S2IS0054",[2,'"_"or_""],term2)
;   -- generate an IF expression and let the rest of the code handle it
;   cond := [mkAtreeNode "=",mkAtree 'true,term1]
;   putTarget(cond,$Boolean)
;   code := [mkAtreeNode 'IF,cond,mkAtree 'true,term2]
;   putTarget(code,$Boolean)
;   bottomUp code
;   putValue(x,getValue code)
;   putModeSet(x,ms)
 
(DEFUN |upor| (|x|)
  (PROG (|op| |ISTMP#1| |term1| |ISTMP#2| |term2| |ms| |cond| |code|)
    (RETURN
     (COND
      ((NOT
        (AND (CONSP |x|)
             (PROGN
              (SETQ |op| (CAR |x|))
              (SETQ |ISTMP#1| (CDR |x|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN
                    (SETQ |term1| (CAR |ISTMP#1|))
                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                         (PROGN (SETQ |term2| (CAR |ISTMP#2|)) #1='T)))))))
       NIL)
      (#1#
       (PROGN
        (|putTarget| |term1| |$Boolean|)
        (|putTarget| |term2| |$Boolean|)
        (SETQ |ms| (|bottomUp| |term1|))
        (COND
         ((NOT
           (AND (CONSP |ms|) (EQ (CDR |ms|) NIL)
                (EQUAL (CAR |ms|) |$Boolean|)))
          (|throwKeyedMsgSP| 'S2IS0054 (LIST 1 "\"or\"") |term1|))
         (|$genValue|
          (COND
           ((|BooleanEquality| (|objValUnwrap| (|getValue| |term1|))
             (|getConstantFromDomain| '(|true|) |$Boolean|))
            (PROGN
             (|putValue| |x| (|getValue| |term1|))
             (|putModeSet| |x| |ms|)))
           (#1#
            (PROGN
             (SETQ |ms| (|bottomUp| |term2|))
             (COND
              ((NOT
                (AND (CONSP |ms|) (EQ (CDR |ms|) NIL)
                     (EQUAL (CAR |ms|) |$Boolean|)))
               (|throwKeyedMsgSP| 'S2IS0054 (LIST 2 "\"or\"") |term2|))
              (#1#
               (PROGN
                (|putValue| |x| (|getValue| |term2|))
                (|putModeSet| |x| |ms|))))))))
         (#1#
          (PROGN
           (SETQ |ms| (|bottomUp| |term2|))
           (COND
            ((NOT
              (AND (CONSP |ms|) (EQ (CDR |ms|) NIL)
                   (EQUAL (CAR |ms|) |$Boolean|)))
             (|throwKeyedMsgSP| 'S2IS0054 (LIST 2 "\"or\"") |term2|))
            (#1#
             (PROGN
              (SETQ |cond|
                      (LIST (|mkAtreeNode| '=) (|mkAtree| '|true|) |term1|))
              (|putTarget| |cond| |$Boolean|)
              (SETQ |code|
                      (LIST (|mkAtreeNode| 'IF) |cond| (|mkAtree| '|true|)
                            |term2|))
              (|putTarget| |code| |$Boolean|)
              (|bottomUp| |code|)
              (|putValue| |x| (|getValue| |code|))
              (|putModeSet| |x| |ms|)))))))))))))
 
; upcase t ==
;   t isnt [op,lhs,rhs] => nil
;   bottomUp lhs
;   triple := getValue lhs
;   objMode(triple) isnt ['Union,:unionDoms] =>
;     throwKeyedMsg("S2IS0004",NIL)
;   if (rhs' := isDomainValuedVariable(rhs)) then rhs := rhs'
;   if first unionDoms is ['_:,.,.] then
;      for i in 0.. for d in unionDoms repeat
;         if d is ['_:,=rhs,.] then rhstag := i
;      if NULL rhstag then error "upcase: bad Union form"
;      $genValue =>
;         rhstag = first unwrap objVal triple => code := wrap 'TRUE
;         code := wrap NIL
;      code :=
;         ['COND,
;           [['EQL,rhstag,['CAR,['unwrap,objVal triple]]],
;             ''TRUE],
;               [''T,NIL]]
;   else
;     $genValue =>
;         t' := coerceUnion2Branch triple
;         rhs = objMode t' => code := wrap 'TRUE
;         code := wrap NIL
;     triple' := objNewCode(['wrap,objVal triple],objMode triple)
;     code :=
;         ['COND,
;           [['EQUAL,MKQ rhs,['objMode,['coerceUnion2Branch,triple']]],
;             ''TRUE],
;               [''T,NIL]]
;   putValue(op,objNew(code,$Boolean))
;   putModeSet(op,[$Boolean])
 
(DEFUN |upcase| (|t|)
  (PROG (|op| |ISTMP#1| |lhs| |ISTMP#2| |rhs| |triple| |unionDoms| |rhs'|
         |ISTMP#3| |rhstag| |code| |t'| |triple'|)
    (RETURN
     (COND
      ((NOT
        (AND (CONSP |t|)
             (PROGN
              (SETQ |op| (CAR |t|))
              (SETQ |ISTMP#1| (CDR |t|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN
                    (SETQ |lhs| (CAR |ISTMP#1|))
                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                         (PROGN (SETQ |rhs| (CAR |ISTMP#2|)) #1='T)))))))
       NIL)
      (#1#
       (PROGN
        (|bottomUp| |lhs|)
        (SETQ |triple| (|getValue| |lhs|))
        (COND
         ((NOT
           (PROGN
            (SETQ |ISTMP#1| (|objMode| |triple|))
            (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|Union|)
                 (PROGN (SETQ |unionDoms| (CDR |ISTMP#1|)) #1#))))
          (|throwKeyedMsg| 'S2IS0004 NIL))
         (#1#
          (PROGN
           (COND
            ((SETQ |rhs'| (|isDomainValuedVariable| |rhs|))
             (SETQ |rhs| |rhs'|)))
           (COND
            ((PROGN
              (SETQ |ISTMP#1| (CAR |unionDoms|))
              (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|:|)
                   (PROGN
                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|)
                         (PROGN
                          (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                          (AND (CONSP |ISTMP#3|) (EQ (CDR |ISTMP#3|) NIL)))))))
             ((LAMBDA (|i| |bfVar#15| |d|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#15|)
                       (PROGN (SETQ |d| (CAR |bfVar#15|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (COND
                    ((AND (CONSP |d|) (EQ (CAR |d|) '|:|)
                          (PROGN
                           (SETQ |ISTMP#1| (CDR |d|))
                           (AND (CONSP |ISTMP#1|) (EQUAL (CAR |ISTMP#1|) |rhs|)
                                (PROGN
                                 (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                 (AND (CONSP |ISTMP#2|)
                                      (EQ (CDR |ISTMP#2|) NIL))))))
                     (SETQ |rhstag| |i|)))))
                 (SETQ |i| (+ |i| 1))
                 (SETQ |bfVar#15| (CDR |bfVar#15|))))
              0 |unionDoms| NIL)
             (COND ((NULL |rhstag|) (|error| '|upcase: bad Union form|)))
             (COND
              (|$genValue|
               (COND
                ((EQUAL |rhstag| (CAR (|unwrap| (|objVal| |triple|))))
                 (SETQ |code| (|wrap| 'TRUE)))
                (#1# (SETQ |code| (|wrap| NIL)))))
              (#1#
               (SETQ |code|
                       (LIST 'COND
                             (LIST
                              (LIST 'EQL |rhstag|
                                    (LIST 'CAR
                                          (LIST '|unwrap|
                                                (|objVal| |triple|))))
                              ''TRUE)
                             (LIST ''T NIL))))))
            (|$genValue|
             (PROGN
              (SETQ |t'| (|coerceUnion2Branch| |triple|))
              (COND
               ((EQUAL |rhs| (|objMode| |t'|)) (SETQ |code| (|wrap| 'TRUE)))
               (#1# (SETQ |code| (|wrap| NIL))))))
            (#1#
             (PROGN
              (SETQ |triple'|
                      (|objNewCode| (LIST '|wrap| (|objVal| |triple|))
                       (|objMode| |triple|)))
              (SETQ |code|
                      (LIST 'COND
                            (LIST
                             (LIST 'EQUAL (MKQ |rhs|)
                                   (LIST '|objMode|
                                         (LIST '|coerceUnion2Branch|
                                               |triple'|)))
                             ''TRUE)
                            (LIST ''T NIL))))))
           (|putValue| |op| (|objNew| |code| |$Boolean|))
           (|putModeSet| |op| (LIST |$Boolean|)))))))))))
 
; upTARGET t ==
;   -- Evaluates the rhs to a mode,which is used as the target type for
;   -- the lhs.
;   t isnt [op,lhs,rhs] => nil
;   -- do not (yet) support local variables on the rhs
;   (not $genValue) and or/[CONTAINED(var,rhs) for var in $localVars] =>
;     keyedMsgCompFailure("S2IC0010",[rhs])
;   $declaredMode: local := NIL
;   m:= evaluateType unabbrev rhs
;   not isLegitimateMode(m,NIL,NIL) => throwKeyedMsg("S2IE0004",[m])
;   $declaredMode:= m
;   not atom(lhs) and putTarget(lhs,m)
;   ms := bottomUp lhs
;   first ms ~= m =>
;     throwKeyedMsg("S2IC0011",[first ms,m])
;   if categoryForm?(m) then
;       putValue(op, objNew(devaluate objValUnwrap getValue lhs, m))
;   else
;       putValue(op,getValue lhs)
;   putModeSet(op,ms)
 
(DEFUN |upTARGET| (|t|)
  (PROG (|$declaredMode| |ms| |m| |rhs| |ISTMP#2| |lhs| |ISTMP#1| |op|)
    (DECLARE (SPECIAL |$declaredMode|))
    (RETURN
     (COND
      ((NOT
        (AND (CONSP |t|)
             (PROGN
              (SETQ |op| (CAR |t|))
              (SETQ |ISTMP#1| (CDR |t|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN
                    (SETQ |lhs| (CAR |ISTMP#1|))
                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                         (PROGN (SETQ |rhs| (CAR |ISTMP#2|)) #1='T)))))))
       NIL)
      ((AND (NULL |$genValue|)
            ((LAMBDA (|bfVar#17| |bfVar#16| |var|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#16|)
                      (PROGN (SETQ |var| (CAR |bfVar#16|)) NIL))
                  (RETURN |bfVar#17|))
                 (#1#
                  (PROGN
                   (SETQ |bfVar#17| (CONTAINED |var| |rhs|))
                   (COND (|bfVar#17| (RETURN |bfVar#17|))))))
                (SETQ |bfVar#16| (CDR |bfVar#16|))))
             NIL |$localVars| NIL))
       (|keyedMsgCompFailure| 'S2IC0010 (LIST |rhs|)))
      (#1#
       (PROGN
        (SETQ |$declaredMode| NIL)
        (SETQ |m| (|evaluateType| (|unabbrev| |rhs|)))
        (COND
         ((NULL (|isLegitimateMode| |m| NIL NIL))
          (|throwKeyedMsg| 'S2IE0004 (LIST |m|)))
         (#1#
          (PROGN
           (SETQ |$declaredMode| |m|)
           (AND (NULL (ATOM |lhs|)) (|putTarget| |lhs| |m|))
           (SETQ |ms| (|bottomUp| |lhs|))
           (COND
            ((NOT (EQUAL (CAR |ms|) |m|))
             (|throwKeyedMsg| 'S2IC0011 (LIST (CAR |ms|) |m|)))
            (#1#
             (PROGN
              (COND
               ((|categoryForm?| |m|)
                (|putValue| |op|
                 (|objNew| (|devaluate| (|objValUnwrap| (|getValue| |lhs|)))
                  |m|)))
               (#1# (|putValue| |op| (|getValue| |lhs|))))
              (|putModeSet| |op| |ms|)))))))))))))
 
; upCOERCE t ==
;   -- evaluate the lhs and then tries to coerce the result to the
;   -- mode which is the rhs.
;   -- previous to 5/16/89, this had the same semantics as
;   --    (lhs@rhs) :: rhs
;   -- this must be made explicit now.
;   t isnt [op,lhs,rhs] => nil
;   $useConvertForCoercions : local := true
;   -- do not (yet) support local variables on the rhs
;   (not $genValue) and or/[CONTAINED(var,rhs) for var in $localVars] =>
;     keyedMsgCompFailure("S2IC0006",[rhs])
;   $declaredMode: local := NIL
;   m := evaluateType unabbrev rhs
;   not isLegitimateMode(m,NIL,NIL) => throwKeyedMsg("S2IE0004",[m])
;   $declaredMode:= m
;   -- 05/16/89 (RSS) following line commented out to give correct
;   -- semantic difference between :: and @
;   bottomUp lhs
;   type:=evalCOERCE(op,lhs,m)
;   putModeSet(op,[type])
 
(DEFUN |upCOERCE| (|t|)
  (PROG (|$declaredMode| |$useConvertForCoercions| |type| |m| |rhs| |ISTMP#2|
         |lhs| |ISTMP#1| |op|)
    (DECLARE (SPECIAL |$declaredMode| |$useConvertForCoercions|))
    (RETURN
     (COND
      ((NOT
        (AND (CONSP |t|)
             (PROGN
              (SETQ |op| (CAR |t|))
              (SETQ |ISTMP#1| (CDR |t|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN
                    (SETQ |lhs| (CAR |ISTMP#1|))
                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                         (PROGN (SETQ |rhs| (CAR |ISTMP#2|)) #1='T)))))))
       NIL)
      (#1#
       (PROGN
        (SETQ |$useConvertForCoercions| T)
        (COND
         ((AND (NULL |$genValue|)
               ((LAMBDA (|bfVar#19| |bfVar#18| |var|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#18|)
                         (PROGN (SETQ |var| (CAR |bfVar#18|)) NIL))
                     (RETURN |bfVar#19|))
                    (#1#
                     (PROGN
                      (SETQ |bfVar#19| (CONTAINED |var| |rhs|))
                      (COND (|bfVar#19| (RETURN |bfVar#19|))))))
                   (SETQ |bfVar#18| (CDR |bfVar#18|))))
                NIL |$localVars| NIL))
          (|keyedMsgCompFailure| 'S2IC0006 (LIST |rhs|)))
         (#1#
          (PROGN
           (SETQ |$declaredMode| NIL)
           (SETQ |m| (|evaluateType| (|unabbrev| |rhs|)))
           (COND
            ((NULL (|isLegitimateMode| |m| NIL NIL))
             (|throwKeyedMsg| 'S2IE0004 (LIST |m|)))
            (#1#
             (PROGN
              (SETQ |$declaredMode| |m|)
              (|bottomUp| |lhs|)
              (SETQ |type| (|evalCOERCE| |op| |lhs| |m|))
              (|putModeSet| |op| (LIST |type|))))))))))))))
 
; evalCOERCE(op,tree,m) ==
;   -- the value of tree is coerced to mode m
;   -- this is not necessary, if the target property of tree was used
;   v  := getValue tree
;   t1 := objMode(v)
;   if $genValue and t1 is ['Union,:.] then
;     v := coerceUnion2Branch v
;     t1 := objMode(v)
;   e  := objVal(v)
;   value:=
;     t1=m => v
;     t2 :=
;       if isPartialMode m
;         then
;           $genValue and (t1 = '(Symbol)) and containsPolynomial m =>
;             resolveTM(['UnivariatePolynomial,objValUnwrap(v),'(Integer)],m)
;           resolveTM(t1,m)
;         else m
;     null t2 => throwKeyedMsgCannotCoerceWithValue(e,t1,m)
;     $genValue => coerceOrRetract(v,t2)
;     objNew(getArgValue(tree,t2),t2)
;   val:= value or throwKeyedMsgCannotCoerceWithValue(e,t1,m)
;   if categoryForm?(m) then
;       putValue(op, objNew(devaluate objValUnwrap val, m))
;   else
;       putValue(op,val)
;   objMode(val)
 
(DEFUN |evalCOERCE| (|op| |tree| |m|)
  (PROG (|v| |t1| |e| |t2| |value| |val|)
    (RETURN
     (PROGN
      (SETQ |v| (|getValue| |tree|))
      (SETQ |t1| (|objMode| |v|))
      (COND
       ((AND |$genValue| (CONSP |t1|) (EQ (CAR |t1|) '|Union|))
        (SETQ |v| (|coerceUnion2Branch| |v|)) (SETQ |t1| (|objMode| |v|))))
      (SETQ |e| (|objVal| |v|))
      (SETQ |value|
              (COND ((EQUAL |t1| |m|) |v|)
                    (#1='T
                     (PROGN
                      (SETQ |t2|
                              (COND
                               ((|isPartialMode| |m|)
                                (COND
                                 ((AND |$genValue| (EQUAL |t1| '(|Symbol|))
                                       (|containsPolynomial| |m|))
                                  (|resolveTM|
                                   (LIST '|UnivariatePolynomial|
                                         (|objValUnwrap| |v|) '(|Integer|))
                                   |m|))
                                 (#1# (|resolveTM| |t1| |m|))))
                               (#1# |m|)))
                      (COND
                       ((NULL |t2|)
                        (|throwKeyedMsgCannotCoerceWithValue| |e| |t1| |m|))
                       (|$genValue| (|coerceOrRetract| |v| |t2|))
                       (#1# (|objNew| (|getArgValue| |tree| |t2|) |t2|)))))))
      (SETQ |val|
              (OR |value| (|throwKeyedMsgCannotCoerceWithValue| |e| |t1| |m|)))
      (COND
       ((|categoryForm?| |m|)
        (|putValue| |op| (|objNew| (|devaluate| (|objValUnwrap| |val|)) |m|)))
       (#1# (|putValue| |op| |val|)))
      (|objMode| |val|)))))
 
; transformCollect [:itrl,body] ==
;   -- syntactic transformation for COLLECT form, called from mkAtree1
;   iterList:=[:iterTran1 for it in itrl] where iterTran1 ==
;     it is ['STEP,index,lower,step,:upperList] =>
;       [['STEP,index,mkAtree1 lower,mkAtree1 step,:[mkAtree1 upper
;         for upper in upperList]]]
;     it is ['IN,index,s] =>
;       [['IN,index,mkAtree1 s]]
;     it is ['ON,index,s] =>
;       [['IN,index,mkAtree1 ['tails,s]]]
;     it is ['WHILE,b] =>
;       [['WHILE,mkAtree1 b]]
;     it is ['_|,pred] =>
;       [['SUCHTHAT,mkAtree1 pred]]
;     it is [op,:.] and (op in '(VALUE UNTIL)) => nil
;   bodyTree:=mkAtree1 body
;   iterList:=NCONC(iterList,[:iterTran2 for it in itrl]) where
;     iterTran2 ==
;       it is ['STEP,:.] => nil
;       it is ['IN,:.] => nil
;       it is ['ON,:.] => nil
;       it is ['WHILE,:.] => nil
;       it is [op,b] and (op in '(UNTIL)) =>
;         [[op,mkAtree1 b]]
;       it is ['_|,pred] => nil
;       keyedSystemError("S2GE0016",
;         ['"transformCollect",'"Unknown type of iterator"])
;   [:iterList,bodyTree]
 
(DEFUN |transformCollect| (|bfVar#26|)
  (PROG (|LETTMP#1| |body| |itrl| |ISTMP#1| |index| |ISTMP#2| |lower| |ISTMP#3|
         |step| |upperList| |s| |b| |pred| |op| |iterList| |bodyTree|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (REVERSE |bfVar#26|))
      (SETQ |body| (CAR |LETTMP#1|))
      (SETQ |itrl| (NREVERSE (CDR |LETTMP#1|)))
      (SETQ |iterList|
              ((LAMBDA (|bfVar#21| |bfVar#20| |it|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#20|)
                        (PROGN (SETQ |it| (CAR |bfVar#20|)) NIL))
                    (RETURN (NREVERSE |bfVar#21|)))
                   (#1='T
                    (SETQ |bfVar#21|
                            (APPEND
                             (REVERSE
                              (COND
                               ((AND (CONSP |it|) (EQ (CAR |it|) 'STEP)
                                     (PROGN
                                      (SETQ |ISTMP#1| (CDR |it|))
                                      (AND (CONSP |ISTMP#1|)
                                           (PROGN
                                            (SETQ |index| (CAR |ISTMP#1|))
                                            (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                            (AND (CONSP |ISTMP#2|)
                                                 (PROGN
                                                  (SETQ |lower|
                                                          (CAR |ISTMP#2|))
                                                  (SETQ |ISTMP#3|
                                                          (CDR |ISTMP#2|))
                                                  (AND (CONSP |ISTMP#3|)
                                                       (PROGN
                                                        (SETQ |step|
                                                                (CAR
                                                                 |ISTMP#3|))
                                                        (SETQ |upperList|
                                                                (CDR
                                                                 |ISTMP#3|))
                                                        #1#))))))))
                                (LIST
                                 (CONS 'STEP
                                       (CONS |index|
                                             (CONS (|mkAtree1| |lower|)
                                                   (CONS (|mkAtree1| |step|)
                                                         ((LAMBDA
                                                              (|bfVar#23|
                                                               |bfVar#22|
                                                               |upper|)
                                                            (LOOP
                                                             (COND
                                                              ((OR
                                                                (ATOM
                                                                 |bfVar#22|)
                                                                (PROGN
                                                                 (SETQ |upper|
                                                                         (CAR
                                                                          |bfVar#22|))
                                                                 NIL))
                                                               (RETURN
                                                                (NREVERSE
                                                                 |bfVar#23|)))
                                                              (#1#
                                                               (SETQ |bfVar#23|
                                                                       (CONS
                                                                        (|mkAtree1|
                                                                         |upper|)
                                                                        |bfVar#23|))))
                                                             (SETQ |bfVar#22|
                                                                     (CDR
                                                                      |bfVar#22|))))
                                                          NIL |upperList|
                                                          NIL)))))))
                               ((AND (CONSP |it|) (EQ (CAR |it|) 'IN)
                                     (PROGN
                                      (SETQ |ISTMP#1| (CDR |it|))
                                      (AND (CONSP |ISTMP#1|)
                                           (PROGN
                                            (SETQ |index| (CAR |ISTMP#1|))
                                            (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                            (AND (CONSP |ISTMP#2|)
                                                 (EQ (CDR |ISTMP#2|) NIL)
                                                 (PROGN
                                                  (SETQ |s| (CAR |ISTMP#2|))
                                                  #1#))))))
                                (LIST (LIST 'IN |index| (|mkAtree1| |s|))))
                               ((AND (CONSP |it|) (EQ (CAR |it|) 'ON)
                                     (PROGN
                                      (SETQ |ISTMP#1| (CDR |it|))
                                      (AND (CONSP |ISTMP#1|)
                                           (PROGN
                                            (SETQ |index| (CAR |ISTMP#1|))
                                            (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                            (AND (CONSP |ISTMP#2|)
                                                 (EQ (CDR |ISTMP#2|) NIL)
                                                 (PROGN
                                                  (SETQ |s| (CAR |ISTMP#2|))
                                                  #1#))))))
                                (LIST
                                 (LIST 'IN |index|
                                       (|mkAtree1| (LIST '|tails| |s|)))))
                               ((AND (CONSP |it|) (EQ (CAR |it|) 'WHILE)
                                     (PROGN
                                      (SETQ |ISTMP#1| (CDR |it|))
                                      (AND (CONSP |ISTMP#1|)
                                           (EQ (CDR |ISTMP#1|) NIL)
                                           (PROGN
                                            (SETQ |b| (CAR |ISTMP#1|))
                                            #1#))))
                                (LIST (LIST 'WHILE (|mkAtree1| |b|))))
                               ((AND (CONSP |it|) (EQ (CAR |it|) '|\||)
                                     (PROGN
                                      (SETQ |ISTMP#1| (CDR |it|))
                                      (AND (CONSP |ISTMP#1|)
                                           (EQ (CDR |ISTMP#1|) NIL)
                                           (PROGN
                                            (SETQ |pred| (CAR |ISTMP#1|))
                                            #1#))))
                                (LIST (LIST 'SUCHTHAT (|mkAtree1| |pred|))))
                               ((AND (CONSP |it|)
                                     (PROGN (SETQ |op| (CAR |it|)) #1#)
                                     (|member| |op| '(VALUE UNTIL)))
                                NIL)))
                             |bfVar#21|))))
                  (SETQ |bfVar#20| (CDR |bfVar#20|))))
               NIL |itrl| NIL))
      (SETQ |bodyTree| (|mkAtree1| |body|))
      (SETQ |iterList|
              (NCONC |iterList|
                     ((LAMBDA (|bfVar#25| |bfVar#24| |it|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#24|)
                               (PROGN (SETQ |it| (CAR |bfVar#24|)) NIL))
                           (RETURN (NREVERSE |bfVar#25|)))
                          (#1#
                           (SETQ |bfVar#25|
                                   (APPEND
                                    (REVERSE
                                     (COND
                                      ((AND (CONSP |it|) (EQ (CAR |it|) 'STEP))
                                       NIL)
                                      ((AND (CONSP |it|) (EQ (CAR |it|) 'IN))
                                       NIL)
                                      ((AND (CONSP |it|) (EQ (CAR |it|) 'ON))
                                       NIL)
                                      ((AND (CONSP |it|)
                                            (EQ (CAR |it|) 'WHILE))
                                       NIL)
                                      ((AND (CONSP |it|)
                                            (PROGN
                                             (SETQ |op| (CAR |it|))
                                             (SETQ |ISTMP#1| (CDR |it|))
                                             (AND (CONSP |ISTMP#1|)
                                                  (EQ (CDR |ISTMP#1|) NIL)
                                                  (PROGN
                                                   (SETQ |b| (CAR |ISTMP#1|))
                                                   #1#)))
                                            (|member| |op| '(UNTIL)))
                                       (LIST (LIST |op| (|mkAtree1| |b|))))
                                      ((AND (CONSP |it|) (EQ (CAR |it|) '|\||)
                                            (PROGN
                                             (SETQ |ISTMP#1| (CDR |it|))
                                             (AND (CONSP |ISTMP#1|)
                                                  (EQ (CDR |ISTMP#1|) NIL)
                                                  (PROGN
                                                   (SETQ |pred|
                                                           (CAR |ISTMP#1|))
                                                   #1#))))
                                       NIL)
                                      (#1#
                                       (|keyedSystemError| 'S2GE0016
                                        (LIST "transformCollect"
                                              "Unknown type of iterator")))))
                                    |bfVar#25|))))
                         (SETQ |bfVar#24| (CDR |bfVar#24|))))
                      NIL |itrl| NIL)))
      (APPEND |iterList| (CONS |bodyTree| NIL))))))
 
; upCOLLECT t ==
;   -- $compilingLoop variable insures that throw to interp-only mode
;   --   goes to the outermost loop.
;   $compilingLoop => upCOLLECT1 t
;   upCOLLECT0 t
 
(DEFUN |upCOLLECT| (|t|)
  (PROG ()
    (RETURN
     (COND (|$compilingLoop| (|upCOLLECT1| |t|)) ('T (|upCOLLECT0| |t|))))))
 
; upCOLLECT0 t ==
;   -- sets up catch point for interpret-code mode
;   $compilingLoop: local := true
;   ms:=CATCH('loopCompiler,upCOLLECT1 t)
;   ms = 'tryInterpOnly => interpOnlyCOLLECT t
;   ms
 
(DEFUN |upCOLLECT0| (|t|)
  (PROG (|$compilingLoop| |ms|)
    (DECLARE (SPECIAL |$compilingLoop|))
    (RETURN
     (PROGN
      (SETQ |$compilingLoop| T)
      (SETQ |ms| (CATCH '|loopCompiler| (|upCOLLECT1| |t|)))
      (COND ((EQ |ms| '|tryInterpOnly|) (|interpOnlyCOLLECT| |t|))
            ('T |ms|))))))
 
; upCOLLECT1 t ==
;   t isnt [op,:itrl,body] => nil
;   -- upCOLLECT with compiled body
;   if (target := getTarget t) and not getTarget(body) then
;     if target is [agg,S] and agg in '(List Vector Stream InfiniteTuple) then
;       putTarget(body,S)
;   $interpOnly => interpCOLLECT(op,itrl,body)
;   isStreamCollect itrl => collectStream(t,op,itrl,body)
;   upLoopIters itrl
;   ms:= bottomUpCompile body
;   [m]:= ms
;   for itr in itrl repeat
;     itr is ['UNTIL, pred] => bottomUpCompilePredicate(pred,'"until")
;   mode:= ['Tuple,m]
;   evalCOLLECT(op,rest t,mode)
;   putModeSet(op,[mode])
 
(DEFUN |upCOLLECT1| (|t|)
  (PROG (|op| |ISTMP#1| |ISTMP#2| |body| |itrl| |target| |agg| S |ms| |m|
         |pred| |mode|)
    (RETURN
     (COND
      ((NOT
        (AND (CONSP |t|)
             (PROGN
              (SETQ |op| (CAR |t|))
              (SETQ |ISTMP#1| (CDR |t|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN (SETQ |ISTMP#2| (REVERSE |ISTMP#1|)) #1='T)
                   (CONSP |ISTMP#2|)
                   (PROGN
                    (SETQ |body| (CAR |ISTMP#2|))
                    (SETQ |itrl| (CDR |ISTMP#2|))
                    #1#)
                   (PROGN (SETQ |itrl| (NREVERSE |itrl|)) #1#)))))
       NIL)
      (#1#
       (PROGN
        (COND
         ((AND (SETQ |target| (|getTarget| |t|)) (NULL (|getTarget| |body|)))
          (COND
           ((AND (CONSP |target|)
                 (PROGN
                  (SETQ |agg| (CAR |target|))
                  (SETQ |ISTMP#1| (CDR |target|))
                  (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                       (PROGN (SETQ S (CAR |ISTMP#1|)) #1#)))
                 (|member| |agg| '(|List| |Vector| |Stream| |InfiniteTuple|)))
            (|putTarget| |body| S)))))
        (COND (|$interpOnly| (|interpCOLLECT| |op| |itrl| |body|))
              ((|isStreamCollect| |itrl|)
               (|collectStream| |t| |op| |itrl| |body|))
              (#1#
               (PROGN
                (|upLoopIters| |itrl|)
                (SETQ |ms| (|bottomUpCompile| |body|))
                (SETQ |m| (CAR |ms|))
                ((LAMBDA (|bfVar#27| |itr|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#27|)
                          (PROGN (SETQ |itr| (CAR |bfVar#27|)) NIL))
                      (RETURN NIL))
                     (#1#
                      (COND
                       ((AND (CONSP |itr|) (EQ (CAR |itr|) 'UNTIL)
                             (PROGN
                              (SETQ |ISTMP#1| (CDR |itr|))
                              (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                                   (PROGN (SETQ |pred| (CAR |ISTMP#1|)) #1#))))
                        (IDENTITY
                         (|bottomUpCompilePredicate| |pred| "until"))))))
                    (SETQ |bfVar#27| (CDR |bfVar#27|))))
                 |itrl| NIL)
                (SETQ |mode| (LIST '|Tuple| |m|))
                (|evalCOLLECT| |op| (CDR |t|) |mode|)
                (|putModeSet| |op| (LIST |mode|)))))))))))
 
; upLoopIters itrl ==
;   -- type analyze iterator loop iterators
;   for iter in itrl repeat
;     iter is ['WHILE,pred] =>
;       bottomUpCompilePredicate(pred,'"while")
;     iter is ['SUCHTHAT,pred] =>
;       bottomUpCompilePredicate(pred,'"|")
;     iter is ['UNTIL,:.] =>
;       NIL      -- handle after body is analyzed
;     iter is ['IN,index,s] =>
;       upLoopIterIN(iter,index,s)
;     iter is ['STEP,index,lower,step,:upperList] =>
;       upLoopIterSTEP(index,lower,step,upperList)
;       -- following is an optimization
;       typeIsASmallInteger(get(index,'mode,$env)) =>
;         RPLACA(iter,'ISTEP)
;     NIL       -- should have error msg here?
 
(DEFUN |upLoopIters| (|itrl|)
  (PROG (|ISTMP#1| |pred| |index| |ISTMP#2| |s| |lower| |ISTMP#3| |step|
         |upperList|)
    (RETURN
     ((LAMBDA (|bfVar#28| |iter|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#28|) (PROGN (SETQ |iter| (CAR |bfVar#28|)) NIL))
           (RETURN NIL))
          (#1='T
           (COND
            ((AND (CONSP |iter|) (EQ (CAR |iter|) 'WHILE)
                  (PROGN
                   (SETQ |ISTMP#1| (CDR |iter|))
                   (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                        (PROGN (SETQ |pred| (CAR |ISTMP#1|)) #1#))))
             (|bottomUpCompilePredicate| |pred| "while"))
            ((AND (CONSP |iter|) (EQ (CAR |iter|) 'SUCHTHAT)
                  (PROGN
                   (SETQ |ISTMP#1| (CDR |iter|))
                   (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                        (PROGN (SETQ |pred| (CAR |ISTMP#1|)) #1#))))
             (|bottomUpCompilePredicate| |pred| "|"))
            ((AND (CONSP |iter|) (EQ (CAR |iter|) 'UNTIL)) NIL)
            ((AND (CONSP |iter|) (EQ (CAR |iter|) 'IN)
                  (PROGN
                   (SETQ |ISTMP#1| (CDR |iter|))
                   (AND (CONSP |ISTMP#1|)
                        (PROGN
                         (SETQ |index| (CAR |ISTMP#1|))
                         (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                         (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                              (PROGN (SETQ |s| (CAR |ISTMP#2|)) #1#))))))
             (|upLoopIterIN| |iter| |index| |s|))
            ((AND (CONSP |iter|) (EQ (CAR |iter|) 'STEP)
                  (PROGN
                   (SETQ |ISTMP#1| (CDR |iter|))
                   (AND (CONSP |ISTMP#1|)
                        (PROGN
                         (SETQ |index| (CAR |ISTMP#1|))
                         (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                         (AND (CONSP |ISTMP#2|)
                              (PROGN
                               (SETQ |lower| (CAR |ISTMP#2|))
                               (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                               (AND (CONSP |ISTMP#3|)
                                    (PROGN
                                     (SETQ |step| (CAR |ISTMP#3|))
                                     (SETQ |upperList| (CDR |ISTMP#3|))
                                     #1#))))))))
             (PROGN
              (|upLoopIterSTEP| |index| |lower| |step| |upperList|)
              (COND
               ((|typeIsASmallInteger| (|get| |index| '|mode| |$env|))
                (RPLACA |iter| 'ISTEP)))))
            (#1# NIL))))
         (SETQ |bfVar#28| (CDR |bfVar#28|))))
      |itrl| NIL))))
 
; upLoopIterIN(iter,index,s) ==
;   iterMs := bottomUp s
; 
;   null IDENTP index =>  throwKeyedMsg("S2IS0005",[index])
; 
;   if $genValue and first iterMs is ['Union,:.] then
;     v := coerceUnion2Branch getValue s
;     m := objMode v
;     putValue(s,v)
;     putMode(s,m)
;     iterMs := [m]
;     putModeSet(s,iterMs)
; 
;   -- transform segment variable into STEP
;   iterMs is [['Segment,.]] or iterMs is [['UniversalSegment,.]] =>
;     lower := [mkAtreeNode 'lo,s]
;     step := [mkAtreeNode 'incr, s]
;     upperList :=
;       CAAR(iterMs) = 'Segment => [[mkAtreeNode 'hi,s]]
;       NIL
;     upLoopIterSTEP(index,lower,step,upperList)
;     newIter := ['STEP,index,lower,step,:upperList]
;     RPLACA(iter, first newIter)
;     RPLACD(iter, rest newIter)
; 
;   iterMs isnt [['List,ud]] => throwKeyedMsg("S2IS0006",[index])
;   put(index,'mode,ud,$env)
;   mkLocalVar('"the iterator expression",index)
 
(DEFUN |upLoopIterIN| (|iter| |index| |s|)
  (PROG (|iterMs| |ISTMP#1| |v| |m| |ISTMP#2| |lower| |step| |upperList|
         |newIter| |ud|)
    (RETURN
     (PROGN
      (SETQ |iterMs| (|bottomUp| |s|))
      (COND
       ((NULL (IDENTP |index|)) (|throwKeyedMsg| 'S2IS0005 (LIST |index|)))
       (#1='T
        (PROGN
         (COND
          ((AND |$genValue|
                (PROGN
                 (SETQ |ISTMP#1| (CAR |iterMs|))
                 (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|Union|))))
           (SETQ |v| (|coerceUnion2Branch| (|getValue| |s|)))
           (SETQ |m| (|objMode| |v|)) (|putValue| |s| |v|) (|putMode| |s| |m|)
           (SETQ |iterMs| (LIST |m|)) (|putModeSet| |s| |iterMs|)))
         (COND
          ((OR
            (AND (CONSP |iterMs|) (EQ (CDR |iterMs|) NIL)
                 (PROGN
                  (SETQ |ISTMP#1| (CAR |iterMs|))
                  (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|Segment|)
                       (PROGN
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL))))))
            (AND (CONSP |iterMs|) (EQ (CDR |iterMs|) NIL)
                 (PROGN
                  (SETQ |ISTMP#1| (CAR |iterMs|))
                  (AND (CONSP |ISTMP#1|)
                       (EQ (CAR |ISTMP#1|) '|UniversalSegment|)
                       (PROGN
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)))))))
           (PROGN
            (SETQ |lower| (LIST (|mkAtreeNode| '|lo|) |s|))
            (SETQ |step| (LIST (|mkAtreeNode| '|incr|) |s|))
            (SETQ |upperList|
                    (COND
                     ((EQ (CAAR |iterMs|) '|Segment|)
                      (LIST (LIST (|mkAtreeNode| '|hi|) |s|)))
                     (#1# NIL)))
            (|upLoopIterSTEP| |index| |lower| |step| |upperList|)
            (SETQ |newIter|
                    (CONS 'STEP
                          (CONS |index|
                                (CONS |lower| (CONS |step| |upperList|)))))
            (RPLACA |iter| (CAR |newIter|))
            (RPLACD |iter| (CDR |newIter|))))
          ((NOT
            (AND (CONSP |iterMs|) (EQ (CDR |iterMs|) NIL)
                 (PROGN
                  (SETQ |ISTMP#1| (CAR |iterMs|))
                  (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|List|)
                       (PROGN
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                             (PROGN (SETQ |ud| (CAR |ISTMP#2|)) #1#)))))))
           (|throwKeyedMsg| 'S2IS0006 (LIST |index|)))
          (#1#
           (PROGN
            (|put| |index| '|mode| |ud| |$env|)
            (|mkLocalVar| "the iterator expression" |index|)))))))))))
 
; upLoopIterSTEP(index,lower,step,upperList) ==
;   null IDENTP index => throwKeyedMsg("S2IS0005",[index])
;   ltype := IFCAR bottomUpUseSubdomain(lower)
;   not (typeIsASmallInteger(ltype) or isEqualOrSubDomain(ltype,$Integer))=>
;     throwKeyedMsg("S2IS0007",['"lower"])
;   stype := IFCAR bottomUpUseSubdomain(step)
;   not (typeIsASmallInteger(stype) or isEqualOrSubDomain(stype,$Integer))=>
;     throwKeyedMsg("S2IS0008",NIL)
;   types := [ltype]
;   utype := nil
;   for upper in upperList repeat
;     utype := IFCAR bottomUpUseSubdomain(upper)
;     not (typeIsASmallInteger(utype) or isEqualOrSubDomain(utype,$Integer))=>
;       throwKeyedMsg("S2IS0007",['"upper"])
;   if utype then types := [utype, :types]
;   else types := [stype, :types]
;   type := resolveTypeListAny REMDUP types
;   put(index,'mode,type,$env)
;   mkLocalVar('"the iterator expression",index)
 
(DEFUN |upLoopIterSTEP| (|index| |lower| |step| |upperList|)
  (PROG (|ltype| |stype| |types| |utype| |type|)
    (RETURN
     (COND ((NULL (IDENTP |index|)) (|throwKeyedMsg| 'S2IS0005 (LIST |index|)))
           (#1='T
            (PROGN
             (SETQ |ltype| (IFCAR (|bottomUpUseSubdomain| |lower|)))
             (COND
              ((NULL
                (OR (|typeIsASmallInteger| |ltype|)
                    (|isEqualOrSubDomain| |ltype| |$Integer|)))
               (|throwKeyedMsg| 'S2IS0007 (LIST "lower")))
              (#1#
               (PROGN
                (SETQ |stype| (IFCAR (|bottomUpUseSubdomain| |step|)))
                (COND
                 ((NULL
                   (OR (|typeIsASmallInteger| |stype|)
                       (|isEqualOrSubDomain| |stype| |$Integer|)))
                  (|throwKeyedMsg| 'S2IS0008 NIL))
                 (#1#
                  (PROGN
                   (SETQ |types| (LIST |ltype|))
                   (SETQ |utype| NIL)
                   ((LAMBDA (|bfVar#29| |upper|)
                      (LOOP
                       (COND
                        ((OR (ATOM |bfVar#29|)
                             (PROGN (SETQ |upper| (CAR |bfVar#29|)) NIL))
                         (RETURN NIL))
                        (#1#
                         (PROGN
                          (SETQ |utype|
                                  (IFCAR (|bottomUpUseSubdomain| |upper|)))
                          (COND
                           ((NULL
                             (OR (|typeIsASmallInteger| |utype|)
                                 (|isEqualOrSubDomain| |utype| |$Integer|)))
                            (|throwKeyedMsg| 'S2IS0007 (LIST "upper")))))))
                       (SETQ |bfVar#29| (CDR |bfVar#29|))))
                    |upperList| NIL)
                   (COND (|utype| (SETQ |types| (CONS |utype| |types|)))
                         (#1# (SETQ |types| (CONS |stype| |types|))))
                   (SETQ |type| (|resolveTypeListAny| (REMDUP |types|)))
                   (|put| |index| '|mode| |type| |$env|)
                   (|mkLocalVar| "the iterator expression" |index|)))))))))))))
 
; evalCOLLECT(op,[:itrl,body],m) ==
;   iters := [evalLoopIter itr for itr in itrl]
;   bod := getArgValue(body,computedMode body)
;   if bod isnt ['SPADCALL,:.] then bod := ['unwrap, bod]
;   code := timedOptimization asTupleNewCode0 ['COLLECT,:iters,bod]
;   if $genValue then code := wrap timedEVALFUN code
;   putValue(op,objNew(code,m))
 
(DEFUN |evalCOLLECT| (|op| |bfVar#32| |m|)
  (PROG (|LETTMP#1| |body| |itrl| |iters| |bod| |code|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (REVERSE |bfVar#32|))
      (SETQ |body| (CAR |LETTMP#1|))
      (SETQ |itrl| (NREVERSE (CDR |LETTMP#1|)))
      (SETQ |iters|
              ((LAMBDA (|bfVar#31| |bfVar#30| |itr|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#30|)
                        (PROGN (SETQ |itr| (CAR |bfVar#30|)) NIL))
                    (RETURN (NREVERSE |bfVar#31|)))
                   ('T
                    (SETQ |bfVar#31|
                            (CONS (|evalLoopIter| |itr|) |bfVar#31|))))
                  (SETQ |bfVar#30| (CDR |bfVar#30|))))
               NIL |itrl| NIL))
      (SETQ |bod| (|getArgValue| |body| (|computedMode| |body|)))
      (COND
       ((NOT (AND (CONSP |bod|) (EQ (CAR |bod|) 'SPADCALL)))
        (SETQ |bod| (LIST '|unwrap| |bod|))))
      (SETQ |code|
              (|timedOptimization|
               (|asTupleNewCode0|
                (CONS 'COLLECT (APPEND |iters| (CONS |bod| NIL))))))
      (COND (|$genValue| (SETQ |code| (|wrap| (|timedEVALFUN| |code|)))))
      (|putValue| |op| (|objNew| |code| |m|))))))
 
; falseFun(x) == nil
 
(DEFUN |falseFun| (|x|) (PROG () (RETURN NIL)))
 
; evalLoopIter itr ==
;   -- generate code for loop iterator
;   itr is ['STEP,index,lower,step,:upperList] =>
;     ['STEP,getUnname index,getArgValue(lower,$Integer),
;       getArgValue(step,$Integer),
;         :[getArgValue(upper,$Integer) for upper in upperList]]
;   itr is ['ISTEP,index,lower,step,:upperList] =>
;     ['ISTEP,getUnname index,getArgValue(lower,$SmallInteger),
;       getArgValue(step,$SmallInteger),
;         :[getArgValue(upper,$SmallInteger) for upper in upperList]]
;   itr is ['IN,index,s] =>
;     ['IN,getUnname index,getArgValue(s,['List,get(index,'mode,$env)])]
;   (itr is [x,pred]) and (x in '(WHILE UNTIL SUCHTHAT)) =>
;     [x,getArgValue(pred,$Boolean)]
 
(DEFUN |evalLoopIter| (|itr|)
  (PROG (|ISTMP#1| |index| |ISTMP#2| |lower| |ISTMP#3| |step| |upperList| |s|
         |x| |pred|)
    (RETURN
     (COND
      ((AND (CONSP |itr|) (EQ (CAR |itr|) 'STEP)
            (PROGN
             (SETQ |ISTMP#1| (CDR |itr|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |index| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|)
                        (PROGN
                         (SETQ |lower| (CAR |ISTMP#2|))
                         (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                         (AND (CONSP |ISTMP#3|)
                              (PROGN
                               (SETQ |step| (CAR |ISTMP#3|))
                               (SETQ |upperList| (CDR |ISTMP#3|))
                               #1='T))))))))
       (CONS 'STEP
             (CONS (|getUnname| |index|)
                   (CONS (|getArgValue| |lower| |$Integer|)
                         (CONS (|getArgValue| |step| |$Integer|)
                               ((LAMBDA (|bfVar#34| |bfVar#33| |upper|)
                                  (LOOP
                                   (COND
                                    ((OR (ATOM |bfVar#33|)
                                         (PROGN
                                          (SETQ |upper| (CAR |bfVar#33|))
                                          NIL))
                                     (RETURN (NREVERSE |bfVar#34|)))
                                    (#1#
                                     (SETQ |bfVar#34|
                                             (CONS
                                              (|getArgValue| |upper|
                                               |$Integer|)
                                              |bfVar#34|))))
                                   (SETQ |bfVar#33| (CDR |bfVar#33|))))
                                NIL |upperList| NIL))))))
      ((AND (CONSP |itr|) (EQ (CAR |itr|) 'ISTEP)
            (PROGN
             (SETQ |ISTMP#1| (CDR |itr|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |index| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|)
                        (PROGN
                         (SETQ |lower| (CAR |ISTMP#2|))
                         (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                         (AND (CONSP |ISTMP#3|)
                              (PROGN
                               (SETQ |step| (CAR |ISTMP#3|))
                               (SETQ |upperList| (CDR |ISTMP#3|))
                               #1#))))))))
       (CONS 'ISTEP
             (CONS (|getUnname| |index|)
                   (CONS (|getArgValue| |lower| |$SmallInteger|)
                         (CONS (|getArgValue| |step| |$SmallInteger|)
                               ((LAMBDA (|bfVar#36| |bfVar#35| |upper|)
                                  (LOOP
                                   (COND
                                    ((OR (ATOM |bfVar#35|)
                                         (PROGN
                                          (SETQ |upper| (CAR |bfVar#35|))
                                          NIL))
                                     (RETURN (NREVERSE |bfVar#36|)))
                                    (#1#
                                     (SETQ |bfVar#36|
                                             (CONS
                                              (|getArgValue| |upper|
                                               |$SmallInteger|)
                                              |bfVar#36|))))
                                   (SETQ |bfVar#35| (CDR |bfVar#35|))))
                                NIL |upperList| NIL))))))
      ((AND (CONSP |itr|) (EQ (CAR |itr|) 'IN)
            (PROGN
             (SETQ |ISTMP#1| (CDR |itr|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |index| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |s| (CAR |ISTMP#2|)) #1#))))))
       (LIST 'IN (|getUnname| |index|)
             (|getArgValue| |s|
              (LIST '|List| (|get| |index| '|mode| |$env|)))))
      ((AND (CONSP |itr|)
            (PROGN
             (SETQ |x| (CAR |itr|))
             (SETQ |ISTMP#1| (CDR |itr|))
             (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                  (PROGN (SETQ |pred| (CAR |ISTMP#1|)) #1#)))
            (|member| |x| '(WHILE UNTIL SUCHTHAT)))
       (LIST |x| (|getArgValue| |pred| |$Boolean|)))))))
 
; interpCOLLECT(op,itrl,body) ==
;   -- interpret-code mode COLLECT handler
;   $collectTypeList: local := NIL
;   $indexVars: local := NIL
;   $indexTypes: local := NIL
;   emptyAtree op
;   emptyAtree itrl
;   emptyAtree body
;   code := ['COLLECT,:[interpIter itr for itr in itrl],
;     interpCOLLECTbody(body,$indexVars,$indexTypes)]
;   value := timedEVALFUN code
;   t :=
;     null value => '(None)
;     last $collectTypeList
;   rm := ['Tuple,t]
;   value := [objValUnwrap coerceInteractive(objNewWrap(v,m),t)
;     for v in value for m in $collectTypeList]
;   putValue(op,objNewWrap(asTupleNew(#value, value),rm))
;   putModeSet(op,[rm])
 
(DEFUN |interpCOLLECT| (|op| |itrl| |body|)
  (PROG (|$indexTypes| |$indexVars| |$collectTypeList| |rm| |t| |value| |code|)
    (DECLARE (SPECIAL |$indexTypes| |$indexVars| |$collectTypeList|))
    (RETURN
     (PROGN
      (SETQ |$collectTypeList| NIL)
      (SETQ |$indexVars| NIL)
      (SETQ |$indexTypes| NIL)
      (|emptyAtree| |op|)
      (|emptyAtree| |itrl|)
      (|emptyAtree| |body|)
      (SETQ |code|
              (CONS 'COLLECT
                    (APPEND
                     ((LAMBDA (|bfVar#38| |bfVar#37| |itr|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#37|)
                               (PROGN (SETQ |itr| (CAR |bfVar#37|)) NIL))
                           (RETURN (NREVERSE |bfVar#38|)))
                          (#1='T
                           (SETQ |bfVar#38|
                                   (CONS (|interpIter| |itr|) |bfVar#38|))))
                         (SETQ |bfVar#37| (CDR |bfVar#37|))))
                      NIL |itrl| NIL)
                     (CONS
                      (|interpCOLLECTbody| |body| |$indexVars| |$indexTypes|)
                      NIL))))
      (SETQ |value| (|timedEVALFUN| |code|))
      (SETQ |t|
              (COND ((NULL |value|) '(|None|))
                    (#1# (|last| |$collectTypeList|))))
      (SETQ |rm| (LIST '|Tuple| |t|))
      (SETQ |value|
              ((LAMBDA (|bfVar#41| |bfVar#39| |v| |bfVar#40| |m|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#39|)
                        (PROGN (SETQ |v| (CAR |bfVar#39|)) NIL)
                        (ATOM |bfVar#40|)
                        (PROGN (SETQ |m| (CAR |bfVar#40|)) NIL))
                    (RETURN (NREVERSE |bfVar#41|)))
                   (#1#
                    (SETQ |bfVar#41|
                            (CONS
                             (|objValUnwrap|
                              (|coerceInteractive| (|objNewWrap| |v| |m|) |t|))
                             |bfVar#41|))))
                  (SETQ |bfVar#39| (CDR |bfVar#39|))
                  (SETQ |bfVar#40| (CDR |bfVar#40|))))
               NIL |value| NIL |$collectTypeList| NIL))
      (|putValue| |op|
       (|objNewWrap| (|asTupleNew| (LENGTH |value|) |value|) |rm|))
      (|putModeSet| |op| (LIST |rm|))))))
 
; interpIter itr ==
;   -- interpret loop iterator
;   itr is ['STEP,index,lower,step,:upperList] =>
;     $indexVars:= [getUnname index,:$indexVars]
;     [m]:= bottomUp lower
;     $indexTypes:= [m,:$indexTypes]
;     for up in upperList repeat bottomUp up
;     ['STEP,getUnname index,getArgValue(lower,$Integer),
;       getArgValue(step,$Integer),
;         :[getArgValue(upper,$Integer) for upper in upperList]]
;   itr is ['ISTEP,index,lower,step,:upperList] =>
;     $indexVars:= [getUnname index,:$indexVars]
;     [m]:= bottomUp lower
;     $indexTypes:= [m,:$indexTypes]
;     for up in upperList repeat bottomUp up
;     ['ISTEP,getUnname index,getArgValue(lower,$SmallInteger),
;       getArgValue(step,$SmallInteger),
;         :[getArgValue(upper,$SmallInteger) for upper in upperList]]
;   itr is ['IN,index,s] =>
;     $indexVars:=[getUnname index,:$indexVars]
;     [m]:= bottomUp s
;     m isnt ['List,um] => throwKeyedMsg("S2IS0009",[m])
;     $indexTypes:=[um,:$indexTypes]
;     ['IN,getUnname index,getArgValue(s,m)]
;   (itr is [x,pred]) and (x in '(WHILE UNTIL SUCHTHAT)) =>
;     [x,interpLoop(pred,$indexVars,$indexTypes,$Boolean)]
 
(DEFUN |interpIter| (|itr|)
  (PROG (|ISTMP#1| |index| |ISTMP#2| |lower| |ISTMP#3| |step| |upperList|
         |LETTMP#1| |m| |s| |um| |x| |pred|)
    (RETURN
     (COND
      ((AND (CONSP |itr|) (EQ (CAR |itr|) 'STEP)
            (PROGN
             (SETQ |ISTMP#1| (CDR |itr|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |index| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|)
                        (PROGN
                         (SETQ |lower| (CAR |ISTMP#2|))
                         (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                         (AND (CONSP |ISTMP#3|)
                              (PROGN
                               (SETQ |step| (CAR |ISTMP#3|))
                               (SETQ |upperList| (CDR |ISTMP#3|))
                               #1='T))))))))
       (PROGN
        (SETQ |$indexVars| (CONS (|getUnname| |index|) |$indexVars|))
        (SETQ |LETTMP#1| (|bottomUp| |lower|))
        (SETQ |m| (CAR |LETTMP#1|))
        (SETQ |$indexTypes| (CONS |m| |$indexTypes|))
        ((LAMBDA (|bfVar#42| |up|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#42|) (PROGN (SETQ |up| (CAR |bfVar#42|)) NIL))
              (RETURN NIL))
             (#1# (|bottomUp| |up|)))
            (SETQ |bfVar#42| (CDR |bfVar#42|))))
         |upperList| NIL)
        (CONS 'STEP
              (CONS (|getUnname| |index|)
                    (CONS (|getArgValue| |lower| |$Integer|)
                          (CONS (|getArgValue| |step| |$Integer|)
                                ((LAMBDA (|bfVar#44| |bfVar#43| |upper|)
                                   (LOOP
                                    (COND
                                     ((OR (ATOM |bfVar#43|)
                                          (PROGN
                                           (SETQ |upper| (CAR |bfVar#43|))
                                           NIL))
                                      (RETURN (NREVERSE |bfVar#44|)))
                                     (#1#
                                      (SETQ |bfVar#44|
                                              (CONS
                                               (|getArgValue| |upper|
                                                |$Integer|)
                                               |bfVar#44|))))
                                    (SETQ |bfVar#43| (CDR |bfVar#43|))))
                                 NIL |upperList| NIL)))))))
      ((AND (CONSP |itr|) (EQ (CAR |itr|) 'ISTEP)
            (PROGN
             (SETQ |ISTMP#1| (CDR |itr|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |index| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|)
                        (PROGN
                         (SETQ |lower| (CAR |ISTMP#2|))
                         (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                         (AND (CONSP |ISTMP#3|)
                              (PROGN
                               (SETQ |step| (CAR |ISTMP#3|))
                               (SETQ |upperList| (CDR |ISTMP#3|))
                               #1#))))))))
       (PROGN
        (SETQ |$indexVars| (CONS (|getUnname| |index|) |$indexVars|))
        (SETQ |LETTMP#1| (|bottomUp| |lower|))
        (SETQ |m| (CAR |LETTMP#1|))
        (SETQ |$indexTypes| (CONS |m| |$indexTypes|))
        ((LAMBDA (|bfVar#45| |up|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#45|) (PROGN (SETQ |up| (CAR |bfVar#45|)) NIL))
              (RETURN NIL))
             (#1# (|bottomUp| |up|)))
            (SETQ |bfVar#45| (CDR |bfVar#45|))))
         |upperList| NIL)
        (CONS 'ISTEP
              (CONS (|getUnname| |index|)
                    (CONS (|getArgValue| |lower| |$SmallInteger|)
                          (CONS (|getArgValue| |step| |$SmallInteger|)
                                ((LAMBDA (|bfVar#47| |bfVar#46| |upper|)
                                   (LOOP
                                    (COND
                                     ((OR (ATOM |bfVar#46|)
                                          (PROGN
                                           (SETQ |upper| (CAR |bfVar#46|))
                                           NIL))
                                      (RETURN (NREVERSE |bfVar#47|)))
                                     (#1#
                                      (SETQ |bfVar#47|
                                              (CONS
                                               (|getArgValue| |upper|
                                                |$SmallInteger|)
                                               |bfVar#47|))))
                                    (SETQ |bfVar#46| (CDR |bfVar#46|))))
                                 NIL |upperList| NIL)))))))
      ((AND (CONSP |itr|) (EQ (CAR |itr|) 'IN)
            (PROGN
             (SETQ |ISTMP#1| (CDR |itr|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |index| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |s| (CAR |ISTMP#2|)) #1#))))))
       (PROGN
        (SETQ |$indexVars| (CONS (|getUnname| |index|) |$indexVars|))
        (SETQ |LETTMP#1| (|bottomUp| |s|))
        (SETQ |m| (CAR |LETTMP#1|))
        (COND
         ((NOT
           (AND (CONSP |m|) (EQ (CAR |m|) '|List|)
                (PROGN
                 (SETQ |ISTMP#1| (CDR |m|))
                 (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                      (PROGN (SETQ |um| (CAR |ISTMP#1|)) #1#)))))
          (|throwKeyedMsg| 'S2IS0009 (LIST |m|)))
         (#1#
          (PROGN
           (SETQ |$indexTypes| (CONS |um| |$indexTypes|))
           (LIST 'IN (|getUnname| |index|) (|getArgValue| |s| |m|)))))))
      ((AND (CONSP |itr|)
            (PROGN
             (SETQ |x| (CAR |itr|))
             (SETQ |ISTMP#1| (CDR |itr|))
             (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                  (PROGN (SETQ |pred| (CAR |ISTMP#1|)) #1#)))
            (|member| |x| '(WHILE UNTIL SUCHTHAT)))
       (LIST |x|
             (|interpLoop| |pred| |$indexVars| |$indexTypes| |$Boolean|)))))))
 
; interpOnlyCOLLECT t ==
;   -- called when compilation failed in COLLECT body, not in compiling map
;   $genValue: local := true
;   $interpOnly: local := true
;   upCOLLECT t
 
(DEFUN |interpOnlyCOLLECT| (|t|)
  (PROG (|$interpOnly| |$genValue|)
    (DECLARE (SPECIAL |$interpOnly| |$genValue|))
    (RETURN
     (PROGN (SETQ |$genValue| T) (SETQ |$interpOnly| T) (|upCOLLECT| |t|)))))
 
; interpCOLLECTbody(expr,indexList,indexTypes) ==
;   -- generate code for interpret-code collect
;   ['interpCOLLECTbodyIter,MKQ expr,MKQ indexList,['LIST,:indexList],
;     MKQ indexTypes]
 
(DEFUN |interpCOLLECTbody| (|expr| |indexList| |indexTypes|)
  (PROG ()
    (RETURN
     (LIST '|interpCOLLECTbodyIter| (MKQ |expr|) (MKQ |indexList|)
           (CONS 'LIST |indexList|) (MKQ |indexTypes|)))))
 
; interpCOLLECTbodyIter(exp,indexList,indexVals,indexTypes) ==
;   -- execute interpret-code collect body.  keeps list of type of
;   --  elements in list in $collectTypeList.
;   emptyAtree exp
;   for i in indexList for val in indexVals for type in indexTypes repeat
;     put(i,'value,objNewWrap(val,type),$env)
;   [m]:=bottomUp exp
;   $collectTypeList:=
;     null $collectTypeList => [rm:=m]
;     [:$collectTypeList,rm:=resolveTT(m,last $collectTypeList)]
;   null rm => throwKeyedMsg("S2IS0010",NIL)
;   value:=
;     rm ~= m => coerceInteractive(getValue exp,rm)
;     getValue exp
;   objValUnwrap(value)
 
(DEFUN |interpCOLLECTbodyIter| (|exp| |indexList| |indexVals| |indexTypes|)
  (PROG (|LETTMP#1| |m| |rm| |value|)
    (RETURN
     (PROGN
      (|emptyAtree| |exp|)
      ((LAMBDA (|bfVar#48| |i| |bfVar#49| |val| |bfVar#50| |type|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#48|) (PROGN (SETQ |i| (CAR |bfVar#48|)) NIL)
                (ATOM |bfVar#49|) (PROGN (SETQ |val| (CAR |bfVar#49|)) NIL)
                (ATOM |bfVar#50|) (PROGN (SETQ |type| (CAR |bfVar#50|)) NIL))
            (RETURN NIL))
           (#1='T (|put| |i| '|value| (|objNewWrap| |val| |type|) |$env|)))
          (SETQ |bfVar#48| (CDR |bfVar#48|))
          (SETQ |bfVar#49| (CDR |bfVar#49|))
          (SETQ |bfVar#50| (CDR |bfVar#50|))))
       |indexList| NIL |indexVals| NIL |indexTypes| NIL)
      (SETQ |LETTMP#1| (|bottomUp| |exp|))
      (SETQ |m| (CAR |LETTMP#1|))
      (SETQ |$collectTypeList|
              (COND ((NULL |$collectTypeList|) (LIST (SETQ |rm| |m|)))
                    (#1#
                     (APPEND |$collectTypeList|
                             (CONS
                              (SETQ |rm|
                                      (|resolveTT| |m|
                                       (|last| |$collectTypeList|)))
                              NIL)))))
      (COND ((NULL |rm|) (|throwKeyedMsg| 'S2IS0010 NIL))
            (#1#
             (PROGN
              (SETQ |value|
                      (COND
                       ((NOT (EQUAL |rm| |m|))
                        (|coerceInteractive| (|getValue| |exp|) |rm|))
                       (#1# (|getValue| |exp|))))
              (|objValUnwrap| |value|))))))))
 
; isStreamCollect itrl ==
;   -- calls bottomUp on iterators and if any of them are streams
;   -- then whole shebang is a stream
;   isStream := false
;   for itr in itrl until isStream repeat
;     itr is ['IN,.,s] =>
;       iterMs := bottomUp s
;       iterMs is [['Stream,:.]] => isStream := true
;       iterMs is [['InfiniteTuple,:.]] => isStream := true
;       iterMs is [['UniversalSegment,:.]] => isStream := true
;     itr is ['STEP,.,.,.] => isStream := true
;   isStream
 
(DEFUN |isStreamCollect| (|itrl|)
  (PROG (|isStream| |ISTMP#1| |ISTMP#2| |s| |iterMs| |ISTMP#3|)
    (RETURN
     (PROGN
      (SETQ |isStream| NIL)
      ((LAMBDA (|bfVar#51| |itr| |bfVar#52|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#51|) (PROGN (SETQ |itr| (CAR |bfVar#51|)) NIL)
                |bfVar#52|)
            (RETURN NIL))
           (#1='T
            (COND
             ((AND (CONSP |itr|) (EQ (CAR |itr|) 'IN)
                   (PROGN
                    (SETQ |ISTMP#1| (CDR |itr|))
                    (AND (CONSP |ISTMP#1|)
                         (PROGN
                          (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                          (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                               (PROGN (SETQ |s| (CAR |ISTMP#2|)) #1#))))))
              (PROGN
               (SETQ |iterMs| (|bottomUp| |s|))
               (COND
                ((AND (CONSP |iterMs|) (EQ (CDR |iterMs|) NIL)
                      (PROGN
                       (SETQ |ISTMP#1| (CAR |iterMs|))
                       (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|Stream|))))
                 (SETQ |isStream| T))
                ((AND (CONSP |iterMs|) (EQ (CDR |iterMs|) NIL)
                      (PROGN
                       (SETQ |ISTMP#1| (CAR |iterMs|))
                       (AND (CONSP |ISTMP#1|)
                            (EQ (CAR |ISTMP#1|) '|InfiniteTuple|))))
                 (SETQ |isStream| T))
                ((AND (CONSP |iterMs|) (EQ (CDR |iterMs|) NIL)
                      (PROGN
                       (SETQ |ISTMP#1| (CAR |iterMs|))
                       (AND (CONSP |ISTMP#1|)
                            (EQ (CAR |ISTMP#1|) '|UniversalSegment|))))
                 (SETQ |isStream| T)))))
             ((AND (CONSP |itr|) (EQ (CAR |itr|) 'STEP)
                   (PROGN
                    (SETQ |ISTMP#1| (CDR |itr|))
                    (AND (CONSP |ISTMP#1|)
                         (PROGN
                          (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                          (AND (CONSP |ISTMP#2|)
                               (PROGN
                                (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                                (AND (CONSP |ISTMP#3|)
                                     (EQ (CDR |ISTMP#3|) NIL))))))))
              (SETQ |isStream| T)))))
          (SETQ |bfVar#51| (CDR |bfVar#51|))
          (SETQ |bfVar#52| |isStream|)))
       |itrl| NIL NIL)
      |isStream|))))
 
; collectStream(t,op,itrl,body) ==
;   v := CATCH('loopCompiler,collectStream1(t,op,itrl,body))
;   v = 'tryInterpOnly => throwKeyedMsg("S2IS0011",NIL)
;   v
 
(DEFUN |collectStream| (|t| |op| |itrl| |body|)
  (PROG (|v|)
    (RETURN
     (PROGN
      (SETQ |v|
              (CATCH '|loopCompiler|
                (|collectStream1| |t| |op| |itrl| |body|)))
      (COND ((EQ |v| '|tryInterpOnly|) (|throwKeyedMsg| 'S2IS0011 NIL))
            ('T |v|))))))
 
; collectStream1(t,op,itrl,body) ==
;   $indexVars:local := NIL
;   upStreamIters itrl
;   if #$indexVars = 1 then mode:=collectOneStream(t,op,itrl,body)
;   else mode:=collectSeveralStreams(t,op,itrl,body)
;   putModeSet(op,[mode])
 
(DEFUN |collectStream1| (|t| |op| |itrl| |body|)
  (PROG (|$indexVars| |mode|)
    (DECLARE (SPECIAL |$indexVars|))
    (RETURN
     (PROGN
      (SETQ |$indexVars| NIL)
      (|upStreamIters| |itrl|)
      (COND
       ((EQL (LENGTH |$indexVars|) 1)
        (SETQ |mode| (|collectOneStream| |t| |op| |itrl| |body|)))
       ('T (SETQ |mode| (|collectSeveralStreams| |t| |op| |itrl| |body|))))
      (|putModeSet| |op| (LIST |mode|))))))
 
; upStreamIters itrl ==
;   -- type analyze stream collect loop iterators
;   for iter in itrl repeat
;     iter is ['IN,index,s] =>
;       upStreamIterIN(iter,index,s)
;     iter is ['STEP,index,lower,step,:upperList] =>
;       upStreamIterSTEP(index,lower,step,upperList)
 
(DEFUN |upStreamIters| (|itrl|)
  (PROG (|ISTMP#1| |index| |ISTMP#2| |s| |lower| |ISTMP#3| |step| |upperList|)
    (RETURN
     ((LAMBDA (|bfVar#53| |iter|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#53|) (PROGN (SETQ |iter| (CAR |bfVar#53|)) NIL))
           (RETURN NIL))
          (#1='T
           (COND
            ((AND (CONSP |iter|) (EQ (CAR |iter|) 'IN)
                  (PROGN
                   (SETQ |ISTMP#1| (CDR |iter|))
                   (AND (CONSP |ISTMP#1|)
                        (PROGN
                         (SETQ |index| (CAR |ISTMP#1|))
                         (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                         (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                              (PROGN (SETQ |s| (CAR |ISTMP#2|)) #1#))))))
             (|upStreamIterIN| |iter| |index| |s|))
            ((AND (CONSP |iter|) (EQ (CAR |iter|) 'STEP)
                  (PROGN
                   (SETQ |ISTMP#1| (CDR |iter|))
                   (AND (CONSP |ISTMP#1|)
                        (PROGN
                         (SETQ |index| (CAR |ISTMP#1|))
                         (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                         (AND (CONSP |ISTMP#2|)
                              (PROGN
                               (SETQ |lower| (CAR |ISTMP#2|))
                               (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                               (AND (CONSP |ISTMP#3|)
                                    (PROGN
                                     (SETQ |step| (CAR |ISTMP#3|))
                                     (SETQ |upperList| (CDR |ISTMP#3|))
                                     #1#))))))))
             (|upStreamIterSTEP| |index| |lower| |step| |upperList|)))))
         (SETQ |bfVar#53| (CDR |bfVar#53|))))
      |itrl| NIL))))
 
; upStreamIterIN(iter,index,s) ==
;   iterMs := bottomUp s
; 
;   -- transform segment variable into STEP
;   iterMs is [['Segment,.]] or iterMs is [['UniversalSegment,.]] =>
;     lower := [mkAtreeNode 'lo, s]
;     step := [mkAtreeNode 'incr, s]
;     upperList :=
;       CAAR(iterMs) = 'Segment => [[mkAtreeNode 'hi,s]]
;       NIL
;     upStreamIterSTEP(index,lower,step,upperList)
;     newIter := ['STEP,index,lower,step,:upperList]
;     RPLACA(iter, first newIter)
;     RPLACD(iter, rest newIter)
; 
;   (iterMs isnt [['List,ud]]) and (iterMs isnt [['Stream,ud]])
;     and (iterMs isnt [['InfinitTuple, ud]]) =>
;       throwKeyedMsg("S2IS0006",[index])
;   put(index,'mode,ud,$env)
;   mkLocalVar('"the iterator expression",index)
;   s :=
;     iterMs is [['List,ud],:.] =>
;       form:=[mkAtreeNode 'pretend, [mkAtreeNode 'COERCE,s,['Stream,ud]],
;              ['InfiniteTuple, ud]]
;       bottomUp form
;       form
;     s
;   $indexVars:= [[index,:s],:$indexVars]
 
(DEFUN |upStreamIterIN| (|iter| |index| |s|)
  (PROG (|iterMs| |ISTMP#1| |ISTMP#2| |lower| |step| |upperList| |newIter| |ud|
         |form|)
    (RETURN
     (PROGN
      (SETQ |iterMs| (|bottomUp| |s|))
      (COND
       ((OR
         (AND (CONSP |iterMs|) (EQ (CDR |iterMs|) NIL)
              (PROGN
               (SETQ |ISTMP#1| (CAR |iterMs|))
               (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|Segment|)
                    (PROGN
                     (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                     (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL))))))
         (AND (CONSP |iterMs|) (EQ (CDR |iterMs|) NIL)
              (PROGN
               (SETQ |ISTMP#1| (CAR |iterMs|))
               (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|UniversalSegment|)
                    (PROGN
                     (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                     (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)))))))
        (PROGN
         (SETQ |lower| (LIST (|mkAtreeNode| '|lo|) |s|))
         (SETQ |step| (LIST (|mkAtreeNode| '|incr|) |s|))
         (SETQ |upperList|
                 (COND
                  ((EQ (CAAR |iterMs|) '|Segment|)
                   (LIST (LIST (|mkAtreeNode| '|hi|) |s|)))
                  (#1='T NIL)))
         (|upStreamIterSTEP| |index| |lower| |step| |upperList|)
         (SETQ |newIter|
                 (CONS 'STEP
                       (CONS |index|
                             (CONS |lower| (CONS |step| |upperList|)))))
         (RPLACA |iter| (CAR |newIter|))
         (RPLACD |iter| (CDR |newIter|))))
       ((AND
         (NOT
          (AND (CONSP |iterMs|) (EQ (CDR |iterMs|) NIL)
               (PROGN
                (SETQ |ISTMP#1| (CAR |iterMs|))
                (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|List|)
                     (PROGN
                      (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                      (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                           (PROGN (SETQ |ud| (CAR |ISTMP#2|)) #1#)))))))
         (NOT
          (AND (CONSP |iterMs|) (EQ (CDR |iterMs|) NIL)
               (PROGN
                (SETQ |ISTMP#1| (CAR |iterMs|))
                (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|Stream|)
                     (PROGN
                      (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                      (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                           (PROGN (SETQ |ud| (CAR |ISTMP#2|)) #1#)))))))
         (NOT
          (AND (CONSP |iterMs|) (EQ (CDR |iterMs|) NIL)
               (PROGN
                (SETQ |ISTMP#1| (CAR |iterMs|))
                (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|InfinitTuple|)
                     (PROGN
                      (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                      (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                           (PROGN (SETQ |ud| (CAR |ISTMP#2|)) #1#))))))))
        (|throwKeyedMsg| 'S2IS0006 (LIST |index|)))
       (#1#
        (PROGN
         (|put| |index| '|mode| |ud| |$env|)
         (|mkLocalVar| "the iterator expression" |index|)
         (SETQ |s|
                 (COND
                  ((AND (CONSP |iterMs|)
                        (PROGN
                         (SETQ |ISTMP#1| (CAR |iterMs|))
                         (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|List|)
                              (PROGN
                               (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                               (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                    (PROGN
                                     (SETQ |ud| (CAR |ISTMP#2|))
                                     #1#))))))
                   (PROGN
                    (SETQ |form|
                            (LIST (|mkAtreeNode| '|pretend|)
                                  (LIST (|mkAtreeNode| 'COERCE) |s|
                                        (LIST '|Stream| |ud|))
                                  (LIST '|InfiniteTuple| |ud|)))
                    (|bottomUp| |form|)
                    |form|))
                  (#1# |s|)))
         (SETQ |$indexVars| (CONS (CONS |index| |s|) |$indexVars|)))))))))
 
; upStreamIterSTEP(index,lower,step,upperList) ==
;   null isEqualOrSubDomain(ltype := IFCAR bottomUpUseSubdomain(lower),
;     $Integer) => throwKeyedMsg("S2IS0007",['"lower"])
;   null isEqualOrSubDomain(stype := IFCAR bottomUpUseSubdomain(step),
;     $Integer) => throwKeyedMsg("S2IS0008",NIL)
;   for upper in upperList repeat
;     null isEqualOrSubDomain(IFCAR bottomUpUseSubdomain(upper),
;       $Integer) => throwKeyedMsg("S2IS0007",['"upper"])
; 
;   put(index,'mode,type := resolveTT(ltype,stype),$env)
;   null type => throwKeyedMsg("S2IS0010", nil)
;   mkLocalVar('"the iterator expression",index)
; 
;   s :=
;     null upperList =>
;       -- create the function that does the appropriate incrementing
;       genFun := 'stream
;       form := [mkAtreeNode genFun,
;         [[mkAtreeNode 'Dollar, ['IncrementingMaps,type],
;           mkAtreeNode 'incrementBy],step],lower]
;       bottomUp form
;       form
;     form := [mkAtreeNode 'SEGMENT,lower,first upperList]
;     putTarget(form,['Segment,type])
;     form := [mkAtreeNode 'construct,form]
;     putTarget(form,['List,['Segment,type]])
;     form := [mkAtreeNode 'expand,form]
;     putTarget(form,'(List (Integer)))
;     form:=[mkAtreeNode 'pretend, [mkAtreeNode 'COERCE,form,['Stream,$Integer]],
;            ['InfiniteTuple, $Integer]]
;     bottomUp form
;     form
;   $indexVars:= [[index,:s],:$indexVars]
 
(DEFUN |upStreamIterSTEP| (|index| |lower| |step| |upperList|)
  (PROG (|ltype| |stype| |type| |genFun| |form| |s|)
    (RETURN
     (COND
      ((NULL
        (|isEqualOrSubDomain|
         (SETQ |ltype| (IFCAR (|bottomUpUseSubdomain| |lower|))) |$Integer|))
       (|throwKeyedMsg| 'S2IS0007 (LIST "lower")))
      ((NULL
        (|isEqualOrSubDomain|
         (SETQ |stype| (IFCAR (|bottomUpUseSubdomain| |step|))) |$Integer|))
       (|throwKeyedMsg| 'S2IS0008 NIL))
      (#1='T
       (PROGN
        ((LAMBDA (|bfVar#54| |upper|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#54|)
                  (PROGN (SETQ |upper| (CAR |bfVar#54|)) NIL))
              (RETURN NIL))
             (#1#
              (COND
               ((NULL
                 (|isEqualOrSubDomain| (IFCAR (|bottomUpUseSubdomain| |upper|))
                  |$Integer|))
                (IDENTITY (|throwKeyedMsg| 'S2IS0007 (LIST "upper")))))))
            (SETQ |bfVar#54| (CDR |bfVar#54|))))
         |upperList| NIL)
        (|put| |index| '|mode| (SETQ |type| (|resolveTT| |ltype| |stype|))
         |$env|)
        (COND ((NULL |type|) (|throwKeyedMsg| 'S2IS0010 NIL))
              (#1#
               (PROGN
                (|mkLocalVar| "the iterator expression" |index|)
                (SETQ |s|
                        (COND
                         ((NULL |upperList|)
                          (PROGN
                           (SETQ |genFun| '|stream|)
                           (SETQ |form|
                                   (LIST (|mkAtreeNode| |genFun|)
                                         (LIST
                                          (LIST (|mkAtreeNode| '|Dollar|)
                                                (LIST '|IncrementingMaps|
                                                      |type|)
                                                (|mkAtreeNode| '|incrementBy|))
                                          |step|)
                                         |lower|))
                           (|bottomUp| |form|)
                           |form|))
                         (#1#
                          (PROGN
                           (SETQ |form|
                                   (LIST (|mkAtreeNode| 'SEGMENT) |lower|
                                         (CAR |upperList|)))
                           (|putTarget| |form| (LIST '|Segment| |type|))
                           (SETQ |form|
                                   (LIST (|mkAtreeNode| '|construct|) |form|))
                           (|putTarget| |form|
                            (LIST '|List| (LIST '|Segment| |type|)))
                           (SETQ |form|
                                   (LIST (|mkAtreeNode| '|expand|) |form|))
                           (|putTarget| |form| '(|List| (|Integer|)))
                           (SETQ |form|
                                   (LIST (|mkAtreeNode| '|pretend|)
                                         (LIST (|mkAtreeNode| 'COERCE) |form|
                                               (LIST '|Stream| |$Integer|))
                                         (LIST '|InfiniteTuple| |$Integer|)))
                           (|bottomUp| |form|)
                           |form|))))
                (SETQ |$indexVars|
                        (CONS (CONS |index| |s|) |$indexVars|)))))))))))
 
; collectOneStream(t,op,itrl,body) ==
;   -- build stream collect for case of iterating over a single stream
;   --  In this case we don't need to build records
;   form := mkAndApplyPredicates itrl
;   bodyVec := mkIterFun(first $indexVars, body, $localVars)
;   form := [mkAtreeNode 'map,bodyVec,form]
;   bottomUp form
;   val := getValue form
;   m := objMode val
;   m isnt ['Stream, ud] and m isnt ['InfiniteTuple, ud] =>
;     systemError '"Not a Stream"
;   newVal := objNew(objVal val, ['InfiniteTuple, ud])
;   putValue(op,newVal)
;   objMode newVal
 
(DEFUN |collectOneStream| (|t| |op| |itrl| |body|)
  (PROG (|form| |bodyVec| |val| |m| |ISTMP#1| |ud| |newVal|)
    (RETURN
     (PROGN
      (SETQ |form| (|mkAndApplyPredicates| |itrl|))
      (SETQ |bodyVec| (|mkIterFun| (CAR |$indexVars|) |body| |$localVars|))
      (SETQ |form| (LIST (|mkAtreeNode| '|map|) |bodyVec| |form|))
      (|bottomUp| |form|)
      (SETQ |val| (|getValue| |form|))
      (SETQ |m| (|objMode| |val|))
      (COND
       ((AND
         (NOT
          (AND (CONSP |m|) (EQ (CAR |m|) '|Stream|)
               (PROGN
                (SETQ |ISTMP#1| (CDR |m|))
                (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                     (PROGN (SETQ |ud| (CAR |ISTMP#1|)) #1='T)))))
         (NOT
          (AND (CONSP |m|) (EQ (CAR |m|) '|InfiniteTuple|)
               (PROGN
                (SETQ |ISTMP#1| (CDR |m|))
                (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                     (PROGN (SETQ |ud| (CAR |ISTMP#1|)) #1#))))))
        (|systemError| "Not a Stream"))
       (#1#
        (PROGN
         (SETQ |newVal|
                 (|objNew| (|objVal| |val|) (LIST '|InfiniteTuple| |ud|)))
         (|putValue| |op| |newVal|)
         (|objMode| |newVal|))))))))
 
; mkAndApplyPredicates itrl ==
;   -- for one index variable case for now.  may generalize later
;   [indSet] := $indexVars
;   [.,:s] := indSet
;   for iter in itrl repeat
;     iter is ['WHILE,pred] =>
;       fun := 'filterWhile
;       predVec := mkIterFun(indSet,pred,$localVars)
;       s := [mkAtreeNode fun,predVec,s]
;     iter is ['UNTIL,pred] =>
;       fun := 'filterUntil
;       predVec := mkIterFun(indSet,pred,$localVars)
;       s := [mkAtreeNode fun,predVec,s]
;     iter is ['SUCHTHAT,pred] =>
;       fun := 'select
;       putTarget(pred,$Boolean)
;       predVec := mkIterFun(indSet,pred,$localVars)
;       s := [mkAtreeNode fun,predVec,s]
;   s
 
(DEFUN |mkAndApplyPredicates| (|itrl|)
  (PROG (|indSet| |s| |ISTMP#1| |pred| |fun| |predVec|)
    (RETURN
     (PROGN
      (SETQ |indSet| (CAR |$indexVars|))
      (SETQ |s| (CDR |indSet|))
      ((LAMBDA (|bfVar#55| |iter|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#55|) (PROGN (SETQ |iter| (CAR |bfVar#55|)) NIL))
            (RETURN NIL))
           (#1='T
            (COND
             ((AND (CONSP |iter|) (EQ (CAR |iter|) 'WHILE)
                   (PROGN
                    (SETQ |ISTMP#1| (CDR |iter|))
                    (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                         (PROGN (SETQ |pred| (CAR |ISTMP#1|)) #1#))))
              (PROGN
               (SETQ |fun| '|filterWhile|)
               (SETQ |predVec| (|mkIterFun| |indSet| |pred| |$localVars|))
               (SETQ |s| (LIST (|mkAtreeNode| |fun|) |predVec| |s|))))
             ((AND (CONSP |iter|) (EQ (CAR |iter|) 'UNTIL)
                   (PROGN
                    (SETQ |ISTMP#1| (CDR |iter|))
                    (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                         (PROGN (SETQ |pred| (CAR |ISTMP#1|)) #1#))))
              (PROGN
               (SETQ |fun| '|filterUntil|)
               (SETQ |predVec| (|mkIterFun| |indSet| |pred| |$localVars|))
               (SETQ |s| (LIST (|mkAtreeNode| |fun|) |predVec| |s|))))
             ((AND (CONSP |iter|) (EQ (CAR |iter|) 'SUCHTHAT)
                   (PROGN
                    (SETQ |ISTMP#1| (CDR |iter|))
                    (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                         (PROGN (SETQ |pred| (CAR |ISTMP#1|)) #1#))))
              (PROGN
               (SETQ |fun| '|select|)
               (|putTarget| |pred| |$Boolean|)
               (SETQ |predVec| (|mkIterFun| |indSet| |pred| |$localVars|))
               (SETQ |s| (LIST (|mkAtreeNode| |fun|) |predVec| |s|)))))))
          (SETQ |bfVar#55| (CDR |bfVar#55|))))
       |itrl| NIL)
      |s|))))
 
; mkIterFun([index,:s],funBody,$localVars) ==
;   -- transform funBody into a lambda with index as the parameter
;   mode := objMode getValue s
;   mode isnt ['Stream, indMode] and mode isnt ['InfiniteTuple, indMode] =>
;     keyedSystemError('"S2GE0016", '("mkIterFun" "bad stream index type"))
;   put(index,'mode,indMode,$env)
;   mkLocalVar($mapName,index)
;   [m]:=bottomUpCompile funBody
;   mapMode := ['Mapping,m,indMode]
;   $freeVariables := []
;   $boundVariables := [index]
;   -- CCL does not support upwards funargs, so we check for any free variables
;   -- and pass them into the lambda as part of envArg.
;   body := checkForFreeVariables(getValue funBody,$localVars)
;   val:=['function,['LAMBDA,[index,'envArg],objVal body]]
;   vec := mkAtreeNode GENSYM()
;   putValue(vec,objNew(['CONS,val,["VECTOR",:reverse $freeVariables]],mapMode))
;   vec
 
(DEFUN |mkIterFun| (|bfVar#56| |funBody| |$localVars|)
  (DECLARE (SPECIAL |$localVars|))
  (PROG (|index| |s| |mode| |ISTMP#1| |indMode| |LETTMP#1| |m| |mapMode| |body|
         |val| |vec|)
    (RETURN
     (PROGN
      (SETQ |index| (CAR |bfVar#56|))
      (SETQ |s| (CDR |bfVar#56|))
      (SETQ |mode| (|objMode| (|getValue| |s|)))
      (COND
       ((AND
         (NOT
          (AND (CONSP |mode|) (EQ (CAR |mode|) '|Stream|)
               (PROGN
                (SETQ |ISTMP#1| (CDR |mode|))
                (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                     (PROGN (SETQ |indMode| (CAR |ISTMP#1|)) #1='T)))))
         (NOT
          (AND (CONSP |mode|) (EQ (CAR |mode|) '|InfiniteTuple|)
               (PROGN
                (SETQ |ISTMP#1| (CDR |mode|))
                (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                     (PROGN (SETQ |indMode| (CAR |ISTMP#1|)) #1#))))))
        (|keyedSystemError| "S2GE0016" '("mkIterFun" "bad stream index type")))
       (#1#
        (PROGN
         (|put| |index| '|mode| |indMode| |$env|)
         (|mkLocalVar| |$mapName| |index|)
         (SETQ |LETTMP#1| (|bottomUpCompile| |funBody|))
         (SETQ |m| (CAR |LETTMP#1|))
         (SETQ |mapMode| (LIST '|Mapping| |m| |indMode|))
         (SETQ |$freeVariables| NIL)
         (SETQ |$boundVariables| (LIST |index|))
         (SETQ |body|
                 (|checkForFreeVariables| (|getValue| |funBody|) |$localVars|))
         (SETQ |val|
                 (LIST '|function|
                       (LIST 'LAMBDA (LIST |index| '|envArg|)
                             (|objVal| |body|))))
         (SETQ |vec| (|mkAtreeNode| (GENSYM)))
         (|putValue| |vec|
          (|objNew|
           (LIST 'CONS |val| (CONS 'VECTOR (REVERSE |$freeVariables|)))
           |mapMode|))
         |vec|)))))))
 
; checkIterationForFreeVariables(op, itl, locals) ==
;     boundVars := getIteratorIds itl
;     $boundVariables := APPEND(boundVars, $boundVariables)
;     r := [op, :[checkForFreeVariables(a, locals) for a in itl]]
;     for var in boundVars repeat
;         $boundVariables := delete(var, $boundVariables)
;     r
 
(DEFUN |checkIterationForFreeVariables| (|op| |itl| |locals|)
  (PROG (|boundVars| |r|)
    (RETURN
     (PROGN
      (SETQ |boundVars| (|getIteratorIds| |itl|))
      (SETQ |$boundVariables| (APPEND |boundVars| |$boundVariables|))
      (SETQ |r|
              (CONS |op|
                    ((LAMBDA (|bfVar#58| |bfVar#57| |a|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#57|)
                              (PROGN (SETQ |a| (CAR |bfVar#57|)) NIL))
                          (RETURN (NREVERSE |bfVar#58|)))
                         (#1='T
                          (SETQ |bfVar#58|
                                  (CONS (|checkForFreeVariables| |a| |locals|)
                                        |bfVar#58|))))
                        (SETQ |bfVar#57| (CDR |bfVar#57|))))
                     NIL |itl| NIL)))
      ((LAMBDA (|bfVar#59| |var|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#59|) (PROGN (SETQ |var| (CAR |bfVar#59|)) NIL))
            (RETURN NIL))
           (#1# (SETQ |$boundVariables| (|delete| |var| |$boundVariables|))))
          (SETQ |bfVar#59| (CDR |bfVar#59|))))
       |boundVars| NIL)
      |r|))))
 
; checkForFreeVariables(v,locals) ==
;   -- v is the body of a lambda expression.  The list $boundVariables is all the
;   -- bound variables, the parameter locals contains local variables which might
;   -- be free, or the token ALL, which means that any parameter is a candidate
;   -- to be free.
;   NULL v => v
;   SYMBOLP v =>
;     v="$$$" => v -- Placeholder for mini-vector
;     MEMQ(v,$boundVariables) => v
;     p := POSITION(v,$freeVariables) =>
;       ["ELT","envArg",positionInVec(p,#($freeVariables))]
;     (locals = "ALL") or MEMQ(v,locals) =>
;       $freeVariables := [v,:$freeVariables]
;       ["ELT","envArg",positionInVec(0,#($freeVariables))]
;     v
;   LISTP v =>
;     rest(LASTTAIL v) => -- Must be a better way to check for a genuine list?
;       v
;     [op,:args] := v
;     LISTP op =>
;       -- Might have a mode at the front of a list, or be calling a function
;       -- which returns a function.
;       [checkForFreeVariables(op,locals),:[checkForFreeVariables(a,locals) for a in args]]
;     op = "LETT" => -- Expands to a SETQ.
;       ["SETF",:[checkForFreeVariables(a,locals) for a in args]]
;     op = "COLLECT" => -- Introduces a new bound variable?
;         checkIterationForFreeVariables(op, args, locals)
;     op = "REPEAT" => -- Introduces a new bound variable?
;         checkIterationForFreeVariables(op, args, locals)
;     op = "LET" =>
;       args is [var,form,name] =>
;         -- This is some bizarre LET, not what one would expect in Common Lisp!
;         -- Treat var as a free variable, since it may be bound out of scope
;         -- if we are in a lambda within another lambda.
;         newvar :=
;           p := POSITION(var,$freeVariables) =>
;             ["ELT","envArg",positionInVec(p,#($freeVariables))]
;           $freeVariables := [var,:$freeVariables]
;           ["ELT","envArg",positionInVec(0,#($freeVariables))]
;         ["SETF",newvar,checkForFreeVariables(form,locals)]
;       error "Non-simple variable bindings are not currently supported"
;     op = "PROG" =>
;       error "Non-simple variable bindings are not currently supported"
;     op = "LAMBDA" => v
;     op = "QUOTE" => v
;     op = "getValueFromEnvironment" => v
;     [op,:[checkForFreeVariables(a,locals) for a in args]]
;   v
 
(DEFUN |checkForFreeVariables| (|v| |locals|)
  (PROG (|p| |op| |args| |var| |ISTMP#1| |form| |ISTMP#2| |name| |newvar|)
    (RETURN
     (COND ((NULL |v|) |v|)
           ((SYMBOLP |v|)
            (COND ((EQ |v| '$$$) |v|) ((MEMQ |v| |$boundVariables|) |v|)
                  ((SETQ |p| (POSITION |v| |$freeVariables|))
                   (LIST 'ELT '|envArg|
                         (|positionInVec| |p| (LENGTH |$freeVariables|))))
                  ((OR (EQ |locals| 'ALL) (MEMQ |v| |locals|))
                   (PROGN
                    (SETQ |$freeVariables| (CONS |v| |$freeVariables|))
                    (LIST 'ELT '|envArg|
                          (|positionInVec| 0 (LENGTH |$freeVariables|)))))
                  (#1='T |v|)))
           ((LISTP |v|)
            (COND ((CDR (LASTTAIL |v|)) |v|)
                  (#1#
                   (PROGN
                    (SETQ |op| (CAR |v|))
                    (SETQ |args| (CDR |v|))
                    (COND
                     ((LISTP |op|)
                      (CONS (|checkForFreeVariables| |op| |locals|)
                            ((LAMBDA (|bfVar#61| |bfVar#60| |a|)
                               (LOOP
                                (COND
                                 ((OR (ATOM |bfVar#60|)
                                      (PROGN (SETQ |a| (CAR |bfVar#60|)) NIL))
                                  (RETURN (NREVERSE |bfVar#61|)))
                                 (#1#
                                  (SETQ |bfVar#61|
                                          (CONS
                                           (|checkForFreeVariables| |a|
                                            |locals|)
                                           |bfVar#61|))))
                                (SETQ |bfVar#60| (CDR |bfVar#60|))))
                             NIL |args| NIL)))
                     ((EQ |op| 'LETT)
                      (CONS 'SETF
                            ((LAMBDA (|bfVar#63| |bfVar#62| |a|)
                               (LOOP
                                (COND
                                 ((OR (ATOM |bfVar#62|)
                                      (PROGN (SETQ |a| (CAR |bfVar#62|)) NIL))
                                  (RETURN (NREVERSE |bfVar#63|)))
                                 (#1#
                                  (SETQ |bfVar#63|
                                          (CONS
                                           (|checkForFreeVariables| |a|
                                            |locals|)
                                           |bfVar#63|))))
                                (SETQ |bfVar#62| (CDR |bfVar#62|))))
                             NIL |args| NIL)))
                     ((EQ |op| 'COLLECT)
                      (|checkIterationForFreeVariables| |op| |args| |locals|))
                     ((EQ |op| 'REPEAT)
                      (|checkIterationForFreeVariables| |op| |args| |locals|))
                     ((EQ |op| 'LET)
                      (COND
                       ((AND (CONSP |args|)
                             (PROGN
                              (SETQ |var| (CAR |args|))
                              (SETQ |ISTMP#1| (CDR |args|))
                              (AND (CONSP |ISTMP#1|)
                                   (PROGN
                                    (SETQ |form| (CAR |ISTMP#1|))
                                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                    (AND (CONSP |ISTMP#2|)
                                         (EQ (CDR |ISTMP#2|) NIL)
                                         (PROGN
                                          (SETQ |name| (CAR |ISTMP#2|))
                                          #1#))))))
                        (PROGN
                         (SETQ |newvar|
                                 (COND
                                  ((SETQ |p| (POSITION |var| |$freeVariables|))
                                   (LIST 'ELT '|envArg|
                                         (|positionInVec| |p|
                                          (LENGTH |$freeVariables|))))
                                  (#1#
                                   (PROGN
                                    (SETQ |$freeVariables|
                                            (CONS |var| |$freeVariables|))
                                    (LIST 'ELT '|envArg|
                                          (|positionInVec| 0
                                           (LENGTH |$freeVariables|)))))))
                         (LIST 'SETF |newvar|
                               (|checkForFreeVariables| |form| |locals|))))
                       (#1#
                        (|error|
                         '|Non-simple variable bindings are not currently supported|))))
                     ((EQ |op| 'PROG)
                      (|error|
                       '|Non-simple variable bindings are not currently supported|))
                     ((EQ |op| 'LAMBDA) |v|) ((EQ |op| 'QUOTE) |v|)
                     ((EQ |op| '|getValueFromEnvironment|) |v|)
                     (#1#
                      (CONS |op|
                            ((LAMBDA (|bfVar#65| |bfVar#64| |a|)
                               (LOOP
                                (COND
                                 ((OR (ATOM |bfVar#64|)
                                      (PROGN (SETQ |a| (CAR |bfVar#64|)) NIL))
                                  (RETURN (NREVERSE |bfVar#65|)))
                                 (#1#
                                  (SETQ |bfVar#65|
                                          (CONS
                                           (|checkForFreeVariables| |a|
                                            |locals|)
                                           |bfVar#65|))))
                                (SETQ |bfVar#64| (CDR |bfVar#64|))))
                             NIL |args| NIL))))))))
           (#1# |v|)))))
 
; positionInVec(p,l) ==
;   -- We cons up the free list, but need to keep positions consistent so
;   -- count from the end of the list.
;   l-p-1
 
(DEFUN |positionInVec| (|p| |l|) (PROG () (RETURN (- (- |l| |p|) 1))))
 
; collectSeveralStreams(t,op,itrl,body) ==
;   -- performs collects over several streams in parallel
;   $index: local := nil
;   [form,:zipType] := mkZipCode $indexVars
;   form := mkAndApplyZippedPredicates($indexVars, form,zipType,itrl)
;   vec := mkIterZippedFun($indexVars,body,zipType,$localVars)
;   form := [mkAtreeNode 'map, vec, form]
;   bottomUp form
;   val := getValue form
;   m := objMode val
;   m isnt ['Stream, ud] and m isnt ['InfiniteTuple, ud] =>
;     systemError '"Not a Stream"
;   newVal := objNew(objVal val, ['InfiniteTuple, ud])
;   putValue(op,newVal)
;   objMode newVal
 
(DEFUN |collectSeveralStreams| (|t| |op| |itrl| |body|)
  (PROG (|$index| |newVal| |ud| |ISTMP#1| |m| |val| |vec| |zipType| |form|
         |LETTMP#1|)
    (DECLARE (SPECIAL |$index|))
    (RETURN
     (PROGN
      (SETQ |$index| NIL)
      (SETQ |LETTMP#1| (|mkZipCode| |$indexVars|))
      (SETQ |form| (CAR |LETTMP#1|))
      (SETQ |zipType| (CDR |LETTMP#1|))
      (SETQ |form|
              (|mkAndApplyZippedPredicates| |$indexVars| |form| |zipType|
               |itrl|))
      (SETQ |vec|
              (|mkIterZippedFun| |$indexVars| |body| |zipType| |$localVars|))
      (SETQ |form| (LIST (|mkAtreeNode| '|map|) |vec| |form|))
      (|bottomUp| |form|)
      (SETQ |val| (|getValue| |form|))
      (SETQ |m| (|objMode| |val|))
      (COND
       ((AND
         (NOT
          (AND (CONSP |m|) (EQ (CAR |m|) '|Stream|)
               (PROGN
                (SETQ |ISTMP#1| (CDR |m|))
                (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                     (PROGN (SETQ |ud| (CAR |ISTMP#1|)) #1='T)))))
         (NOT
          (AND (CONSP |m|) (EQ (CAR |m|) '|InfiniteTuple|)
               (PROGN
                (SETQ |ISTMP#1| (CDR |m|))
                (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                     (PROGN (SETQ |ud| (CAR |ISTMP#1|)) #1#))))))
        (|systemError| "Not a Stream"))
       (#1#
        (PROGN
         (SETQ |newVal|
                 (|objNew| (|objVal| |val|) (LIST '|InfiniteTuple| |ud|)))
         (|putValue| |op| |newVal|)
         (|objMode| |newVal|))))))))
 
; mkZipCode indexList ==
;   -- create interpreter form for turning a list of parallel streams
;   -- into a stream of nested record types.  returns [form,:recordType]
;   #indexList = 2 =>
;     [[.,:s2],[.,:s1]] := indexList
;     t1 := CADR objMode getValue s1
;     t2 := CADR objMode getValue s2
;     zipType := ['Record,['_:,'part1,t1], ['_:,'part2,t2] ]
;     zipFun := [mkAtreeNode 'Dollar, ['MakeRecord,mkEvalable t1,
;                                      mkEvalable t2],
;                mkAtreeNode 'makeRecord]
;     form := [mkAtreeNode 'map,zipFun,s1,s2]
;     [form,:zipType]
;   [form, :zipType] := mkZipCode rest indexList
;   [[.,:s],:.] := indexList
;   t := CADR objMode getValue s
;   zipFun := [mkAtreeNode 'Dollar, ['MakeRecord,mkEvalable t,
;                                    mkEvalable zipType],
;              mkAtreeNode 'makeRecord]
;   form := [mkAtreeNode 'map,zipFun,s,form]
;   zipType := ['Record,['_:,'part1,t],['_:,'part2,zipType]]
;   [form,:zipType]
 
(DEFUN |mkZipCode| (|indexList|)
  (PROG (|s2| |s1| |t1| |t2| |zipType| |zipFun| |form| |LETTMP#1| |s| |t|)
    (RETURN
     (COND
      ((EQL (LENGTH |indexList|) 2)
       (PROGN
        (SETQ |s2| (CDAR |indexList|))
        (SETQ |s1| (CDADR |indexList|))
        (SETQ |t1| (CADR (|objMode| (|getValue| |s1|))))
        (SETQ |t2| (CADR (|objMode| (|getValue| |s2|))))
        (SETQ |zipType|
                (LIST '|Record| (LIST '|:| '|part1| |t1|)
                      (LIST '|:| '|part2| |t2|)))
        (SETQ |zipFun|
                (LIST (|mkAtreeNode| '|Dollar|)
                      (LIST '|MakeRecord| (|mkEvalable| |t1|)
                            (|mkEvalable| |t2|))
                      (|mkAtreeNode| '|makeRecord|)))
        (SETQ |form| (LIST (|mkAtreeNode| '|map|) |zipFun| |s1| |s2|))
        (CONS |form| |zipType|)))
      ('T
       (PROGN
        (SETQ |LETTMP#1| (|mkZipCode| (CDR |indexList|)))
        (SETQ |form| (CAR |LETTMP#1|))
        (SETQ |zipType| (CDR |LETTMP#1|))
        (SETQ |s| (CDAR |indexList|))
        (SETQ |t| (CADR (|objMode| (|getValue| |s|))))
        (SETQ |zipFun|
                (LIST (|mkAtreeNode| '|Dollar|)
                      (LIST '|MakeRecord| (|mkEvalable| |t|)
                            (|mkEvalable| |zipType|))
                      (|mkAtreeNode| '|makeRecord|)))
        (SETQ |form| (LIST (|mkAtreeNode| '|map|) |zipFun| |s| |form|))
        (SETQ |zipType|
                (LIST '|Record| (LIST '|:| '|part1| |t|)
                      (LIST '|:| '|part2| |zipType|)))
        (CONS |form| |zipType|)))))))
 
; mkAndApplyZippedPredicates (indexList, s,zipType,itrl) ==
;   -- for one index variable case for now.  may generalize later
;   for iter in itrl repeat
;     iter is ['WHILE,pred] =>
;       predVec := mkIterZippedFun(indexList,pred,zipType,$localVars)
;       s := [mkAtreeNode 'swhile,predVec,s]
;     iter is ['UNTIL,pred] =>
;       predVec := mkIterZippedFun(indexList,pred,zipType,$localVars)
;       s := [mkAtreeNode 'suntil,predVec,s]
;     iter is ['SUCHTHAT,pred] =>
;       putTarget(pred,$Boolean)
;       predVec := mkIterZippedFun(indexList,pred,zipType,$localVars)
;       s := [mkAtreeNode 'select,predVec,s]
;   s
 
(DEFUN |mkAndApplyZippedPredicates| (|indexList| |s| |zipType| |itrl|)
  (PROG (|ISTMP#1| |pred| |predVec|)
    (RETURN
     (PROGN
      ((LAMBDA (|bfVar#66| |iter|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#66|) (PROGN (SETQ |iter| (CAR |bfVar#66|)) NIL))
            (RETURN NIL))
           (#1='T
            (COND
             ((AND (CONSP |iter|) (EQ (CAR |iter|) 'WHILE)
                   (PROGN
                    (SETQ |ISTMP#1| (CDR |iter|))
                    (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                         (PROGN (SETQ |pred| (CAR |ISTMP#1|)) #1#))))
              (PROGN
               (SETQ |predVec|
                       (|mkIterZippedFun| |indexList| |pred| |zipType|
                        |$localVars|))
               (SETQ |s| (LIST (|mkAtreeNode| '|swhile|) |predVec| |s|))))
             ((AND (CONSP |iter|) (EQ (CAR |iter|) 'UNTIL)
                   (PROGN
                    (SETQ |ISTMP#1| (CDR |iter|))
                    (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                         (PROGN (SETQ |pred| (CAR |ISTMP#1|)) #1#))))
              (PROGN
               (SETQ |predVec|
                       (|mkIterZippedFun| |indexList| |pred| |zipType|
                        |$localVars|))
               (SETQ |s| (LIST (|mkAtreeNode| '|suntil|) |predVec| |s|))))
             ((AND (CONSP |iter|) (EQ (CAR |iter|) 'SUCHTHAT)
                   (PROGN
                    (SETQ |ISTMP#1| (CDR |iter|))
                    (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                         (PROGN (SETQ |pred| (CAR |ISTMP#1|)) #1#))))
              (PROGN
               (|putTarget| |pred| |$Boolean|)
               (SETQ |predVec|
                       (|mkIterZippedFun| |indexList| |pred| |zipType|
                        |$localVars|))
               (SETQ |s| (LIST (|mkAtreeNode| '|select|) |predVec| |s|)))))))
          (SETQ |bfVar#66| (CDR |bfVar#66|))))
       |itrl| NIL)
      |s|))))
 
; mkIterZippedFun(indexList,funBody,zipType,$localVars) ==
;   -- transform funBody into a lamda with $index as the parameter
;   numVars:= #$indexVars
;   for [var,:.] in $indexVars repeat
;     funBody := subVecNodes(mkIterVarSub(var,numVars),var,funBody)
;   put($index,'mode,zipType,$env)
;   mkLocalVar($mapName,$index)
;   [m]:=bottomUpCompile funBody
;   mapMode := ['Mapping,m,zipType]
;   $freeVariables := []
;   $boundVariables := [$index]
;   -- CCL does not support upwards funargs, so we check for any free variables
;   -- and pass them into the lambda as part of envArg.
;   body :=
;    [checkForFreeVariables(form,$localVars) for form in getValue funBody]
;   val:=['function,['LAMBDA,[$index,'envArg],objVal body]]
;   vec := mkAtreeNode GENSYM()
;   putValue(vec,objNew(['CONS,val,["VECTOR",:reverse $freeVariables]],mapMode))
;   vec
 
(DEFUN |mkIterZippedFun| (|indexList| |funBody| |zipType| |$localVars|)
  (DECLARE (SPECIAL |$localVars|))
  (PROG (|numVars| |var| |LETTMP#1| |m| |mapMode| |body| |val| |vec|)
    (RETURN
     (PROGN
      (SETQ |numVars| (LENGTH |$indexVars|))
      ((LAMBDA (|bfVar#68| |bfVar#67|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#68|)
                (PROGN (SETQ |bfVar#67| (CAR |bfVar#68|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#67|) (PROGN (SETQ |var| (CAR |bfVar#67|)) #1#)
                 (SETQ |funBody|
                         (|subVecNodes| (|mkIterVarSub| |var| |numVars|) |var|
                          |funBody|)))))
          (SETQ |bfVar#68| (CDR |bfVar#68|))))
       |$indexVars| NIL)
      (|put| |$index| '|mode| |zipType| |$env|)
      (|mkLocalVar| |$mapName| |$index|)
      (SETQ |LETTMP#1| (|bottomUpCompile| |funBody|))
      (SETQ |m| (CAR |LETTMP#1|))
      (SETQ |mapMode| (LIST '|Mapping| |m| |zipType|))
      (SETQ |$freeVariables| NIL)
      (SETQ |$boundVariables| (LIST |$index|))
      (SETQ |body|
              ((LAMBDA (|bfVar#70| |bfVar#69| |form|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#69|)
                        (PROGN (SETQ |form| (CAR |bfVar#69|)) NIL))
                    (RETURN (NREVERSE |bfVar#70|)))
                   (#1#
                    (SETQ |bfVar#70|
                            (CONS (|checkForFreeVariables| |form| |$localVars|)
                                  |bfVar#70|))))
                  (SETQ |bfVar#69| (CDR |bfVar#69|))))
               NIL (|getValue| |funBody|) NIL))
      (SETQ |val|
              (LIST '|function|
                    (LIST 'LAMBDA (LIST |$index| '|envArg|)
                          (|objVal| |body|))))
      (SETQ |vec| (|mkAtreeNode| (GENSYM)))
      (|putValue| |vec|
       (|objNew| (LIST 'CONS |val| (CONS 'VECTOR (REVERSE |$freeVariables|)))
        |mapMode|))
      |vec|))))
 
; subVecNodes(new,old,form) ==
;   ATOM form =>
;     (VECP form) and (form.0 = old) => new
;     form
;   [subVecNodes(new, old, first form), :subVecNodes(new, old, rest form)]
 
(DEFUN |subVecNodes| (|new| |old| |form|)
  (PROG ()
    (RETURN
     (COND
      ((ATOM |form|)
       (COND ((AND (VECP |form|) (EQUAL (ELT |form| 0) |old|)) |new|)
             (#1='T |form|)))
      (#1#
       (CONS (|subVecNodes| |new| |old| (CAR |form|))
             (|subVecNodes| |new| |old| (CDR |form|))))))))
 
; mkIterVarSub(var,numVars) ==
;   n := iterVarPos var
;   n=2 =>
;     [mkAtreeNode 'elt,mkNestedElts(numVars-2),mkAtreeNode 'part2]
;   n=1 =>
;     [mkAtreeNode 'elt,mkNestedElts(numVars-2),mkAtreeNode 'part1]
;   [mkAtreeNode 'elt,mkNestedElts(numVars-n),mkAtreeNode 'part1]
 
(DEFUN |mkIterVarSub| (|var| |numVars|)
  (PROG (|n|)
    (RETURN
     (PROGN
      (SETQ |n| (|iterVarPos| |var|))
      (COND
       ((EQL |n| 2)
        (LIST (|mkAtreeNode| '|elt|) (|mkNestedElts| (- |numVars| 2))
              (|mkAtreeNode| '|part2|)))
       ((EQL |n| 1)
        (LIST (|mkAtreeNode| '|elt|) (|mkNestedElts| (- |numVars| 2))
              (|mkAtreeNode| '|part1|)))
       ('T
        (LIST (|mkAtreeNode| '|elt|) (|mkNestedElts| (- |numVars| |n|))
              (|mkAtreeNode| '|part1|))))))))
 
; iterVarPos var ==
;   for [index,:.] in reverse $indexVars for i in 1.. repeat
;     index=var => return(i)
 
(DEFUN |iterVarPos| (|var|)
  (PROG (|index|)
    (RETURN
     ((LAMBDA (|bfVar#72| |bfVar#71| |i|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#72|)
               (PROGN (SETQ |bfVar#71| (CAR |bfVar#72|)) NIL))
           (RETURN NIL))
          (#1='T
           (AND (CONSP |bfVar#71|) (PROGN (SETQ |index| (CAR |bfVar#71|)) #1#)
                (COND ((EQUAL |index| |var|) (IDENTITY (RETURN |i|)))))))
         (SETQ |bfVar#72| (CDR |bfVar#72|))
         (SETQ |i| (+ |i| 1))))
      (REVERSE |$indexVars|) NIL 1))))
 
; mkNestedElts n ==
;   n=0 => mkAtreeNode($index or ($index:= GENSYM()))
;   [mkAtreeNode 'elt, mkNestedElts(n-1), mkAtreeNode 'part2]
 
(DEFUN |mkNestedElts| (|n|)
  (PROG ()
    (RETURN
     (COND ((EQL |n| 0) (|mkAtreeNode| (OR |$index| (SETQ |$index| (GENSYM)))))
           ('T
            (LIST (|mkAtreeNode| '|elt|) (|mkNestedElts| (- |n| 1))
                  (|mkAtreeNode| '|part2|)))))))
 
; upconstruct t ==
;   --Computes the common mode set of the construct by resolving across
;   --the argument list, and evaluating
;   t isnt [op,:l] => nil
;   dol := getAtree(op,'dollar)
;   tar := getTarget(op) or dol
;   null l => upNullList(op,l,tar)
;   tar is ['Record,:types] => upRecordConstruct(op,l,tar)
;   isTaggedUnion tar => upTaggedUnionConstruct(op,l,tar)
;   aggs := '(List)
;   if tar and PAIRP(tar) and not isPartialMode(tar) then
;     first(tar) in aggs =>
;       ud :=
;         (l is [[realOp, :.]]) and (getUnname(realOp) = 'COLLECT) => tar
;         CADR tar
;       for x in l repeat if not getTarget(x) then putTarget(x,ud)
;     first(tar) in '(Matrix SquareMatrix RectangularMatrix) =>
;       vec := ['List,underDomainOf tar]
;       for x in l repeat if not getTarget(x) then putTarget(x,vec)
;   argModeSetList:= [bottomUp x for x in l]
;   dol and dol is [topType,:.] and not (topType in aggs) =>
;     (mmS:= selectMms(op,l,tar)) and (mS:= evalForm(op,getUnname op,l,mmS)) =>
;       putModeSet(op,mS)
;     NIL
;   (tar and tar is [topType,:.] and not (topType in aggs)) and
;     (mmS:= modemapsHavingTarget(selectMms(op,l,tar),tar)) and
;         (mS:= evalForm(op,getUnname op,l,mmS)) =>
;           putModeSet(op,mS)
;   eltTypes := replaceSymbols([first x for x in argModeSetList],l)
;   eltTypes is [['Tuple, td]] =>
;     mode := ['List, td]
;     evalTupleConstruct(op, l, mode, tar)
;   eltTypes is [['InfiniteTuple, td]] =>
;     mode := ['Stream, td]
;     evalInfiniteTupleConstruct(op, l, mode, tar)
;   if not isPartialMode(tar) and tar is ['List,ud] then
;     mode := ['List, resolveTypeListAny cons(ud,eltTypes)]
;   else mode := ['List, resolveTypeListAny eltTypes]
;   if isPartialMode tar then tar:=resolveTM(mode,tar)
;   evalconstruct(op,l,mode,tar)
 
(DEFUN |upconstruct| (|t|)
  (PROG (|op| |l| |dol| |tar| |types| |aggs| |ISTMP#1| |realOp| |ud| |vec|
         |argModeSetList| |topType| |mmS| |mS| |eltTypes| |ISTMP#2| |td|
         |mode|)
    (RETURN
     (COND
      ((NOT
        (AND (CONSP |t|)
             (PROGN (SETQ |op| (CAR |t|)) (SETQ |l| (CDR |t|)) #1='T)))
       NIL)
      (#1#
       (PROGN
        (SETQ |dol| (|getAtree| |op| '|dollar|))
        (SETQ |tar| (OR (|getTarget| |op|) |dol|))
        (COND ((NULL |l|) (|upNullList| |op| |l| |tar|))
              ((AND (CONSP |tar|) (EQ (CAR |tar|) '|Record|)
                    (PROGN (SETQ |types| (CDR |tar|)) #1#))
               (|upRecordConstruct| |op| |l| |tar|))
              ((|isTaggedUnion| |tar|)
               (|upTaggedUnionConstruct| |op| |l| |tar|))
              (#1#
               (PROGN
                (SETQ |aggs| '(|List|))
                (COND
                 ((AND |tar| (CONSP |tar|) (NULL (|isPartialMode| |tar|)))
                  (COND
                   ((|member| (CAR |tar|) |aggs|)
                    (PROGN
                     (SETQ |ud|
                             (COND
                              ((AND (CONSP |l|) (EQ (CDR |l|) NIL)
                                    (PROGN
                                     (SETQ |ISTMP#1| (CAR |l|))
                                     (AND (CONSP |ISTMP#1|)
                                          (PROGN
                                           (SETQ |realOp| (CAR |ISTMP#1|))
                                           #1#)))
                                    (EQ (|getUnname| |realOp|) 'COLLECT))
                               |tar|)
                              (#1# (CADR |tar|))))
                     ((LAMBDA (|bfVar#73| |x|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#73|)
                               (PROGN (SETQ |x| (CAR |bfVar#73|)) NIL))
                           (RETURN NIL))
                          (#1#
                           (COND
                            ((NULL (|getTarget| |x|))
                             (|putTarget| |x| |ud|)))))
                         (SETQ |bfVar#73| (CDR |bfVar#73|))))
                      |l| NIL)))
                   ((|member| (CAR |tar|)
                     '(|Matrix| |SquareMatrix| |RectangularMatrix|))
                    (PROGN
                     (SETQ |vec| (LIST '|List| (|underDomainOf| |tar|)))
                     ((LAMBDA (|bfVar#74| |x|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#74|)
                               (PROGN (SETQ |x| (CAR |bfVar#74|)) NIL))
                           (RETURN NIL))
                          (#1#
                           (COND
                            ((NULL (|getTarget| |x|))
                             (|putTarget| |x| |vec|)))))
                         (SETQ |bfVar#74| (CDR |bfVar#74|))))
                      |l| NIL))))))
                (SETQ |argModeSetList|
                        ((LAMBDA (|bfVar#76| |bfVar#75| |x|)
                           (LOOP
                            (COND
                             ((OR (ATOM |bfVar#75|)
                                  (PROGN (SETQ |x| (CAR |bfVar#75|)) NIL))
                              (RETURN (NREVERSE |bfVar#76|)))
                             (#1#
                              (SETQ |bfVar#76|
                                      (CONS (|bottomUp| |x|) |bfVar#76|))))
                            (SETQ |bfVar#75| (CDR |bfVar#75|))))
                         NIL |l| NIL))
                (COND
                 ((AND |dol| (CONSP |dol|)
                       (PROGN (SETQ |topType| (CAR |dol|)) #1#)
                       (NULL (|member| |topType| |aggs|)))
                  (COND
                   ((AND (SETQ |mmS| (|selectMms| |op| |l| |tar|))
                         (SETQ |mS|
                                 (|evalForm| |op| (|getUnname| |op|) |l|
                                  |mmS|)))
                    (|putModeSet| |op| |mS|))
                   (#1# NIL)))
                 ((AND |tar| (CONSP |tar|)
                       (PROGN (SETQ |topType| (CAR |tar|)) #1#)
                       (NULL (|member| |topType| |aggs|))
                       (SETQ |mmS|
                               (|modemapsHavingTarget|
                                (|selectMms| |op| |l| |tar|) |tar|))
                       (SETQ |mS|
                               (|evalForm| |op| (|getUnname| |op|) |l| |mmS|)))
                  (|putModeSet| |op| |mS|))
                 (#1#
                  (PROGN
                   (SETQ |eltTypes|
                           (|replaceSymbols|
                            ((LAMBDA (|bfVar#78| |bfVar#77| |x|)
                               (LOOP
                                (COND
                                 ((OR (ATOM |bfVar#77|)
                                      (PROGN (SETQ |x| (CAR |bfVar#77|)) NIL))
                                  (RETURN (NREVERSE |bfVar#78|)))
                                 (#1#
                                  (SETQ |bfVar#78|
                                          (CONS (CAR |x|) |bfVar#78|))))
                                (SETQ |bfVar#77| (CDR |bfVar#77|))))
                             NIL |argModeSetList| NIL)
                            |l|))
                   (COND
                    ((AND (CONSP |eltTypes|) (EQ (CDR |eltTypes|) NIL)
                          (PROGN
                           (SETQ |ISTMP#1| (CAR |eltTypes|))
                           (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|Tuple|)
                                (PROGN
                                 (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                 (AND (CONSP |ISTMP#2|)
                                      (EQ (CDR |ISTMP#2|) NIL)
                                      (PROGN
                                       (SETQ |td| (CAR |ISTMP#2|))
                                       #1#))))))
                     (PROGN
                      (SETQ |mode| (LIST '|List| |td|))
                      (|evalTupleConstruct| |op| |l| |mode| |tar|)))
                    ((AND (CONSP |eltTypes|) (EQ (CDR |eltTypes|) NIL)
                          (PROGN
                           (SETQ |ISTMP#1| (CAR |eltTypes|))
                           (AND (CONSP |ISTMP#1|)
                                (EQ (CAR |ISTMP#1|) '|InfiniteTuple|)
                                (PROGN
                                 (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                 (AND (CONSP |ISTMP#2|)
                                      (EQ (CDR |ISTMP#2|) NIL)
                                      (PROGN
                                       (SETQ |td| (CAR |ISTMP#2|))
                                       #1#))))))
                     (PROGN
                      (SETQ |mode| (LIST '|Stream| |td|))
                      (|evalInfiniteTupleConstruct| |op| |l| |mode| |tar|)))
                    (#1#
                     (PROGN
                      (COND
                       ((AND (NULL (|isPartialMode| |tar|)) (CONSP |tar|)
                             (EQ (CAR |tar|) '|List|)
                             (PROGN
                              (SETQ |ISTMP#1| (CDR |tar|))
                              (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                                   (PROGN (SETQ |ud| (CAR |ISTMP#1|)) #1#))))
                        (SETQ |mode|
                                (LIST '|List|
                                      (|resolveTypeListAny|
                                       (CONS |ud| |eltTypes|)))))
                       (#1#
                        (SETQ |mode|
                                (LIST '|List|
                                      (|resolveTypeListAny| |eltTypes|)))))
                      (COND
                       ((|isPartialMode| |tar|)
                        (SETQ |tar| (|resolveTM| |mode| |tar|))))
                      (|evalconstruct| |op| |l| |mode| |tar|))))))))))))))))
 
; modemapsHavingTarget(mmS,target) ==
;   -- returns those modemaps have the signature result matching the
;   -- given target
;   [mm for mm in mmS | ([[.,res,:.],:.] := mm) and res = target]
 
(DEFUN |modemapsHavingTarget| (|mmS| |target|)
  (PROG (|res|)
    (RETURN
     ((LAMBDA (|bfVar#80| |bfVar#79| |mm|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#79|) (PROGN (SETQ |mm| (CAR |bfVar#79|)) NIL))
           (RETURN (NREVERSE |bfVar#80|)))
          ('T
           (AND (PROGN (SETQ |res| (CADAR |mm|)) |mm|) (EQUAL |res| |target|)
                (SETQ |bfVar#80| (CONS |mm| |bfVar#80|)))))
         (SETQ |bfVar#79| (CDR |bfVar#79|))))
      NIL |mmS| NIL))))
 
; evalTupleConstruct(op,l,m,tar) ==
;   ['List, ud] := m
;   code := ['APPEND,
;     :([["asTupleAsList", getArgValueOrThrow(x,['Tuple, ud])] for x in l])]
;   val :=
;     $genValue => objNewWrap(timedEVALFUN code,m)
;     objNew(code,m)
; 
;   (val1 := coerceInteractive(val,tar or m)) =>
;     putValue(op,val1)
;     putModeSet(op,[tar or m])
;   putValue(op,val)
;   putModeSet(op,[m])
 
(DEFUN |evalTupleConstruct| (|op| |l| |m| |tar|)
  (PROG (|ud| |code| |val| |val1|)
    (RETURN
     (PROGN
      (SETQ |ud| (CADR |m|))
      (SETQ |code|
              (CONS 'APPEND
                    ((LAMBDA (|bfVar#82| |bfVar#81| |x|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#81|)
                              (PROGN (SETQ |x| (CAR |bfVar#81|)) NIL))
                          (RETURN (NREVERSE |bfVar#82|)))
                         (#1='T
                          (SETQ |bfVar#82|
                                  (CONS
                                   (LIST '|asTupleAsList|
                                         (|getArgValueOrThrow| |x|
                                          (LIST '|Tuple| |ud|)))
                                   |bfVar#82|))))
                        (SETQ |bfVar#81| (CDR |bfVar#81|))))
                     NIL |l| NIL)))
      (SETQ |val|
              (COND (|$genValue| (|objNewWrap| (|timedEVALFUN| |code|) |m|))
                    (#1# (|objNew| |code| |m|))))
      (COND
       ((SETQ |val1| (|coerceInteractive| |val| (OR |tar| |m|)))
        (PROGN
         (|putValue| |op| |val1|)
         (|putModeSet| |op| (LIST (OR |tar| |m|)))))
       (#1# (PROGN (|putValue| |op| |val|) (|putModeSet| |op| (LIST |m|)))))))))
 
; evalInfiniteTupleConstruct(op,l,m,tar) ==
;   ['Stream, ud] := m
;   code := first [(getArgValue(x,['InfiniteTuple, ud]) or
;     throwKeyedMsg("S2IC0007",[['InifinteTuple, ud]])) for x in l]
;   val :=
;     $genValue => objNewWrap(timedEVALFUN code,m)
;     objNew(code,m)
;   if tar then val1 := coerceInteractive(val,tar) else val1 := val
; 
;   val1 =>
;     putValue(op,val1)
;     putModeSet(op,[tar or m])
;   putValue(op,val)
;   putModeSet(op,[m])
 
(DEFUN |evalInfiniteTupleConstruct| (|op| |l| |m| |tar|)
  (PROG (|ud| |code| |val| |val1|)
    (RETURN
     (PROGN
      (SETQ |ud| (CADR |m|))
      (SETQ |code|
              (CAR
               ((LAMBDA (|bfVar#84| |bfVar#83| |x|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#83|)
                         (PROGN (SETQ |x| (CAR |bfVar#83|)) NIL))
                     (RETURN (NREVERSE |bfVar#84|)))
                    (#1='T
                     (SETQ |bfVar#84|
                             (CONS
                              (OR
                               (|getArgValue| |x| (LIST '|InfiniteTuple| |ud|))
                               (|throwKeyedMsg| 'S2IC0007
                                (LIST (LIST '|InifinteTuple| |ud|))))
                              |bfVar#84|))))
                   (SETQ |bfVar#83| (CDR |bfVar#83|))))
                NIL |l| NIL)))
      (SETQ |val|
              (COND (|$genValue| (|objNewWrap| (|timedEVALFUN| |code|) |m|))
                    (#1# (|objNew| |code| |m|))))
      (COND (|tar| (SETQ |val1| (|coerceInteractive| |val| |tar|)))
            (#1# (SETQ |val1| |val|)))
      (COND
       (|val1|
        (PROGN
         (|putValue| |op| |val1|)
         (|putModeSet| |op| (LIST (OR |tar| |m|)))))
       (#1# (PROGN (|putValue| |op| |val|) (|putModeSet| |op| (LIST |m|)))))))))
 
; evalconstruct(op,l,m,tar) ==
;   [agg,:.,underMode]:= m
;   code := ['LIST, :(argCode:=[(getArgValue(x,underMode) or
;     throwKeyedMsg("S2IC0007",[underMode])) for x in l])]
;   val :=
;     $genValue => objNewWrap(timedEVALFUN code,m)
;     objNew(code,m)
;   if tar then val1 := coerceInteractive(val,tar) else val1 := val
; 
;   val1 =>
;     putValue(op,val1)
;     putModeSet(op,[tar or m])
;   putValue(op,val)
;   putModeSet(op,[m])
 
(DEFUN |evalconstruct| (|op| |l| |m| |tar|)
  (PROG (|agg| |LETTMP#1| |underMode| |argCode| |code| |val| |val1|)
    (RETURN
     (PROGN
      (SETQ |agg| (CAR |m|))
      (SETQ |LETTMP#1| (REVERSE (CDR |m|)))
      (SETQ |underMode| (CAR |LETTMP#1|))
      (SETQ |code|
              (CONS 'LIST
                    (SETQ |argCode|
                            ((LAMBDA (|bfVar#86| |bfVar#85| |x|)
                               (LOOP
                                (COND
                                 ((OR (ATOM |bfVar#85|)
                                      (PROGN (SETQ |x| (CAR |bfVar#85|)) NIL))
                                  (RETURN (NREVERSE |bfVar#86|)))
                                 (#1='T
                                  (SETQ |bfVar#86|
                                          (CONS
                                           (OR (|getArgValue| |x| |underMode|)
                                               (|throwKeyedMsg| 'S2IC0007
                                                (LIST |underMode|)))
                                           |bfVar#86|))))
                                (SETQ |bfVar#85| (CDR |bfVar#85|))))
                             NIL |l| NIL))))
      (SETQ |val|
              (COND (|$genValue| (|objNewWrap| (|timedEVALFUN| |code|) |m|))
                    (#1# (|objNew| |code| |m|))))
      (COND (|tar| (SETQ |val1| (|coerceInteractive| |val| |tar|)))
            (#1# (SETQ |val1| |val|)))
      (COND
       (|val1|
        (PROGN
         (|putValue| |op| |val1|)
         (|putModeSet| |op| (LIST (OR |tar| |m|)))))
       (#1# (PROGN (|putValue| |op| |val|) (|putModeSet| |op| (LIST |m|)))))))))
 
; replaceSymbols(modeList,l) ==
;   -- replaces symbol types with their corresponding polynomial types
;   --  if not all type are symbols
;   not ($Symbol in modeList) => modeList
;   modeList is [a,:b] and and/[a=x for x in b] => modeList
;   [if m=$Symbol then getMinimalVarMode(objValUnwrap(getValue arg),
;     $declaredMode) else m for m in modeList for arg in l]
 
(DEFUN |replaceSymbols| (|modeList| |l|)
  (PROG (|a| |b|)
    (RETURN
     (COND ((NULL (|member| |$Symbol| |modeList|)) |modeList|)
           ((AND (CONSP |modeList|)
                 (PROGN
                  (SETQ |a| (CAR |modeList|))
                  (SETQ |b| (CDR |modeList|))
                  #1='T)
                 ((LAMBDA (|bfVar#88| |bfVar#87| |x|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#87|)
                           (PROGN (SETQ |x| (CAR |bfVar#87|)) NIL))
                       (RETURN |bfVar#88|))
                      (#1#
                       (PROGN
                        (SETQ |bfVar#88| (EQUAL |a| |x|))
                        (COND ((NOT |bfVar#88|) (RETURN NIL))))))
                     (SETQ |bfVar#87| (CDR |bfVar#87|))))
                  T |b| NIL))
            |modeList|)
           (#1#
            ((LAMBDA (|bfVar#91| |bfVar#89| |m| |bfVar#90| |arg|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#89|) (PROGN (SETQ |m| (CAR |bfVar#89|)) NIL)
                      (ATOM |bfVar#90|)
                      (PROGN (SETQ |arg| (CAR |bfVar#90|)) NIL))
                  (RETURN (NREVERSE |bfVar#91|)))
                 (#1#
                  (SETQ |bfVar#91|
                          (CONS
                           (COND
                            ((EQUAL |m| |$Symbol|)
                             (|getMinimalVarMode|
                              (|objValUnwrap| (|getValue| |arg|))
                              |$declaredMode|))
                            (#1# |m|))
                           |bfVar#91|))))
                (SETQ |bfVar#89| (CDR |bfVar#89|))
                (SETQ |bfVar#90| (CDR |bfVar#90|))))
             NIL |modeList| NIL |l| NIL))))))
 
; upNullList(op,l,tar) ==
;   -- handler for [] (empty list)
;   defMode :=
;     tar and tar is [a,b] and (a in '(Stream Vector List)) and
;       not isPartialMode(b) => ['List,b]
;     '(List (None))
;   val := objNewWrap(NIL,defMode)
;   tar and not isPartialMode(tar) =>
;     null (val' := coerceInteractive(val,tar)) =>
;       throwKeyedMsg("S2IS0013",[tar])
;     putValue(op,val')
;     putModeSet(op,[tar])
;   putValue(op,val)
;   putModeSet(op,[defMode])
 
(DEFUN |upNullList| (|op| |l| |tar|)
  (PROG (|a| |ISTMP#1| |b| |defMode| |val| |val'|)
    (RETURN
     (PROGN
      (SETQ |defMode|
              (COND
               ((AND |tar| (CONSP |tar|)
                     (PROGN
                      (SETQ |a| (CAR |tar|))
                      (SETQ |ISTMP#1| (CDR |tar|))
                      (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                           (PROGN (SETQ |b| (CAR |ISTMP#1|)) #1='T)))
                     (|member| |a| '(|Stream| |Vector| |List|))
                     (NULL (|isPartialMode| |b|)))
                (LIST '|List| |b|))
               (#1# '(|List| (|None|)))))
      (SETQ |val| (|objNewWrap| NIL |defMode|))
      (COND
       ((AND |tar| (NULL (|isPartialMode| |tar|)))
        (COND
         ((NULL (SETQ |val'| (|coerceInteractive| |val| |tar|)))
          (|throwKeyedMsg| 'S2IS0013 (LIST |tar|)))
         (#1#
          (PROGN (|putValue| |op| |val'|) (|putModeSet| |op| (LIST |tar|))))))
       (#1#
        (PROGN
         (|putValue| |op| |val|)
         (|putModeSet| |op| (LIST |defMode|)))))))))
 
; upTaggedUnionConstruct(op,l,tar) ==
;   -- special handler for tagged union constructors
;   tar isnt [.,:types] => nil
;   #l ~= 1 => throwKeyedMsg("S2IS0051",[#l,tar])
;   bottomUp first l
;   obj := getValue first l
;   (code := coerceInteractive(getValue first l,tar)) or
;     throwKeyedMsgCannotCoerceWithValue(objVal obj, objMode obj,tar)
;   putValue(op,code)
;   putModeSet(op,[tar])
 
(DEFUN |upTaggedUnionConstruct| (|op| |l| |tar|)
  (PROG (|types| |obj| |code|)
    (RETURN
     (COND
      ((NOT (AND (CONSP |tar|) (PROGN (SETQ |types| (CDR |tar|)) #1='T))) NIL)
      ((NOT (EQL (LENGTH |l|) 1))
       (|throwKeyedMsg| 'S2IS0051 (LIST (LENGTH |l|) |tar|)))
      (#1#
       (PROGN
        (|bottomUp| (CAR |l|))
        (SETQ |obj| (|getValue| (CAR |l|)))
        (OR (SETQ |code| (|coerceInteractive| (|getValue| (CAR |l|)) |tar|))
            (|throwKeyedMsgCannotCoerceWithValue| (|objVal| |obj|)
             (|objMode| |obj|) |tar|))
        (|putValue| |op| |code|)
        (|putModeSet| |op| (LIST |tar|))))))))
 
; upRecordConstruct(op,l,tar) ==
;   -- special handler for record constructors
;   tar isnt [.,:types] => nil
;   argModes := nil
;   for arg in l repeat bottomUp arg
;   argCode :=
;     [(getArgValue(arg,type) or throwKeyedMsgCannotCoerceWithValue(
;       objVal getValue arg,objMode getValue arg,type))
;         for arg in l for ['_:,.,type] in types]
;   len := #l
;   code :=
;     (len = 1) => ['CONS, :argCode, '()]
;     (len = 2) => ['CONS,:argCode]
;     ['VECTOR,:argCode]
;   if $genValue then code :=  wrap timedEVALFUN code
;   putValue(op,objNew(code,tar))
;   putModeSet(op,[tar])
 
(DEFUN |upRecordConstruct| (|op| |l| |tar|)
  (PROG (|types| |argModes| |ISTMP#1| |ISTMP#2| |type| |argCode| |len| |code|)
    (RETURN
     (COND
      ((NOT (AND (CONSP |tar|) (PROGN (SETQ |types| (CDR |tar|)) #1='T))) NIL)
      (#1#
       (PROGN
        (SETQ |argModes| NIL)
        ((LAMBDA (|bfVar#92| |arg|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#92|) (PROGN (SETQ |arg| (CAR |bfVar#92|)) NIL))
              (RETURN NIL))
             (#1# (|bottomUp| |arg|)))
            (SETQ |bfVar#92| (CDR |bfVar#92|))))
         |l| NIL)
        (SETQ |argCode|
                ((LAMBDA (|bfVar#96| |bfVar#93| |arg| |bfVar#95| |bfVar#94|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#93|)
                          (PROGN (SETQ |arg| (CAR |bfVar#93|)) NIL)
                          (ATOM |bfVar#95|)
                          (PROGN (SETQ |bfVar#94| (CAR |bfVar#95|)) NIL))
                      (RETURN (NREVERSE |bfVar#96|)))
                     (#1#
                      (AND (CONSP |bfVar#94|) (EQ (CAR |bfVar#94|) '|:|)
                           (PROGN
                            (SETQ |ISTMP#1| (CDR |bfVar#94|))
                            (AND (CONSP |ISTMP#1|)
                                 (PROGN
                                  (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                  (AND (CONSP |ISTMP#2|)
                                       (EQ (CDR |ISTMP#2|) NIL)
                                       (PROGN
                                        (SETQ |type| (CAR |ISTMP#2|))
                                        #1#)))))
                           (SETQ |bfVar#96|
                                   (CONS
                                    (OR (|getArgValue| |arg| |type|)
                                        (|throwKeyedMsgCannotCoerceWithValue|
                                         (|objVal| (|getValue| |arg|))
                                         (|objMode| (|getValue| |arg|))
                                         |type|))
                                    |bfVar#96|)))))
                    (SETQ |bfVar#93| (CDR |bfVar#93|))
                    (SETQ |bfVar#95| (CDR |bfVar#95|))))
                 NIL |l| NIL |types| NIL))
        (SETQ |len| (LENGTH |l|))
        (SETQ |code|
                (COND
                 ((EQL |len| 1)
                  (CONS 'CONS (APPEND |argCode| (CONS 'NIL NIL))))
                 ((EQL |len| 2) (CONS 'CONS |argCode|))
                 (#1# (CONS 'VECTOR |argCode|))))
        (COND (|$genValue| (SETQ |code| (|wrap| (|timedEVALFUN| |code|)))))
        (|putValue| |op| (|objNew| |code| |tar|))
        (|putModeSet| |op| (LIST |tar|))))))))
 
; upDeclare t ==
;   t isnt  [op,lhs,rhs] => nil
;   (not $genValue) and or/[CONTAINED(var,rhs) for var in $localVars] =>
;     keyedMsgCompFailure("S2IS0014",[lhs])
;   mode := evaluateType unabbrev rhs
;   mode = $Void => throwKeyedMsgSP("S2IS0015",NIL,op)
;   not isLegitimateMode(mode,nil,nil) => throwKeyedMsgSP("S2IE0004",[mode],op)
;   categoryForm?(mode) => throwKeyedMsgSP("S2IE0011",[mode, 'category],op)
;   packageForm?(mode) => throwKeyedMsgSP("S2IE0011",[mode, 'package],op)
;   junk :=
;     lhs is ['free,['Tuple,:vars]] or lhs is ['free,['LISTOF,:vars]] or
;       lhs is ['free,:vars] =>
;         for var in vars repeat declare(['free,var],mode)
;     lhs is ['local,['Tuple,:vars]] or lhs is ['local,['LISTOF,:vars]] or
;       lhs is ['local,:vars] =>
;         for var in vars repeat declare(['local,var],mode)
;     lhs is ['Tuple,:vars] or lhs is ['LISTOF,:vars] =>
;       for var in vars repeat declare(var,mode)
;     declare(lhs,mode)
;   putValue(op,objNewWrap(voidValue(), $Void))
;   putModeSet(op,[$Void])
 
(DEFUN |upDeclare| (|t|)
  (PROG (|op| |ISTMP#1| |lhs| |ISTMP#2| |rhs| |mode| |vars| |junk|)
    (RETURN
     (COND
      ((NOT
        (AND (CONSP |t|)
             (PROGN
              (SETQ |op| (CAR |t|))
              (SETQ |ISTMP#1| (CDR |t|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN
                    (SETQ |lhs| (CAR |ISTMP#1|))
                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                         (PROGN (SETQ |rhs| (CAR |ISTMP#2|)) #1='T)))))))
       NIL)
      ((AND (NULL |$genValue|)
            ((LAMBDA (|bfVar#98| |bfVar#97| |var|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#97|)
                      (PROGN (SETQ |var| (CAR |bfVar#97|)) NIL))
                  (RETURN |bfVar#98|))
                 (#1#
                  (PROGN
                   (SETQ |bfVar#98| (CONTAINED |var| |rhs|))
                   (COND (|bfVar#98| (RETURN |bfVar#98|))))))
                (SETQ |bfVar#97| (CDR |bfVar#97|))))
             NIL |$localVars| NIL))
       (|keyedMsgCompFailure| 'S2IS0014 (LIST |lhs|)))
      (#1#
       (PROGN
        (SETQ |mode| (|evaluateType| (|unabbrev| |rhs|)))
        (COND ((EQUAL |mode| |$Void|) (|throwKeyedMsgSP| 'S2IS0015 NIL |op|))
              ((NULL (|isLegitimateMode| |mode| NIL NIL))
               (|throwKeyedMsgSP| 'S2IE0004 (LIST |mode|) |op|))
              ((|categoryForm?| |mode|)
               (|throwKeyedMsgSP| 'S2IE0011 (LIST |mode| '|category|) |op|))
              ((|packageForm?| |mode|)
               (|throwKeyedMsgSP| 'S2IE0011 (LIST |mode| '|package|) |op|))
              (#1#
               (PROGN
                (SETQ |junk|
                        (COND
                         ((OR
                           (AND (CONSP |lhs|) (EQ (CAR |lhs|) '|free|)
                                (PROGN
                                 (SETQ |ISTMP#1| (CDR |lhs|))
                                 (AND (CONSP |ISTMP#1|)
                                      (EQ (CDR |ISTMP#1|) NIL)
                                      (PROGN
                                       (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                                       (AND (CONSP |ISTMP#2|)
                                            (EQ (CAR |ISTMP#2|) '|Tuple|)
                                            (PROGN
                                             (SETQ |vars| (CDR |ISTMP#2|))
                                             #1#))))))
                           (AND (CONSP |lhs|) (EQ (CAR |lhs|) '|free|)
                                (PROGN
                                 (SETQ |ISTMP#1| (CDR |lhs|))
                                 (AND (CONSP |ISTMP#1|)
                                      (EQ (CDR |ISTMP#1|) NIL)
                                      (PROGN
                                       (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                                       (AND (CONSP |ISTMP#2|)
                                            (EQ (CAR |ISTMP#2|) 'LISTOF)
                                            (PROGN
                                             (SETQ |vars| (CDR |ISTMP#2|))
                                             #1#))))))
                           (AND (CONSP |lhs|) (EQ (CAR |lhs|) '|free|)
                                (PROGN (SETQ |vars| (CDR |lhs|)) #1#)))
                          ((LAMBDA (|bfVar#99| |var|)
                             (LOOP
                              (COND
                               ((OR (ATOM |bfVar#99|)
                                    (PROGN (SETQ |var| (CAR |bfVar#99|)) NIL))
                                (RETURN NIL))
                               (#1# (|declare| (LIST '|free| |var|) |mode|)))
                              (SETQ |bfVar#99| (CDR |bfVar#99|))))
                           |vars| NIL))
                         ((OR
                           (AND (CONSP |lhs|) (EQ (CAR |lhs|) '|local|)
                                (PROGN
                                 (SETQ |ISTMP#1| (CDR |lhs|))
                                 (AND (CONSP |ISTMP#1|)
                                      (EQ (CDR |ISTMP#1|) NIL)
                                      (PROGN
                                       (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                                       (AND (CONSP |ISTMP#2|)
                                            (EQ (CAR |ISTMP#2|) '|Tuple|)
                                            (PROGN
                                             (SETQ |vars| (CDR |ISTMP#2|))
                                             #1#))))))
                           (AND (CONSP |lhs|) (EQ (CAR |lhs|) '|local|)
                                (PROGN
                                 (SETQ |ISTMP#1| (CDR |lhs|))
                                 (AND (CONSP |ISTMP#1|)
                                      (EQ (CDR |ISTMP#1|) NIL)
                                      (PROGN
                                       (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                                       (AND (CONSP |ISTMP#2|)
                                            (EQ (CAR |ISTMP#2|) 'LISTOF)
                                            (PROGN
                                             (SETQ |vars| (CDR |ISTMP#2|))
                                             #1#))))))
                           (AND (CONSP |lhs|) (EQ (CAR |lhs|) '|local|)
                                (PROGN (SETQ |vars| (CDR |lhs|)) #1#)))
                          ((LAMBDA (|bfVar#100| |var|)
                             (LOOP
                              (COND
                               ((OR (ATOM |bfVar#100|)
                                    (PROGN (SETQ |var| (CAR |bfVar#100|)) NIL))
                                (RETURN NIL))
                               (#1# (|declare| (LIST '|local| |var|) |mode|)))
                              (SETQ |bfVar#100| (CDR |bfVar#100|))))
                           |vars| NIL))
                         ((OR
                           (AND (CONSP |lhs|) (EQ (CAR |lhs|) '|Tuple|)
                                (PROGN (SETQ |vars| (CDR |lhs|)) #1#))
                           (AND (CONSP |lhs|) (EQ (CAR |lhs|) 'LISTOF)
                                (PROGN (SETQ |vars| (CDR |lhs|)) #1#)))
                          ((LAMBDA (|bfVar#101| |var|)
                             (LOOP
                              (COND
                               ((OR (ATOM |bfVar#101|)
                                    (PROGN (SETQ |var| (CAR |bfVar#101|)) NIL))
                                (RETURN NIL))
                               (#1# (|declare| |var| |mode|)))
                              (SETQ |bfVar#101| (CDR |bfVar#101|))))
                           |vars| NIL))
                         (#1# (|declare| |lhs| |mode|))))
                (|putValue| |op| (|objNewWrap| (|voidValue|) |$Void|))
                (|putModeSet| |op| (LIST |$Void|)))))))))))
 
; declare(var,mode) ==
;   -- performs declaration.
;   -- 10/31/89: no longer coerces value to new declared type
;   if var is ['local,v] then
;     uplocalWithType(v,mode)
;     var := v
;   if var is ['free,v] then
;     upfreeWithType(v,mode)
;     var := v
;   not IDENTP(var) =>
;     throwKeyedMsg("S2IS0016",[STRINGIMAGE var])
;   var in '(% %%) => throwKeyedMsg("S2IS0050",[var])
;   if get(var,'isInterpreterFunction,$e) then
;     mode isnt ['Mapping,.,:args] =>
;       throwKeyedMsg("S2IS0017",[var,mode])
;     -- validate that the new declaration has the defined # of args
;     mapval := objVal get(var,'value,$e)
;     -- mapval looks like '(SPADMAP (args . defn))
;     margs := CAADR mapval
;     -- if one args, margs is not a pair, just #1 or NIL
;     -- otherwise it looks like (Tuple #1 #2 ...)
;     nargs :=
;       null margs => 0
;       PAIRP margs => -1 + #margs
;       1
;     nargs ~= #args => throwKeyedMsg("S2IM0008",[var])
;   if $compilingMap then mkLocalVar($mapName,var)
;   else clearDependencies(var,true)
;   isLocalVar(var) => put(var,'mode,mode,$env)
;   mode is ['Mapping,:.] => declareMap(var,mode)
;   v := get(var,'value,$e) =>
;     -- only allow this if either
;     --   - value already has given type
;     --   - new mode is same as old declared mode
;     objMode(v) = mode => putHist(var,'mode,mode,$e)
;     mode = get(var,'mode,$e) => NIL   -- nothing to do
;     throwKeyedMsg("S2IS0052",[var,mode])
;   putHist(var,'mode,mode,$e)
 
(DEFUN |declare| (|var| |mode|)
  (PROG (|ISTMP#1| |v| |args| |mapval| |margs| |nargs|)
    (RETURN
     (PROGN
      (COND
       ((AND (CONSP |var|) (EQ (CAR |var|) '|local|)
             (PROGN
              (SETQ |ISTMP#1| (CDR |var|))
              (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                   (PROGN (SETQ |v| (CAR |ISTMP#1|)) #1='T))))
        (|uplocalWithType| |v| |mode|) (SETQ |var| |v|)))
      (COND
       ((AND (CONSP |var|) (EQ (CAR |var|) '|free|)
             (PROGN
              (SETQ |ISTMP#1| (CDR |var|))
              (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                   (PROGN (SETQ |v| (CAR |ISTMP#1|)) #1#))))
        (|upfreeWithType| |v| |mode|) (SETQ |var| |v|)))
      (COND
       ((NULL (IDENTP |var|))
        (|throwKeyedMsg| 'S2IS0016 (LIST (STRINGIMAGE |var|))))
       ((|member| |var| '(% %%)) (|throwKeyedMsg| 'S2IS0050 (LIST |var|)))
       (#1#
        (PROGN
         (COND
          ((|get| |var| '|isInterpreterFunction| |$e|)
           (COND
            ((NOT
              (AND (CONSP |mode|) (EQ (CAR |mode|) '|Mapping|)
                   (PROGN
                    (SETQ |ISTMP#1| (CDR |mode|))
                    (AND (CONSP |ISTMP#1|)
                         (PROGN (SETQ |args| (CDR |ISTMP#1|)) #1#)))))
             (|throwKeyedMsg| 'S2IS0017 (LIST |var| |mode|)))
            (#1#
             (PROGN
              (SETQ |mapval| (|objVal| (|get| |var| '|value| |$e|)))
              (SETQ |margs| (CAADR |mapval|))
              (SETQ |nargs|
                      (COND ((NULL |margs|) 0)
                            ((CONSP |margs|) (+ (- 1) (LENGTH |margs|)))
                            (#1# 1)))
              (COND
               ((NOT (EQL |nargs| (LENGTH |args|)))
                (|throwKeyedMsg| 'S2IM0008 (LIST |var|)))))))))
         (COND (|$compilingMap| (|mkLocalVar| |$mapName| |var|))
               (#1# (|clearDependencies| |var| T)))
         (COND ((|isLocalVar| |var|) (|put| |var| '|mode| |mode| |$env|))
               ((AND (CONSP |mode|) (EQ (CAR |mode|) '|Mapping|))
                (|declareMap| |var| |mode|))
               ((SETQ |v| (|get| |var| '|value| |$e|))
                (COND
                 ((EQUAL (|objMode| |v|) |mode|)
                  (|putHist| |var| '|mode| |mode| |$e|))
                 ((EQUAL |mode| (|get| |var| '|mode| |$e|)) NIL)
                 (#1# (|throwKeyedMsg| 'S2IS0052 (LIST |var| |mode|)))))
               (#1# (|putHist| |var| '|mode| |mode| |$e|))))))))))
 
; declareMap(var,mode) ==
;   -- declare a Mapping property
;   (v := get(var, 'value, $e)) and objVal(v) isnt ['SPADMAP, :.] =>
;       objMode(v) = mode => putHist(var, 'mode, mode, $e)
;       mode = get(var, 'mode, $e) => nil
;       throwKeyedMsg("S2IS0019", [var])
;   isPartialMode mode => throwKeyedMsg("S2IM0004",NIL)
;   putHist(var,'mode,mode,$e)
 
(DEFUN |declareMap| (|var| |mode|)
  (PROG (|v| |ISTMP#1|)
    (RETURN
     (COND
      ((AND (SETQ |v| (|get| |var| '|value| |$e|))
            (NOT
             (PROGN
              (SETQ |ISTMP#1| (|objVal| |v|))
              (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) 'SPADMAP)))))
       (COND
        ((EQUAL (|objMode| |v|) |mode|) (|putHist| |var| '|mode| |mode| |$e|))
        ((EQUAL |mode| (|get| |var| '|mode| |$e|)) NIL)
        (#1='T (|throwKeyedMsg| 'S2IS0019 (LIST |var|)))))
      ((|isPartialMode| |mode|) (|throwKeyedMsg| 'S2IM0004 NIL))
      (#1# (|putHist| |var| '|mode| |mode| |$e|))))))
 
; containsLocalVar(tree) ==
;     or/[CONTAINED(var, tree) for var in $localVars] or
;        CONTAINED("$$$", tree)
 
(DEFUN |containsLocalVar| (|tree|)
  (PROG ()
    (RETURN
     (OR
      ((LAMBDA (|bfVar#103| |bfVar#102| |var|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#102|) (PROGN (SETQ |var| (CAR |bfVar#102|)) NIL))
            (RETURN |bfVar#103|))
           ('T
            (PROGN
             (SETQ |bfVar#103| (CONTAINED |var| |tree|))
             (COND (|bfVar#103| (RETURN |bfVar#103|))))))
          (SETQ |bfVar#102| (CDR |bfVar#102|))))
       NIL |$localVars| NIL)
      (CONTAINED '$$$ |tree|)))))
 
; getAndEvalConstructorArgument tree ==
;   triple := getValue tree
;   objMode triple = '(Type) => triple
;   isWrapped objVal(triple) => triple
;   containsLocalVar objVal triple =>
;       compFailure('"   Local variable or parameter used in type")
;   objNewWrap(timedEVALFUN objVal(triple), objMode(triple))
 
(DEFUN |getAndEvalConstructorArgument| (|tree|)
  (PROG (|triple|)
    (RETURN
     (PROGN
      (SETQ |triple| (|getValue| |tree|))
      (COND ((EQUAL (|objMode| |triple|) '(|Type|)) |triple|)
            ((|isWrapped| (|objVal| |triple|)) |triple|)
            ((|containsLocalVar| (|objVal| |triple|))
             (|compFailure| "   Local variable or parameter used in type"))
            ('T
             (|objNewWrap| (|timedEVALFUN| (|objVal| |triple|))
              (|objMode| |triple|))))))))
 
; replaceSharps(x,d) ==
;   -- replaces all sharps in x by the arguments of domain d
;   -- all replaces the triangle variables
;   SL:= NIL
;   for e in rest d for var in $FormalMapVariableList repeat
;     SL:= CONS(CONS(var,e),SL)
;   x := subCopy(x,SL)
;   SL:= NIL
;   for e in rest d for var in $TriangleVariableList repeat
;     SL:= CONS(CONS(var,e),SL)
;   subCopy(x,SL)
 
(DEFUN |replaceSharps| (|x| |d|)
  (PROG (SL)
    (RETURN
     (PROGN
      (SETQ SL NIL)
      ((LAMBDA (|bfVar#104| |e| |bfVar#105| |var|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#104|) (PROGN (SETQ |e| (CAR |bfVar#104|)) NIL)
                (ATOM |bfVar#105|) (PROGN (SETQ |var| (CAR |bfVar#105|)) NIL))
            (RETURN NIL))
           (#1='T (SETQ SL (CONS (CONS |var| |e|) SL))))
          (SETQ |bfVar#104| (CDR |bfVar#104|))
          (SETQ |bfVar#105| (CDR |bfVar#105|))))
       (CDR |d|) NIL |$FormalMapVariableList| NIL)
      (SETQ |x| (|subCopy| |x| SL))
      (SETQ SL NIL)
      ((LAMBDA (|bfVar#106| |e| |bfVar#107| |var|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#106|) (PROGN (SETQ |e| (CAR |bfVar#106|)) NIL)
                (ATOM |bfVar#107|) (PROGN (SETQ |var| (CAR |bfVar#107|)) NIL))
            (RETURN NIL))
           (#1# (SETQ SL (CONS (CONS |var| |e|) SL))))
          (SETQ |bfVar#106| (CDR |bfVar#106|))
          (SETQ |bfVar#107| (CDR |bfVar#107|))))
       (CDR |d|) NIL |$TriangleVariableList| NIL)
      (|subCopy| |x| SL)))))
 
; isDomainValuedVariable form ==
;   -- returns the value of form if form is a variable with a type value
;   IDENTP form and (val := (
;     get(form,'value,$InteractiveFrame) or _
;     (PAIRP($env) and get(form,'value,$env)) or _
;     (PAIRP($e) and get(form,'value,$e)))) and _
;       categoryForm?(objMode(val)) =>
;         objValUnwrap(val)
;   nil
 
(DEFUN |isDomainValuedVariable| (|form|)
  (PROG (|val|)
    (RETURN
     (COND
      ((AND (IDENTP |form|)
            (SETQ |val|
                    (OR (|get| |form| '|value| |$InteractiveFrame|)
                        (AND (CONSP |$env|) (|get| |form| '|value| |$env|))
                        (AND (CONSP |$e|) (|get| |form| '|value| |$e|))))
            (|categoryForm?| (|objMode| |val|)))
       (|objValUnwrap| |val|))
      ('T NIL)))))
 
; evalCategory(d,c) ==
;   -- tests whether domain d has category c
;   isPartialMode d or ofCategory(d,c)
 
(DEFUN |evalCategory| (|d| |c|)
  (PROG () (RETURN (OR (|isPartialMode| |d|) (|ofCategory| |d| |c|)))))
 
; isOkInterpMode m ==
;   isPartialMode(m) => isLegitimateMode(m,nil,nil)
;   isValidType(m) and isLegitimateMode(m,nil,nil)
 
(DEFUN |isOkInterpMode| (|m|)
  (PROG ()
    (RETURN
     (COND ((|isPartialMode| |m|) (|isLegitimateMode| |m| NIL NIL))
           ('T (AND (|isValidType| |m|) (|isLegitimateMode| |m| NIL NIL)))))))
 
; isLegitimateRecordOrTaggedUnion u ==
;   and/[x is [":",.,d] and isLegitimateMode(d,nil,nil) for x in u]
 
(DEFUN |isLegitimateRecordOrTaggedUnion| (|u|)
  (PROG (|ISTMP#1| |ISTMP#2| |d|)
    (RETURN
     ((LAMBDA (|bfVar#109| |bfVar#108| |x|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#108|) (PROGN (SETQ |x| (CAR |bfVar#108|)) NIL))
           (RETURN |bfVar#109|))
          (#1='T
           (PROGN
            (SETQ |bfVar#109|
                    (AND (CONSP |x|) (EQ (CAR |x|) '|:|)
                         (PROGN
                          (SETQ |ISTMP#1| (CDR |x|))
                          (AND (CONSP |ISTMP#1|)
                               (PROGN
                                (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                     (PROGN (SETQ |d| (CAR |ISTMP#2|)) #1#)))))
                         (|isLegitimateMode| |d| NIL NIL)))
            (COND ((NOT |bfVar#109|) (RETURN NIL))))))
         (SETQ |bfVar#108| (CDR |bfVar#108|))))
      T |u| NIL))))
 
; isPolynomialMode m ==
;   -- If m is a polynomial type this function returns a list of its
;   --  variables, and nil otherwise
;   m is [op,a,:rargs] =>
;     a := removeQuote a
;     MEMQ(op,'(Polynomial RationalFunction AlgebraicFunction Expression
;       ElementaryFunction LiouvillianFunction FunctionalExpression
;         CombinatorialFunction ))=> 'all
;     op = 'UnivariatePolynomial => LIST a
;     op = 'Variable       => LIST a
;     MEMQ(op,'(MultivariatePolynomial DistributedMultivariatePolynomial
;       HomogeneousDistributedMultivariatePolynomial)) => a
;     NIL
;   NIL
 
(DEFUN |isPolynomialMode| (|m|)
  (PROG (|op| |ISTMP#1| |a| |rargs|)
    (RETURN
     (COND
      ((AND (CONSP |m|)
            (PROGN
             (SETQ |op| (CAR |m|))
             (SETQ |ISTMP#1| (CDR |m|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |a| (CAR |ISTMP#1|))
                   (SETQ |rargs| (CDR |ISTMP#1|))
                   #1='T))))
       (PROGN
        (SETQ |a| (|removeQuote| |a|))
        (COND
         ((MEMQ |op|
                '(|Polynomial| |RationalFunction| |AlgebraicFunction|
                  |Expression| |ElementaryFunction| |LiouvillianFunction|
                  |FunctionalExpression| |CombinatorialFunction|))
          '|all|)
         ((EQ |op| '|UnivariatePolynomial|) (LIST |a|))
         ((EQ |op| '|Variable|) (LIST |a|))
         ((MEMQ |op|
                '(|MultivariatePolynomial| |DistributedMultivariatePolynomial|
                  |HomogeneousDistributedMultivariatePolynomial|))
          |a|)
         (#1# NIL))))
      (#1# NIL)))))
 
; containsPolynomial m ==
;   not PAIRP(m) => NIL
;   [d,:.] := m
;   d in $univariateDomains or d in $multivariateDomains or
;     d in '(Polynomial RationalFunction) => true
;   (m' := underDomainOf m) and containsPolynomial m'
 
(DEFUN |containsPolynomial| (|m|)
  (PROG (|d| |m'|)
    (RETURN
     (COND ((NULL (CONSP |m|)) NIL)
           (#1='T
            (PROGN
             (SETQ |d| (CAR |m|))
             (COND
              ((OR (|member| |d| |$univariateDomains|)
                   (|member| |d| |$multivariateDomains|)
                   (|member| |d| '(|Polynomial| |RationalFunction|)))
               T)
              (#1#
               (AND (SETQ |m'| (|underDomainOf| |m|))
                    (|containsPolynomial| |m'|))))))))))
 
; containsVariables m ==
;   not PAIRP(m) => NIL
;   [d,:.] := m
;   d in $univariateDomains or d in $multivariateDomains => true
;   (m' := underDomainOf m) and containsVariables m'
 
(DEFUN |containsVariables| (|m|)
  (PROG (|d| |m'|)
    (RETURN
     (COND ((NULL (CONSP |m|)) NIL)
           (#1='T
            (PROGN
             (SETQ |d| (CAR |m|))
             (COND
              ((OR (|member| |d| |$univariateDomains|)
                   (|member| |d| |$multivariateDomains|))
               T)
              (#1#
               (AND (SETQ |m'| (|underDomainOf| |m|))
                    (|containsVariables| |m'|))))))))))
 
; listOfDuplicates l ==
;   l is [x,:l'] =>
;     x in l' => [x,:listOfDuplicates deleteAll(x,l')]
;     listOfDuplicates l'
 
(DEFUN |listOfDuplicates| (|l|)
  (PROG (|x| |l'|)
    (RETURN
     (COND
      ((AND (CONSP |l|)
            (PROGN (SETQ |x| (CAR |l|)) (SETQ |l'| (CDR |l|)) #1='T))
       (IDENTITY
        (COND
         ((|member| |x| |l'|)
          (CONS |x| (|listOfDuplicates| (|deleteAll| |x| |l'|))))
         (#1# (|listOfDuplicates| |l'|)))))))))
 
; deleteAll(x,l) ==
;   null l => nil
;   x = first(l) => deleteAll(x, rest l)
;   [first l,:deleteAll(x,rest l)]
 
(DEFUN |deleteAll| (|x| |l|)
  (PROG ()
    (RETURN
     (COND ((NULL |l|) NIL) ((EQUAL |x| (CAR |l|)) (|deleteAll| |x| (CDR |l|)))
           ('T (CONS (CAR |l|) (|deleteAll| |x| (CDR |l|))))))))
