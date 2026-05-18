
; )package "BOOT"

(IN-PACKAGE "BOOT")

; $historyDisplayWidth := 120

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$historyDisplayWidth| 120))

; downlink page ==
;   htInitPage('"Bridge",nil)
;   htSayList(['"\replacepage{", page, '"}"])
;   htShowPage()

(DEFUN |downlink| (|page|)
  (PROG ()
    (RETURN
     (PROGN
      (|htInitPage| "Bridge" NIL)
      (|htSayList| (LIST "\\replacepage{" |page| "}"))
      (|htShowPage|)))))

; dbNonEmptyPattern pattern ==
;   null pattern => '"*"
;   pattern := STRINGIMAGE pattern
;   #pattern > 0 => pattern
;   '"*"

(DEFUN |dbNonEmptyPattern| (|pattern|)
  (PROG ()
    (RETURN
     (COND ((NULL |pattern|) "*")
           (#1='T
            (PROGN
             (SETQ |pattern| (STRINGIMAGE |pattern|))
             (COND ((< 0 (LENGTH |pattern|)) |pattern|) (#1# "*"))))))))

; htSystemVariables() == main where
;   main ==
;     not $fullScreenSysVars => htSetVars()
;     classlevel := $UserLevel
;     $levels : local := '(compiler development interpreter)
;     $heading  : local := nil
;     while classlevel ~= first $levels repeat $levels := rest $levels
;     table := NREVERSE fn($setOptions,nil,true)
;     htInitPage('"System Variables",nil)
;     htSay '"\beginmenu"
;     lastHeading := nil
;     for [heading,name,message,.,key,variable,options,func] in table repeat
;       htSay('"\newline\item ")
;       if heading = lastHeading then htSay '"\tab{8}" else
;         htSayList([heading, '"\tab{8}"])
;         lastHeading := heading
;       htSayList(['"{\em ", name, "}\tab{22}", message])
;       htSay('"\tab{80}")
;       key = 'FUNCTION =>
;          null options => htMakePage [['bcLinks,['"reset",'"",func]]]
;          [msg,class,var,valuesOrFunction,:.] := first options  --skip first message
;          functionTail(name,class,var,valuesOrFunction)
;          for option in rest options repeat
;            option is ['break,:.] => 'skip
;            [msg,class,var,valuesOrFunction,:.] := option
;            htSayList(['"\newline\tab{22}", msg,'"\tab{80}"])
;            functionTail(name,class,var,valuesOrFunction)
;       val := eval variable
;       displayOptions(name,key,variable,val,options)
;     htSay '"\endmenu"
;     htShowPage()
;   functionTail(name,class,var,valuesOrFunction) ==
;     val := eval var
;     atom valuesOrFunction =>
;       htMakePage '((domainConditions (isDomain STR (String))))
;       htMakePage [['bcLinks,['"reset",'"",'htSetSystemVariableKind,[var,name,nil]]]]
;       htMakePage [['bcStrings,[30,STRINGIMAGE val,name,valuesOrFunction]]]
;     displayOptions(name,class,var,val,valuesOrFunction)
;   displayOptions(name,class,variable,val,options) ==
;     class = 'INTEGER =>
;       htMakePage [['bcLispLinks,[[['text,options.0,'"-",options.1 or '""]],'"",'htSetSystemVariableKind,[variable,name,'PARSE_-INTEGER]]]]
;       htMakePage '((domainConditions (isDomain INT (Integer))))
;       htMakePage  [['bcStrings,[5,STRINGIMAGE val,name,'INT]]]
;     class = 'STRING =>
;       htSayList ['"{\em ", val, '"}\space{1}"]
;     for x in options repeat
;       val = x or val = true and x = 'on or null val and x = 'off =>
;         htSayList ['"{\em ", x, '"}\space{1}"]
;       htMakePage [['bcLispLinks,[x,'" ",'htSetSystemVariable,[variable,x]]]]
;   fn(t,al,firstTime) ==
;     atom t => al
;     if firstTime then $heading := opOf first t
;     fn(rest t,gn(first t,al),firstTime)
;   gn(t,al) ==
;     [.,.,class,key,.,options,:.] := t
;     not MEMQ(class,$levels) => al
;     key = 'LITERALS or key = 'INTEGER or key = 'STRING => [[$heading,:t],:al]
;     key = 'TREE => fn(options,al,false)
;     key = 'FUNCTION => [[$heading,:t],:al]
;     systemError key

(DEFUN |htSystemVariables| ()
  (PROG (|$heading| |$levels| |classlevel| |table| |lastHeading| |heading|
         |ISTMP#1| |name| |ISTMP#2| |message| |ISTMP#3| |ISTMP#4| |key|
         |ISTMP#5| |variable| |ISTMP#6| |options| |ISTMP#7| |func| |LETTMP#1|
         |msg| |class| |var| |valuesOrFunction| |val|)
    (DECLARE (SPECIAL |$heading| |$levels|))
    (RETURN
     (COND ((NULL |$fullScreenSysVars|) (|htSetVars|))
           (#1='T
            (PROGN
             (SETQ |classlevel| |$UserLevel|)
             (SETQ |$levels| '(|compiler| |development| |interpreter|))
             (SETQ |$heading| NIL)
             ((LAMBDA ()
                (LOOP
                 (COND ((EQUAL |classlevel| (CAR |$levels|)) (RETURN NIL))
                       (#1# (SETQ |$levels| (CDR |$levels|)))))))
             (SETQ |table|
                     (NREVERSE (|htSystemVariables,fn| |$setOptions| NIL T)))
             (|htInitPage| "System Variables" NIL)
             (|htSay| "\\beginmenu")
             (SETQ |lastHeading| NIL)
             ((LAMBDA (|bfVar#2| |bfVar#1|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#2|)
                       (PROGN (SETQ |bfVar#1| (CAR |bfVar#2|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (AND (CONSP |bfVar#1|)
                        (PROGN
                         (SETQ |heading| (CAR |bfVar#1|))
                         (SETQ |ISTMP#1| (CDR |bfVar#1|))
                         (AND (CONSP |ISTMP#1|)
                              (PROGN
                               (SETQ |name| (CAR |ISTMP#1|))
                               (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                               (AND (CONSP |ISTMP#2|)
                                    (PROGN
                                     (SETQ |message| (CAR |ISTMP#2|))
                                     (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                                     (AND (CONSP |ISTMP#3|)
                                          (PROGN
                                           (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                                           (AND (CONSP |ISTMP#4|)
                                                (PROGN
                                                 (SETQ |key| (CAR |ISTMP#4|))
                                                 (SETQ |ISTMP#5|
                                                         (CDR |ISTMP#4|))
                                                 (AND (CONSP |ISTMP#5|)
                                                      (PROGN
                                                       (SETQ |variable|
                                                               (CAR |ISTMP#5|))
                                                       (SETQ |ISTMP#6|
                                                               (CDR |ISTMP#5|))
                                                       (AND (CONSP |ISTMP#6|)
                                                            (PROGN
                                                             (SETQ |options|
                                                                     (CAR
                                                                      |ISTMP#6|))
                                                             (SETQ |ISTMP#7|
                                                                     (CDR
                                                                      |ISTMP#6|))
                                                             (AND
                                                              (CONSP |ISTMP#7|)
                                                              (EQ
                                                               (CDR |ISTMP#7|)
                                                               NIL)
                                                              (PROGN
                                                               (SETQ |func|
                                                                       (CAR
                                                                        |ISTMP#7|))
                                                               #1#)))))))))))))))
                        (PROGN
                         (|htSay| "\\newline\\item ")
                         (COND
                          ((EQUAL |heading| |lastHeading|)
                           (|htSay| "\\tab{8}"))
                          (#1# (|htSayList| (LIST |heading| "\\tab{8}"))
                           (SETQ |lastHeading| |heading|)))
                         (|htSayList|
                          (LIST "{\\em " |name| '|}\\tab{22}| |message|))
                         (|htSay| "\\tab{80}")
                         (COND
                          ((EQ |key| 'FUNCTION)
                           (COND
                            ((NULL |options|)
                             (|htMakePage|
                              (LIST
                               (LIST '|bcLinks| (LIST "reset" "" |func|)))))
                            (#1#
                             (PROGN
                              (SETQ |LETTMP#1| (CAR |options|))
                              (SETQ |msg| (CAR |LETTMP#1|))
                              (SETQ |class| (CADR |LETTMP#1|))
                              (SETQ |var| (CADDR |LETTMP#1|))
                              (SETQ |valuesOrFunction| (CADDDR |LETTMP#1|))
                              (|htSystemVariables,functionTail| |name| |class|
                               |var| |valuesOrFunction|)
                              ((LAMBDA (|bfVar#3| |option|)
                                 (LOOP
                                  (COND
                                   ((OR (ATOM |bfVar#3|)
                                        (PROGN
                                         (SETQ |option| (CAR |bfVar#3|))
                                         NIL))
                                    (RETURN NIL))
                                   (#1#
                                    (COND
                                     ((AND (CONSP |option|)
                                           (EQ (CAR |option|) '|break|))
                                      '|skip|)
                                     (#1#
                                      (PROGN
                                       (SETQ |msg| (CAR |option|))
                                       (SETQ |class| (CADR |option|))
                                       (SETQ |var| (CADDR |option|))
                                       (SETQ |valuesOrFunction|
                                               (CADDDR |option|))
                                       (|htSayList|
                                        (LIST "\\newline\\tab{22}" |msg|
                                              "\\tab{80}"))
                                       (|htSystemVariables,functionTail| |name|
                                        |class| |var| |valuesOrFunction|))))))
                                  (SETQ |bfVar#3| (CDR |bfVar#3|))))
                               (CDR |options|) NIL)))))
                          (#1#
                           (PROGN
                            (SETQ |val| (|eval| |variable|))
                            (|htSystemVariables,displayOptions| |name| |key|
                             |variable| |val| |options|))))))))
                 (SETQ |bfVar#2| (CDR |bfVar#2|))))
              |table| NIL)
             (|htSay| "\\endmenu")
             (|htShowPage|)))))))
(DEFUN |htSystemVariables,functionTail|
       (|name| |class| |var| |valuesOrFunction|)
  (PROG (|val|)
    (RETURN
     (PROGN
      (SETQ |val| (|eval| |var|))
      (COND
       ((ATOM |valuesOrFunction|)
        (PROGN
         (|htMakePage| '((|domainConditions| (|isDomain| STR (|String|)))))
         (|htMakePage|
          (LIST
           (LIST '|bcLinks|
                 (LIST "reset" "" '|htSetSystemVariableKind|
                       (LIST |var| |name| NIL)))))
         (|htMakePage|
          (LIST
           (LIST '|bcStrings|
                 (LIST 30 (STRINGIMAGE |val|) |name| |valuesOrFunction|))))))
       ('T
        (|htSystemVariables,displayOptions| |name| |class| |var| |val|
         |valuesOrFunction|)))))))
(DEFUN |htSystemVariables,displayOptions|
       (|name| |class| |variable| |val| |options|)
  (PROG ()
    (RETURN
     (COND
      ((EQ |class| 'INTEGER)
       (PROGN
        (|htMakePage|
         (LIST
          (LIST '|bcLispLinks|
                (LIST
                 (LIST
                  (LIST '|text| (ELT |options| 0) "-"
                        (OR (ELT |options| 1) "")))
                 "" '|htSetSystemVariableKind|
                 (LIST |variable| |name| 'PARSE-INTEGER)))))
        (|htMakePage| '((|domainConditions| (|isDomain| INT (|Integer|)))))
        (|htMakePage|
         (LIST (LIST '|bcStrings| (LIST 5 (STRINGIMAGE |val|) |name| 'INT))))))
      ((EQ |class| 'STRING) (|htSayList| (LIST "{\\em " |val| "}\\space{1}")))
      (#1='T
       ((LAMBDA (|bfVar#4| |x|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#4|) (PROGN (SETQ |x| (CAR |bfVar#4|)) NIL))
             (RETURN NIL))
            (#1#
             (COND
              ((OR (EQUAL |val| |x|) (AND (EQUAL |val| T) (EQ |x| '|on|))
                   (AND (NULL |val|) (EQ |x| '|off|)))
               (|htSayList| (LIST "{\\em " |x| "}\\space{1}")))
              (#1#
               (|htMakePage|
                (LIST
                 (LIST '|bcLispLinks|
                       (LIST |x| " " '|htSetSystemVariable|
                             (LIST |variable| |x|)))))))))
           (SETQ |bfVar#4| (CDR |bfVar#4|))))
        |options| NIL))))))
(DEFUN |htSystemVariables,fn| (|t| |al| |firstTime|)
  (PROG ()
    (RETURN
     (COND ((ATOM |t|) |al|)
           ('T
            (PROGN
             (COND (|firstTime| (SETQ |$heading| (|opOf| (CAR |t|)))))
             (|htSystemVariables,fn| (CDR |t|)
              (|htSystemVariables,gn| (CAR |t|) |al|) |firstTime|)))))))
(DEFUN |htSystemVariables,gn| (|t| |al|)
  (PROG (|class| |key| |options|)
    (RETURN
     (PROGN
      (SETQ |class| (CADDR |t|))
      (SETQ |key| (CADDDR |t|))
      (SETQ |options| (CADR (CDDDDR |t|)))
      (COND ((NULL (MEMQ |class| |$levels|)) |al|)
            ((OR (EQ |key| 'LITERALS) (EQ |key| 'INTEGER) (EQ |key| 'STRING))
             (CONS (CONS |$heading| |t|) |al|))
            ((EQ |key| 'TREE) (|htSystemVariables,fn| |options| |al| NIL))
            ((EQ |key| 'FUNCTION) (CONS (CONS |$heading| |t|) |al|))
            ('T (|systemError| |key|)))))))

; htSetSystemVariableKind(htPage,[variable,name,fun]) ==
;   value := htpLabelInputString(htPage,name)
;   if STRINGP value and fun then value := FUNCALL(fun,value)
; --SCM::what to do???  if not FIXP value then userError ???
;   SET(variable,value)
;   htSystemVariables ()

(DEFUN |htSetSystemVariableKind| (|htPage| |bfVar#5|)
  (PROG (|variable| |name| |fun| |value|)
    (RETURN
     (PROGN
      (SETQ |variable| (CAR |bfVar#5|))
      (SETQ |name| (CADR . #1=(|bfVar#5|)))
      (SETQ |fun| (CADDR . #1#))
      (SETQ |value| (|htpLabelInputString| |htPage| |name|))
      (COND
       ((AND (STRINGP |value|) |fun|) (SETQ |value| (FUNCALL |fun| |value|))))
      (SET |variable| |value|)
      (|htSystemVariables|)))))

; htSetSystemVariable(htPage,[name,value]) ==
;   value :=
;     value = 'on => true
;     value = 'off => nil
;     value
;   SET(name,value)
;   htSystemVariables ()

(DEFUN |htSetSystemVariable| (|htPage| |bfVar#6|)
  (PROG (|name| |value|)
    (RETURN
     (PROGN
      (SETQ |name| (CAR |bfVar#6|))
      (SETQ |value| (CADR |bfVar#6|))
      (SETQ |value|
              (COND ((EQ |value| '|on|) T) ((EQ |value| '|off|) NIL)
                    ('T |value|)))
      (SET |name| |value|)
      (|htSystemVariables|)))))

; htGloss(pattern) == htGlossPage(nil,dbNonEmptyPattern pattern or '"*",true)

(DEFUN |htGloss| (|pattern|)
  (PROG ()
    (RETURN (|htGlossPage| NIL (OR (|dbNonEmptyPattern| |pattern|) "*") T))))

; htGlossPage(htPage,pattern,tryAgain?) ==
;   $wildCard: local := char '_*
;   pattern = '"*" => downlink 'GlossaryPage
;   filter := pmTransFilter pattern
;   grepForm := mkGrepPattern(filter,'none)
;   $key: local := 'none
;   results := applyGrep(grepForm,'gloss)
;   defstream := MAKE_INSTREAM(STRCONC($spadroot,
;                                      '"/algebra/glossdef.text"))
;   lines := gatherGlossLines(results,defstream)
;   heading :=
;     pattern = '"" => '"Glossary"
;     null lines => ['"No glossary items match {\em ",pattern,'"}"]
;     ['"Glossary items matching {\em ",pattern,'"}"]
;   null lines =>
;     tryAgain? and #pattern > 0 =>
;       (pattern.(k := MAXINDEX(pattern))) = char 's =>
;         htGlossPage(htPage,SUBSTRING(pattern,0,k),true)
;       UPPER_-CASE_-P pattern.0 =>
;         htGlossPage(htPage,DOWNCASE pattern,false)
;       errorPage(htPage,['"Sorry",nil,['"\centerline{",:heading,'"}"]])
;     errorPage(htPage,['"Sorry",nil,['"\centerline{",:heading,'"}"]])
;   htInitPageNoScroll(nil,heading)
;   htSay('"\beginscroll\beginmenu")
;   for line in lines repeat
;     tick := charPosition($tick,line,1)
;     htSayList(['"\item{\em \menuitemstyle{}}\tab{0}{\em ",
;                escapeString SUBSTRING(line,0,tick),'"} ",
;                SUBSTRING(line,tick + 1,nil)])
;   htSay '"\endmenu "
;   htSay '"\endscroll\newline "
;   htMakePage [['bcLinks,['"Search",'"",'htGlossSearch,nil]]]
;   htSay '" for glossary entry matching "
;   htMakePage [['bcStrings, [24,'"*",'filter,'EM]]]
;   htShowPageNoScroll()

(DEFUN |htGlossPage| (|htPage| |pattern| |tryAgain?|)
  (PROG (|$key| |$wildCard| |tick| |k| |heading| |lines| |defstream| |results|
         |grepForm| |filter|)
    (DECLARE (SPECIAL |$key| |$wildCard|))
    (RETURN
     (PROGN
      (SETQ |$wildCard| (|char| '*))
      (COND ((EQUAL |pattern| "*") (|downlink| '|GlossaryPage|))
            (#1='T
             (PROGN
              (SETQ |filter| (|pmTransFilter| |pattern|))
              (SETQ |grepForm| (|mkGrepPattern| |filter| '|none|))
              (SETQ |$key| '|none|)
              (SETQ |results| (|applyGrep| |grepForm| '|gloss|))
              (SETQ |defstream|
                      (MAKE_INSTREAM
                       (STRCONC |$spadroot| "/algebra/glossdef.text")))
              (SETQ |lines| (|gatherGlossLines| |results| |defstream|))
              (SETQ |heading|
                      (COND ((EQUAL |pattern| "") "Glossary")
                            ((NULL |lines|)
                             (LIST "No glossary items match {\\em " |pattern|
                                   "}"))
                            (#1#
                             (LIST "Glossary items matching {\\em " |pattern|
                                   "}"))))
              (COND
               ((NULL |lines|)
                (COND
                 ((AND |tryAgain?| (< 0 (LENGTH |pattern|)))
                  (COND
                   ((EQUAL (ELT |pattern| (SETQ |k| (MAXINDEX |pattern|)))
                           (|char| '|s|))
                    (|htGlossPage| |htPage| (SUBSTRING |pattern| 0 |k|) T))
                   ((UPPER-CASE-P (ELT |pattern| 0))
                    (|htGlossPage| |htPage| (DOWNCASE |pattern|) NIL))
                   (#1#
                    (|errorPage| |htPage|
                     (LIST "Sorry" NIL
                           (CONS "\\centerline{"
                                 (APPEND |heading| (CONS "}" NIL))))))))
                 (#1#
                  (|errorPage| |htPage|
                   (LIST "Sorry" NIL
                         (CONS "\\centerline{"
                               (APPEND |heading| (CONS "}" NIL))))))))
               (#1#
                (PROGN
                 (|htInitPageNoScroll| NIL |heading|)
                 (|htSay| "\\beginscroll\\beginmenu")
                 ((LAMBDA (|bfVar#7| |line|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#7|)
                           (PROGN (SETQ |line| (CAR |bfVar#7|)) NIL))
                       (RETURN NIL))
                      (#1#
                       (PROGN
                        (SETQ |tick| (|charPosition| |$tick| |line| 1))
                        (|htSayList|
                         (LIST "\\item{\\em \\menuitemstyle{}}\\tab{0}{\\em "
                               (|escapeString| (SUBSTRING |line| 0 |tick|))
                               "} " (SUBSTRING |line| (+ |tick| 1) NIL))))))
                     (SETQ |bfVar#7| (CDR |bfVar#7|))))
                  |lines| NIL)
                 (|htSay| "\\endmenu ")
                 (|htSay| "\\endscroll\\newline ")
                 (|htMakePage|
                  (LIST
                   (LIST '|bcLinks| (LIST "Search" "" '|htGlossSearch| NIL))))
                 (|htSay| " for glossary entry matching ")
                 (|htMakePage|
                  (LIST (LIST '|bcStrings| (LIST 24 "*" '|filter| 'EM))))
                 (|htShowPageNoScroll|)))))))))))

; gatherGlossLines(results,defstream) ==
;   acc := nil
;   for keyline in results repeat
;     n := charPosition($tick,keyline,0)
;     keyAndTick := SUBSTRING(keyline,0,n + 1)
;     byteAddress := string2Integer SUBSTRING(keyline,n + 1,nil)
;     FILE_-POSITION(defstream,byteAddress)
;     line := read_line defstream
;     k := charPosition($tick,line,1)
;     pointer := SUBSTRING(line,0,k)
;     def := SUBSTRING(line,k + 1,nil)
;     xtralines := nil
;     while not EOFP defstream and (x := read_line defstream) and
;       (j := charPosition($tick,x,1)) and (nextPointer := SUBSTRING(x,0,j))
;         and (nextPointer = pointer) repeat
;           xtralines := [SUBSTRING(x,j + 1,nil),:xtralines]
;     acc := [STRCONC(keyAndTick,def, "STRCONC"/NREVERSE xtralines),:acc]
;   REVERSE acc

(DEFUN |gatherGlossLines| (|results| |defstream|)
  (PROG (|acc| |n| |keyAndTick| |byteAddress| |line| |k| |pointer| |def|
         |xtralines| |x| |j| |nextPointer|)
    (RETURN
     (PROGN
      (SETQ |acc| NIL)
      ((LAMBDA (|bfVar#8| |keyline|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#8|) (PROGN (SETQ |keyline| (CAR |bfVar#8|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (SETQ |n| (|charPosition| |$tick| |keyline| 0))
             (SETQ |keyAndTick| (SUBSTRING |keyline| 0 (+ |n| 1)))
             (SETQ |byteAddress|
                     (|string2Integer| (SUBSTRING |keyline| (+ |n| 1) NIL)))
             (FILE-POSITION |defstream| |byteAddress|)
             (SETQ |line| (|read_line| |defstream|))
             (SETQ |k| (|charPosition| |$tick| |line| 1))
             (SETQ |pointer| (SUBSTRING |line| 0 |k|))
             (SETQ |def| (SUBSTRING |line| (+ |k| 1) NIL))
             (SETQ |xtralines| NIL)
             ((LAMBDA ()
                (LOOP
                 (COND
                  ((NOT
                    (AND (NULL (EOFP |defstream|))
                         (SETQ |x| (|read_line| |defstream|))
                         (SETQ |j| (|charPosition| |$tick| |x| 1))
                         (SETQ |nextPointer| (SUBSTRING |x| 0 |j|))
                         (EQUAL |nextPointer| |pointer|)))
                   (RETURN NIL))
                  (#1#
                   (SETQ |xtralines|
                           (CONS (SUBSTRING |x| (+ |j| 1) NIL)
                                 |xtralines|)))))))
             (SETQ |acc|
                     (CONS
                      (STRCONC |keyAndTick| |def|
                       ((LAMBDA (|bfVar#9| |bfVar#11| |bfVar#10|)
                          (LOOP
                           (COND
                            ((OR (ATOM |bfVar#11|)
                                 (PROGN
                                  (SETQ |bfVar#10| (CAR |bfVar#11|))
                                  NIL))
                             (RETURN |bfVar#9|))
                            (#1#
                             (SETQ |bfVar#9| (STRCONC |bfVar#9| |bfVar#10|))))
                           (SETQ |bfVar#11| (CDR |bfVar#11|))))
                        "" (NREVERSE |xtralines|) NIL))
                      |acc|)))))
          (SETQ |bfVar#8| (CDR |bfVar#8|))))
       |results| NIL)
      (REVERSE |acc|)))))

; htGlossSearch(htPage,junk) ==  htGloss htpLabelInputString(htPage,'filter)

(DEFUN |htGlossSearch| (|htPage| |junk|)
  (PROG () (RETURN (|htGloss| (|htpLabelInputString| |htPage| '|filter|)))))

; htSetVars() ==
;   $path := nil
;   $lastTree := nil
;   if 0 ~= LASTATOM $setOptions then htMarkTree($setOptions,0)
;   htShowSetTree($setOptions)

(DEFUN |htSetVars| ()
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |$path| NIL)
      (SETQ |$lastTree| NIL)
      (COND
       ((NOT (EQL 0 (LASTATOM |$setOptions|))) (|htMarkTree| |$setOptions| 0)))
      (|htShowSetTree| |$setOptions|)))))

; htShowSetTree(setTree) ==
;   $path := TAKE(- LASTATOM setTree,$path)
;   page := htInitPage(mkSetTitle(),nil)
;   htpSetProperty(page, 'setTree, setTree)
;   links := nil
;   maxWidth1 := maxWidth2 := 0
;   for setData in setTree repeat
;     satisfiesUserLevel setData.setLevel =>
;       okList := [setData,:okList]
;       maxWidth1 := MAX(# PNAME setData.setName,maxWidth1)
;       maxWidth2 := MAX(htShowCount STRINGIMAGE setData.setLabel,maxWidth2)
;   maxWidth1 := MAX(9,maxWidth1)
;   maxWidth2 := MAX(41,maxWidth2)
;   tabset1 := STRINGIMAGE (maxWidth1)
;   tabset2 := STRINGIMAGE (maxWidth2 + maxWidth1 - 1)
;   htSayList(['"\tab{2}\newline Variable\tab{",
;     STRINGIMAGE (maxWidth1 + quotient_INT(maxWidth2, 3)),
;      '"}Description\tab{",STRINGIMAGE(maxWidth2 + maxWidth1 + 2),
;       '"}Value\newline\beginitems "])
;   for setData in REVERSE okList repeat
;       htSay '"\item"
;       label := STRCONC('"\menuitemstyle{",setData.setName,'"}")
;       links := [label,[['text,'"\tab{",tabset1,'"}",setData.setLabel,'"\tab{",tabset2,'"}{\em ",htShowSetTreeValue setData,'"}"]],
;                 'htShowSetPage, setData.setName]
;       htMakePage [['bcLispLinks, links,'options,'(indent . 0)]]
;   htSay '"\enditems"
;   htShowPage()

(DEFUN |htShowSetTree| (|setTree|)
  (PROG (|page| |links| |maxWidth2| |maxWidth1| |okList| |tabset1| |tabset2|
         |label|)
    (RETURN
     (PROGN
      (SETQ |$path| (TAKE (- (LASTATOM |setTree|)) |$path|))
      (SETQ |page| (|htInitPage| (|mkSetTitle|) NIL))
      (|htpSetProperty| |page| '|setTree| |setTree|)
      (SETQ |links| NIL)
      (SETQ |maxWidth1| (SETQ |maxWidth2| 0))
      ((LAMBDA (|bfVar#12| |setData|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#12|)
                (PROGN (SETQ |setData| (CAR |bfVar#12|)) NIL))
            (RETURN NIL))
           (#1='T
            (COND
             ((|satisfiesUserLevel| (ELT |setData| 2))
              (IDENTITY
               (PROGN
                (SETQ |okList| (CONS |setData| |okList|))
                (SETQ |maxWidth1|
                        (MAX (LENGTH (PNAME (ELT |setData| 0))) |maxWidth1|))
                (SETQ |maxWidth2|
                        (MAX (|htShowCount| (STRINGIMAGE (ELT |setData| 1)))
                             |maxWidth2|))))))))
          (SETQ |bfVar#12| (CDR |bfVar#12|))))
       |setTree| NIL)
      (SETQ |maxWidth1| (MAX 9 |maxWidth1|))
      (SETQ |maxWidth2| (MAX 41 |maxWidth2|))
      (SETQ |tabset1| (STRINGIMAGE |maxWidth1|))
      (SETQ |tabset2| (STRINGIMAGE (- (+ |maxWidth2| |maxWidth1|) 1)))
      (|htSayList|
       (LIST "\\tab{2}\\newline Variable\\tab{"
             (STRINGIMAGE (+ |maxWidth1| (|quotient_INT| |maxWidth2| 3)))
             "}Description\\tab{"
             (STRINGIMAGE (+ (+ |maxWidth2| |maxWidth1|) 2))
             "}Value\\newline\\beginitems "))
      ((LAMBDA (|bfVar#13| |setData|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#13|)
                (PROGN (SETQ |setData| (CAR |bfVar#13|)) NIL))
            (RETURN NIL))
           (#1#
            (PROGN
             (|htSay| "\\item")
             (SETQ |label| (STRCONC "\\menuitemstyle{" (ELT |setData| 0) "}"))
             (SETQ |links|
                     (LIST |label|
                           (LIST
                            (LIST '|text| "\\tab{" |tabset1| "}"
                                  (ELT |setData| 1) "\\tab{" |tabset2|
                                  "}{\\em " (|htShowSetTreeValue| |setData|)
                                  "}"))
                           '|htShowSetPage| (ELT |setData| 0)))
             (|htMakePage|
              (LIST
               (LIST '|bcLispLinks| |links| '|options| '(|indent| . 0)))))))
          (SETQ |bfVar#13| (CDR |bfVar#13|))))
       (REVERSE |okList|) NIL)
      (|htSay| "\\enditems")
      (|htShowPage|)))))

; htShowCount s == --# discounting {\em .. }
;   m := #s
;   m < 8 => m - 1
;   i := 0
;   count := 0
;   while i < m - 7 repeat
;     s.i = char '_{ and  s.(i+1) = char '_\ and s.(i+2) = char 'e
;       and s.(i+3) = char 'm => i := i + 6     --discount {\em }
;     i := i + 1
;     count := count + 1
;   count + (m - i)

(DEFUN |htShowCount| (|s|)
  (PROG (|m| |i| |count|)
    (RETURN
     (PROGN
      (SETQ |m| (LENGTH |s|))
      (COND ((< |m| 8) (- |m| 1))
            (#1='T
             (PROGN
              (SETQ |i| 0)
              (SETQ |count| 0)
              ((LAMBDA ()
                 (LOOP
                  (COND ((NOT (< |i| (- |m| 7))) (RETURN NIL))
                        (#1#
                         (COND
                          ((AND (EQUAL (ELT |s| |i|) (|char| '{))
                                (EQUAL (ELT |s| (+ |i| 1)) (|char| '|\\|))
                                (EQUAL (ELT |s| (+ |i| 2)) (|char| '|e|))
                                (EQUAL (ELT |s| (+ |i| 3)) (|char| '|m|)))
                           (SETQ |i| (+ |i| 6)))
                          (#1#
                           (PROGN
                            (SETQ |i| (+ |i| 1))
                            (SETQ |count| (+ |count| 1))))))))))
              (+ |count| (- |m| |i|)))))))))

; htShowSetTreeValue(setData) ==
;   st := setData.setType
;   st = 'FUNCTION => object2String FUNCALL(setData.setVar,"%display%")
;   st = 'INTEGER  => object2String eval setData.setVar
;   st = 'STRING  => object2String eval setData.setVar
;   st = 'LITERALS =>
;     object2String translateTrueFalse2YesNo eval setData.setVar
;   st = 'TREE     => '"..."
;   systemError nil

(DEFUN |htShowSetTreeValue| (|setData|)
  (PROG (|st|)
    (RETURN
     (PROGN
      (SETQ |st| (ELT |setData| 3))
      (COND
       ((EQ |st| 'FUNCTION)
        (|object2String| (FUNCALL (ELT |setData| 4) '|%display%|)))
       ((EQ |st| 'INTEGER) (|object2String| (|eval| (ELT |setData| 4))))
       ((EQ |st| 'STRING) (|object2String| (|eval| (ELT |setData| 4))))
       ((EQ |st| 'LITERALS)
        (|object2String|
         (|translateTrueFalse2YesNo| (|eval| (ELT |setData| 4)))))
       ((EQ |st| 'TREE) "...") ('T (|systemError| NIL)))))))

; mkSetTitle() == STRCONC('"Command {\em )set ",listOfStrings2String $path,'"}")

(DEFUN |mkSetTitle| ()
  (PROG ()
    (RETURN
     (STRCONC "Command {\\em )set " (|listOfStrings2String| |$path|) "}"))))

; listOfStrings2String u ==
;   null u => '""
;   STRCONC(listOfStrings2String rest u,'" ",stringize first u)

(DEFUN |listOfStrings2String| (|u|)
  (PROG ()
    (RETURN
     (COND ((NULL |u|) "")
           ('T
            (STRCONC (|listOfStrings2String| (CDR |u|)) " "
             (|stringize| (CAR |u|))))))))

; htShowSetPage(htPage, branch) ==
;   setTree := htpProperty(htPage, 'setTree)
;   $path := [branch, :TAKE(- LASTATOM(setTree), $path)]
;   setData := assoc(branch, setTree)
;   null setData =>
;     systemError('"No Set Data")
;   st := setData.setType
;   st = 'FUNCTION => htShowFunctionPage(htPage, setData)
;   st = 'INTEGER  =>  htShowIntegerPage(htPage,setData)
;   st = 'LITERALS => htShowLiteralsPage(htPage, setData)
;   st = 'TREE     => htShowSetTree(setData.setLeaf)
;
;   st = 'STRING   =>  -- have to add this
;      htSetNotAvailable(htPage,'")set compiler")
;
;   systemError '"Unknown data type"

(DEFUN |htShowSetPage| (|htPage| |branch|)
  (PROG (|setTree| |setData| |st|)
    (RETURN
     (PROGN
      (SETQ |setTree| (|htpProperty| |htPage| '|setTree|))
      (SETQ |$path| (CONS |branch| (TAKE (- (LASTATOM |setTree|)) |$path|)))
      (SETQ |setData| (|assoc| |branch| |setTree|))
      (COND ((NULL |setData|) (|systemError| "No Set Data"))
            (#1='T
             (PROGN
              (SETQ |st| (ELT |setData| 3))
              (COND
               ((EQ |st| 'FUNCTION) (|htShowFunctionPage| |htPage| |setData|))
               ((EQ |st| 'INTEGER) (|htShowIntegerPage| |htPage| |setData|))
               ((EQ |st| 'LITERALS) (|htShowLiteralsPage| |htPage| |setData|))
               ((EQ |st| 'TREE) (|htShowSetTree| (ELT |setData| 5)))
               ((EQ |st| 'STRING)
                (|htSetNotAvailable| |htPage| ")set compiler"))
               (#1# (|systemError| "Unknown data type"))))))))))

; htShowLiteralsPage(htPage, setData) ==
;   htSetLiterals(htPage,setData.setName,setData.setLabel,
;                 setData.setVar,setData.setLeaf,'htSetLiteral)

(DEFUN |htShowLiteralsPage| (|htPage| |setData|)
  (PROG ()
    (RETURN
     (|htSetLiterals| |htPage| (ELT |setData| 0) (ELT |setData| 1)
      (ELT |setData| 4) (ELT |setData| 5) '|htSetLiteral|))))

; htSetLiterals(htPage,name,message,variable,values,functionToCall) ==
;   page := htInitPage('"Set Command", htpPropertyList htPage)
;   htpSetProperty(page, 'variable, variable)
;   htSetLiterals2(page, name, message, EVAL(variable), values, functionToCall)

(DEFUN |htSetLiterals|
       (|htPage| |name| |message| |variable| |values| |functionToCall|)
  (PROG (|page|)
    (RETURN
     (PROGN
      (SETQ |page| (|htInitPage| "Set Command" (|htpPropertyList| |htPage|)))
      (|htpSetProperty| |page| '|variable| |variable|)
      (|htSetLiterals2| |page| |name| |message| (EVAL |variable|) |values|
       |functionToCall|)))))

; htSetLiterals2(page, name, message, cval, values, functionToCall) ==
;   bcHt ['"\centerline{Set {\em ", name, '"}}\newline"]
;   bcHt ['"{\em Description: } ", message, '"\newline\vspace{1} "]
;   bcHt '"Select one of the following: \newline\tab{3} "
;   links := [[STRCONC('"",STRINGIMAGE opt), '"\newline\tab{3}", functionToCall, opt] for opt in values]
;   htMakePage [['bcLispLinks, :links]]
;   bcHt ['"\indent{0}\newline\vspace{1} The current setting is: {\em ",
;         translateTrueFalse2YesNo(cval), '"} "]
;   htShowPage()

(DEFUN |htSetLiterals2|
       (|page| |name| |message| |cval| |values| |functionToCall|)
  (PROG (|links|)
    (RETURN
     (PROGN
      (|bcHt| (LIST "\\centerline{Set {\\em " |name| "}}\\newline"))
      (|bcHt| (LIST "{\\em Description: } " |message| "\\newline\\vspace{1} "))
      (|bcHt| "Select one of the following: \\newline\\tab{3} ")
      (SETQ |links|
              ((LAMBDA (|bfVar#15| |bfVar#14| |opt|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#14|)
                        (PROGN (SETQ |opt| (CAR |bfVar#14|)) NIL))
                    (RETURN (NREVERSE |bfVar#15|)))
                   ('T
                    (SETQ |bfVar#15|
                            (CONS
                             (LIST (STRCONC "" (STRINGIMAGE |opt|))
                                   "\\newline\\tab{3}" |functionToCall| |opt|)
                             |bfVar#15|))))
                  (SETQ |bfVar#14| (CDR |bfVar#14|))))
               NIL |values| NIL))
      (|htMakePage| (LIST (CONS '|bcLispLinks| |links|)))
      (|bcHt|
       (LIST "\\indent{0}\\newline\\vspace{1} The current setting is: {\\em "
             (|translateTrueFalse2YesNo| |cval|) "} "))
      (|htShowPage|)))))

; htSetLiteral(htPage, val) ==
;   htInitPage('"Set Command", nil)
;   SET(htpProperty(htPage, 'variable), translateYesNo2TrueFalse val)
;   htKill(htPage,val)

(DEFUN |htSetLiteral| (|htPage| |val|)
  (PROG ()
    (RETURN
     (PROGN
      (|htInitPage| "Set Command" NIL)
      (SET (|htpProperty| |htPage| '|variable|)
           (|translateYesNo2TrueFalse| |val|))
      (|htKill| |htPage| |val|)))))

; htShowIntegerPage(htPage, setData) ==
;   page := htInitPage(mkSetTitle(), htpPropertyList htPage)
;   htpSetProperty(page, 'variable, setData.setVar)
;   bcHt ['"\centerline{Set {\em ", setData.setName, '"}}\newline"]
;   message := setData.setLabel
;   bcHt ['"{\em Description: } ", message, '"\newline\vspace{1} "]
;   [$htInitial,$htFinal] := setData.setLeaf
;   if $htFinal = $htInitial + 1 then
;       bcHt '"Enter the integer {\em "
;       bcHt stringize $htInitial
;       bcHt '"} or {\em "
;       bcHt stringize $htFinal
;       bcHt '"}:"
;   else if null $htFinal then
;       bcHt '"Enter an integer greater than {\em "
;       bcHt stringize ($htInitial - 1)
;       bcHt '"}:"
;   else
;       bcHt '"Enter an integer between {\em "
;       bcHt stringize $htInitial
;       bcHt '"} and {\em "
;       bcHt stringize $htFinal
;       bcHt '"}:"
;   htMakePage [
;     '(domainConditions (Satisfies S chkRange)),
;       ['bcStrings,[5,eval setData.setVar,'value,'S]]]
;   htSetvarDoneButton('"Select to Set Value",'htSetInteger)
;   htShowPage()

(DEFUN |htShowIntegerPage| (|htPage| |setData|)
  (PROG (|page| |message| |LETTMP#1|)
    (RETURN
     (PROGN
      (SETQ |page| (|htInitPage| (|mkSetTitle|) (|htpPropertyList| |htPage|)))
      (|htpSetProperty| |page| '|variable| (ELT |setData| 4))
      (|bcHt| (LIST "\\centerline{Set {\\em " (ELT |setData| 0) "}}\\newline"))
      (SETQ |message| (ELT |setData| 1))
      (|bcHt| (LIST "{\\em Description: } " |message| "\\newline\\vspace{1} "))
      (SETQ |LETTMP#1| (ELT |setData| 5))
      (SETQ |$htInitial| (CAR |LETTMP#1|))
      (SETQ |$htFinal| (CADR |LETTMP#1|))
      (COND
       ((EQUAL |$htFinal| (+ |$htInitial| 1))
        (|bcHt| "Enter the integer {\\em ") (|bcHt| (|stringize| |$htInitial|))
        (|bcHt| "} or {\\em ") (|bcHt| (|stringize| |$htFinal|)) (|bcHt| "}:"))
       ((NULL |$htFinal|) (|bcHt| "Enter an integer greater than {\\em ")
        (|bcHt| (|stringize| (- |$htInitial| 1))) (|bcHt| "}:"))
       ('T (|bcHt| "Enter an integer between {\\em ")
        (|bcHt| (|stringize| |$htInitial|)) (|bcHt| "} and {\\em ")
        (|bcHt| (|stringize| |$htFinal|)) (|bcHt| "}:")))
      (|htMakePage|
       (LIST '(|domainConditions| (|Satisfies| S |chkRange|))
             (LIST '|bcStrings|
                   (LIST 5 (|eval| (ELT |setData| 4)) '|value| 'S))))
      (|htSetvarDoneButton| "Select to Set Value" '|htSetInteger|)
      (|htShowPage|)))))

; htSetInteger(htPage) ==
;   htInitPage(mkSetTitle(), nil)
;   val := chkRange htpLabelInputString(htPage,'value)
;   not INTEGERP val =>
;     errorPage(htPage,['"Value Error",nil,'"\vspace{3}\centerline{{\em ",val,'"}}\vspace{2}\newline\centerline{Click on \UpBitmap{} to re-enter value}"])
;   SET(htpProperty(htPage, 'variable), val)
;   htKill(htPage,val)

(DEFUN |htSetInteger| (|htPage|)
  (PROG (|val|)
    (RETURN
     (PROGN
      (|htInitPage| (|mkSetTitle|) NIL)
      (SETQ |val| (|chkRange| (|htpLabelInputString| |htPage| '|value|)))
      (COND
       ((NULL (INTEGERP |val|))
        (|errorPage| |htPage|
         (LIST "Value Error" NIL "\\vspace{3}\\centerline{{\\em " |val|
               "}}\\vspace{2}\\newline\\centerline{Click on \\UpBitmap{} to re-enter value}")))
       ('T
        (PROGN
         (SET (|htpProperty| |htPage| '|variable|) |val|)
         (|htKill| |htPage| |val|))))))))

; htShowFunctionPage(htPage,setData) ==
;   htpSetProperty(htPage, 'setData, setData)
;   fn := setData.setDef => FUNCALL(fn,htPage)
;   htpSetProperty(htPage,'parts, setData.setLeaf)
;   htShowFunctionPageContinued(htPage)

(DEFUN |htShowFunctionPage| (|htPage| |setData|)
  (PROG (|fn|)
    (RETURN
     (PROGN
      (|htpSetProperty| |htPage| '|setData| |setData|)
      (COND ((SETQ |fn| (ELT |setData| 6)) (FUNCALL |fn| |htPage|))
            ('T
             (PROGN
              (|htpSetProperty| |htPage| '|parts| (ELT |setData| 5))
              (|htShowFunctionPageContinued| |htPage|))))))))

; htShowFunctionPageContinued(htPage) ==
;   parts := htpProperty(htPage,'parts)
;   setData := htpProperty(htPage,'setData)
;   [[phrase,kind,variable,checker,initValue,:.],:restParts] := parts
;   htpSetProperty(htPage, 'variable, variable)
;   htpSetProperty(htPage, 'checker, checker)
;   htpSetProperty(htPage, 'parts, restParts)
;   kind = 'LITERALS => htSetLiterals(htPage,setData.setName,
;                                     phrase,variable,checker,'htFunctionSetLiteral)
;   htShowFunctionPageContinued2(htPage, setData, EVAL(variable), checker,
;                                phrase, 'htSetFunCommand)

(DEFUN |htShowFunctionPageContinued| (|htPage|)
  (PROG (|parts| |setData| |phrase| |kind| |variable| |checker| |initValue|
         |restParts|)
    (RETURN
     (PROGN
      (SETQ |parts| (|htpProperty| |htPage| '|parts|))
      (SETQ |setData| (|htpProperty| |htPage| '|setData|))
      (SETQ |phrase| (CAAR . #1=(|parts|)))
      (SETQ |kind| (CADAR . #1#))
      (SETQ |variable| (CADDAR . #1#))
      (SETQ |checker| (CAR #2=(CDDDAR . #1#)))
      (SETQ |initValue| (CADR #2#))
      (SETQ |restParts| (CDR |parts|))
      (|htpSetProperty| |htPage| '|variable| |variable|)
      (|htpSetProperty| |htPage| '|checker| |checker|)
      (|htpSetProperty| |htPage| '|parts| |restParts|)
      (COND
       ((EQ |kind| 'LITERALS)
        (|htSetLiterals| |htPage| (ELT |setData| 0) |phrase| |variable|
         |checker| '|htFunctionSetLiteral|))
       ('T
        (|htShowFunctionPageContinued2| |htPage| |setData| (EVAL |variable|)
         |checker| |phrase| '|htSetFunCommand|)))))))

; htShowFunctionPageContinued2(htPage, setData, cval, checker, phrase,
;                              fun_to_call) ==
;   page := htInitPage(mkSetTitle(), htpPropertyList htPage)
;   bcHt ['"\centerline{Set {\em ", setData.setName, '"}}\newline"]
;   bcHt ['"{\em Description: } ", setData.setLabel, '"\newline\vspace{1} "]
;   htMakePage
;     [ ['domainConditions, ['Satisfies,'S,checker]],
;       ['text,:phrase],
;         ['inputStrings,
;           [ '"", '"", 60, cval, 'value, 'S]]]
;   htSetvarDoneButton('"Select To Set Value", fun_to_call)
;   htShowPage()

(DEFUN |htShowFunctionPageContinued2|
       (|htPage| |setData| |cval| |checker| |phrase| |fun_to_call|)
  (PROG (|page|)
    (RETURN
     (PROGN
      (SETQ |page| (|htInitPage| (|mkSetTitle|) (|htpPropertyList| |htPage|)))
      (|bcHt| (LIST "\\centerline{Set {\\em " (ELT |setData| 0) "}}\\newline"))
      (|bcHt|
       (LIST "{\\em Description: } " (ELT |setData| 1)
             "\\newline\\vspace{1} "))
      (|htMakePage|
       (LIST (LIST '|domainConditions| (LIST '|Satisfies| 'S |checker|))
             (CONS '|text| |phrase|)
             (LIST '|inputStrings| (LIST "" "" 60 |cval| '|value| 'S))))
      (|htSetvarDoneButton| "Select To Set Value" |fun_to_call|)
      (|htShowPage|)))))

; htSetvarDoneButton(message, func) ==
;   bcHt '"\newline\vspace{1}\centerline{"
;
;   if message = '"Select to Set Value" or message = '"Select to Set Values"  then
;     bchtMakeButton('"\lisplink",'"\ControlBitmap{ClickToSet}", func)
;   else
;     bchtMakeButton('"\lisplink",CONCAT('"\fbox{", message, '"}"), func)
;
;   bcHt '"} "

(DEFUN |htSetvarDoneButton| (|message| |func|)
  (PROG ()
    (RETURN
     (PROGN
      (|bcHt| "\\newline\\vspace{1}\\centerline{")
      (COND
       ((OR (EQUAL |message| "Select to Set Value")
            (EQUAL |message| "Select to Set Values"))
        (|bchtMakeButton| "\\lisplink" "\\ControlBitmap{ClickToSet}" |func|))
       ('T
        (|bchtMakeButton| "\\lisplink" (CONCAT "\\fbox{" |message| "}")
         |func|)))
      (|bcHt| "} ")))))

; htFunctionSetLiteral(htPage, val) ==
;   htInitPage('"Set Command", nil)
;   SET(htpProperty(htPage, 'variable), translateYesNo2TrueFalse val)
;   htSetFunCommandContinue(htPage,val)

(DEFUN |htFunctionSetLiteral| (|htPage| |val|)
  (PROG ()
    (RETURN
     (PROGN
      (|htInitPage| "Set Command" NIL)
      (SET (|htpProperty| |htPage| '|variable|)
           (|translateYesNo2TrueFalse| |val|))
      (|htSetFunCommandContinue| |htPage| |val|)))))

; htSetFunCommand(htPage) ==
;   variable := htpProperty(htPage,'variable)
;   checker := htpProperty(htPage,'checker)
;   value := htCheck(checker,htpLabelInputString(htPage,'value))
;   SET(variable,value) --kill this later
;   htSetFunCommandContinue(htPage,value)

(DEFUN |htSetFunCommand| (|htPage|)
  (PROG (|variable| |checker| |value|)
    (RETURN
     (PROGN
      (SETQ |variable| (|htpProperty| |htPage| '|variable|))
      (SETQ |checker| (|htpProperty| |htPage| '|checker|))
      (SETQ |value|
              (|htCheck| |checker| (|htpLabelInputString| |htPage| '|value|)))
      (SET |variable| |value|)
      (|htSetFunCommandContinue| |htPage| |value|)))))

; htSetFunCommandContinue(htPage,value) ==
;   parts := htpProperty(htPage,'parts)
;   continue :=
;     null parts => false
;     parts is [['break,predicate],:restParts] => eval predicate
;     true
;   continue =>
;     htpSetProperty(htPage,'parts,restParts)
;     htShowFunctionPageContinued(htPage)
;   htKill(htPage,value)

(DEFUN |htSetFunCommandContinue| (|htPage| |value|)
  (PROG (|parts| |ISTMP#1| |ISTMP#2| |predicate| |restParts| |continue|)
    (RETURN
     (PROGN
      (SETQ |parts| (|htpProperty| |htPage| '|parts|))
      (SETQ |continue|
              (COND ((NULL |parts|) NIL)
                    ((AND (CONSP |parts|)
                          (PROGN
                           (SETQ |ISTMP#1| (CAR |parts|))
                           (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|break|)
                                (PROGN
                                 (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                 (AND (CONSP |ISTMP#2|)
                                      (EQ (CDR |ISTMP#2|) NIL)
                                      (PROGN
                                       (SETQ |predicate| (CAR |ISTMP#2|))
                                       #1='T)))))
                          (PROGN (SETQ |restParts| (CDR |parts|)) #1#))
                     (|eval| |predicate|))
                    (#1# T)))
      (COND
       (|continue|
        (PROGN
         (|htpSetProperty| |htPage| '|parts| |restParts|)
         (|htShowFunctionPageContinued| |htPage|)))
       (#1# (|htKill| |htPage| |value|)))))))

; htKill(htPage,value) ==
;   htInitPage('"System Command", nil)
;   string := STRCONC('"{\em )set ",listOfStrings2String [value,:$path],'"}")
;   htMakePage [
;      '(text
;         "{Here is the FriCAS system command you could have issued:}"
;             "\vspace{2}\newline\centerline{\tt"),
;       ['text,:string]]
;   htMakePage '((text . "}\vspace{1}\newline\rm"))
;   htSay '"\vspace{2}{Select \  \UpButton{} \  to go back.}"
;   htSay '"\newline{Select \  \ExitButton{QuitPage} \  to remove this window.}"
;   htProcessDoitButton ['"Press to Remove Page",'"",'htDoNothing]
;   htShowPage()

(DEFUN |htKill| (|htPage| |value|)
  (PROG (|string|)
    (RETURN
     (PROGN
      (|htInitPage| "System Command" NIL)
      (SETQ |string|
              (STRCONC "{\\em )set "
               (|listOfStrings2String| (CONS |value| |$path|)) "}"))
      (|htMakePage|
       (LIST
        '(|text| "{Here is the FriCAS system command you could have issued:}"
          "\\vspace{2}\\newline\\centerline{\\tt")
        (CONS '|text| |string|)))
      (|htMakePage| '((|text| . "}\\vspace{1}\\newline\\rm")))
      (|htSay| "\\vspace{2}{Select \\  \\UpButton{} \\  to go back.}")
      (|htSay|
       "\\newline{Select \\  \\ExitButton{QuitPage} \\  to remove this window.}")
      (|htProcessDoitButton| (LIST "Press to Remove Page" "" '|htDoNothing|))
      (|htShowPage|)))))

; htSetNotAvailable(htPage,whatToType) ==
;   page := htInitPage('"Unavailable Set Command", htpPropertyList htPage)
;   htInitPage('"Unavailable System Command", nil)
;   string := STRCONC('"{\em ",whatToType,'"}")
;   htMakePage [
;      '(text "\vspace{1}\newline"
;         "{Sorry, but this system command is not available through HyperDoc. Please directly issue this command in a FriCAS window for more information:}"
;             "\vspace{2}\newline\centerline{\tt"),
;       ['text,:string]]
;   htMakePage '((text . "}\vspace{1}\newline"))
;   htProcessDoitButton ['"Press to Remove Page",'"",'htDoNothing]
;   htShowPage()

(DEFUN |htSetNotAvailable| (|htPage| |whatToType|)
  (PROG (|page| |string|)
    (RETURN
     (PROGN
      (SETQ |page|
              (|htInitPage| "Unavailable Set Command"
               (|htpPropertyList| |htPage|)))
      (|htInitPage| "Unavailable System Command" NIL)
      (SETQ |string| (STRCONC "{\\em " |whatToType| "}"))
      (|htMakePage|
       (LIST
        '(|text| "\\vspace{1}\\newline"
          "{Sorry, but this system command is not available through HyperDoc. Please directly issue this command in a FriCAS window for more information:}"
          "\\vspace{2}\\newline\\centerline{\\tt")
        (CONS '|text| |string|)))
      (|htMakePage| '((|text| . "}\\vspace{1}\\newline")))
      (|htProcessDoitButton| (LIST "Press to Remove Page" "" '|htDoNothing|))
      (|htShowPage|)))))

; htDoNothing(htPage,command) == nil

(DEFUN |htDoNothing| (|htPage| |command|) (PROG () (RETURN NIL)))

; htCheck(checker,value) ==
;   PAIRP checker => htCheckList(checker,parseWord value)
;   FUNCALL(checker,value)

(DEFUN |htCheck| (|checker| |value|)
  (PROG ()
    (RETURN
     (COND ((CONSP |checker|) (|htCheckList| |checker| (|parseWord| |value|)))
           ('T (FUNCALL |checker| |value|))))))

; parseWord x ==
;   STRINGP x =>
;     and/[char_to_digit(x.i) for i in 0..MAXINDEX(x)] => PARSE_-INTEGER(x)
;     INTERN x
;   x

(DEFUN |parseWord| (|x|)
  (PROG ()
    (RETURN
     (COND
      ((STRINGP |x|)
       (COND
        (((LAMBDA (|bfVar#17| |bfVar#16| |i|)
            (LOOP
             (COND ((> |i| |bfVar#16|) (RETURN |bfVar#17|))
                   (#1='T
                    (PROGN
                     (SETQ |bfVar#17| (|char_to_digit| (ELT |x| |i|)))
                     (COND ((NOT |bfVar#17|) (RETURN NIL))))))
             (SETQ |i| (+ |i| 1))))
          T (MAXINDEX |x|) 0)
         (PARSE-INTEGER |x|))
        (#1# (INTERN |x|))))
      (#1# |x|)))))

; htCheckList(checker,value) ==
;   if value in '(y ye yes Y YE YES) then value := 'yes
;   if value in '(n no N NO) then value := 'no
;   checker is [n,m] and INTEGERP n =>
;     m = n + 1 =>
;       value in checker => value
;       n
;     null m =>
;       INTEGERP value and value >= n => value
;       n
;     INTEGERP m =>
;       INTEGERP value and value >= n and value <= m => value
;       n
;   value in checker => value
;   first checker

(DEFUN |htCheckList| (|checker| |value|)
  (PROG (|n| |ISTMP#1| |m|)
    (RETURN
     (PROGN
      (COND
       ((|member| |value| '(|y| |ye| |yes| Y YE YES)) (SETQ |value| '|yes|)))
      (COND ((|member| |value| '(|n| |no| N NO)) (SETQ |value| '|no|)))
      (COND
       ((AND (CONSP |checker|)
             (PROGN
              (SETQ |n| (CAR |checker|))
              (SETQ |ISTMP#1| (CDR |checker|))
              (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                   (PROGN (SETQ |m| (CAR |ISTMP#1|)) #1='T)))
             (INTEGERP |n|))
        (COND
         ((EQUAL |m| (+ |n| 1))
          (COND ((|member| |value| |checker|) |value|) (#1# |n|)))
         ((NULL |m|)
          (COND ((AND (INTEGERP |value|) (NOT (< |value| |n|))) |value|)
                (#1# |n|)))
         ((INTEGERP |m|)
          (COND
           ((AND (INTEGERP |value|) (NOT (< |value| |n|))
                 (NOT (< |m| |value|)))
            |value|)
           (#1# |n|)))))
       ((|member| |value| |checker|) |value|) (#1# (CAR |checker|)))))))

; translateYesNoToTrueFalse x ==
;   x = 'yes => true
;   x = 'no => false
;   x

(DEFUN |translateYesNoToTrueFalse| (|x|)
  (PROG () (RETURN (COND ((EQ |x| '|yes|) T) ((EQ |x| '|no|) NIL) ('T |x|)))))

; chkNameList x ==
;   u := bcString2ListWords x
;   parsedNames := [ncParseFromString x for x in u]
;   and/[IDENTP x for x in parsedNames] => parsedNames
;   '"Please enter a list of identifiers separated by blanks"

(DEFUN |chkNameList| (|x|)
  (PROG (|u| |parsedNames|)
    (RETURN
     (PROGN
      (SETQ |u| (|bcString2ListWords| |x|))
      (SETQ |parsedNames|
              ((LAMBDA (|bfVar#19| |bfVar#18| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#18|)
                        (PROGN (SETQ |x| (CAR |bfVar#18|)) NIL))
                    (RETURN (NREVERSE |bfVar#19|)))
                   (#1='T
                    (SETQ |bfVar#19|
                            (CONS (|ncParseFromString| |x|) |bfVar#19|))))
                  (SETQ |bfVar#18| (CDR |bfVar#18|))))
               NIL |u| NIL))
      (COND
       (((LAMBDA (|bfVar#21| |bfVar#20| |x|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#20|) (PROGN (SETQ |x| (CAR |bfVar#20|)) NIL))
              (RETURN |bfVar#21|))
             (#1#
              (PROGN
               (SETQ |bfVar#21| (IDENTP |x|))
               (COND ((NOT |bfVar#21|) (RETURN NIL))))))
            (SETQ |bfVar#20| (CDR |bfVar#20|))))
         T |parsedNames| NIL)
        |parsedNames|)
       (#1# "Please enter a list of identifiers separated by blanks"))))))

; chkPosInteger s ==
;   (u := parseOnly s) and INTEGERP u and u > 0 => u
;   '"Please enter a positive integer"

(DEFUN |chkPosInteger| (|s|)
  (PROG (|u|)
    (RETURN
     (COND ((AND (SETQ |u| (|parseOnly| |s|)) (INTEGERP |u|) (< 0 |u|)) |u|)
           ('T "Please enter a positive integer")))))

; chkOutputFileName s ==
;   bcString2WordList s in '(CONSOLE console) => 'console
;   chkDirectory s

(DEFUN |chkOutputFileName| (|s|)
  (PROG ()
    (RETURN
     (COND
      ((|member| (|bcString2WordList| |s|) '(CONSOLE |console|)) '|console|)
      ('T (|chkDirectory| |s|))))))

; chkDirectory s == s

(DEFUN |chkDirectory| (|s|) (PROG () (RETURN |s|)))

; chkNonNegativeInteger s ==
;   (u := ncParseFromString s) and INTEGERP u and u >= 0 => u
;   '"Please enter a non-negative integer"

(DEFUN |chkNonNegativeInteger| (|s|)
  (PROG (|u|)
    (RETURN
     (COND
      ((AND (SETQ |u| (|ncParseFromString| |s|)) (INTEGERP |u|)
            (NOT (MINUSP |u|)))
       |u|)
      ('T "Please enter a non-negative integer")))))

; chkRange s ==
;   (u := ncParseFromString s) and INTEGERP u
;     and u >= $htInitial and (NULL $htFinal or u <= $htFinal)
;       => u
;   null $htFinal =>
;     STRCONC('"Please enter an integer greater than ",stringize ($htInitial - 1))
;   STRCONC('"Please enter an integer between ",stringize $htInitial,'" and ",
;             stringize $htFinal)

(DEFUN |chkRange| (|s|)
  (PROG (|u|)
    (RETURN
     (COND
      ((AND (SETQ |u| (|ncParseFromString| |s|)) (INTEGERP |u|)
            (NOT (< |u| |$htInitial|))
            (OR (NULL |$htFinal|) (NOT (< |$htFinal| |u|))))
       |u|)
      ((NULL |$htFinal|)
       (STRCONC "Please enter an integer greater than "
        (|stringize| (- |$htInitial| 1))))
      ('T
       (STRCONC "Please enter an integer between " (|stringize| |$htInitial|)
        " and " (|stringize| |$htFinal|)))))))

; chkAllNonNegativeInteger s ==
;   (u := ncParseFromString s) and u in '(a al all A AL ALL) and 'ALL
;     or chkNonNegativeInteger s
;        or '"Please enter {\em all} or a non-negative integer"

(DEFUN |chkAllNonNegativeInteger| (|s|)
  (PROG (|u|)
    (RETURN
     (OR
      (AND (SETQ |u| (|ncParseFromString| |s|))
           (|member| |u| '(|a| |al| |all| A AL ALL)) 'ALL)
      (|chkNonNegativeInteger| |s|)
      "Please enter {\\em all} or a non-negative integer"))))

; htMakePathKey path ==
;   null path => systemError '"path is not set"
;   INTERN fn(PNAME first path,rest path) where
;     fn(a,b) ==
;       null b => a
;       fn(STRCONC(a,'".",PNAME first b),rest b)

(DEFUN |htMakePathKey| (|path|)
  (PROG ()
    (RETURN
     (COND ((NULL |path|) (|systemError| "path is not set"))
           ('T
            (INTERN (|htMakePathKey,fn| (PNAME (CAR |path|)) (CDR |path|))))))))
(DEFUN |htMakePathKey,fn| (|a| |b|)
  (PROG ()
    (RETURN
     (COND ((NULL |b|) |a|)
           ('T
            (|htMakePathKey,fn| (STRCONC |a| "." (PNAME (CAR |b|)))
             (CDR |b|)))))))

; htMarkTree(tree,n) ==
;   RPLACD(LASTNODE(tree), n)
;   for branch in tree repeat
;     branch.3 = 'TREE => htMarkTree(branch.5,n + 1)

(DEFUN |htMarkTree| (|tree| |n|)
  (PROG ()
    (RETURN
     (PROGN
      (RPLACD (LASTNODE |tree|) |n|)
      ((LAMBDA (|bfVar#22| |branch|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#22|) (PROGN (SETQ |branch| (CAR |bfVar#22|)) NIL))
            (RETURN NIL))
           ('T
            (COND
             ((EQ (ELT |branch| 3) 'TREE)
              (IDENTITY (|htMarkTree| (ELT |branch| 5) (+ |n| 1)))))))
          (SETQ |bfVar#22| (CDR |bfVar#22|))))
       |tree| NIL)))))

; htSetHistory htPage ==
;   msg := '"when the history facility is on (yes), results of computations are saved in memory"
;   data := ['history,msg,'history,'LITERALS,'$HiFiAccess,'(on off yes no)]
;   htShowLiteralsPage(htPage,data)

(DEFUN |htSetHistory| (|htPage|)
  (PROG (|msg| |data|)
    (RETURN
     (PROGN
      (SETQ |msg|
              "when the history facility is on (yes), results of computations are saved in memory")
      (SETQ |data|
              (LIST '|history| |msg| '|history| 'LITERALS '|$HiFiAccess|
                    '(|on| |off| |yes| |no|)))
      (|htShowLiteralsPage| |htPage| |data|)))))

; htSetOutputLibrary htPage ==
;   htSetNotAvailable(htPage,'")set compiler output")

(DEFUN |htSetOutputLibrary| (|htPage|)
  (PROG () (RETURN (|htSetNotAvailable| |htPage| ")set compiler output"))))

; htSetInputLibrary htPage ==
;   htSetNotAvailable(htPage,'")set compiler input")

(DEFUN |htSetInputLibrary| (|htPage|)
  (PROG () (RETURN (|htSetNotAvailable| |htPage| ")set compiler input"))))

; htSetExpose htPage ==
;   htSetNotAvailable(htPage,'")set expose")

(DEFUN |htSetExpose| (|htPage|)
  (PROG () (RETURN (|htSetNotAvailable| |htPage| ")set expose"))))

; htSetOutputCharacters htPage ==
;   htSetNotAvailable(htPage,'")set output characters")

(DEFUN |htSetOutputCharacters| (|htPage|)
  (PROG () (RETURN (|htSetNotAvailable| |htPage| ")set output characters"))))

; htSetOutputPage(page) ==
;     setData := htpProperty(page, 'setData)
;     branch := first(setData)
;     rec := get_out_rec(branch)
;     htpSetProperty(page, 'output_rec, rec)
;     page := htInitPage('"Set Command", htpPropertyList(page))
;     htSetLiterals2(page, setData.setName, setData.setLabel,
;                    (rec.$on_off => 'on; 'off), '(on off),
;                    'htSetOutputPage2)

(DEFUN |htSetOutputPage| (|page|)
  (PROG (|setData| |branch| |rec|)
    (RETURN
     (PROGN
      (SETQ |setData| (|htpProperty| |page| '|setData|))
      (SETQ |branch| (CAR |setData|))
      (SETQ |rec| (|get_out_rec| |branch|))
      (|htpSetProperty| |page| '|output_rec| |rec|)
      (SETQ |page| (|htInitPage| "Set Command" (|htpPropertyList| |page|)))
      (|htSetLiterals2| |page| (ELT |setData| 0) (ELT |setData| 1)
       (COND ((ELT |rec| |$on_off|) '|on|) ('T '|off|)) '(|on| |off|)
       '|htSetOutputPage2|)))))

; htSetOutputPage2(page, val) ==
;     rec := htpProperty(page, 'output_rec)
;     rec.$on_off := translateYesNo2TrueFalse(val)
;     rec.$on_off =>
;         setData := htpProperty(page, 'setData)
;         branch := first(setData)
;         phrase := CONCAT('"where ", STRINGIMAGE(branch),
;                     '" printing goes (enter {\em console} or a pathname)?")
;         checker := 'chkOutputFileName
;         htpSetProperty(page, 'checker, checker)
;         htShowFunctionPageContinued2(page, setData, rec.$file_off,
;                                      checker, phrase,
;                                      'htSetOutputPage3)
;     htKill(page, val)

(DEFUN |htSetOutputPage2| (|page| |val|)
  (PROG (|rec| |setData| |branch| |phrase| |checker|)
    (RETURN
     (PROGN
      (SETQ |rec| (|htpProperty| |page| '|output_rec|))
      (SETF (ELT |rec| |$on_off|) (|translateYesNo2TrueFalse| |val|))
      (COND
       ((ELT |rec| |$on_off|)
        (PROGN
         (SETQ |setData| (|htpProperty| |page| '|setData|))
         (SETQ |branch| (CAR |setData|))
         (SETQ |phrase|
                 (CONCAT "where " (STRINGIMAGE |branch|)
                         " printing goes (enter {\\em console} or a pathname)?"))
         (SETQ |checker| '|chkOutputFileName|)
         (|htpSetProperty| |page| '|checker| |checker|)
         (|htShowFunctionPageContinued2| |page| |setData|
          (ELT |rec| |$file_off|) |checker| |phrase| '|htSetOutputPage3|)))
       ('T (|htKill| |page| |val|)))))))

; htSetOutputPage3(page) ==
;     setData := htpProperty(page, 'setData)
;     checker := htpProperty(page, 'checker)
;     val := htCheck(checker, htpLabelInputString(page, 'value))
;     FUNCALL(setData.setVar, [val])
;     htKill(page, val)

(DEFUN |htSetOutputPage3| (|page|)
  (PROG (|setData| |checker| |val|)
    (RETURN
     (PROGN
      (SETQ |setData| (|htpProperty| |page| '|setData|))
      (SETQ |checker| (|htpProperty| |page| '|checker|))
      (SETQ |val|
              (|htCheck| |checker| (|htpLabelInputString| |page| '|value|)))
      (FUNCALL (ELT |setData| 4) (LIST |val|))
      (|htKill| |page| |val|)))))

; htSetCache(htPage,:options) ==
;   $path := '(functions cache)
;   htPage := htInitPage(mkSetTitle(),nil)
;   $valueList := nil
;   htMakePage '(
;    (text
;     "Use this system command to cause the FriCAS interpreter to `remember' "
;     "past values of interpreter functions. "
;     "To remember a past value of a function, the interpreter "
;     "sets up a {\em cache} for that function based on argument values. "
;     "When a value is cached for a given argument value, its value is gotten "
;     "from the cache and not recomputed. Caching can often save much "
;     "computing time, particularly with recursive functions or functions that "
;     "are expensive to compute and that are called repeatedly "
;     "with the same argument."
;     "\vspace{1}\newline ")
;    (domainConditions (Satisfies S chkNameList))
;    (text
;       "Enter below a list of interpreter functions you would like specially cached. "
;       "Use the name {\em all} to give a default setting for all "
;       "interpreter functions. "
;       "\vspace{1}\newline "
;       "Enter {\em all} or a list of names (separate names by blanks):")
;    (inputStrings ("" "" 60 "all" names S))
;    (doneButton "Push to enter names" htCacheAddChoice))
;   htShowPage()

(DEFUN |htSetCache| (|htPage| &REST |options|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |$path| '(|functions| |cache|))
      (SETQ |htPage| (|htInitPage| (|mkSetTitle|) NIL))
      (SETQ |$valueList| NIL)
      (|htMakePage|
       '((|text|
          "Use this system command to cause the FriCAS interpreter to `remember' "
          "past values of interpreter functions. "
          "To remember a past value of a function, the interpreter "
          "sets up a {\\em cache} for that function based on argument values. "
          "When a value is cached for a given argument value, its value is gotten "
          "from the cache and not recomputed. Caching can often save much "
          "computing time, particularly with recursive functions or functions that "
          "are expensive to compute and that are called repeatedly "
          "with the same argument." "\\vspace{1}\\newline ")
         (|domainConditions| (|Satisfies| S |chkNameList|))
         (|text|
          "Enter below a list of interpreter functions you would like specially cached. "
          "Use the name {\\em all} to give a default setting for all "
          "interpreter functions. " "\\vspace{1}\\newline "
          "Enter {\\em all} or a list of names (separate names by blanks):")
         (|inputStrings| ("" "" 60 "all" |names| S))
         (|doneButton| "Push to enter names" |htCacheAddChoice|)))
      (|htShowPage|)))))

; htCacheAddChoice htPage ==
;   names := bcString2WordList htpLabelInputString(htPage,'names)
;   $valueList := [listOfStrings2String names,:$valueList]
;   null names => htCacheAddQuery()
;   null rest names => htCacheOne names
;   page := htInitPage(mkSetTitle(),nil)
;   htpSetProperty(page,'names,names)
;   htMakePage '(
;     (domainConditions (Satisfies ALLPI chkAllPositiveInteger))
;     (text
;       "For each function, enter below a {\em cache length}, a positive integer. "
;       "This number tells how many past values will "
;       "be cached. "
;       "A cache length of {\em 0} means the function won't be cached. "
;       "To cache all past values, "
;       "enter {\em all}."
;       "\vspace{1}\newline "
;       "For each function name, enter {\em all} or a positive integer:"))
;   for i in 1.. for name in names repeat htMakePage [
;       ['inputStrings,
;         [STRCONC('"Function {\em ",name,'"} will cache"),
;           '"values",5,10,htMakeLabel('"c",i),'ALLPI]]]
;   htSetvarDoneButton('"Select to Set Values",'htCacheSet)
;   htShowPage()

(DEFUN |htCacheAddChoice| (|htPage|)
  (PROG (|names| |page|)
    (RETURN
     (PROGN
      (SETQ |names|
              (|bcString2WordList| (|htpLabelInputString| |htPage| '|names|)))
      (SETQ |$valueList| (CONS (|listOfStrings2String| |names|) |$valueList|))
      (COND ((NULL |names|) (|htCacheAddQuery|))
            ((NULL (CDR |names|)) (|htCacheOne| |names|))
            (#1='T
             (PROGN
              (SETQ |page| (|htInitPage| (|mkSetTitle|) NIL))
              (|htpSetProperty| |page| '|names| |names|)
              (|htMakePage|
               '((|domainConditions|
                  (|Satisfies| ALLPI |chkAllPositiveInteger|))
                 (|text|
                  "For each function, enter below a {\\em cache length}, a positive integer. "
                  "This number tells how many past values will " "be cached. "
                  "A cache length of {\\em 0} means the function won't be cached. "
                  "To cache all past values, " "enter {\\em all}."
                  "\\vspace{1}\\newline "
                  "For each function name, enter {\\em all} or a positive integer:")))
              ((LAMBDA (|i| |bfVar#23| |name|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#23|)
                        (PROGN (SETQ |name| (CAR |bfVar#23|)) NIL))
                    (RETURN NIL))
                   (#1#
                    (|htMakePage|
                     (LIST
                      (LIST '|inputStrings|
                            (LIST
                             (STRCONC "Function {\\em " |name| "} will cache")
                             "values" 5 10 (|htMakeLabel| "c" |i|) 'ALLPI))))))
                  (SETQ |i| (+ |i| 1))
                  (SETQ |bfVar#23| (CDR |bfVar#23|))))
               1 |names| NIL)
              (|htSetvarDoneButton| "Select to Set Values" '|htCacheSet|)
              (|htShowPage|))))))))

; htMakeLabel(prefix,i) == INTERN STRCONC(prefix,stringize i)

(DEFUN |htMakeLabel| (|prefix| |i|)
  (PROG () (RETURN (INTERN (STRCONC |prefix| (|stringize| |i|))))))

; htCacheSet htPage ==
;   names := htpProperty(htPage,'names)
;   for i in 1.. for name in names repeat
;     num := chkAllNonNegativeInteger
;              htpLabelInputString(htPage,htMakeLabel('"c",i))
;     $cacheAlist := ADDASSOC(INTERN name,num,$cacheAlist)
;   if (n := LASSOC('all,$cacheAlist)) then
;     $cacheCount := n
;     $cacheAlist := deleteAssoc('all,$cacheAlist)
;   htInitPage('"Cache Summary",nil)
;   bcHt '"In general, interpreter functions "
;   bcHt
;     $cacheCount = 0 => '"will {\em not} be cached."
;     bcHt '"cache "
;     htAllOrNum $cacheCount
;     '"} values."
;   bcHt '"\vspace{1}\newline "
;   if $cacheAlist then
; --    bcHt '" However, \indent{3}"
;     for [name,:val] in $cacheAlist | val ~= $cacheCount repeat
;       bcHt '"\newline function {\em "
;       bcHt stringize name
;       bcHt '"} will cache "
;       htAllOrNum val
;       bcHt '"} values"
;   htProcessDoitButton ['"Press to Remove Page",'"",'htDoNothing]
;   htShowPage()

(DEFUN |htCacheSet| (|htPage|)
  (PROG (|names| |num| |n| |name| |val|)
    (RETURN
     (PROGN
      (SETQ |names| (|htpProperty| |htPage| '|names|))
      ((LAMBDA (|i| |bfVar#24| |name|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#24|) (PROGN (SETQ |name| (CAR |bfVar#24|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (SETQ |num|
                     (|chkAllNonNegativeInteger|
                      (|htpLabelInputString| |htPage|
                       (|htMakeLabel| "c" |i|))))
             (SETQ |$cacheAlist|
                     (ADDASSOC (INTERN |name|) |num| |$cacheAlist|)))))
          (SETQ |i| (+ |i| 1))
          (SETQ |bfVar#24| (CDR |bfVar#24|))))
       1 |names| NIL)
      (COND
       ((SETQ |n| (LASSOC '|all| |$cacheAlist|)) (SETQ |$cacheCount| |n|)
        (SETQ |$cacheAlist| (|deleteAssoc| '|all| |$cacheAlist|))))
      (|htInitPage| "Cache Summary" NIL)
      (|bcHt| "In general, interpreter functions ")
      (|bcHt|
       (COND ((EQL |$cacheCount| 0) "will {\\em not} be cached.")
             (#1#
              (PROGN
               (|bcHt| "cache ")
               (|htAllOrNum| |$cacheCount|)
               "} values."))))
      (|bcHt| "\\vspace{1}\\newline ")
      (COND
       (|$cacheAlist|
        ((LAMBDA (|bfVar#26| |bfVar#25|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#26|)
                  (PROGN (SETQ |bfVar#25| (CAR |bfVar#26|)) NIL))
              (RETURN NIL))
             (#1#
              (AND (CONSP |bfVar#25|)
                   (PROGN
                    (SETQ |name| (CAR |bfVar#25|))
                    (SETQ |val| (CDR |bfVar#25|))
                    #1#)
                   (NOT (EQUAL |val| |$cacheCount|))
                   (PROGN
                    (|bcHt| "\\newline function {\\em ")
                    (|bcHt| (|stringize| |name|))
                    (|bcHt| "} will cache ")
                    (|htAllOrNum| |val|)
                    (|bcHt| "} values")))))
            (SETQ |bfVar#26| (CDR |bfVar#26|))))
         |$cacheAlist| NIL)))
      (|htProcessDoitButton| (LIST "Press to Remove Page" "" '|htDoNothing|))
      (|htShowPage|)))))

; htAllOrNum(val) ==
;     str :=
;         val = 'all => '"{\em all"
;         val = 0 => '"{\em no"
;         STRCONC('"the last {\em ",stringize val)
;     bcHt(str)

(DEFUN |htAllOrNum| (|val|)
  (PROG (|str|)
    (RETURN
     (PROGN
      (SETQ |str|
              (COND ((EQ |val| '|all|) "{\\em all") ((EQL |val| 0) "{\\em no")
                    ('T (STRCONC "the last {\\em " (|stringize| |val|)))))
      (|bcHt| |str|)))))

; htCacheOne names ==
;   page := htInitPage(mkSetTitle(),nil)
;   htpSetProperty(page,'names,names)
;   htMakePage '(
;     (domainConditions (Satisfies ALLPI chkAllPositiveInteger))
;     (text
;       "Enter below a {\em cache length}, a positive integer. "
;       "This number tells how many past values will "
;       "be cached. To cache all past values, "
;       "enter {\em all}."
;       "\vspace{1}\newline ")
;     (inputStrings
;       ("Enter {\em all} or a positive integer:"
;        "" 5 10 c1 ALLPI)))
;   htSetvarDoneButton('"Select to Set Value",'htCacheSet)
;   htShowPage()

(DEFUN |htCacheOne| (|names|)
  (PROG (|page|)
    (RETURN
     (PROGN
      (SETQ |page| (|htInitPage| (|mkSetTitle|) NIL))
      (|htpSetProperty| |page| '|names| |names|)
      (|htMakePage|
       '((|domainConditions| (|Satisfies| ALLPI |chkAllPositiveInteger|))
         (|text| "Enter below a {\\em cache length}, a positive integer. "
          "This number tells how many past values will "
          "be cached. To cache all past values, " "enter {\\em all}."
          "\\vspace{1}\\newline ")
         (|inputStrings|
          ("Enter {\\em all} or a positive integer:" "" 5 10 |c1| ALLPI))))
      (|htSetvarDoneButton| "Select to Set Value" '|htCacheSet|)
      (|htShowPage|)))))
