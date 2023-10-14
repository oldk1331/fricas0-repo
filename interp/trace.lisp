 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; DEFPARAMETER($traceNoisely, NIL)  -- give trace and untrace messages
 
(DEFPARAMETER |$traceNoisely| NIL)
 
; DEFPARAMETER($reportSpadTrace, NIL)  -- reports traced funs
 
(DEFPARAMETER |$reportSpadTrace| NIL)
 
; DEFPARAMETER($optionAlist, NIL)
 
(DEFPARAMETER |$optionAlist| NIL)
 
; DEFPARAMETER($tracedMapSignatures, NIL)
 
(DEFPARAMETER |$tracedMapSignatures| NIL)
 
; DEFPARAMETER($traceOptionList, '(
;     after _
;     before _
;     break_
;     cond_
;     count_
;     depth_
;     local_
;     mathprint _
;     nonquietly_
;     nt_
;     of_
;     only_
;     ops_
;     restore_
;     timer_
;     varbreak _
;     vars_
;     within _
;     ))
 
(DEFPARAMETER |$traceOptionList|
  '(|after| |before| |break| |cond| |count| |depth| |local| |mathprint|
    |nonquietly| |nt| OF |only| |ops| |restore| |timer| |varbreak| |vars|
    |within|))
 
; DEFPARAMETER($domainTraceNameAssoc, NIL)
 
(DEFPARAMETER |$domainTraceNameAssoc| NIL)
 
; DEFPARAMETER($lastUntraced, NIL)
 
(DEFPARAMETER |$lastUntraced| NIL)
 
; DEFPARAMETER($tracedModemap, NIL)
 
(DEFPARAMETER |$tracedModemap| NIL)
 
; trace l == traceSpad2Cmd l
 
(DEFUN |trace| (|l|) (PROG () (RETURN (|traceSpad2Cmd| |l|))))
 
