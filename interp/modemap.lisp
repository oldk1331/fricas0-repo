 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; addDomain(domain,e) ==
;   atom domain =>
;     EQ(domain,"$EmptyMode") => e
;     EQ(domain,"$NoValueMode") => e
;     not IDENTP domain or 2<#(s:= STRINGIMAGE domain) and
;       EQ(char "#",s.(0)) and EQ(char "#",s.(1)) => e
;     MEMQ(domain,getDomainsInScope e) => e
;     isLiteral(domain,e) => e
;     addNewDomain(domain,e)
;   (name:= first domain)='Category => e
;   domainMember(domain,getDomainsInScope e) => e
;   getmode(name,e) is ["Mapping",target,:.] and isCategoryForm(target,e)=>
;       addNewDomain(domain,e)
;     -- constructor? test needed for domains compiled with $bootStrapMode=true
;   isFunctor name or constructor? name => addNewDomain(domain,e)
;   if not isCategoryForm(domain,e) and
;     not member(name,'(Mapping CATEGORY)) then
;       unknownTypeError name
;   e        --is not a functor
 
(DEFUN |addDomain| (|domain| |e|)
  (PROG (|s| |name| |ISTMP#1| |ISTMP#2| |target|)
    (RETURN
     (COND
      ((ATOM |domain|)
       (COND ((EQ |domain| '|$EmptyMode|) |e|)
             ((EQ |domain| '|$NoValueMode|) |e|)
             ((OR (NULL (IDENTP |domain|))
                  (AND (< 2 (LENGTH (SETQ |s| (STRINGIMAGE |domain|))))
                       (EQ (|char| '|#|) (ELT |s| 0))
                       (EQ (|char| '|#|) (ELT |s| 1))))
              |e|)
             ((MEMQ |domain| (|getDomainsInScope| |e|)) |e|)
             ((|isLiteral| |domain| |e|) |e|)
             (#1='T (|addNewDomain| |domain| |e|))))
      ((EQ (SETQ |name| (CAR |domain|)) '|Category|) |e|)
      ((|domainMember| |domain| (|getDomainsInScope| |e|)) |e|)
      ((AND
        (PROGN
         (SETQ |ISTMP#1| (|getmode| |name| |e|))
         (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|Mapping|)
              (PROGN
               (SETQ |ISTMP#2| (CDR |ISTMP#1|))
               (AND (CONSP |ISTMP#2|)
                    (PROGN (SETQ |target| (CAR |ISTMP#2|)) #1#)))))
        (|isCategoryForm| |target| |e|))
       (|addNewDomain| |domain| |e|))
      ((OR (|isFunctor| |name|) (|constructor?| |name|))
       (|addNewDomain| |domain| |e|))
      (#1#
       (PROGN
        (COND
         ((AND (NULL (|isCategoryForm| |domain| |e|))
               (NULL (|member| |name| '(|Mapping| CATEGORY))))
          (|unknownTypeError| |name|)))
        |e|))))))
 
; domainMember(dom,domList) == or/[modeEqual(dom,d) for d in domList]
 
(DEFUN |domainMember| (|dom| |domList|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#2| |bfVar#1| |d|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#1|) (PROGN (SETQ |d| (CAR |bfVar#1|)) NIL))
           (RETURN |bfVar#2|))
          ('T
           (PROGN
            (SETQ |bfVar#2| (|modeEqual| |dom| |d|))
            (COND (|bfVar#2| (RETURN |bfVar#2|))))))
         (SETQ |bfVar#1| (CDR |bfVar#1|))))
      NIL |domList| NIL))))
 
; getModemap(x is [op,:.],e) ==
;   for modemap in get(op,'modemap,e) repeat
;     if u:= compApplyModemap(x,modemap,e,nil) then return
;       ([.,.,sl]:= u; SUBLIS(sl,modemap))
 
(DEFUN |getModemap| (|x| |e|)
  (PROG (|op| |u| |sl|)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |x|))
      ((LAMBDA (|bfVar#3| |modemap|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#3|) (PROGN (SETQ |modemap| (CAR |bfVar#3|)) NIL))
            (RETURN NIL))
           ('T
            (COND
             ((SETQ |u| (|compApplyModemap| |x| |modemap| |e| NIL))
              (RETURN
               (PROGN (SETQ |sl| (CADDR |u|)) (SUBLIS |sl| |modemap|)))))))
          (SETQ |bfVar#3| (CDR |bfVar#3|))))
       (|get| |op| '|modemap| |e|) NIL)))))
 
; getModemapList(op,numOfArgs,e) ==
;   op is ['elt,D,op'] => getModemapListFromDomain(op',numOfArgs,D,e)
;   [mm for
;     (mm:= [[.,.,:sigl],:.]) in get(op,'modemap,e) | numOfArgs=#sigl]
 
(DEFUN |getModemapList| (|op| |numOfArgs| |e|)
  (PROG (|ISTMP#1| D |ISTMP#2| |op'| |sigl|)
    (RETURN
     (COND
      ((AND (CONSP |op|) (EQ (CAR |op|) '|elt|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |op|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ D (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |op'| (CAR |ISTMP#2|)) #1='T))))))
       (|getModemapListFromDomain| |op'| |numOfArgs| D |e|))
      (#1#
       ((LAMBDA (|bfVar#5| |bfVar#4| |mm|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#4|) (PROGN (SETQ |mm| (CAR |bfVar#4|)) NIL))
             (RETURN (NREVERSE |bfVar#5|)))
            (#1#
             (AND (CONSP |mm|)
                  (PROGN
                   (SETQ |ISTMP#1| (CAR |mm|))
                   (AND (CONSP |ISTMP#1|)
                        (PROGN
                         (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                         (AND (CONSP |ISTMP#2|)
                              (PROGN (SETQ |sigl| (CDR |ISTMP#2|)) #1#)))))
                  (EQL |numOfArgs| (LENGTH |sigl|))
                  (SETQ |bfVar#5| (CONS |mm| |bfVar#5|)))))
           (SETQ |bfVar#4| (CDR |bfVar#4|))))
        NIL (|get| |op| '|modemap| |e|) NIL))))))
 
; getModemapListFromDomain(op,numOfArgs,D,e) ==
;   [mm
;     for (mm:= [[dc,:sig],:.]) in get(op,'modemap,e) | dc=D and #rest sig=
;       numOfArgs]
 
(DEFUN |getModemapListFromDomain| (|op| |numOfArgs| D |e|)
  (PROG (|ISTMP#1| |dc| |sig|)
    (RETURN
     ((LAMBDA (|bfVar#7| |bfVar#6| |mm|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#6|) (PROGN (SETQ |mm| (CAR |bfVar#6|)) NIL))
           (RETURN (NREVERSE |bfVar#7|)))
          (#1='T
           (AND (CONSP |mm|)
                (PROGN
                 (SETQ |ISTMP#1| (CAR |mm|))
                 (AND (CONSP |ISTMP#1|)
                      (PROGN
                       (SETQ |dc| (CAR |ISTMP#1|))
                       (SETQ |sig| (CDR |ISTMP#1|))
                       #1#)))
                (EQUAL |dc| D) (EQL (LENGTH (CDR |sig|)) |numOfArgs|)
                (SETQ |bfVar#7| (CONS |mm| |bfVar#7|)))))
         (SETQ |bfVar#6| (CDR |bfVar#6|))))
      NIL (|get| |op| '|modemap| |e|) NIL))))
 
; addModemapKnown(op,mc,sig,pred,fn,$e) ==
; --  if knownInfo pred then pred:=true
; --  that line is handled elsewhere
;   $insideCapsuleFunctionIfTrue=true =>
;     $CapsuleModemapFrame :=
;       addModemap0(op,mc,sig,pred,fn,$CapsuleModemapFrame)
;     $e
;   addModemap0(op,mc,sig,pred,fn,$e)
 
(DEFUN |addModemapKnown| (|op| |mc| |sig| |pred| |fn| |$e|)
  (DECLARE (SPECIAL |$e|))
  (PROG ()
    (RETURN
     (COND
      ((EQUAL |$insideCapsuleFunctionIfTrue| T)
       (PROGN
        (SETQ |$CapsuleModemapFrame|
                (|addModemap0| |op| |mc| |sig| |pred| |fn|
                 |$CapsuleModemapFrame|))
        |$e|))
      ('T (|addModemap0| |op| |mc| |sig| |pred| |fn| |$e|))))))
 
; addModemap0(op,mc,sig,pred,fn,e) ==
;   --mc is the "mode of computation"; fn the "implementation"
;   $functorForm is ['CategoryDefaults,:.] and mc="$" => e
;     --don't put CD modemaps into environment
;   --fn is ['Subsumed,:.] => e  -- don't skip subsumed modemaps
;                                -- breaks -:($,$)->U($,failed) in DP
;   op='elt or op='setelt => addEltModemap(op,mc,sig,pred,fn,e)
;   addModemap1(op,mc,sig,pred,fn,e)
 
(DEFUN |addModemap0| (|op| |mc| |sig| |pred| |fn| |e|)
  (PROG ()
    (RETURN
     (COND
      ((AND (CONSP |$functorForm|)
            (EQ (CAR |$functorForm|) '|CategoryDefaults|) (EQ |mc| '$))
       |e|)
      ((OR (EQ |op| '|elt|) (EQ |op| '|setelt|))
       (|addEltModemap| |op| |mc| |sig| |pred| |fn| |e|))
      ('T (|addModemap1| |op| |mc| |sig| |pred| |fn| |e|))))))
 
; addEltModemap(op,mc,sig,pred,fn,e) ==
;    --hack to change selectors from strings to identifiers; and to
;    --add flag identifiers as literals in the envir
;   op='elt and sig is [:lt,sel] =>
;     STRINGP sel =>
;       id:= INTERN sel
;       if $insideCapsuleFunctionIfTrue=true
;          then $e:= makeLiteral(id,$e)
;          else e:= makeLiteral(id,e)
;       addModemap1(op,mc,[:lt,id],pred,fn,e)
;     -- atom sel => systemErrorHere '"addEltModemap"
;     addModemap1(op,mc,sig,pred,fn,e)
;   op='setelt and sig is [:lt,sel,v] =>
;     STRINGP sel =>
;       id:= INTERN sel
;       if $insideCapsuleFunctionIfTrue=true
;          then $e:= makeLiteral(id,$e)
;          else e:= makeLiteral(id,e)
;       addModemap1(op,mc,[:lt,id,v],pred,fn,e)
;     -- atom sel => systemError '"addEltModemap"
;     addModemap1(op,mc,sig,pred,fn,e)
;   systemErrorHere '"addEltModemap"
 
(DEFUN |addEltModemap| (|op| |mc| |sig| |pred| |fn| |e|)
  (PROG (|ISTMP#1| |sel| |lt| |id| |v| |ISTMP#2|)
    (RETURN
     (COND
      ((AND (EQ |op| '|elt|) (CONSP |sig|)
            (PROGN (SETQ |ISTMP#1| (REVERSE |sig|)) #1='T) (CONSP |ISTMP#1|)
            (PROGN
             (SETQ |sel| (CAR |ISTMP#1|))
             (SETQ |lt| (CDR |ISTMP#1|))
             #1#)
            (PROGN (SETQ |lt| (NREVERSE |lt|)) #1#))
       (COND
        ((STRINGP |sel|)
         (PROGN
          (SETQ |id| (INTERN |sel|))
          (COND
           ((EQUAL |$insideCapsuleFunctionIfTrue| T)
            (SETQ |$e| (|makeLiteral| |id| |$e|)))
           (#1# (SETQ |e| (|makeLiteral| |id| |e|))))
          (|addModemap1| |op| |mc| (APPEND |lt| (CONS |id| NIL)) |pred| |fn|
           |e|)))
        (#1# (|addModemap1| |op| |mc| |sig| |pred| |fn| |e|))))
      ((AND (EQ |op| '|setelt|) (CONSP |sig|)
            (PROGN (SETQ |ISTMP#1| (REVERSE |sig|)) #1#) (CONSP |ISTMP#1|)
            (PROGN
             (SETQ |v| (CAR |ISTMP#1|))
             (SETQ |ISTMP#2| (CDR |ISTMP#1|))
             (AND (CONSP |ISTMP#2|)
                  (PROGN
                   (SETQ |sel| (CAR |ISTMP#2|))
                   (SETQ |lt| (CDR |ISTMP#2|))
                   #1#)))
            (PROGN (SETQ |lt| (NREVERSE |lt|)) #1#))
       (COND
        ((STRINGP |sel|)
         (PROGN
          (SETQ |id| (INTERN |sel|))
          (COND
           ((EQUAL |$insideCapsuleFunctionIfTrue| T)
            (SETQ |$e| (|makeLiteral| |id| |$e|)))
           (#1# (SETQ |e| (|makeLiteral| |id| |e|))))
          (|addModemap1| |op| |mc| (APPEND |lt| (CONS |id| (CONS |v| NIL)))
           |pred| |fn| |e|)))
        (#1# (|addModemap1| |op| |mc| |sig| |pred| |fn| |e|))))
      (#1# (|systemErrorHere| "addEltModemap"))))))
 
; addModemap1(op,mc,sig,pred,fn,e) ==
;    --mc is the "mode of computation"; fn the "implementation"
;   if mc='Rep then
; --     if fn is [kind,'Rep,.] and
;                -- save old sig for NRUNTIME
; --       (kind = 'ELT or kind = 'CONST) then fn:=[kind,'Rep,sig]
;      sig:= substitute("$",'Rep,sig)
;   currentProplist:= getProplist(op,e) or nil
;   newModemapList:=
;     mkNewModemapList(mc,sig,pred,fn,LASSOC('modemap,currentProplist),e,nil)
;   newProplist:= augProplist(currentProplist,'modemap,newModemapList)
;   unErrorRef op
;         --There may have been a warning about op having no value
;   addBinding(op, newProplist, e)
 
(DEFUN |addModemap1| (|op| |mc| |sig| |pred| |fn| |e|)
  (PROG (|currentProplist| |newModemapList| |newProplist|)
    (RETURN
     (PROGN
      (COND ((EQ |mc| '|Rep|) (SETQ |sig| (|substitute| '$ '|Rep| |sig|))))
      (SETQ |currentProplist| (OR (|getProplist| |op| |e|) NIL))
      (SETQ |newModemapList|
              (|mkNewModemapList| |mc| |sig| |pred| |fn|
               (LASSOC '|modemap| |currentProplist|) |e| NIL))
      (SETQ |newProplist|
              (|augProplist| |currentProplist| '|modemap| |newModemapList|))
      (|unErrorRef| |op|)
      (|addBinding| |op| |newProplist| |e|)))))
 
; mkNewModemapList(mc,sig,pred,fn,curModemapList,e,filenameOrNil) ==
;   entry:= [map:= [mc,:sig],[pred,fn],:filenameOrNil]
;   member(entry,curModemapList) => curModemapList
;   (oldMap:= assoc(map,curModemapList)) and oldMap is [.,[opred, =fn],:.] =>
;     $forceAdd => mergeModemap(entry,curModemapList,e)
;     opred=true => curModemapList
;     if pred~=true and pred~=opred then pred:= ["OR",pred,opred]
;     [if x=oldMap then [map,[pred,fn],:filenameOrNil] else x
; 
;   --if new modemap less general, put at end; otherwise, at front
;       for x in curModemapList]
;   $InteractiveMode => insertModemap(entry,curModemapList)
;   mergeModemap(entry,curModemapList,e)
 
(DEFUN |mkNewModemapList|
       (|mc| |sig| |pred| |fn| |curModemapList| |e| |filenameOrNil|)
  (PROG (|map| |entry| |oldMap| |ISTMP#1| |ISTMP#2| |opred| |ISTMP#3|)
    (RETURN
     (PROGN
      (SETQ |entry|
              (CONS (SETQ |map| (CONS |mc| |sig|))
                    (CONS (LIST |pred| |fn|) |filenameOrNil|)))
      (COND ((|member| |entry| |curModemapList|) |curModemapList|)
            ((AND (SETQ |oldMap| (|assoc| |map| |curModemapList|))
                  (CONSP |oldMap|)
                  (PROGN
                   (SETQ |ISTMP#1| (CDR |oldMap|))
                   (AND (CONSP |ISTMP#1|)
                        (PROGN
                         (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                         (AND (CONSP |ISTMP#2|)
                              (PROGN
                               (SETQ |opred| (CAR |ISTMP#2|))
                               (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                               (AND (CONSP |ISTMP#3|) (EQ (CDR |ISTMP#3|) NIL)
                                    (EQUAL (CAR |ISTMP#3|) |fn|))))))))
             (COND (|$forceAdd| (|mergeModemap| |entry| |curModemapList| |e|))
                   ((EQUAL |opred| T) |curModemapList|)
                   (#1='T
                    (PROGN
                     (COND
                      ((AND (NOT (EQUAL |pred| T))
                            (NOT (EQUAL |pred| |opred|)))
                       (SETQ |pred| (LIST 'OR |pred| |opred|))))
                     ((LAMBDA (|bfVar#9| |bfVar#8| |x|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#8|)
                               (PROGN (SETQ |x| (CAR |bfVar#8|)) NIL))
                           (RETURN (NREVERSE |bfVar#9|)))
                          (#1#
                           (SETQ |bfVar#9|
                                   (CONS
                                    (COND
                                     ((EQUAL |x| |oldMap|)
                                      (CONS |map|
                                            (CONS (LIST |pred| |fn|)
                                                  |filenameOrNil|)))
                                     (#1# |x|))
                                    |bfVar#9|))))
                         (SETQ |bfVar#8| (CDR |bfVar#8|))))
                      NIL |curModemapList| NIL)))))
            (|$InteractiveMode| (|insertModemap| |entry| |curModemapList|))
            (#1# (|mergeModemap| |entry| |curModemapList| |e|)))))))
 
; mergeModemap(entry is [[mc,:sig],[pred,:.],:.],modemapList,e) ==
;   for (mmtail:= [[[mc',:sig'],[pred',:.],:.],:.]) in tails modemapList repeat
;     mc=mc' or isSuperDomain(mc',mc,e) =>
;       newmm:= nil
;       mm:= modemapList
;       while (not EQ(mm,mmtail)) repeat (newmm:= [first mm,:newmm]; mm:= rest mm)
;       if (mc=mc') and (sig=sig') then
;         --We only need one of these, unless the conditions are hairy
;         not $forceAdd and TruthP pred' =>
;           entry:=nil
;               --the new predicate buys us nothing
;           return modemapList
;         TruthP pred => mmtail:=rest mmtail
;           --the thing we matched against is useless, by comparison
;       modemapList:= NCONC(NREVERSE newmm,[entry,:mmtail])
;       entry:= nil
;       return modemapList
;   if entry then [:modemapList,entry] else modemapList
 
(DEFUN |mergeModemap| (|entry| |modemapList| |e|)
  (PROG (|mc| |sig| |pred| |ISTMP#1| |ISTMP#2| |mc'| |sig'| |ISTMP#3| |ISTMP#4|
         |pred'| |newmm| |mm|)
    (RETURN
     (PROGN
      (SETQ |mc| (CAAR . #1=(|entry|)))
      (SETQ |sig| (CDAR . #1#))
      (SETQ |pred| (CAADR |entry|))
      ((LAMBDA (|mmtail|)
         (LOOP
          (COND ((ATOM |mmtail|) (RETURN NIL))
                (#2='T
                 (AND (CONSP |mmtail|)
                      (PROGN
                       (SETQ |ISTMP#1| (CAR |mmtail|))
                       (AND (CONSP |ISTMP#1|)
                            (PROGN
                             (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                             (AND (CONSP |ISTMP#2|)
                                  (PROGN
                                   (SETQ |mc'| (CAR |ISTMP#2|))
                                   (SETQ |sig'| (CDR |ISTMP#2|))
                                   #2#)))
                            (PROGN
                             (SETQ |ISTMP#3| (CDR |ISTMP#1|))
                             (AND (CONSP |ISTMP#3|)
                                  (PROGN
                                   (SETQ |ISTMP#4| (CAR |ISTMP#3|))
                                   (AND (CONSP |ISTMP#4|)
                                        (PROGN
                                         (SETQ |pred'| (CAR |ISTMP#4|))
                                         #2#)))))))
                      (COND
                       ((OR (EQUAL |mc| |mc'|)
                            (|isSuperDomain| |mc'| |mc| |e|))
                        (IDENTITY
                         (PROGN
                          (SETQ |newmm| NIL)
                          (SETQ |mm| |modemapList|)
                          ((LAMBDA ()
                             (LOOP
                              (COND ((EQ |mm| |mmtail|) (RETURN NIL))
                                    (#2#
                                     (PROGN
                                      (SETQ |newmm| (CONS (CAR |mm|) |newmm|))
                                      (SETQ |mm| (CDR |mm|))))))))
                          (COND
                           ((AND (EQUAL |mc| |mc'|) (EQUAL |sig| |sig'|))
                            (COND
                             ((AND (NULL |$forceAdd|) (|TruthP| |pred'|))
                              (PROGN
                               (SETQ |entry| NIL)
                               (RETURN |modemapList|)))
                             ((|TruthP| |pred|)
                              (SETQ |mmtail| (CDR |mmtail|))))))
                          (SETQ |modemapList|
                                  (NCONC (NREVERSE |newmm|)
                                         (CONS |entry| |mmtail|)))
                          (SETQ |entry| NIL)
                          (RETURN |modemapList|))))))))
          (SETQ |mmtail| (CDR |mmtail|))))
       |modemapList|)
      (COND (|entry| (APPEND |modemapList| (CONS |entry| NIL)))
            (#2# |modemapList|))))))
 
; isSuperDomain(domainForm,domainForm',e) ==
;   isSubset(domainForm',domainForm,e) => true
;   domainForm='Rep and domainForm'="$" => true --regard $ as a subdomain of Rep
;   LASSOC(opOf domainForm',get(domainForm,"SubDomain",e))
 
(DEFUN |isSuperDomain| (|domainForm| |domainForm'| |e|)
  (PROG ()
    (RETURN
     (COND ((|isSubset| |domainForm'| |domainForm| |e|) T)
           ((AND (EQ |domainForm| '|Rep|) (EQ |domainForm'| '$)) T)
           ('T
            (LASSOC (|opOf| |domainForm'|)
             (|get| |domainForm| '|SubDomain| |e|)))))))
 
; addNewDomain(domain,e) ==
;   augModemapsFromDomain(domain,domain,e)
 
(DEFUN |addNewDomain| (|domain| |e|)
  (PROG () (RETURN (|augModemapsFromDomain| |domain| |domain| |e|))))
 
; augModemapsFromDomain(name,functorForm,e) ==
;   member(IFCAR name or name, $DummyFunctorNames) => e
;   name=$Category or isCategoryForm(name,e) => e
;   member(name,curDomainsInScope:= getDomainsInScope e) => e
;   if u:= GETDATABASE(opOf functorForm,'SUPERDOMAIN) then
;     e:= addNewDomain(first u,e)
;     --need code to handle parameterized SuperDomains
;   if innerDom:= listOrVectorElementMode name then e:= addDomain(innerDom,e)
;   if name is ["Union",:dl] then for d in stripUnionTags dl
;                          repeat e:= addDomain(d,e)
;   augModemapsFromDomain1(name,functorForm,e)
 
(DEFUN |augModemapsFromDomain| (|name| |functorForm| |e|)
  (PROG (|curDomainsInScope| |u| |innerDom| |dl|)
    (RETURN
     (COND ((|member| (OR (IFCAR |name|) |name|) |$DummyFunctorNames|) |e|)
           ((OR (EQUAL |name| |$Category|) (|isCategoryForm| |name| |e|)) |e|)
           ((|member| |name|
             (SETQ |curDomainsInScope| (|getDomainsInScope| |e|)))
            |e|)
           (#1='T
            (PROGN
             (COND
              ((SETQ |u| (GETDATABASE (|opOf| |functorForm|) 'SUPERDOMAIN))
               (SETQ |e| (|addNewDomain| (CAR |u|) |e|))))
             (COND
              ((SETQ |innerDom| (|listOrVectorElementMode| |name|))
               (SETQ |e| (|addDomain| |innerDom| |e|))))
             (COND
              ((AND (CONSP |name|) (EQ (CAR |name|) '|Union|)
                    (PROGN (SETQ |dl| (CDR |name|)) #1#))
               ((LAMBDA (|bfVar#10| |d|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#10|)
                         (PROGN (SETQ |d| (CAR |bfVar#10|)) NIL))
                     (RETURN NIL))
                    (#1# (SETQ |e| (|addDomain| |d| |e|))))
                   (SETQ |bfVar#10| (CDR |bfVar#10|))))
                (|stripUnionTags| |dl|) NIL)))
             (|augModemapsFromDomain1| |name| |functorForm| |e|)))))))
 
; substituteCategoryArguments(argl,catform) ==
;   argl:= substitute("$$","$",argl)
;   arglAssoc:= [[INTERNL("#",STRINGIMAGE i),:a] for i in 1.. for a in argl]
;   SUBLIS(arglAssoc,catform)
 
(DEFUN |substituteCategoryArguments| (|argl| |catform|)
  (PROG (|arglAssoc|)
    (RETURN
     (PROGN
      (SETQ |argl| (|substitute| '$$ '$ |argl|))
      (SETQ |arglAssoc|
              ((LAMBDA (|bfVar#12| |i| |bfVar#11| |a|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#11|)
                        (PROGN (SETQ |a| (CAR |bfVar#11|)) NIL))
                    (RETURN (NREVERSE |bfVar#12|)))
                   ('T
                    (SETQ |bfVar#12|
                            (CONS (CONS (INTERNL '|#| (STRINGIMAGE |i|)) |a|)
                                  |bfVar#12|))))
                  (SETQ |i| (+ |i| 1))
                  (SETQ |bfVar#11| (CDR |bfVar#11|))))
               NIL 1 |argl| NIL))
      (SUBLIS |arglAssoc| |catform|)))))
 
; augModemapsFromCategory(domainName,domainView,functorForm,categoryForm,e) ==
;   [fnAlist,e]:= evalAndSub(domainName,domainView,functorForm,categoryForm,e)
;   --if not $InteractiveMode then
;   compilerMessage ["Adding ",domainName," modemaps"]
;   e:= putDomainsInScope(domainName,e)
;   condlist:=[]
;   for [[op,sig,:.],cond,fnsel] in fnAlist repeat
; --  e:= addModemap(op,domainName,sig,cond,fnsel,e)
; ---------next 5 lines commented out to avoid wasting time checking knownInfo on
; ---------conditions attached to each modemap being added, takes a very long time
; ---------instead conditions will be checked when maps are actually used
;   --v:= assoc(cond,condlist) =>
;   --  e:= addModemapKnown(op, domainName, sig, rest v, fnsel, e)
;   --$e:local := e  -- $e is used by knownInfo
;   --if knownInfo cond then cond1:=true else cond1:=cond
;   --condlist:=[[cond,:cond1],:condlist]
;     e:= addModemapKnown(op,domainName,sig,cond,fnsel,e) -- cond was cond1
; --  for u in sig | (not member(u,$DomainsInScope)) and
; --                   (not atom u) and
; --                     (not isCategoryForm(u,e)) do
; --     e:= addNewDomain(u,e)
;   e
 
(DEFUN |augModemapsFromCategory|
       (|domainName| |domainView| |functorForm| |categoryForm| |e|)
  (PROG (|LETTMP#1| |fnAlist| |condlist| |ISTMP#1| |op| |ISTMP#2| |sig|
         |ISTMP#3| |cond| |ISTMP#4| |fnsel|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1|
              (|evalAndSub| |domainName| |domainView| |functorForm|
               |categoryForm| |e|))
      (SETQ |fnAlist| (CAR |LETTMP#1|))
      (SETQ |e| (CADR |LETTMP#1|))
      (|compilerMessage| (LIST '|Adding | |domainName| '| modemaps|))
      (SETQ |e| (|putDomainsInScope| |domainName| |e|))
      (SETQ |condlist| NIL)
      ((LAMBDA (|bfVar#14| |bfVar#13|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#14|)
                (PROGN (SETQ |bfVar#13| (CAR |bfVar#14|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#13|)
                 (PROGN
                  (SETQ |ISTMP#1| (CAR |bfVar#13|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |op| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|)
                             (PROGN (SETQ |sig| (CAR |ISTMP#2|)) #1#)))))
                 (PROGN
                  (SETQ |ISTMP#3| (CDR |bfVar#13|))
                  (AND (CONSP |ISTMP#3|)
                       (PROGN
                        (SETQ |cond| (CAR |ISTMP#3|))
                        (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                        (AND (CONSP |ISTMP#4|) (EQ (CDR |ISTMP#4|) NIL)
                             (PROGN (SETQ |fnsel| (CAR |ISTMP#4|)) #1#)))))
                 (SETQ |e|
                         (|addModemapKnown| |op| |domainName| |sig| |cond|
                          |fnsel| |e|)))))
          (SETQ |bfVar#14| (CDR |bfVar#14|))))
       |fnAlist| NIL)
      |e|))))
 
; evalAndSub(domainName,viewName,functorForm,form,$e) ==
;   isCategory form => [substNames(domainName,viewName,functorForm,form.(1)),$e]
;   --next lines necessary-- see MPOLY for which $ is actual arg. --- RDJ 3/83
;   if CONTAINED("$$",form) then $e:= put("$$","mode",get("$","mode",$e),$e)
;   opAlist:= getOperationAlist(domainName,functorForm,form)
;   substAlist:= substNames(domainName,viewName,functorForm,opAlist)
;   [substAlist,$e]
 
(DEFUN |evalAndSub| (|domainName| |viewName| |functorForm| |form| |$e|)
  (DECLARE (SPECIAL |$e|))
  (PROG (|opAlist| |substAlist|)
    (RETURN
     (COND
      ((|isCategory| |form|)
       (LIST
        (|substNames| |domainName| |viewName| |functorForm| (ELT |form| 1))
        |$e|))
      ('T
       (PROGN
        (COND
         ((CONTAINED '$$ |form|)
          (SETQ |$e| (|put| '$$ '|mode| (|get| '$ '|mode| |$e|) |$e|))))
        (SETQ |opAlist|
                (|getOperationAlist| |domainName| |functorForm| |form|))
        (SETQ |substAlist|
                (|substNames| |domainName| |viewName| |functorForm| |opAlist|))
        (LIST |substAlist| |$e|)))))))
 
; getOperationAlist(name,functorForm,form) ==
;   if atom name and GETDATABASE(name,'NILADIC) then functorForm:= [functorForm]
;   (u:= isFunctor functorForm) and not
;     ($insideFunctorIfTrue and first functorForm=first $functorForm) => u
;   $insideFunctorIfTrue and name="$" =>
;     ($domainShell => $domainShell.(1); systemError '"$ has no shell now")
;   T:= compMakeCategoryObject(form,$e) => ([.,.,$e]:= T; T.expr.(1))
;   stackMessage ["not a category form: ",form]
 
(DEFUN |getOperationAlist| (|name| |functorForm| |form|)
  (PROG (|u| T$)
    (RETURN
     (PROGN
      (COND
       ((AND (ATOM |name|) (GETDATABASE |name| 'NILADIC))
        (SETQ |functorForm| (LIST |functorForm|))))
      (COND
       ((AND (SETQ |u| (|isFunctor| |functorForm|))
             (NULL
              (AND |$insideFunctorIfTrue|
                   (EQUAL (CAR |functorForm|) (CAR |$functorForm|)))))
        |u|)
       ((AND |$insideFunctorIfTrue| (EQ |name| '$))
        (COND (|$domainShell| (ELT |$domainShell| 1))
              (#1='T (|systemError| "$ has no shell now"))))
       ((SETQ T$ (|compMakeCategoryObject| |form| |$e|))
        (PROGN (SETQ |$e| (CADDR T$)) (ELT (CAR T$) 1)))
       (#1# (|stackMessage| (LIST '|not a category form: | |form|))))))))
 
; substNames(domainName,viewName,functorForm,opalist) ==
;   functorForm := SUBSTQ("$$","$", functorForm)
;   nameForDollar :=
;     isCategoryPackageName functorForm => CADR functorForm
;     domainName
; 
;        -- following calls to SUBSTQ must copy to save RPLAC's in
;        -- putInLocalDomainReferences
;   [[:SUBSTQ("$","$$",SUBSTQ(nameForDollar,"$",modemapform)),
;        [sel, viewName,if domainName = "$" then pos else
;                                          CADAR modemapform]]
;      for [:modemapform,[sel,"$",pos]] in
;           EQSUBSTLIST(IFCDR functorForm, $FormalMapVariableList, opalist)]
 
(DEFUN |substNames| (|domainName| |viewName| |functorForm| |opalist|)
  (PROG (|nameForDollar| |ISTMP#1| |ISTMP#2| |sel| |ISTMP#3| |ISTMP#4| |pos|
         |modemapform|)
    (RETURN
     (PROGN
      (SETQ |functorForm| (SUBSTQ '$$ '$ |functorForm|))
      (SETQ |nameForDollar|
              (COND
               ((|isCategoryPackageName| |functorForm|) (CADR |functorForm|))
               (#1='T |domainName|)))
      ((LAMBDA (|bfVar#17| |bfVar#16| |bfVar#15|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#16|)
                (PROGN (SETQ |bfVar#15| (CAR |bfVar#16|)) NIL))
            (RETURN (NREVERSE |bfVar#17|)))
           (#1#
            (AND (CONSP |bfVar#15|)
                 (PROGN (SETQ |ISTMP#1| (REVERSE |bfVar#15|)) #1#)
                 (CONSP |ISTMP#1|)
                 (PROGN
                  (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                  (AND (CONSP |ISTMP#2|)
                       (PROGN
                        (SETQ |sel| (CAR |ISTMP#2|))
                        (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                        (AND (CONSP |ISTMP#3|) (EQ (CAR |ISTMP#3|) '$)
                             (PROGN
                              (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                              (AND (CONSP |ISTMP#4|) (EQ (CDR |ISTMP#4|) NIL)
                                   (PROGN
                                    (SETQ |pos| (CAR |ISTMP#4|))
                                    #1#)))))))
                 (PROGN (SETQ |modemapform| (CDR |ISTMP#1|)) #1#)
                 (PROGN (SETQ |modemapform| (NREVERSE |modemapform|)) #1#)
                 (SETQ |bfVar#17|
                         (CONS
                          (APPEND
                           (SUBSTQ '$ '$$
                            (SUBSTQ |nameForDollar| '$ |modemapform|))
                           (CONS
                            (LIST |sel| |viewName|
                                  (COND ((EQ |domainName| '$) |pos|)
                                        (#1# (CADAR |modemapform|))))
                            NIL))
                          |bfVar#17|)))))
          (SETQ |bfVar#16| (CDR |bfVar#16|))))
       NIL
       (EQSUBSTLIST (IFCDR |functorForm|) |$FormalMapVariableList| |opalist|)
       NIL)))))
 
; compCat(form is [functorName,:argl],m,e) ==
;   fn := GET(functorName, "makeFunctionList") or return nil
;   [funList,e]:= FUNCALL(fn,form,form,e)
;   catForm:=
;     ["Join",'(SetCategory),["CATEGORY","domain",:
;       [["SIGNATURE",op,sig] for [op,sig,.] in funList | op~="="]]]
;   --RDJ: for coercion purposes, it necessary to know it's a Set; I'm not
;   --sure if it uses any of the other signatures(see extendsCategoryForm)
;   [form,catForm,e]
 
(DEFUN |compCat| (|form| |m| |e|)
  (PROG (|functorName| |argl| |fn| |LETTMP#1| |funList| |op| |ISTMP#1| |sig|
         |ISTMP#2| |catForm|)
    (RETURN
     (PROGN
      (SETQ |functorName| (CAR |form|))
      (SETQ |argl| (CDR |form|))
      (SETQ |fn| (OR (GET |functorName| '|makeFunctionList|) (RETURN NIL)))
      (SETQ |LETTMP#1| (FUNCALL |fn| |form| |form| |e|))
      (SETQ |funList| (CAR |LETTMP#1|))
      (SETQ |e| (CADR |LETTMP#1|))
      (SETQ |catForm|
              (LIST '|Join| '(|SetCategory|)
                    (CONS 'CATEGORY
                          (CONS '|domain|
                                ((LAMBDA (|bfVar#20| |bfVar#19| |bfVar#18|)
                                   (LOOP
                                    (COND
                                     ((OR (ATOM |bfVar#19|)
                                          (PROGN
                                           (SETQ |bfVar#18| (CAR |bfVar#19|))
                                           NIL))
                                      (RETURN (NREVERSE |bfVar#20|)))
                                     ('T
                                      (AND (CONSP |bfVar#18|)
                                           (PROGN
                                            (SETQ |op| (CAR |bfVar#18|))
                                            (SETQ |ISTMP#1| (CDR |bfVar#18|))
                                            (AND (CONSP |ISTMP#1|)
                                                 (PROGN
                                                  (SETQ |sig| (CAR |ISTMP#1|))
                                                  (SETQ |ISTMP#2|
                                                          (CDR |ISTMP#1|))
                                                  (AND (CONSP |ISTMP#2|)
                                                       (EQ (CDR |ISTMP#2|)
                                                           NIL)))))
                                           (NOT (EQ |op| '=))
                                           (SETQ |bfVar#20|
                                                   (CONS
                                                    (LIST 'SIGNATURE |op|
                                                          |sig|)
                                                    |bfVar#20|)))))
                                    (SETQ |bfVar#19| (CDR |bfVar#19|))))
                                 NIL |funList| NIL)))))
      (LIST |form| |catForm| |e|)))))
 
; addConstructorModemaps(name,form is [functorName,:.],e) ==
;   $InteractiveMode: local:= nil
;   e:= putDomainsInScope(name,e) --frame
;   fn := GET(functorName, "makeFunctionList")
;   [funList,e]:= FUNCALL(fn,name,form,e)
;   for [op,sig,opcode] in funList repeat
;     if opcode is [sel,dc,n] and sel='ELT then
;           nsig := substitute("$$$",name,sig)
;           nsig := substitute('$,"$$$",substitute("$$",'$,nsig))
;           opcode := [sel,dc,nsig]
;     e:= addModemap(op,name,sig,true,opcode,e)
;   e
 
(DEFUN |addConstructorModemaps| (|name| |form| |e|)
  (PROG (|$InteractiveMode| |nsig| |n| |dc| |sel| |opcode| |ISTMP#2| |sig|
         |ISTMP#1| |op| |funList| |LETTMP#1| |fn| |functorName|)
    (DECLARE (SPECIAL |$InteractiveMode|))
    (RETURN
     (PROGN
      (SETQ |functorName| (CAR |form|))
      (SETQ |$InteractiveMode| NIL)
      (SETQ |e| (|putDomainsInScope| |name| |e|))
      (SETQ |fn| (GET |functorName| '|makeFunctionList|))
      (SETQ |LETTMP#1| (FUNCALL |fn| |name| |form| |e|))
      (SETQ |funList| (CAR |LETTMP#1|))
      (SETQ |e| (CADR |LETTMP#1|))
      ((LAMBDA (|bfVar#22| |bfVar#21|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#22|)
                (PROGN (SETQ |bfVar#21| (CAR |bfVar#22|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#21|)
                 (PROGN
                  (SETQ |op| (CAR |bfVar#21|))
                  (SETQ |ISTMP#1| (CDR |bfVar#21|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |sig| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                             (PROGN (SETQ |opcode| (CAR |ISTMP#2|)) #1#)))))
                 (PROGN
                  (COND
                   ((AND (CONSP |opcode|)
                         (PROGN
                          (SETQ |sel| (CAR |opcode|))
                          (SETQ |ISTMP#1| (CDR |opcode|))
                          (AND (CONSP |ISTMP#1|)
                               (PROGN
                                (SETQ |dc| (CAR |ISTMP#1|))
                                (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                     (PROGN (SETQ |n| (CAR |ISTMP#2|)) #1#)))))
                         (EQ |sel| 'ELT))
                    (SETQ |nsig| (|substitute| '$$$ |name| |sig|))
                    (SETQ |nsig|
                            (|substitute| '$ '$$$
                             (|substitute| '$$ '$ |nsig|)))
                    (SETQ |opcode| (LIST |sel| |dc| |nsig|))))
                  (SETQ |e|
                          (|addModemap| |op| |name| |sig| T |opcode| |e|))))))
          (SETQ |bfVar#22| (CDR |bfVar#22|))))
       |funList| NIL)
      |e|))))
 
; getDomainsInScope e ==
;   $insideCapsuleFunctionIfTrue=true => $CapsuleDomainsInScope
;   get("$DomainsInScope","special",e)
 
(DEFUN |getDomainsInScope| (|e|)
  (PROG ()
    (RETURN
     (COND ((EQUAL |$insideCapsuleFunctionIfTrue| T) |$CapsuleDomainsInScope|)
           ('T (|get| '|$DomainsInScope| '|special| |e|))))))
 
; putDomainsInScope(x,e) ==
;   l:= getDomainsInScope e
;   if member(x,l) then SAY("****** Domain: ",x," already in scope")
;   newValue:= [x,:delete(x,l)]
;   $insideCapsuleFunctionIfTrue => ($CapsuleDomainsInScope:= newValue; e)
;   put("$DomainsInScope","special",newValue,e)
 
(DEFUN |putDomainsInScope| (|x| |e|)
  (PROG (|l| |newValue|)
    (RETURN
     (PROGN
      (SETQ |l| (|getDomainsInScope| |e|))
      (COND
       ((|member| |x| |l|) (SAY '|****** Domain: | |x| '| already in scope|)))
      (SETQ |newValue| (CONS |x| (|delete| |x| |l|)))
      (COND
       (|$insideCapsuleFunctionIfTrue|
        (PROGN (SETQ |$CapsuleDomainsInScope| |newValue|) |e|))
       ('T (|put| '|$DomainsInScope| '|special| |newValue| |e|)))))))