; traceSpad2Cmd l ==
;   if l is ['Tuple, l1] then l := l1
;   $mapSubNameAlist:= getMapSubNames(l)
;   trace1(augmentTraceNames(l, $mapSubNameAlist), $options)
;   traceReply()
 
(DEFUN |traceSpad2Cmd| (|l|)
  (PROG (|ISTMP#1| |l1|)
    (RETURN
     (PROGN
      (COND
       ((AND (CONSP |l|) (EQ (CAR |l|) '|Tuple|)
             (PROGN
              (SETQ |ISTMP#1| (CDR |l|))
              (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                   (PROGN (SETQ |l1| (CAR |ISTMP#1|)) 'T))))
        (SETQ |l| |l1|)))
      (SETQ |$mapSubNameAlist| (|getMapSubNames| |l|))
      (|trace1| (|augmentTraceNames| |l| |$mapSubNameAlist|) |$options|)
      (|traceReply|)))))
 
; trace1(l, options) ==
;   $traceNoisely: local := NIL
;   if hasOption(options, 'nonquietly) then $traceNoisely := true
;   hasOption(options, 'off) =>
;     (ops := hasOption(options, 'ops)) or
;       (lops := hasOption(options, 'local)) =>
;         null l => throwKeyedMsg("S2IT0019",NIL)
;         constructor := unabbrev
;           atom l => l
;           null rest l =>
;             atom first l => first l
;             first first l
;           NIL
;         not(isFunctor constructor) => throwKeyedMsg("S2IT0020",NIL)
;         if ops then
;           ops := getTraceOption ops
;           NIL
;         if lops then
;           lops := rest getTraceOption lops
;           untraceDomainLocalOps(constructor,lops)
;     (1 < #options) and not hasOption(options, 'nonquietly) =>
;       throwKeyedMsg("S2IT0021",NIL)
;     untrace l
;     clearConstructorCaches()
;   hasOption(options, 'stats) =>
;     (1 < #options) =>
;       throwKeyedMsg("S2IT0001",['")trace ... )stats"])
;     [., :opt] := first options
;     -- look for )trace )stats       to list the statistics
;     --          )trace )stats reset to reset them
;     null opt =>      -- list the statistics
;       centerAndHighlight('"Traced function execution times",78,"-")
;       ptimers ()
;       SAY '" "
;       centerAndHighlight('"Traced function execution counts",78,"-")
;       pcounters ()
;     selectOptionLC(first opt,'(reset),'optionError)
;     resetSpacers()
;     resetTimers()
;     resetCounters()
;     throwKeyedMsg("S2IT0002",NIL)
;   a:= hasOption(options, 'restore) =>
;     null(oldL:= $lastUntraced) => nil
;     newOptions := delete(a, options)
;     null l => trace1 oldL
;     for x in l repeat
;       x is [domain,:opList] and VECP domain =>
;         sayKeyedMsg("S2IT0003",[devaluate domain])
;       options := [:newOptions, :LASSOC(x, $optionAlist)]
;       trace1(LIST x, options)
;   null l => nil
;   l is ["?"] => _?t()
;   traceList:= [transTraceItem x for x in l] or return nil
;   for x in traceList repeat $optionAlist:=
;     ADDASSOC(x, options, $optionAlist)
;   optionList:= getTraceOptions(options)
;   if (domainList := LASSOC("of", optionList)) then
;       LASSOC("ops", optionList) =>
;         throwKeyedMsg("S2IT0004", NIL)
;       opList:=
;         traceList => [["ops", :traceList]]
;         nil
;       varList:=
;         y:= LASSOC("vars", optionList) => [["vars", :y]]
;         nil
;       optionList := [:opList, :varList]
;       traceList := domainList
;   for funName in traceList repeat
;       _/TRACE_-2(funName, optionList)
;   saveMapSig(traceList)
 
(DEFUN |trace1| (|l| |options|)
  (PROG (|$traceNoisely| |varList| |y| |domainList| |optionList| |traceList|
         |opList| |domain| |newOptions| |oldL| |a| |opt| |LETTMP#1|
         |constructor| |lops| |ops|)
    (DECLARE (SPECIAL |$traceNoisely|))
    (RETURN
     (PROGN
      (SETQ |$traceNoisely| NIL)
      (COND ((|hasOption| |options| '|nonquietly|) (SETQ |$traceNoisely| T)))
      (COND
       ((|hasOption| |options| '|off|)
        (COND
         ((OR (SETQ |ops| (|hasOption| |options| '|ops|))
              (SETQ |lops| (|hasOption| |options| '|local|)))
          (COND ((NULL |l|) (|throwKeyedMsg| 'S2IT0019 NIL))
                (#1='T
                 (PROGN
                  (SETQ |constructor|
                          (|unabbrev|
                           (COND ((ATOM |l|) |l|)
                                 ((NULL (CDR |l|))
                                  (COND ((ATOM (CAR |l|)) (CAR |l|))
                                        (#1# (CAR (CAR |l|)))))
                                 (#1# NIL))))
                  (COND
                   ((NULL (|isFunctor| |constructor|))
                    (|throwKeyedMsg| 'S2IT0020 NIL))
                   (#1#
                    (PROGN
                     (COND (|ops| (SETQ |ops| (|getTraceOption| |ops|)) NIL))
                     (COND
                      (|lops| (SETQ |lops| (CDR (|getTraceOption| |lops|)))
                       (|untraceDomainLocalOps| |constructor| |lops|))))))))))
         ((AND (< 1 (LENGTH |options|))
               (NULL (|hasOption| |options| '|nonquietly|)))
          (|throwKeyedMsg| 'S2IT0021 NIL))
         (#1# (PROGN (|untrace| |l|) (|clearConstructorCaches|)))))
       ((|hasOption| |options| '|stats|)
        (COND
         ((< 1 (LENGTH |options|))
          (|throwKeyedMsg| 'S2IT0001 (LIST ")trace ... )stats")))
         (#1#
          (PROGN
           (SETQ |LETTMP#1| (CAR |options|))
           (SETQ |opt| (CDR |LETTMP#1|))
           (COND
            ((NULL |opt|)
             (PROGN
              (|centerAndHighlight| "Traced function execution times" 78 '-)
              (|ptimers|)
              (SAY " ")
              (|centerAndHighlight| "Traced function execution counts" 78 '-)
              (|pcounters|)))
            (#1#
             (PROGN
              (|selectOptionLC| (CAR |opt|) '(|reset|) '|optionError|)
              (|resetSpacers|)
              (|resetTimers|)
              (|resetCounters|)
              (|throwKeyedMsg| 'S2IT0002 NIL))))))))
       ((SETQ |a| (|hasOption| |options| '|restore|))
        (COND ((NULL (SETQ |oldL| |$lastUntraced|)) NIL)
              (#1#
               (PROGN
                (SETQ |newOptions| (|delete| |a| |options|))
                (COND ((NULL |l|) (|trace1| |oldL|))
                      (#1#
                       ((LAMBDA (|bfVar#1| |x|)
                          (LOOP
                           (COND
                            ((OR (ATOM |bfVar#1|)
                                 (PROGN (SETQ |x| (CAR |bfVar#1|)) NIL))
                             (RETURN NIL))
                            (#1#
                             (COND
                              ((AND (CONSP |x|)
                                    (PROGN
                                     (SETQ |domain| (CAR |x|))
                                     (SETQ |opList| (CDR |x|))
                                     #1#)
                                    (VECP |domain|))
                               (|sayKeyedMsg| 'S2IT0003
                                (LIST (|devaluate| |domain|))))
                              (#1#
                               (PROGN
                                (SETQ |options|
                                        (APPEND |newOptions|
                                                (LASSOC |x| |$optionAlist|)))
                                (|trace1| (LIST |x|) |options|))))))
                           (SETQ |bfVar#1| (CDR |bfVar#1|))))
                        |l| NIL)))))))
       ((NULL |l|) NIL)
       ((AND (CONSP |l|) (EQ (CDR |l|) NIL) (EQ (CAR |l|) '?)) (|?t|))
       (#1#
        (PROGN
         (SETQ |traceList|
                 (OR
                  ((LAMBDA (|bfVar#3| |bfVar#2| |x|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#2|)
                            (PROGN (SETQ |x| (CAR |bfVar#2|)) NIL))
                        (RETURN (NREVERSE |bfVar#3|)))
                       (#1#
                        (SETQ |bfVar#3|
                                (CONS (|transTraceItem| |x|) |bfVar#3|))))
                      (SETQ |bfVar#2| (CDR |bfVar#2|))))
                   NIL |l| NIL)
                  (RETURN NIL)))
         ((LAMBDA (|bfVar#4| |x|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#4|) (PROGN (SETQ |x| (CAR |bfVar#4|)) NIL))
               (RETURN NIL))
              (#1#
               (SETQ |$optionAlist| (ADDASSOC |x| |options| |$optionAlist|))))
             (SETQ |bfVar#4| (CDR |bfVar#4|))))
          |traceList| NIL)
         (SETQ |optionList| (|getTraceOptions| |options|))
         (COND
          ((SETQ |domainList| (LASSOC '|of| |optionList|))
           (COND ((LASSOC '|ops| |optionList|) (|throwKeyedMsg| 'S2IT0004 NIL))
                 (#1#
                  (PROGN
                   (SETQ |opList|
                           (COND (|traceList| (LIST (CONS '|ops| |traceList|)))
                                 (#1# NIL)))
                   (SETQ |varList|
                           (COND
                            ((SETQ |y| (LASSOC '|vars| |optionList|))
                             (LIST (CONS '|vars| |y|)))
                            (#1# NIL)))
                   (SETQ |optionList| (APPEND |opList| |varList|))
                   (SETQ |traceList| |domainList|))))))
         ((LAMBDA (|bfVar#5| |funName|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#5|)
                   (PROGN (SETQ |funName| (CAR |bfVar#5|)) NIL))
               (RETURN NIL))
              (#1# (/TRACE-2 |funName| |optionList|)))
             (SETQ |bfVar#5| (CDR |bfVar#5|))))
          |traceList| NIL)
         (|saveMapSig| |traceList|))))))))
 
; getTraceOptions options ==
;   $traceErrorStack: local := nil
;   optionList:= [getTraceOption x for x in options]
;   $traceErrorStack =>
;     null rest $traceErrorStack =>
;       [key,parms] := first $traceErrorStack
;       throwKeyedMsg(key,['"",:parms])
;     throwListOfKeyedMsgs("S2IT0017",[# $traceErrorStack],
;       NREVERSE $traceErrorStack)
;   optionList
 
(DEFUN |getTraceOptions| (|options|)
  (PROG (|$traceErrorStack| |parms| |key| |LETTMP#1| |optionList|)
    (DECLARE (SPECIAL |$traceErrorStack|))
    (RETURN
     (PROGN
      (SETQ |$traceErrorStack| NIL)
      (SETQ |optionList|
              ((LAMBDA (|bfVar#7| |bfVar#6| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#6|)
                        (PROGN (SETQ |x| (CAR |bfVar#6|)) NIL))
                    (RETURN (NREVERSE |bfVar#7|)))
                   (#1='T
                    (SETQ |bfVar#7| (CONS (|getTraceOption| |x|) |bfVar#7|))))
                  (SETQ |bfVar#6| (CDR |bfVar#6|))))
               NIL |options| NIL))
      (COND
       (|$traceErrorStack|
        (COND
         ((NULL (CDR |$traceErrorStack|))
          (PROGN
           (SETQ |LETTMP#1| (CAR |$traceErrorStack|))
           (SETQ |key| (CAR |LETTMP#1|))
           (SETQ |parms| (CADR |LETTMP#1|))
           (|throwKeyedMsg| |key| (CONS "" |parms|))))
         (#1#
          (|throwListOfKeyedMsgs| 'S2IT0017 (LIST (LENGTH |$traceErrorStack|))
           (NREVERSE |$traceErrorStack|)))))
       (#1# |optionList|))))))
 
; saveMapSig(funNames) ==
;   for name in funNames repeat
;     map:= rassoc(name,$mapSubNameAlist) =>
;       $tracedMapSignatures:= ADDASSOC(name,getMapSig(map,name),
;         $tracedMapSignatures)
 
(DEFUN |saveMapSig| (|funNames|)
  (PROG (|map|)
    (RETURN
     ((LAMBDA (|bfVar#8| |name|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#8|) (PROGN (SETQ |name| (CAR |bfVar#8|)) NIL))
           (RETURN NIL))
          ('T
           (COND
            ((SETQ |map| (|rassoc| |name| |$mapSubNameAlist|))
             (IDENTITY
              (SETQ |$tracedMapSignatures|
                      (ADDASSOC |name| (|getMapSig| |map| |name|)
                       |$tracedMapSignatures|)))))))
         (SETQ |bfVar#8| (CDR |bfVar#8|))))
      |funNames| NIL))))
 
; getMapSig(mapName,subName) ==
;   lmms:= get(mapName,'localModemap,$InteractiveFrame) =>
;     for mm in lmms until sig repeat
;       CADR mm = subName => sig:= CDAR mm
;     sig
 
(DEFUN |getMapSig| (|mapName| |subName|)
  (PROG (|lmms| |sig|)
    (RETURN
     (COND
      ((SETQ |lmms| (|get| |mapName| '|localModemap| |$InteractiveFrame|))
       (IDENTITY
        (PROGN
         ((LAMBDA (|bfVar#9| |mm| |bfVar#10|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#9|) (PROGN (SETQ |mm| (CAR |bfVar#9|)) NIL)
                   |bfVar#10|)
               (RETURN NIL))
              ('T
               (COND
                ((EQUAL (CADR |mm|) |subName|)
                 (IDENTITY (SETQ |sig| (CDAR |mm|)))))))
             (SETQ |bfVar#9| (CDR |bfVar#9|))
             (SETQ |bfVar#10| |sig|)))
          |lmms| NIL NIL)
         |sig|)))))))
 
; getTraceOption (x is [key,:l]) ==
;   key:= selectOptionLC(key,$traceOptionList,'traceOptionError)
;   x := [key,:l]
;   MEMQ(key,'(nonquietly timer nt)) => x
;   key='break =>
;     null l => ['break,'before]
;     opts := [selectOptionLC(y,'(before after),NIL) for y in l]
;     and/[IDENTP y for y in opts] => ['break,:opts]
;     stackTraceOptionError ["S2IT0008",NIL]
;   key='restore =>
;     null l => x
;     stackTraceOptionError ["S2IT0009",[STRCONC('")",object2String key)]]
;   key='only => ['only,:transOnlyOption l]
;   key='within =>
;     l is [a] and IDENTP a => x
;     stackTraceOptionError ["S2IT0010",['")within"]]
;   MEMQ(key,'(cond before after)) =>
;     key:=
;       key="cond" => "when"
;       key
;     l is [a] => [key,:l]
;     stackTraceOptionError ["S2IT0011",[STRCONC('")",object2String key)]]
;   key='depth =>
;     l is [n] and FIXP n => x
;     stackTraceOptionError ["S2IT0012",['")depth"]]
;   key='count =>
;     (null l) or (l is [n] and FIXP n) => x
;     stackTraceOptionError ["S2IT0012",['")count"]]
;   key="of" =>
;     ["of",:[hn y for y in l]] where
;       hn x ==
;         atom x and not UPPER_-CASE_-P (STRINGIMAGE x).(0) =>
;           isDomainOrPackage EVAL x => x
;           stackTraceOptionError ["S2IT0013",[x]]
;         g:= domainToGenvar x => g
;         stackTraceOptionError ["S2IT0013",[x]]
;   MEMQ(key,'(local ops vars)) =>
;     null l or l is ["all"] => [key,:"all"]
;     isListOfIdentifiersOrStrings l => x
;     stackTraceOptionError ["S2IT0015",[STRCONC('")",object2String key)]]
;   key='varbreak =>
;     null l or l is ["all"] => ["varbreak",:"all"]
;     isListOfIdentifiers l => x
;     stackTraceOptionError ["S2IT0016",[STRCONC('")",object2String key)]]
;   key='mathprint =>
;     null l => x
;     stackTraceOptionError ["S2IT0009",[STRCONC('")",object2String key)]]
;   key => throwKeyedMsg("S2IT0005",[key])
 
(DEFUN |getTraceOption| (|x|)
  (PROG (|key| |l| |opts| |a| |n|)
    (RETURN
     (PROGN
      (SETQ |key| (CAR |x|))
      (SETQ |l| (CDR |x|))
      (SETQ |key|
              (|selectOptionLC| |key| |$traceOptionList| '|traceOptionError|))
      (SETQ |x| (CONS |key| |l|))
      (COND ((MEMQ |key| '(|nonquietly| |timer| |nt|)) |x|)
            ((EQ |key| '|break|)
             (COND ((NULL |l|) (LIST '|break| '|before|))
                   (#1='T
                    (PROGN
                     (SETQ |opts|
                             ((LAMBDA (|bfVar#12| |bfVar#11| |y|)
                                (LOOP
                                 (COND
                                  ((OR (ATOM |bfVar#11|)
                                       (PROGN (SETQ |y| (CAR |bfVar#11|)) NIL))
                                   (RETURN (NREVERSE |bfVar#12|)))
                                  (#1#
                                   (SETQ |bfVar#12|
                                           (CONS
                                            (|selectOptionLC| |y|
                                             '(|before| |after|) NIL)
                                            |bfVar#12|))))
                                 (SETQ |bfVar#11| (CDR |bfVar#11|))))
                              NIL |l| NIL))
                     (COND
                      (((LAMBDA (|bfVar#14| |bfVar#13| |y|)
                          (LOOP
                           (COND
                            ((OR (ATOM |bfVar#13|)
                                 (PROGN (SETQ |y| (CAR |bfVar#13|)) NIL))
                             (RETURN |bfVar#14|))
                            (#1#
                             (PROGN
                              (SETQ |bfVar#14| (IDENTP |y|))
                              (COND ((NOT |bfVar#14|) (RETURN NIL))))))
                           (SETQ |bfVar#13| (CDR |bfVar#13|))))
                        T |opts| NIL)
                       (CONS '|break| |opts|))
                      (#1# (|stackTraceOptionError| (LIST 'S2IT0008 NIL))))))))
            ((EQ |key| '|restore|)
             (COND ((NULL |l|) |x|)
                   (#1#
                    (|stackTraceOptionError|
                     (LIST 'S2IT0009
                           (LIST (STRCONC ")" (|object2String| |key|))))))))
            ((EQ |key| '|only|) (CONS '|only| (|transOnlyOption| |l|)))
            ((EQ |key| '|within|)
             (COND
              ((AND (CONSP |l|) (EQ (CDR |l|) NIL)
                    (PROGN (SETQ |a| (CAR |l|)) #1#) (IDENTP |a|))
               |x|)
              (#1#
               (|stackTraceOptionError| (LIST 'S2IT0010 (LIST ")within"))))))
            ((MEMQ |key| '(|cond| |before| |after|))
             (PROGN
              (SETQ |key| (COND ((EQ |key| '|cond|) '|when|) (#1# |key|)))
              (COND
               ((AND (CONSP |l|) (EQ (CDR |l|) NIL)
                     (PROGN (SETQ |a| (CAR |l|)) #1#))
                (CONS |key| |l|))
               (#1#
                (|stackTraceOptionError|
                 (LIST 'S2IT0011
                       (LIST (STRCONC ")" (|object2String| |key|)))))))))
            ((EQ |key| '|depth|)
             (COND
              ((AND (CONSP |l|) (EQ (CDR |l|) NIL)
                    (PROGN (SETQ |n| (CAR |l|)) #1#) (FIXP |n|))
               |x|)
              (#1#
               (|stackTraceOptionError| (LIST 'S2IT0012 (LIST ")depth"))))))
            ((EQ |key| '|count|)
             (COND
              ((OR (NULL |l|)
                   (AND (CONSP |l|) (EQ (CDR |l|) NIL)
                        (PROGN (SETQ |n| (CAR |l|)) #1#) (FIXP |n|)))
               |x|)
              (#1#
               (|stackTraceOptionError| (LIST 'S2IT0012 (LIST ")count"))))))
            ((EQ |key| '|of|)
             (CONS '|of|
                   ((LAMBDA (|bfVar#16| |bfVar#15| |y|)
                      (LOOP
                       (COND
                        ((OR (ATOM |bfVar#15|)
                             (PROGN (SETQ |y| (CAR |bfVar#15|)) NIL))
                         (RETURN (NREVERSE |bfVar#16|)))
                        (#1#
                         (SETQ |bfVar#16|
                                 (CONS (|getTraceOption,hn| |y|) |bfVar#16|))))
                       (SETQ |bfVar#15| (CDR |bfVar#15|))))
                    NIL |l| NIL)))
            ((MEMQ |key| '(|local| |ops| |vars|))
             (COND
              ((OR (NULL |l|)
                   (AND (CONSP |l|) (EQ (CDR |l|) NIL) (EQ (CAR |l|) '|all|)))
               (CONS |key| '|all|))
              ((|isListOfIdentifiersOrStrings| |l|) |x|)
              (#1#
               (|stackTraceOptionError|
                (LIST 'S2IT0015
                      (LIST (STRCONC ")" (|object2String| |key|))))))))
            ((EQ |key| '|varbreak|)
             (COND
              ((OR (NULL |l|)
                   (AND (CONSP |l|) (EQ (CDR |l|) NIL) (EQ (CAR |l|) '|all|)))
               (CONS '|varbreak| '|all|))
              ((|isListOfIdentifiers| |l|) |x|)
              (#1#
               (|stackTraceOptionError|
                (LIST 'S2IT0016
                      (LIST (STRCONC ")" (|object2String| |key|))))))))
            ((EQ |key| '|mathprint|)
             (COND ((NULL |l|) |x|)
                   (#1#
                    (|stackTraceOptionError|
                     (LIST 'S2IT0009
                           (LIST (STRCONC ")" (|object2String| |key|))))))))
            (|key| (|throwKeyedMsg| 'S2IT0005 (LIST |key|))))))))
(DEFUN |getTraceOption,hn| (|x|)
  (PROG (|g|)
    (RETURN
     (COND
      ((AND (ATOM |x|) (NULL (UPPER-CASE-P (ELT (STRINGIMAGE |x|) 0))))
       (COND ((|isDomainOrPackage| (EVAL |x|)) |x|)
             (#1='T (|stackTraceOptionError| (LIST 'S2IT0013 (LIST |x|))))))
      ((SETQ |g| (|domainToGenvar| |x|)) |g|)
      (#1# (|stackTraceOptionError| (LIST 'S2IT0013 (LIST |x|))))))))
 
; traceOptionError(opt,keys) ==
;   null keys => stackTraceOptionError ["S2IT0007",[opt]]
;   commandAmbiguityError("trace option",opt,keys)
 
(DEFUN |traceOptionError| (|opt| |keys|)
  (PROG ()
    (RETURN
     (COND
      ((NULL |keys|) (|stackTraceOptionError| (LIST 'S2IT0007 (LIST |opt|))))
      ('T (|commandAmbiguityError| '|trace option| |opt| |keys|))))))
 
; resetTimers () ==
;   for timer in _/TIMERLIST repeat
;     SET(INTERN STRCONC(timer,'"_,TIMER"),0)
 
(DEFUN |resetTimers| ()
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#17| |timer|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#17|) (PROGN (SETQ |timer| (CAR |bfVar#17|)) NIL))
           (RETURN NIL))
          ('T (SET (INTERN (STRCONC |timer| ",TIMER")) 0)))
         (SETQ |bfVar#17| (CDR |bfVar#17|))))
      /TIMERLIST NIL))))
 
; resetSpacers () ==
;   for spacer in _/SPACELIST repeat
;     SET(INTERN STRCONC(spacer,'"_,SPACE"),0)
 
(DEFUN |resetSpacers| ()
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#18| |spacer|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#18|) (PROGN (SETQ |spacer| (CAR |bfVar#18|)) NIL))
           (RETURN NIL))
          ('T (SET (INTERN (STRCONC |spacer| ",SPACE")) 0)))
         (SETQ |bfVar#18| (CDR |bfVar#18|))))
      /SPACELIST NIL))))
 
; resetCounters () ==
;   for k in _/COUNTLIST repeat
;     SET(INTERN STRCONC(k,'"_,COUNT"),0)
 
(DEFUN |resetCounters| ()
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#19| |k|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#19|) (PROGN (SETQ |k| (CAR |bfVar#19|)) NIL))
           (RETURN NIL))
          ('T (SET (INTERN (STRCONC |k| ",COUNT")) 0)))
         (SETQ |bfVar#19| (CDR |bfVar#19|))))
      /COUNTLIST NIL))))
 
; ptimers() ==
;   null _/TIMERLIST => sayBrightly '"   no functions are timed"
;   for timer in _/TIMERLIST repeat
;     sayBrightly ["  ",:bright timer,'_:,'" ",
;       EVAL(INTERN STRCONC(timer, '"_,TIMER")) /
;         FLOAT($timerTicksPerSecond, 0.0), '" sec."]
 
(DEFUN |ptimers| ()
  (PROG ()
    (RETURN
     (COND ((NULL /TIMERLIST) (|sayBrightly| "   no functions are timed"))
           (#1='T
            ((LAMBDA (|bfVar#20| |timer|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#20|)
                      (PROGN (SETQ |timer| (CAR |bfVar#20|)) NIL))
                  (RETURN NIL))
                 (#1#
                  (|sayBrightly|
                   (CONS '|  |
                         (APPEND (|bright| |timer|)
                                 (CONS '|:|
                                       (CONS " "
                                             (CONS
                                              (/
                                               (EVAL
                                                (INTERN
                                                 (STRCONC |timer| ",TIMER")))
                                               (FLOAT |$timerTicksPerSecond|
                                                      0.0))
                                              (CONS " sec." NIL)))))))))
                (SETQ |bfVar#20| (CDR |bfVar#20|))))
             /TIMERLIST NIL))))))
 
; pspacers() ==
;   null _/SPACELIST => sayBrightly '"   no functions have space monitored"
;   for spacer in _/SPACELIST repeat
;     sayBrightly ["  ",:bright spacer,'_:,'" ",
;       EVAL INTERN STRCONC(spacer,'"_,SPACE"),'" bytes"]
 
(DEFUN |pspacers| ()
  (PROG ()
    (RETURN
     (COND
      ((NULL /SPACELIST)
       (|sayBrightly| "   no functions have space monitored"))
      (#1='T
       ((LAMBDA (|bfVar#21| |spacer|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#21|)
                 (PROGN (SETQ |spacer| (CAR |bfVar#21|)) NIL))
             (RETURN NIL))
            (#1#
             (|sayBrightly|
              (CONS '|  |
                    (APPEND (|bright| |spacer|)
                            (CONS '|:|
                                  (CONS " "
                                        (CONS
                                         (EVAL
                                          (INTERN (STRCONC |spacer| ",SPACE")))
                                         (CONS " bytes" NIL)))))))))
           (SETQ |bfVar#21| (CDR |bfVar#21|))))
        /SPACELIST NIL))))))
 
; pcounters() ==
;   null _/COUNTLIST => sayBrightly '"   no functions are being counted"
;   for k in _/COUNTLIST repeat
;     sayBrightly ["  ",:bright k,'_:,'" ",
;       EVAL INTERN STRCONC(k,'"_,COUNT"),'" times"]
 
(DEFUN |pcounters| ()
  (PROG ()
    (RETURN
     (COND
      ((NULL /COUNTLIST) (|sayBrightly| "   no functions are being counted"))
      (#1='T
       ((LAMBDA (|bfVar#22| |k|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#22|) (PROGN (SETQ |k| (CAR |bfVar#22|)) NIL))
             (RETURN NIL))
            (#1#
             (|sayBrightly|
              (CONS '|  |
                    (APPEND (|bright| |k|)
                            (CONS '|:|
                                  (CONS " "
                                        (CONS
                                         (EVAL (INTERN (STRCONC |k| ",COUNT")))
                                         (CONS " times" NIL)))))))))
           (SETQ |bfVar#22| (CDR |bfVar#22|))))
        /COUNTLIST NIL))))))
 
; transOnlyOption l ==
;   l is [n,:y] =>
;     FIXP n => [n,:transOnlyOption y]
;     MEMQ(n:= UPCASE n,'(V A C)) => [n,:transOnlyOption y]
;     stackTraceOptionError ["S2IT0006",[n]]
;     transOnlyOption y
;   nil
 
(DEFUN |transOnlyOption| (|l|)
  (PROG (|n| |y|)
    (RETURN
     (COND
      ((AND (CONSP |l|)
            (PROGN (SETQ |n| (CAR |l|)) (SETQ |y| (CDR |l|)) #1='T))
       (COND ((FIXP |n|) (CONS |n| (|transOnlyOption| |y|)))
             ((MEMQ (SETQ |n| (UPCASE |n|)) '(V A C))
              (CONS |n| (|transOnlyOption| |y|)))
             (#1#
              (PROGN
               (|stackTraceOptionError| (LIST 'S2IT0006 (LIST |n|)))
               (|transOnlyOption| |y|)))))
      (#1# NIL)))))
 
; stackTraceOptionError x ==
;   $traceErrorStack:= [x,:$traceErrorStack]
;   nil
 
(DEFUN |stackTraceOptionError| (|x|)
  (PROG ()
    (RETURN
     (PROGN (SETQ |$traceErrorStack| (CONS |x| |$traceErrorStack|)) NIL))))
 
; removeOption(op,options) ==
;   [optEntry for (optEntry:=[opt,:.]) in options | opt ~= op]
 
(DEFUN |removeOption| (|op| |options|)
  (PROG (|opt|)
    (RETURN
     ((LAMBDA (|bfVar#24| |bfVar#23| |optEntry|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#23|)
               (PROGN (SETQ |optEntry| (CAR |bfVar#23|)) NIL))
           (RETURN (NREVERSE |bfVar#24|)))
          (#1='T
           (AND (CONSP |optEntry|) (PROGN (SETQ |opt| (CAR |optEntry|)) #1#)
                (NOT (EQUAL |opt| |op|))
                (SETQ |bfVar#24| (CONS |optEntry| |bfVar#24|)))))
         (SETQ |bfVar#23| (CDR |bfVar#23|))))
      NIL |options| NIL))))
 
; domainToGenvar x ==
;   $doNotAddEmptyModeIfTrue: local:= true
;   (y:= unabbrevAndLoad x) and GETDATABASE(opOf y,'CONSTRUCTORKIND) = 'domain =>
;     g:= genDomainTraceName y
;     SET(g,evalDomain y)
;     g
 
(DEFUN |domainToGenvar| (|x|)
  (PROG (|$doNotAddEmptyModeIfTrue| |g| |y|)
    (DECLARE (SPECIAL |$doNotAddEmptyModeIfTrue|))
    (RETURN
     (PROGN
      (SETQ |$doNotAddEmptyModeIfTrue| T)
      (COND
       ((AND (SETQ |y| (|unabbrevAndLoad| |x|))
             (EQ (GETDATABASE (|opOf| |y|) 'CONSTRUCTORKIND) '|domain|))
        (PROGN
         (SETQ |g| (|genDomainTraceName| |y|))
         (SET |g| (|evalDomain| |y|))
         |g|)))))))
 
; genDomainTraceName y ==
;   u:= LASSOC(y,$domainTraceNameAssoc) => u
;   g:= GENVAR()
;   $domainTraceNameAssoc:= [[y,:g],:$domainTraceNameAssoc]
;   g
 
(DEFUN |genDomainTraceName| (|y|)
  (PROG (|u| |g|)
    (RETURN
     (COND ((SETQ |u| (LASSOC |y| |$domainTraceNameAssoc|)) |u|)
           ('T
            (PROGN
             (SETQ |g| (GENVAR))
             (SETQ |$domainTraceNameAssoc|
                     (CONS (CONS |y| |g|) |$domainTraceNameAssoc|))
             |g|))))))
 
; untrace l ==
;   $lastUntraced:=
;     null l => COPY _/TRACENAMES
;     l
;   untraceList:= [transTraceItem x for x in l]
;   for funName in untraceList repeat
;       _/UNTRACE_-2(lassocSub(funName,$mapSubNameAlist), [])
;   removeTracedMapSigs untraceList
 
(DEFUN |untrace| (|l|)
  (PROG (|untraceList|)
    (RETURN
     (PROGN
      (SETQ |$lastUntraced| (COND ((NULL |l|) (COPY /TRACENAMES)) (#1='T |l|)))
      (SETQ |untraceList|
              ((LAMBDA (|bfVar#26| |bfVar#25| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#25|)
                        (PROGN (SETQ |x| (CAR |bfVar#25|)) NIL))
                    (RETURN (NREVERSE |bfVar#26|)))
                   (#1#
                    (SETQ |bfVar#26|
                            (CONS (|transTraceItem| |x|) |bfVar#26|))))
                  (SETQ |bfVar#25| (CDR |bfVar#25|))))
               NIL |l| NIL))
      ((LAMBDA (|bfVar#27| |funName|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#27|)
                (PROGN (SETQ |funName| (CAR |bfVar#27|)) NIL))
            (RETURN NIL))
           (#1# (/UNTRACE-2 (|lassocSub| |funName| |$mapSubNameAlist|) NIL)))
          (SETQ |bfVar#27| (CDR |bfVar#27|))))
       |untraceList| NIL)
      (|removeTracedMapSigs| |untraceList|)))))
 
; transTraceItem x ==
;   $doNotAddEmptyModeIfTrue: local:=true
;   atom x =>
;     (value:=get(x,"value",$InteractiveFrame)) and
;       (objMode value in '((Mode) (Type) (Category))) =>
;         x := objVal value
;         (y:= domainToGenvar x) => y
;         x
;     UPPER_-CASE_-P (STRINGIMAGE x).(0) =>
;       y := unabbrev x
;       constructor?(y) => y
;       PAIRP(y) and constructor?(first y) => first y
;       (y:= domainToGenvar x) => y
;       x
;     x
;   VECP first x => transTraceItem devaluate first x
;   y:= domainToGenvar x => y
;   throwKeyedMsg("S2IT0018",[x])
 
(DEFUN |transTraceItem| (|x|)
  (PROG (|$doNotAddEmptyModeIfTrue| |y| |value|)
    (DECLARE (SPECIAL |$doNotAddEmptyModeIfTrue|))
    (RETURN
     (PROGN
      (SETQ |$doNotAddEmptyModeIfTrue| T)
      (COND
       ((ATOM |x|)
        (COND
         ((AND (SETQ |value| (|get| |x| '|value| |$InteractiveFrame|))
               (|member| (|objMode| |value|)
                '((|Mode|) (|Type|) (|Category|))))
          (PROGN
           (SETQ |x| (|objVal| |value|))
           (COND ((SETQ |y| (|domainToGenvar| |x|)) |y|) (#1='T |x|))))
         ((UPPER-CASE-P (ELT (STRINGIMAGE |x|) 0))
          (PROGN
           (SETQ |y| (|unabbrev| |x|))
           (COND ((|constructor?| |y|) |y|)
                 ((AND (CONSP |y|) (|constructor?| (CAR |y|))) (CAR |y|))
                 ((SETQ |y| (|domainToGenvar| |x|)) |y|) (#1# |x|))))
         (#1# |x|)))
       ((VECP (CAR |x|)) (|transTraceItem| (|devaluate| (CAR |x|))))
       ((SETQ |y| (|domainToGenvar| |x|)) |y|)
       (#1# (|throwKeyedMsg| 'S2IT0018 (LIST |x|))))))))
 
; removeTracedMapSigs untraceList ==
;   for name in untraceList repeat
;     REMPROP(name,$tracedMapSignatures)
 
(DEFUN |removeTracedMapSigs| (|untraceList|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#28| |name|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#28|) (PROGN (SETQ |name| (CAR |bfVar#28|)) NIL))
           (RETURN NIL))
          ('T (REMPROP |name| |$tracedMapSignatures|)))
         (SETQ |bfVar#28| (CDR |bfVar#28|))))
      |untraceList| NIL))))
 
; coerceTraceArgs2E(traceName,subName,args) ==
;   MEMQ(name:= subName,$mathTraceList) =>
;     SPADSYSNAMEP PNAME name => coerceSpadArgs2E(reverse rest reverse args)
;     [["=",name,objValUnwrap coerceInteractive(objNewWrap(arg,type),$OutputForm)]
;       for name in '(arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9 arg10 arg11 arg12 arg13 arg14 arg15 arg16 arg17 arg18 arg19 )
;        for arg in args for type in rest LASSOC(subName,
;         $tracedMapSignatures)]
;   SPADSYSNAMEP PNAME name => reverse rest reverse args
;   args
 
(DEFUN |coerceTraceArgs2E| (|traceName| |subName| |args|)
  (PROG (|name|)
    (RETURN
     (COND
      ((MEMQ (SETQ |name| |subName|) |$mathTraceList|)
       (COND
        ((SPADSYSNAMEP (PNAME |name|))
         (|coerceSpadArgs2E| (REVERSE (CDR (REVERSE |args|)))))
        (#1='T
         ((LAMBDA
              (|bfVar#32| |bfVar#29| |name| |bfVar#30| |arg| |bfVar#31| |type|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#29|) (PROGN (SETQ |name| (CAR |bfVar#29|)) NIL)
                   (ATOM |bfVar#30|) (PROGN (SETQ |arg| (CAR |bfVar#30|)) NIL)
                   (ATOM |bfVar#31|)
                   (PROGN (SETQ |type| (CAR |bfVar#31|)) NIL))
               (RETURN (NREVERSE |bfVar#32|)))
              (#1#
               (SETQ |bfVar#32|
                       (CONS
                        (LIST '= |name|
                              (|objValUnwrap|
                               (|coerceInteractive| (|objNewWrap| |arg| |type|)
                                |$OutputForm|)))
                        |bfVar#32|))))
             (SETQ |bfVar#29| (CDR |bfVar#29|))
             (SETQ |bfVar#30| (CDR |bfVar#30|))
             (SETQ |bfVar#31| (CDR |bfVar#31|))))
          NIL
          '(|arg1| |arg2| |arg3| |arg4| |arg5| |arg6| |arg7| |arg8| |arg9|
            |arg10| |arg11| |arg12| |arg13| |arg14| |arg15| |arg16| |arg17|
            |arg18| |arg19|)
          NIL |args| NIL (CDR (LASSOC |subName| |$tracedMapSignatures|))
          NIL))))
      ((SPADSYSNAMEP (PNAME |name|)) (REVERSE (CDR (REVERSE |args|))))
      (#1# |args|)))))
 
; coerceSpadArgs2E(args) ==
;   -- following binding is to prevent forcing calculation of stream elements
;   $streamCount:local := 0
;   [["=",name,objValUnwrap coerceInteractive(objNewWrap(arg,type),$OutputForm)]
;       for name in '(arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9 arg10 arg11 arg12 arg13 arg14 arg15 arg16 arg17 arg18 arg19 )
;         for arg in args for type in rest $tracedSpadModemap]
 
(DEFUN |coerceSpadArgs2E| (|args|)
  (PROG (|$streamCount|)
    (DECLARE (SPECIAL |$streamCount|))
    (RETURN
     (PROGN
      (SETQ |$streamCount| 0)
      ((LAMBDA
           (|bfVar#36| |bfVar#33| |name| |bfVar#34| |arg| |bfVar#35| |type|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#33|) (PROGN (SETQ |name| (CAR |bfVar#33|)) NIL)
                (ATOM |bfVar#34|) (PROGN (SETQ |arg| (CAR |bfVar#34|)) NIL)
                (ATOM |bfVar#35|) (PROGN (SETQ |type| (CAR |bfVar#35|)) NIL))
            (RETURN (NREVERSE |bfVar#36|)))
           ('T
            (SETQ |bfVar#36|
                    (CONS
                     (LIST '= |name|
                           (|objValUnwrap|
                            (|coerceInteractive| (|objNewWrap| |arg| |type|)
                             |$OutputForm|)))
                     |bfVar#36|))))
          (SETQ |bfVar#33| (CDR |bfVar#33|))
          (SETQ |bfVar#34| (CDR |bfVar#34|))
          (SETQ |bfVar#35| (CDR |bfVar#35|))))
       NIL
       '(|arg1| |arg2| |arg3| |arg4| |arg5| |arg6| |arg7| |arg8| |arg9| |arg10|
         |arg11| |arg12| |arg13| |arg14| |arg15| |arg16| |arg17| |arg18|
         |arg19|)
       NIL |args| NIL (CDR |$tracedSpadModemap|) NIL)))))
 
; subTypes(mm,sublist) ==
;   ATOM mm =>
;     (s:= LASSOC(mm,sublist)) => s
;     mm
;   [subTypes(m,sublist) for m in mm]
 
(DEFUN |subTypes| (|mm| |sublist|)
  (PROG (|s|)
    (RETURN
     (COND
      ((ATOM |mm|)
       (COND ((SETQ |s| (LASSOC |mm| |sublist|)) |s|) (#1='T |mm|)))
      (#1#
       ((LAMBDA (|bfVar#38| |bfVar#37| |m|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#37|) (PROGN (SETQ |m| (CAR |bfVar#37|)) NIL))
             (RETURN (NREVERSE |bfVar#38|)))
            (#1#
             (SETQ |bfVar#38| (CONS (|subTypes| |m| |sublist|) |bfVar#38|))))
           (SETQ |bfVar#37| (CDR |bfVar#37|))))
        NIL |mm| NIL))))))
 
; coerceTraceFunValue2E(traceName,subName,value) ==
;   MEMQ(name:= subName,$mathTraceList) =>
;     SPADSYSNAMEP PNAME traceName => coerceSpadFunValue2E(value)
;     (u:=LASSOC(subName,$tracedMapSignatures)) =>
;       objValUnwrap coerceInteractive(objNewWrap(value, first u), $OutputForm)
;     value
;   value
 
(DEFUN |coerceTraceFunValue2E| (|traceName| |subName| |value|)
  (PROG (|name| |u|)
    (RETURN
     (COND
      ((MEMQ (SETQ |name| |subName|) |$mathTraceList|)
       (COND
        ((SPADSYSNAMEP (PNAME |traceName|)) (|coerceSpadFunValue2E| |value|))
        ((SETQ |u| (LASSOC |subName| |$tracedMapSignatures|))
         (|objValUnwrap|
          (|coerceInteractive| (|objNewWrap| |value| (CAR |u|))
           |$OutputForm|)))
        (#1='T |value|)))
      (#1# |value|)))))
 
; coerceSpadFunValue2E(value) ==
;   -- following binding is to prevent forcing calculation of stream elements
;   $streamCount:local := 0
;   objValUnwrap coerceInteractive(objNewWrap(value, first $tracedSpadModemap),
;     $OutputForm)
 
(DEFUN |coerceSpadFunValue2E| (|value|)
  (PROG (|$streamCount|)
    (DECLARE (SPECIAL |$streamCount|))
    (RETURN
     (PROGN
      (SETQ |$streamCount| 0)
      (|objValUnwrap|
       (|coerceInteractive| (|objNewWrap| |value| (CAR |$tracedSpadModemap|))
        |$OutputForm|))))))
 
; isListOfIdentifiers l == and/[IDENTP x for x in l]
 
(DEFUN |isListOfIdentifiers| (|l|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#40| |bfVar#39| |x|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#39|) (PROGN (SETQ |x| (CAR |bfVar#39|)) NIL))
           (RETURN |bfVar#40|))
          ('T
           (PROGN
            (SETQ |bfVar#40| (IDENTP |x|))
            (COND ((NOT |bfVar#40|) (RETURN NIL))))))
         (SETQ |bfVar#39| (CDR |bfVar#39|))))
      T |l| NIL))))
 
; isListOfIdentifiersOrStrings l == and/[IDENTP x or STRINGP x for x in l]
 
(DEFUN |isListOfIdentifiersOrStrings| (|l|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#42| |bfVar#41| |x|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#41|) (PROGN (SETQ |x| (CAR |bfVar#41|)) NIL))
           (RETURN |bfVar#42|))
          ('T
           (PROGN
            (SETQ |bfVar#42| (OR (IDENTP |x|) (STRINGP |x|)))
            (COND ((NOT |bfVar#42|) (RETURN NIL))))))
         (SETQ |bfVar#41| (CDR |bfVar#41|))))
      T |l| NIL))))
 
; getMapSubNames(l) ==
;   subs:= nil
;   for mapName in l repeat
;     lmm:= get(mapName,'localModemap,$InteractiveFrame) =>
;       subs:= APPEND([[mapName,:CADR mm] for mm in lmm],subs)
;   union(subs,getPreviousMapSubNames UNIONQ(_/TRACENAMES,
;     $lastUntraced))
 
(DEFUN |getMapSubNames| (|l|)
  (PROG (|subs| |lmm|)
    (RETURN
     (PROGN
      (SETQ |subs| NIL)
      ((LAMBDA (|bfVar#43| |mapName|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#43|)
                (PROGN (SETQ |mapName| (CAR |bfVar#43|)) NIL))
            (RETURN NIL))
           (#1='T
            (COND
             ((SETQ |lmm|
                      (|get| |mapName| '|localModemap| |$InteractiveFrame|))
              (IDENTITY
               (SETQ |subs|
                       (APPEND
                        ((LAMBDA (|bfVar#45| |bfVar#44| |mm|)
                           (LOOP
                            (COND
                             ((OR (ATOM |bfVar#44|)
                                  (PROGN (SETQ |mm| (CAR |bfVar#44|)) NIL))
                              (RETURN (NREVERSE |bfVar#45|)))
                             (#1#
                              (SETQ |bfVar#45|
                                      (CONS (CONS |mapName| (CADR |mm|))
                                            |bfVar#45|))))
                            (SETQ |bfVar#44| (CDR |bfVar#44|))))
                         NIL |lmm| NIL)
                        |subs|)))))))
          (SETQ |bfVar#43| (CDR |bfVar#43|))))
       |l| NIL)
      (|union| |subs|
       (|getPreviousMapSubNames| (UNIONQ /TRACENAMES |$lastUntraced|)))))))
 
; getPreviousMapSubNames(traceNames) ==
;   subs:= nil
;   for mapName in ASSOCLEFT CAAR $InteractiveFrame repeat
;     lmm:= get(mapName,'localModemap,$InteractiveFrame) =>
;       MEMQ(CADAR lmm,traceNames) =>
;         for mm in lmm repeat
;           subs:= [[mapName,:CADR mm],:subs]
;   subs
 
(DEFUN |getPreviousMapSubNames| (|traceNames|)
  (PROG (|subs| |lmm|)
    (RETURN
     (PROGN
      (SETQ |subs| NIL)
      ((LAMBDA (|bfVar#46| |mapName|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#46|)
                (PROGN (SETQ |mapName| (CAR |bfVar#46|)) NIL))
            (RETURN NIL))
           (#1='T
            (COND
             ((SETQ |lmm|
                      (|get| |mapName| '|localModemap| |$InteractiveFrame|))
              (IDENTITY
               (COND
                ((MEMQ (CADAR |lmm|) |traceNames|)
                 (IDENTITY
                  ((LAMBDA (|bfVar#47| |mm|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#47|)
                            (PROGN (SETQ |mm| (CAR |bfVar#47|)) NIL))
                        (RETURN NIL))
                       (#1#
                        (SETQ |subs|
                                (CONS (CONS |mapName| (CADR |mm|)) |subs|))))
                      (SETQ |bfVar#47| (CDR |bfVar#47|))))
                   |lmm| NIL)))))))))
          (SETQ |bfVar#46| (CDR |bfVar#46|))))
       (ASSOCLEFT (CAAR |$InteractiveFrame|)) NIL)
      |subs|))))
 
; lassocSub(x,subs)  ==
;   y := QLASSQ(x, subs) => y
;   x
 
(DEFUN |lassocSub| (|x| |subs|)
  (PROG (|y|) (RETURN (COND ((SETQ |y| (QLASSQ |x| |subs|)) |y|) ('T |x|)))))
 
; rassocSub(x,subs) ==
;   y:= rassoc(x,subs) => y
;   x
 
(DEFUN |rassocSub| (|x| |subs|)
  (PROG (|y|) (RETURN (COND ((SETQ |y| (|rassoc| |x| |subs|)) |y|) ('T |x|)))))
 
; isUncompiledMap(x) ==
;   y:= get(x,'value,$InteractiveFrame) =>
;     (CAAR y) = 'SPADMAP and null get(x,'localModemap,$InteractiveFrame)
 
(DEFUN |isUncompiledMap| (|x|)
  (PROG (|y|)
    (RETURN
     (COND
      ((SETQ |y| (|get| |x| '|value| |$InteractiveFrame|))
       (IDENTITY
        (AND (EQ (CAAR |y|) 'SPADMAP)
             (NULL (|get| |x| '|localModemap| |$InteractiveFrame|)))))))))
 
; isInterpOnlyMap(map) ==
;   x:= get(map,'localModemap,$InteractiveFrame) =>
;     (CAAAR x) = 'interpOnly
 
(DEFUN |isInterpOnlyMap| (|map|)
  (PROG (|x|)
    (RETURN
     (COND
      ((SETQ |x| (|get| |map| '|localModemap| |$InteractiveFrame|))
       (IDENTITY (EQ (CAAAR |x|) '|interpOnly|)))))))
 
; augmentTraceNames(l,mapSubNames) ==
;   res:= nil
;   for traceName in l repeat
;     mml:= get(traceName,'localModemap,$InteractiveFrame) =>
;       res:= APPEND([CADR mm for mm in mml],res)
;     res:= [traceName,:res]
;   res
 
(DEFUN |augmentTraceNames| (|l| |mapSubNames|)
  (PROG (|res| |mml|)
    (RETURN
     (PROGN
      (SETQ |res| NIL)
      ((LAMBDA (|bfVar#48| |traceName|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#48|)
                (PROGN (SETQ |traceName| (CAR |bfVar#48|)) NIL))
            (RETURN NIL))
           (#1='T
            (COND
             ((SETQ |mml|
                      (|get| |traceName| '|localModemap| |$InteractiveFrame|))
              (SETQ |res|
                      (APPEND
                       ((LAMBDA (|bfVar#50| |bfVar#49| |mm|)
                          (LOOP
                           (COND
                            ((OR (ATOM |bfVar#49|)
                                 (PROGN (SETQ |mm| (CAR |bfVar#49|)) NIL))
                             (RETURN (NREVERSE |bfVar#50|)))
                            (#1#
                             (SETQ |bfVar#50| (CONS (CADR |mm|) |bfVar#50|))))
                           (SETQ |bfVar#49| (CDR |bfVar#49|))))
                        NIL |mml| NIL)
                       |res|)))
             (#1# (SETQ |res| (CONS |traceName| |res|))))))
          (SETQ |bfVar#48| (CDR |bfVar#48|))))
       |l| NIL)
      |res|))))
 
; isSubForRedundantMapName(subName) ==
;   mapName:= rassocSub(subName,$mapSubNameAlist) =>
;     tail:=member([mapName,:subName],$mapSubNameAlist) =>
;       MEMQ(mapName, rest ASSOCLEFT tail)
 
(DEFUN |isSubForRedundantMapName| (|subName|)
  (PROG (|mapName| |tail|)
    (RETURN
     (COND
      ((SETQ |mapName| (|rassocSub| |subName| |$mapSubNameAlist|))
       (IDENTITY
        (COND
         ((SETQ |tail|
                  (|member| (CONS |mapName| |subName|) |$mapSubNameAlist|))
          (IDENTITY (MEMQ |mapName| (CDR (ASSOCLEFT |tail|))))))))))))
 
; untraceMapSubNames traceNames ==
;   null($mapSubNameAlist:local:= getPreviousMapSubNames traceNames) => nil
;   for name in (subs:= ASSOCRIGHT $mapSubNameAlist)
;     | MEMQ(name,_/TRACENAMES) repeat
;       _/UNTRACE_-2(name,nil)
;       $lastUntraced:= SETDIFFERENCE($lastUntraced,subs)
 
(DEFUN |untraceMapSubNames| (|traceNames|)
  (PROG (|$mapSubNameAlist| |subs|)
    (DECLARE (SPECIAL |$mapSubNameAlist|))
    (RETURN
     (COND
      ((NULL (SETQ |$mapSubNameAlist| (|getPreviousMapSubNames| |traceNames|)))
       NIL)
      (#1='T
       ((LAMBDA (|bfVar#51| |name|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#51|) (PROGN (SETQ |name| (CAR |bfVar#51|)) NIL))
             (RETURN NIL))
            (#1#
             (AND (MEMQ |name| /TRACENAMES)
                  (PROGN
                   (/UNTRACE-2 |name| NIL)
                   (SETQ |$lastUntraced|
                           (SETDIFFERENCE |$lastUntraced| |subs|))))))
           (SETQ |bfVar#51| (CDR |bfVar#51|))))
        (SETQ |subs| (ASSOCRIGHT |$mapSubNameAlist|)) NIL))))))
 
; funfind(functor, opname) ==
;   ops:= isFunctor functor
;   [u for u in ops | u is [[ =opname,:.],:.]]
 
(DEFUN |funfind| (|functor| |opname|)
  (PROG (|ops| |ISTMP#1|)
    (RETURN
     (PROGN
      (SETQ |ops| (|isFunctor| |functor|))
      ((LAMBDA (|bfVar#53| |bfVar#52| |u|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#52|) (PROGN (SETQ |u| (CAR |bfVar#52|)) NIL))
            (RETURN (NREVERSE |bfVar#53|)))
           ('T
            (AND (CONSP |u|)
                 (PROGN
                  (SETQ |ISTMP#1| (CAR |u|))
                  (AND (CONSP |ISTMP#1|) (EQUAL (CAR |ISTMP#1|) |opname|)))
                 (SETQ |bfVar#53| (CONS |u| |bfVar#53|)))))
          (SETQ |bfVar#52| (CDR |bfVar#52|))))
       NIL |ops| NIL)))))
 
; isDomainOrPackage dom ==
;   REFVECP dom and #dom>0 and isFunctor opOf dom.(0)
 
(DEFUN |isDomainOrPackage| (|dom|)
  (PROG ()
    (RETURN
     (AND (REFVECP |dom|) (< 0 (LENGTH |dom|))
          (|isFunctor| (|opOf| (ELT |dom| 0)))))))
 
; isTraceGensym x == GENSYMP x
 
(DEFUN |isTraceGensym| (|x|) (PROG () (RETURN (GENSYMP |x|))))
 
; spadTrace(domain,options) ==
;   $fromSpadTrace:= true
;   $tracedModemap:local:= nil
;   PAIRP domain and REFVECP first domain and (first domain).0 = 0 =>
;       aldorTrace(domain,options)
;   not isDomainOrPackage domain => userError '"bad argument to trace"
;   listOfOperations:=
;     [g x for x in getOption("OPS",options)] where
;       g x ==
;         STRINGP x => INTERN x
;         x
;   if listOfVariables := getOption("VARS",options) then
;     options := removeOption("VARS",options)
;   if listOfBreakVars := getOption("VARBREAK",options) then
;     options := removeOption("VARBREAK",options)
;   anyifTrue:= null listOfOperations
;   domainId:= opOf domain.(0)
;   currentEntry:= assoc(domain,_/TRACENAMES)
;   currentAlist:= IFCDR currentEntry
;   opStructureList:= flattenOperationAlist getOperationAlistFromLisplib domainId
;   sigSlotNumberAlist:=
;     [triple
;       --new form is (<op> <signature> <slotNumber> <condition> <kind>)
;       for [op,sig,n,.,kind] in opStructureList | kind = 'ELT
;         and (anyifTrue or MEMQ(op,listOfOperations)) and
;          FIXP n and
;           isTraceable(triple:= [op,sig,n],domain)] where
;             isTraceable(x is [.,.,n,:.],domain) ==
;               atom domain.n => nil
;               functionSlot:= first domain.n
;               GENSYMP functionSlot =>
;                 (reportSpadTrace("Already Traced",x); nil)
;               null (BPINAME functionSlot) =>
;                 (reportSpadTrace("No function for",x); nil)
;               true
;   if listOfVariables then
;     for [.,.,n] in sigSlotNumberAlist repeat
;       fn := first domain.n
;       $letAssoc := AS_-INSERT(BPINAME fn,
;         listOfVariables,$letAssoc)
;   if listOfBreakVars then
;     for [.,.,n] in sigSlotNumberAlist repeat
;       fn := first domain.n
;       $letAssoc := AS_-INSERT(BPINAME fn,
;         [["BREAK",:listOfBreakVars]],$letAssoc)
;   for (pair:= [op,mm,n]) in sigSlotNumberAlist repeat
;     alias:= spadTraceAlias(domainId,op,n)
;     $tracedModemap:= subTypes(mm,constructSubst(domain.0))
;     dn1 := first domain.n
;     fgg := FUNCTION newGoGet
;     if dn1 = fgg then
;         -- SAY(["newGoGet in slot", n])
;         traceName := GENSYM()
;         SET(traceName, dn1)
;         tf := goGetTracerHelper(domain.n, fgg, pair, alias,
;                                 options, $tracedModemap)
;         setSf(traceName, tf)
;     else
;         traceName:= BPITRACE(dn1, alias, options)
;         tf := SYMBOL_-FUNCTION traceName
;     NCONC(pair,[listOfVariables,first domain.n,traceName,alias])
;     rplac(first domain.n, tf)
;   sigSlotNumberAlist:= [x for x in sigSlotNumberAlist | CDDDR x]
;   if $reportSpadTrace then
;     if $traceNoisely then printDashedLine()
;     for x in orderBySlotNumber sigSlotNumberAlist repeat
;       reportSpadTrace("TRACING",x)
;   currentEntry =>
;     rplac(rest currentEntry,[:sigSlotNumberAlist,:currentAlist])
;   SETQ(_/TRACENAMES,[[domain,:sigSlotNumberAlist],:_/TRACENAMES])
;   spadReply()
 
(DEFUN |spadTrace| (|domain| |options|)
  (PROG (|$tracedModemap| |tf| |traceName| |fgg| |dn1| |alias| |mm| |fn|
         |sigSlotNumberAlist| |triple| |kind| |ISTMP#4| |ISTMP#3| |n| |ISTMP#2|
         |sig| |ISTMP#1| |op| |opStructureList| |currentAlist| |currentEntry|
         |domainId| |anyifTrue| |listOfBreakVars| |listOfVariables|
         |listOfOperations|)
    (DECLARE (SPECIAL |$tracedModemap|))
    (RETURN
     (PROGN
      (SETQ |$fromSpadTrace| T)
      (SETQ |$tracedModemap| NIL)
      (COND
       ((AND (CONSP |domain|) (REFVECP (CAR |domain|))
             (EQL (ELT (CAR |domain|) 0) 0))
        (|aldorTrace| |domain| |options|))
       ((NULL (|isDomainOrPackage| |domain|))
        (|userError| "bad argument to trace"))
       (#1='T
        (PROGN
         (SETQ |listOfOperations|
                 ((LAMBDA (|bfVar#55| |bfVar#54| |x|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#54|)
                           (PROGN (SETQ |x| (CAR |bfVar#54|)) NIL))
                       (RETURN (NREVERSE |bfVar#55|)))
                      (#1#
                       (SETQ |bfVar#55|
                               (CONS (|spadTrace,g| |x|) |bfVar#55|))))
                     (SETQ |bfVar#54| (CDR |bfVar#54|))))
                  NIL (|getOption| 'OPS |options|) NIL))
         (COND
          ((SETQ |listOfVariables| (|getOption| 'VARS |options|))
           (SETQ |options| (|removeOption| 'VARS |options|))))
         (COND
          ((SETQ |listOfBreakVars| (|getOption| 'VARBREAK |options|))
           (SETQ |options| (|removeOption| 'VARBREAK |options|))))
         (SETQ |anyifTrue| (NULL |listOfOperations|))
         (SETQ |domainId| (|opOf| (ELT |domain| 0)))
         (SETQ |currentEntry| (|assoc| |domain| /TRACENAMES))
         (SETQ |currentAlist| (IFCDR |currentEntry|))
         (SETQ |opStructureList|
                 (|flattenOperationAlist|
                  (|getOperationAlistFromLisplib| |domainId|)))
         (SETQ |sigSlotNumberAlist|
                 ((LAMBDA (|bfVar#58| |bfVar#57| |bfVar#56|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#57|)
                           (PROGN (SETQ |bfVar#56| (CAR |bfVar#57|)) NIL))
                       (RETURN (NREVERSE |bfVar#58|)))
                      (#1#
                       (AND (CONSP |bfVar#56|)
                            (PROGN
                             (SETQ |op| (CAR |bfVar#56|))
                             (SETQ |ISTMP#1| (CDR |bfVar#56|))
                             (AND (CONSP |ISTMP#1|)
                                  (PROGN
                                   (SETQ |sig| (CAR |ISTMP#1|))
                                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                   (AND (CONSP |ISTMP#2|)
                                        (PROGN
                                         (SETQ |n| (CAR |ISTMP#2|))
                                         (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                                         (AND (CONSP |ISTMP#3|)
                                              (PROGN
                                               (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                                               (AND (CONSP |ISTMP#4|)
                                                    (EQ (CDR |ISTMP#4|) NIL)
                                                    (PROGN
                                                     (SETQ |kind|
                                                             (CAR |ISTMP#4|))
                                                     #1#)))))))))
                            (EQ |kind| 'ELT)
                            (OR |anyifTrue| (MEMQ |op| |listOfOperations|))
                            (FIXP |n|)
                            (|spadTrace,isTraceable|
                             (SETQ |triple| (LIST |op| |sig| |n|)) |domain|)
                            (SETQ |bfVar#58| (CONS |triple| |bfVar#58|)))))
                     (SETQ |bfVar#57| (CDR |bfVar#57|))))
                  NIL |opStructureList| NIL))
         (COND
          (|listOfVariables|
           ((LAMBDA (|bfVar#60| |bfVar#59|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#60|)
                     (PROGN (SETQ |bfVar#59| (CAR |bfVar#60|)) NIL))
                 (RETURN NIL))
                (#1#
                 (AND (CONSP |bfVar#59|)
                      (PROGN
                       (SETQ |ISTMP#1| (CDR |bfVar#59|))
                       (AND (CONSP |ISTMP#1|)
                            (PROGN
                             (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                             (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                  (PROGN (SETQ |n| (CAR |ISTMP#2|)) #1#)))))
                      (PROGN
                       (SETQ |fn| (CAR (ELT |domain| |n|)))
                       (SETQ |$letAssoc|
                               (AS-INSERT (BPINAME |fn|) |listOfVariables|
                                |$letAssoc|))))))
               (SETQ |bfVar#60| (CDR |bfVar#60|))))
            |sigSlotNumberAlist| NIL)))
         (COND
          (|listOfBreakVars|
           ((LAMBDA (|bfVar#62| |bfVar#61|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#62|)
                     (PROGN (SETQ |bfVar#61| (CAR |bfVar#62|)) NIL))
                 (RETURN NIL))
                (#1#
                 (AND (CONSP |bfVar#61|)
                      (PROGN
                       (SETQ |ISTMP#1| (CDR |bfVar#61|))
                       (AND (CONSP |ISTMP#1|)
                            (PROGN
                             (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                             (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                  (PROGN (SETQ |n| (CAR |ISTMP#2|)) #1#)))))
                      (PROGN
                       (SETQ |fn| (CAR (ELT |domain| |n|)))
                       (SETQ |$letAssoc|
                               (AS-INSERT (BPINAME |fn|)
                                (LIST (CONS 'BREAK |listOfBreakVars|))
                                |$letAssoc|))))))
               (SETQ |bfVar#62| (CDR |bfVar#62|))))
            |sigSlotNumberAlist| NIL)))
         ((LAMBDA (|bfVar#63| |pair|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#63|)
                   (PROGN (SETQ |pair| (CAR |bfVar#63|)) NIL))
               (RETURN NIL))
              (#1#
               (AND (CONSP |pair|)
                    (PROGN
                     (SETQ |op| (CAR |pair|))
                     (SETQ |ISTMP#1| (CDR |pair|))
                     (AND (CONSP |ISTMP#1|)
                          (PROGN
                           (SETQ |mm| (CAR |ISTMP#1|))
                           (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                           (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                (PROGN (SETQ |n| (CAR |ISTMP#2|)) #1#)))))
                    (PROGN
                     (SETQ |alias| (|spadTraceAlias| |domainId| |op| |n|))
                     (SETQ |$tracedModemap|
                             (|subTypes| |mm|
                              (|constructSubst| (ELT |domain| 0))))
                     (SETQ |dn1| (CAR (ELT |domain| |n|)))
                     (SETQ |fgg| #'|newGoGet|)
                     (COND
                      ((EQUAL |dn1| |fgg|) (SETQ |traceName| (GENSYM))
                       (SET |traceName| |dn1|)
                       (SETQ |tf|
                               (|goGetTracerHelper| (ELT |domain| |n|) |fgg|
                                |pair| |alias| |options| |$tracedModemap|))
                       (|setSf| |traceName| |tf|))
                      (#1#
                       (SETQ |traceName| (BPITRACE |dn1| |alias| |options|))
                       (SETQ |tf| (SYMBOL-FUNCTION |traceName|))))
                     (NCONC |pair|
                            (LIST |listOfVariables| (CAR (ELT |domain| |n|))
                                  |traceName| |alias|))
                     (|rplac| (CAR (ELT |domain| |n|)) |tf|)))))
             (SETQ |bfVar#63| (CDR |bfVar#63|))))
          |sigSlotNumberAlist| NIL)
         (SETQ |sigSlotNumberAlist|
                 ((LAMBDA (|bfVar#65| |bfVar#64| |x|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#64|)
                           (PROGN (SETQ |x| (CAR |bfVar#64|)) NIL))
                       (RETURN (NREVERSE |bfVar#65|)))
                      (#1#
                       (AND (CDDDR |x|)
                            (SETQ |bfVar#65| (CONS |x| |bfVar#65|)))))
                     (SETQ |bfVar#64| (CDR |bfVar#64|))))
                  NIL |sigSlotNumberAlist| NIL))
         (COND
          (|$reportSpadTrace| (COND (|$traceNoisely| (|printDashedLine|)))
           ((LAMBDA (|bfVar#66| |x|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#66|) (PROGN (SETQ |x| (CAR |bfVar#66|)) NIL))
                 (RETURN NIL))
                (#1# (|reportSpadTrace| 'TRACING |x|)))
               (SETQ |bfVar#66| (CDR |bfVar#66|))))
            (|orderBySlotNumber| |sigSlotNumberAlist|) NIL)))
         (COND
          (|currentEntry|
           (|rplac| (CDR |currentEntry|)
            (APPEND |sigSlotNumberAlist| |currentAlist|)))
          (#1#
           (PROGN
            (SETQ /TRACENAMES
                    (CONS (CONS |domain| |sigSlotNumberAlist|) /TRACENAMES))
            (|spadReply|)))))))))))
(DEFUN |spadTrace,isTraceable| (|x| |domain|)
  (PROG (|n| |functionSlot|)
    (RETURN
     (PROGN
      (SETQ |n| (CADDR |x|))
      (COND ((ATOM (ELT |domain| |n|)) NIL)
            (#1='T
             (PROGN
              (SETQ |functionSlot| (CAR (ELT |domain| |n|)))
              (COND
               ((GENSYMP |functionSlot|)
                (PROGN (|reportSpadTrace| '|Already Traced| |x|) NIL))
               ((NULL (BPINAME |functionSlot|))
                (PROGN (|reportSpadTrace| '|No function for| |x|) NIL))
               (#1# T)))))))))
(DEFUN |spadTrace,g| (|x|)
  (PROG () (RETURN (COND ((STRINGP |x|) (INTERN |x|)) ('T |x|)))))
 
; goGetTracer0(fn, alias, options, modemap) ==
;     $tracedModemap : local := modemap
;     BPITRACE(fn, alias, options)
 
(DEFUN |goGetTracer0| (|fn| |alias| |options| |modemap|)
  (PROG (|$tracedModemap|)
    (DECLARE (SPECIAL |$tracedModemap|))
    (RETURN
     (PROGN
      (SETQ |$tracedModemap| |modemap|)
      (BPITRACE |fn| |alias| |options|)))))
 
; goGetTracer(l, dn, f, tlst, alias, options, modemap) ==
;     oname := tlst.5
;     rplac(first dn, f)
;     [:arglist, env] := l
;     slot := replaceGoGetSlot env
;     tlst.4 := first slot
;     traceName := goGetTracer0(first slot, alias, options, modemap)
;     nf := SYMBOL_-FUNCTION traceName
;     setSf(oname, nf)
;     rplac(first slot, nf)
;     APPLY(first slot, [:arglist, rest slot])  --SPADCALL it!
 
(DEFUN |goGetTracer| (|l| |dn| |f| |tlst| |alias| |options| |modemap|)
  (PROG (|oname| |LETTMP#1| |env| |arglist| |slot| |traceName| |nf|)
    (RETURN
     (PROGN
      (SETQ |oname| (ELT |tlst| 5))
      (|rplac| (CAR |dn|) |f|)
      (SETQ |LETTMP#1| (REVERSE |l|))
      (SETQ |env| (CAR |LETTMP#1|))
      (SETQ |arglist| (NREVERSE (CDR |LETTMP#1|)))
      (SETQ |slot| (|replaceGoGetSlot| |env|))
      (SETF (ELT |tlst| 4) (CAR |slot|))
      (SETQ |traceName|
              (|goGetTracer0| (CAR |slot|) |alias| |options| |modemap|))
      (SETQ |nf| (SYMBOL-FUNCTION |traceName|))
      (|setSf| |oname| |nf|)
      (|rplac| (CAR |slot|) |nf|)
      (APPLY (CAR |slot|) (APPEND |arglist| (CONS (CDR |slot|) NIL)))))))
 
; traceDomainLocalOps(dom,lops,options) ==
;  sayMSG ['"  ",'"The )local option has been withdrawn"]
;  sayMSG ['"  ",'"Use )ltr to trace local functions."]
;  NIL
 
(DEFUN |traceDomainLocalOps| (|dom| |lops| |options|)
  (PROG ()
    (RETURN
     (PROGN
      (|sayMSG| (LIST "  " "The )local option has been withdrawn"))
      (|sayMSG| (LIST "  " "Use )ltr to trace local functions."))
      NIL))))
 
; untraceDomainLocalOps(dom,lops) ==
;  sayMSG ['"  ",:bright abb,'"has no local functions to untrace."]
;  NIL
 
(DEFUN |untraceDomainLocalOps| (|dom| |lops|)
  (PROG ()
    (RETURN
     (PROGN
      (|sayMSG|
       (CONS "  "
             (APPEND (|bright| |abb|)
                     (CONS "has no local functions to untrace." NIL))))
      NIL))))
 
; untraceAllDomainLocalOps(dom) == NIL
 
(DEFUN |untraceAllDomainLocalOps| (|dom|) (PROG () (RETURN NIL)))
 
; traceDomainConstructor(domainConstructor,options) ==
;   -- Trace all domains built with the given domain constructor,
;   -- including all presently instantiated domains, and all future
;   -- instantiations, while domain constructor is traced.
;   loadFunctor domainConstructor
;   listOfLocalOps := getOption("LOCAL",options)
;   if listOfLocalOps then
;     traceDomainLocalOps(domainConstructor,listOfLocalOps,
;       [opt for opt in options | opt isnt ['LOCAL,:.]])
;   listOfLocalOps and not getOption("OPS",options) => NIL
;   for [argl,.,:domain] in HGET($ConstructorCache,domainConstructor)
;     repeat spadTrace(domain,options)
;   SETQ(_/TRACENAMES,[domainConstructor,:_/TRACENAMES])
;   innerDomainConstructor := INTERN STRCONC(domainConstructor,'";")
;   if FBOUNDP innerDomainConstructor then domainConstructor := innerDomainConstructor
;   EMBED(domainConstructor,
;     ['LAMBDA, ['_&REST, 'args],
;       ['PROG, ['domain],
;         ['SETQ,'domain,['APPLY,domainConstructor,'args]],
;         ['spadTrace,'domain,MKQ options],
;         ['RETURN,'domain]]] )
 
(DEFUN |traceDomainConstructor| (|domainConstructor| |options|)
  (PROG (|listOfLocalOps| |argl| |ISTMP#1| |domain| |innerDomainConstructor|)
    (RETURN
     (PROGN
      (|loadFunctor| |domainConstructor|)
      (SETQ |listOfLocalOps| (|getOption| 'LOCAL |options|))
      (COND
       (|listOfLocalOps|
        (|traceDomainLocalOps| |domainConstructor| |listOfLocalOps|
         ((LAMBDA (|bfVar#68| |bfVar#67| |opt|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#67|) (PROGN (SETQ |opt| (CAR |bfVar#67|)) NIL))
               (RETURN (NREVERSE |bfVar#68|)))
              (#1='T
               (AND (NOT (AND (CONSP |opt|) (EQ (CAR |opt|) 'LOCAL)))
                    (SETQ |bfVar#68| (CONS |opt| |bfVar#68|)))))
             (SETQ |bfVar#67| (CDR |bfVar#67|))))
          NIL |options| NIL))))
      (COND ((AND |listOfLocalOps| (NULL (|getOption| 'OPS |options|))) NIL)
            (#1#
             (PROGN
              ((LAMBDA (|bfVar#70| |bfVar#69|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#70|)
                        (PROGN (SETQ |bfVar#69| (CAR |bfVar#70|)) NIL))
                    (RETURN NIL))
                   (#1#
                    (AND (CONSP |bfVar#69|)
                         (PROGN
                          (SETQ |argl| (CAR |bfVar#69|))
                          (SETQ |ISTMP#1| (CDR |bfVar#69|))
                          (AND (CONSP |ISTMP#1|)
                               (PROGN (SETQ |domain| (CDR |ISTMP#1|)) #1#)))
                         (|spadTrace| |domain| |options|))))
                  (SETQ |bfVar#70| (CDR |bfVar#70|))))
               (HGET |$ConstructorCache| |domainConstructor|) NIL)
              (SETQ /TRACENAMES (CONS |domainConstructor| /TRACENAMES))
              (SETQ |innerDomainConstructor|
                      (INTERN (STRCONC |domainConstructor| ";")))
              (COND
               ((FBOUNDP |innerDomainConstructor|)
                (SETQ |domainConstructor| |innerDomainConstructor|)))
              (EMBED |domainConstructor|
               (LIST 'LAMBDA (LIST '&REST '|args|)
                     (LIST 'PROG (LIST '|domain|)
                           (LIST 'SETQ '|domain|
                                 (LIST 'APPLY |domainConstructor| '|args|))
                           (LIST '|spadTrace| '|domain| (MKQ |options|))
                           (LIST 'RETURN '|domain|)))))))))))
 
; untraceDomainConstructor domainConstructor ==
;   --untrace all the domains in domainConstructor, and unembed it
;   SETQ(_/TRACENAMES,
;     [df for df in _/TRACENAMES | keepTraced?(df, domainConstructor)]) where
;       keepTraced?(df, domainConstructor) ==
;         (df is [dc,:.]) and (isDomainOrPackage dc) and
;            ((IFCAR devaluate dc) = domainConstructor) =>
;                _/UNTRACE_-2(dc, [])
;                false
;         true
;   untraceAllDomainLocalOps domainConstructor
;   innerDomainConstructor := INTERN STRCONC(domainConstructor,'";")
;   if FBOUNDP innerDomainConstructor then UNEMBED innerDomainConstructor
;     else UNEMBED domainConstructor
;   SETQ(_/TRACENAMES,delete(domainConstructor,_/TRACENAMES))
 
(DEFUN |untraceDomainConstructor| (|domainConstructor|)
  (PROG (|innerDomainConstructor|)
    (RETURN
     (PROGN
      (SETQ /TRACENAMES
              ((LAMBDA (|bfVar#72| |bfVar#71| |df|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#71|)
                        (PROGN (SETQ |df| (CAR |bfVar#71|)) NIL))
                    (RETURN (NREVERSE |bfVar#72|)))
                   (#1='T
                    (AND
                     (|untraceDomainConstructor,keepTraced?| |df|
                      |domainConstructor|)
                     (SETQ |bfVar#72| (CONS |df| |bfVar#72|)))))
                  (SETQ |bfVar#71| (CDR |bfVar#71|))))
               NIL /TRACENAMES NIL))
      (|untraceAllDomainLocalOps| |domainConstructor|)
      (SETQ |innerDomainConstructor|
              (INTERN (STRCONC |domainConstructor| ";")))
      (COND
       ((FBOUNDP |innerDomainConstructor|) (UNEMBED |innerDomainConstructor|))
       (#1# (UNEMBED |domainConstructor|)))
      (SETQ /TRACENAMES (|delete| |domainConstructor| /TRACENAMES))))))
(DEFUN |untraceDomainConstructor,keepTraced?| (|df| |domainConstructor|)
  (PROG (|dc|)
    (RETURN
     (COND
      ((AND (CONSP |df|) (PROGN (SETQ |dc| (CAR |df|)) #1='T)
            (|isDomainOrPackage| |dc|)
            (EQUAL (IFCAR (|devaluate| |dc|)) |domainConstructor|))
       (PROGN (/UNTRACE-2 |dc| NIL) NIL))
      (#1# T)))))
 
; flattenOperationAlist(opAlist) ==
;    res:= nil
;    for [op,:mmList] in opAlist repeat
;      res:=[:res,:[[op,:mm] for mm in mmList]]
;    res
 
(DEFUN |flattenOperationAlist| (|opAlist|)
  (PROG (|res| |op| |mmList|)
    (RETURN
     (PROGN
      (SETQ |res| NIL)
      ((LAMBDA (|bfVar#74| |bfVar#73|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#74|)
                (PROGN (SETQ |bfVar#73| (CAR |bfVar#74|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#73|)
                 (PROGN
                  (SETQ |op| (CAR |bfVar#73|))
                  (SETQ |mmList| (CDR |bfVar#73|))
                  #1#)
                 (SETQ |res|
                         (APPEND |res|
                                 ((LAMBDA (|bfVar#76| |bfVar#75| |mm|)
                                    (LOOP
                                     (COND
                                      ((OR (ATOM |bfVar#75|)
                                           (PROGN
                                            (SETQ |mm| (CAR |bfVar#75|))
                                            NIL))
                                       (RETURN (NREVERSE |bfVar#76|)))
                                      (#1#
                                       (SETQ |bfVar#76|
                                               (CONS (CONS |op| |mm|)
                                                     |bfVar#76|))))
                                     (SETQ |bfVar#75| (CDR |bfVar#75|))))
                                  NIL |mmList| NIL))))))
          (SETQ |bfVar#74| (CDR |bfVar#74|))))
       |opAlist| NIL)
      |res|))))
 
; mapLetPrint(x,val,currentFunction) ==
;   x:= getAliasIfTracedMapParameter(x,currentFunction)
;   currentFunction:= getBpiNameIfTracedMap currentFunction
;   letPrint(x,val,currentFunction)
 
(DEFUN |mapLetPrint| (|x| |val| |currentFunction|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |x| (|getAliasIfTracedMapParameter| |x| |currentFunction|))
      (SETQ |currentFunction| (|getBpiNameIfTracedMap| |currentFunction|))
      (|letPrint| |x| |val| |currentFunction|)))))
 
; letPrint(x,val,currentFunction) ==
;   if $letAssoc and
;     ((y:= LASSOC(currentFunction,$letAssoc)) or (y:= LASSOC("all",$letAssoc))) then
;       if (y="all" or MEMQ(x,y)) and
;         not (IS_GENVAR(x) or isSharpVarWithNum(x) or GENSYMP x) then
;          sayBrightlyNT [:bright x,": "]
;          PRIN0 shortenForPrinting val
;          TERPRI()
;       if (y:= hasPair("BREAK",y)) and
;         (y="all" or MEMQ(x,y) and
;           (not MEMQ((PNAME x).(0),'($ _#)) and not GENSYMP x)) then
;             break [:bright currentFunction,'"breaks after",:bright x,'":= ",
;               shortenForPrinting val]
;   val
 
(DEFUN |letPrint| (|x| |val| |currentFunction|)
  (PROG (|y|)
    (RETURN
     (PROGN
      (COND
       ((AND |$letAssoc|
             (OR (SETQ |y| (LASSOC |currentFunction| |$letAssoc|))
                 (SETQ |y| (LASSOC '|all| |$letAssoc|))))
        (COND
         ((AND (OR (EQ |y| '|all|) (MEMQ |x| |y|))
               (NULL
                (OR (IS_GENVAR |x|) (|isSharpVarWithNum| |x|) (GENSYMP |x|))))
          (|sayBrightlyNT| (APPEND (|bright| |x|) (CONS '|: | NIL)))
          (PRIN0 (|shortenForPrinting| |val|)) (TERPRI)))
        (COND
         ((AND (SETQ |y| (|hasPair| 'BREAK |y|))
               (OR (EQ |y| '|all|)
                   (AND (MEMQ |x| |y|)
                        (NULL (MEMQ (ELT (PNAME |x|) 0) '($ |#|)))
                        (NULL (GENSYMP |x|)))))
          (|break|
           (APPEND (|bright| |currentFunction|)
                   (CONS "breaks after"
                         (APPEND (|bright| |x|)
                                 (CONS ":= "
                                       (CONS (|shortenForPrinting| |val|)
                                             NIL))))))))))
      |val|))))
 
; letPrint2(x,printform,currentFunction) ==
;   $BreakMode:local := nil
;   if $letAssoc and
;     ((y:= LASSOC(currentFunction,$letAssoc)) or (y:= LASSOC("all",$letAssoc))) then
;       if (y="all" or MEMQ(x,y)) and
;         not (IS_GENVAR(x) or isSharpVarWithNum(x) or GENSYMP x) then
;          $BreakMode:='letPrint2
;          flag:=nil
;          CATCH('letPrint2,mathprint ["=",x,printform],flag)
;          if flag='letPrint2 then print printform
;       if (y:= hasPair("BREAK",y)) and
;         (y="all" or MEMQ(x,y) and
;           (not MEMQ((PNAME x).(0),'($ _#)) and not GENSYMP x)) then
;             break [:bright currentFunction,'"breaks after",:bright x,":= ",
;               printform]
;   x
 
(DEFUN |letPrint2| (|x| |printform| |currentFunction|)
  (PROG (|$BreakMode| |flag| |y|)
    (DECLARE (SPECIAL |$BreakMode|))
    (RETURN
     (PROGN
      (SETQ |$BreakMode| NIL)
      (COND
       ((AND |$letAssoc|
             (OR (SETQ |y| (LASSOC |currentFunction| |$letAssoc|))
                 (SETQ |y| (LASSOC '|all| |$letAssoc|))))
        (COND
         ((AND (OR (EQ |y| '|all|) (MEMQ |x| |y|))
               (NULL
                (OR (IS_GENVAR |x|) (|isSharpVarWithNum| |x|) (GENSYMP |x|))))
          (SETQ |$BreakMode| '|letPrint2|) (SETQ |flag| NIL)
          (CATCH '|letPrint2| (|mathprint| (LIST '= |x| |printform|)) |flag|)
          (COND ((EQ |flag| '|letPrint2|) (|print| |printform|)))))
        (COND
         ((AND (SETQ |y| (|hasPair| 'BREAK |y|))
               (OR (EQ |y| '|all|)
                   (AND (MEMQ |x| |y|)
                        (NULL (MEMQ (ELT (PNAME |x|) 0) '($ |#|)))
                        (NULL (GENSYMP |x|)))))
          (|break|
           (APPEND (|bright| |currentFunction|)
                   (CONS "breaks after"
                         (APPEND (|bright| |x|)
                                 (CONS '|:= | (CONS |printform| NIL))))))))))
      |x|))))
 
; letPrint3(x,xval,printfn,currentFunction) ==
;   $BreakMode:local := nil
;   if $letAssoc and
;     ((y:= LASSOC(currentFunction,$letAssoc)) or (y:= LASSOC("all",$letAssoc))) then
;       if (y="all" or MEMQ(x,y)) and
;         not (IS_GENVAR(x) or isSharpVarWithNum(x) or GENSYMP x) then
;          $BreakMode:='letPrint2
;          flag:=nil
;          CATCH('letPrint2,mathprint ["=",x,SPADCALL(xval,printfn)],flag)
;          if flag='letPrint2 then print xval
;       if (y:= hasPair("BREAK",y)) and
;         (y="all" or MEMQ(x,y) and
;           (not MEMQ((PNAME x).(0),'($ _#)) and not GENSYMP x)) then
;             break [:bright currentFunction,'"breaks after",:bright x,'":= ",
;               xval]
;   x
 
(DEFUN |letPrint3| (|x| |xval| |printfn| |currentFunction|)
  (PROG (|$BreakMode| |flag| |y|)
    (DECLARE (SPECIAL |$BreakMode|))
    (RETURN
     (PROGN
      (SETQ |$BreakMode| NIL)
      (COND
       ((AND |$letAssoc|
             (OR (SETQ |y| (LASSOC |currentFunction| |$letAssoc|))
                 (SETQ |y| (LASSOC '|all| |$letAssoc|))))
        (COND
         ((AND (OR (EQ |y| '|all|) (MEMQ |x| |y|))
               (NULL
                (OR (IS_GENVAR |x|) (|isSharpVarWithNum| |x|) (GENSYMP |x|))))
          (SETQ |$BreakMode| '|letPrint2|) (SETQ |flag| NIL)
          (CATCH '|letPrint2|
            (|mathprint| (LIST '= |x| (SPADCALL |xval| |printfn|)))
            |flag|)
          (COND ((EQ |flag| '|letPrint2|) (|print| |xval|)))))
        (COND
         ((AND (SETQ |y| (|hasPair| 'BREAK |y|))
               (OR (EQ |y| '|all|)
                   (AND (MEMQ |x| |y|)
                        (NULL (MEMQ (ELT (PNAME |x|) 0) '($ |#|)))
                        (NULL (GENSYMP |x|)))))
          (|break|
           (APPEND (|bright| |currentFunction|)
                   (CONS "breaks after"
                         (APPEND (|bright| |x|)
                                 (CONS ":= " (CONS |xval| NIL))))))))))
      |x|))))
 
; getAliasIfTracedMapParameter(x,currentFunction) ==
;   isSharpVarWithNum x =>
;     aliasList:= get(currentFunction,'alias,$InteractiveFrame) =>
;       aliasList.(STRING2PINT_-N(SUBSTRING(PNAME x,1,NIL),1)-1)
;   x
 
(DEFUN |getAliasIfTracedMapParameter| (|x| |currentFunction|)
  (PROG (|aliasList|)
    (RETURN
     (COND
      ((|isSharpVarWithNum| |x|)
       (COND
        ((SETQ |aliasList|
                 (|get| |currentFunction| '|alias| |$InteractiveFrame|))
         (IDENTITY
          (ELT |aliasList|
               (- (STRING2PINT-N (SUBSTRING (PNAME |x|) 1 NIL) 1) 1))))))
      ('T |x|)))))
 
; getBpiNameIfTracedMap(name) ==
;   lmm:= get(name,'localModemap,$InteractiveFrame) =>
;     MEMQ(bpiName:= CADAR lmm,_/TRACENAMES) => bpiName
;   name
 
(DEFUN |getBpiNameIfTracedMap| (|name|)
  (PROG (|lmm| |bpiName|)
    (RETURN
     (COND
      ((SETQ |lmm| (|get| |name| '|localModemap| |$InteractiveFrame|))
       (COND
        ((MEMQ (SETQ |bpiName| (CADAR |lmm|)) /TRACENAMES)
         (IDENTITY |bpiName|))))
      ('T |name|)))))
 
; hasPair(key,l) ==
;   atom l => nil
;   l is [[ =key,:a],:.] => a
;   hasPair(key,rest l)
 
(DEFUN |hasPair| (|key| |l|)
  (PROG (|ISTMP#1| |a|)
    (RETURN
     (COND ((ATOM |l|) NIL)
           ((AND (CONSP |l|)
                 (PROGN
                  (SETQ |ISTMP#1| (CAR |l|))
                  (AND (CONSP |ISTMP#1|) (EQUAL (CAR |ISTMP#1|) |key|)
                       (PROGN (SETQ |a| (CDR |ISTMP#1|)) #1='T))))
            |a|)
           (#1# (|hasPair| |key| (CDR |l|)))))))
 
; shortenForPrinting val ==
;   isDomainOrPackage val => devaluate val
;   val
 
(DEFUN |shortenForPrinting| (|val|)
  (PROG ()
    (RETURN
     (COND ((|isDomainOrPackage| |val|) (|devaluate| |val|)) ('T |val|)))))
 
; spadTraceAlias(domainId,op,n) ==
;   INTERNL(domainId,".",op,",",STRINGIMAGE n)
 
(DEFUN |spadTraceAlias| (|domainId| |op| |n|)
  (PROG () (RETURN (INTERNL |domainId| '|.| |op| '|,| (STRINGIMAGE |n|)))))
 
; getOption(opt,l) ==
;   y:= assoc(opt,l) => rest y
 
(DEFUN |getOption| (|opt| |l|)
  (PROG (|y|)
    (RETURN (COND ((SETQ |y| (|assoc| |opt| |l|)) (IDENTITY (CDR |y|)))))))
 
; reportSpadTrace(header,[op,sig,n,:t]) ==
;   null $traceNoisely => nil
;   msg:= [header,'%b,op,":",'%d,rest sig," -> ",first sig," in slot ",n]
;   namePart:= nil --(t is (.,.,name,:.) => (" named ",name); NIL)
;   tracePart:=
;     t is [y,:.] and not null y =>
;       (y="all" => ['%b,"all",'%d,"vars"]; [" vars: ",y])
;     NIL
;   sayBrightly [:msg,:namePart,:tracePart]
 
(DEFUN |reportSpadTrace| (|header| |bfVar#77|)
  (PROG (|op| |sig| |n| |t| |msg| |namePart| |y| |tracePart|)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |bfVar#77|))
      (SETQ |sig| (CADR . #1=(|bfVar#77|)))
      (SETQ |n| (CADDR . #1#))
      (SETQ |t| (CDDDR . #1#))
      (COND ((NULL |$traceNoisely|) NIL)
            (#2='T
             (PROGN
              (SETQ |msg|
                      (LIST |header| '|%b| |op| '|:| '|%d| (CDR |sig|) '| -> |
                            (CAR |sig|) '| in slot | |n|))
              (SETQ |namePart| NIL)
              (SETQ |tracePart|
                      (COND
                       ((AND (CONSP |t|) (PROGN (SETQ |y| (CAR |t|)) #2#)
                             (NULL (NULL |y|)))
                        (COND
                         ((EQ |y| '|all|) (LIST '|%b| '|all| '|%d| '|vars|))
                         (#2# (LIST '| vars: | |y|))))
                       (#2# NIL)))
              (|sayBrightly|
               (APPEND |msg| (APPEND |namePart| |tracePart|))))))))))
 
; orderBySlotNumber l ==
;   ASSOCRIGHT orderList [[n,:x] for (x:= [.,.,n,:.]) in l]
 
(DEFUN |orderBySlotNumber| (|l|)
  (PROG (|ISTMP#1| |ISTMP#2| |n|)
    (RETURN
     (ASSOCRIGHT
      (|orderList|
       ((LAMBDA (|bfVar#79| |bfVar#78| |x|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#78|) (PROGN (SETQ |x| (CAR |bfVar#78|)) NIL))
             (RETURN (NREVERSE |bfVar#79|)))
            (#1='T
             (AND (CONSP |x|)
                  (PROGN
                   (SETQ |ISTMP#1| (CDR |x|))
                   (AND (CONSP |ISTMP#1|)
                        (PROGN
                         (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                         (AND (CONSP |ISTMP#2|)
                              (PROGN (SETQ |n| (CAR |ISTMP#2|)) #1#)))))
                  (SETQ |bfVar#79| (CONS (CONS |n| |x|) |bfVar#79|)))))
           (SETQ |bfVar#78| (CDR |bfVar#78|))))
        NIL |l| NIL))))))
 
; _/TRACEREPLY() ==
;   null _/TRACENAMES => MAKESTRING '"   Nothing is traced."
;   for x in _/TRACENAMES repeat
;     x is [d,:.] and isDomainOrPackage d =>
;       domainList:= [devaluate d,:domainList]
;     functionList:= [x,:functionList]
;   [:functionList,:domainList,"traced"]
 
(DEFUN /TRACEREPLY ()
  (PROG (|functionList| |domainList| |d|)
    (RETURN
     (COND ((NULL /TRACENAMES) (MAKESTRING "   Nothing is traced."))
           (#1='T
            (PROGN
             ((LAMBDA (|bfVar#80| |x|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#80|)
                       (PROGN (SETQ |x| (CAR |bfVar#80|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (COND
                    ((AND (CONSP |x|) (PROGN (SETQ |d| (CAR |x|)) #1#)
                          (|isDomainOrPackage| |d|))
                     (SETQ |domainList| (CONS (|devaluate| |d|) |domainList|)))
                    (#1# (SETQ |functionList| (CONS |x| |functionList|))))))
                 (SETQ |bfVar#80| (CDR |bfVar#80|))))
              /TRACENAMES NIL)
             (APPEND |functionList|
                     (APPEND |domainList| (CONS '|traced| NIL)))))))))
 
; spadReply() ==
;   [printName x for x in _/TRACENAMES] where
;     printName x ==
;       x is [d,:.] and isDomainOrPackage d => devaluate d
;       x
 
(DEFUN |spadReply| ()
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#82| |bfVar#81| |x|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#81|) (PROGN (SETQ |x| (CAR |bfVar#81|)) NIL))
           (RETURN (NREVERSE |bfVar#82|)))
          ('T (SETQ |bfVar#82| (CONS (|spadReply,printName| |x|) |bfVar#82|))))
         (SETQ |bfVar#81| (CDR |bfVar#81|))))
      NIL /TRACENAMES NIL))))
(DEFUN |spadReply,printName| (|x|)
  (PROG (|d|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (PROGN (SETQ |d| (CAR |x|)) #1='T)
            (|isDomainOrPackage| |d|))
       (|devaluate| |d|))
      (#1# |x|)))))
 
; spadUntrace(domain,options) ==
;   not isDomainOrPackage domain => userError '"bad argument to untrace"
;   anyifTrue:= null options
;   listOfOperations:= getOption("ops:",options)
;   domainId := devaluate domain
;   null (pair:= assoc(domain,_/TRACENAMES)) =>
;     sayMSG ['"   No functions in",
;       :bright prefix2String domainId,'"are now traced."]
;   sigSlotNumberAlist:= rest pair
;   for (pair:= [op,sig,n,lv,bpiPointer,traceName,alias]) in sigSlotNumberAlist |
;     anyifTrue or MEMQ(op,listOfOperations) repeat
;       BPIUNTRACE(traceName,alias)
;       rplac(first domain.n, bpiPointer)
;       rplac(CDDDR pair, nil)
;       if assocPair:= assoc(BPINAME bpiPointer,$letAssoc) then
;         $letAssoc := REMOVER($letAssoc,assocPair)
;   newSigSlotNumberAlist:= [x for x in sigSlotNumberAlist | CDDDR x]
;   newSigSlotNumberAlist => rplac(rest pair, newSigSlotNumberAlist)
;   SETQ(_/TRACENAMES,DELASC(domain,_/TRACENAMES))
;   spadReply()
 
(DEFUN |spadUntrace| (|domain| |options|)
  (PROG (|anyifTrue| |listOfOperations| |domainId| |pair| |sigSlotNumberAlist|
         |op| |ISTMP#1| |sig| |ISTMP#2| |n| |ISTMP#3| |lv| |ISTMP#4|
         |bpiPointer| |ISTMP#5| |traceName| |ISTMP#6| |alias| |assocPair|
         |newSigSlotNumberAlist|)
    (RETURN
     (COND
      ((NULL (|isDomainOrPackage| |domain|))
       (|userError| "bad argument to untrace"))
      (#1='T
       (PROGN
        (SETQ |anyifTrue| (NULL |options|))
        (SETQ |listOfOperations| (|getOption| '|ops:| |options|))
        (SETQ |domainId| (|devaluate| |domain|))
        (COND
         ((NULL (SETQ |pair| (|assoc| |domain| /TRACENAMES)))
          (|sayMSG|
           (CONS "   No functions in"
                 (APPEND (|bright| (|prefix2String| |domainId|))
                         (CONS "are now traced." NIL)))))
         (#1#
          (PROGN
           (SETQ |sigSlotNumberAlist| (CDR |pair|))
           ((LAMBDA (|bfVar#83| |pair|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#83|)
                     (PROGN (SETQ |pair| (CAR |bfVar#83|)) NIL))
                 (RETURN NIL))
                (#1#
                 (AND (CONSP |pair|)
                      (PROGN
                       (SETQ |op| (CAR |pair|))
                       (SETQ |ISTMP#1| (CDR |pair|))
                       (AND (CONSP |ISTMP#1|)
                            (PROGN
                             (SETQ |sig| (CAR |ISTMP#1|))
                             (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                             (AND (CONSP |ISTMP#2|)
                                  (PROGN
                                   (SETQ |n| (CAR |ISTMP#2|))
                                   (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                                   (AND (CONSP |ISTMP#3|)
                                        (PROGN
                                         (SETQ |lv| (CAR |ISTMP#3|))
                                         (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                                         (AND (CONSP |ISTMP#4|)
                                              (PROGN
                                               (SETQ |bpiPointer|
                                                       (CAR |ISTMP#4|))
                                               (SETQ |ISTMP#5| (CDR |ISTMP#4|))
                                               (AND (CONSP |ISTMP#5|)
                                                    (PROGN
                                                     (SETQ |traceName|
                                                             (CAR |ISTMP#5|))
                                                     (SETQ |ISTMP#6|
                                                             (CDR |ISTMP#5|))
                                                     (AND (CONSP |ISTMP#6|)
                                                          (EQ (CDR |ISTMP#6|)
                                                              NIL)
                                                          (PROGN
                                                           (SETQ |alias|
                                                                   (CAR
                                                                    |ISTMP#6|))
                                                           #1#)))))))))))))
                      (OR |anyifTrue| (MEMQ |op| |listOfOperations|))
                      (PROGN
                       (BPIUNTRACE |traceName| |alias|)
                       (|rplac| (CAR (ELT |domain| |n|)) |bpiPointer|)
                       (|rplac| (CDDDR |pair|) NIL)
                       (COND
                        ((SETQ |assocPair|
                                 (|assoc| (BPINAME |bpiPointer|) |$letAssoc|))
                         (SETQ |$letAssoc|
                                 (REMOVER |$letAssoc| |assocPair|))))))))
               (SETQ |bfVar#83| (CDR |bfVar#83|))))
            |sigSlotNumberAlist| NIL)
           (SETQ |newSigSlotNumberAlist|
                   ((LAMBDA (|bfVar#85| |bfVar#84| |x|)
                      (LOOP
                       (COND
                        ((OR (ATOM |bfVar#84|)
                             (PROGN (SETQ |x| (CAR |bfVar#84|)) NIL))
                         (RETURN (NREVERSE |bfVar#85|)))
                        (#1#
                         (AND (CDDDR |x|)
                              (SETQ |bfVar#85| (CONS |x| |bfVar#85|)))))
                       (SETQ |bfVar#84| (CDR |bfVar#84|))))
                    NIL |sigSlotNumberAlist| NIL))
           (COND
            (|newSigSlotNumberAlist|
             (|rplac| (CDR |pair|) |newSigSlotNumberAlist|))
            (#1#
             (PROGN
              (SETQ /TRACENAMES (DELASC |domain| /TRACENAMES))
              (|spadReply|)))))))))))))
 
; prTraceNames() ==
;   (for x in _/TRACENAMES repeat PRINT fn x; nil) where
;     fn x ==
;       x is [d,:t] and isDomainOrPackage d => [devaluate d,:t]
;       x
 
(DEFUN |prTraceNames| ()
  (PROG ()
    (RETURN
     (PROGN
      ((LAMBDA (|bfVar#86| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#86|) (PROGN (SETQ |x| (CAR |bfVar#86|)) NIL))
            (RETURN NIL))
           ('T (PRINT (|prTraceNames,fn| |x|))))
          (SETQ |bfVar#86| (CDR |bfVar#86|))))
       /TRACENAMES NIL)
      NIL))))
(DEFUN |prTraceNames,fn| (|x|)
  (PROG (|d| |t|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (PROGN (SETQ |d| (CAR |x|)) (SETQ |t| (CDR |x|)) #1='T)
            (|isDomainOrPackage| |d|))
       (CONS (|devaluate| |d|) |t|))
      (#1# |x|)))))
 
; traceReply() ==
;   $domains: local:= nil
;   $packages: local:= nil
;   $constructors: local:= nil
;   null _/TRACENAMES =>
;     sayMessage '"   Nothing is traced now."
;   sayBrightly '" "
;   for x in _/TRACENAMES repeat
;     x is [d,:.] and (isDomainOrPackage d) => addTraceItem d
;     atom x =>
;       isFunctor x => addTraceItem x
;       (IS_GENVAR x =>
;         addTraceItem EVAL x; functionList:= [x,:functionList])
;     userError '"bad argument to trace"
;   functionList:= "append"/[[rassocSub(x,$mapSubNameAlist),'" "]
;     for x in functionList | not isSubForRedundantMapName x]
;   if functionList then
;     2 = #functionList =>
;       sayMSG ["   Function traced: ",:functionList]
;     (22 + sayBrightlyLength functionList) <= $LINELENGTH =>
;       sayMSG ["   Functions traced: ",:functionList]
;     sayBrightly "   Functions traced:"
;     sayBrightly flowSegmentedMsg(functionList,$LINELENGTH,6)
;   if $domains then
;     displayList:= concat(prefix2String first $domains,
;           [:concat('",",'" ",prefix2String x) for x in rest $domains])
;     if atom displayList then displayList:= [displayList]
;     sayBrightly '"   Domains traced: "
;     sayBrightly flowSegmentedMsg(displayList,$LINELENGTH,6)
;   if $packages then
;     displayList:= concat(prefix2String first $packages,
;           [:concat(", ",prefix2String x) for x in rest $packages])
;     if atom displayList then displayList:= [displayList]
;     sayBrightly '"   Packages traced: "
;     sayBrightly flowSegmentedMsg(displayList,$LINELENGTH,6)
;   if $constructors then
;     displayList:= concat(abbreviate first $constructors,
;           [:concat(", ",abbreviate x) for x in rest $constructors])
;     if atom displayList then displayList:= [displayList]
;     sayBrightly '"   Parameterized constructors traced:"
;     sayBrightly flowSegmentedMsg(displayList,$LINELENGTH,6)
 
(DEFUN |traceReply| ()
  (PROG (|$constructors| |$packages| |$domains| |d| |functionList|
         |displayList|)
    (DECLARE (SPECIAL |$constructors| |$packages| |$domains|))
    (RETURN
     (PROGN
      (SETQ |$domains| NIL)
      (SETQ |$packages| NIL)
      (SETQ |$constructors| NIL)
      (COND ((NULL /TRACENAMES) (|sayMessage| "   Nothing is traced now."))
            (#1='T
             (PROGN
              (|sayBrightly| " ")
              ((LAMBDA (|bfVar#87| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#87|)
                        (PROGN (SETQ |x| (CAR |bfVar#87|)) NIL))
                    (RETURN NIL))
                   (#1#
                    (COND
                     ((AND (CONSP |x|) (PROGN (SETQ |d| (CAR |x|)) #1#)
                           (|isDomainOrPackage| |d|))
                      (|addTraceItem| |d|))
                     ((ATOM |x|)
                      (COND ((|isFunctor| |x|) (|addTraceItem| |x|))
                            (#1#
                             (COND
                              ((IS_GENVAR |x|) (|addTraceItem| (EVAL |x|)))
                              (#1#
                               (SETQ |functionList|
                                       (CONS |x| |functionList|)))))))
                     (#1# (|userError| "bad argument to trace")))))
                  (SETQ |bfVar#87| (CDR |bfVar#87|))))
               /TRACENAMES NIL)
              (SETQ |functionList|
                      ((LAMBDA (|bfVar#89| |bfVar#88| |x|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#88|)
                                (PROGN (SETQ |x| (CAR |bfVar#88|)) NIL))
                            (RETURN |bfVar#89|))
                           (#1#
                            (AND (NULL (|isSubForRedundantMapName| |x|))
                                 (SETQ |bfVar#89|
                                         (APPEND |bfVar#89|
                                                 (LIST
                                                  (|rassocSub| |x|
                                                   |$mapSubNameAlist|)
                                                  " "))))))
                          (SETQ |bfVar#88| (CDR |bfVar#88|))))
                       NIL |functionList| NIL))
              (COND
               (|functionList|
                (COND
                 ((EQL 2 (LENGTH |functionList|))
                  (|sayMSG| (CONS '|   Function traced: | |functionList|)))
                 ((NOT
                   (< $LINELENGTH (+ 22 (|sayBrightlyLength| |functionList|))))
                  (|sayMSG| (CONS '|   Functions traced: | |functionList|)))
                 (#1#
                  (PROGN
                   (|sayBrightly| '|   Functions traced:|)
                   (|sayBrightly|
                    (|flowSegmentedMsg| |functionList| $LINELENGTH 6)))))))
              (COND
               (|$domains|
                (SETQ |displayList|
                        (|concat| (|prefix2String| (CAR |$domains|))
                         ((LAMBDA (|bfVar#91| |bfVar#90| |x|)
                            (LOOP
                             (COND
                              ((OR (ATOM |bfVar#90|)
                                   (PROGN (SETQ |x| (CAR |bfVar#90|)) NIL))
                               (RETURN (NREVERSE |bfVar#91|)))
                              (#1#
                               (SETQ |bfVar#91|
                                       (APPEND
                                        (REVERSE
                                         (|concat| "," " "
                                          (|prefix2String| |x|)))
                                        |bfVar#91|))))
                             (SETQ |bfVar#90| (CDR |bfVar#90|))))
                          NIL (CDR |$domains|) NIL)))
                (COND
                 ((ATOM |displayList|)
                  (SETQ |displayList| (LIST |displayList|))))
                (|sayBrightly| "   Domains traced: ")
                (|sayBrightly|
                 (|flowSegmentedMsg| |displayList| $LINELENGTH 6))))
              (COND
               (|$packages|
                (SETQ |displayList|
                        (|concat| (|prefix2String| (CAR |$packages|))
                         ((LAMBDA (|bfVar#93| |bfVar#92| |x|)
                            (LOOP
                             (COND
                              ((OR (ATOM |bfVar#92|)
                                   (PROGN (SETQ |x| (CAR |bfVar#92|)) NIL))
                               (RETURN (NREVERSE |bfVar#93|)))
                              (#1#
                               (SETQ |bfVar#93|
                                       (APPEND
                                        (REVERSE
                                         (|concat| '|, |
                                          (|prefix2String| |x|)))
                                        |bfVar#93|))))
                             (SETQ |bfVar#92| (CDR |bfVar#92|))))
                          NIL (CDR |$packages|) NIL)))
                (COND
                 ((ATOM |displayList|)
                  (SETQ |displayList| (LIST |displayList|))))
                (|sayBrightly| "   Packages traced: ")
                (|sayBrightly|
                 (|flowSegmentedMsg| |displayList| $LINELENGTH 6))))
              (COND
               (|$constructors|
                (SETQ |displayList|
                        (|concat| (|abbreviate| (CAR |$constructors|))
                         ((LAMBDA (|bfVar#95| |bfVar#94| |x|)
                            (LOOP
                             (COND
                              ((OR (ATOM |bfVar#94|)
                                   (PROGN (SETQ |x| (CAR |bfVar#94|)) NIL))
                               (RETURN (NREVERSE |bfVar#95|)))
                              (#1#
                               (SETQ |bfVar#95|
                                       (APPEND
                                        (REVERSE
                                         (|concat| '|, | (|abbreviate| |x|)))
                                        |bfVar#95|))))
                             (SETQ |bfVar#94| (CDR |bfVar#94|))))
                          NIL (CDR |$constructors|) NIL)))
                (COND
                 ((ATOM |displayList|)
                  (SETQ |displayList| (LIST |displayList|))))
                (|sayBrightly| "   Parameterized constructors traced:")
                (|sayBrightly|
                 (|flowSegmentedMsg| |displayList| $LINELENGTH 6)))))))))))
 
; addTraceItem d ==
;   constructor? d => $constructors:=[d,:$constructors]
;   isDomain d => $domains:= [devaluate d,:$domains]
;   isDomainOrPackage d => $packages:= [devaluate d,:$packages]
 
(DEFUN |addTraceItem| (|d|)
  (PROG ()
    (RETURN
     (COND
      ((|constructor?| |d|) (SETQ |$constructors| (CONS |d| |$constructors|)))
      ((|isDomain| |d|) (SETQ |$domains| (CONS (|devaluate| |d|) |$domains|)))
      ((|isDomainOrPackage| |d|)
       (SETQ |$packages| (CONS (|devaluate| |d|) |$packages|)))))))
 
; _?t() ==
;   null _/TRACENAMES => sayMSG bright '"nothing is traced"
;   for x in _/TRACENAMES | atom x and not IS_GENVAR x repeat
;     if llm:= get(x,'localModemap,$InteractiveFrame) then
;       x:= (LIST (CADAR llm))
;     sayMSG ['"Function",:bright rassocSub(x,$mapSubNameAlist),'"traced"]
;   for x in _/TRACENAMES | x is [d,:l] and isDomainOrPackage d repeat
;     suffix:=
;       isDomain d => '"domain"
;       '"package"
;     sayBrightly ['"   Functions traced in ",suffix,'%b,devaluate d,'%d,":"]
;     for x in orderBySlotNumber l repeat reportSpadTrace("   ",take(4,x))
;     TERPRI()
 
(DEFUN |?t| ()
  (PROG (|suffix| |l| |d| |llm|)
    (RETURN
     (COND ((NULL /TRACENAMES) (|sayMSG| (|bright| "nothing is traced")))
           (#1='T
            (PROGN
             ((LAMBDA (|bfVar#96| |x|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#96|)
                       (PROGN (SETQ |x| (CAR |bfVar#96|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (AND (ATOM |x|) (NULL (IS_GENVAR |x|))
                        (PROGN
                         (COND
                          ((SETQ |llm|
                                   (|get| |x| '|localModemap|
                                    |$InteractiveFrame|))
                           (SETQ |x| (LIST (CADAR |llm|)))))
                         (|sayMSG|
                          (CONS "Function"
                                (APPEND
                                 (|bright|
                                  (|rassocSub| |x| |$mapSubNameAlist|))
                                 (CONS "traced" NIL))))))))
                 (SETQ |bfVar#96| (CDR |bfVar#96|))))
              /TRACENAMES NIL)
             ((LAMBDA (|bfVar#97| |x|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#97|)
                       (PROGN (SETQ |x| (CAR |bfVar#97|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (AND (CONSP |x|)
                        (PROGN (SETQ |d| (CAR |x|)) (SETQ |l| (CDR |x|)) #1#)
                        (|isDomainOrPackage| |d|)
                        (PROGN
                         (SETQ |suffix|
                                 (COND ((|isDomain| |d|) "domain")
                                       (#1# "package")))
                         (|sayBrightly|
                          (LIST "   Functions traced in " |suffix| '|%b|
                                (|devaluate| |d|) '|%d| '|:|))
                         ((LAMBDA (|bfVar#98| |x|)
                            (LOOP
                             (COND
                              ((OR (ATOM |bfVar#98|)
                                   (PROGN (SETQ |x| (CAR |bfVar#98|)) NIL))
                               (RETURN NIL))
                              (#1# (|reportSpadTrace| '|   | (TAKE 4 |x|))))
                             (SETQ |bfVar#98| (CDR |bfVar#98|))))
                          (|orderBySlotNumber| |l|) NIL)
                         (TERPRI)))))
                 (SETQ |bfVar#97| (CDR |bfVar#97|))))
              /TRACENAMES NIL)))))))
 
; tracelet(fn,vars) ==
;   if GENSYMP fn and stupidIsSpadFunction EVAL fn then
;     fn := EVAL fn
;     if COMPILED_-FUNCTION_-P fn then fn:=BPINAME fn
;   fn = 'Undef => nil
;   vars:=
;     vars="all" => "all"
;     l:= LASSOC(fn,$letAssoc) => union(vars,l)
;     vars
;   $letAssoc:= [[fn,:vars],:$letAssoc]
;   $TRACELETFLAG : local := true
;   $QuickLet : local := false
;   not MEMQ(fn, $traceletFunctions) and not IS_GENVAR fn and COMPILED_-FUNCTION_-P SYMBOL_-FUNCTION fn
;     and not stupidIsSpadFunction fn and not GENSYMP fn =>
;       ($traceletFunctions:= [fn,:$traceletFunctions]; compileBoot fn ;
;        $traceletFunctions:= delete(fn,$traceletFunctions) )
 
(DEFUN |tracelet| (|fn| |vars|)
  (PROG (|$QuickLet| $TRACELETFLAG |l|)
    (DECLARE (SPECIAL |$QuickLet| $TRACELETFLAG))
    (RETURN
     (PROGN
      (COND
       ((AND (GENSYMP |fn|) (|stupidIsSpadFunction| (EVAL |fn|)))
        (SETQ |fn| (EVAL |fn|))
        (COND ((COMPILED-FUNCTION-P |fn|) (SETQ |fn| (BPINAME |fn|))))))
      (COND ((EQ |fn| '|Undef|) NIL)
            (#1='T
             (PROGN
              (SETQ |vars|
                      (COND ((EQ |vars| '|all|) '|all|)
                            ((SETQ |l| (LASSOC |fn| |$letAssoc|))
                             (|union| |vars| |l|))
                            (#1# |vars|)))
              (SETQ |$letAssoc| (CONS (CONS |fn| |vars|) |$letAssoc|))
              (SETQ $TRACELETFLAG T)
              (SETQ |$QuickLet| NIL)
              (COND
               ((AND (NULL (MEMQ |fn| |$traceletFunctions|))
                     (NULL (IS_GENVAR |fn|))
                     (COMPILED-FUNCTION-P (SYMBOL-FUNCTION |fn|))
                     (NULL (|stupidIsSpadFunction| |fn|))
                     (NULL (GENSYMP |fn|)))
                (PROGN
                 (SETQ |$traceletFunctions| (CONS |fn| |$traceletFunctions|))
                 (|compileBoot| |fn|)
                 (SETQ |$traceletFunctions|
                         (|delete| |fn| |$traceletFunctions|))))))))))))
 
; breaklet(fn,vars) ==
;                        --vars is "all" or a list of variables
;   --$letAssoc ==> (.. (=fn .. (BREAK . all))) OR (.. (=fn .. (BREAK . vl)))
;   if GENSYMP fn and stupidIsSpadFunction EVAL fn then
;     fn := EVAL fn
;     if COMPILED_-FUNCTION_-P fn then fn:= BPINAME fn
;   fn = "Undef" => nil
;   fnEntry:= LASSOC(fn,$letAssoc)
;   vars:=
;     pair:= assoc("BREAK",fnEntry) => union(vars,rest pair)
;     vars
;   $letAssoc:=
;     null fnEntry => [[fn,:LIST ["BREAK",:vars]],:$letAssoc]
;     pair => (RPLACD(pair,vars); $letAssoc)
;   $QuickLet:local := false
;   not MEMQ(fn,$traceletFunctions) and not stupidIsSpadFunction fn
;     and not GENSYMP fn =>
;       $traceletFunctions:= [fn,:$traceletFunctions]
;       compileBoot fn
;       $traceletFunctions:= delete(fn,$traceletFunctions)
 
(DEFUN |breaklet| (|fn| |vars|)
  (PROG (|$QuickLet| |pair| |fnEntry|)
    (DECLARE (SPECIAL |$QuickLet|))
    (RETURN
     (PROGN
      (COND
       ((AND (GENSYMP |fn|) (|stupidIsSpadFunction| (EVAL |fn|)))
        (SETQ |fn| (EVAL |fn|))
        (COND ((COMPILED-FUNCTION-P |fn|) (SETQ |fn| (BPINAME |fn|))))))
      (COND ((EQ |fn| '|Undef|) NIL)
            (#1='T
             (PROGN
              (SETQ |fnEntry| (LASSOC |fn| |$letAssoc|))
              (SETQ |vars|
                      (COND
                       ((SETQ |pair| (|assoc| 'BREAK |fnEntry|))
                        (|union| |vars| (CDR |pair|)))
                       (#1# |vars|)))
              (SETQ |$letAssoc|
                      (COND
                       ((NULL |fnEntry|)
                        (CONS (CONS |fn| (LIST (CONS 'BREAK |vars|)))
                              |$letAssoc|))
                       (|pair| (PROGN (RPLACD |pair| |vars|) |$letAssoc|))))
              (SETQ |$QuickLet| NIL)
              (COND
               ((AND (NULL (MEMQ |fn| |$traceletFunctions|))
                     (NULL (|stupidIsSpadFunction| |fn|))
                     (NULL (GENSYMP |fn|)))
                (PROGN
                 (SETQ |$traceletFunctions| (CONS |fn| |$traceletFunctions|))
                 (|compileBoot| |fn|)
                 (SETQ |$traceletFunctions|
                         (|delete| |fn| |$traceletFunctions|))))))))))))
 
; stupidIsSpadFunction fn ==
;   -- returns true if the function pname has a semi-colon in it
;   -- eventually, this will use isSpadFunction from luke boot
;   STRPOS('"_;",PNAME fn,0,NIL)
 
(DEFUN |stupidIsSpadFunction| (|fn|)
  (PROG () (RETURN (STRPOS ";" (PNAME |fn|) 0 NIL))))
 
; break msg ==
;   condition:= MONITOR_-EVALTRAN(_/BREAKCONDITION, nil)
;   -- The next line is to try to deal with some reported cases of unwanted
;   -- backtraces appearing, MCD.
;   ENABLE_-BACKTRACE(nil)
;   EVAL condition =>
;     sayBrightly msg
;     INTERRUPT()
 
(DEFUN |break| (|msg|)
  (PROG (|condition|)
    (RETURN
     (PROGN
      (SETQ |condition| (MONITOR-EVALTRAN /BREAKCONDITION NIL))
      (ENABLE-BACKTRACE NIL)
      (COND ((EVAL |condition|) (PROGN (|sayBrightly| |msg|) (INTERRUPT))))))))
 
; compileBoot fn ==
;   SAY("need to recompile: ", fn)
 
(DEFUN |compileBoot| (|fn|)
  (PROG () (RETURN (SAY '|need to recompile: | |fn|))))
