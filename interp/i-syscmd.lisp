 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; DEFPARAMETER($compileRecurrence, true)
 
(DEFPARAMETER |$compileRecurrence| T)
 
; DEFPARAMETER($SYSCOMMANDS, [first x for x in $systemCommands])
 
(DEFPARAMETER $SYSCOMMANDS
  ((LAMBDA (|bfVar#2| |bfVar#1| |x|)
     (LOOP
      (COND
       ((OR (ATOM |bfVar#1|) (PROGN (SETQ |x| (CAR |bfVar#1|)) NIL))
        (RETURN (NREVERSE |bfVar#2|)))
       ('T (SETQ |bfVar#2| (CONS (CAR |x|) |bfVar#2|))))
      (SETQ |bfVar#1| (CDR |bfVar#1|))))
   NIL |$systemCommands| NIL))
 
; DEFPARAMETER($whatOptions, '( _
;     operations _
;     categories _
;     domains _
;     packages _
;     commands _
;     synonyms _
;     things _
;     ))
 
(DEFPARAMETER |$whatOptions|
  '(|operations| |categories| |domains| |packages| |commands| |synonyms|
    |things|))
 
; DEFPARAMETER($clearOptions, '( _
;   modes _
;   operations _
;   properties _
;   types _
;   values  _
;   ))
 
(DEFPARAMETER |$clearOptions|
  '(|modes| |operations| |properties| |types| |values|))
 
; DEFPARAMETER($displayOptions, '( _
;   abbreviations _
;   all _
;   macros _
;   modes _
;   names _
;   operations  _
;   properties _
;   types _
;   values _
;   ))
 
(DEFPARAMETER |$displayOptions|
  '(|abbreviations| |all| |macros| |modes| |names| |operations| |properties|
    |types| |values|))
 
; DEFPARAMETER($countAssoc, '( (cache countCache) ))
 
(DEFPARAMETER |$countAssoc| '((|cache| |countCache|)))
 
; initializeSystemCommands() ==
;   l := $systemCommands
;   $SYSCOMMANDS := NIL
;   while l repeat
;     $SYSCOMMANDS := CONS(CAAR l, $SYSCOMMANDS)
;     l := rest l
;   $SYSCOMMANDS := NREVERSE $SYSCOMMANDS
 
(DEFUN |initializeSystemCommands| ()
  (PROG (|l|)
    (RETURN
     (PROGN
      (SETQ |l| |$systemCommands|)
      (SETQ $SYSCOMMANDS NIL)
      ((LAMBDA ()
         (LOOP
          (COND ((NOT |l|) (RETURN NIL))
                ('T
                 (PROGN
                  (SETQ $SYSCOMMANDS (CONS (CAAR |l|) $SYSCOMMANDS))
                  (SETQ |l| (CDR |l|))))))))
      (SETQ $SYSCOMMANDS (NREVERSE $SYSCOMMANDS))))))
 
; systemCommand [[op,:argl],:options] ==
;   $options: local:= options
;   $e:local := $CategoryFrame
;   fun := selectOptionLC(op,$SYSCOMMANDS,'commandError)
;   argl and (argl.0 = '_?) and fun ~= 'synonym =>
;     helpSpad2Cmd [fun]
;   fun := selectOption(fun,commandsForUserLevel $systemCommands,
;     'commandUserLevelError)
;   FUNCALL(fun, argl)
 
(DEFUN |systemCommand| (|bfVar#3|)
  (PROG (|$e| |$options| |fun| |options| |argl| |op|)
    (DECLARE (SPECIAL |$e| |$options|))
    (RETURN
     (PROGN
      (SETQ |op| (CAAR . #1=(|bfVar#3|)))
      (SETQ |argl| (CDAR . #1#))
      (SETQ |options| (CDR |bfVar#3|))
      (SETQ |$options| |options|)
      (SETQ |$e| |$CategoryFrame|)
      (SETQ |fun| (|selectOptionLC| |op| $SYSCOMMANDS '|commandError|))
      (COND
       ((AND |argl| (EQ (ELT |argl| 0) '?) (NOT (EQ |fun| '|synonym|)))
        (|helpSpad2Cmd| (LIST |fun|)))
       ('T
        (PROGN
         (SETQ |fun|
                 (|selectOption| |fun|
                  (|commandsForUserLevel| |$systemCommands|)
                  '|commandUserLevelError|))
         (FUNCALL |fun| |argl|))))))))
 
; commandsForUserLevel l == --[a for [a,:b] in l | satisfiesUserLevel(a)]
;   c := nil
;   for [a,:b] in l repeat
;     satisfiesUserLevel b => c := [a,:c]
;   reverse c
 
(DEFUN |commandsForUserLevel| (|l|)
  (PROG (|c| |a| |b|)
    (RETURN
     (PROGN
      (SETQ |c| NIL)
      ((LAMBDA (|bfVar#5| |bfVar#4|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#5|) (PROGN (SETQ |bfVar#4| (CAR |bfVar#5|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#4|)
                 (PROGN
                  (SETQ |a| (CAR |bfVar#4|))
                  (SETQ |b| (CDR |bfVar#4|))
                  #1#)
                 (COND
                  ((|satisfiesUserLevel| |b|)
                   (IDENTITY (SETQ |c| (CONS |a| |c|))))))))
          (SETQ |bfVar#5| (CDR |bfVar#5|))))
       |l| NIL)
      (REVERSE |c|)))))
 
; synonymsForUserLevel l ==
;   -- l is a list of synonyms, and this returns a sublist of applicable
;   -- synonyms at the current user level.
;   $UserLevel = 'development => l
;   nl := NIL
;   for syn in reverse l repeat
;     cmd := STRING2ID_-N(rest syn, 1)
;     null selectOptionLC(cmd,commandsForUserLevel
;       $systemCommands,NIL) => nil
;     nl := [syn,:nl]
;   nl
 
(DEFUN |synonymsForUserLevel| (|l|)
  (PROG (|nl| |cmd|)
    (RETURN
     (COND ((EQ |$UserLevel| '|development|) |l|)
           (#1='T
            (PROGN
             (SETQ |nl| NIL)
             ((LAMBDA (|bfVar#6| |syn|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#6|)
                       (PROGN (SETQ |syn| (CAR |bfVar#6|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (PROGN
                    (SETQ |cmd| (STRING2ID-N (CDR |syn|) 1))
                    (COND
                     ((NULL
                       (|selectOptionLC| |cmd|
                        (|commandsForUserLevel| |$systemCommands|) NIL))
                      NIL)
                     (#1# (SETQ |nl| (CONS |syn| |nl|)))))))
                 (SETQ |bfVar#6| (CDR |bfVar#6|))))
              (REVERSE |l|) NIL)
             |nl|))))))
 
; satisfiesUserLevel x ==
;   x          = 'interpreter => true
;   $UserLevel = 'interpreter => false
;   x          = 'compiler    => true
;   $UserLevel = 'compiler    => false
;   true
 
(DEFUN |satisfiesUserLevel| (|x|)
  (PROG ()
    (RETURN
     (COND ((EQ |x| '|interpreter|) T) ((EQ |$UserLevel| '|interpreter|) NIL)
           ((EQ |x| '|compiler|) T) ((EQ |$UserLevel| '|compiler|) NIL)
           ('T T)))))
 
; unAbbreviateKeyword x ==
;   x' :=selectOptionLC(x,$SYSCOMMANDS,'commandErrorIfAmbiguous)
;   if not x' then
;     x' := 'system
;     SETQ(LINE, CONCAT('")system ", SUBSTRING(LINE, 1, #LINE-1)))
;     $currentLine := LINE
;   selectOption(x',commandsForUserLevel $systemCommands,
;     'commandUserLevelError)
 
(DEFUN |unAbbreviateKeyword| (|x|)
  (PROG (|x'|)
    (RETURN
     (PROGN
      (SETQ |x'|
              (|selectOptionLC| |x| $SYSCOMMANDS '|commandErrorIfAmbiguous|))
      (COND
       ((NULL |x'|) (SETQ |x'| '|system|)
        (SETQ LINE (CONCAT ")system " (SUBSTRING LINE 1 (- (LENGTH LINE) 1))))
        (SETQ |$currentLine| LINE)))
      (|selectOption| |x'| (|commandsForUserLevel| |$systemCommands|)
       '|commandUserLevelError|)))))
 
; hasOption(al,opt) ==
;   optPname:= PNAME opt
;   found := NIL
;   for pair in al while not found repeat
;     stringPrefix?(PNAME first pair, optPname) => found := pair
;   found
 
(DEFUN |hasOption| (|al| |opt|)
  (PROG (|optPname| |found|)
    (RETURN
     (PROGN
      (SETQ |optPname| (PNAME |opt|))
      (SETQ |found| NIL)
      ((LAMBDA (|bfVar#7| |pair|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#7|) (PROGN (SETQ |pair| (CAR |bfVar#7|)) NIL)
                |found|)
            (RETURN NIL))
           ('T
            (COND
             ((|stringPrefix?| (PNAME (CAR |pair|)) |optPname|)
              (IDENTITY (SETQ |found| |pair|))))))
          (SETQ |bfVar#7| (CDR |bfVar#7|))))
       |al| NIL)
      |found|))))
 
; selectOptionLC(x,l,errorFunction) ==
;   selectOption(DOWNCASE object2Identifier x,l,errorFunction)
 
(DEFUN |selectOptionLC| (|x| |l| |errorFunction|)
  (PROG ()
    (RETURN
     (|selectOption| (DOWNCASE (|object2Identifier| |x|)) |l|
      |errorFunction|))))
 
; selectOption(x,l,errorFunction) ==
;   member(x,l) => x                   --exact spellings are always OK
;   null IDENTP x =>
;     errorFunction => FUNCALL(errorFunction,x,u)
;     nil
;   u := [y for y in l | stringPrefix?(PNAME x,PNAME y)]
;   u is [y] => y
;   errorFunction => FUNCALL(errorFunction,x,u)
;   nil
 
(DEFUN |selectOption| (|x| |l| |errorFunction|)
  (PROG (|u| |y|)
    (RETURN
     (COND ((|member| |x| |l|) |x|)
           ((NULL (IDENTP |x|))
            (COND (|errorFunction| (FUNCALL |errorFunction| |x| |u|))
                  (#1='T NIL)))
           (#1#
            (PROGN
             (SETQ |u|
                     ((LAMBDA (|bfVar#9| |bfVar#8| |y|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#8|)
                               (PROGN (SETQ |y| (CAR |bfVar#8|)) NIL))
                           (RETURN (NREVERSE |bfVar#9|)))
                          (#1#
                           (AND (|stringPrefix?| (PNAME |x|) (PNAME |y|))
                                (SETQ |bfVar#9| (CONS |y| |bfVar#9|)))))
                         (SETQ |bfVar#8| (CDR |bfVar#8|))))
                      NIL |l| NIL))
             (COND
              ((AND (CONSP |u|) (EQ (CDR |u|) NIL)
                    (PROGN (SETQ |y| (CAR |u|)) #1#))
               |y|)
              (|errorFunction| (FUNCALL |errorFunction| |x| |u|))
              (#1# NIL))))))))
 
; terminateSystemCommand() ==
;     FRESH_-LINE()
;     TOK := 'END_UNIT
;     spadThrow()
 
(DEFUN |terminateSystemCommand| ()
  (PROG (TOK) (RETURN (PROGN (FRESH-LINE) (SETQ TOK 'END_UNIT) (|spadThrow|)))))
 
; commandUserLevelError(x,u) == userLevelErrorMessage("command",x,u)
 
(DEFUN |commandUserLevelError| (|x| |u|)
  (PROG () (RETURN (|userLevelErrorMessage| '|command| |x| |u|))))
 
; optionUserLevelError(x,u) == userLevelErrorMessage("option",x,u)
 
(DEFUN |optionUserLevelError| (|x| |u|)
  (PROG () (RETURN (|userLevelErrorMessage| '|option| |x| |u|))))
 
; userLevelErrorMessage(kind,x,u) ==
;   null u =>
;     sayKeyedMsg("S2IZ0007",[$UserLevel,kind])
;     terminateSystemCommand()
;   commandAmbiguityError(kind,x,u)
 
(DEFUN |userLevelErrorMessage| (|kind| |x| |u|)
  (PROG ()
    (RETURN
     (COND
      ((NULL |u|)
       (PROGN
        (|sayKeyedMsg| 'S2IZ0007 (LIST |$UserLevel| |kind|))
        (|terminateSystemCommand|)))
      ('T (|commandAmbiguityError| |kind| |x| |u|))))))
 
; commandError(x,u) == commandErrorMessage("command",x,u)
 
(DEFUN |commandError| (|x| |u|)
  (PROG () (RETURN (|commandErrorMessage| '|command| |x| |u|))))
 
; optionError(x,u) == commandErrorMessage("option",x,u)
 
(DEFUN |optionError| (|x| |u|)
  (PROG () (RETURN (|commandErrorMessage| '|option| |x| |u|))))
 
; commandErrorIfAmbiguous(x, u) ==
;   null u => nil
;   SETQ($OLDLINE, LINE)
;   commandAmbiguityError("command", x, u)
 
(DEFUN |commandErrorIfAmbiguous| (|x| |u|)
  (PROG ()
    (RETURN
     (COND ((NULL |u|) NIL)
           ('T
            (PROGN
             (SETQ $OLDLINE LINE)
             (|commandAmbiguityError| '|command| |x| |u|)))))))
 
; commandErrorMessage(kind,x,u) ==
;   SETQ ($OLDLINE,LINE)
;   null u =>
;     sayKeyedMsg("S2IZ0008",[kind,x])
;     terminateSystemCommand()
;   commandAmbiguityError(kind,x,u)
 
(DEFUN |commandErrorMessage| (|kind| |x| |u|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ $OLDLINE LINE)
      (COND
       ((NULL |u|)
        (PROGN
         (|sayKeyedMsg| 'S2IZ0008 (LIST |kind| |x|))
         (|terminateSystemCommand|)))
       ('T (|commandAmbiguityError| |kind| |x| |u|)))))))
 
; commandAmbiguityError(kind,x,u) ==
;   sayKeyedMsg("S2IZ0009",[kind,x])
;   for a in u repeat sayMSG ['"     ",:bright a]
;   terminateSystemCommand()
 
(DEFUN |commandAmbiguityError| (|kind| |x| |u|)
  (PROG ()
    (RETURN
     (PROGN
      (|sayKeyedMsg| 'S2IZ0009 (LIST |kind| |x|))
      ((LAMBDA (|bfVar#10| |a|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#10|) (PROGN (SETQ |a| (CAR |bfVar#10|)) NIL))
            (RETURN NIL))
           ('T (|sayMSG| (CONS "     " (|bright| |a|)))))
          (SETQ |bfVar#10| (CDR |bfVar#10|))))
       |u| NIL)
      (|terminateSystemCommand|)))))
 
; getSystemCommandLine() ==
;   p := STRPOS('")",$currentLine,0,NIL)
;   line := if p then SUBSTRING($currentLine,p,NIL) else $currentLine
;   maxIndex:= MAXINDEX line
;   for i in 0..maxIndex while (line.i~=" ") repeat index:= i
;   if index=maxIndex then line := '""
;   else line := SUBSTRING(line,index+2,nil)
;   line
 
(DEFUN |getSystemCommandLine| ()
  (PROG (|index| |maxIndex| |line| |p|)
    (RETURN
     (PROGN
      (SETQ |p| (STRPOS ")" |$currentLine| 0 NIL))
      (SETQ |line|
              (COND (|p| (SUBSTRING |$currentLine| |p| NIL))
                    (#1='T |$currentLine|)))
      (SETQ |maxIndex| (MAXINDEX |line|))
      ((LAMBDA (|i|)
         (LOOP
          (COND
           ((OR (> |i| |maxIndex|) (EQ (ELT |line| |i|) '| |)) (RETURN NIL))
           (#1# (SETQ |index| |i|)))
          (SETQ |i| (+ |i| 1))))
       0)
      (COND ((EQUAL |index| |maxIndex|) (SETQ |line| ""))
            (#1# (SETQ |line| (SUBSTRING |line| (+ |index| 2) NIL))))
      |line|))))
 
; abbreviations l == abbreviationsSpad2Cmd l
 
(DEFUN |abbreviations| (|l|) (PROG () (RETURN (|abbreviationsSpad2Cmd| |l|))))
 
; abbreviationsSpad2Cmd l ==
;   null l => helpSpad2Cmd '(abbreviations)
;   abopts := '(query domain category package remove)
; 
;   quiet := nil
;   for [opt] in $options repeat
;     opt := selectOptionLC(opt,'(quiet),'optionError)
;     opt = 'quiet => quiet := true
; 
;   l is [opt,:al] =>
;     key := opOf first al
;     type := selectOptionLC(opt,abopts,'optionError)
;     type is 'query =>
;       null al => listConstructorAbbreviations()
;       constructor := abbreviation?(key) => abbQuery(constructor)
;       abbQuery(key)
;     type is 'remove =>
;       DELDATABASE(key,'ABBREVIATION)
;     ODDP SIZE al => sayKeyedMsg("S2IZ0002",[type])
;     repeat
;       null al => return 'fromLoop
;       [a,b,:al] := al
;       mkUserConstructorAbbreviation(b,a,type)
;       SETDATABASE(b,'ABBREVIATION,a)
;       SETDATABASE(b,'CONSTRUCTORKIND,type)
;     null quiet =>
;       sayKeyedMsg("S2IZ0001",[a,type,opOf b])
;       nil
;   nil
 
(DEFUN |abbreviationsSpad2Cmd| (|l|)
  (PROG (|abopts| |quiet| |opt| |al| |key| |type| |constructor| |LETTMP#1| |a|
         |b|)
    (RETURN
     (COND ((NULL |l|) (|helpSpad2Cmd| '(|abbreviations|)))
           (#1='T
            (PROGN
             (SETQ |abopts| '(|query| |domain| |category| |package| |remove|))
             (SETQ |quiet| NIL)
             ((LAMBDA (|bfVar#12| |bfVar#11|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#12|)
                       (PROGN (SETQ |bfVar#11| (CAR |bfVar#12|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (AND (CONSP |bfVar#11|) (EQ (CDR |bfVar#11|) NIL)
                        (PROGN (SETQ |opt| (CAR |bfVar#11|)) #1#)
                        (PROGN
                         (SETQ |opt|
                                 (|selectOptionLC| |opt| '(|quiet|)
                                  '|optionError|))
                         (COND ((EQ |opt| '|quiet|) (SETQ |quiet| T)))))))
                 (SETQ |bfVar#12| (CDR |bfVar#12|))))
              |$options| NIL)
             (COND
              ((AND (CONSP |l|)
                    (PROGN (SETQ |opt| (CAR |l|)) (SETQ |al| (CDR |l|)) #1#))
               (PROGN
                (SETQ |key| (|opOf| (CAR |al|)))
                (SETQ |type| (|selectOptionLC| |opt| |abopts| '|optionError|))
                (COND
                 ((EQ |type| '|query|)
                  (COND ((NULL |al|) (|listConstructorAbbreviations|))
                        ((SETQ |constructor| (|abbreviation?| |key|))
                         (|abbQuery| |constructor|))
                        (#1# (|abbQuery| |key|))))
                 ((EQ |type| '|remove|) (DELDATABASE |key| 'ABBREVIATION))
                 ((ODDP (SIZE |al|)) (|sayKeyedMsg| 'S2IZ0002 (LIST |type|)))
                 (#1#
                  (PROGN
                   ((LAMBDA ()
                      (LOOP
                       (COND (NIL (RETURN NIL))
                             (#1#
                              (COND ((NULL |al|) (RETURN '|fromLoop|))
                                    (#1#
                                     (PROGN
                                      (SETQ |LETTMP#1| |al|)
                                      (SETQ |a| (CAR |LETTMP#1|))
                                      (SETQ |b| (CADR . #2=(|LETTMP#1|)))
                                      (SETQ |al| (CDDR . #2#))
                                      (|mkUserConstructorAbbreviation| |b| |a|
                                       |type|)
                                      (SETDATABASE |b| 'ABBREVIATION |a|)
                                      (SETDATABASE |b| 'CONSTRUCTORKIND
                                       |type|)))))))))
                   (COND
                    ((NULL |quiet|)
                     (PROGN
                      (|sayKeyedMsg| 'S2IZ0001 (LIST |a| |type| (|opOf| |b|)))
                      NIL))))))))
              (#1# NIL))))))))
 
; listConstructorAbbreviations() ==
;   x := UPCASE queryUserKeyedMsg("S2IZ0056",NIL)
;   MEMQ(STRING2ID_-N(x,1),'(Y YES)) =>
;     whatSpad2Cmd '(categories)
;     whatSpad2Cmd '(domains)
;     whatSpad2Cmd '(packages)
;   sayKeyedMsg("S2IZ0057",NIL)
 
(DEFUN |listConstructorAbbreviations| ()
  (PROG (|x|)
    (RETURN
     (PROGN
      (SETQ |x| (UPCASE (|queryUserKeyedMsg| 'S2IZ0056 NIL)))
      (COND
       ((MEMQ (STRING2ID-N |x| 1) '(Y YES))
        (PROGN
         (|whatSpad2Cmd| '(|categories|))
         (|whatSpad2Cmd| '(|domains|))
         (|whatSpad2Cmd| '(|packages|))))
       ('T (|sayKeyedMsg| 'S2IZ0057 NIL)))))))
 
; cd(args) ==
;     dname :=
;         null(args) =>
;             TRIM_-DIRECTORY_-NAME(NAMESTRING(USER_-HOMEDIR_-PATHNAME()))
;         first(args)
;     if SYMBOLP(dname) then dname := SYMBOL_-NAME(dname)
;     CHDIR(dname)
;     sayKeyedMsg("S2IZ0070", [GET_-CURRENT_-DIRECTORY()])
 
(DEFUN |cd| (|args|)
  (PROG (|dname|)
    (RETURN
     (PROGN
      (SETQ |dname|
              (COND
               ((NULL |args|)
                (TRIM-DIRECTORY-NAME (NAMESTRING (USER-HOMEDIR-PATHNAME))))
               ('T (CAR |args|))))
      (COND ((SYMBOLP |dname|) (SETQ |dname| (SYMBOL-NAME |dname|))))
      (CHDIR |dname|)
      (|sayKeyedMsg| 'S2IZ0070 (LIST (GET-CURRENT-DIRECTORY)))))))
 
; clear l == clearSpad2Cmd l
 
(DEFUN |clear| (|l|) (PROG () (RETURN (|clearSpad2Cmd| |l|))))
 
; clearSpad2Cmd l ==
;   -- new version which changes the environment and updates history
;   $clearExcept: local := nil
;   if $options then $clearExcept :=
;     "and"/[selectOptionLC(opt,'(except),'optionError) =
;              'except for [opt,:.] in $options]
;   null l =>
;     optList:= "append"/[['%l,'"       ",x] for x in $clearOptions]
;     sayKeyedMsg("S2IZ0010",[optList])
;   arg := selectOptionLC(first l,'(all completely scaches),NIL)
;   arg = 'all          => clearCmdAll()
;   arg = 'completely   => clearCmdCompletely()
;   arg = 'scaches      => clearCmdSortedCaches()
;   $clearExcept => clearCmdExcept(l)
;   clearCmdParts(l)
;   updateCurrentInterpreterFrame()
 
(DEFUN |clearSpad2Cmd| (|l|)
  (PROG (|$clearExcept| |arg| |optList| |opt|)
    (DECLARE (SPECIAL |$clearExcept|))
    (RETURN
     (PROGN
      (SETQ |$clearExcept| NIL)
      (COND
       (|$options|
        (SETQ |$clearExcept|
                ((LAMBDA (|bfVar#15| |bfVar#14| |bfVar#13|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#14|)
                          (PROGN (SETQ |bfVar#13| (CAR |bfVar#14|)) NIL))
                      (RETURN |bfVar#15|))
                     (#1='T
                      (AND (CONSP |bfVar#13|)
                           (PROGN (SETQ |opt| (CAR |bfVar#13|)) #1#)
                           (PROGN
                            (SETQ |bfVar#15|
                                    (EQ
                                     (|selectOptionLC| |opt| '(|except|)
                                      '|optionError|)
                                     '|except|))
                            (COND ((NOT |bfVar#15|) (RETURN NIL)))))))
                    (SETQ |bfVar#14| (CDR |bfVar#14|))))
                 T |$options| NIL))))
      (COND
       ((NULL |l|)
        (PROGN
         (SETQ |optList|
                 ((LAMBDA (|bfVar#17| |bfVar#16| |x|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#16|)
                           (PROGN (SETQ |x| (CAR |bfVar#16|)) NIL))
                       (RETURN |bfVar#17|))
                      (#1#
                       (SETQ |bfVar#17|
                               (APPEND |bfVar#17|
                                       (LIST '|%l| "       " |x|)))))
                     (SETQ |bfVar#16| (CDR |bfVar#16|))))
                  NIL |$clearOptions| NIL))
         (|sayKeyedMsg| 'S2IZ0010 (LIST |optList|))))
       (#1#
        (PROGN
         (SETQ |arg|
                 (|selectOptionLC| (CAR |l|) '(|all| |completely| |scaches|)
                  NIL))
         (COND ((EQ |arg| '|all|) (|clearCmdAll|))
               ((EQ |arg| '|completely|) (|clearCmdCompletely|))
               ((EQ |arg| '|scaches|) (|clearCmdSortedCaches|))
               (|$clearExcept| (|clearCmdExcept| |l|))
               (#1#
                (PROGN
                 (|clearCmdParts| |l|)
                 (|updateCurrentInterpreterFrame|)))))))))))
 
; clearCmdSortedCaches() ==
;   $lookupDefaults: local := false
;   for [.,.,:domain] in HGET($ConstructorCache,'SortedCache) repeat
;     pair := compiledLookupCheck('clearCache,[$Void],domain)
;     SPADCALL pair
 
(DEFUN |clearCmdSortedCaches| ()
  (PROG (|$lookupDefaults| |ISTMP#1| |domain| |pair|)
    (DECLARE (SPECIAL |$lookupDefaults|))
    (RETURN
     (PROGN
      (SETQ |$lookupDefaults| NIL)
      ((LAMBDA (|bfVar#19| |bfVar#18|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#19|)
                (PROGN (SETQ |bfVar#18| (CAR |bfVar#19|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#18|)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |bfVar#18|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN (SETQ |domain| (CDR |ISTMP#1|)) #1#)))
                 (PROGN
                  (SETQ |pair|
                          (|compiledLookupCheck| '|clearCache| (LIST |$Void|)
                           |domain|))
                  (SPADCALL |pair|)))))
          (SETQ |bfVar#19| (CDR |bfVar#19|))))
       (HGET |$ConstructorCache| '|SortedCache|) NIL)))))
 
; clearCmdCompletely() ==
;   clearCmdAll()
;   $localExposureData := COPY_-SEQ $localExposureDataDefault
;   sayKeyedMsg("S2IZ0013",NIL)
;   clearClams()
;   clearConstructorCaches()
;   sayKeyedMsg("S2IZ0014",NIL)
;   RECLAIM()
;   sayKeyedMsg("S2IZ0015",NIL)
;   NIL
 
(DEFUN |clearCmdCompletely| ()
  (PROG ()
    (RETURN
     (PROGN
      (|clearCmdAll|)
      (SETQ |$localExposureData| (COPY-SEQ |$localExposureDataDefault|))
      (|sayKeyedMsg| 'S2IZ0013 NIL)
      (|clearClams|)
      (|clearConstructorCaches|)
      (|sayKeyedMsg| 'S2IZ0014 NIL)
      (RECLAIM)
      (|sayKeyedMsg| 'S2IZ0015 NIL)
      NIL))))
 
; clearCmdAll() ==
;   clearCmdSortedCaches()
;   ------undo special variables------
;   $frameRecord := nil
;   $previousBindings := nil
;   $variableNumberAlist := nil
;   untraceMapSubNames _/TRACENAMES
;   $InteractiveFrame := LIST LIST NIL
;   resetInCoreHist()
;   if $useInternalHistoryTable
;     then $internalHistoryTable := NIL
;     else deleteFile histFileName()
;   $IOindex := 1
;   updateCurrentInterpreterFrame()
;   $currentLine := '")clear all"    --restored 3/94; needed for undo (RDJ)
;   clearMacroTable()
;   if $frameMessages then sayKeyedMsg("S2IZ0011",[$interpreterFrameName])
;   else sayKeyedMsg("S2IZ0012",NIL)
 
(DEFUN |clearCmdAll| ()
  (PROG ()
    (RETURN
     (PROGN
      (|clearCmdSortedCaches|)
      (SETQ |$frameRecord| NIL)
      (SETQ |$previousBindings| NIL)
      (SETQ |$variableNumberAlist| NIL)
      (|untraceMapSubNames| /TRACENAMES)
      (SETQ |$InteractiveFrame| (LIST (LIST NIL)))
      (|resetInCoreHist|)
      (COND (|$useInternalHistoryTable| (SETQ |$internalHistoryTable| NIL))
            (#1='T (|deleteFile| (|histFileName|))))
      (SETQ |$IOindex| 1)
      (|updateCurrentInterpreterFrame|)
      (SETQ |$currentLine| ")clear all")
      (|clearMacroTable|)
      (COND
       (|$frameMessages|
        (|sayKeyedMsg| 'S2IZ0011 (LIST |$interpreterFrameName|)))
       (#1# (|sayKeyedMsg| 'S2IZ0012 NIL)))))))
 
; clearCmdExcept(l is [opt,:vl]) ==
;   --clears elements of vl of all options EXCEPT opt
;   for option in $clearOptions |
;     not stringPrefix?(object2String opt,object2String option)
;       repeat clearCmdParts [option,:vl]
 
(DEFUN |clearCmdExcept| (|l|)
  (PROG (|opt| |vl|)
    (RETURN
     (PROGN
      (SETQ |opt| (CAR |l|))
      (SETQ |vl| (CDR |l|))
      ((LAMBDA (|bfVar#20| |option|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#20|) (PROGN (SETQ |option| (CAR |bfVar#20|)) NIL))
            (RETURN NIL))
           ('T
            (AND
             (NULL
              (|stringPrefix?| (|object2String| |opt|)
               (|object2String| |option|)))
             (|clearCmdParts| (CONS |option| |vl|)))))
          (SETQ |bfVar#20| (CDR |bfVar#20|))))
       |$clearOptions| NIL)))))
 
; clearCmdParts(l is [opt,:vl]) ==
;   -- clears the bindings indicated by opt of all variables in vl
; 
;   option:= selectOptionLC(opt,$clearOptions,'optionError)
;   option:= INTERN PNAME option
; 
;   -- the option can be plural but the key in the alist is sometimes
;   -- singular
; 
;   option :=
;     option = 'types =>  'mode
;     option = 'modes =>  'mode
;     option = 'values => 'value
;     option
; 
;   null vl => sayKeyedMsg("S2IZ0055",NIL)
;   pmacs := getParserMacroNames()
;   imacs := getInterpMacroNames()
;   if vl='(all) then
;     vl := ASSOCLEFT CAAR $InteractiveFrame
;     vl := REMDUP(append(vl, pmacs))
;   $e : local := $InteractiveFrame
;   for x in vl repeat
;     clearDependencies(x,true)
;     if option='properties and x in pmacs then clearParserMacro(x)
;     if option='properties and x in imacs and not (x in pmacs) then
;         sayMessage ['"   You cannot clear the definition of the system-defined macro ",
;             fixObjectForPrinting x,"."]
;     p1 := assoc(x,CAAR $InteractiveFrame) =>
;       option='properties =>
;         if isMap x then
;           (lm := get(x,'localModemap,$InteractiveFrame)) =>
;             PAIRP lm => untraceMapSubNames [CADAR lm]
;           NIL
;         for p2 in rest p1 repeat
;             prop := first p2
;             recordOldValue(x, prop, rest p2)
;             recordNewValue(x, prop, NIL)
;         SETF(CAAR $InteractiveFrame,deleteAssoc(x,CAAR $InteractiveFrame))
;       p2 := assoc(option, rest p1) =>
;         recordOldValue(x, option, rest p2)
;         recordNewValue(x,option,NIL)
;         RPLACD(p2,NIL)
;   nil
 
(DEFUN |clearCmdParts| (|l|)
  (PROG (|$e| |p2| |prop| |lm| |p1| |imacs| |pmacs| |option| |vl| |opt|)
    (DECLARE (SPECIAL |$e|))
    (RETURN
     (PROGN
      (SETQ |opt| (CAR |l|))
      (SETQ |vl| (CDR |l|))
      (SETQ |option| (|selectOptionLC| |opt| |$clearOptions| '|optionError|))
      (SETQ |option| (INTERN (PNAME |option|)))
      (SETQ |option|
              (COND ((EQ |option| '|types|) '|mode|)
                    ((EQ |option| '|modes|) '|mode|)
                    ((EQ |option| '|values|) '|value|) (#1='T |option|)))
      (COND ((NULL |vl|) (|sayKeyedMsg| 'S2IZ0055 NIL))
            (#1#
             (PROGN
              (SETQ |pmacs| (|getParserMacroNames|))
              (SETQ |imacs| (|getInterpMacroNames|))
              (COND
               ((EQUAL |vl| '(|all|))
                (SETQ |vl| (ASSOCLEFT (CAAR |$InteractiveFrame|)))
                (SETQ |vl| (REMDUP (APPEND |vl| |pmacs|)))))
              (SETQ |$e| |$InteractiveFrame|)
              ((LAMBDA (|bfVar#21| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#21|)
                        (PROGN (SETQ |x| (CAR |bfVar#21|)) NIL))
                    (RETURN NIL))
                   (#1#
                    (PROGN
                     (|clearDependencies| |x| T)
                     (COND
                      ((AND (EQ |option| '|properties|) (|member| |x| |pmacs|))
                       (|clearParserMacro| |x|)))
                     (COND
                      ((AND (EQ |option| '|properties|) (|member| |x| |imacs|)
                            (NULL (|member| |x| |pmacs|)))
                       (|sayMessage|
                        (LIST
                         "   You cannot clear the definition of the system-defined macro "
                         (|fixObjectForPrinting| |x|) '|.|))))
                     (COND
                      ((SETQ |p1| (|assoc| |x| (CAAR |$InteractiveFrame|)))
                       (COND
                        ((EQ |option| '|properties|)
                         (PROGN
                          (COND
                           ((|isMap| |x|)
                            (COND
                             ((SETQ |lm|
                                      (|get| |x| '|localModemap|
                                       |$InteractiveFrame|))
                              (COND
                               ((CONSP |lm|)
                                (IDENTITY
                                 (|untraceMapSubNames| (LIST (CADAR |lm|)))))))
                             (#1# NIL))))
                          ((LAMBDA (|bfVar#22| |p2|)
                             (LOOP
                              (COND
                               ((OR (ATOM |bfVar#22|)
                                    (PROGN (SETQ |p2| (CAR |bfVar#22|)) NIL))
                                (RETURN NIL))
                               (#1#
                                (PROGN
                                 (SETQ |prop| (CAR |p2|))
                                 (|recordOldValue| |x| |prop| (CDR |p2|))
                                 (|recordNewValue| |x| |prop| NIL))))
                              (SETQ |bfVar#22| (CDR |bfVar#22|))))
                           (CDR |p1|) NIL)
                          (SETF (CAAR |$InteractiveFrame|)
                                  (|deleteAssoc| |x|
                                   (CAAR |$InteractiveFrame|)))))
                        ((SETQ |p2| (|assoc| |option| (CDR |p1|)))
                         (PROGN
                          (|recordOldValue| |x| |option| (CDR |p2|))
                          (|recordNewValue| |x| |option| NIL)
                          (RPLACD |p2| NIL)))))))))
                  (SETQ |bfVar#21| (CDR |bfVar#21|))))
               |vl| NIL)
              NIL)))))))
 
; queryClients () ==
;   -- Returns the number of active scratchpad clients
;   sockSendInt($SessionManager, $QueryClients)
;   sockGetInt $SessionManager
 
(DEFUN |queryClients| ()
  (PROG ()
    (RETURN
     (PROGN
      (|sockSendInt| |$SessionManager| |$QueryClients|)
      (|sockGetInt| |$SessionManager|)))))
 
; close args ==
;   quiet:local:= false
;   null $SpadServer =>
;     throwKeyedMsg('"S2IZ0071", [])
;   numClients := queryClients()
;   numClients > 1 =>
;     sockSendInt($SessionManager, $CloseClient)
;     sockSendInt($SessionManager, $currentFrameNum)
;     closeInterpreterFrame(NIL)
;   for [opt,:.] in $options repeat
;     fullopt := selectOptionLC(opt, '(quiet), 'optionError)
;     fullopt = 'quiet   =>
;            quiet:=true
;   quiet =>
;     sockSendInt($SessionManager, $CloseClient)
;     sockSendInt($SessionManager, $currentFrameNum)
;     closeInterpreterFrame(NIL)
;   x := UPCASE queryUserKeyedMsg('"S2IZ0072", nil)
;   MEMQ(STRING2ID_-N(x,1), '(YES Y)) =>
;     QUIT()
;   nil
 
(DEFUN |close| (|args|)
  (PROG (|quiet| |x| |fullopt| |opt| |numClients|)
    (DECLARE (SPECIAL |quiet|))
    (RETURN
     (PROGN
      (SETQ |quiet| NIL)
      (COND ((NULL |$SpadServer|) (|throwKeyedMsg| "S2IZ0071" NIL))
            (#1='T
             (PROGN
              (SETQ |numClients| (|queryClients|))
              (COND
               ((< 1 |numClients|)
                (PROGN
                 (|sockSendInt| |$SessionManager| |$CloseClient|)
                 (|sockSendInt| |$SessionManager| |$currentFrameNum|)
                 (|closeInterpreterFrame| NIL)))
               (#1#
                (PROGN
                 ((LAMBDA (|bfVar#24| |bfVar#23|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#24|)
                           (PROGN (SETQ |bfVar#23| (CAR |bfVar#24|)) NIL))
                       (RETURN NIL))
                      (#1#
                       (AND (CONSP |bfVar#23|)
                            (PROGN (SETQ |opt| (CAR |bfVar#23|)) #1#)
                            (PROGN
                             (SETQ |fullopt|
                                     (|selectOptionLC| |opt| '(|quiet|)
                                      '|optionError|))
                             (COND
                              ((EQ |fullopt| '|quiet|) (SETQ |quiet| T)))))))
                     (SETQ |bfVar#24| (CDR |bfVar#24|))))
                  |$options| NIL)
                 (COND
                  (|quiet|
                   (PROGN
                    (|sockSendInt| |$SessionManager| |$CloseClient|)
                    (|sockSendInt| |$SessionManager| |$currentFrameNum|)
                    (|closeInterpreterFrame| NIL)))
                  (#1#
                   (PROGN
                    (SETQ |x| (UPCASE (|queryUserKeyedMsg| "S2IZ0072" NIL)))
                    (COND ((MEMQ (STRING2ID-N |x| 1) '(YES Y)) (QUIT))
                          (#1# NIL)))))))))))))))
 
; constructor args ==
;   sayMessage '"   Not implemented yet."
;   NIL
 
(DEFUN |constructor| (|args|)
  (PROG () (RETURN (PROGN (|sayMessage| "   Not implemented yet.") NIL))))
 
; compiler args ==
;     $newConlist: local := nil    --reset by compDefineLisplib and astran
;     null args and null $options and null($edit_file) =>
;         helpSpad2Cmd '(compiler)
;     if null args then args := [$edit_file]
; 
;     -- first see if the user has explicitly specified the compiler
;     -- to use.
; 
;     optlist := '(new old translate constructor)
;     haveNew := nil
;     haveOld := nil
;     for opt in $options while not (haveNew and haveOld) repeat
;         [optname,:optargs] := opt
;         fullopt := selectOptionLC(optname,optlist,nil)
;         fullopt = 'new => haveNew := true
;         fullopt = 'translate => haveOld := true
;         fullopt = 'constructor => haveOld := true
;         fullopt = 'old => haveOld := true
; 
;     haveNew and haveOld => throwKeyedMsg("S2IZ0081", nil)
; 
;     af  := pathname args
;     aft := pathnameType af
; 
;     haveNew or (aft = '"as")   =>
;         not (af1 := $FINDFILE (af, '(as))) =>
;             throwKeyedMsg("S2IL0003",[NAMESTRING af])
;         compileAsharpCmd [af1]
;     haveOld or (aft = '"spad") =>
;         not (af1 := $FINDFILE (af, '(spad))) =>
;             throwKeyedMsg("S2IL0003",[NAMESTRING af])
;         compileSpad2Cmd  [af1]
;     aft = '"lsp"   =>
;         not (af1 := $FINDFILE (af, '(lsp))) =>
;             throwKeyedMsg("S2IL0003",[NAMESTRING af])
;         compileAsharpLispCmd [af1]
;     aft = '"NRLIB"  =>
;         not (af1 := $FINDFILE (af, '(NRLIB))) =>
;             throwKeyedMsg("S2IL0003",[NAMESTRING af])
;         compileSpadLispCmd [af1]
;     aft = '"ao"   =>
;         not (af1 := $FINDFILE (af, '(ao))) =>
;             throwKeyedMsg("S2IL0003",[NAMESTRING af])
;         compileAsharpCmd [af1]
;     aft = '"al"   =>    -- archive library of .ao files
;         not (af1 := $FINDFILE (af, '(al))) =>
;             throwKeyedMsg("S2IL0003",[NAMESTRING af])
;         compileAsharpArchiveCmd [af1]
; 
;     -- see if we something with the appropriate file extension
;     -- lying around
; 
;     af1 := $FINDFILE (af, '(as spad ao asy))
; 
;     af1 and pathnameType(af1) = '"as"   => compileAsharpCmd [af1]
;     af1 and pathnameType(af1) = '"ao"  => compileAsharpCmd [af1]
;     af1 and pathnameType(af1) = '"spad" => compileSpad2Cmd  [af1]
;     af1 and pathnameType(af1) = '"asy"  => compileAsharpArchiveCmd [af1]
; 
;     throwKeyedMsg("S2IZ0039", nil)
 
(DEFUN |compiler| (|args|)
  (PROG (|$newConlist| |af1| |aft| |af| |fullopt| |optargs| |optname| |haveOld|
         |haveNew| |optlist|)
    (DECLARE (SPECIAL |$newConlist|))
    (RETURN
     (PROGN
      (SETQ |$newConlist| NIL)
      (COND
       ((AND (NULL |args|) (NULL |$options|) (NULL |$edit_file|))
        (|helpSpad2Cmd| '(|compiler|)))
       (#1='T
        (PROGN
         (COND ((NULL |args|) (SETQ |args| (LIST |$edit_file|))))
         (SETQ |optlist| '(|new| |old| |translate| |constructor|))
         (SETQ |haveNew| NIL)
         (SETQ |haveOld| NIL)
         ((LAMBDA (|bfVar#25| |opt|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#25|) (PROGN (SETQ |opt| (CAR |bfVar#25|)) NIL)
                   (AND |haveNew| |haveOld|))
               (RETURN NIL))
              (#1#
               (PROGN
                (SETQ |optname| (CAR |opt|))
                (SETQ |optargs| (CDR |opt|))
                (SETQ |fullopt| (|selectOptionLC| |optname| |optlist| NIL))
                (COND ((EQ |fullopt| '|new|) (SETQ |haveNew| T))
                      ((EQ |fullopt| '|translate|) (SETQ |haveOld| T))
                      ((EQ |fullopt| '|constructor|) (SETQ |haveOld| T))
                      ((EQ |fullopt| '|old|) (SETQ |haveOld| T))))))
             (SETQ |bfVar#25| (CDR |bfVar#25|))))
          |$options| NIL)
         (COND ((AND |haveNew| |haveOld|) (|throwKeyedMsg| 'S2IZ0081 NIL))
               (#1#
                (PROGN
                 (SETQ |af| (|pathname| |args|))
                 (SETQ |aft| (|pathnameType| |af|))
                 (COND
                  ((OR |haveNew| (EQUAL |aft| "as"))
                   (COND
                    ((NULL (SETQ |af1| ($FINDFILE |af| '(|as|))))
                     (|throwKeyedMsg| 'S2IL0003 (LIST (NAMESTRING |af|))))
                    (#1# (|compileAsharpCmd| (LIST |af1|)))))
                  ((OR |haveOld| (EQUAL |aft| "spad"))
                   (COND
                    ((NULL (SETQ |af1| ($FINDFILE |af| '(|spad|))))
                     (|throwKeyedMsg| 'S2IL0003 (LIST (NAMESTRING |af|))))
                    (#1# (|compileSpad2Cmd| (LIST |af1|)))))
                  ((EQUAL |aft| "lsp")
                   (COND
                    ((NULL (SETQ |af1| ($FINDFILE |af| '(|lsp|))))
                     (|throwKeyedMsg| 'S2IL0003 (LIST (NAMESTRING |af|))))
                    (#1# (|compileAsharpLispCmd| (LIST |af1|)))))
                  ((EQUAL |aft| "NRLIB")
                   (COND
                    ((NULL (SETQ |af1| ($FINDFILE |af| '(NRLIB))))
                     (|throwKeyedMsg| 'S2IL0003 (LIST (NAMESTRING |af|))))
                    (#1# (|compileSpadLispCmd| (LIST |af1|)))))
                  ((EQUAL |aft| "ao")
                   (COND
                    ((NULL (SETQ |af1| ($FINDFILE |af| '(|ao|))))
                     (|throwKeyedMsg| 'S2IL0003 (LIST (NAMESTRING |af|))))
                    (#1# (|compileAsharpCmd| (LIST |af1|)))))
                  ((EQUAL |aft| "al")
                   (COND
                    ((NULL (SETQ |af1| ($FINDFILE |af| '(|al|))))
                     (|throwKeyedMsg| 'S2IL0003 (LIST (NAMESTRING |af|))))
                    (#1# (|compileAsharpArchiveCmd| (LIST |af1|)))))
                  (#1#
                   (PROGN
                    (SETQ |af1| ($FINDFILE |af| '(|as| |spad| |ao| |asy|)))
                    (COND
                     ((AND |af1| (EQUAL (|pathnameType| |af1|) "as"))
                      (|compileAsharpCmd| (LIST |af1|)))
                     ((AND |af1| (EQUAL (|pathnameType| |af1|) "ao"))
                      (|compileAsharpCmd| (LIST |af1|)))
                     ((AND |af1| (EQUAL (|pathnameType| |af1|) "spad"))
                      (|compileSpad2Cmd| (LIST |af1|)))
                     ((AND |af1| (EQUAL (|pathnameType| |af1|) "asy"))
                      (|compileAsharpArchiveCmd| (LIST |af1|)))
                     (#1# (|throwKeyedMsg| 'S2IZ0039 NIL))))))))))))))))
 
; compileAsharpCmd args ==
;     compileAsharpCmd1 args
;     terminateSystemCommand()
;     spadPrompt()
 
(DEFUN |compileAsharpCmd| (|args|)
  (PROG ()
    (RETURN
     (PROGN
      (|compileAsharpCmd1| |args|)
      (|terminateSystemCommand|)
      (|spadPrompt|)))))
 
; compileAsharpCmd1 args ==
;     -- Assume we entered from the "compiler" function, so args ~= nil
;     -- and is a file with file extension .as or .ao
; 
;     path := pathname args
;     pathType := pathnameType path
;     (pathType ~= '"as") and (pathType ~= '"ao") => throwKeyedMsg("S2IZ0083", nil)
;     not PROBE_-FILE path => throwKeyedMsg("S2IL0003",[namestring args])
; 
;     $edit_file := path
; 
;     optList :=  '( _
;       new _
;       old _
;       translate _
;       onlyargs _
;       moreargs _
;       quiet _
;       nolispcompile _
;       noquiet _
;       library _
;       nolibrary _
;         )
; 
;     beQuiet := false         -- be verbose here
;     doLibrary  := true       -- so a )library after compilation
;     doCompileLisp := true    -- do compile generated lisp code
; 
;     moreArgs := NIL
;     onlyArgs := NIL
; 
;     for opt in $options repeat
;         [optname,:optargs] := opt
;         fullopt := selectOptionLC(optname,optList,nil)
; 
;         fullopt = 'new       => nil
;         fullopt = 'old       => error "Internal error: compileAsharpCmd got )old"
;         fullopt = 'translate => error "Internal error: compileAsharpCmd got )translate"
; 
;         fullopt = 'quiet     => beQuiet := true
;         fullopt = 'noquiet   => beQuiet := false
; 
;         fullopt = 'nolispcompile   => doCompileLisp := false
; 
;         fullopt = 'moreargs  => moreArgs := optargs
;         fullopt = 'onlyargs  => onlyArgs := optargs
; 
;         fullopt = 'library   => doLibrary  := true
;         fullopt = 'nolibrary => doLibrary  := false
; 
;         throwKeyedMsg("S2IZ0036",[STRCONC('")",object2String optname)])
; 
;     tempArgs :=
;         pathType = '"ao" =>
;             -- want to strip out -Fao
;             (p := STRPOS('"-Fao", $asharpCmdlineFlags, 0, NIL)) =>
;                 p = 0 => SUBSTRING($asharpCmdlineFlags, 5, NIL)
;                 STRCONC(SUBSTRING($asharpCmdlineFlags, 0, p), '" ",
;                     SUBSTRING($asharpCmdlineFlags, p+5, NIL))
;             $asharpCmdlineFlags
;         $asharpCmdlineFlags
; 
;     asharpArgs :=
;         onlyArgs =>
;             s := ""
;             for a in onlyArgs repeat
;                 s := STRCONC(s, '" ", object2String a)
;             s
;         moreArgs =>
;             s := tempArgs
;             for a in moreArgs repeat
;                 s := STRCONC(s, '" ", object2String a)
;             s
;         tempArgs
; 
;     if not beQuiet then sayKeyedMsg("S2IZ0038A",[namestring args, asharpArgs])
; 
;     command :=
;       STRCONC(STRCONC(getEnv('"ALDORROOT"),'"/bin/"),_
;                     "aldor ", asharpArgs, '" ", namestring args)
;     rc := OBEY command
; 
;     if (rc = 0) and doCompileLisp then
;         lsp := fnameMake('".", pathnameName args, '"lsp")
;         if fnameReadable?(lsp) then
;             if not beQuiet then sayKeyedMsg("S2IZ0089", [namestring lsp])
;             compileFileQuietly(lsp)
;         else
;             sayKeyedMsg("S2IL0003", [namestring lsp])
; 
;     if rc = 0 and doLibrary then
;         -- do we need to worry about where the compilation output went?
;         if not beQuiet then sayKeyedMsg("S2IZ0090", [ pathnameName path ])
;         withAsharpCmd [ pathnameName path ]
;     else if not beQuiet then
;         sayKeyedMsg("S2IZ0084", nil)
; 
;     extendLocalLibdb $newConlist
 
(DEFUN |compileAsharpCmd1| (|args|)
  (PROG (|path| |pathType| |optList| |beQuiet| |doLibrary| |doCompileLisp|
         |moreArgs| |onlyArgs| |optname| |optargs| |fullopt| |p| |tempArgs| |s|
         |asharpArgs| |command| |rc| |lsp|)
    (RETURN
     (PROGN
      (SETQ |path| (|pathname| |args|))
      (SETQ |pathType| (|pathnameType| |path|))
      (COND
       ((AND (NOT (EQUAL |pathType| "as")) (NOT (EQUAL |pathType| "ao")))
        (|throwKeyedMsg| 'S2IZ0083 NIL))
       ((NULL (PROBE-FILE |path|))
        (|throwKeyedMsg| 'S2IL0003 (LIST (|namestring| |args|))))
       (#1='T
        (PROGN
         (SETQ |$edit_file| |path|)
         (SETQ |optList|
                 '(|new| |old| |translate| |onlyargs| |moreargs| |quiet|
                   |nolispcompile| |noquiet| |library| |nolibrary|))
         (SETQ |beQuiet| NIL)
         (SETQ |doLibrary| T)
         (SETQ |doCompileLisp| T)
         (SETQ |moreArgs| NIL)
         (SETQ |onlyArgs| NIL)
         ((LAMBDA (|bfVar#26| |opt|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#26|) (PROGN (SETQ |opt| (CAR |bfVar#26|)) NIL))
               (RETURN NIL))
              (#1#
               (PROGN
                (SETQ |optname| (CAR |opt|))
                (SETQ |optargs| (CDR |opt|))
                (SETQ |fullopt| (|selectOptionLC| |optname| |optList| NIL))
                (COND ((EQ |fullopt| '|new|) NIL)
                      ((EQ |fullopt| '|old|)
                       (|error| '|Internal error: compileAsharpCmd got )old|))
                      ((EQ |fullopt| '|translate|)
                       (|error|
                        '|Internal error: compileAsharpCmd got )translate|))
                      ((EQ |fullopt| '|quiet|) (SETQ |beQuiet| T))
                      ((EQ |fullopt| '|noquiet|) (SETQ |beQuiet| NIL))
                      ((EQ |fullopt| '|nolispcompile|)
                       (SETQ |doCompileLisp| NIL))
                      ((EQ |fullopt| '|moreargs|) (SETQ |moreArgs| |optargs|))
                      ((EQ |fullopt| '|onlyargs|) (SETQ |onlyArgs| |optargs|))
                      ((EQ |fullopt| '|library|) (SETQ |doLibrary| T))
                      ((EQ |fullopt| '|nolibrary|) (SETQ |doLibrary| NIL))
                      (#1#
                       (|throwKeyedMsg| 'S2IZ0036
                        (LIST (STRCONC ")" (|object2String| |optname|)))))))))
             (SETQ |bfVar#26| (CDR |bfVar#26|))))
          |$options| NIL)
         (SETQ |tempArgs|
                 (COND
                  ((EQUAL |pathType| "ao")
                   (COND
                    ((SETQ |p| (STRPOS "-Fao" |$asharpCmdlineFlags| 0 NIL))
                     (COND
                      ((EQL |p| 0) (SUBSTRING |$asharpCmdlineFlags| 5 NIL))
                      (#1#
                       (STRCONC (SUBSTRING |$asharpCmdlineFlags| 0 |p|) " "
                        (SUBSTRING |$asharpCmdlineFlags| (+ |p| 5) NIL)))))
                    (#1# |$asharpCmdlineFlags|)))
                  (#1# |$asharpCmdlineFlags|)))
         (SETQ |asharpArgs|
                 (COND
                  (|onlyArgs|
                   (PROGN
                    (SETQ |s| '||)
                    ((LAMBDA (|bfVar#27| |a|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#27|)
                              (PROGN (SETQ |a| (CAR |bfVar#27|)) NIL))
                          (RETURN NIL))
                         (#1#
                          (SETQ |s| (STRCONC |s| " " (|object2String| |a|)))))
                        (SETQ |bfVar#27| (CDR |bfVar#27|))))
                     |onlyArgs| NIL)
                    |s|))
                  (|moreArgs|
                   (PROGN
                    (SETQ |s| |tempArgs|)
                    ((LAMBDA (|bfVar#28| |a|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#28|)
                              (PROGN (SETQ |a| (CAR |bfVar#28|)) NIL))
                          (RETURN NIL))
                         (#1#
                          (SETQ |s| (STRCONC |s| " " (|object2String| |a|)))))
                        (SETQ |bfVar#28| (CDR |bfVar#28|))))
                     |moreArgs| NIL)
                    |s|))
                  (#1# |tempArgs|)))
         (COND
          ((NULL |beQuiet|)
           (|sayKeyedMsg| 'S2IZ0038A
            (LIST (|namestring| |args|) |asharpArgs|))))
         (SETQ |command|
                 (STRCONC (STRCONC (|getEnv| "ALDORROOT") "/bin/") '|aldor |
                  |asharpArgs| " " (|namestring| |args|)))
         (SETQ |rc| (OBEY |command|))
         (COND
          ((AND (EQL |rc| 0) |doCompileLisp|)
           (SETQ |lsp| (|fnameMake| "." (|pathnameName| |args|) "lsp"))
           (COND
            ((|fnameReadable?| |lsp|)
             (COND
              ((NULL |beQuiet|)
               (|sayKeyedMsg| 'S2IZ0089 (LIST (|namestring| |lsp|)))))
             (|compileFileQuietly| |lsp|))
            (#1# (|sayKeyedMsg| 'S2IL0003 (LIST (|namestring| |lsp|)))))))
         (COND
          ((AND (EQL |rc| 0) |doLibrary|)
           (COND
            ((NULL |beQuiet|)
             (|sayKeyedMsg| 'S2IZ0090 (LIST (|pathnameName| |path|)))))
           (|withAsharpCmd| (LIST (|pathnameName| |path|))))
          ((NULL |beQuiet|) (|sayKeyedMsg| 'S2IZ0084 NIL)))
         (|extendLocalLibdb| |$newConlist|))))))))
 
; compileAsharpArchiveCmd args ==
;     -- Assume we entered from the "compiler" function, so args ~= nil
;     -- and is a file with file extension .al. We also assume that
;     -- the name is fully qualified.
; 
;     path := pathname args
;     (FILE_-KIND namestring args) ~= 1 =>
;           throwKeyedMsg("S2IL0003",[namestring args])
; 
;     -- here is the plan:
;     --   1. extract the file name and try to make a directory based
;     --      on that name.
;     --   2. cd to that directory and ar x the .al file
;     --   3. for each .ao file that shows up, compile it
;     --   4. delete the generated .ao files
; 
;     -- First try to make the directory in the current directory
; 
;     dir  := fnameMake('".", pathnameName path, '"axldir")
;     isDir := FILE_-KIND namestring dir
;     isDir = 0 =>
;         throwKeyedMsg("S2IL0027",[namestring dir, namestring args])
; 
;     if isDir ~= 1 then
;         cmd  := STRCONC('"mkdir ", namestring dir)
;         rc   := OBEY cmd
;         rc ~= 0 => throwKeyedMsg("S2IL0027",[namestring dir, namestring args])
; 
;     curDir := GET_-CURRENT_-DIRECTORY()
; 
;     -- cd to that directory and try to unarchive the .al file
; 
;     cd [ namestring dir ]
; 
;     cmd := STRCONC( '"ar x ", namestring path )
;     rc := OBEY cmd
;     rc ~= 0 =>
;         cd [ namestring curDir ]
;         throwKeyedMsg("S2IL0028",[namestring dir, namestring args])
; 
;     -- Look for .ao files
; 
;     asos := DIRECTORY '"*.ao"
;     null asos =>
;         cd [ namestring curDir ]
;         throwKeyedMsg("S2IL0029",[namestring dir, namestring args])
; 
;     -- Compile the .ao files
; 
;     for aso in asos repeat
;         compileAsharpCmd1 [ namestring aso ]
; 
;     -- Reset the current directory
; 
;     cd [ namestring curDir ]
; 
;     terminateSystemCommand()
;     spadPrompt()
 
(DEFUN |compileAsharpArchiveCmd| (|args|)
  (PROG (|path| |dir| |isDir| |cmd| |rc| |curDir| |asos|)
    (RETURN
     (PROGN
      (SETQ |path| (|pathname| |args|))
      (COND
       ((NOT (EQL (FILE-KIND (|namestring| |args|)) 1))
        (|throwKeyedMsg| 'S2IL0003 (LIST (|namestring| |args|))))
       (#1='T
        (PROGN
         (SETQ |dir| (|fnameMake| "." (|pathnameName| |path|) "axldir"))
         (SETQ |isDir| (FILE-KIND (|namestring| |dir|)))
         (COND
          ((EQL |isDir| 0)
           (|throwKeyedMsg| 'S2IL0027
            (LIST (|namestring| |dir|) (|namestring| |args|))))
          (#1#
           (PROGN
            (COND
             ((NOT (EQL |isDir| 1))
              (SETQ |cmd| (STRCONC "mkdir " (|namestring| |dir|)))
              (SETQ |rc| (OBEY |cmd|))
              (COND
               ((NOT (EQL |rc| 0))
                (|throwKeyedMsg| 'S2IL0027
                 (LIST (|namestring| |dir|) (|namestring| |args|)))))))
            (SETQ |curDir| (GET-CURRENT-DIRECTORY))
            (|cd| (LIST (|namestring| |dir|)))
            (SETQ |cmd| (STRCONC "ar x " (|namestring| |path|)))
            (SETQ |rc| (OBEY |cmd|))
            (COND
             ((NOT (EQL |rc| 0))
              (PROGN
               (|cd| (LIST (|namestring| |curDir|)))
               (|throwKeyedMsg| 'S2IL0028
                (LIST (|namestring| |dir|) (|namestring| |args|)))))
             (#1#
              (PROGN
               (SETQ |asos| (DIRECTORY "*.ao"))
               (COND
                ((NULL |asos|)
                 (PROGN
                  (|cd| (LIST (|namestring| |curDir|)))
                  (|throwKeyedMsg| 'S2IL0029
                   (LIST (|namestring| |dir|) (|namestring| |args|)))))
                (#1#
                 (PROGN
                  ((LAMBDA (|bfVar#29| |aso|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#29|)
                            (PROGN (SETQ |aso| (CAR |bfVar#29|)) NIL))
                        (RETURN NIL))
                       (#1# (|compileAsharpCmd1| (LIST (|namestring| |aso|)))))
                      (SETQ |bfVar#29| (CDR |bfVar#29|))))
                   |asos| NIL)
                  (|cd| (LIST (|namestring| |curDir|)))
                  (|terminateSystemCommand|)
                  (|spadPrompt|)))))))))))))))))
 
; compileAsharpLispCmd args ==
;     -- Assume we entered from the "compiler" function, so args ~= nil
;     -- and is a file with file extension .lsp
; 
;     path := pathname args
;     not PROBE_-FILE path => throwKeyedMsg("S2IL0003",[namestring args])
; 
;     optList :=  '( _
;       quiet _
;       noquiet _
;       library _
;       nolibrary _
;         )
; 
;     beQuiet := false         -- be verbose here
;     doLibrary  := true       -- so a )library after compilation
; 
;     for opt in $options repeat
;         [optname,:optargs] := opt
;         fullopt := selectOptionLC(optname,optList,nil)
; 
;         fullopt = 'quiet     => beQuiet := true
;         fullopt = 'noquiet   => beQuiet := false
; 
;         fullopt = 'library   => doLibrary  := true
;         fullopt = 'nolibrary => doLibrary  := false
; 
;         throwKeyedMsg("S2IZ0036",[STRCONC('")",object2String optname)])
; 
;     lsp := fnameMake(pathnameDirectory path, pathnameName path, pathnameType path)
;     if fnameReadable?(lsp) then
;         if not beQuiet then sayKeyedMsg("S2IZ0089", [namestring lsp])
;         compileFileQuietly(lsp)
;     else
;         sayKeyedMsg("S2IL0003", [namestring lsp])
; 
;     if doLibrary then
;         -- do we need to worry about where the compilation output went?
;         if not beQuiet then sayKeyedMsg("S2IZ0090", [ pathnameName path ])
;         withAsharpCmd [ pathnameName path ]
;     else if not beQuiet then
;         sayKeyedMsg("S2IZ0084", nil)
;     terminateSystemCommand()
;     spadPrompt()
 
(DEFUN |compileAsharpLispCmd| (|args|)
  (PROG (|path| |optList| |beQuiet| |doLibrary| |optname| |optargs| |fullopt|
         |lsp|)
    (RETURN
     (PROGN
      (SETQ |path| (|pathname| |args|))
      (COND
       ((NULL (PROBE-FILE |path|))
        (|throwKeyedMsg| 'S2IL0003 (LIST (|namestring| |args|))))
       (#1='T
        (PROGN
         (SETQ |optList| '(|quiet| |noquiet| |library| |nolibrary|))
         (SETQ |beQuiet| NIL)
         (SETQ |doLibrary| T)
         ((LAMBDA (|bfVar#30| |opt|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#30|) (PROGN (SETQ |opt| (CAR |bfVar#30|)) NIL))
               (RETURN NIL))
              (#1#
               (PROGN
                (SETQ |optname| (CAR |opt|))
                (SETQ |optargs| (CDR |opt|))
                (SETQ |fullopt| (|selectOptionLC| |optname| |optList| NIL))
                (COND ((EQ |fullopt| '|quiet|) (SETQ |beQuiet| T))
                      ((EQ |fullopt| '|noquiet|) (SETQ |beQuiet| NIL))
                      ((EQ |fullopt| '|library|) (SETQ |doLibrary| T))
                      ((EQ |fullopt| '|nolibrary|) (SETQ |doLibrary| NIL))
                      (#1#
                       (|throwKeyedMsg| 'S2IZ0036
                        (LIST (STRCONC ")" (|object2String| |optname|)))))))))
             (SETQ |bfVar#30| (CDR |bfVar#30|))))
          |$options| NIL)
         (SETQ |lsp|
                 (|fnameMake| (|pathnameDirectory| |path|)
                  (|pathnameName| |path|) (|pathnameType| |path|)))
         (COND
          ((|fnameReadable?| |lsp|)
           (COND
            ((NULL |beQuiet|)
             (|sayKeyedMsg| 'S2IZ0089 (LIST (|namestring| |lsp|)))))
           (|compileFileQuietly| |lsp|))
          (#1# (|sayKeyedMsg| 'S2IL0003 (LIST (|namestring| |lsp|)))))
         (COND
          (|doLibrary|
           (COND
            ((NULL |beQuiet|)
             (|sayKeyedMsg| 'S2IZ0090 (LIST (|pathnameName| |path|)))))
           (|withAsharpCmd| (LIST (|pathnameName| |path|))))
          ((NULL |beQuiet|) (|sayKeyedMsg| 'S2IZ0084 NIL)))
         (|terminateSystemCommand|)
         (|spadPrompt|))))))))
 
; compileSpadLispCmd args ==
;     -- Assume we entered from the "compiler" function, so args ~= nil
;     -- and is a file with file extension .NRLIB
; 
;     libname := first args
;     basename := PATHNAME_-NAME(libname)
;     path := pathname fnameMake(libname, basename, '"lsp")
;     not PROBE_-FILE path => throwKeyedMsg("S2IL0003",[namestring args])
; 
;     optList :=  '( _
;       quiet _
;       noquiet _
;       library _
;       nolibrary _
;         )
; 
;     beQuiet := false         -- be verbose here
;     doLibrary  := true       -- so a )library after compilation
; 
;     for opt in $options repeat
;         [optname,:optargs] := opt
;         fullopt := selectOptionLC(optname,optList,nil)
; 
;         fullopt = 'quiet     => beQuiet := true
;         fullopt = 'noquiet   => beQuiet := false
; 
;         fullopt = 'library   => doLibrary  := true
;         fullopt = 'nolibrary => doLibrary  := false
; 
;         throwKeyedMsg("S2IZ0036",[STRCONC('")",object2String optname)])
; 
;     lsp := fnameMake(pathnameDirectory path, pathnameName path, pathnameType path)
;     if fnameReadable?(lsp) then
;         if not beQuiet then sayKeyedMsg("S2IZ0089", [namestring lsp])
;         --compileFileQuietly(lsp)
;         recompile_lib_file_if_necessary lsp
;     else
;         sayKeyedMsg("S2IL0003", [namestring lsp])
; 
;     if doLibrary then
;         -- do we need to worry about where the compilation output went?
;         if not beQuiet then sayKeyedMsg("S2IZ0090", [ pathnameName path ])
;         LOCALDATABASE([pathnameName(libname)], [])
;     else if not beQuiet then
;         sayKeyedMsg("S2IZ0084", nil)
;     terminateSystemCommand()
;     spadPrompt()
 
(DEFUN |compileSpadLispCmd| (|args|)
  (PROG (|libname| |basename| |path| |optList| |beQuiet| |doLibrary| |optname|
         |optargs| |fullopt| |lsp|)
    (RETURN
     (PROGN
      (SETQ |libname| (CAR |args|))
      (SETQ |basename| (PATHNAME-NAME |libname|))
      (SETQ |path| (|pathname| (|fnameMake| |libname| |basename| "lsp")))
      (COND
       ((NULL (PROBE-FILE |path|))
        (|throwKeyedMsg| 'S2IL0003 (LIST (|namestring| |args|))))
       (#1='T
        (PROGN
         (SETQ |optList| '(|quiet| |noquiet| |library| |nolibrary|))
         (SETQ |beQuiet| NIL)
         (SETQ |doLibrary| T)
         ((LAMBDA (|bfVar#31| |opt|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#31|) (PROGN (SETQ |opt| (CAR |bfVar#31|)) NIL))
               (RETURN NIL))
              (#1#
               (PROGN
                (SETQ |optname| (CAR |opt|))
                (SETQ |optargs| (CDR |opt|))
                (SETQ |fullopt| (|selectOptionLC| |optname| |optList| NIL))
                (COND ((EQ |fullopt| '|quiet|) (SETQ |beQuiet| T))
                      ((EQ |fullopt| '|noquiet|) (SETQ |beQuiet| NIL))
                      ((EQ |fullopt| '|library|) (SETQ |doLibrary| T))
                      ((EQ |fullopt| '|nolibrary|) (SETQ |doLibrary| NIL))
                      (#1#
                       (|throwKeyedMsg| 'S2IZ0036
                        (LIST (STRCONC ")" (|object2String| |optname|)))))))))
             (SETQ |bfVar#31| (CDR |bfVar#31|))))
          |$options| NIL)
         (SETQ |lsp|
                 (|fnameMake| (|pathnameDirectory| |path|)
                  (|pathnameName| |path|) (|pathnameType| |path|)))
         (COND
          ((|fnameReadable?| |lsp|)
           (COND
            ((NULL |beQuiet|)
             (|sayKeyedMsg| 'S2IZ0089 (LIST (|namestring| |lsp|)))))
           (|recompile_lib_file_if_necessary| |lsp|))
          (#1# (|sayKeyedMsg| 'S2IL0003 (LIST (|namestring| |lsp|)))))
         (COND
          (|doLibrary|
           (COND
            ((NULL |beQuiet|)
             (|sayKeyedMsg| 'S2IZ0090 (LIST (|pathnameName| |path|)))))
           (LOCALDATABASE (LIST (|pathnameName| |libname|)) NIL))
          ((NULL |beQuiet|) (|sayKeyedMsg| 'S2IZ0084 NIL)))
         (|terminateSystemCommand|)
         (|spadPrompt|))))))))
 
; withAsharpCmd args ==
;     $options: local := nil
;     LOCALDATABASE(args, $options)
 
(DEFUN |withAsharpCmd| (|args|)
  (PROG (|$options|)
    (DECLARE (SPECIAL |$options|))
    (RETURN (PROGN (SETQ |$options| NIL) (LOCALDATABASE |args| |$options|)))))
 
; summary l ==
;  OBEY STRCONC ('"cat ",getEnv('"AXIOM"),'"/lib/summary")
 
(DEFUN |summary| (|l|)
  (PROG () (RETURN (OBEY (STRCONC "cat " (|getEnv| "AXIOM") "/lib/summary")))))
 
; copyright () ==
;  OBEY STRCONC ('"cat ",getEnv('"AXIOM"),'"/lib/copyright")
 
(DEFUN |copyright| ()
  (PROG ()
    (RETURN (OBEY (STRCONC "cat " (|getEnv| "AXIOM") "/lib/copyright")))))
 
; credits() ==
;  for i in CREDITS repeat
;   PRINC(i)
;   TERPRI()
 
(DEFUN |credits| ()
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#32| |i|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#32|) (PROGN (SETQ |i| (CAR |bfVar#32|)) NIL))
           (RETURN NIL))
          ('T (PROGN (PRINC |i|) (TERPRI))))
         (SETQ |bfVar#32| (CDR |bfVar#32|))))
      CREDITS NIL))))
 
; display l == displaySpad2Cmd l
 
(DEFUN |display| (|l|) (PROG () (RETURN (|displaySpad2Cmd| |l|))))
 
; displaySpad2Cmd l ==
;   $e: local := $EmptyEnvironment
;   l is [opt,:vl] and opt ~= "?" =>
;     option := selectOptionLC(opt,$displayOptions,'optionError) =>
; 
;       -- the option may be given in the plural but the property in
;       -- the alist is sometimes singular
; 
;       option :=
;         option = 'all   =>
;             l := ['properties]
;             'properties
;         (option = 'modes) or (option = 'types) =>
;             l := ['type, :vl]
;             'type
;         option = 'values =>
;             l := ['value, :vl]
;             'value
;         option
; 
;       option = 'abbreviations =>
;         null vl => listConstructorAbbreviations()
;         for v in vl repeat
;           constructor := abbreviation?(opOf v) => abbQuery(constructor)
;           abbQuery(opOf v)
; 
;       option = 'operations =>     displayOperations vl
;       option = 'macros =>         displayMacros vl
;       option = 'names =>          displayWorkspaceNames()
;       displayProperties(option,l)
;   optList:= [:['%l,'"        ",x] for x in $displayOptions]
;   msg := [:bright '"  )display",'"keyword arguments are",
;     :bright optList,'%l,'"   or abbreviations thereof."]
;   sayMessage msg
 
(DEFUN |displaySpad2Cmd| (|l|)
  (PROG (|$e| |msg| |optList| |constructor| |option| |vl| |opt|)
    (DECLARE (SPECIAL |$e|))
    (RETURN
     (PROGN
      (SETQ |$e| |$EmptyEnvironment|)
      (COND
       ((AND (CONSP |l|)
             (PROGN (SETQ |opt| (CAR |l|)) (SETQ |vl| (CDR |l|)) #1='T)
             (NOT (EQ |opt| '?)))
        (COND
         ((SETQ |option|
                  (|selectOptionLC| |opt| |$displayOptions| '|optionError|))
          (IDENTITY
           (PROGN
            (SETQ |option|
                    (COND
                     ((EQ |option| '|all|)
                      (PROGN (SETQ |l| (LIST '|properties|)) '|properties|))
                     ((OR (EQ |option| '|modes|) (EQ |option| '|types|))
                      (PROGN (SETQ |l| (CONS '|type| |vl|)) '|type|))
                     ((EQ |option| '|values|)
                      (PROGN (SETQ |l| (CONS '|value| |vl|)) '|value|))
                     (#1# |option|)))
            (COND
             ((EQ |option| '|abbreviations|)
              (COND ((NULL |vl|) (|listConstructorAbbreviations|))
                    (#1#
                     ((LAMBDA (|bfVar#33| |v|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#33|)
                               (PROGN (SETQ |v| (CAR |bfVar#33|)) NIL))
                           (RETURN NIL))
                          (#1#
                           (COND
                            ((SETQ |constructor|
                                     (|abbreviation?| (|opOf| |v|)))
                             (|abbQuery| |constructor|))
                            (#1# (|abbQuery| (|opOf| |v|))))))
                         (SETQ |bfVar#33| (CDR |bfVar#33|))))
                      |vl| NIL))))
             ((EQ |option| '|operations|) (|displayOperations| |vl|))
             ((EQ |option| '|macros|) (|displayMacros| |vl|))
             ((EQ |option| '|names|) (|displayWorkspaceNames|))
             (#1# (|displayProperties| |option| |l|))))))))
       (#1#
        (PROGN
         (SETQ |optList|
                 ((LAMBDA (|bfVar#35| |bfVar#34| |x|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#34|)
                           (PROGN (SETQ |x| (CAR |bfVar#34|)) NIL))
                       (RETURN (NREVERSE |bfVar#35|)))
                      (#1#
                       (SETQ |bfVar#35|
                               (APPEND (REVERSE (LIST '|%l| "        " |x|))
                                       |bfVar#35|))))
                     (SETQ |bfVar#34| (CDR |bfVar#34|))))
                  NIL |$displayOptions| NIL))
         (SETQ |msg|
                 (APPEND (|bright| "  )display")
                         (CONS "keyword arguments are"
                               (APPEND (|bright| |optList|)
                                       (CONS '|%l|
                                             (CONS
                                              "   or abbreviations thereof."
                                              NIL))))))
         (|sayMessage| |msg|))))))))
 
; displayMacros names ==
;   imacs := getInterpMacroNames()
;   pmacs := getParserMacroNames()
;   macros :=
;      null names => APPEND (imacs, pmacs)
;      names
;   macros := REMDUP macros
; 
;   null macros => sayBrightly '"   There are no FriCAS macros."
; 
;   -- first do user defined ones
; 
;   first := true
;   for macro in macros repeat
;     macro in pmacs =>
;         if first then
;             sayBrightly ['%l,'"User-defined macros:"]
;             first := NIL
;         displayParserMacro macro
;     macro in imacs => 'iterate
;     sayBrightly (["   ",'%b, macro, '%d, " is not a known FriCAS macro."])
; 
;   -- now system ones
; 
;   first := true
;   for macro in macros repeat
;     macro in imacs =>
;         macro in pmacs => 'iterate
;         if first then
;             sayBrightly ['%l,'"System-defined macros:"]
;             first := NIL
;         displayMacro macro
;     macro in pmacs => 'iterate
;   NIL
 
(DEFUN |displayMacros| (|names|)
  (PROG (|imacs| |pmacs| |macros| CAR)
    (RETURN
     (PROGN
      (SETQ |imacs| (|getInterpMacroNames|))
      (SETQ |pmacs| (|getParserMacroNames|))
      (SETQ |macros|
              (COND ((NULL |names|) (APPEND |imacs| |pmacs|)) (#1='T |names|)))
      (SETQ |macros| (REMDUP |macros|))
      (COND ((NULL |macros|) (|sayBrightly| "   There are no FriCAS macros."))
            (#1#
             (PROGN
              (SETQ CAR T)
              ((LAMBDA (|bfVar#36| |macro|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#36|)
                        (PROGN (SETQ |macro| (CAR |bfVar#36|)) NIL))
                    (RETURN NIL))
                   (#1#
                    (COND
                     ((|member| |macro| |pmacs|)
                      (PROGN
                       (COND
                        (CAR
                         (|sayBrightly| (LIST '|%l| "User-defined macros:"))
                         (SETQ CAR NIL)))
                       (|displayParserMacro| |macro|)))
                     ((|member| |macro| |imacs|) '|iterate|)
                     (#1#
                      (|sayBrightly|
                       (LIST '|   | '|%b| |macro| '|%d|
                             '| is not a known FriCAS macro.|))))))
                  (SETQ |bfVar#36| (CDR |bfVar#36|))))
               |macros| NIL)
              (SETQ CAR T)
              ((LAMBDA (|bfVar#37| |macro|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#37|)
                        (PROGN (SETQ |macro| (CAR |bfVar#37|)) NIL))
                    (RETURN NIL))
                   (#1#
                    (COND
                     ((|member| |macro| |imacs|)
                      (COND ((|member| |macro| |pmacs|) '|iterate|)
                            (#1#
                             (PROGN
                              (COND
                               (CAR
                                (|sayBrightly|
                                 (LIST '|%l| "System-defined macros:"))
                                (SETQ CAR NIL)))
                              (|displayMacro| |macro|)))))
                     ((|member| |macro| |pmacs|) '|iterate|))))
                  (SETQ |bfVar#37| (CDR |bfVar#37|))))
               |macros| NIL)
              NIL)))))))
 
; getParserMacroNames() ==
;   REMDUP [first mac for mac in getParserMacros()]
 
(DEFUN |getParserMacroNames| ()
  (PROG ()
    (RETURN
     (REMDUP
      ((LAMBDA (|bfVar#39| |bfVar#38| |mac|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#38|) (PROGN (SETQ |mac| (CAR |bfVar#38|)) NIL))
            (RETURN (NREVERSE |bfVar#39|)))
           ('T (SETQ |bfVar#39| (CONS (CAR |mac|) |bfVar#39|))))
          (SETQ |bfVar#38| (CDR |bfVar#38|))))
       NIL (|getParserMacros|) NIL)))))
 
; clearParserMacro(macro) ==
;   -- first see if it is one
;   not IFCDR assoc(macro, ($pfMacros)) => NIL
;   $pfMacros := REMALIST($pfMacros, macro)
 
(DEFUN |clearParserMacro| (|macro|)
  (PROG ()
    (RETURN
     (COND ((NULL (IFCDR (|assoc| |macro| |$pfMacros|))) NIL)
           ('T (SETQ |$pfMacros| (REMALIST |$pfMacros| |macro|)))))))
 
; displayMacro name ==
;   m := isInterpMacro name
;   null m =>
;     sayBrightly ['"  ",:bright name,'"is not an interpreter macro."]
;   -- $op is needed in the output routines.
;   $op : local := STRCONC('"macro ",object2String name)
;   [args,:body] := m
;   args :=
;     null args => nil
;     null rest args => first args
;     ['Tuple,:args]
;   mathprint ['SPADMAP, [args, :body]]
 
(DEFUN |displayMacro| (|name|)
  (PROG (|$op| |body| |args| |m|)
    (DECLARE (SPECIAL |$op|))
    (RETURN
     (PROGN
      (SETQ |m| (|isInterpMacro| |name|))
      (COND
       ((NULL |m|)
        (|sayBrightly|
         (CONS "  "
               (APPEND (|bright| |name|)
                       (CONS "is not an interpreter macro." NIL)))))
       (#1='T
        (PROGN
         (SETQ |$op| (STRCONC "macro " (|object2String| |name|)))
         (SETQ |args| (CAR |m|))
         (SETQ |body| (CDR |m|))
         (SETQ |args|
                 (COND ((NULL |args|) NIL) ((NULL (CDR |args|)) (CAR |args|))
                       (#1# (CONS '|Tuple| |args|))))
         (|mathprint| (LIST 'SPADMAP (CONS |args| |body|))))))))))
 
; displayWorkspaceNames() ==
;   imacs := getInterpMacroNames()
;   pmacs := getParserMacroNames()
;   sayMessage '"Names of User-Defined Objects in the Workspace:"
;   names := MSORT append(getWorkspaceNames(),pmacs)
;   if null names
;     then sayBrightly "   * None *"
;     else sayAsManyPerLineAsPossible [object2String x for x in names]
;   imacs := SETDIFFERENCE(imacs,pmacs)
;   if imacs then
;     sayMessage '"Names of System-Defined Objects in the Workspace:"
;     sayAsManyPerLineAsPossible [object2String x for x in imacs]
 
(DEFUN |displayWorkspaceNames| ()
  (PROG (|names| |pmacs| |imacs|)
    (RETURN
     (PROGN
      (SETQ |imacs| (|getInterpMacroNames|))
      (SETQ |pmacs| (|getParserMacroNames|))
      (|sayMessage| "Names of User-Defined Objects in the Workspace:")
      (SETQ |names| (MSORT (APPEND (|getWorkspaceNames|) |pmacs|)))
      (COND ((NULL |names|) (|sayBrightly| '|   * None *|))
            (#1='T
             (|sayAsManyPerLineAsPossible|
              ((LAMBDA (|bfVar#41| |bfVar#40| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#40|)
                        (PROGN (SETQ |x| (CAR |bfVar#40|)) NIL))
                    (RETURN (NREVERSE |bfVar#41|)))
                   (#1#
                    (SETQ |bfVar#41| (CONS (|object2String| |x|) |bfVar#41|))))
                  (SETQ |bfVar#40| (CDR |bfVar#40|))))
               NIL |names| NIL))))
      (SETQ |imacs| (SETDIFFERENCE |imacs| |pmacs|))
      (COND
       (|imacs|
        (|sayMessage| "Names of System-Defined Objects in the Workspace:")
        (|sayAsManyPerLineAsPossible|
         ((LAMBDA (|bfVar#43| |bfVar#42| |x|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#42|) (PROGN (SETQ |x| (CAR |bfVar#42|)) NIL))
               (RETURN (NREVERSE |bfVar#43|)))
              (#1# (SETQ |bfVar#43| (CONS (|object2String| |x|) |bfVar#43|))))
             (SETQ |bfVar#42| (CDR |bfVar#42|))))
          NIL |imacs| NIL))))))))
 
; getWorkspaceNames() ==
;   NMSORT [n for [n,:.] in CAAR $InteractiveFrame |
;     (n ~= "--macros--" and n~= "--flags--")]
 
(DEFUN |getWorkspaceNames| ()
  (PROG (|n|)
    (RETURN
     (NMSORT
      ((LAMBDA (|bfVar#46| |bfVar#45| |bfVar#44|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#45|)
                (PROGN (SETQ |bfVar#44| (CAR |bfVar#45|)) NIL))
            (RETURN (NREVERSE |bfVar#46|)))
           (#1='T
            (AND (CONSP |bfVar#44|) (PROGN (SETQ |n| (CAR |bfVar#44|)) #1#)
                 (NOT (EQ |n| '|--macros--|)) (NOT (EQ |n| '|--flags--|))
                 (SETQ |bfVar#46| (CONS |n| |bfVar#46|)))))
          (SETQ |bfVar#45| (CDR |bfVar#45|))))
       NIL (CAAR |$InteractiveFrame|) NIL)))))
 
; displayOperations l ==
;   null l =>
;     x := UPCASE queryUserKeyedMsg("S2IZ0058",NIL)
;     if MEMQ(STRING2ID_-N(x,1),'(Y YES))
;       then for op in allOperations() repeat reportOpSymbol op
;       else sayKeyedMsg("S2IZ0059",NIL)
;     nil
;   for op in l repeat reportOpSymbol op
 
(DEFUN |displayOperations| (|l|)
  (PROG (|x|)
    (RETURN
     (COND
      ((NULL |l|)
       (PROGN
        (SETQ |x| (UPCASE (|queryUserKeyedMsg| 'S2IZ0058 NIL)))
        (COND
         ((MEMQ (STRING2ID-N |x| 1) '(Y YES))
          ((LAMBDA (|bfVar#47| |op|)
             (LOOP
              (COND
               ((OR (ATOM |bfVar#47|) (PROGN (SETQ |op| (CAR |bfVar#47|)) NIL))
                (RETURN NIL))
               (#1='T (|reportOpSymbol| |op|)))
              (SETQ |bfVar#47| (CDR |bfVar#47|))))
           (|allOperations|) NIL))
         (#1# (|sayKeyedMsg| 'S2IZ0059 NIL)))
        NIL))
      (#1#
       ((LAMBDA (|bfVar#48| |op|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#48|) (PROGN (SETQ |op| (CAR |bfVar#48|)) NIL))
             (RETURN NIL))
            (#1# (|reportOpSymbol| |op|)))
           (SETQ |bfVar#48| (CDR |bfVar#48|))))
        |l| NIL))))))
 
; interpFunctionDepAlists() ==
;   $e : local := $InteractiveFrame
;   deps := getFlag "$dependencies"
;   $dependentAlist := [[NIL,:NIL]]
;   $dependeeAlist := [[NIL,:NIL]]
;   for [dependee,dependent] in deps repeat
;     $dependentAlist := PUTALIST($dependentAlist,dependee,
;       CONS(dependent,GETALIST($dependentAlist,dependee)))
;     $dependeeAlist  := PUTALIST($dependeeAlist,dependent,
;       CONS(dependee,GETALIST($dependeeAlist,dependent)))
 
(DEFUN |interpFunctionDepAlists| ()
  (PROG (|$e| |deps| |dependee| |ISTMP#1| |dependent|)
    (DECLARE (SPECIAL |$e|))
    (RETURN
     (PROGN
      (SETQ |$e| |$InteractiveFrame|)
      (SETQ |deps| (|getFlag| '|$dependencies|))
      (SETQ |$dependentAlist| (LIST (CONS NIL NIL)))
      (SETQ |$dependeeAlist| (LIST (CONS NIL NIL)))
      ((LAMBDA (|bfVar#50| |bfVar#49|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#50|)
                (PROGN (SETQ |bfVar#49| (CAR |bfVar#50|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#49|)
                 (PROGN
                  (SETQ |dependee| (CAR |bfVar#49|))
                  (SETQ |ISTMP#1| (CDR |bfVar#49|))
                  (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                       (PROGN (SETQ |dependent| (CAR |ISTMP#1|)) #1#)))
                 (PROGN
                  (SETQ |$dependentAlist|
                          (PUTALIST |$dependentAlist| |dependee|
                           (CONS |dependent|
                                 (GETALIST |$dependentAlist| |dependee|))))
                  (SETQ |$dependeeAlist|
                          (PUTALIST |$dependeeAlist| |dependent|
                           (CONS |dependee|
                                 (GETALIST |$dependeeAlist| |dependent|))))))))
          (SETQ |bfVar#50| (CDR |bfVar#50|))))
       |deps| NIL)))))
 
; fixObjectForPrinting(v) ==
;     v' := object2Identifier v
;     EQ(v',"%") => '"\%"
;     v' in $msgdbPrims => STRCONC('"\",PNAME v')
;     v
 
(DEFUN |fixObjectForPrinting| (|v|)
  (PROG (|v'|)
    (RETURN
     (PROGN
      (SETQ |v'| (|object2Identifier| |v|))
      (COND ((EQ |v'| '%) "\\%")
            ((|member| |v'| |$msgdbPrims|) (STRCONC "\\" (PNAME |v'|)))
            ('T |v|))))))
 
; displayProperties(option,l) ==
;   $dependentAlist : local := nil
;   $dependeeAlist  : local := nil
;   [opt,:vl]:= (l or ['properties])
;   imacs := getInterpMacroNames()
;   pmacs := getParserMacroNames()
;   macros := REMDUP append(imacs, pmacs)
;   if vl is ['all] or null vl then
;     vl := MSORT append(getWorkspaceNames(),macros)
;   if $frameMessages then sayKeyedMsg("S2IZ0065",[$interpreterFrameName])
;   null vl =>
;     null $frameMessages => sayKeyedMsg("S2IZ0066",NIL)
;     sayKeyedMsg("S2IZ0067",[$interpreterFrameName])
;   interpFunctionDepAlists()
;   for v in vl repeat
;     isInternalMapName(v) => 'iterate
;     pl := getIProplist(v)
;     option = 'flags =>     getAndSay(v,"flags")
;     option = 'value =>     displayValue(v,getI(v,'value),nil)
;     option = 'condition => displayCondition(v,getI(v,"condition"),nil)
;     option = 'mode =>      displayMode(v,getI(v,'mode),nil)
;     option = 'type =>      displayType(v,getI(v,'value),nil)
;     option = 'properties =>
;       v = "--flags--" => nil
;       pl is [['cacheInfo,:.],:.] => nil
;       v1 := fixObjectForPrinting(v)
;       sayMSG ['"Properties of",:bright prefix2String v1,'":"]
;       null pl =>
;         v in pmacs =>
;             sayMSG '"   This is a user-defined macro."
;             displayParserMacro v
;         isInterpMacro v =>
;             sayMSG '"   This is a system-defined macro."
;             displayMacro v
;         sayMSG '"   none"
;       propsSeen:= nil
;       for [prop,:val] in pl | not MEMQ(prop,propsSeen) and val repeat
;         prop in '(alias generatedCode mapBody localVars) =>
;           nil
;         prop = 'condition =>
;           displayCondition(prop,val,true)
;         prop = 'recursive =>
;           sayMSG '"   This is recursive."
;         prop = 'isInterpreterFunction =>
;           sayMSG '"   This is an interpreter function."
;           sayFunctionDeps v where
;             sayFunctionDeps x ==
;               if dependents := GETALIST($dependentAlist,x) then
;                 null rest dependents =>
;                   sayMSG ['"   The following function or rule ",
;                     '"depends on this:",:bright first dependents]
;                 sayMSG
;                   '"   The following functions or rules depend on this:"
;                 msg := ["%b",'"     "]
;                 for y in dependents repeat msg := ['" ",y,:msg]
;                 sayMSG [:nreverse msg,"%d"]
;               if dependees := GETALIST($dependeeAlist,x) then
;                 null rest dependees =>
;                   sayMSG ['"   This depends on the following function ",
;                     '"or rule:",:bright first dependees]
;                 sayMSG
;                   '"   This depends on the following functions or rules:"
;                 msg := ["%b",'"     "]
;                 for y in dependees repeat msg := ['" ",y,:msg]
;                 sayMSG [:nreverse msg,"%d"]
;         prop = 'isInterpreterRule =>
;           sayMSG '"   This is an interpreter rule."
;           sayFunctionDeps v
;         prop = 'localModemap =>
;           displayModemap(v,val,true)
;         prop = 'mode =>
;           displayMode(prop,val,true)
;         prop = 'value =>
;           val => displayValue(v,val,true)
;         sayMSG ['"   ",prop,'":  ",val]
;         propsSeen:= [prop,:propsSeen]
;     sayKeyedMsg("S2IZ0068",[option])
;   terminateSystemCommand()
 
(DEFUN |displayProperties| (|option| |l|)
  (PROG (|$dependeeAlist| |$dependentAlist| |val| |prop| |propsSeen| |v1|
         |ISTMP#1| |pl| |macros| |pmacs| |imacs| |vl| |opt| |LETTMP#1|)
    (DECLARE (SPECIAL |$dependeeAlist| |$dependentAlist|))
    (RETURN
     (PROGN
      (SETQ |$dependentAlist| NIL)
      (SETQ |$dependeeAlist| NIL)
      (SETQ |LETTMP#1| (OR |l| (LIST '|properties|)))
      (SETQ |opt| (CAR |LETTMP#1|))
      (SETQ |vl| (CDR |LETTMP#1|))
      (SETQ |imacs| (|getInterpMacroNames|))
      (SETQ |pmacs| (|getParserMacroNames|))
      (SETQ |macros| (REMDUP (APPEND |imacs| |pmacs|)))
      (COND
       ((OR (AND (CONSP |vl|) (EQ (CDR |vl|) NIL) (EQ (CAR |vl|) '|all|))
            (NULL |vl|))
        (SETQ |vl| (MSORT (APPEND (|getWorkspaceNames|) |macros|)))))
      (COND
       (|$frameMessages|
        (|sayKeyedMsg| 'S2IZ0065 (LIST |$interpreterFrameName|))))
      (COND
       ((NULL |vl|)
        (COND ((NULL |$frameMessages|) (|sayKeyedMsg| 'S2IZ0066 NIL))
              (#1='T
               (|sayKeyedMsg| 'S2IZ0067 (LIST |$interpreterFrameName|)))))
       (#1#
        (PROGN
         (|interpFunctionDepAlists|)
         ((LAMBDA (|bfVar#51| |v|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#51|) (PROGN (SETQ |v| (CAR |bfVar#51|)) NIL))
               (RETURN NIL))
              (#1#
               (COND ((|isInternalMapName| |v|) '|iterate|)
                     (#1#
                      (PROGN
                       (SETQ |pl| (|getIProplist| |v|))
                       (COND
                        ((EQ |option| '|flags|) (|getAndSay| |v| '|flags|))
                        ((EQ |option| '|value|)
                         (|displayValue| |v| (|getI| |v| '|value|) NIL))
                        ((EQ |option| '|condition|)
                         (|displayCondition| |v| (|getI| |v| '|condition|)
                          NIL))
                        ((EQ |option| '|mode|)
                         (|displayMode| |v| (|getI| |v| '|mode|) NIL))
                        ((EQ |option| '|type|)
                         (|displayType| |v| (|getI| |v| '|value|) NIL))
                        ((EQ |option| '|properties|)
                         (COND ((EQ |v| '|--flags--|) NIL)
                               ((AND (CONSP |pl|)
                                     (PROGN
                                      (SETQ |ISTMP#1| (CAR |pl|))
                                      (AND (CONSP |ISTMP#1|)
                                           (EQ (CAR |ISTMP#1|) '|cacheInfo|))))
                                NIL)
                               (#1#
                                (PROGN
                                 (SETQ |v1| (|fixObjectForPrinting| |v|))
                                 (|sayMSG|
                                  (CONS "Properties of"
                                        (APPEND
                                         (|bright| (|prefix2String| |v1|))
                                         (CONS ":" NIL))))
                                 (COND
                                  ((NULL |pl|)
                                   (COND
                                    ((|member| |v| |pmacs|)
                                     (PROGN
                                      (|sayMSG|
                                       "   This is a user-defined macro.")
                                      (|displayParserMacro| |v|)))
                                    ((|isInterpMacro| |v|)
                                     (PROGN
                                      (|sayMSG|
                                       "   This is a system-defined macro.")
                                      (|displayMacro| |v|)))
                                    (#1# (|sayMSG| "   none"))))
                                  (#1#
                                   (PROGN
                                    (SETQ |propsSeen| NIL)
                                    ((LAMBDA (|bfVar#53| |bfVar#52|)
                                       (LOOP
                                        (COND
                                         ((OR (ATOM |bfVar#53|)
                                              (PROGN
                                               (SETQ |bfVar#52|
                                                       (CAR |bfVar#53|))
                                               NIL))
                                          (RETURN NIL))
                                         (#1#
                                          (AND (CONSP |bfVar#52|)
                                               (PROGN
                                                (SETQ |prop| (CAR |bfVar#52|))
                                                (SETQ |val| (CDR |bfVar#52|))
                                                #1#)
                                               (NULL (MEMQ |prop| |propsSeen|))
                                               |val|
                                               (COND
                                                ((|member| |prop|
                                                  '(|alias| |generatedCode|
                                                    |mapBody| |localVars|))
                                                 NIL)
                                                ((EQ |prop| '|condition|)
                                                 (|displayCondition| |prop|
                                                  |val| T))
                                                ((EQ |prop| '|recursive|)
                                                 (|sayMSG|
                                                  "   This is recursive."))
                                                ((EQ |prop|
                                                     '|isInterpreterFunction|)
                                                 (PROGN
                                                  (|sayMSG|
                                                   "   This is an interpreter function.")
                                                  (|displayProperties,sayFunctionDeps|
                                                   |v|)))
                                                ((EQ |prop|
                                                     '|isInterpreterRule|)
                                                 (PROGN
                                                  (|sayMSG|
                                                   "   This is an interpreter rule.")
                                                  (|sayFunctionDeps| |v|)))
                                                ((EQ |prop| '|localModemap|)
                                                 (|displayModemap| |v| |val|
                                                  T))
                                                ((EQ |prop| '|mode|)
                                                 (|displayMode| |prop| |val|
                                                  T))
                                                ((EQ |prop| '|value|)
                                                 (COND
                                                  (|val|
                                                   (IDENTITY
                                                    (|displayValue| |v| |val|
                                                     T)))))
                                                (#1#
                                                 (PROGN
                                                  (|sayMSG|
                                                   (LIST "   " |prop| ":  "
                                                         |val|))
                                                  (SETQ |propsSeen|
                                                          (CONS |prop|
                                                                |propsSeen|))))))))
                                        (SETQ |bfVar#53| (CDR |bfVar#53|))))
                                     |pl| NIL))))))))
                        (#1# (|sayKeyedMsg| 'S2IZ0068 (LIST |option|)))))))))
             (SETQ |bfVar#51| (CDR |bfVar#51|))))
          |vl| NIL)
         (|terminateSystemCommand|))))))))
(DEFUN |displayProperties,sayFunctionDeps| (|x|)
  (PROG (|dependents| |msg| |dependees|)
    (RETURN
     (PROGN
      (COND
       ((SETQ |dependents| (GETALIST |$dependentAlist| |x|))
        (COND
         ((NULL (CDR |dependents|))
          (|sayMSG|
           (CONS "   The following function or rule "
                 (CONS "depends on this:" (|bright| (CAR |dependents|))))))
         (#1='T
          (PROGN
           (|sayMSG| "   The following functions or rules depend on this:")
           (SETQ |msg| (LIST '|%b| "     "))
           ((LAMBDA (|bfVar#54| |y|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#54|) (PROGN (SETQ |y| (CAR |bfVar#54|)) NIL))
                 (RETURN NIL))
                (#1# (SETQ |msg| (CONS " " (CONS |y| |msg|)))))
               (SETQ |bfVar#54| (CDR |bfVar#54|))))
            |dependents| NIL)
           (|sayMSG| (APPEND (NREVERSE |msg|) (CONS '|%d| NIL))))))))
      (COND
       ((SETQ |dependees| (GETALIST |$dependeeAlist| |x|))
        (COND
         ((NULL (CDR |dependees|))
          (|sayMSG|
           (CONS "   This depends on the following function "
                 (CONS "or rule:" (|bright| (CAR |dependees|))))))
         (#1#
          (PROGN
           (|sayMSG| "   This depends on the following functions or rules:")
           (SETQ |msg| (LIST '|%b| "     "))
           ((LAMBDA (|bfVar#55| |y|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#55|) (PROGN (SETQ |y| (CAR |bfVar#55|)) NIL))
                 (RETURN NIL))
                (#1# (SETQ |msg| (CONS " " (CONS |y| |msg|)))))
               (SETQ |bfVar#55| (CDR |bfVar#55|))))
            |dependees| NIL)
           (|sayMSG| (APPEND (NREVERSE |msg|) (CONS '|%d| NIL))))))))))))
 
; displayModemap(v,val,giveVariableIfNil) ==
;   for mm in val repeat g(v,mm,giveVariableIfNil) where
;     g(v,mm,giveVariableIfNil) ==
;       [[local,:signature],fn,:.]:= mm
;       local='interpOnly => nil
;       varPart:= (giveVariableIfNil => nil; ['" of",:bright v])
;       prefix:= ["   Compiled function type",:varPart,": "]
;       sayBrightly concat(prefix,formatSignature signature)
 
(DEFUN |displayModemap| (|v| |val| |giveVariableIfNil|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#56| |mm|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#56|) (PROGN (SETQ |mm| (CAR |bfVar#56|)) NIL))
           (RETURN NIL))
          ('T (|displayModemap,g| |v| |mm| |giveVariableIfNil|)))
         (SETQ |bfVar#56| (CDR |bfVar#56|))))
      |val| NIL))))
(DEFUN |displayModemap,g| (|v| |mm| |giveVariableIfNil|)
  (PROG (|local| |signature| |fn| |varPart| |prefix|)
    (RETURN
     (PROGN
      (SETQ |local| (CAAR |mm|))
      (SETQ |signature| (CDAR |mm|))
      (SETQ |fn| (CADR |mm|))
      (COND ((EQ |local| '|interpOnly|) NIL)
            (#1='T
             (PROGN
              (SETQ |varPart|
                      (COND (|giveVariableIfNil| NIL)
                            (#1# (CONS " of" (|bright| |v|)))))
              (SETQ |prefix|
                      (CONS '|   Compiled function type|
                            (APPEND |varPart| (CONS '|: | NIL))))
              (|sayBrightly|
               (|concat| |prefix| (|formatSignature| |signature|))))))))))
 
; displayMode(v,mode,giveVariableIfNil) ==
;   null mode => nil
;   varPart:= (giveVariableIfNil => nil; [" of",:bright fixObjectForPrinting v])
;   sayBrightly concat("   Declared type or mode",
;     varPart,":   ",prefix2String mode)
 
(DEFUN |displayMode| (|v| |mode| |giveVariableIfNil|)
  (PROG (|varPart|)
    (RETURN
     (COND ((NULL |mode|) NIL)
           (#1='T
            (PROGN
             (SETQ |varPart|
                     (COND (|giveVariableIfNil| NIL)
                           (#1#
                            (CONS '| of|
                                  (|bright| (|fixObjectForPrinting| |v|))))))
             (|sayBrightly|
              (|concat| '|   Declared type or mode| |varPart| '|:   |
               (|prefix2String| |mode|)))))))))
 
; displayCondition(v,condition,giveVariableIfNil) ==
;   varPart:= (giveVariableIfNil => nil; [" of",:bright v])
;   condPart:= condition or 'true
;   sayBrightly concat("   condition",varPart,":  ",pred2English condPart)
 
(DEFUN |displayCondition| (|v| |condition| |giveVariableIfNil|)
  (PROG (|varPart| |condPart|)
    (RETURN
     (PROGN
      (SETQ |varPart|
              (COND (|giveVariableIfNil| NIL)
                    ('T (CONS '| of| (|bright| |v|)))))
      (SETQ |condPart| (OR |condition| '|true|))
      (|sayBrightly|
       (|concat| '|   condition| |varPart| '|:  |
        (|pred2English| |condPart|)))))))
 
; getAndSay(v,prop) ==
;   val:= getI(v,prop) => sayMSG ["    ",val,'%l]
;   sayMSG ["    none",'%l]
 
(DEFUN |getAndSay| (|v| |prop|)
  (PROG (|val|)
    (RETURN
     (COND
      ((SETQ |val| (|getI| |v| |prop|)) (|sayMSG| (LIST '|    | |val| '|%l|)))
      ('T (|sayMSG| (LIST '|    none| '|%l|)))))))
 
; displayType($op,u,omitVariableNameIfTrue) ==
;   null u =>
;     sayMSG ['"   Type of value of ",
;         fixObjectForPrinting PNAME $op,'":  (none)"]
;   type := prefix2String objMode(u)
;   if ATOM type then type := [type]
;   sayMSG concat ['"   Type of value of ",fixObjectForPrinting PNAME $op,'": ",:type]
;   NIL
 
(DEFUN |displayType| (|$op| |u| |omitVariableNameIfTrue|)
  (DECLARE (SPECIAL |$op|))
  (PROG (|type|)
    (RETURN
     (COND
      ((NULL |u|)
       (|sayMSG|
        (LIST "   Type of value of " (|fixObjectForPrinting| (PNAME |$op|))
              ":  (none)")))
      ('T
       (PROGN
        (SETQ |type| (|prefix2String| (|objMode| |u|)))
        (COND ((ATOM |type|) (SETQ |type| (LIST |type|))))
        (|sayMSG|
         (|concat|
          (CONS "   Type of value of "
                (CONS (|fixObjectForPrinting| (PNAME |$op|))
                      (CONS ": " |type|)))))
        NIL))))))
 
; displayValue($op,u,omitVariableNameIfTrue) ==
;   null u => sayMSG ["   Value of ",fixObjectForPrinting PNAME $op,'":  (none)"]
;   expr := objValUnwrap(u)
;   expr is [op, :.] and (op = 'SPADMAP) or objMode(u) = $EmptyMode =>
;     displayRule($op,expr)
;   label:=
;     omitVariableNameIfTrue =>
;         rhs := '"):  "
;         '"Value (has type "
;     rhs := '":  "
;     STRCONC('"Value of ", PNAME $op,'": ")
;   labmode := prefix2String objMode(u)
;   if ATOM labmode then labmode := [labmode]
;   GETDATABASE(expr,'CONSTRUCTORKIND) = 'domain =>
;     sayMSG concat('"   ",label,labmode,rhs,form2String expr)
;   mathprint ['CONCAT,label,:labmode,rhs,
;     outputFormat(expr,objMode(u))]
;   NIL
 
(DEFUN |displayValue| (|$op| |u| |omitVariableNameIfTrue|)
  (DECLARE (SPECIAL |$op|))
  (PROG (|expr| |op| |rhs| |label| |labmode|)
    (RETURN
     (COND
      ((NULL |u|)
       (|sayMSG|
        (LIST '|   Value of | (|fixObjectForPrinting| (PNAME |$op|))
              ":  (none)")))
      (#1='T
       (PROGN
        (SETQ |expr| (|objValUnwrap| |u|))
        (COND
         ((OR
           (AND (CONSP |expr|) (PROGN (SETQ |op| (CAR |expr|)) #1#)
                (EQ |op| 'SPADMAP))
           (EQUAL (|objMode| |u|) |$EmptyMode|))
          (|displayRule| |$op| |expr|))
         (#1#
          (PROGN
           (SETQ |label|
                   (COND
                    (|omitVariableNameIfTrue|
                     (PROGN (SETQ |rhs| "):  ") "Value (has type "))
                    (#1#
                     (PROGN
                      (SETQ |rhs| ":  ")
                      (STRCONC "Value of " (PNAME |$op|) ": ")))))
           (SETQ |labmode| (|prefix2String| (|objMode| |u|)))
           (COND ((ATOM |labmode|) (SETQ |labmode| (LIST |labmode|))))
           (COND
            ((EQ (GETDATABASE |expr| 'CONSTRUCTORKIND) '|domain|)
             (|sayMSG|
              (|concat| "   " |label| |labmode| |rhs| (|form2String| |expr|))))
            (#1#
             (PROGN
              (|mathprint|
               (CONS 'CONCAT
                     (CONS |label|
                           (APPEND |labmode|
                                   (CONS |rhs|
                                         (CONS
                                          (|outputFormat| |expr|
                                           (|objMode| |u|))
                                          NIL))))))
              NIL))))))))))))
 
; edit l == editSpad2Cmd l
 
(DEFUN |edit| (|l|) (PROG () (RETURN (|editSpad2Cmd| |l|))))
 
; editSpad2Cmd l ==
;   l:=
;     null l => $edit_file
;     first l
;   l := pathname l
;   oldDir := pathnameDirectory l
;   fileTypes :=
;     pathnameType l => [pathnameType l]
;     $UserLevel = 'interpreter => '("input" "INPUT" "spad" "SPAD")
;     $UserLevel = 'compiler    => '("input" "INPUT" "spad" "SPAD")
;     '("input" "INPUT" "spad" "SPAD" "boot" "BOOT" "lisp" "LISP")
;   ll :=
;        oldDir = '"" => pathname $FINDFILE (pathnameName l, fileTypes)
;        l
;   l := pathname ll
;   $edit_file := l
;   rc := editFile l
;   rc
 
(DEFUN |editSpad2Cmd| (|l|)
  (PROG (|oldDir| |fileTypes| |ll| |rc|)
    (RETURN
     (PROGN
      (SETQ |l| (COND ((NULL |l|) |$edit_file|) (#1='T (CAR |l|))))
      (SETQ |l| (|pathname| |l|))
      (SETQ |oldDir| (|pathnameDirectory| |l|))
      (SETQ |fileTypes|
              (COND ((|pathnameType| |l|) (LIST (|pathnameType| |l|)))
                    ((EQ |$UserLevel| '|interpreter|)
                     '("input" "INPUT" "spad" "SPAD"))
                    ((EQ |$UserLevel| '|compiler|)
                     '("input" "INPUT" "spad" "SPAD"))
                    (#1#
                     '("input" "INPUT" "spad" "SPAD" "boot" "BOOT" "lisp"
                       "LISP"))))
      (SETQ |ll|
              (COND
               ((EQUAL |oldDir| "")
                (|pathname| ($FINDFILE (|pathnameName| |l|) |fileTypes|)))
               (#1# |l|)))
      (SETQ |l| (|pathname| |ll|))
      (SETQ |$edit_file| |l|)
      (SETQ |rc| (|editFile| |l|))
      |rc|))))
 
; help l == helpSpad2Cmd l
 
(DEFUN |help| (|l|) (PROG () (RETURN (|helpSpad2Cmd| |l|))))
 
; helpSpad2Cmd args ==
;   -- try to use new stuff first
;   if newHelpSpad2Cmd(args) then return nil
; 
;   sayKeyedMsg("S2IZ0025",[args])
;   nil
 
(DEFUN |helpSpad2Cmd| (|args|)
  (PROG ()
    (RETURN
     (PROGN
      (COND ((|newHelpSpad2Cmd| |args|) (RETURN NIL)))
      (|sayKeyedMsg| 'S2IZ0025 (LIST |args|))
      NIL))))
 
; newHelpSpad2Cmd args ==
;   if null args then args := ["?"]
;   # args > 1 =>
;     sayKeyedMsg("S2IZ0026",NIL)
;     true
;   sarg := PNAME first args
;   if sarg = '"?" then args := ['help]
;   else if sarg = '"%" then args := ['history]
;        else if sarg = '"%%" then args := ['history]
;   arg := selectOptionLC(first args,$SYSCOMMANDS,nil)
;   if null arg then arg := first args
;   if arg = 'compiler then arg := 'compile
; 
;   -- see if new help file exists
; 
;   narg := PNAME arg
;   null(helpFile := make_input_filename([narg, 'HELPSPAD])) => nil
; 
;   $useFullScreenHelp =>
;     OBEY STRCONC('"$AXIOM/lib/SPADEDIT ",namestring helpFile)
;     true
; 
;   filestream := MAKE_-INSTREAM(helpFile)
;   repeat
;     line := read_-line(filestream,false)
;     NULL line =>
;       SHUT filestream
;       return true
;     SAY line
;   true
 
(DEFUN |newHelpSpad2Cmd| (|args|)
  (PROG (|sarg| |arg| |narg| |helpFile| |filestream| |line|)
    (RETURN
     (PROGN
      (COND ((NULL |args|) (SETQ |args| (LIST '?))))
      (COND ((< 1 (LENGTH |args|)) (PROGN (|sayKeyedMsg| 'S2IZ0026 NIL) T))
            (#1='T
             (PROGN
              (SETQ |sarg| (PNAME (CAR |args|)))
              (COND ((EQUAL |sarg| "?") (SETQ |args| (LIST '|help|)))
                    ((EQUAL |sarg| "%") (SETQ |args| (LIST '|history|)))
                    ((EQUAL |sarg| "%%") (SETQ |args| (LIST '|history|))))
              (SETQ |arg| (|selectOptionLC| (CAR |args|) $SYSCOMMANDS NIL))
              (COND ((NULL |arg|) (SETQ |arg| (CAR |args|))))
              (COND ((EQ |arg| '|compiler|) (SETQ |arg| '|compile|)))
              (SETQ |narg| (PNAME |arg|))
              (COND
               ((NULL
                 (SETQ |helpFile|
                         (|make_input_filename| (LIST |narg| 'HELPSPAD))))
                NIL)
               (|$useFullScreenHelp|
                (PROGN
                 (OBEY
                  (STRCONC "$AXIOM/lib/SPADEDIT " (|namestring| |helpFile|)))
                 T))
               (#1#
                (PROGN
                 (SETQ |filestream| (MAKE-INSTREAM |helpFile|))
                 ((LAMBDA ()
                    (LOOP
                     (COND (NIL (RETURN NIL))
                           (#1#
                            (PROGN
                             (SETQ |line| (|read-line| |filestream| NIL))
                             (COND
                              ((NULL |line|)
                               (PROGN (SHUT |filestream|) (RETURN T)))
                              (#1# (SAY |line|)))))))))
                 T))))))))))
 
; $frameRecord  := nil  --Initial setting for frame record
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$frameRecord| NIL))
 
; $previousBindings := nil
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$previousBindings| NIL))
 
; frame l == frameSpad2Cmd l
 
(DEFUN |frame| (|l|) (PROG () (RETURN (|frameSpad2Cmd| |l|))))
 
; frameName(frame) == first frame
 
(DEFUN |frameName| (|frame|) (PROG () (RETURN (CAR |frame|))))
 
; frameNames() == [frameName f for f in $interpreterFrameRing]
 
(DEFUN |frameNames| ()
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#58| |bfVar#57| |f|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#57|) (PROGN (SETQ |f| (CAR |bfVar#57|)) NIL))
           (RETURN (NREVERSE |bfVar#58|)))
          ('T (SETQ |bfVar#58| (CONS (|frameName| |f|) |bfVar#58|))))
         (SETQ |bfVar#57| (CDR |bfVar#57|))))
      NIL |$interpreterFrameRing| NIL))))
 
; frameEnvironment fname ==
;   -- extracts the environment portion of a frame
;   -- if fname is not a valid frame name then the empty environment
;   -- is returned
;   fname = frameName first $interpreterFrameRing => $InteractiveFrame
;   ifr := rest $interpreterFrameRing
;   e := LIST LIST NIL
;   while ifr repeat
;     [f,:ifr] := ifr
;     if fname = frameName f   then
;       e := CADR f
;       ifr := NIL
;   e
 
(DEFUN |frameEnvironment| (|fname|)
  (PROG (|ifr| |e| |LETTMP#1| |f|)
    (RETURN
     (COND
      ((EQUAL |fname| (|frameName| (CAR |$interpreterFrameRing|)))
       |$InteractiveFrame|)
      (#1='T
       (PROGN
        (SETQ |ifr| (CDR |$interpreterFrameRing|))
        (SETQ |e| (LIST (LIST NIL)))
        ((LAMBDA ()
           (LOOP
            (COND ((NOT |ifr|) (RETURN NIL))
                  (#1#
                   (PROGN
                    (SETQ |LETTMP#1| |ifr|)
                    (SETQ |f| (CAR |LETTMP#1|))
                    (SETQ |ifr| (CDR |LETTMP#1|))
                    (COND
                     ((EQUAL |fname| (|frameName| |f|)) (SETQ |e| (CADR |f|))
                      (SETQ |ifr| NIL)))))))))
        |e|))))))
 
; frameSpad2Cmd args ==
;   frameArgs := '(drop import last names new next)
;   $options => throwKeyedMsg("S2IZ0016",['")frame"])
;   null(args) => helpSpad2Cmd ['frame]
;   arg  := selectOptionLC(first args,frameArgs,'optionError)
;   args := rest args
;   if args is [a] then args := a
;   if ATOM args then args := object2Identifier args
;   arg = 'drop  =>
;     args and PAIRP(args) => throwKeyedMsg("S2IZ0017",[args])
;     closeInterpreterFrame(args)
;   arg = 'import =>  importFromFrame args
;   arg = 'last  =>   previousInterpreterFrame()
;   arg = 'names =>   displayFrameNames()
;   arg = 'new   =>
;     args and PAIRP(args) => throwKeyedMsg("S2IZ0017",[args])
;     addNewInterpreterFrame(args)
;   arg = 'next  =>   nextInterpreterFrame()
; 
;   NIL
 
(DEFUN |frameSpad2Cmd| (|args|)
  (PROG (|frameArgs| |arg| |a|)
    (RETURN
     (PROGN
      (SETQ |frameArgs| '(|drop| |import| |last| |names| |new| |next|))
      (COND (|$options| (|throwKeyedMsg| 'S2IZ0016 (LIST ")frame")))
            ((NULL |args|) (|helpSpad2Cmd| (LIST '|frame|)))
            (#1='T
             (PROGN
              (SETQ |arg|
                      (|selectOptionLC| (CAR |args|) |frameArgs|
                       '|optionError|))
              (SETQ |args| (CDR |args|))
              (COND
               ((AND (CONSP |args|) (EQ (CDR |args|) NIL)
                     (PROGN (SETQ |a| (CAR |args|)) #1#))
                (SETQ |args| |a|)))
              (COND ((ATOM |args|) (SETQ |args| (|object2Identifier| |args|))))
              (COND
               ((EQ |arg| '|drop|)
                (COND
                 ((AND |args| (CONSP |args|))
                  (|throwKeyedMsg| 'S2IZ0017 (LIST |args|)))
                 (#1# (|closeInterpreterFrame| |args|))))
               ((EQ |arg| '|import|) (|importFromFrame| |args|))
               ((EQ |arg| '|last|) (|previousInterpreterFrame|))
               ((EQ |arg| '|names|) (|displayFrameNames|))
               ((EQ |arg| '|new|)
                (COND
                 ((AND |args| (CONSP |args|))
                  (|throwKeyedMsg| 'S2IZ0017 (LIST |args|)))
                 (#1# (|addNewInterpreterFrame| |args|))))
               ((EQ |arg| '|next|) (|nextInterpreterFrame|)) (#1# NIL)))))))))
 
; addNewInterpreterFrame(name) ==
;   null name => throwKeyedMsg("S2IZ0018",NIL)
;   updateCurrentInterpreterFrame()
;   -- see if we already have one by that name
;   for f in $interpreterFrameRing repeat
;     name = frameName(f) => throwKeyedMsg("S2IZ0019",[name])
;   initHistList()
;   $interpreterFrameRing := CONS(emptyInterpreterFrame(name),
;     $interpreterFrameRing)
;   updateFromCurrentInterpreterFrame()
;   _$ERASE histFileName()
 
(DEFUN |addNewInterpreterFrame| (|name|)
  (PROG ()
    (RETURN
     (COND ((NULL |name|) (|throwKeyedMsg| 'S2IZ0018 NIL))
           (#1='T
            (PROGN
             (|updateCurrentInterpreterFrame|)
             ((LAMBDA (|bfVar#59| |f|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#59|)
                       (PROGN (SETQ |f| (CAR |bfVar#59|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (COND
                    ((EQUAL |name| (|frameName| |f|))
                     (IDENTITY (|throwKeyedMsg| 'S2IZ0019 (LIST |name|)))))))
                 (SETQ |bfVar#59| (CDR |bfVar#59|))))
              |$interpreterFrameRing| NIL)
             (|initHistList|)
             (SETQ |$interpreterFrameRing|
                     (CONS (|emptyInterpreterFrame| |name|)
                           |$interpreterFrameRing|))
             (|updateFromCurrentInterpreterFrame|)
             ($ERASE (|histFileName|))))))))
 
; emptyInterpreterFrame(name) ==
;   LIST(name,                            -- frame name
;        LIST LIST NIL,                   -- environment
;        1,                               -- $IOindex
;        $HiFiAccess,                     -- $HiFiAccess
;        $HistList,                       -- $HistList
;        $HistListLen,                    -- $HistListLen
;        $HistListAct,                    -- $HistListAct
;        $HistRecord,                     -- $HistRecord
;        NIL,                             -- $internalHistoryTable
;        COPY_-SEQ $localExposureDataDefault        -- $localExposureData
;       )
 
(DEFUN |emptyInterpreterFrame| (|name|)
  (PROG ()
    (RETURN
     (LIST |name| (LIST (LIST NIL)) 1 |$HiFiAccess| |$HistList| |$HistListLen|
           |$HistListAct| |$HistRecord| NIL
           (COPY-SEQ |$localExposureDataDefault|)))))
 
; closeInterpreterFrame(name) ==
;   -- if name = NIL then it means the current frame
;   null rest $interpreterFrameRing =>
;     name and (name ~= $interpreterFrameName) =>
;       throwKeyedMsg("S2IZ0020",[$interpreterFrameName])
;     throwKeyedMsg("S2IZ0021",NIL)
;   if null name then $interpreterFrameRing := rest $interpreterFrameRing
;   else   -- find the frame
;     found := nil
;     ifr := NIL
;     for f in $interpreterFrameRing repeat
;       found or (name ~= frameName(f)) => ifr := CONS(f,ifr)
;       found := true
;     not found => throwKeyedMsg("S2IZ0022",[name])
;     _$ERASE makeHistFileName(name)
;     $interpreterFrameRing := nreverse ifr
;   updateFromCurrentInterpreterFrame()
 
(DEFUN |closeInterpreterFrame| (|name|)
  (PROG (|found| |ifr|)
    (RETURN
     (COND
      ((NULL (CDR |$interpreterFrameRing|))
       (COND
        ((AND |name| (NOT (EQUAL |name| |$interpreterFrameName|)))
         (|throwKeyedMsg| 'S2IZ0020 (LIST |$interpreterFrameName|)))
        (#1='T (|throwKeyedMsg| 'S2IZ0021 NIL))))
      (#1#
       (PROGN
        (COND
         ((NULL |name|)
          (SETQ |$interpreterFrameRing| (CDR |$interpreterFrameRing|)))
         (#1# (SETQ |found| NIL) (SETQ |ifr| NIL)
          ((LAMBDA (|bfVar#60| |f|)
             (LOOP
              (COND
               ((OR (ATOM |bfVar#60|) (PROGN (SETQ |f| (CAR |bfVar#60|)) NIL))
                (RETURN NIL))
               (#1#
                (COND
                 ((OR |found| (NOT (EQUAL |name| (|frameName| |f|))))
                  (SETQ |ifr| (CONS |f| |ifr|)))
                 (#1# (SETQ |found| T)))))
              (SETQ |bfVar#60| (CDR |bfVar#60|))))
           |$interpreterFrameRing| NIL)
          (COND ((NULL |found|) (|throwKeyedMsg| 'S2IZ0022 (LIST |name|)))
                (#1#
                 (PROGN
                  ($ERASE (|makeHistFileName| |name|))
                  (SETQ |$interpreterFrameRing| (NREVERSE |ifr|)))))))
        (|updateFromCurrentInterpreterFrame|)))))))
 
; previousInterpreterFrame() ==
;   updateCurrentInterpreterFrame()
;   null rest $interpreterFrameRing => NIL  -- nothing to do
;   [:b,l] := $interpreterFrameRing
;   $interpreterFrameRing := NCONC2([l],b)
;   updateFromCurrentInterpreterFrame()
 
(DEFUN |previousInterpreterFrame| ()
  (PROG (|b| |l| |LETTMP#1|)
    (RETURN
     (PROGN
      (|updateCurrentInterpreterFrame|)
      (COND ((NULL (CDR |$interpreterFrameRing|)) NIL)
            ('T
             (PROGN
              (SETQ |LETTMP#1| (REVERSE |$interpreterFrameRing|))
              (SETQ |l| (CAR |LETTMP#1|))
              (SETQ |b| (NREVERSE (CDR |LETTMP#1|)))
              (SETQ |$interpreterFrameRing| (NCONC2 (LIST |l|) |b|))
              (|updateFromCurrentInterpreterFrame|))))))))
 
; nextInterpreterFrame() ==
;   updateCurrentInterpreterFrame()
;   null rest $interpreterFrameRing => NIL  -- nothing to do
;   $interpreterFrameRing :=
;     NCONC2(rest $interpreterFrameRing,[first $interpreterFrameRing])
;   updateFromCurrentInterpreterFrame()
 
(DEFUN |nextInterpreterFrame| ()
  (PROG ()
    (RETURN
     (PROGN
      (|updateCurrentInterpreterFrame|)
      (COND ((NULL (CDR |$interpreterFrameRing|)) NIL)
            ('T
             (PROGN
              (SETQ |$interpreterFrameRing|
                      (NCONC2 (CDR |$interpreterFrameRing|)
                       (LIST (CAR |$interpreterFrameRing|))))
              (|updateFromCurrentInterpreterFrame|))))))))
 
; createCurrentInterpreterFrame() ==
;   LIST($interpreterFrameName,           -- frame name
;        $InteractiveFrame,               -- environment
;        $IOindex,                        -- $IOindex
;        $HiFiAccess,                     -- $HiFiAccess
;        $HistList,                       -- $HistList
;        $HistListLen,                    -- $HistListLen
;        $HistListAct,                    -- $HistListAct
;        $HistRecord,                     -- $HistRecord
;        $internalHistoryTable,           -- $internalHistoryTable
;        $localExposureData               -- $localExposureData
;       )
 
(DEFUN |createCurrentInterpreterFrame| ()
  (PROG ()
    (RETURN
     (LIST |$interpreterFrameName| |$InteractiveFrame| |$IOindex| |$HiFiAccess|
           |$HistList| |$HistListLen| |$HistListAct| |$HistRecord|
           |$internalHistoryTable| |$localExposureData|))))
 
; updateFromCurrentInterpreterFrame() ==
;   [$interpreterFrameName,          _
;    $InteractiveFrame,              _
;    $IOindex,                       _
;    $HiFiAccess,                    _
;    $HistList,                      _
;    $HistListLen,                   _
;    $HistListAct,                   _
;    $HistRecord,                    _
;    $internalHistoryTable,          _
;    $localExposureData              _
;    ] := first $interpreterFrameRing
;   if $frameMessages then
;     sayMessage ['"   Current interpreter frame is called",:bright
;       $interpreterFrameName]
;   NIL
 
(DEFUN |updateFromCurrentInterpreterFrame| ()
  (PROG (|LETTMP#1|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (CAR |$interpreterFrameRing|))
      (SETQ |$interpreterFrameName| (CAR |LETTMP#1|))
      (SETQ |$InteractiveFrame| (CADR . #1=(|LETTMP#1|)))
      (SETQ |$IOindex| (CADDR . #1#))
      (SETQ |$HiFiAccess| (CADDDR . #1#))
      (SETQ |$HistList| (CAR #2=(CDDDDR . #1#)))
      (SETQ |$HistListLen| (CADR . #3=(#2#)))
      (SETQ |$HistListAct| (CADDR . #3#))
      (SETQ |$HistRecord| (CADDDR . #3#))
      (SETQ |$internalHistoryTable| (CAR #4=(CDDDDR . #3#)))
      (SETQ |$localExposureData| (CADR #4#))
      (COND
       (|$frameMessages|
        (|sayMessage|
         (CONS "   Current interpreter frame is called"
               (|bright| |$interpreterFrameName|)))))
      NIL))))
 
; updateCurrentInterpreterFrame() ==
;   RPLACA($interpreterFrameRing,createCurrentInterpreterFrame())
;   updateFromCurrentInterpreterFrame()
;   NIL
 
(DEFUN |updateCurrentInterpreterFrame| ()
  (PROG ()
    (RETURN
     (PROGN
      (RPLACA |$interpreterFrameRing| (|createCurrentInterpreterFrame|))
      (|updateFromCurrentInterpreterFrame|)
      NIL))))
 
; initializeInterpreterFrameRing() ==
;   $interpreterFrameName := 'initial
;   $interpreterFrameRing := [emptyInterpreterFrame($interpreterFrameName)]
;   updateFromCurrentInterpreterFrame()
;   NIL
 
(DEFUN |initializeInterpreterFrameRing| ()
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |$interpreterFrameName| '|initial|)
      (SETQ |$interpreterFrameRing|
              (LIST (|emptyInterpreterFrame| |$interpreterFrameName|)))
      (|updateFromCurrentInterpreterFrame|)
      NIL))))
 
; changeToNamedInterpreterFrame(name) ==
;   updateCurrentInterpreterFrame()
;   frame := findFrameInRing(name)
;   null frame => NIL
;   $interpreterFrameRing := [frame,:NREMOVE($interpreterFrameRing, frame)]
;   updateFromCurrentInterpreterFrame()
 
(DEFUN |changeToNamedInterpreterFrame| (|name|)
  (PROG (|frame|)
    (RETURN
     (PROGN
      (|updateCurrentInterpreterFrame|)
      (SETQ |frame| (|findFrameInRing| |name|))
      (COND ((NULL |frame|) NIL)
            ('T
             (PROGN
              (SETQ |$interpreterFrameRing|
                      (CONS |frame| (NREMOVE |$interpreterFrameRing| |frame|)))
              (|updateFromCurrentInterpreterFrame|))))))))
 
; makeInitialModemapFrame() == COPY $InitialModemapFrame
 
(DEFUN |makeInitialModemapFrame| ()
  (PROG () (RETURN (COPY |$InitialModemapFrame|))))
 
; findFrameInRing(name) ==
;   val := NIL
;   for frame in $interpreterFrameRing repeat
;     first frame = name =>
;       val := frame
;       return frame
;   val
 
(DEFUN |findFrameInRing| (|name|)
  (PROG (|val|)
    (RETURN
     (PROGN
      (SETQ |val| NIL)
      ((LAMBDA (|bfVar#61| |frame|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#61|) (PROGN (SETQ |frame| (CAR |bfVar#61|)) NIL))
            (RETURN NIL))
           ('T
            (COND
             ((EQUAL (CAR |frame|) |name|)
              (IDENTITY (PROGN (SETQ |val| |frame|) (RETURN |frame|)))))))
          (SETQ |bfVar#61| (CDR |bfVar#61|))))
       |$interpreterFrameRing| NIL)
      |val|))))
 
; displayFrameNames() ==
;   fs := "append"/[ ['%l,'"     ",:bright frameName f] for f in
;     $interpreterFrameRing]
;   sayKeyedMsg("S2IZ0024",[fs])
 
(DEFUN |displayFrameNames| ()
  (PROG (|fs|)
    (RETURN
     (PROGN
      (SETQ |fs|
              ((LAMBDA (|bfVar#63| |bfVar#62| |f|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#62|)
                        (PROGN (SETQ |f| (CAR |bfVar#62|)) NIL))
                    (RETURN |bfVar#63|))
                   ('T
                    (SETQ |bfVar#63|
                            (APPEND |bfVar#63|
                                    (CONS '|%l|
                                          (CONS "     "
                                                (|bright|
                                                 (|frameName| |f|))))))))
                  (SETQ |bfVar#62| (CDR |bfVar#62|))))
               NIL |$interpreterFrameRing| NIL))
      (|sayKeyedMsg| 'S2IZ0024 (LIST |fs|))))))
 
; importFromFrame args ==
;   -- args should have the form [frameName,:varNames]
;   if args and atom args then args := [args]
;   null args => throwKeyedMsg("S2IZ0073",NIL)
;   [fname,:args] := args
;   not member(fname,frameNames()) =>
;     throwKeyedMsg("S2IZ0074",[fname])
;   fname = frameName first $interpreterFrameRing =>
;     throwKeyedMsg("S2IZ0075",NIL)
;   fenv := frameEnvironment fname
;   null args =>
;     x := UPCASE queryUserKeyedMsg("S2IZ0076",[fname])
;     MEMQ(STRING2ID_-N(x,1),'(Y YES)) =>
;       vars := NIL
;       for [v,:props] in CAAR fenv repeat
;         v = "--macros" =>
;           for [m,:.] in props repeat vars := cons(m,vars)
;         vars := cons(v,vars)
;       importFromFrame [fname,:vars]
;     sayKeyedMsg("S2IZ0077",[fname])
;   for v in args repeat
;     plist := GETALIST(CAAR fenv,v)
;     plist =>
;       -- remove anything with the same name in the current frame
;       clearCmdParts ['propert,v]
;       for [prop,:val] in plist repeat
;         putHist(v,prop,val,$InteractiveFrame)
;     (m := get("--macros--",v,fenv)) =>
;       putHist("--macros--",v,m,$InteractiveFrame)
;     sayKeyedMsg("S2IZ0079",[v,fname])
;   sayKeyedMsg("S2IZ0078",[fname])
 
(DEFUN |importFromFrame| (|args|)
  (PROG (|LETTMP#1| |fname| |fenv| |x| |vars| |v| |props| |m| |plist| |prop|
         |val|)
    (RETURN
     (PROGN
      (COND ((AND |args| (ATOM |args|)) (SETQ |args| (LIST |args|))))
      (COND ((NULL |args|) (|throwKeyedMsg| 'S2IZ0073 NIL))
            (#1='T
             (PROGN
              (SETQ |LETTMP#1| |args|)
              (SETQ |fname| (CAR |LETTMP#1|))
              (SETQ |args| (CDR |LETTMP#1|))
              (COND
               ((NULL (|member| |fname| (|frameNames|)))
                (|throwKeyedMsg| 'S2IZ0074 (LIST |fname|)))
               ((EQUAL |fname| (|frameName| (CAR |$interpreterFrameRing|)))
                (|throwKeyedMsg| 'S2IZ0075 NIL))
               (#1#
                (PROGN
                 (SETQ |fenv| (|frameEnvironment| |fname|))
                 (COND
                  ((NULL |args|)
                   (PROGN
                    (SETQ |x|
                            (UPCASE
                             (|queryUserKeyedMsg| 'S2IZ0076 (LIST |fname|))))
                    (COND
                     ((MEMQ (STRING2ID-N |x| 1) '(Y YES))
                      (PROGN
                       (SETQ |vars| NIL)
                       ((LAMBDA (|bfVar#65| |bfVar#64|)
                          (LOOP
                           (COND
                            ((OR (ATOM |bfVar#65|)
                                 (PROGN
                                  (SETQ |bfVar#64| (CAR |bfVar#65|))
                                  NIL))
                             (RETURN NIL))
                            (#1#
                             (AND (CONSP |bfVar#64|)
                                  (PROGN
                                   (SETQ |v| (CAR |bfVar#64|))
                                   (SETQ |props| (CDR |bfVar#64|))
                                   #1#)
                                  (COND
                                   ((EQ |v| '|--macros|)
                                    ((LAMBDA (|bfVar#67| |bfVar#66|)
                                       (LOOP
                                        (COND
                                         ((OR (ATOM |bfVar#67|)
                                              (PROGN
                                               (SETQ |bfVar#66|
                                                       (CAR |bfVar#67|))
                                               NIL))
                                          (RETURN NIL))
                                         (#1#
                                          (AND (CONSP |bfVar#66|)
                                               (PROGN
                                                (SETQ |m| (CAR |bfVar#66|))
                                                #1#)
                                               (SETQ |vars|
                                                       (CONS |m| |vars|)))))
                                        (SETQ |bfVar#67| (CDR |bfVar#67|))))
                                     |props| NIL))
                                   (#1# (SETQ |vars| (CONS |v| |vars|)))))))
                           (SETQ |bfVar#65| (CDR |bfVar#65|))))
                        (CAAR |fenv|) NIL)
                       (|importFromFrame| (CONS |fname| |vars|))))
                     (#1# (|sayKeyedMsg| 'S2IZ0077 (LIST |fname|))))))
                  (#1#
                   (PROGN
                    ((LAMBDA (|bfVar#68| |v|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#68|)
                              (PROGN (SETQ |v| (CAR |bfVar#68|)) NIL))
                          (RETURN NIL))
                         (#1#
                          (PROGN
                           (SETQ |plist| (GETALIST (CAAR |fenv|) |v|))
                           (COND
                            (|plist|
                             (PROGN
                              (|clearCmdParts| (LIST '|propert| |v|))
                              ((LAMBDA (|bfVar#70| |bfVar#69|)
                                 (LOOP
                                  (COND
                                   ((OR (ATOM |bfVar#70|)
                                        (PROGN
                                         (SETQ |bfVar#69| (CAR |bfVar#70|))
                                         NIL))
                                    (RETURN NIL))
                                   (#1#
                                    (AND (CONSP |bfVar#69|)
                                         (PROGN
                                          (SETQ |prop| (CAR |bfVar#69|))
                                          (SETQ |val| (CDR |bfVar#69|))
                                          #1#)
                                         (|putHist| |v| |prop| |val|
                                          |$InteractiveFrame|))))
                                  (SETQ |bfVar#70| (CDR |bfVar#70|))))
                               |plist| NIL)))
                            ((SETQ |m| (|get| '|--macros--| |v| |fenv|))
                             (|putHist| '|--macros--| |v| |m|
                              |$InteractiveFrame|))
                            (#1#
                             (|sayKeyedMsg| 'S2IZ0079 (LIST |v| |fname|)))))))
                        (SETQ |bfVar#68| (CDR |bfVar#68|))))
                     |args| NIL)
                    (|sayKeyedMsg| 'S2IZ0078 (LIST |fname|)))))))))))))))
 
; DEFPARAMETER($historyFileType, 'axh)
 
(DEFPARAMETER |$historyFileType| '|axh|)
 
; DEFPARAMETER($oldHistoryFileName, 'last)
 
(DEFPARAMETER |$oldHistoryFileName| '|last|)
 
; DEFPARAMETER($internalHistoryTable, NIL)
 
(DEFPARAMETER |$internalHistoryTable| NIL)
 
; DEFPARAMETER($useInternalHistoryTable, true)
 
(DEFPARAMETER |$useInternalHistoryTable| T)
 
; history l ==
;   l or null $options => sayKeyedMsg("S2IH0006",NIL)
;   historySpad2Cmd()
 
(DEFUN |history| (|l|)
  (PROG ()
    (RETURN
     (COND ((OR |l| (NULL |$options|)) (|sayKeyedMsg| 'S2IH0006 NIL))
           ('T (|historySpad2Cmd|))))))
 
; makeHistFileName(fname) ==
;   makePathname(fname,$historyFileType)
 
(DEFUN |makeHistFileName| (|fname|)
  (PROG () (RETURN (|makePathname| |fname| |$historyFileType|))))
 
; oldHistFileName() ==
;   makeHistFileName($oldHistoryFileName)
 
(DEFUN |oldHistFileName| ()
  (PROG () (RETURN (|makeHistFileName| |$oldHistoryFileName|))))
 
; DEFPARAMETER($curHistFileName, nil)
 
(DEFPARAMETER |$curHistFileName| NIL)
 
; histFileName() ==
;   $curHistFileName => makeHistFileName($curHistFileName)
;   makeHistFileName($interpreterFrameName)
 
(DEFUN |histFileName| ()
  (PROG ()
    (RETURN
     (COND (|$curHistFileName| (|makeHistFileName| |$curHistFileName|))
           ('T (|makeHistFileName| |$interpreterFrameName|))))))
 
; histInputFileName(fn) ==
;   null fn =>
;     makePathname($interpreterFrameName,'INPUT)
;   makePathname(fn,'INPUT)
 
(DEFUN |histInputFileName| (|fn|)
  (PROG ()
    (RETURN
     (COND ((NULL |fn|) (|makePathname| |$interpreterFrameName| 'INPUT))
           ('T (|makePathname| |fn| 'INPUT))))))
 
; initHist() ==
;   $useInternalHistoryTable => initHistList()
;   oldFile := oldHistFileName()
;   newFile := histFileName()
;   -- see if history directory is writable
;   histFileErase oldFile
;   if make_input_filename(newFile) then $REPLACE(oldFile, newFile)
;   $HiFiAccess:= 'T
;   initHistList()
 
(DEFUN |initHist| ()
  (PROG (|newFile| |oldFile|)
    (RETURN
     (COND (|$useInternalHistoryTable| (|initHistList|))
           ('T
            (PROGN
             (SETQ |oldFile| (|oldHistFileName|))
             (SETQ |newFile| (|histFileName|))
             (|histFileErase| |oldFile|)
             (COND
              ((|make_input_filename| |newFile|)
               ($REPLACE |oldFile| |newFile|)))
             (SETQ |$HiFiAccess| 'T)
             (|initHistList|)))))))
 
; initHistList() ==
;   -- creates $HistList as a circular list of length $HistListLen
;   -- and $HistRecord
;   $HistListLen:= 20
;   $HistList:= LIST NIL
;   li:= $HistList
;   for i in 1..$HistListLen repeat li:= CONS(NIL,li)
;   RPLACD($HistList,li)
;   $HistListAct:= 0
;   $HistRecord:= NIL
 
(DEFUN |initHistList| ()
  (PROG (|li|)
    (RETURN
     (PROGN
      (SETQ |$HistListLen| 20)
      (SETQ |$HistList| (LIST NIL))
      (SETQ |li| |$HistList|)
      ((LAMBDA (|i|)
         (LOOP
          (COND ((> |i| |$HistListLen|) (RETURN NIL))
                ('T (SETQ |li| (CONS NIL |li|))))
          (SETQ |i| (+ |i| 1))))
       1)
      (RPLACD |$HistList| |li|)
      (SETQ |$HistListAct| 0)
      (SETQ |$HistRecord| NIL)))))
 
; historySpad2Cmd() ==
;   -- history is a system command which can call resetInCoreHist
;   -- and changeHistListLen, and restore last session
;   histOptions:=
;     '(on off yes no change reset restore write save show file memory)
;   opts:= [ [selectOptionLC(opt,histOptions,'optionError),:optargs]
;     for [opt,:optargs] in $options]
;   for [opt,:optargs] in opts repeat
;     opt in '(on yes) =>
;       $HiFiAccess => sayKeyedMsg("S2IH0007",NIL)
;       $IOindex = 1 =>       -- haven't done anything yet
;         $HiFiAccess:= 'T
;         initHistList()
;         sayKeyedMsg("S2IH0008",NIL)
;       x := UPCASE queryUserKeyedMsg("S2IH0009",NIL)
;       MEMQ(STRING2ID_-N(x,1),'(Y YES)) =>
;         histFileErase histFileName()
;         $HiFiAccess:= 'T
;         $options := nil
;         clearSpad2Cmd '(all)
;         sayKeyedMsg("S2IH0008",NIL)
;         initHistList()
;       sayKeyedMsg("S2IH0010",NIL)
;     opt in '(off no) =>
;       null $HiFiAccess => sayKeyedMsg("S2IH0011",NIL)
;       $HiFiAccess:= NIL
;       disableHist()
;       sayKeyedMsg("S2IH0012",NIL)
;     opt = 'file    => setHistoryCore NIL
;     opt = 'memory  => setHistoryCore true
;     opt = 'reset   => resetInCoreHist()
;     opt = 'save    => saveHistory optargs
;     opt = 'show    => showHistory optargs
;     opt = 'change  => changeHistListLen first optargs
;     opt = 'restore => restoreHistory optargs
;     opt = 'write   => writeInputLines(optargs,1)
;   'done
 
(DEFUN |historySpad2Cmd| ()
  (PROG (|x| |opts| |optargs| |opt| |histOptions|)
    (RETURN
     (PROGN
      (SETQ |histOptions|
              '(|on| |off| |yes| |no| |change| |reset| |restore| |write| |save|
                |show| |file| |memory|))
      (SETQ |opts|
              ((LAMBDA (|bfVar#73| |bfVar#72| |bfVar#71|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#72|)
                        (PROGN (SETQ |bfVar#71| (CAR |bfVar#72|)) NIL))
                    (RETURN (NREVERSE |bfVar#73|)))
                   (#1='T
                    (AND (CONSP |bfVar#71|)
                         (PROGN
                          (SETQ |opt| (CAR |bfVar#71|))
                          (SETQ |optargs| (CDR |bfVar#71|))
                          #1#)
                         (SETQ |bfVar#73|
                                 (CONS
                                  (CONS
                                   (|selectOptionLC| |opt| |histOptions|
                                    '|optionError|)
                                   |optargs|)
                                  |bfVar#73|)))))
                  (SETQ |bfVar#72| (CDR |bfVar#72|))))
               NIL |$options| NIL))
      ((LAMBDA (|bfVar#75| |bfVar#74|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#75|)
                (PROGN (SETQ |bfVar#74| (CAR |bfVar#75|)) NIL))
            (RETURN NIL))
           (#1#
            (AND (CONSP |bfVar#74|)
                 (PROGN
                  (SETQ |opt| (CAR |bfVar#74|))
                  (SETQ |optargs| (CDR |bfVar#74|))
                  #1#)
                 (COND
                  ((|member| |opt| '(|on| |yes|))
                   (COND (|$HiFiAccess| (|sayKeyedMsg| 'S2IH0007 NIL))
                         ((EQL |$IOindex| 1)
                          (PROGN
                           (SETQ |$HiFiAccess| 'T)
                           (|initHistList|)
                           (|sayKeyedMsg| 'S2IH0008 NIL)))
                         (#1#
                          (PROGN
                           (SETQ |x|
                                   (UPCASE
                                    (|queryUserKeyedMsg| 'S2IH0009 NIL)))
                           (COND
                            ((MEMQ (STRING2ID-N |x| 1) '(Y YES))
                             (PROGN
                              (|histFileErase| (|histFileName|))
                              (SETQ |$HiFiAccess| 'T)
                              (SETQ |$options| NIL)
                              (|clearSpad2Cmd| '(|all|))
                              (|sayKeyedMsg| 'S2IH0008 NIL)
                              (|initHistList|)))
                            (#1# (|sayKeyedMsg| 'S2IH0010 NIL)))))))
                  ((|member| |opt| '(|off| |no|))
                   (COND ((NULL |$HiFiAccess|) (|sayKeyedMsg| 'S2IH0011 NIL))
                         (#1#
                          (PROGN
                           (SETQ |$HiFiAccess| NIL)
                           (|disableHist|)
                           (|sayKeyedMsg| 'S2IH0012 NIL)))))
                  ((EQ |opt| '|file|) (|setHistoryCore| NIL))
                  ((EQ |opt| '|memory|) (|setHistoryCore| T))
                  ((EQ |opt| '|reset|) (|resetInCoreHist|))
                  ((EQ |opt| '|save|) (|saveHistory| |optargs|))
                  ((EQ |opt| '|show|) (|showHistory| |optargs|))
                  ((EQ |opt| '|change|) (|changeHistListLen| (CAR |optargs|)))
                  ((EQ |opt| '|restore|) (|restoreHistory| |optargs|))
                  ((EQ |opt| '|write|) (|writeInputLines| |optargs| 1))))))
          (SETQ |bfVar#75| (CDR |bfVar#75|))))
       |opts| NIL)
      '|done|))))
 
; setHistoryCore inCore ==
;   inCore = $useInternalHistoryTable =>
;     sayKeyedMsg((inCore => "S2IH0030"; "S2IH0029"),NIL)
;   not $HiFiAccess =>
;     $useInternalHistoryTable := inCore
;     inCore => sayKeyedMsg("S2IH0032",NIL)
;     sayKeyedMsg("S2IH0031",NIL)
;   inCore =>
;     $internalHistoryTable := NIL
;     if $IOindex ~= 0 then
;       -- actually put something in there
;       l := LENGTH RKEYIDS histFileName()
;       for i in 1..l repeat
;         vec:= UNWIND_-PROTECT(readHiFi(i),disableHist())
;         $internalHistoryTable := CONS([i,:vec],$internalHistoryTable)
;       histFileErase histFileName()
;     $useInternalHistoryTable := true
;     sayKeyedMsg("S2IH0032",NIL)
;   $HiFiAccess:= 'NIL
;   histFileErase histFileName()
;   str := rMkOstream(histFileName())
;   for [n,:rec] in reverse $internalHistoryTable repeat
;     SPADRWRITE(object2Identifier n,rec,str)
;   RSHUT str
;   $HiFiAccess:= 'T
;   $internalHistoryTable := NIL
;   $useInternalHistoryTable := NIL
;   sayKeyedMsg("S2IH0031",NIL)
 
(DEFUN |setHistoryCore| (|inCore|)
  (PROG (|l| |vec| |str| |n| |rec|)
    (RETURN
     (COND
      ((EQUAL |inCore| |$useInternalHistoryTable|)
       (|sayKeyedMsg| (COND (|inCore| 'S2IH0030) (#1='T 'S2IH0029)) NIL))
      ((NULL |$HiFiAccess|)
       (PROGN
        (SETQ |$useInternalHistoryTable| |inCore|)
        (COND (|inCore| (|sayKeyedMsg| 'S2IH0032 NIL))
              (#1# (|sayKeyedMsg| 'S2IH0031 NIL)))))
      (|inCore|
       (PROGN
        (SETQ |$internalHistoryTable| NIL)
        (COND
         ((NOT (EQL |$IOindex| 0))
          (SETQ |l| (LENGTH (RKEYIDS (|histFileName|))))
          ((LAMBDA (|i|)
             (LOOP
              (COND ((> |i| |l|) (RETURN NIL))
                    (#1#
                     (PROGN
                      (SETQ |vec|
                              (UNWIND-PROTECT (|readHiFi| |i|)
                                (|disableHist|)))
                      (SETQ |$internalHistoryTable|
                              (CONS (CONS |i| |vec|)
                                    |$internalHistoryTable|)))))
              (SETQ |i| (+ |i| 1))))
           1)
          (|histFileErase| (|histFileName|))))
        (SETQ |$useInternalHistoryTable| T)
        (|sayKeyedMsg| 'S2IH0032 NIL)))
      (#1#
       (PROGN
        (SETQ |$HiFiAccess| 'NIL)
        (|histFileErase| (|histFileName|))
        (SETQ |str| (|rMkOstream| (|histFileName|)))
        ((LAMBDA (|bfVar#77| |bfVar#76|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#77|)
                  (PROGN (SETQ |bfVar#76| (CAR |bfVar#77|)) NIL))
              (RETURN NIL))
             (#1#
              (AND (CONSP |bfVar#76|)
                   (PROGN
                    (SETQ |n| (CAR |bfVar#76|))
                    (SETQ |rec| (CDR |bfVar#76|))
                    #1#)
                   (SPADRWRITE (|object2Identifier| |n|) |rec| |str|))))
            (SETQ |bfVar#77| (CDR |bfVar#77|))))
         (REVERSE |$internalHistoryTable|) NIL)
        (RSHUT |str|)
        (SETQ |$HiFiAccess| 'T)
        (SETQ |$internalHistoryTable| NIL)
        (SETQ |$useInternalHistoryTable| NIL)
        (|sayKeyedMsg| 'S2IH0031 NIL)))))))
 
; writeInputLines(fn,initial) ==
;   -- writes all input lines into file histInputFileName()
;   not $HiFiAccess => sayKeyedMsg("S2IH0013",NIL) -- history not on
;   null fn =>
;     throwKeyedMsg("S2IH0038", nil)          -- missing file name
;   maxn := 72
;   breakChars := [" ","+"]
;   for i in initial..$IOindex - 1 repeat
;     vecl := first readHiFi i
;     if STRINGP vecl then vecl := [vecl]
;     for vec in vecl repeat
;       n := SIZE vec
;       while n > maxn repeat
;         -- search backwards for a blank
;         done := nil
;         for j in 1..maxn while not done repeat
;           k := 1 + maxn - j
;           MEMQ(vec.k,breakChars) =>
;             svec := STRCONC(SUBSTRING(vec,0,k+1),UNDERBAR)
;             lineList := [svec,:lineList]
;             done := true
;             vec := SUBSTRING(vec,k+1,NIL)
;             n := SIZE vec
;         -- in case we can't find a breaking point
;         if not done then n := 0
;       lineList := [vec,:lineList]
;   file := histInputFileName(fn)
;   DELETE_-FILE(file)
;   inp:= MAKE_-OUTSTREAM(file)
;   for x in removeUndoLines NREVERSE lineList repeat WRITE_-LINE(x,inp)
;   -- see file "undo" for definition of removeUndoLines
;   if fn ~= 'redo then sayKeyedMsg("S2IH0014",[namestring file])
;   SHUT inp
;   NIL
 
(DEFUN |writeInputLines| (|fn| |initial|)
  (PROG (|maxn| |breakChars| |vecl| |n| |done| |k| |svec| |lineList| |file|
         |inp|)
    (RETURN
     (COND ((NULL |$HiFiAccess|) (|sayKeyedMsg| 'S2IH0013 NIL))
           ((NULL |fn|) (|throwKeyedMsg| 'S2IH0038 NIL))
           (#1='T
            (PROGN
             (SETQ |maxn| 72)
             (SETQ |breakChars| (LIST '| | '+))
             ((LAMBDA (|bfVar#78| |i|)
                (LOOP
                 (COND ((> |i| |bfVar#78|) (RETURN NIL))
                       (#1#
                        (PROGN
                         (SETQ |vecl| (CAR (|readHiFi| |i|)))
                         (COND ((STRINGP |vecl|) (SETQ |vecl| (LIST |vecl|))))
                         ((LAMBDA (|bfVar#79| |vec|)
                            (LOOP
                             (COND
                              ((OR (ATOM |bfVar#79|)
                                   (PROGN (SETQ |vec| (CAR |bfVar#79|)) NIL))
                               (RETURN NIL))
                              (#1#
                               (PROGN
                                (SETQ |n| (SIZE |vec|))
                                ((LAMBDA ()
                                   (LOOP
                                    (COND ((NOT (< |maxn| |n|)) (RETURN NIL))
                                          (#1#
                                           (PROGN
                                            (SETQ |done| NIL)
                                            ((LAMBDA (|j|)
                                               (LOOP
                                                (COND
                                                 ((OR (> |j| |maxn|) |done|)
                                                  (RETURN NIL))
                                                 (#1#
                                                  (PROGN
                                                   (SETQ |k|
                                                           (- (+ 1 |maxn|)
                                                              |j|))
                                                   (COND
                                                    ((MEMQ (ELT |vec| |k|)
                                                           |breakChars|)
                                                     (PROGN
                                                      (SETQ |svec|
                                                              (STRCONC
                                                               (SUBSTRING |vec|
                                                                          0
                                                                          (+
                                                                           |k|
                                                                           1))
                                                               UNDERBAR))
                                                      (SETQ |lineList|
                                                              (CONS |svec|
                                                                    |lineList|))
                                                      (SETQ |done| T)
                                                      (SETQ |vec|
                                                              (SUBSTRING |vec|
                                                                         (+ |k|
                                                                            1)
                                                                         NIL))
                                                      (SETQ |n|
                                                              (SIZE
                                                               |vec|))))))))
                                                (SETQ |j| (+ |j| 1))))
                                             1)
                                            (COND
                                             ((NULL |done|)
                                              (SETQ |n| 0)))))))))
                                (SETQ |lineList| (CONS |vec| |lineList|)))))
                             (SETQ |bfVar#79| (CDR |bfVar#79|))))
                          |vecl| NIL))))
                 (SETQ |i| (+ |i| 1))))
              (- |$IOindex| 1) |initial|)
             (SETQ |file| (|histInputFileName| |fn|))
             (DELETE-FILE |file|)
             (SETQ |inp| (MAKE-OUTSTREAM |file|))
             ((LAMBDA (|bfVar#80| |x|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#80|)
                       (PROGN (SETQ |x| (CAR |bfVar#80|)) NIL))
                   (RETURN NIL))
                  (#1# (WRITE-LINE |x| |inp|)))
                 (SETQ |bfVar#80| (CDR |bfVar#80|))))
              (|removeUndoLines| (NREVERSE |lineList|)) NIL)
             (COND
              ((NOT (EQ |fn| '|redo|))
               (|sayKeyedMsg| 'S2IH0014 (LIST (|namestring| |file|)))))
             (SHUT |inp|)
             NIL))))))
 
; resetInCoreHist() ==
;   -- removes all pointers from $HistList
;   $HistListAct:= 0
;   for i in 1..$HistListLen repeat
;     $HistList := rest $HistList
;     RPLACA($HistList,NIL)
 
(DEFUN |resetInCoreHist| ()
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |$HistListAct| 0)
      ((LAMBDA (|i|)
         (LOOP
          (COND ((> |i| |$HistListLen|) (RETURN NIL))
                ('T
                 (PROGN
                  (SETQ |$HistList| (CDR |$HistList|))
                  (RPLACA |$HistList| NIL))))
          (SETQ |i| (+ |i| 1))))
       1)))))
 
; changeHistListLen(n) ==
;   -- changes the length of $HistList.  n must be nonnegative
;   NULL INTEGERP n => sayKeyedMsg("S2IH0015",[n])
;   dif:= n-$HistListLen
;   $HistListLen:= n
;   l := rest $HistList
;   if dif > 0 then
;     for i in 1..dif repeat l:= CONS(NIL,l)
;   if dif < 0 then
;     for i in 1..-dif repeat l := rest l
;     if $HistListAct > n then $HistListAct:= n
;   RPLACD($HistList,l)
;   'done
 
(DEFUN |changeHistListLen| (|n|)
  (PROG (|dif| |l|)
    (RETURN
     (COND ((NULL (INTEGERP |n|)) (|sayKeyedMsg| 'S2IH0015 (LIST |n|)))
           (#1='T
            (PROGN
             (SETQ |dif| (- |n| |$HistListLen|))
             (SETQ |$HistListLen| |n|)
             (SETQ |l| (CDR |$HistList|))
             (COND
              ((< 0 |dif|)
               ((LAMBDA (|i|)
                  (LOOP
                   (COND ((> |i| |dif|) (RETURN NIL))
                         (#1# (SETQ |l| (CONS NIL |l|))))
                   (SETQ |i| (+ |i| 1))))
                1)))
             (COND
              ((MINUSP |dif|)
               ((LAMBDA (|bfVar#81| |i|)
                  (LOOP
                   (COND ((> |i| |bfVar#81|) (RETURN NIL))
                         (#1# (SETQ |l| (CDR |l|))))
                   (SETQ |i| (+ |i| 1))))
                (- |dif|) 1)
               (COND ((< |n| |$HistListAct|) (SETQ |$HistListAct| |n|)))))
             (RPLACD |$HistList| |l|)
             '|done|))))))
 
; updateHist() ==
;   -- updates the history file and calls updateInCoreHist
;   null $IOindex => nil
;   startTimingProcess 'history
;   updateInCoreHist()
;   if $HiFiAccess then
;     UNWIND_-PROTECT(writeHiFi(),disableHist())
;     $HistRecord:= NIL
;   $IOindex:= $IOindex+1
;   updateCurrentInterpreterFrame()
;   $currentLine := nil
;   stopTimingProcess 'history
 
(DEFUN |updateHist| ()
  (PROG ()
    (RETURN
     (COND ((NULL |$IOindex|) NIL)
           ('T
            (PROGN
             (|startTimingProcess| '|history|)
             (|updateInCoreHist|)
             (COND
              (|$HiFiAccess| (UNWIND-PROTECT (|writeHiFi|) (|disableHist|))
               (SETQ |$HistRecord| NIL)))
             (SETQ |$IOindex| (+ |$IOindex| 1))
             (|updateCurrentInterpreterFrame|)
             (SETQ |$currentLine| NIL)
             (|stopTimingProcess| '|history|)))))))
 
; updateInCoreHist() ==
;   -- updates $HistList and $IOindex
;   $HistList := rest($HistList)
;   RPLACA($HistList,NIL)
;   if $HistListAct < $HistListLen then $HistListAct:= $HistListAct+1
 
(DEFUN |updateInCoreHist| ()
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |$HistList| (CDR |$HistList|))
      (RPLACA |$HistList| NIL)
      (COND
       ((< |$HistListAct| |$HistListLen|)
        (SETQ |$HistListAct| (+ |$HistListAct| 1))))))))
 
; putHist(x,prop,val,e) ==
;   -- records new value to $HistRecord and old value to $HistList
;   -- then put is called with e
;   if not (x='%) then recordOldValue(x,prop,get(x,prop,e))
;   if $HiFiAccess then recordNewValue(x,prop,val)
;   putIntSymTab(x,prop,val,e)
 
(DEFUN |putHist| (|x| |prop| |val| |e|)
  (PROG ()
    (RETURN
     (PROGN
      (COND
       ((NULL (EQ |x| '%))
        (|recordOldValue| |x| |prop| (|get| |x| |prop| |e|))))
      (COND (|$HiFiAccess| (|recordNewValue| |x| |prop| |val|)))
      (|putIntSymTab| |x| |prop| |val| |e|)))))
 
; histFileErase file ==
;   _$ERASE(file)
 
(DEFUN |histFileErase| (|file|) (PROG () (RETURN ($ERASE |file|))))
 
; recordNewValue(x,prop,val) ==
;   startTimingProcess 'history
;   recordNewValue0(x,prop,val)
;   stopTimingProcess 'history
 
(DEFUN |recordNewValue| (|x| |prop| |val|)
  (PROG ()
    (RETURN
     (PROGN
      (|startTimingProcess| '|history|)
      (|recordNewValue0| |x| |prop| |val|)
      (|stopTimingProcess| '|history|)))))
 
; recordNewValue0(x,prop,val) ==
;   -- writes (prop . val) into $HistRecord
;   -- updateHist writes this stuff out into the history file
;   p1:= ASSQ(x,$HistRecord) =>
;     p2 := ASSQ(prop, rest p1) =>
;       RPLACD(p2,val)
;     RPLACD(p1, CONS(CONS(prop, val), rest p1))
;   p:= CONS(x,list CONS(prop,val))
;   $HistRecord:= CONS(p,$HistRecord)
 
(DEFUN |recordNewValue0| (|x| |prop| |val|)
  (PROG (|p1| |p2| |p|)
    (RETURN
     (COND
      ((SETQ |p1| (ASSQ |x| |$HistRecord|))
       (COND ((SETQ |p2| (ASSQ |prop| (CDR |p1|))) (RPLACD |p2| |val|))
             (#1='T (RPLACD |p1| (CONS (CONS |prop| |val|) (CDR |p1|))))))
      (#1#
       (PROGN
        (SETQ |p| (CONS |x| (LIST (CONS |prop| |val|))))
        (SETQ |$HistRecord| (CONS |p| |$HistRecord|))))))))
 
; recordOldValue(x,prop,val) ==
;   startTimingProcess 'history
;   recordOldValue0(x,prop,val)
;   stopTimingProcess 'history
 
(DEFUN |recordOldValue| (|x| |prop| |val|)
  (PROG ()
    (RETURN
     (PROGN
      (|startTimingProcess| '|history|)
      (|recordOldValue0| |x| |prop| |val|)
      (|stopTimingProcess| '|history|)))))
 
; recordOldValue0(x,prop,val) ==
;   -- writes (prop . val) into $HistList
;   p1 := ASSQ(x, first $HistList) =>
;     not ASSQ(prop, rest p1) =>
;       RPLACD(p1, CONS(CONS(prop, val), rest p1))
;   p:= CONS(x,list CONS(prop,val))
;   RPLACA($HistList, CONS(p, first $HistList))
 
(DEFUN |recordOldValue0| (|x| |prop| |val|)
  (PROG (|p1| |p|)
    (RETURN
     (COND
      ((SETQ |p1| (ASSQ |x| (CAR |$HistList|)))
       (COND
        ((NULL (ASSQ |prop| (CDR |p1|)))
         (IDENTITY (RPLACD |p1| (CONS (CONS |prop| |val|) (CDR |p1|)))))))
      ('T
       (PROGN
        (SETQ |p| (CONS |x| (LIST (CONS |prop| |val|))))
        (RPLACA |$HistList| (CONS |p| (CAR |$HistList|)))))))))
 
; undoInCore(n) ==
;   -- undoes the last n>0 steps using $HistList
;   -- resets $InteractiveFrame
;   li:= $HistList
;   for i in n..$HistListLen repeat li := rest li
;   undoChanges(li)
;   n:= $IOindex-n-1
;   n>0 and
;     $HiFiAccess =>
;       vec := rest UNWIND_-PROTECT(readHiFi(n), disableHist())
;       val := (p := ASSQ('%, vec)) and (p1 := ASSQ('value, rest p)) and
;         rest p1
;     sayKeyedMsg("S2IH0019",[n])
;   $InteractiveFrame:= putHist('%,'value,val,$InteractiveFrame)
;   updateHist()
 
(DEFUN |undoInCore| (|n|)
  (PROG (|li| |vec| |p| |p1| |val|)
    (RETURN
     (PROGN
      (SETQ |li| |$HistList|)
      ((LAMBDA (|i|)
         (LOOP
          (COND ((> |i| |$HistListLen|) (RETURN NIL))
                (#1='T (SETQ |li| (CDR |li|))))
          (SETQ |i| (+ |i| 1))))
       |n|)
      (|undoChanges| |li|)
      (SETQ |n| (- (- |$IOindex| |n|) 1))
      (AND (< 0 |n|)
           (COND
            (|$HiFiAccess|
             (PROGN
              (SETQ |vec|
                      (CDR (UNWIND-PROTECT (|readHiFi| |n|) (|disableHist|))))
              (SETQ |val|
                      (AND (SETQ |p| (ASSQ '% |vec|))
                           (SETQ |p1| (ASSQ '|value| (CDR |p|))) (CDR |p1|)))))
            (#1# (|sayKeyedMsg| 'S2IH0019 (LIST |n|)))))
      (SETQ |$InteractiveFrame|
              (|putHist| '% '|value| |val| |$InteractiveFrame|))
      (|updateHist|)))))
 
; undoChanges(li) ==
;   -- undoes all changes of list 'li'
;   if not (rest li = $HistList) then undoChanges rest li
;   for p1 in first li repeat
;     x := first p1
;     for p2 in rest p1 repeat
;       putHist(x, first p2, rest p2, $InteractiveFrame)
 
(DEFUN |undoChanges| (|li|)
  (PROG (|x|)
    (RETURN
     (PROGN
      (COND ((NULL (EQUAL (CDR |li|) |$HistList|)) (|undoChanges| (CDR |li|))))
      ((LAMBDA (|bfVar#82| |p1|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#82|) (PROGN (SETQ |p1| (CAR |bfVar#82|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (SETQ |x| (CAR |p1|))
             ((LAMBDA (|bfVar#83| |p2|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#83|)
                       (PROGN (SETQ |p2| (CAR |bfVar#83|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (|putHist| |x| (CAR |p2|) (CDR |p2|) |$InteractiveFrame|)))
                 (SETQ |bfVar#83| (CDR |bfVar#83|))))
              (CDR |p1|) NIL))))
          (SETQ |bfVar#82| (CDR |bfVar#82|))))
       (CAR |li|) NIL)))))
 
; undoFromFile(n) ==
;   -- makes a clear and redoes all the assignments until step n
;   for [x,:varl] in CAAR $InteractiveFrame repeat
;     for p in varl repeat
;       [prop,:val]:= p
;       val =>
;         if not (x='%) then recordOldValue(x,prop,val)
;         if $HiFiAccess then recordNewValue(x,prop,val)
;         RPLACD(p,NIL)
;   for i in 1..n repeat
;     vec := UNWIND_-PROTECT(rest readHiFi(i), disableHist())
;     for p1 in vec repeat
;       x := first p1
;       for p2 in rest p1 repeat
;         $InteractiveFrame := putHist(x, first p2, rest p2, $InteractiveFrame)
;   val := (p := ASSQ('%, vec)) and (p1 := ASSQ('value, rest p)) and rest p1
;   $InteractiveFrame:= putHist('%,'value,val,$InteractiveFrame)
;   updateHist()
 
(DEFUN |undoFromFile| (|n|)
  (PROG (|x| |varl| |prop| |val| |vec| |p| |p1|)
    (RETURN
     (PROGN
      ((LAMBDA (|bfVar#85| |bfVar#84|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#85|)
                (PROGN (SETQ |bfVar#84| (CAR |bfVar#85|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#84|)
                 (PROGN
                  (SETQ |x| (CAR |bfVar#84|))
                  (SETQ |varl| (CDR |bfVar#84|))
                  #1#)
                 ((LAMBDA (|bfVar#86| |p|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#86|)
                           (PROGN (SETQ |p| (CAR |bfVar#86|)) NIL))
                       (RETURN NIL))
                      (#1#
                       (PROGN
                        (SETQ |prop| (CAR |p|))
                        (SETQ |val| (CDR |p|))
                        (COND
                         (|val|
                          (PROGN
                           (COND
                            ((NULL (EQ |x| '%))
                             (|recordOldValue| |x| |prop| |val|)))
                           (COND
                            (|$HiFiAccess|
                             (|recordNewValue| |x| |prop| |val|)))
                           (RPLACD |p| NIL)))))))
                     (SETQ |bfVar#86| (CDR |bfVar#86|))))
                  |varl| NIL))))
          (SETQ |bfVar#85| (CDR |bfVar#85|))))
       (CAAR |$InteractiveFrame|) NIL)
      ((LAMBDA (|i|)
         (LOOP
          (COND ((> |i| |n|) (RETURN NIL))
                (#1#
                 (PROGN
                  (SETQ |vec|
                          (UNWIND-PROTECT (CDR (|readHiFi| |i|))
                            (|disableHist|)))
                  ((LAMBDA (|bfVar#87| |p1|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#87|)
                            (PROGN (SETQ |p1| (CAR |bfVar#87|)) NIL))
                        (RETURN NIL))
                       (#1#
                        (PROGN
                         (SETQ |x| (CAR |p1|))
                         ((LAMBDA (|bfVar#88| |p2|)
                            (LOOP
                             (COND
                              ((OR (ATOM |bfVar#88|)
                                   (PROGN (SETQ |p2| (CAR |bfVar#88|)) NIL))
                               (RETURN NIL))
                              (#1#
                               (SETQ |$InteractiveFrame|
                                       (|putHist| |x| (CAR |p2|) (CDR |p2|)
                                        |$InteractiveFrame|))))
                             (SETQ |bfVar#88| (CDR |bfVar#88|))))
                          (CDR |p1|) NIL))))
                      (SETQ |bfVar#87| (CDR |bfVar#87|))))
                   |vec| NIL))))
          (SETQ |i| (+ |i| 1))))
       1)
      (SETQ |val|
              (AND (SETQ |p| (ASSQ '% |vec|))
                   (SETQ |p1| (ASSQ '|value| (CDR |p|))) (CDR |p1|)))
      (SETQ |$InteractiveFrame|
              (|putHist| '% '|value| |val| |$InteractiveFrame|))
      (|updateHist|)))))
 
; saveHistory(fn) ==
;   $seen: local := MAKE_-HASHTABLE 'EQ
;   not $HiFiAccess => sayKeyedMsg("S2IH0016",NIL)
;   not $useInternalHistoryTable and
;       null(make_input_filename(histFileName())) =>
;           sayKeyedMsg("S2IH0022", nil)
;   null fn =>
;     throwKeyedMsg("S2IH0037", nil)
;   savefile := makeHistFileName(fn)
;   inputfile := histInputFileName(fn)
;   writeInputLines(fn,1)
;   histFileErase savefile
; 
;   if $useInternalHistoryTable
;     then
;       saveStr := rMkOstream(savefile)
;       for [n,:rec] in reverse $internalHistoryTable repeat
;         val := SPADRWRITE0(object2Identifier n,rec,saveStr)
;         val = 'writifyFailed =>
;           sayKeyedMsg("S2IH0035", [n, inputfile]) -- unable to save step
;       RSHUT saveStr
;   sayKeyedMsg("S2IH0018",[namestring(savefile)])  -- saved hist file named
;   nil
 
(DEFUN |saveHistory| (|fn|)
  (PROG (|$seen| |val| |rec| |n| |saveStr| |inputfile| |savefile|)
    (DECLARE (SPECIAL |$seen|))
    (RETURN
     (PROGN
      (SETQ |$seen| (MAKE-HASHTABLE 'EQ))
      (COND ((NULL |$HiFiAccess|) (|sayKeyedMsg| 'S2IH0016 NIL))
            ((AND (NULL |$useInternalHistoryTable|)
                  (NULL (|make_input_filename| (|histFileName|))))
             (|sayKeyedMsg| 'S2IH0022 NIL))
            ((NULL |fn|) (|throwKeyedMsg| 'S2IH0037 NIL))
            (#1='T
             (PROGN
              (SETQ |savefile| (|makeHistFileName| |fn|))
              (SETQ |inputfile| (|histInputFileName| |fn|))
              (|writeInputLines| |fn| 1)
              (|histFileErase| |savefile|)
              (COND
               (|$useInternalHistoryTable|
                (SETQ |saveStr| (|rMkOstream| |savefile|))
                ((LAMBDA (|bfVar#90| |bfVar#89|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#90|)
                          (PROGN (SETQ |bfVar#89| (CAR |bfVar#90|)) NIL))
                      (RETURN NIL))
                     (#1#
                      (AND (CONSP |bfVar#89|)
                           (PROGN
                            (SETQ |n| (CAR |bfVar#89|))
                            (SETQ |rec| (CDR |bfVar#89|))
                            #1#)
                           (PROGN
                            (SETQ |val|
                                    (SPADRWRITE0 (|object2Identifier| |n|)
                                     |rec| |saveStr|))
                            (COND
                             ((EQ |val| '|writifyFailed|)
                              (|sayKeyedMsg| 'S2IH0035
                               (LIST |n| |inputfile|))))))))
                    (SETQ |bfVar#90| (CDR |bfVar#90|))))
                 (REVERSE |$internalHistoryTable|) NIL)
                (RSHUT |saveStr|)))
              (|sayKeyedMsg| 'S2IH0018 (LIST (|namestring| |savefile|)))
              NIL)))))))
 
; restoreHistory(fn) ==
;   -- uses fn $historyFileType to recover an old session
;   -- if fn = NIL, then use $oldHistoryFileName
;   if null fn then fn' := $oldHistoryFileName
;   else if fn is [fn'] and IDENTP(fn') then fn' := fn'
;        else throwKeyedMsg("S2IH0023",[fn'])
;   restfile := makeHistFileName(fn')
;   null(make_input_filename(restfile)) =>
;     sayKeyedMsg("S2IH0024",[namestring(restfile)]) -- no history file
; 
;   -- if clear is changed to be undoable, this should be a reset-clear
;   $options: local := nil
;   clearSpad2Cmd '(all)
;   oldInternal := $useInternalHistoryTable
;   restoreHistory2(oldInternal, restfile, fn')
;   sayKeyedMsg("S2IH0025",[namestring(restfile)])
;   clearCmdSortedCaches()
;   nil
 
(DEFUN |restoreHistory| (|fn|)
  (PROG (|$options| |oldInternal| |restfile| |fn'|)
    (DECLARE (SPECIAL |$options|))
    (RETURN
     (PROGN
      (COND ((NULL |fn|) (SETQ |fn'| |$oldHistoryFileName|))
            ((AND (CONSP |fn|) (EQ (CDR |fn|) NIL)
                  (PROGN (SETQ |fn'| (CAR |fn|)) #1='T) (IDENTP |fn'|))
             (SETQ |fn'| |fn'|))
            (#1# (|throwKeyedMsg| 'S2IH0023 (LIST |fn'|))))
      (SETQ |restfile| (|makeHistFileName| |fn'|))
      (COND
       ((NULL (|make_input_filename| |restfile|))
        (|sayKeyedMsg| 'S2IH0024 (LIST (|namestring| |restfile|))))
       (#1#
        (PROGN
         (SETQ |$options| NIL)
         (|clearSpad2Cmd| '(|all|))
         (SETQ |oldInternal| |$useInternalHistoryTable|)
         (|restoreHistory2| |oldInternal| |restfile| |fn'|)
         (|sayKeyedMsg| 'S2IH0025 (LIST (|namestring| |restfile|)))
         (|clearCmdSortedCaches|)
         NIL)))))))
 
; restoreHistory2(oldInternal, restfile, fn) ==
;   $curHistFileName : local := fn
;   $useInternalHistoryTable : local := nil
;   if not(oldInternal) then
;      curfile := histFileName()
;      histFileErase curfile
;      _$FCOPY(restfile,curfile)
;      $curHistFileName := nil
;      restfile := curfile
; 
;   l:= LENGTH RKEYIDS restfile
;   $HiFiAccess:= 'T
;   if oldInternal then $internalHistoryTable := NIL
;   for i in 1..l repeat
;     vec:= UNWIND_-PROTECT(readHiFi(i),disableHist())
;     if oldInternal then $internalHistoryTable :=
;       CONS([i,:vec],$internalHistoryTable)
;     LINE := first vec
;     for p1 in rest vec repeat
;       x := first p1
;       for p2 in rest p1 repeat
;         $InteractiveFrame := putHist(x, first p2, rest p2, $InteractiveFrame)
;     updateInCoreHist()
;   $e := $InteractiveFrame
;   for [a,:.] in CAAR $InteractiveFrame repeat
;     get(a,'localModemap,$InteractiveFrame) =>
;       rempropI(a,'localModemap)
;       rempropI(a,'localVars)
;       rempropI(a,'mapBody)
;   $IOindex:= l+1
;   $useInternalHistoryTable := oldInternal
 
(DEFUN |restoreHistory2| (|oldInternal| |restfile| |fn|)
  (PROG (|$useInternalHistoryTable| |$curHistFileName| |a| |x| LINE |vec| |l|
         |curfile|)
    (DECLARE (SPECIAL |$useInternalHistoryTable| |$curHistFileName|))
    (RETURN
     (PROGN
      (SETQ |$curHistFileName| |fn|)
      (SETQ |$useInternalHistoryTable| NIL)
      (COND
       ((NULL |oldInternal|) (SETQ |curfile| (|histFileName|))
        (|histFileErase| |curfile|) ($FCOPY |restfile| |curfile|)
        (SETQ |$curHistFileName| NIL) (SETQ |restfile| |curfile|)))
      (SETQ |l| (LENGTH (RKEYIDS |restfile|)))
      (SETQ |$HiFiAccess| 'T)
      (COND (|oldInternal| (SETQ |$internalHistoryTable| NIL)))
      ((LAMBDA (|i|)
         (LOOP
          (COND ((> |i| |l|) (RETURN NIL))
                (#1='T
                 (PROGN
                  (SETQ |vec|
                          (UNWIND-PROTECT (|readHiFi| |i|) (|disableHist|)))
                  (COND
                   (|oldInternal|
                    (SETQ |$internalHistoryTable|
                            (CONS (CONS |i| |vec|) |$internalHistoryTable|))))
                  (SETQ LINE (CAR |vec|))
                  ((LAMBDA (|bfVar#91| |p1|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#91|)
                            (PROGN (SETQ |p1| (CAR |bfVar#91|)) NIL))
                        (RETURN NIL))
                       (#1#
                        (PROGN
                         (SETQ |x| (CAR |p1|))
                         ((LAMBDA (|bfVar#92| |p2|)
                            (LOOP
                             (COND
                              ((OR (ATOM |bfVar#92|)
                                   (PROGN (SETQ |p2| (CAR |bfVar#92|)) NIL))
                               (RETURN NIL))
                              (#1#
                               (SETQ |$InteractiveFrame|
                                       (|putHist| |x| (CAR |p2|) (CDR |p2|)
                                        |$InteractiveFrame|))))
                             (SETQ |bfVar#92| (CDR |bfVar#92|))))
                          (CDR |p1|) NIL))))
                      (SETQ |bfVar#91| (CDR |bfVar#91|))))
                   (CDR |vec|) NIL)
                  (|updateInCoreHist|))))
          (SETQ |i| (+ |i| 1))))
       1)
      (SETQ |$e| |$InteractiveFrame|)
      ((LAMBDA (|bfVar#94| |bfVar#93|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#94|)
                (PROGN (SETQ |bfVar#93| (CAR |bfVar#94|)) NIL))
            (RETURN NIL))
           (#1#
            (AND (CONSP |bfVar#93|) (PROGN (SETQ |a| (CAR |bfVar#93|)) #1#)
                 (COND
                  ((|get| |a| '|localModemap| |$InteractiveFrame|)
                   (IDENTITY
                    (PROGN
                     (|rempropI| |a| '|localModemap|)
                     (|rempropI| |a| '|localVars|)
                     (|rempropI| |a| '|mapBody|))))))))
          (SETQ |bfVar#94| (CDR |bfVar#94|))))
       (CAAR |$InteractiveFrame|) NIL)
      (SETQ |$IOindex| (+ |l| 1))
      (SETQ |$useInternalHistoryTable| |oldInternal|)))))
 
; showHistory(arg) ==
;   -- arg can be of form
;   --    NIL          show at most last 20 input lines
;   --    (n)          show at most last n input lines
;   --    (lit)        where lit is an abbreviation for 'input or 'both
;   --                 if 'input, same as NIL
;   --                 if 'both, show last 5 input and outputs
;   --    (n lit)      show last n input lines + last n output lines
;   --                 if lit expands to 'both
;   $evalTimePrint: local:= 0
;   $printTimeSum: local:= 0
;   -- ugh!!! these are needed for timedEvaluateStream
;   -- displays the last n steps, default n=20
;   not $HiFiAccess => sayKeyedMsg("S2IH0026",['show])
;   showInputOrBoth := 'input
;   n := 20
;   nset := nil
;   if arg then
;     arg1 := first arg
;     if INTEGERP arg1 then
;       n := arg1
;       nset := true
;       IFCDR arg => arg1 := CADR arg
;       arg1 := NIL
;     arg1 =>
;       arg2 := selectOptionLC(arg1,'(input both),nil)
;       if arg2
;         then ((showInputOrBoth := arg2) = 'both) and (null nset) => n:= 5
;         else sayMSG
;           concat('"  ",bright arg1,'"is an invalid argument.")
;   if n >= $IOindex then n:= $IOindex-1
;   mini:= $IOindex-n
;   maxi:= $IOindex-1
;   showInputOrBoth = 'both =>
;     UNWIND_-PROTECT(showInOut(mini,maxi),setIOindex(maxi+1))
;   showInput(mini,maxi)
 
(DEFUN |showHistory| (|arg|)
  (PROG (|$printTimeSum| |$evalTimePrint| |maxi| |mini| |arg2| |arg1| |nset|
         |n| |showInputOrBoth|)
    (DECLARE (SPECIAL |$printTimeSum| |$evalTimePrint|))
    (RETURN
     (PROGN
      (SETQ |$evalTimePrint| 0)
      (SETQ |$printTimeSum| 0)
      (COND ((NULL |$HiFiAccess|) (|sayKeyedMsg| 'S2IH0026 (LIST '|show|)))
            (#1='T
             (PROGN
              (SETQ |showInputOrBoth| '|input|)
              (SETQ |n| 20)
              (SETQ |nset| NIL)
              (COND
               (|arg| (SETQ |arg1| (CAR |arg|))
                (COND
                 ((INTEGERP |arg1|) (SETQ |n| |arg1|) (SETQ |nset| T)
                  (COND ((IFCDR |arg|) (SETQ |arg1| (CADR |arg|)))
                        (#1# (SETQ |arg1| NIL)))))
                (COND
                 (|arg1|
                  (PROGN
                   (SETQ |arg2|
                           (|selectOptionLC| |arg1| '(|input| |both|) NIL))
                   (COND
                    (|arg2|
                     (COND
                      ((AND (EQ (SETQ |showInputOrBoth| |arg2|) '|both|)
                            (NULL |nset|))
                       (IDENTITY (SETQ |n| 5)))))
                    (#1#
                     (|sayMSG|
                      (|concat| "  " (|bright| |arg1|)
                       "is an invalid argument.")))))))))
              (COND ((NOT (< |n| |$IOindex|)) (SETQ |n| (- |$IOindex| 1))))
              (SETQ |mini| (- |$IOindex| |n|))
              (SETQ |maxi| (- |$IOindex| 1))
              (COND
               ((EQ |showInputOrBoth| '|both|)
                (UNWIND-PROTECT (|showInOut| |mini| |maxi|)
                  (|setIOindex| (+ |maxi| 1))))
               (#1# (|showInput| |mini| |maxi|))))))))))
 
; setIOindex(n) ==
;   -- set $IOindex to n
;   $IOindex:= n
 
(DEFUN |setIOindex| (|n|) (PROG () (RETURN (SETQ |$IOindex| |n|))))
 
; showInput(mini,maxi) ==
;   -- displays all input lines from mini to maxi
;   for ind in mini..maxi repeat
;     vec:= UNWIND_-PROTECT(readHiFi(ind),disableHist())
;     if ind<10 then TAB 2 else if ind<100 then TAB 1
;     l := first vec
;     STRINGP l =>
;       sayMSG ['"   [", ind, '"] ", first vec]
;     sayMSG ['"   [",ind,'"] " ]
;     for ln in l repeat
;       sayMSG ['"      ", ln]
 
(DEFUN |showInput| (|mini| |maxi|)
  (PROG (|vec| |l|)
    (RETURN
     ((LAMBDA (|ind|)
        (LOOP
         (COND ((> |ind| |maxi|) (RETURN NIL))
               (#1='T
                (PROGN
                 (SETQ |vec|
                         (UNWIND-PROTECT (|readHiFi| |ind|) (|disableHist|)))
                 (COND ((< |ind| 10) (TAB 2)) ((< |ind| 100) (TAB 1)))
                 (SETQ |l| (CAR |vec|))
                 (COND
                  ((STRINGP |l|)
                   (|sayMSG| (LIST "   [" |ind| "] " (CAR |vec|))))
                  (#1#
                   (PROGN
                    (|sayMSG| (LIST "   [" |ind| "] "))
                    ((LAMBDA (|bfVar#95| |ln|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#95|)
                              (PROGN (SETQ |ln| (CAR |bfVar#95|)) NIL))
                          (RETURN NIL))
                         (#1# (|sayMSG| (LIST "      " |ln|))))
                        (SETQ |bfVar#95| (CDR |bfVar#95|))))
                     |l| NIL)))))))
         (SETQ |ind| (+ |ind| 1))))
      |mini|))))
 
; showInOut(mini,maxi) ==
;   -- displays all steps from mini to maxi
;   for ind in mini..maxi repeat
;     vec:= UNWIND_-PROTECT(readHiFi(ind),disableHist())
;     sayMSG [first vec]
;     Alist := ASSQ('%, rest vec) =>
;       triple := rest ASSQ('value, rest Alist)
;       $IOindex:= ind
;       spadPrint(objValUnwrap triple,objMode triple)
 
(DEFUN |showInOut| (|mini| |maxi|)
  (PROG (|vec| |Alist| |triple|)
    (RETURN
     ((LAMBDA (|ind|)
        (LOOP
         (COND ((> |ind| |maxi|) (RETURN NIL))
               ('T
                (PROGN
                 (SETQ |vec|
                         (UNWIND-PROTECT (|readHiFi| |ind|) (|disableHist|)))
                 (|sayMSG| (LIST (CAR |vec|)))
                 (COND
                  ((SETQ |Alist| (ASSQ '% (CDR |vec|)))
                   (PROGN
                    (SETQ |triple| (CDR (ASSQ '|value| (CDR |Alist|))))
                    (SETQ |$IOindex| |ind|)
                    (|spadPrint| (|objValUnwrap| |triple|)
                     (|objMode| |triple|))))))))
         (SETQ |ind| (+ |ind| 1))))
      |mini|))))
 
; fetchOutput(n) ==
;   -- result is the output of step n
;   (n = -1) and (val := getI("%",'value)) => val
;   $HiFiAccess =>
;     n:=
;       n < 0 => $IOindex+n
;       n
;     n >= $IOindex => throwKeyedMsg("S2IH0001",[n])
;     n < 1        => throwKeyedMsg("S2IH0002",[n])
;     vec:= UNWIND_-PROTECT(readHiFi(n),disableHist())
;     Alist := ASSQ('%, rest vec) =>
;       val := rest ASSQ('value, rest Alist) => val
;       throwKeyedMsg("S2IH0003",[n])
;     throwKeyedMsg("S2IH0003",[n])
;   throwKeyedMsg("S2IH0004",NIL)
 
(DEFUN |fetchOutput| (|n|)
  (PROG (|val| |vec| |Alist|)
    (RETURN
     (COND ((AND (EQUAL |n| (- 1)) (SETQ |val| (|getI| '% '|value|))) |val|)
           (|$HiFiAccess|
            (PROGN
             (SETQ |n| (COND ((MINUSP |n|) (+ |$IOindex| |n|)) (#1='T |n|)))
             (COND
              ((NOT (< |n| |$IOindex|)) (|throwKeyedMsg| 'S2IH0001 (LIST |n|)))
              ((< |n| 1) (|throwKeyedMsg| 'S2IH0002 (LIST |n|)))
              (#1#
               (PROGN
                (SETQ |vec| (UNWIND-PROTECT (|readHiFi| |n|) (|disableHist|)))
                (COND
                 ((SETQ |Alist| (ASSQ '% (CDR |vec|)))
                  (COND
                   ((SETQ |val| (CDR (ASSQ '|value| (CDR |Alist|)))) |val|)
                   (#1# (|throwKeyedMsg| 'S2IH0003 (LIST |n|)))))
                 (#1# (|throwKeyedMsg| 'S2IH0003 (LIST |n|)))))))))
           (#1# (|throwKeyedMsg| 'S2IH0004 NIL))))))
 
; readHiFi(n) ==
;   -- reads the file using index n
;   if $useInternalHistoryTable
;   then
;     pair := assoc(n,$internalHistoryTable)
;     ATOM pair => keyedSystemError("S2IH0034",NIL)
;     vec := QCDR pair
;   else
;     HiFi:= rMkIstream(histFileName())
;     vec:= SPADRREAD(object2Identifier n,HiFi)
;     RSHUT HiFi
;   vec
 
(DEFUN |readHiFi| (|n|)
  (PROG (|pair| |vec| |HiFi|)
    (RETURN
     (PROGN
      (COND
       (|$useInternalHistoryTable|
        (SETQ |pair| (|assoc| |n| |$internalHistoryTable|))
        (COND ((ATOM |pair|) (|keyedSystemError| 'S2IH0034 NIL))
              (#1='T (SETQ |vec| (QCDR |pair|)))))
       (#1# (SETQ |HiFi| (|rMkIstream| (|histFileName|)))
        (SETQ |vec| (SPADRREAD (|object2Identifier| |n|) |HiFi|))
        (RSHUT |HiFi|)))
      |vec|))))
 
; writeHiFi() ==
;   -- writes the information of the current step out to history file
;   if $useInternalHistoryTable
;   then
;     $internalHistoryTable := CONS([$IOindex,$currentLine,:$HistRecord],
;       $internalHistoryTable)
;   else
;     HiFi:= rMkOstream(histFileName())
;     SPADRWRITE(object2Identifier $IOindex, CONS($currentLine,$HistRecord),HiFi)
;     RSHUT HiFi
 
(DEFUN |writeHiFi| ()
  (PROG (|HiFi|)
    (RETURN
     (COND
      (|$useInternalHistoryTable|
       (SETQ |$internalHistoryTable|
               (CONS (CONS |$IOindex| (CONS |$currentLine| |$HistRecord|))
                     |$internalHistoryTable|)))
      ('T (SETQ |HiFi| (|rMkOstream| (|histFileName|)))
       (SPADRWRITE (|object2Identifier| |$IOindex|)
        (CONS |$currentLine| |$HistRecord|) |HiFi|)
       (RSHUT |HiFi|))))))
 
; disableHist() ==
;   -- disables the history mechanism if an error occurred in the protected
;   -- piece of code
;   not $HiFiAccess => histFileErase histFileName()
;   NIL
 
(DEFUN |disableHist| ()
  (PROG ()
    (RETURN
     (COND ((NULL |$HiFiAccess|) (|histFileErase| (|histFileName|)))
           ('T NIL)))))
 
; writeHistModesAndValues() ==
;   for [a,:.] in CAAR $InteractiveFrame repeat
;     x := get(a,'value,$InteractiveFrame) =>
;       putHist(a,'value,x,$InteractiveFrame)
;     x := get(a,'mode,$InteractiveFrame) =>
;       putHist(a,'mode,x,$InteractiveFrame)
;   NIL
 
(DEFUN |writeHistModesAndValues| ()
  (PROG (|x| |a|)
    (RETURN
     (PROGN
      ((LAMBDA (|bfVar#97| |bfVar#96|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#97|)
                (PROGN (SETQ |bfVar#96| (CAR |bfVar#97|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#96|) (PROGN (SETQ |a| (CAR |bfVar#96|)) #1#)
                 (COND
                  ((SETQ |x| (|get| |a| '|value| |$InteractiveFrame|))
                   (|putHist| |a| '|value| |x| |$InteractiveFrame|))
                  ((SETQ |x| (|get| |a| '|mode| |$InteractiveFrame|))
                   (|putHist| |a| '|mode| |x| |$InteractiveFrame|))))))
          (SETQ |bfVar#97| (CDR |bfVar#97|))))
       (CAAR |$InteractiveFrame|) NIL)
      NIL))))
 
; SPADRREAD(vec, stream) ==
;     dewritify rread(vec, stream, nil)
 
(DEFUN SPADRREAD (|vec| |stream|)
  (PROG () (RETURN (|dewritify| (|rread| |vec| |stream| NIL)))))
 
; SPADRWRITE(vec, item, stream) ==
;   val := SPADRWRITE0(vec, item, stream)
;   val = 'writifyFailed =>
;     throwKeyedMsg("S2IH0036", nil) -- cannot save value to file
;   item
 
(DEFUN SPADRWRITE (|vec| |item| |stream|)
  (PROG (|val|)
    (RETURN
     (PROGN
      (SETQ |val| (SPADRWRITE0 |vec| |item| |stream|))
      (COND ((EQ |val| '|writifyFailed|) (|throwKeyedMsg| 'S2IH0036 NIL))
            ('T |item|))))))
 
; SPADRWRITE0(vec, item, stream) ==
;     val := safeWritify item
;     val = 'writifyFailed => val
;     rwrite(vec, val, stream)
;     item
 
(DEFUN SPADRWRITE0 (|vec| |item| |stream|)
  (PROG (|val|)
    (RETURN
     (PROGN
      (SETQ |val| (|safeWritify| |item|))
      (COND ((EQ |val| '|writifyFailed|) |val|)
            ('T (PROGN (|rwrite| |vec| |val| |stream|) |item|)))))))
 
; safeWritify ob ==
;   CATCH('writifyTag,  writify ob)
 
(DEFUN |safeWritify| (|ob|)
  (PROG () (RETURN (CATCH '|writifyTag| (|writify| |ob|)))))
 
; writify ob ==
;     not ScanOrPairVec(function(unwritable?), ob) => ob
;     $seen:     local := MAKE_-HASHTABLE 'EQ
;     $writifyComplained: local := false
; 
;     writifyInner ob where
;         writifyInner ob ==
;             null ob                => nil
;             (e := HGET($seen, ob)) => e
; 
;             PAIRP ob =>
;                 qcar := QCAR ob
;                 qcdr := QCDR ob
;                 (qcar = function newGoGet) =>
;                     writifyInner replaceGoGetSlot qcdr
;                 (name := spadClosure? ob) =>
;                    d := writifyInner qcdr
;                    nob := ['WRITIFIED_!_!, 'SPADCLOSURE, d, name]
;                    HPUT($seen, ob, nob)
;                    HPUT($seen, nob, nob)
;                    nob
;                 (ob is ['LAMBDA_-CLOSURE, ., ., x, :.]) and x =>
;                   THROW('writifyTag, 'writifyFailed)
;                 nob := CONS(qcar, qcdr)
;                 HPUT($seen, ob, nob)
;                 HPUT($seen, nob, nob)
;                 qcar := writifyInner qcar
;                 qcdr := writifyInner qcdr
;                 QRPLACA(nob, qcar)
;                 QRPLACD(nob, qcdr)
;                 nob
;             VECP ob =>
;                 isDomainOrPackage ob =>
;                     d := mkEvalable devaluate ob
;                     nob := ['WRITIFIED_!_!, 'DEVALUATED, writifyInner d]
;                     HPUT($seen, ob, nob)
;                     HPUT($seen, nob, nob)
;                     nob
;                 n   := QVMAXINDEX ob
;                 nob := MAKE_-VEC(n+1)
;                 HPUT($seen, ob, nob)
;                 HPUT($seen, nob, nob)
;                 for i in 0..n repeat
;                     QSETVELT(nob, i, writifyInner QVELT(ob,i))
;                 nob
;             SPAD_-KERNEL_-P ob =>
;                 nob := makeSpadKernel(NIL, NIL, SPAD_-KERNEL_-NEST(ob))
;                 HPUT($seen, ob, nob)
;                 HPUT($seen, nob, nob)
;                 SETF(SPAD_-KERNEL_-OP(nob), _
;                      writifyInner SPAD_-KERNEL_-OP(ob))
;                 SETF(SPAD_-KERNEL_-ARG(nob), _
;                      writifyInner SPAD_-KERNEL_-ARG(ob))
;                 nob
;             ob = 'WRITIFIED_!_! =>
;                 ['WRITIFIED_!_!, 'SELF]
;             -- In CCL constructors are also compiled functions, so we
;             -- need this line:
;             constructor? ob => ob
;             COMPILED_-FUNCTION_-P ob =>
;                 THROW('writifyTag, 'writifyFailed)
;             HASHTABLEP ob =>
;                 nob := ['WRITIFIED_!_!]
;                 HPUT($seen, ob,  nob)
;                 HPUT($seen, nob, nob)
;                 keys := HKEYS ob
;                 QRPLACD(nob,
;                         ['HASHTABLE,
;                           HASHTABLE_-CLASS ob,
;                             writifyInner keys,
;                               [writifyInner HGET(ob,k) for k in keys]])
;                 nob
;             PLACEP ob =>
;                 nob := ['WRITIFIED_!_!, 'PLACE]
;                 HPUT($seen, ob,  nob)
;                 HPUT($seen, nob, nob)
;                 nob
;             -- The next three types cause an error on de-writifying.
;             -- Create an object of the right shape, nonetheless.
;             READTABLEP ob =>
;                 THROW('writifyTag, 'writifyFailed)
;             -- Default case: return the object itself.
;             STRINGP ob =>
;                 EQ(ob, $NullStream) => ['WRITIFIED_!_!, 'NULLSTREAM]
;                 EQ(ob, $NonNullStream) => ['WRITIFIED_!_!, 'NONNULLSTREAM]
;                 ob
;             FLOATP ob =>
;                 ob = READ_-FROM_-STRING STRINGIMAGE ob => ob
;                 ['WRITIFIED_!_!, 'FLOAT, ob,:
;                    MULTIPLE_-VALUE_-LIST INTEGER_-DECODE_-FLOAT ob]
;             ob
 
(DEFUN |writify| (|ob|)
  (PROG (|$writifyComplained| |$seen|)
    (DECLARE (SPECIAL |$writifyComplained| |$seen|))
    (RETURN
     (COND ((NULL (|ScanOrPairVec| #'|unwritable?| |ob|)) |ob|)
           ('T
            (PROGN
             (SETQ |$seen| (MAKE-HASHTABLE 'EQ))
             (SETQ |$writifyComplained| NIL)
             (|writify,writifyInner| |ob|)))))))
(DEFUN |writify,writifyInner| (|ob|)
  (PROG (|e| |qcar| |qcdr| |name| |d| |nob| |ISTMP#1| |ISTMP#2| |ISTMP#3| |x|
         |n| |keys|)
    (RETURN
     (COND ((NULL |ob|) NIL) ((SETQ |e| (HGET |$seen| |ob|)) |e|)
           ((CONSP |ob|)
            (PROGN
             (SETQ |qcar| (QCAR |ob|))
             (SETQ |qcdr| (QCDR |ob|))
             (COND
              ((EQUAL |qcar| #'|newGoGet|)
               (|writify,writifyInner| (|replaceGoGetSlot| |qcdr|)))
              ((SETQ |name| (|spadClosure?| |ob|))
               (PROGN
                (SETQ |d| (|writify,writifyInner| |qcdr|))
                (SETQ |nob| (LIST 'WRITIFIED!! 'SPADCLOSURE |d| |name|))
                (HPUT |$seen| |ob| |nob|)
                (HPUT |$seen| |nob| |nob|)
                |nob|))
              ((AND (CONSP |ob|) (EQ (CAR |ob|) 'LAMBDA-CLOSURE)
                    (PROGN
                     (SETQ |ISTMP#1| (CDR |ob|))
                     (AND (CONSP |ISTMP#1|)
                          (PROGN
                           (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                           (AND (CONSP |ISTMP#2|)
                                (PROGN
                                 (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                                 (AND (CONSP |ISTMP#3|)
                                      (PROGN
                                       (SETQ |x| (CAR |ISTMP#3|))
                                       #1='T)))))))
                    |x|)
               (THROW '|writifyTag| '|writifyFailed|))
              (#1#
               (PROGN
                (SETQ |nob| (CONS |qcar| |qcdr|))
                (HPUT |$seen| |ob| |nob|)
                (HPUT |$seen| |nob| |nob|)
                (SETQ |qcar| (|writify,writifyInner| |qcar|))
                (SETQ |qcdr| (|writify,writifyInner| |qcdr|))
                (QRPLACA |nob| |qcar|)
                (QRPLACD |nob| |qcdr|)
                |nob|)))))
           ((VECP |ob|)
            (COND
             ((|isDomainOrPackage| |ob|)
              (PROGN
               (SETQ |d| (|mkEvalable| (|devaluate| |ob|)))
               (SETQ |nob|
                       (LIST 'WRITIFIED!! 'DEVALUATED
                             (|writify,writifyInner| |d|)))
               (HPUT |$seen| |ob| |nob|)
               (HPUT |$seen| |nob| |nob|)
               |nob|))
             (#1#
              (PROGN
               (SETQ |n| (QVMAXINDEX |ob|))
               (SETQ |nob| (MAKE-VEC (+ |n| 1)))
               (HPUT |$seen| |ob| |nob|)
               (HPUT |$seen| |nob| |nob|)
               ((LAMBDA (|i|)
                  (LOOP
                   (COND ((> |i| |n|) (RETURN NIL))
                         (#1#
                          (QSETVELT |nob| |i|
                           (|writify,writifyInner| (QVELT |ob| |i|)))))
                   (SETQ |i| (+ |i| 1))))
                0)
               |nob|))))
           ((SPAD-KERNEL-P |ob|)
            (PROGN
             (SETQ |nob| (|makeSpadKernel| NIL NIL (SPAD-KERNEL-NEST |ob|)))
             (HPUT |$seen| |ob| |nob|)
             (HPUT |$seen| |nob| |nob|)
             (SETF (SPAD-KERNEL-OP |nob|)
                     (|writify,writifyInner| (SPAD-KERNEL-OP |ob|)))
             (SETF (SPAD-KERNEL-ARG |nob|)
                     (|writify,writifyInner| (SPAD-KERNEL-ARG |ob|)))
             |nob|))
           ((EQ |ob| 'WRITIFIED!!) (LIST 'WRITIFIED!! 'SELF))
           ((|constructor?| |ob|) |ob|)
           ((COMPILED-FUNCTION-P |ob|) (THROW '|writifyTag| '|writifyFailed|))
           ((HASHTABLEP |ob|)
            (PROGN
             (SETQ |nob| (LIST 'WRITIFIED!!))
             (HPUT |$seen| |ob| |nob|)
             (HPUT |$seen| |nob| |nob|)
             (SETQ |keys| (HKEYS |ob|))
             (QRPLACD |nob|
              (LIST 'HASHTABLE (HASHTABLE-CLASS |ob|)
                    (|writify,writifyInner| |keys|)
                    ((LAMBDA (|bfVar#99| |bfVar#98| |k|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#98|)
                              (PROGN (SETQ |k| (CAR |bfVar#98|)) NIL))
                          (RETURN (NREVERSE |bfVar#99|)))
                         (#1#
                          (SETQ |bfVar#99|
                                  (CONS
                                   (|writify,writifyInner| (HGET |ob| |k|))
                                   |bfVar#99|))))
                        (SETQ |bfVar#98| (CDR |bfVar#98|))))
                     NIL |keys| NIL)))
             |nob|))
           ((PLACEP |ob|)
            (PROGN
             (SETQ |nob| (LIST 'WRITIFIED!! 'PLACE))
             (HPUT |$seen| |ob| |nob|)
             (HPUT |$seen| |nob| |nob|)
             |nob|))
           ((READTABLEP |ob|) (THROW '|writifyTag| '|writifyFailed|))
           ((STRINGP |ob|)
            (COND ((EQ |ob| |$NullStream|) (LIST 'WRITIFIED!! 'NULLSTREAM))
                  ((EQ |ob| |$NonNullStream|)
                   (LIST 'WRITIFIED!! 'NONNULLSTREAM))
                  (#1# |ob|)))
           ((FLOATP |ob|)
            (COND ((EQUAL |ob| (READ-FROM-STRING (STRINGIMAGE |ob|))) |ob|)
                  (#1#
                   (CONS 'WRITIFIED!!
                         (CONS 'FLOAT
                               (CONS |ob|
                                     (MULTIPLE-VALUE-LIST
                                      (INTEGER-DECODE-FLOAT |ob|))))))))
           (#1# |ob|)))))
 
; unwritable? ob ==
;     PAIRP  ob or VECP ob       => false   -- first for speed
;     COMPILED_-FUNCTION_-P   ob or HASHTABLEP ob => true
;     PLACEP ob or READTABLEP ob => true
;     FLOATP ob => true
;     false
 
(DEFUN |unwritable?| (|ob|)
  (PROG ()
    (RETURN
     (COND ((OR (CONSP |ob|) (VECP |ob|)) NIL)
           ((OR (COMPILED-FUNCTION-P |ob|) (HASHTABLEP |ob|)) T)
           ((OR (PLACEP |ob|) (READTABLEP |ob|)) T) ((FLOATP |ob|) T)
           ('T NIL)))))
 
; writifyComplain s ==
;    $writifyComplained  = true => nil
;    $writifyComplained := true
;    sayKeyedMsg("S2IH0027",[s])
 
(DEFUN |writifyComplain| (|s|)
  (PROG ()
    (RETURN
     (COND ((EQUAL |$writifyComplained| T) NIL)
           ('T
            (PROGN
             (SETQ |$writifyComplained| T)
             (|sayKeyedMsg| 'S2IH0027 (LIST |s|))))))))
 
; spadClosure? ob ==
;   fun := QCAR ob
;   not (FUNCTIONP fun) => nil
;   not (name := BPINAME fun) => nil
;   name = "WRAPPED" => nil
;   vec := QCDR ob
;   not VECP vec => nil
;   name
 
(DEFUN |spadClosure?| (|ob|)
  (PROG (|fun| |name| |vec|)
    (RETURN
     (PROGN
      (SETQ |fun| (QCAR |ob|))
      (COND ((NULL (FUNCTIONP |fun|)) NIL)
            ((NULL (SETQ |name| (BPINAME |fun|))) NIL)
            ((EQ |name| 'WRAPPED) NIL)
            (#1='T
             (PROGN
              (SETQ |vec| (QCDR |ob|))
              (COND ((NULL (VECP |vec|)) NIL) (#1# |name|)))))))))
 
; dewritify ob ==
;     (not ScanOrPairVec(function is?, ob)
;             where  is? a == a = 'WRITIFIED_!_!) => ob
; 
;     $seen:     local := MAKE_-HASHTABLE 'EQ
; 
;     dewritifyInner ob where
;         dewritifyInner ob ==
;             null ob => nil
;             e := HGET($seen, ob) => e
; 
;             PAIRP ob and first ob = 'WRITIFIED_!_! =>
;                 type := ob.1
;                 type = 'SELF =>
;                     'WRITIFIED_!_!
;                 type = 'BPI =>
;                     oname := ob.2
;                     f :=
;                         -- FIXME: GENSYMMER is nowhere defined
;                         INTEGERP oname => EVAL GENSYMMER oname
;                         SYMBOL_-FUNCTION oname
;                     not COMPILED_-FUNCTION_-P f =>
;                         error '"A required BPI does not exist."
;                     #ob > 3 and HASHEQ f ~= ob.3 =>
;                         error '"A required BPI has been redefined."
;                     HPUT($seen, ob, f)
;                     f
;                 type = 'HASHTABLE =>
;                     nob := MAKE_-HASHTABLE ob.2
;                     HPUT($seen, ob, nob)
;                     HPUT($seen, nob, nob)
;                     for k in ob.3 for e in ob.4 repeat
;                         HPUT(nob, dewritifyInner k, dewritifyInner e)
;                     nob
;                 type = 'DEVALUATED =>
;                     nob := EVAL dewritifyInner ob.2
;                     HPUT($seen, ob, nob)
;                     HPUT($seen, nob, nob)
;                     nob
;                 type = 'SPADCLOSURE =>
;                     vec := dewritifyInner ob.2
;                     name := ob.3
;                     not FBOUNDP name =>
;                        error STRCONC('"undefined function: ", SYMBOL_-NAME name)
;                     nob := CONS(SYMBOL_-FUNCTION name, vec)
;                     HPUT($seen, ob, nob)
;                     HPUT($seen, nob, nob)
;                     nob
;                 type = 'PLACE =>
;                     nob := get_read_placeholder()
;                     HPUT($seen, ob, nob)
;                     HPUT($seen, nob, nob)
;                     nob
;                 type = 'READTABLE =>
;                     error '"Cannot de-writify a read table."
;                 type = 'NULLSTREAM => $NullStream
;                 type = 'NONNULLSTREAM => $NonNullStream
;                 type = 'FLOAT =>
;                    [fval, signif, expon, sign] := CDDR ob
;                    fval := SCALE_-FLOAT( FLOAT(signif, fval), expon)
;                    sign<0 => -fval
;                    fval
;                 error '"Unknown type to de-writify."
; 
;             PAIRP ob =>
;                 qcar := QCAR ob
;                 qcdr := QCDR ob
;                 nob  := CONS(qcar, qcdr)
;                 HPUT($seen, ob, nob)
;                 HPUT($seen, nob, nob)
;                 QRPLACA(nob, dewritifyInner qcar)
;                 QRPLACD(nob, dewritifyInner qcdr)
;                 nob
;             VECP ob =>
;                 n   := QVMAXINDEX ob
;                 nob := MAKE_-VEC(n+1)
;                 HPUT($seen, ob, nob)
;                 HPUT($seen, nob, nob)
;                 for i in 0..n repeat
;                     QSETVELT(nob, i, dewritifyInner QVELT(ob,i))
;                 nob
;             SPAD_-KERNEL_-P ob =>
;                 nob := makeSpadKernel(NIL, NIL, SPAD_-KERNEL_-NEST(ob))
;                 HPUT($seen, ob, nob)
;                 HPUT($seen, nob, nob)
;                 SETF(SPAD_-KERNEL_-OP(nob), _
;                      dewritifyInner SPAD_-KERNEL_-OP(ob))
;                 SETF(SPAD_-KERNEL_-ARG(nob), _
;                      dewritifyInner SPAD_-KERNEL_-ARG(ob))
;                 nob
;             -- Default case: return the object itself.
;             ob
 
(DEFUN |dewritify| (|ob|)
  (PROG (|$seen|)
    (DECLARE (SPECIAL |$seen|))
    (RETURN
     (COND ((NULL (|ScanOrPairVec| #'|dewritify,is?| |ob|)) |ob|)
           ('T
            (PROGN
             (SETQ |$seen| (MAKE-HASHTABLE 'EQ))
             (|dewritify,dewritifyInner| |ob|)))))))
(DEFUN |dewritify,dewritifyInner| (|ob|)
  (PROG (|e| |type| |oname| |f| |nob| |vec| |name| |LETTMP#1| |fval| |signif|
         |expon| |sign| |qcar| |qcdr| |n|)
    (RETURN
     (COND ((NULL |ob|) NIL) ((SETQ |e| (HGET |$seen| |ob|)) |e|)
           ((AND (CONSP |ob|) (EQ (CAR |ob|) 'WRITIFIED!!))
            (PROGN
             (SETQ |type| (ELT |ob| 1))
             (COND ((EQ |type| 'SELF) 'WRITIFIED!!)
                   ((EQ |type| 'BPI)
                    (PROGN
                     (SETQ |oname| (ELT |ob| 2))
                     (SETQ |f|
                             (COND
                              ((INTEGERP |oname|) (EVAL (GENSYMMER |oname|)))
                              (#1='T (SYMBOL-FUNCTION |oname|))))
                     (COND
                      ((NULL (COMPILED-FUNCTION-P |f|))
                       (|error| "A required BPI does not exist."))
                      ((AND (< 3 (LENGTH |ob|))
                            (NOT (EQUAL (HASHEQ |f|) (ELT |ob| 3))))
                       (|error| "A required BPI has been redefined."))
                      (#1# (PROGN (HPUT |$seen| |ob| |f|) |f|)))))
                   ((EQ |type| 'HASHTABLE)
                    (PROGN
                     (SETQ |nob| (MAKE-HASHTABLE (ELT |ob| 2)))
                     (HPUT |$seen| |ob| |nob|)
                     (HPUT |$seen| |nob| |nob|)
                     ((LAMBDA (|bfVar#100| |k| |bfVar#101| |e|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#100|)
                               (PROGN (SETQ |k| (CAR |bfVar#100|)) NIL)
                               (ATOM |bfVar#101|)
                               (PROGN (SETQ |e| (CAR |bfVar#101|)) NIL))
                           (RETURN NIL))
                          (#1#
                           (HPUT |nob| (|dewritify,dewritifyInner| |k|)
                                 (|dewritify,dewritifyInner| |e|))))
                         (SETQ |bfVar#100| (CDR |bfVar#100|))
                         (SETQ |bfVar#101| (CDR |bfVar#101|))))
                      (ELT |ob| 3) NIL (ELT |ob| 4) NIL)
                     |nob|))
                   ((EQ |type| 'DEVALUATED)
                    (PROGN
                     (SETQ |nob|
                             (EVAL (|dewritify,dewritifyInner| (ELT |ob| 2))))
                     (HPUT |$seen| |ob| |nob|)
                     (HPUT |$seen| |nob| |nob|)
                     |nob|))
                   ((EQ |type| 'SPADCLOSURE)
                    (PROGN
                     (SETQ |vec| (|dewritify,dewritifyInner| (ELT |ob| 2)))
                     (SETQ |name| (ELT |ob| 3))
                     (COND
                      ((NULL (FBOUNDP |name|))
                       (|error|
                        (STRCONC "undefined function: " (SYMBOL-NAME |name|))))
                      (#1#
                       (PROGN
                        (SETQ |nob| (CONS (SYMBOL-FUNCTION |name|) |vec|))
                        (HPUT |$seen| |ob| |nob|)
                        (HPUT |$seen| |nob| |nob|)
                        |nob|)))))
                   ((EQ |type| 'PLACE)
                    (PROGN
                     (SETQ |nob| (|get_read_placeholder|))
                     (HPUT |$seen| |ob| |nob|)
                     (HPUT |$seen| |nob| |nob|)
                     |nob|))
                   ((EQ |type| 'READTABLE)
                    (|error| "Cannot de-writify a read table."))
                   ((EQ |type| 'NULLSTREAM) |$NullStream|)
                   ((EQ |type| 'NONNULLSTREAM) |$NonNullStream|)
                   ((EQ |type| 'FLOAT)
                    (PROGN
                     (SETQ |LETTMP#1| (CDDR |ob|))
                     (SETQ |fval| (CAR |LETTMP#1|))
                     (SETQ |signif| (CADR |LETTMP#1|))
                     (SETQ |expon| (CADDR |LETTMP#1|))
                     (SETQ |sign| (CADDDR |LETTMP#1|))
                     (SETQ |fval|
                             (SCALE-FLOAT (FLOAT |signif| |fval|) |expon|))
                     (COND ((MINUSP |sign|) (- |fval|)) (#1# |fval|))))
                   (#1# (|error| "Unknown type to de-writify.")))))
           ((CONSP |ob|)
            (PROGN
             (SETQ |qcar| (QCAR |ob|))
             (SETQ |qcdr| (QCDR |ob|))
             (SETQ |nob| (CONS |qcar| |qcdr|))
             (HPUT |$seen| |ob| |nob|)
             (HPUT |$seen| |nob| |nob|)
             (QRPLACA |nob| (|dewritify,dewritifyInner| |qcar|))
             (QRPLACD |nob| (|dewritify,dewritifyInner| |qcdr|))
             |nob|))
           ((VECP |ob|)
            (PROGN
             (SETQ |n| (QVMAXINDEX |ob|))
             (SETQ |nob| (MAKE-VEC (+ |n| 1)))
             (HPUT |$seen| |ob| |nob|)
             (HPUT |$seen| |nob| |nob|)
             ((LAMBDA (|i|)
                (LOOP
                 (COND ((> |i| |n|) (RETURN NIL))
                       (#1#
                        (QSETVELT |nob| |i|
                         (|dewritify,dewritifyInner| (QVELT |ob| |i|)))))
                 (SETQ |i| (+ |i| 1))))
              0)
             |nob|))
           ((SPAD-KERNEL-P |ob|)
            (PROGN
             (SETQ |nob| (|makeSpadKernel| NIL NIL (SPAD-KERNEL-NEST |ob|)))
             (HPUT |$seen| |ob| |nob|)
             (HPUT |$seen| |nob| |nob|)
             (SETF (SPAD-KERNEL-OP |nob|)
                     (|dewritify,dewritifyInner| (SPAD-KERNEL-OP |ob|)))
             (SETF (SPAD-KERNEL-ARG |nob|)
                     (|dewritify,dewritifyInner| (SPAD-KERNEL-ARG |ob|)))
             |nob|))
           (#1# |ob|)))))
(DEFUN |dewritify,is?| (|a|) (PROG () (RETURN (EQ |a| 'WRITIFIED!!))))
 
; ScanOrPairVec(f, ob) ==
;     $seen:     local := MAKE_-HASHTABLE 'EQ
; 
;     CATCH('ScanOrPairVecAnswer, ScanOrInner(f, ob)) where
;         ScanOrInner(f, ob) ==
;             HGET($seen, ob) => nil
;             PAIRP ob =>
;                 HPUT($seen, ob, true)
;                 ScanOrInner(f, QCAR ob)
;                 ScanOrInner(f, QCDR ob)
;                 nil
;             VECP ob =>
;                 HPUT($seen, ob, true)
;                 for i in 0..#ob-1 repeat ScanOrInner(f, ob.i)
;                 nil
;             SPAD_-KERNEL_-P ob =>
;                 ScanOrInner(f, SPAD_-KERNEL_-OP ob)
;                 ScanOrInner(f, SPAD_-KERNEL_-ARG ob)
;             FUNCALL(f, ob) =>
;                 THROW('ScanOrPairVecAnswer, true)
;             nil
 
(DEFUN |ScanOrPairVec| (|f| |ob|)
  (PROG (|$seen|)
    (DECLARE (SPECIAL |$seen|))
    (RETURN
     (PROGN
      (SETQ |$seen| (MAKE-HASHTABLE 'EQ))
      (CATCH '|ScanOrPairVecAnswer| (|ScanOrPairVec,ScanOrInner| |f| |ob|))))))
(DEFUN |ScanOrPairVec,ScanOrInner| (|f| |ob|)
  (PROG ()
    (RETURN
     (COND ((HGET |$seen| |ob|) NIL)
           ((CONSP |ob|)
            (PROGN
             (HPUT |$seen| |ob| T)
             (|ScanOrPairVec,ScanOrInner| |f| (QCAR |ob|))
             (|ScanOrPairVec,ScanOrInner| |f| (QCDR |ob|))
             NIL))
           ((VECP |ob|)
            (PROGN
             (HPUT |$seen| |ob| T)
             ((LAMBDA (|bfVar#102| |i|)
                (LOOP
                 (COND ((> |i| |bfVar#102|) (RETURN NIL))
                       (#1='T
                        (|ScanOrPairVec,ScanOrInner| |f| (ELT |ob| |i|))))
                 (SETQ |i| (+ |i| 1))))
              (- (LENGTH |ob|) 1) 0)
             NIL))
           ((SPAD-KERNEL-P |ob|)
            (PROGN
             (|ScanOrPairVec,ScanOrInner| |f| (SPAD-KERNEL-OP |ob|))
             (|ScanOrPairVec,ScanOrInner| |f| (SPAD-KERNEL-ARG |ob|))))
           ((FUNCALL |f| |ob|) (THROW '|ScanOrPairVecAnswer| T)) (#1# NIL)))))
 
; load args == loadSpad2Cmd args
 
(DEFUN |load| (|args|) (PROG () (RETURN (|loadSpad2Cmd| |args|))))
 
; loadSpad2Cmd args ==
;     sayKeyedMsg("S2IU0003", nil)
;     NIL
 
(DEFUN |loadSpad2Cmd| (|args|)
  (PROG () (RETURN (PROGN (|sayKeyedMsg| 'S2IU0003 NIL) NIL))))
 
; reportCount () ==
;   centerAndHighlight(" Current Count Settings ",$LINELENGTH,specialChar 'hbar)
;   SAY " "
;   sayBrightly [:bright " cache",fillerSpaces(30,'".")," ",$cacheCount]
;   if $cacheAlist then
;     for [a,:b] in $cacheAlist repeat
;       aPart:= linearFormatName a
;       n:= sayBrightlyLength aPart
;       sayBrightly concat("     ",aPart," ",fillerSpaces(32-n,'".")," ",b)
;   SAY " "
;   sayBrightly [:bright " stream",fillerSpaces(29,'".")," ",$streamCount]
 
(DEFUN |reportCount| ()
  (PROG (|n| |aPart| |b| |a|)
    (RETURN
     (PROGN
      (|centerAndHighlight| '| Current Count Settings | $LINELENGTH
       (|specialChar| '|hbar|))
      (SAY '| |)
      (|sayBrightly|
       (APPEND (|bright| '| cache|)
               (CONS (|fillerSpaces| 30 ".")
                     (CONS '| | (CONS |$cacheCount| NIL)))))
      (COND
       (|$cacheAlist|
        ((LAMBDA (|bfVar#104| |bfVar#103|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#104|)
                  (PROGN (SETQ |bfVar#103| (CAR |bfVar#104|)) NIL))
              (RETURN NIL))
             (#1='T
              (AND (CONSP |bfVar#103|)
                   (PROGN
                    (SETQ |a| (CAR |bfVar#103|))
                    (SETQ |b| (CDR |bfVar#103|))
                    #1#)
                   (PROGN
                    (SETQ |aPart| (|linearFormatName| |a|))
                    (SETQ |n| (|sayBrightlyLength| |aPart|))
                    (|sayBrightly|
                     (|concat| '|     | |aPart| '| |
                      (|fillerSpaces| (- 32 |n|) ".") '| | |b|))))))
            (SETQ |bfVar#104| (CDR |bfVar#104|))))
         |$cacheAlist| NIL)))
      (SAY '| |)
      (|sayBrightly|
       (APPEND (|bright| '| stream|)
               (CONS (|fillerSpaces| 29 ".")
                     (CONS '| | (CONS |$streamCount| NIL)))))))))
 
; nopiles l == nopilesSpad2Cmd l
 
(DEFUN |nopiles| (|l|) (PROG () (RETURN (|nopilesSpad2Cmd| |l|))))
 
; nopilesSpad2Cmd l ==
;     null l => setNopiles ("{")
;     #l > 1 =>
;        SAY "nopiles takes a single argument"
;     #l = 0 => setNopiles ("{")
;     l is [opt] =>
;        opt = 'brace => setNopiles ("{")
;        opt = 'parenthesis => setNopiles ("(")
;        SAY "nopiles only takes 'brace' or 'parenthesis' as an argument"
 
(DEFUN |nopilesSpad2Cmd| (|l|)
  (PROG (|opt|)
    (RETURN
     (COND ((NULL |l|) (|setNopiles| '{))
           ((< 1 (LENGTH |l|)) (SAY '|nopiles takes a single argument|))
           ((EQL (LENGTH |l|) 0) (|setNopiles| '{))
           ((AND (CONSP |l|) (EQ (CDR |l|) NIL)
                 (PROGN (SETQ |opt| (CAR |l|)) #1='T))
            (COND ((EQ |opt| '|brace|) (|setNopiles| '{))
                  ((EQ |opt| '|parenthesis|) (|setNopiles| '|(|))
                  (#1#
                   (SAY
                    '|nopiles only takes 'brace' or 'parenthesis' as an argument|))))))))
 
; pquit() == pquitSpad2Cmd()
 
(DEFUN |pquit| () (PROG () (RETURN (|pquitSpad2Cmd|))))
 
; pquitSpad2Cmd() ==
;   $quitCommandType :local := 'protected
;   quitSpad2Cmd()
 
(DEFUN |pquitSpad2Cmd| ()
  (PROG (|$quitCommandType|)
    (DECLARE (SPECIAL |$quitCommandType|))
    (RETURN (PROGN (SETQ |$quitCommandType| '|protected|) (|quitSpad2Cmd|)))))
 
; quit() == quitSpad2Cmd()
 
(DEFUN |quit| () (PROG () (RETURN (|quitSpad2Cmd|))))
 
; quitSpad2Cmd() ==
;   $quitCommandType ~= 'protected => leaveScratchpad()
;   x := UPCASE queryUserKeyedMsg("S2IZ0031",NIL)
;   MEMQ(STRING2ID_-N(x,1),'(Y YES)) => leaveScratchpad()
;   sayKeyedMsg("S2IZ0032",NIL)
;   terminateSystemCommand()
 
(DEFUN |quitSpad2Cmd| ()
  (PROG (|x|)
    (RETURN
     (COND ((NOT (EQ |$quitCommandType| '|protected|)) (|leaveScratchpad|))
           (#1='T
            (PROGN
             (SETQ |x| (UPCASE (|queryUserKeyedMsg| 'S2IZ0031 NIL)))
             (COND ((MEMQ (STRING2ID-N |x| 1) '(Y YES)) (|leaveScratchpad|))
                   (#1#
                    (PROGN
                     (|sayKeyedMsg| 'S2IZ0032 NIL)
                     (|terminateSystemCommand|))))))))))
 
; leaveScratchpad () == QUIT()
 
(DEFUN |leaveScratchpad| () (PROG () (RETURN (QUIT))))
 
; read l == readSpad2Cmd l
 
(DEFUN |read| (|l|) (PROG () (RETURN (|readSpad2Cmd| |l|))))
 
; readSpad2Cmd l ==
;   $InteractiveMode : local := true
;   quiet := nil
;   ifthere := nil
;   for [opt,:.] in $options repeat
;     fullopt := selectOptionLC(opt,'(quiet test ifthere),'optionError)
;     fullopt = 'ifthere => ifthere  := true
;     fullopt = 'quiet   => quiet := true
; 
;   if null(l) and (ef := $edit_file) and pathnameTypeId(ef) ~= 'SPAD then
;       l := pathname(ef)
;   else
;       l := pathname l
;   devFTs := '("input" "INPUT" "boot" "BOOT" "lisp" "LISP")
;   fileTypes :=
;     $UserLevel = 'interpreter => '("input" "INPUT")
;     $UserLevel = 'compiler    => '("input" "INPUT")
;     devFTs
;   ll := $FINDFILE (l, fileTypes)
;   if null ll then
;     ifthere => return nil    -- be quiet about it
;     throwKeyedMsg("S2IL0003",[namestring l])
;   ll := pathname ll
;   ft := pathnameType ll
;   upft := UPCASE ft
;   null member(upft,fileTypes) =>
;     fs := namestring l
;     member(upft,devFTs) => throwKeyedMsg("S2IZ0033",[fs])
;     throwKeyedMsg("S2IZ0034",[fs])
;   do_read(ll, quiet)
 
(DEFUN |readSpad2Cmd| (|l|)
  (PROG (|$InteractiveMode| |fs| |upft| |ft| |ll| |fileTypes| |devFTs| |ef|
         |fullopt| |opt| |ifthere| |quiet|)
    (DECLARE (SPECIAL |$InteractiveMode|))
    (RETURN
     (PROGN
      (SETQ |$InteractiveMode| T)
      (SETQ |quiet| NIL)
      (SETQ |ifthere| NIL)
      ((LAMBDA (|bfVar#106| |bfVar#105|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#106|)
                (PROGN (SETQ |bfVar#105| (CAR |bfVar#106|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#105|) (PROGN (SETQ |opt| (CAR |bfVar#105|)) #1#)
                 (PROGN
                  (SETQ |fullopt|
                          (|selectOptionLC| |opt| '(|quiet| |test| |ifthere|)
                           '|optionError|))
                  (COND ((EQ |fullopt| '|ifthere|) (SETQ |ifthere| T))
                        ((EQ |fullopt| '|quiet|) (SETQ |quiet| T)))))))
          (SETQ |bfVar#106| (CDR |bfVar#106|))))
       |$options| NIL)
      (COND
       ((AND (NULL |l|) (SETQ |ef| |$edit_file|)
             (NOT (EQ (|pathnameTypeId| |ef|) 'SPAD)))
        (SETQ |l| (|pathname| |ef|)))
       (#1# (SETQ |l| (|pathname| |l|))))
      (SETQ |devFTs| '("input" "INPUT" "boot" "BOOT" "lisp" "LISP"))
      (SETQ |fileTypes|
              (COND ((EQ |$UserLevel| '|interpreter|) '("input" "INPUT"))
                    ((EQ |$UserLevel| '|compiler|) '("input" "INPUT"))
                    (#1# |devFTs|)))
      (SETQ |ll| ($FINDFILE |l| |fileTypes|))
      (COND
       ((NULL |ll|)
        (COND (|ifthere| (RETURN NIL))
              (#1# (|throwKeyedMsg| 'S2IL0003 (LIST (|namestring| |l|)))))))
      (SETQ |ll| (|pathname| |ll|))
      (SETQ |ft| (|pathnameType| |ll|))
      (SETQ |upft| (UPCASE |ft|))
      (COND
       ((NULL (|member| |upft| |fileTypes|))
        (PROGN
         (SETQ |fs| (|namestring| |l|))
         (COND
          ((|member| |upft| |devFTs|) (|throwKeyedMsg| 'S2IZ0033 (LIST |fs|)))
          (#1# (|throwKeyedMsg| 'S2IZ0034 (LIST |fs|))))))
       (#1# (|do_read| |ll| |quiet|)))))))
 
; do_read(ll, quiet) ==
;     $edit_file := ll
;     read_or_compile(quiet, false)
;     terminateSystemCommand()
;     spadPrompt()
 
(DEFUN |do_read| (|ll| |quiet|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |$edit_file| |ll|)
      (|read_or_compile| |quiet| NIL)
      (|terminateSystemCommand|)
      (|spadPrompt|)))))
 
; read_or_compile(quiet, lib) ==
;     $LISPLIB : local := lib
;     input_file := make_input_filename($edit_file)
;     type := PATHNAME_-TYPE(input_file)
;     type = '"boot" =>
;         lfile := CONCAT(shoeRemovebootIfNec(input_file), '".clisp")
;         BOOTTOCLC(input_file, lfile)
;         LOAD(COMPILE_-FILE(lfile))
;     type = '"lisp" => LOAD(COMPILE_-FILE(input_file))
;     type = '"bbin" => LOAD(input_file)
;     type = '"input" => ncINTERPFILE(input_file, not(quiet))
;     spadCompile(input_file)
 
(DEFUN |read_or_compile| (|quiet| |lib|)
  (PROG ($LISPLIB |lfile| |type| |input_file|)
    (DECLARE (SPECIAL $LISPLIB))
    (RETURN
     (PROGN
      (SETQ $LISPLIB |lib|)
      (SETQ |input_file| (|make_input_filename| |$edit_file|))
      (SETQ |type| (PATHNAME-TYPE |input_file|))
      (COND
       ((EQUAL |type| "boot")
        (PROGN
         (SETQ |lfile| (CONCAT (|shoeRemovebootIfNec| |input_file|) ".clisp"))
         (BOOTTOCLC |input_file| |lfile|)
         (LOAD (COMPILE-FILE |lfile|))))
       ((EQUAL |type| "lisp") (LOAD (COMPILE-FILE |input_file|)))
       ((EQUAL |type| "bbin") (LOAD |input_file|))
       ((EQUAL |type| "input") (|ncINTERPFILE| |input_file| (NULL |quiet|)))
       ('T (|spadCompile| |input_file|)))))))
 
; savesystem l ==
;   #l ~= 1 or not(SYMBOLP first l) => helpSpad2Cmd '(savesystem)
;   SPAD_-SAVE SYMBOL_-NAME first l
 
(DEFUN |savesystem| (|l|)
  (PROG ()
    (RETURN
     (COND
      ((OR (NOT (EQL (LENGTH |l|) 1)) (NULL (SYMBOLP (CAR |l|))))
       (|helpSpad2Cmd| '(|savesystem|)))
      ('T (SPAD-SAVE (SYMBOL-NAME (CAR |l|))))))))
 
; show l == showSpad2Cmd l
 
(DEFUN |show| (|l|) (PROG () (RETURN (|showSpad2Cmd| |l|))))
 
; showSpad2Cmd l ==
;   l = [NIL] => helpSpad2Cmd '(show)
;   $showOptions : local := '(attributes operations)
;   if null $options then $options := '((operations))
;   $e : local := $InteractiveFrame
;   $env : local := $InteractiveFrame
;   l is [constr] =>
;     constr in '(Union Record Mapping) =>
;       constr = 'Record =>
;         sayKeyedMsg("S2IZ0044R",[constr, '")show Record(a: Integer, b: String)"])
;       constr = 'Mapping =>
;         sayKeyedMsg("S2IZ0044M",NIL)
;       sayKeyedMsg("S2IZ0045T",[constr, '")show Union(a: Integer, b: String)"])
;       sayKeyedMsg("S2IZ0045U",[constr, '")show Union(Integer, String)"])
;     constr is ['Mapping, :.] =>
;       sayKeyedMsg("S2IZ0044M",NIL)
;     reportOperations(constr,constr)
;   reportOperations(l,l)
 
(DEFUN |showSpad2Cmd| (|l|)
  (PROG (|$env| |$e| |$showOptions| |constr|)
    (DECLARE (SPECIAL |$env| |$e| |$showOptions|))
    (RETURN
     (COND ((EQUAL |l| (LIST NIL)) (|helpSpad2Cmd| '(|show|)))
           (#1='T
            (PROGN
             (SETQ |$showOptions| '(|attributes| |operations|))
             (COND ((NULL |$options|) (SETQ |$options| '((|operations|)))))
             (SETQ |$e| |$InteractiveFrame|)
             (SETQ |$env| |$InteractiveFrame|)
             (COND
              ((AND (CONSP |l|) (EQ (CDR |l|) NIL)
                    (PROGN (SETQ |constr| (CAR |l|)) #1#))
               (COND
                ((|member| |constr| '(|Union| |Record| |Mapping|))
                 (COND
                  ((EQ |constr| '|Record|)
                   (|sayKeyedMsg| 'S2IZ0044R
                    (LIST |constr| ")show Record(a: Integer, b: String)")))
                  ((EQ |constr| '|Mapping|) (|sayKeyedMsg| 'S2IZ0044M NIL))
                  (#1#
                   (PROGN
                    (|sayKeyedMsg| 'S2IZ0045T
                     (LIST |constr| ")show Union(a: Integer, b: String)"))
                    (|sayKeyedMsg| 'S2IZ0045U
                     (LIST |constr| ")show Union(Integer, String)"))))))
                ((AND (CONSP |constr|) (EQ (CAR |constr|) '|Mapping|))
                 (|sayKeyedMsg| 'S2IZ0044M NIL))
                (#1# (|reportOperations| |constr| |constr|))))
              (#1# (|reportOperations| |l| |l|)))))))))
 
; reportOperations(oldArg,u) ==
;   -- u might be an uppercased version of oldArg
;   $env:local := [[NIL]]
;   $eval:local := true           --generate code-- don't just type analyze
;   $genValue:local := true       --evaluate all generated code
;   null u => nil
;   $doNotAddEmptyModeIfTrue: local:= true
;   u = $quadSymbol =>
;      sayBrightly ['"   mode denotes", :bright '"any", "type"]
;   u = "%" =>
;     sayKeyedMsg("S2IZ0063",NIL)
;     sayKeyedMsg("S2IZ0064",NIL)
;   u isnt ['Record,:.] and u isnt ['Union,:.] and
;     null(isNameOfType u) and u isnt ['typeOf,.] =>
;       if ATOM oldArg then oldArg := [oldArg]
;       sayKeyedMsg("S2IZ0063",NIL)
;       for op in oldArg repeat
;         sayKeyedMsg("S2IZ0062",[opOf op])
;   (v := isDomainValuedVariable u) =>  reportOpsFromUnitDirectly0 v
;   unitForm:=
;     atom u => opOf unabbrev u
;     unabbrev u
;   atom unitForm => reportOpsFromLisplib0(unitForm,u)
;   unitForm' := evaluateType unitForm
;   tree := mkAtree removeZeroOneDestructively unitForm
;   (unitForm' := isType tree) => reportOpsFromUnitDirectly0 unitForm'
;   sayKeyedMsg("S2IZ0041",[unitForm])
 
(DEFUN |reportOperations| (|oldArg| |u|)
  (PROG (|$doNotAddEmptyModeIfTrue| |$genValue| |$eval| |$env| |tree|
         |unitForm'| |unitForm| |v| |ISTMP#1|)
    (DECLARE (SPECIAL |$doNotAddEmptyModeIfTrue| |$genValue| |$eval| |$env|))
    (RETURN
     (PROGN
      (SETQ |$env| (LIST (LIST NIL)))
      (SETQ |$eval| T)
      (SETQ |$genValue| T)
      (COND ((NULL |u|) NIL)
            (#1='T
             (PROGN
              (SETQ |$doNotAddEmptyModeIfTrue| T)
              (COND
               ((EQUAL |u| |$quadSymbol|)
                (|sayBrightly|
                 (CONS "   mode denotes"
                       (APPEND (|bright| "any") (CONS '|type| NIL)))))
               ((EQ |u| '%)
                (PROGN
                 (|sayKeyedMsg| 'S2IZ0063 NIL)
                 (|sayKeyedMsg| 'S2IZ0064 NIL)))
               ((AND (NOT (AND (CONSP |u|) (EQ (CAR |u|) '|Record|)))
                     (NOT (AND (CONSP |u|) (EQ (CAR |u|) '|Union|)))
                     (NULL (|isNameOfType| |u|))
                     (NOT
                      (AND (CONSP |u|) (EQ (CAR |u|) '|typeOf|)
                           (PROGN
                            (SETQ |ISTMP#1| (CDR |u|))
                            (AND (CONSP |ISTMP#1|)
                                 (EQ (CDR |ISTMP#1|) NIL))))))
                (PROGN
                 (COND ((ATOM |oldArg|) (SETQ |oldArg| (LIST |oldArg|))))
                 (|sayKeyedMsg| 'S2IZ0063 NIL)
                 ((LAMBDA (|bfVar#107| |op|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#107|)
                           (PROGN (SETQ |op| (CAR |bfVar#107|)) NIL))
                       (RETURN NIL))
                      (#1# (|sayKeyedMsg| 'S2IZ0062 (LIST (|opOf| |op|)))))
                     (SETQ |bfVar#107| (CDR |bfVar#107|))))
                  |oldArg| NIL)))
               ((SETQ |v| (|isDomainValuedVariable| |u|))
                (|reportOpsFromUnitDirectly0| |v|))
               (#1#
                (PROGN
                 (SETQ |unitForm|
                         (COND ((ATOM |u|) (|opOf| (|unabbrev| |u|)))
                               (#1# (|unabbrev| |u|))))
                 (COND
                  ((ATOM |unitForm|) (|reportOpsFromLisplib0| |unitForm| |u|))
                  (#1#
                   (PROGN
                    (SETQ |unitForm'| (|evaluateType| |unitForm|))
                    (SETQ |tree|
                            (|mkAtree|
                             (|removeZeroOneDestructively| |unitForm|)))
                    (COND
                     ((SETQ |unitForm'| (|isType| |tree|))
                      (|reportOpsFromUnitDirectly0| |unitForm'|))
                     (#1#
                      (|sayKeyedMsg| 'S2IZ0041 (LIST |unitForm|)))))))))))))))))
 
; reportOpsFromUnitDirectly0 D ==
;   $useEditorForShowOutput =>
;     reportOpsFromUnitDirectly1 D
;   reportOpsFromUnitDirectly D
 
(DEFUN |reportOpsFromUnitDirectly0| (D)
  (PROG ()
    (RETURN
     (COND (|$useEditorForShowOutput| (|reportOpsFromUnitDirectly1| D))
           ('T (|reportOpsFromUnitDirectly| D))))))
 
; reportOpsFromUnitDirectly1 D ==
;   showFile := pathname ['SHOW,'LISTING]
;   _$ERASE showFile
;   $sayBrightlyStream : fluid := MAKE_-OUTSTREAM(showFile)
;   sayShowWarning()
;   reportOpsFromUnitDirectly D
;   SHUT $sayBrightlyStream
;   editFile showFile
 
(DEFUN |reportOpsFromUnitDirectly1| (D)
  (PROG (|$sayBrightlyStream| |showFile|)
    (DECLARE (SPECIAL |$sayBrightlyStream|))
    (RETURN
     (PROGN
      (SETQ |showFile| (|pathname| (LIST 'SHOW 'LISTING)))
      ($ERASE |showFile|)
      (SETQ |$sayBrightlyStream| (MAKE-OUTSTREAM |showFile|))
      (|sayShowWarning|)
      (|reportOpsFromUnitDirectly| D)
      (SHUT |$sayBrightlyStream|)
      (|editFile| |showFile|)))))
 
; sayShowWarning() ==
;   sayBrightly
;     '"Warning: this is a temporary file and will be deleted the next"
;   sayBrightly
;     '"         time you use )show. Rename it and FILE if you wish to"
;   sayBrightly
;     '"         save the contents."
;   sayBrightly '""
 
(DEFUN |sayShowWarning| ()
  (PROG ()
    (RETURN
     (PROGN
      (|sayBrightly|
       "Warning: this is a temporary file and will be deleted the next")
      (|sayBrightly|
       "         time you use )show. Rename it and FILE if you wish to")
      (|sayBrightly| "         save the contents.")
      (|sayBrightly| "")))))
 
; reportOpsFromLisplib0(unitForm,u)  ==
;   $useEditorForShowOutput => reportOpsFromLisplib1(unitForm,u)
;   reportOpsFromLisplib(unitForm,u)
 
(DEFUN |reportOpsFromLisplib0| (|unitForm| |u|)
  (PROG ()
    (RETURN
     (COND (|$useEditorForShowOutput| (|reportOpsFromLisplib1| |unitForm| |u|))
           ('T (|reportOpsFromLisplib| |unitForm| |u|))))))
 
; reportOpsFromLisplib1(unitForm,u)  ==
;   showFile := pathname ['SHOW,'LISTING]
;   _$ERASE showFile
;   $sayBrightlyStream : fluid := MAKE_-OUTSTREAM (showFile)
;   sayShowWarning()
;   reportOpsFromLisplib(unitForm,u)
;   SHUT $sayBrightlyStream
;   editFile showFile
 
(DEFUN |reportOpsFromLisplib1| (|unitForm| |u|)
  (PROG (|$sayBrightlyStream| |showFile|)
    (DECLARE (SPECIAL |$sayBrightlyStream|))
    (RETURN
     (PROGN
      (SETQ |showFile| (|pathname| (LIST 'SHOW 'LISTING)))
      ($ERASE |showFile|)
      (SETQ |$sayBrightlyStream| (MAKE-OUTSTREAM |showFile|))
      (|sayShowWarning|)
      (|reportOpsFromLisplib| |unitForm| |u|)
      (SHUT |$sayBrightlyStream|)
      (|editFile| |showFile|)))))
 
; reportOpsFromUnitDirectly unitForm ==
;   isRecordOrUnion := unitForm is [a,:.] and a in '(Record Union)
;   unit:= evalDomain unitForm
;   top := first unitForm
;   kind:= GETDATABASE(top,'CONSTRUCTORKIND)
; 
;   sayBrightly concat('%b,formatOpType unitForm,
;     '%d,'"is a",'%b,kind,'%d, '"constructor.")
;   if not isRecordOrUnion then
;     abb := GETDATABASE(top,'ABBREVIATION)
;     sourceFile := GETDATABASE(top,'SOURCEFILE)
;     sayBrightly ['" Abbreviation for",:bright top,'"is",:bright abb]
;     verb :=
;       isExposedConstructor top => '"is"
;       '"is not"
;     sayBrightly ['" This constructor",:bright verb,
;       '"exposed in this frame."]
;     -- -- Disabled because the path is wrong.
;     -- sayBrightly ['" Issue",:bright STRCONC('")edit ",
;     --  namestring sourceFile),'"to see algebra source code for",
;     --    :bright abb,'%l]
; 
;   for [opt] in $options repeat
;     opt := selectOptionLC(opt,$showOptions,'optionError)
;     opt = 'attributes =>
;       centerAndHighlight('"Attributes",$LINELENGTH,specialChar 'hbar)
;       isRecordOrUnion =>
;         sayBrightly '"   Records and Unions have no attributes."
;       sayBrightly '""
;       attList:= REMDUP MSORT [x for [x,:.] in unit.2]
;       say2PerLine [formatAttribute x for x in attList]
;       NIL
;     opt = 'operations =>
;       $commentedOps: local := 0
;       --new form is (<op> <signature> <slotNumber> <condition> <kind>)
;       centerAndHighlight('"Operations",$LINELENGTH,specialChar 'hbar)
;       sayBrightly '""
;       if isRecordOrUnion
;         then
;           constructorFunction:= GETL(top,"makeFunctionList") or
;             systemErrorHere '"reportOpsFromUnitDirectly"
;           [funlist,.]:= FUNCALL(constructorFunction,"$",unitForm,
;             $CategoryFrame)
;           sigList := REMDUP MSORT [[[a,b],true,[c,0,1]] for
;             [a,b,c] in funlist]
;         else
;           sigList:= REMDUP MSORT getOplistForConstructorForm unitForm
;       say2PerLine [formatOperation(x,unit) for x in sigList]
;       if $commentedOps ~= 0 then
;         sayBrightly
;           ['"Functions that are not yet implemented are preceded by",
;             :bright '"--"]
;       sayBrightly '""
;   NIL
 
(DEFUN |reportOpsFromUnitDirectly| (|unitForm|)
  (PROG (|$commentedOps| |sigList| |c| |ISTMP#2| |b| |ISTMP#1| |funlist|
         |LETTMP#1| |constructorFunction| |attList| |x| |opt| |verb|
         |sourceFile| |abb| |kind| |top| |unit| |isRecordOrUnion| |a|)
    (DECLARE (SPECIAL |$commentedOps|))
    (RETURN
     (PROGN
      (SETQ |isRecordOrUnion|
              (AND (CONSP |unitForm|) (PROGN (SETQ |a| (CAR |unitForm|)) #1='T)
                   (|member| |a| '(|Record| |Union|))))
      (SETQ |unit| (|evalDomain| |unitForm|))
      (SETQ |top| (CAR |unitForm|))
      (SETQ |kind| (GETDATABASE |top| 'CONSTRUCTORKIND))
      (|sayBrightly|
       (|concat| '|%b| (|formatOpType| |unitForm|) '|%d| "is a" '|%b| |kind|
        '|%d| "constructor."))
      (COND
       ((NULL |isRecordOrUnion|) (SETQ |abb| (GETDATABASE |top| 'ABBREVIATION))
        (SETQ |sourceFile| (GETDATABASE |top| 'SOURCEFILE))
        (|sayBrightly|
         (CONS " Abbreviation for"
               (APPEND (|bright| |top|) (CONS "is" (|bright| |abb|)))))
        (SETQ |verb|
                (COND ((|isExposedConstructor| |top|) "is") (#1# "is not")))
        (|sayBrightly|
         (CONS " This constructor"
               (APPEND (|bright| |verb|)
                       (CONS "exposed in this frame." NIL))))))
      ((LAMBDA (|bfVar#109| |bfVar#108|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#109|)
                (PROGN (SETQ |bfVar#108| (CAR |bfVar#109|)) NIL))
            (RETURN NIL))
           (#1#
            (AND (CONSP |bfVar#108|) (EQ (CDR |bfVar#108|) NIL)
                 (PROGN (SETQ |opt| (CAR |bfVar#108|)) #1#)
                 (PROGN
                  (SETQ |opt|
                          (|selectOptionLC| |opt| |$showOptions|
                           '|optionError|))
                  (COND
                   ((EQ |opt| '|attributes|)
                    (PROGN
                     (|centerAndHighlight| "Attributes" $LINELENGTH
                      (|specialChar| '|hbar|))
                     (COND
                      (|isRecordOrUnion|
                       (|sayBrightly|
                        "   Records and Unions have no attributes."))
                      (#1#
                       (PROGN
                        (|sayBrightly| "")
                        (SETQ |attList|
                                (REMDUP
                                 (MSORT
                                  ((LAMBDA
                                       (|bfVar#112| |bfVar#111| |bfVar#110|)
                                     (LOOP
                                      (COND
                                       ((OR (ATOM |bfVar#111|)
                                            (PROGN
                                             (SETQ |bfVar#110|
                                                     (CAR |bfVar#111|))
                                             NIL))
                                        (RETURN (NREVERSE |bfVar#112|)))
                                       (#1#
                                        (AND (CONSP |bfVar#110|)
                                             (PROGN
                                              (SETQ |x| (CAR |bfVar#110|))
                                              #1#)
                                             (SETQ |bfVar#112|
                                                     (CONS |x| |bfVar#112|)))))
                                      (SETQ |bfVar#111| (CDR |bfVar#111|))))
                                   NIL (ELT |unit| 2) NIL))))
                        (|say2PerLine|
                         ((LAMBDA (|bfVar#114| |bfVar#113| |x|)
                            (LOOP
                             (COND
                              ((OR (ATOM |bfVar#113|)
                                   (PROGN (SETQ |x| (CAR |bfVar#113|)) NIL))
                               (RETURN (NREVERSE |bfVar#114|)))
                              (#1#
                               (SETQ |bfVar#114|
                                       (CONS (|formatAttribute| |x|)
                                             |bfVar#114|))))
                             (SETQ |bfVar#113| (CDR |bfVar#113|))))
                          NIL |attList| NIL))
                        NIL)))))
                   ((EQ |opt| '|operations|)
                    (PROGN
                     (SETQ |$commentedOps| 0)
                     (|centerAndHighlight| "Operations" $LINELENGTH
                      (|specialChar| '|hbar|))
                     (|sayBrightly| "")
                     (COND
                      (|isRecordOrUnion|
                       (SETQ |constructorFunction|
                               (OR (GETL |top| '|makeFunctionList|)
                                   (|systemErrorHere|
                                    "reportOpsFromUnitDirectly")))
                       (SETQ |LETTMP#1|
                               (FUNCALL |constructorFunction| '$ |unitForm|
                                        |$CategoryFrame|))
                       (SETQ |funlist| (CAR |LETTMP#1|))
                       (SETQ |sigList|
                               (REMDUP
                                (MSORT
                                 ((LAMBDA (|bfVar#117| |bfVar#116| |bfVar#115|)
                                    (LOOP
                                     (COND
                                      ((OR (ATOM |bfVar#116|)
                                           (PROGN
                                            (SETQ |bfVar#115|
                                                    (CAR |bfVar#116|))
                                            NIL))
                                       (RETURN (NREVERSE |bfVar#117|)))
                                      (#1#
                                       (AND (CONSP |bfVar#115|)
                                            (PROGN
                                             (SETQ |a| (CAR |bfVar#115|))
                                             (SETQ |ISTMP#1| (CDR |bfVar#115|))
                                             (AND (CONSP |ISTMP#1|)
                                                  (PROGN
                                                   (SETQ |b| (CAR |ISTMP#1|))
                                                   (SETQ |ISTMP#2|
                                                           (CDR |ISTMP#1|))
                                                   (AND (CONSP |ISTMP#2|)
                                                        (EQ (CDR |ISTMP#2|)
                                                            NIL)
                                                        (PROGN
                                                         (SETQ |c|
                                                                 (CAR
                                                                  |ISTMP#2|))
                                                         #1#)))))
                                            (SETQ |bfVar#117|
                                                    (CONS
                                                     (LIST (LIST |a| |b|) T
                                                           (LIST |c| 0 1))
                                                     |bfVar#117|)))))
                                     (SETQ |bfVar#116| (CDR |bfVar#116|))))
                                  NIL |funlist| NIL)))))
                      (#1#
                       (SETQ |sigList|
                               (REMDUP
                                (MSORT
                                 (|getOplistForConstructorForm|
                                  |unitForm|))))))
                     (|say2PerLine|
                      ((LAMBDA (|bfVar#119| |bfVar#118| |x|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#118|)
                                (PROGN (SETQ |x| (CAR |bfVar#118|)) NIL))
                            (RETURN (NREVERSE |bfVar#119|)))
                           (#1#
                            (SETQ |bfVar#119|
                                    (CONS (|formatOperation| |x| |unit|)
                                          |bfVar#119|))))
                          (SETQ |bfVar#118| (CDR |bfVar#118|))))
                       NIL |sigList| NIL))
                     (COND
                      ((NOT (EQL |$commentedOps| 0))
                       (|sayBrightly|
                        (CONS
                         "Functions that are not yet implemented are preceded by"
                         (|bright| "--")))))
                     (|sayBrightly| ""))))))))
          (SETQ |bfVar#109| (CDR |bfVar#109|))))
       |$options| NIL)
      NIL))))
 
; reportOpsFromLisplib(op,u) ==
;   null(fn:= constructor? op) => sayKeyedMsg("S2IZ0054",[u])
;   argml :=
;     (s := getConstructorSignature op) => IFCDR s
;     NIL
;   typ:= GETDATABASE(op,'CONSTRUCTORKIND)
;   nArgs:= #argml
;   argList := IFCDR GETDATABASE(op, 'CONSTRUCTORFORM)
;   functorForm:= [op,:argList]
;   argml:= EQSUBSTLIST(argList,$FormalMapVariableList,argml)
;   functorFormWithDecl:= [op,:[[":",a,m] for a in argList for m in argml]]
;   sayBrightly concat(bright form2StringWithWhere functorFormWithDecl,
;                      '" is a",bright typ,'"constructor")
;   sayBrightly ['" Abbreviation for",:bright op,'"is",:bright fn]
;   verb :=
;     isExposedConstructor op => '"is"
;     '"is not"
;   sayBrightly ['" This constructor",:bright verb,
;     '"exposed in this frame."]
;   sourceFile := GETDATABASE(op,'SOURCEFILE)
;   -- -- Disabled because the path is wrong.
;   -- sayBrightly ['" Issue",:bright STRCONC('")edit ",
;   --  namestring sourceFile),
;   --    '"to see algebra source code for",:bright fn,'%l]
; 
;   for [opt] in $options repeat
;     opt := selectOptionLC(opt,$showOptions,'optionError)
;     opt = 'layout =>
;       dc1 fn
;     opt = 'views => sayBrightly ['"To get",:bright '"views",
;       '"you must give parameters of constructor"]
;     opt = 'operations => displayOperationsFromLisplib functorForm
;     nil
 
(DEFUN |reportOpsFromLisplib| (|op| |u|)
  (PROG (|fn| |s| |argml| |typ| |nArgs| |argList| |functorForm|
         |functorFormWithDecl| |verb| |sourceFile| |opt|)
    (RETURN
     (COND
      ((NULL (SETQ |fn| (|constructor?| |op|)))
       (|sayKeyedMsg| 'S2IZ0054 (LIST |u|)))
      (#1='T
       (PROGN
        (SETQ |argml|
                (COND ((SETQ |s| (|getConstructorSignature| |op|)) (IFCDR |s|))
                      (#1# NIL)))
        (SETQ |typ| (GETDATABASE |op| 'CONSTRUCTORKIND))
        (SETQ |nArgs| (LENGTH |argml|))
        (SETQ |argList| (IFCDR (GETDATABASE |op| 'CONSTRUCTORFORM)))
        (SETQ |functorForm| (CONS |op| |argList|))
        (SETQ |argml| (EQSUBSTLIST |argList| |$FormalMapVariableList| |argml|))
        (SETQ |functorFormWithDecl|
                (CONS |op|
                      ((LAMBDA (|bfVar#122| |bfVar#120| |a| |bfVar#121| |m|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#120|)
                                (PROGN (SETQ |a| (CAR |bfVar#120|)) NIL)
                                (ATOM |bfVar#121|)
                                (PROGN (SETQ |m| (CAR |bfVar#121|)) NIL))
                            (RETURN (NREVERSE |bfVar#122|)))
                           (#1#
                            (SETQ |bfVar#122|
                                    (CONS (LIST '|:| |a| |m|) |bfVar#122|))))
                          (SETQ |bfVar#120| (CDR |bfVar#120|))
                          (SETQ |bfVar#121| (CDR |bfVar#121|))))
                       NIL |argList| NIL |argml| NIL)))
        (|sayBrightly|
         (|concat| (|bright| (|form2StringWithWhere| |functorFormWithDecl|))
          " is a" (|bright| |typ|) "constructor"))
        (|sayBrightly|
         (CONS " Abbreviation for"
               (APPEND (|bright| |op|) (CONS "is" (|bright| |fn|)))))
        (SETQ |verb|
                (COND ((|isExposedConstructor| |op|) "is") (#1# "is not")))
        (|sayBrightly|
         (CONS " This constructor"
               (APPEND (|bright| |verb|) (CONS "exposed in this frame." NIL))))
        (SETQ |sourceFile| (GETDATABASE |op| 'SOURCEFILE))
        ((LAMBDA (|bfVar#124| |bfVar#123|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#124|)
                  (PROGN (SETQ |bfVar#123| (CAR |bfVar#124|)) NIL))
              (RETURN NIL))
             (#1#
              (AND (CONSP |bfVar#123|) (EQ (CDR |bfVar#123|) NIL)
                   (PROGN (SETQ |opt| (CAR |bfVar#123|)) #1#)
                   (PROGN
                    (SETQ |opt|
                            (|selectOptionLC| |opt| |$showOptions|
                             '|optionError|))
                    (COND ((EQ |opt| '|layout|) (|dc1| |fn|))
                          ((EQ |opt| '|views|)
                           (|sayBrightly|
                            (CONS "To get"
                                  (APPEND (|bright| "views")
                                          (CONS
                                           "you must give parameters of constructor"
                                           NIL)))))
                          ((EQ |opt| '|operations|)
                           (|displayOperationsFromLisplib| |functorForm|))
                          (#1# NIL))))))
            (SETQ |bfVar#124| (CDR |bfVar#124|))))
         |$options| NIL)))))))
 
; displayOperationsFromLisplib form ==
;   [name,:argl] := form
;   kind := GETDATABASE(name,'CONSTRUCTORKIND)
;   centerAndHighlight('"Operations",$LINELENGTH,specialChar 'hbar)
;   opList:= GETDATABASE(name,'OPERATIONALIST)
;   null opList => reportOpsFromUnitDirectly form
;   opl:=REMDUP MSORT EQSUBSTLIST(argl,$FormalMapVariableList,opList)
;   ops:= nil
;   for x in opl repeat
;     ops := [:ops,:formatOperationAlistEntry(x)]
;   say2PerLine ops
;   nil
 
(DEFUN |displayOperationsFromLisplib| (|form|)
  (PROG (|name| |argl| |kind| |opList| |opl| |ops|)
    (RETURN
     (PROGN
      (SETQ |name| (CAR |form|))
      (SETQ |argl| (CDR |form|))
      (SETQ |kind| (GETDATABASE |name| 'CONSTRUCTORKIND))
      (|centerAndHighlight| "Operations" $LINELENGTH (|specialChar| '|hbar|))
      (SETQ |opList| (GETDATABASE |name| 'OPERATIONALIST))
      (COND ((NULL |opList|) (|reportOpsFromUnitDirectly| |form|))
            (#1='T
             (PROGN
              (SETQ |opl|
                      (REMDUP
                       (MSORT
                        (EQSUBSTLIST |argl| |$FormalMapVariableList|
                         |opList|))))
              (SETQ |ops| NIL)
              ((LAMBDA (|bfVar#125| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#125|)
                        (PROGN (SETQ |x| (CAR |bfVar#125|)) NIL))
                    (RETURN NIL))
                   (#1#
                    (SETQ |ops|
                            (APPEND |ops| (|formatOperationAlistEntry| |x|)))))
                  (SETQ |bfVar#125| (CDR |bfVar#125|))))
               |opl| NIL)
              (|say2PerLine| |ops|)
              NIL)))))))
 
; spool(filename) ==
;     null(filename) =>
;         DRIBBLE()
;         TERPRI()
;         reset_highlight()
;     filename := first(filename)
;     if SYMBOLP(filename) then filename := SYMBOL_-NAME(filename)
;     PROBE_-FILE(filename) =>
;         ERROR(FORMAT(nil, '"file ~a already exists", filename))
;     DRIBBLE(filename)
;     TERPRI()
;     clear_highlight()
 
(DEFUN |spool| (|filename|)
  (PROG ()
    (RETURN
     (COND ((NULL |filename|) (PROGN (DRIBBLE) (TERPRI) (|reset_highlight|)))
           (#1='T
            (PROGN
             (SETQ |filename| (CAR |filename|))
             (COND
              ((SYMBOLP |filename|)
               (SETQ |filename| (SYMBOL-NAME |filename|))))
             (COND
              ((PROBE-FILE |filename|)
               (ERROR (FORMAT NIL "file ~a already exists" |filename|)))
              (#1#
               (PROGN (DRIBBLE |filename|) (TERPRI) (|clear_highlight|))))))))))
 
; synonym(:l) == synonymSpad2Cmd()  -- always passed a null list
 
(DEFUN |synonym| (&REST |l|) (PROG () (RETURN (|synonymSpad2Cmd|))))
 
; synonymSpad2Cmd() ==
;   line := getSystemCommandLine()
;   if line = '"" then printSynonyms(NIL)
;   else
;     pair := processSynonymLine line
;     if $CommandSynonymAlist then
;       PUTALIST($CommandSynonymAlist, first pair, rest pair)
;     else $CommandSynonymAlist := [pair]
;   terminateSystemCommand()
 
(DEFUN |synonymSpad2Cmd| ()
  (PROG (|pair| |line|)
    (RETURN
     (PROGN
      (SETQ |line| (|getSystemCommandLine|))
      (COND ((EQUAL |line| "") (|printSynonyms| NIL))
            (#1='T (SETQ |pair| (|processSynonymLine| |line|))
             (COND
              (|$CommandSynonymAlist|
               (PUTALIST |$CommandSynonymAlist| (CAR |pair|) (CDR |pair|)))
              (#1# (SETQ |$CommandSynonymAlist| (LIST |pair|))))))
      (|terminateSystemCommand|)))))
 
; processSynonymLine line ==
;   key := STRING2ID_-N (line, 1)
;   value := removeKeyFromLine line where
;     removeKeyFromLine line ==
;       line := dropLeadingBlanks line
;       mx := MAXINDEX line
;       for i in 0..mx repeat
;         line.i = " " =>
;           return (for j in (i+1)..mx repeat
;             line.j ~= " " => return (SUBSTRING (line, j, nil)))
;   [key, :value]
 
(DEFUN |processSynonymLine| (|line|)
  (PROG (|key| |value|)
    (RETURN
     (PROGN
      (SETQ |key| (STRING2ID-N |line| 1))
      (SETQ |value| (|processSynonymLine,removeKeyFromLine| |line|))
      (CONS |key| |value|)))))
(DEFUN |processSynonymLine,removeKeyFromLine| (|line|)
  (PROG (|mx|)
    (RETURN
     (PROGN
      (SETQ |line| (|dropLeadingBlanks| |line|))
      (SETQ |mx| (MAXINDEX |line|))
      ((LAMBDA (|i|)
         (LOOP
          (COND ((> |i| |mx|) (RETURN NIL))
                (#1='T
                 (COND
                  ((EQ (ELT |line| |i|) '| |)
                   (IDENTITY
                    (RETURN
                     ((LAMBDA (|j|)
                        (LOOP
                         (COND ((> |j| |mx|) (RETURN NIL))
                               (#1#
                                (COND
                                 ((NOT (EQ (ELT |line| |j|) '| |))
                                  (IDENTITY
                                   (RETURN (SUBSTRING |line| |j| NIL)))))))
                         (SETQ |j| (+ |j| 1))))
                      (+ |i| 1))))))))
          (SETQ |i| (+ |i| 1))))
       0)))))
 
; $undoFlag := true     --Default setting for undo is "on"
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$undoFlag| T))
 
; undo(l) ==
; --undo takes one option ")redo" which simply reads "redo.input",
; --  a file created by every normal )undo command (see below)
;   undoWhen := 'after
;   if $options is [[key]] then
;     stringPrefix?(s := PNAME key,'"redo") =>
;       $options := nil           --clear $options so that "read" won't see them
;       read '(redo_.input)
;     not stringPrefix?(s,'"before") =>
;        userError '"only option to undo is _")redo_""
;     undoWhen := 'before
;   n :=
;     null l => -1
;     first l
;   if IDENTP n then
;     n := PARSE_-INTEGER PNAME n
;     if not FIXP n then userError '"undo argument must be an integer"
;   $InteractiveFrame := undoSteps(undoCount n,undoWhen)
;   nil
 
(DEFUN |undo| (|l|)
  (PROG (|undoWhen| |ISTMP#1| |key| |s| |n|)
    (RETURN
     (PROGN
      (SETQ |undoWhen| '|after|)
      (COND
       ((AND (CONSP |$options|) (EQ (CDR |$options|) NIL)
             (PROGN
              (SETQ |ISTMP#1| (CAR |$options|))
              (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                   (PROGN (SETQ |key| (CAR |ISTMP#1|)) #1='T))))
        (COND
         ((|stringPrefix?| (SETQ |s| (PNAME |key|)) "redo")
          (PROGN (SETQ |$options| NIL) (|read| '(|redo.input|))))
         ((NULL (|stringPrefix?| |s| "before"))
          (|userError| "only option to undo is \")redo\""))
         (#1# (SETQ |undoWhen| '|before|)))))
      (SETQ |n| (COND ((NULL |l|) (- 1)) (#1# (CAR |l|))))
      (COND
       ((IDENTP |n|) (SETQ |n| (PARSE-INTEGER (PNAME |n|)))
        (COND
         ((NULL (FIXP |n|))
          (|userError| "undo argument must be an integer")))))
      (SETQ |$InteractiveFrame| (|undoSteps| (|undoCount| |n|) |undoWhen|))
      NIL))))
 
; recordFrame(systemNormal) ==
;   null $undoFlag => nil        --do nothing if facility is turned off
;   currentAlist := IFCAR $frameRecord
;   delta := diffAlist(CAAR $InteractiveFrame,$previousBindings)
;   if systemNormal = 'system then
;     null delta => return nil     --do not record
;     delta := ['systemCommand,:delta]
;   $frameRecord := [delta,:$frameRecord]
;   $previousBindings := --copy all but the individual properties
;       [CONS(first x, [CONS(first y, rest y) for y in rest x]) for x
;         in CAAR $InteractiveFrame]
;   first $frameRecord
 
(DEFUN |recordFrame| (|systemNormal|)
  (PROG (|currentAlist| |delta|)
    (RETURN
     (COND ((NULL |$undoFlag|) NIL)
           (#1='T
            (PROGN
             (SETQ |currentAlist| (IFCAR |$frameRecord|))
             (SETQ |delta|
                     (|diffAlist| (CAAR |$InteractiveFrame|)
                      |$previousBindings|))
             (COND
              ((EQ |systemNormal| '|system|)
               (COND ((NULL |delta|) (RETURN NIL))
                     (#1# (SETQ |delta| (CONS '|systemCommand| |delta|))))))
             (SETQ |$frameRecord| (CONS |delta| |$frameRecord|))
             (SETQ |$previousBindings|
                     ((LAMBDA (|bfVar#129| |bfVar#128| |x|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#128|)
                               (PROGN (SETQ |x| (CAR |bfVar#128|)) NIL))
                           (RETURN (NREVERSE |bfVar#129|)))
                          (#1#
                           (SETQ |bfVar#129|
                                   (CONS
                                    (CONS (CAR |x|)
                                          ((LAMBDA
                                               (|bfVar#127| |bfVar#126| |y|)
                                             (LOOP
                                              (COND
                                               ((OR (ATOM |bfVar#126|)
                                                    (PROGN
                                                     (SETQ |y|
                                                             (CAR |bfVar#126|))
                                                     NIL))
                                                (RETURN
                                                 (NREVERSE |bfVar#127|)))
                                               (#1#
                                                (SETQ |bfVar#127|
                                                        (CONS
                                                         (CONS (CAR |y|)
                                                               (CDR |y|))
                                                         |bfVar#127|))))
                                              (SETQ |bfVar#126|
                                                      (CDR |bfVar#126|))))
                                           NIL (CDR |x|) NIL))
                                    |bfVar#129|))))
                         (SETQ |bfVar#128| (CDR |bfVar#128|))))
                      NIL (CAAR |$InteractiveFrame|) NIL))
             (CAR |$frameRecord|)))))))
 
; diffAlist(new,old) ==
; --record only those properties which are different
;   for (pair := [name,:proplist]) in new repeat
;     -- name has an entry both in new and old world
;     -- (1) if the old world had no proplist for that variable, then
;     --     record NIL as the value of each new property
;     -- (2) if the old world does have a proplist for that variable, then
;     --     a) for each property with a value: give the old value
;     --     b) for each property missing:      give NIL as the old value
;     oldPair := ASSQ(name,old) =>
;       null (oldProplist := rest oldPair) =>
;       --record old values of new properties as NIL
;         acc := [[name,:[[prop] for [prop,:.] in proplist]],:acc]
;       deltas := nil
;       for (propval := [prop,:val]) in proplist repeat
;         null (oldPropval := assoc(prop,oldProplist)) => --missing property
;           deltas := [[prop],:deltas]
;         EQ(rest oldPropval, val) => 'skip
;         deltas := [oldPropval,:deltas]
;       deltas => acc := [[name,:NREVERSE deltas],:acc]
;     acc := [[name,:[[prop] for [prop,:.] in proplist]],:acc]
; --record properties absent on new list (say, from a )cl all)
;   for (oldPair := [name,:r]) in old repeat
;     r and null QLASSQ(name, new) =>
;       acc := [oldPair,:acc]
;     -- name has an entry both in new and old world
;     -- (1) if the new world has no proplist for that variable
;     --     (a) if the old world does, record the old proplist
;     --     (b) if the old world does not, record nothing
;     -- (2) if the new world has a proplist for that variable, it has
;     --     been handled by the first loop.
;   res := NREVERSE acc
;   if BOUNDP '$reportUndo and $reportUndo then reportUndo res
;   res
 
(DEFUN |diffAlist| (|new| |old|)
  (PROG (|name| |proplist| |oldPair| |oldProplist| |prop| |acc| |deltas| |val|
         |oldPropval| |r| |res|)
    (RETURN
     (PROGN
      ((LAMBDA (|bfVar#130| |pair|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#130|) (PROGN (SETQ |pair| (CAR |bfVar#130|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |pair|)
                 (PROGN
                  (SETQ |name| (CAR |pair|))
                  (SETQ |proplist| (CDR |pair|))
                  #1#)
                 (COND
                  ((SETQ |oldPair| (ASSQ |name| |old|))
                   (COND
                    ((NULL (SETQ |oldProplist| (CDR |oldPair|)))
                     (SETQ |acc|
                             (CONS
                              (CONS |name|
                                    ((LAMBDA
                                         (|bfVar#133| |bfVar#132| |bfVar#131|)
                                       (LOOP
                                        (COND
                                         ((OR (ATOM |bfVar#132|)
                                              (PROGN
                                               (SETQ |bfVar#131|
                                                       (CAR |bfVar#132|))
                                               NIL))
                                          (RETURN (NREVERSE |bfVar#133|)))
                                         (#1#
                                          (AND (CONSP |bfVar#131|)
                                               (PROGN
                                                (SETQ |prop| (CAR |bfVar#131|))
                                                #1#)
                                               (SETQ |bfVar#133|
                                                       (CONS (LIST |prop|)
                                                             |bfVar#133|)))))
                                        (SETQ |bfVar#132| (CDR |bfVar#132|))))
                                     NIL |proplist| NIL))
                              |acc|)))
                    (#1#
                     (PROGN
                      (SETQ |deltas| NIL)
                      ((LAMBDA (|bfVar#134| |propval|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#134|)
                                (PROGN (SETQ |propval| (CAR |bfVar#134|)) NIL))
                            (RETURN NIL))
                           (#1#
                            (AND (CONSP |propval|)
                                 (PROGN
                                  (SETQ |prop| (CAR |propval|))
                                  (SETQ |val| (CDR |propval|))
                                  #1#)
                                 (COND
                                  ((NULL
                                    (SETQ |oldPropval|
                                            (|assoc| |prop| |oldProplist|)))
                                   (SETQ |deltas|
                                           (CONS (LIST |prop|) |deltas|)))
                                  ((EQ (CDR |oldPropval|) |val|) '|skip|)
                                  (#1#
                                   (SETQ |deltas|
                                           (CONS |oldPropval| |deltas|)))))))
                          (SETQ |bfVar#134| (CDR |bfVar#134|))))
                       |proplist| NIL)
                      (COND
                       (|deltas|
                        (SETQ |acc|
                                (CONS (CONS |name| (NREVERSE |deltas|))
                                      |acc|))))))))
                  (#1#
                   (SETQ |acc|
                           (CONS
                            (CONS |name|
                                  ((LAMBDA
                                       (|bfVar#137| |bfVar#136| |bfVar#135|)
                                     (LOOP
                                      (COND
                                       ((OR (ATOM |bfVar#136|)
                                            (PROGN
                                             (SETQ |bfVar#135|
                                                     (CAR |bfVar#136|))
                                             NIL))
                                        (RETURN (NREVERSE |bfVar#137|)))
                                       (#1#
                                        (AND (CONSP |bfVar#135|)
                                             (PROGN
                                              (SETQ |prop| (CAR |bfVar#135|))
                                              #1#)
                                             (SETQ |bfVar#137|
                                                     (CONS (LIST |prop|)
                                                           |bfVar#137|)))))
                                      (SETQ |bfVar#136| (CDR |bfVar#136|))))
                                   NIL |proplist| NIL))
                            |acc|)))))))
          (SETQ |bfVar#130| (CDR |bfVar#130|))))
       |new| NIL)
      ((LAMBDA (|bfVar#138| |oldPair|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#138|)
                (PROGN (SETQ |oldPair| (CAR |bfVar#138|)) NIL))
            (RETURN NIL))
           (#1#
            (AND (CONSP |oldPair|)
                 (PROGN
                  (SETQ |name| (CAR |oldPair|))
                  (SETQ |r| (CDR |oldPair|))
                  #1#)
                 (COND
                  ((AND |r| (NULL (QLASSQ |name| |new|)))
                   (IDENTITY (SETQ |acc| (CONS |oldPair| |acc|))))))))
          (SETQ |bfVar#138| (CDR |bfVar#138|))))
       |old| NIL)
      (SETQ |res| (NREVERSE |acc|))
      (COND ((AND (BOUNDP '|$reportUndo|) |$reportUndo|) (|reportUndo| |res|)))
      |res|))))
 
; reportUndo acc ==
;   for [name,:proplist] in acc repeat
;     sayBrightly STRCONC("Properties of ",PNAME name,'" ::")
;     curproplist := LASSOC(name,CAAR $InteractiveFrame)
;     for [prop,:value] in proplist repeat
;       sayBrightlyNT ['"  ",prop,'" was: "]
;       pp value
;       sayBrightlyNT ['"  ",prop,'" is:  "]
;       pp LASSOC(prop,curproplist)
 
(DEFUN |reportUndo| (|acc|)
  (PROG (|name| |proplist| |curproplist| |prop| |value|)
    (RETURN
     ((LAMBDA (|bfVar#140| |bfVar#139|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#140|)
               (PROGN (SETQ |bfVar#139| (CAR |bfVar#140|)) NIL))
           (RETURN NIL))
          (#1='T
           (AND (CONSP |bfVar#139|)
                (PROGN
                 (SETQ |name| (CAR |bfVar#139|))
                 (SETQ |proplist| (CDR |bfVar#139|))
                 #1#)
                (PROGN
                 (|sayBrightly|
                  (STRCONC '|Properties of | (PNAME |name|) " ::"))
                 (SETQ |curproplist|
                         (LASSOC |name| (CAAR |$InteractiveFrame|)))
                 ((LAMBDA (|bfVar#142| |bfVar#141|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#142|)
                           (PROGN (SETQ |bfVar#141| (CAR |bfVar#142|)) NIL))
                       (RETURN NIL))
                      (#1#
                       (AND (CONSP |bfVar#141|)
                            (PROGN
                             (SETQ |prop| (CAR |bfVar#141|))
                             (SETQ |value| (CDR |bfVar#141|))
                             #1#)
                            (PROGN
                             (|sayBrightlyNT| (LIST "  " |prop| " was: "))
                             (|pp| |value|)
                             (|sayBrightlyNT| (LIST "  " |prop| " is:  "))
                             (|pp| (LASSOC |prop| |curproplist|))))))
                     (SETQ |bfVar#142| (CDR |bfVar#142|))))
                  |proplist| NIL)))))
         (SETQ |bfVar#140| (CDR |bfVar#140|))))
      |acc| NIL))))
 
; clearFrame() ==
;   clearCmdAll()
;   $frameRecord := nil
;   $previousBindings := nil
 
(DEFUN |clearFrame| ()
  (PROG ()
    (RETURN
     (PROGN
      (|clearCmdAll|)
      (SETQ |$frameRecord| NIL)
      (SETQ |$previousBindings| NIL)))))
 
; undoCount(n) ==  --computes the number of undo's, given $IOindex
; --pp ["IOindex = ",$IOindex]
;   m :=
;     n >= 0 => $IOindex - n - 1
;     -n
;   m >= $IOindex => userError STRCONC('"Magnitude of undo argument must be less than step number (",STRINGIMAGE $IOindex,'").")
;   m
 
(DEFUN |undoCount| (|n|)
  (PROG (|m|)
    (RETURN
     (PROGN
      (SETQ |m|
              (COND ((NOT (MINUSP |n|)) (- (- |$IOindex| |n|) 1))
                    (#1='T (- |n|))))
      (COND
       ((NOT (< |m| |$IOindex|))
        (|userError|
         (STRCONC "Magnitude of undo argument must be less than step number ("
          (STRINGIMAGE |$IOindex|) ").")))
       (#1# |m|))))))
 
; undoSteps(m,beforeOrAfter) ==
; -- undoes m previous commands; if )before option, then undo one extra at end
; --Example: if $IOindex now is 6 and m = 2 then general layout of $frameRecord,
; --  after the call to recordFrame below will be:
; --  (<change for systemcommands>
; --  (<change for #5> <change for system commands>
; --  (<change for #4> <change for system commands>
; --  (<change for #3> <change for system commands>
; --   <change for #2> <change for system commands>
; --   <change for #1> <change for system commands>) where system
; --  command entries are optional and identified by (systemCommand . change).
; --  For a ")undo 3 )after", m = 2 and undoStep swill restore the environment
; --  up to, but not including <change for #3>.
; --  An "undo 3 )before" will additionally restore <change for #3>.
; --  Thus, the later requires one extra undo at the end.
;   writeInputLines('redo,$IOindex - m)
;   recordFrame('normal)  --do NOT mark this as a system command change
;                        --do this undo FIRST (i=0 case)
;   env := COPY CAAR $InteractiveFrame
;   for i in 0..m for framelist in tails $frameRecord repeat
;     env := undoSingleStep(first framelist,env)
;     framelist is [.,['systemCommand,:systemDelta],:.] =>
; --     pp '"===============> AHA <============="
;        framelist := rest framelist             --undoing system commands given
;        env := undoSingleStep(systemDelta,env)  --  before command line
;     lastTailSeen := framelist
;   if beforeOrAfter = 'before then  --do one additional undo for )before
;     env := undoSingleStep(first rest lastTailSeen,env)
;   $frameRecord := rest $frameRecord --flush the effect of extra recordFrame
;   $InteractiveFrame := LIST LIST env
 
(DEFUN |undoSteps| (|m| |beforeOrAfter|)
  (PROG (|env| |ISTMP#1| |ISTMP#2| |systemDelta| |lastTailSeen|)
    (RETURN
     (PROGN
      (|writeInputLines| '|redo| (- |$IOindex| |m|))
      (|recordFrame| '|normal|)
      (SETQ |env| (COPY (CAAR |$InteractiveFrame|)))
      ((LAMBDA (|i| |framelist|)
         (LOOP
          (COND ((OR (> |i| |m|) (ATOM |framelist|)) (RETURN NIL))
                (#1='T
                 (PROGN
                  (SETQ |env| (|undoSingleStep| (CAR |framelist|) |env|))
                  (COND
                   ((AND (CONSP |framelist|)
                         (PROGN
                          (SETQ |ISTMP#1| (CDR |framelist|))
                          (AND (CONSP |ISTMP#1|)
                               (PROGN
                                (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                                (AND (CONSP |ISTMP#2|)
                                     (EQ (CAR |ISTMP#2|) '|systemCommand|)
                                     (PROGN
                                      (SETQ |systemDelta| (CDR |ISTMP#2|))
                                      #1#))))))
                    (PROGN
                     (SETQ |framelist| (CDR |framelist|))
                     (SETQ |env| (|undoSingleStep| |systemDelta| |env|))))
                   (#1# (SETQ |lastTailSeen| |framelist|))))))
          (SETQ |i| (+ |i| 1))
          (SETQ |framelist| (CDR |framelist|))))
       0 |$frameRecord|)
      (COND
       ((EQ |beforeOrAfter| '|before|)
        (SETQ |env| (|undoSingleStep| (CAR (CDR |lastTailSeen|)) |env|))))
      (SETQ |$frameRecord| (CDR |$frameRecord|))
      (SETQ |$InteractiveFrame| (LIST (LIST |env|)))))))
 
; undoSingleStep(changes,env) ==
; --Each change is a name-proplist pair. For each change:
; --  (1) if there exists a proplist in env, then for each prop-value change:
; --      (a) if the prop exists in env, RPLAC in the change value
; --      (b) otherwise, CONS it onto the front of prop-values for that name
; --  (2) add change to the front of env
; --  pp '"----Undoing 1 step--------"
; --  pp changes
;   for (change := [name,:changeList]) in changes repeat
;     if LASSOC('localModemap,changeList) then
;       changeList := undoLocalModemapHack changeList
;     pairlist := ASSQ(name,env) =>
;       proplist := rest pairlist =>
;         for (pair := [prop,:value]) in changeList repeat
;           node := ASSQ(prop,proplist) => RPLACD(node,value)
;           RPLACD(proplist, [first proplist, :rest proplist])
;           RPLACA(proplist,pair)
;       RPLACD(pairlist,changeList)
;     env := [change,:env]
;   env
 
(DEFUN |undoSingleStep| (|changes| |env|)
  (PROG (|name| |changeList| |pairlist| |proplist| |prop| |value| |node|)
    (RETURN
     (PROGN
      ((LAMBDA (|bfVar#143| |change|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#143|)
                (PROGN (SETQ |change| (CAR |bfVar#143|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |change|)
                 (PROGN
                  (SETQ |name| (CAR |change|))
                  (SETQ |changeList| (CDR |change|))
                  #1#)
                 (PROGN
                  (COND
                   ((LASSOC '|localModemap| |changeList|)
                    (SETQ |changeList| (|undoLocalModemapHack| |changeList|))))
                  (COND
                   ((SETQ |pairlist| (ASSQ |name| |env|))
                    (COND
                     ((SETQ |proplist| (CDR |pairlist|))
                      ((LAMBDA (|bfVar#144| |pair|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#144|)
                                (PROGN (SETQ |pair| (CAR |bfVar#144|)) NIL))
                            (RETURN NIL))
                           (#1#
                            (AND (CONSP |pair|)
                                 (PROGN
                                  (SETQ |prop| (CAR |pair|))
                                  (SETQ |value| (CDR |pair|))
                                  #1#)
                                 (COND
                                  ((SETQ |node| (ASSQ |prop| |proplist|))
                                   (RPLACD |node| |value|))
                                  (#1#
                                   (PROGN
                                    (RPLACD |proplist|
                                            (CONS (CAR |proplist|)
                                                  (CDR |proplist|)))
                                    (RPLACA |proplist| |pair|)))))))
                          (SETQ |bfVar#144| (CDR |bfVar#144|))))
                       |changeList| NIL))
                     (#1# (RPLACD |pairlist| |changeList|))))
                   (#1# (SETQ |env| (CONS |change| |env|))))))))
          (SETQ |bfVar#143| (CDR |bfVar#143|))))
       |changes| NIL)
      |env|))))
 
; undoLocalModemapHack changeList ==
;   [newPair for (pair := [name,:value]) in changeList | newPair] where newPair  ==
;      name = 'localModemap => [name]
;      pair
 
(DEFUN |undoLocalModemapHack| (|changeList|)
  (PROG (|name| |value|)
    (RETURN
     ((LAMBDA (|bfVar#146| |bfVar#145| |pair|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#145|) (PROGN (SETQ |pair| (CAR |bfVar#145|)) NIL))
           (RETURN (NREVERSE |bfVar#146|)))
          (#1='T
           (AND (CONSP |pair|)
                (PROGN
                 (SETQ |name| (CAR |pair|))
                 (SETQ |value| (CDR |pair|))
                 #1#)
                #2=(COND ((EQ |name| '|localModemap|) (LIST |name|))
                         (#1# |pair|))
                (SETQ |bfVar#146| (CONS #2# |bfVar#146|)))))
         (SETQ |bfVar#145| (CDR |bfVar#145|))))
      NIL |changeList| NIL))))
 
; removeUndoLines u == --called by writeInputLines
;   xtra :=
;     STRINGP $currentLine => [$currentLine]
;     REVERSE $currentLine
;   xtra := [x for x in xtra | not stringPrefix?('")history",x)]
;   u := [:u, :xtra]
;   not (or/[stringPrefix?('")undo",x) for x in u])  => u
;   --(1) reverse the list
;   --(2) walk down the (reversed) list: when >n appears remove:
;   --    (a) system commands
;   --    (b) if n > 0: (replace n by n-1; remove a command; repeat (a-b))
;   savedIOindex := $IOindex  --save value
;   $IOindex := 1
;   for y in tails u repeat
;     (x := first y).0 = char '_) =>
;       stringPrefix?('")undo",s := trimString x) => --parse "undo )option"
;         s1 := trimString SUBSTRING(s,5,nil)
;         if s1 ~= '")redo" then
;           m := charPosition(char '_),s1,0)
;           code :=
;             m < MAXINDEX s1 => s1.(m + 1)
;             char 'a
;           s2 := trimString SUBSTRING(s1,0,m)
;         n :=
;            s1 = '")redo" => 0
;            s2 ~= '"" => undoCount PARSE_-INTEGER s2
;            -1
;         RPLACA(y,CONCAT('">",code,STRINGIMAGE n))
;       nil
;     $IOindex := $IOindex + 1   --referenced by undoCount
;   acc := nil
;   for y in tails NREVERSE u repeat
;     (x := first y).0 = char '_> =>
;       code := x . 1                                 --code = a,b, or r
;       n := PARSE_-INTEGER SUBSTRING(x,2,nil)        --n = number of undo steps
;       y := rest y                                   --kill >n line
;       while y repeat
;         c := first y
;         c.0 = char '_) or c.0 = char '_> => y := rest y  --kill system commands
;         n = 0 => return nil                              --including undos
;         n := n - 1
;         y := rest y                                 --kill command
;       y and code~= char 'b => acc := [c,:acc]       --add last unless )before
;     acc := [x,:acc]
;   $IOindex := savedIOindex
;   acc
 
(DEFUN |removeUndoLines| (|u|)
  (PROG (|xtra| |savedIOindex| |x| |s| |s1| |m| |code| |s2| |n| |acc| |c|)
    (RETURN
     (PROGN
      (SETQ |xtra|
              (COND ((STRINGP |$currentLine|) (LIST |$currentLine|))
                    (#1='T (REVERSE |$currentLine|))))
      (SETQ |xtra|
              ((LAMBDA (|bfVar#148| |bfVar#147| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#147|)
                        (PROGN (SETQ |x| (CAR |bfVar#147|)) NIL))
                    (RETURN (NREVERSE |bfVar#148|)))
                   (#1#
                    (AND (NULL (|stringPrefix?| ")history" |x|))
                         (SETQ |bfVar#148| (CONS |x| |bfVar#148|)))))
                  (SETQ |bfVar#147| (CDR |bfVar#147|))))
               NIL |xtra| NIL))
      (SETQ |u| (APPEND |u| |xtra|))
      (COND
       ((NULL
         ((LAMBDA (|bfVar#150| |bfVar#149| |x|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#149|) (PROGN (SETQ |x| (CAR |bfVar#149|)) NIL))
               (RETURN |bfVar#150|))
              (#1#
               (PROGN
                (SETQ |bfVar#150| (|stringPrefix?| ")undo" |x|))
                (COND (|bfVar#150| (RETURN |bfVar#150|))))))
             (SETQ |bfVar#149| (CDR |bfVar#149|))))
          NIL |u| NIL))
        |u|)
       (#1#
        (PROGN
         (SETQ |savedIOindex| |$IOindex|)
         (SETQ |$IOindex| 1)
         ((LAMBDA (|y|)
            (LOOP
             (COND ((ATOM |y|) (RETURN NIL))
                   (#1#
                    (COND
                     ((EQUAL (ELT (SETQ |x| (CAR |y|)) 0) (|char| '|)|))
                      (COND
                       ((|stringPrefix?| ")undo" (SETQ |s| (|trimString| |x|)))
                        (PROGN
                         (SETQ |s1| (|trimString| (SUBSTRING |s| 5 NIL)))
                         (COND
                          ((NOT (EQUAL |s1| ")redo"))
                           (SETQ |m| (|charPosition| (|char| '|)|) |s1| 0))
                           (SETQ |code|
                                   (COND
                                    ((< |m| (MAXINDEX |s1|))
                                     (ELT |s1| (+ |m| 1)))
                                    (#1# (|char| '|a|))))
                           (SETQ |s2| (|trimString| (SUBSTRING |s1| 0 |m|)))))
                         (SETQ |n|
                                 (COND ((EQUAL |s1| ")redo") 0)
                                       ((NOT (EQUAL |s2| ""))
                                        (|undoCount| (PARSE-INTEGER |s2|)))
                                       (#1# (- 1))))
                         (RPLACA |y| (CONCAT ">" |code| (STRINGIMAGE |n|)))))
                       (#1# NIL)))
                     (#1# (SETQ |$IOindex| (+ |$IOindex| 1))))))
             (SETQ |y| (CDR |y|))))
          |u|)
         (SETQ |acc| NIL)
         ((LAMBDA (|y|)
            (LOOP
             (COND ((ATOM |y|) (RETURN NIL))
                   (#1#
                    (COND
                     ((EQUAL (ELT (SETQ |x| (CAR |y|)) 0) (|char| '>))
                      (PROGN
                       (SETQ |code| (ELT |x| 1))
                       (SETQ |n| (PARSE-INTEGER (SUBSTRING |x| 2 NIL)))
                       (SETQ |y| (CDR |y|))
                       ((LAMBDA ()
                          (LOOP
                           (COND ((NOT |y|) (RETURN NIL))
                                 (#1#
                                  (PROGN
                                   (SETQ |c| (CAR |y|))
                                   (COND
                                    ((OR (EQUAL (ELT |c| 0) (|char| '|)|))
                                         (EQUAL (ELT |c| 0) (|char| '>)))
                                     (SETQ |y| (CDR |y|)))
                                    ((EQL |n| 0) (RETURN NIL))
                                    (#1#
                                     (PROGN
                                      (SETQ |n| (- |n| 1))
                                      (SETQ |y| (CDR |y|)))))))))))
                       (COND
                        ((AND |y| (NOT (EQUAL |code| (|char| '|b|))))
                         (SETQ |acc| (CONS |c| |acc|))))))
                     (#1# (SETQ |acc| (CONS |x| |acc|))))))
             (SETQ |y| (CDR |y|))))
          (NREVERSE |u|))
         (SETQ |$IOindex| |savedIOindex|)
         |acc|)))))))
 
; what l == whatSpad2Cmd l
 
(DEFUN |what| (|l|) (PROG () (RETURN (|whatSpad2Cmd| |l|))))
 
; whatSpad2Cmd l ==
;   $e:local := $EmptyEnvironment
;   null l => reportWhatOptions()
;   [key0,:args] := l
;   key := selectOptionLC(key0,$whatOptions,nil)
;   null key => sayKeyedMsg("S2IZ0043",NIL)
;   args := [fixpat p for p in args] where
;     fixpat x ==
;       x is [x',:.] => DOWNCASE x'
;       DOWNCASE x
;   key = 'things =>
;     for opt in $whatOptions repeat
;       not MEMQ(opt,'(things)) => whatSpad2Cmd [opt,:args]
;   key = 'categories =>
;     filterAndFormatConstructors('category,'"Categories",args)
;   key = 'commands =>
;     whatCommands(args)
;   key = 'domains =>
;     filterAndFormatConstructors('domain,'"Domains",args)
;   key = 'operations =>
;     apropos args
;   key = 'packages =>
;     filterAndFormatConstructors('package,'"Packages",args)
;   key = 'synonyms =>
;     printSynonyms(args)
 
(DEFUN |whatSpad2Cmd| (|l|)
  (PROG (|$e| |key| |args| |key0|)
    (DECLARE (SPECIAL |$e|))
    (RETURN
     (PROGN
      (SETQ |$e| |$EmptyEnvironment|)
      (COND ((NULL |l|) (|reportWhatOptions|))
            (#1='T
             (PROGN
              (SETQ |key0| (CAR |l|))
              (SETQ |args| (CDR |l|))
              (SETQ |key| (|selectOptionLC| |key0| |$whatOptions| NIL))
              (COND ((NULL |key|) (|sayKeyedMsg| 'S2IZ0043 NIL))
                    (#1#
                     (PROGN
                      (SETQ |args|
                              ((LAMBDA (|bfVar#152| |bfVar#151| |p|)
                                 (LOOP
                                  (COND
                                   ((OR (ATOM |bfVar#151|)
                                        (PROGN
                                         (SETQ |p| (CAR |bfVar#151|))
                                         NIL))
                                    (RETURN (NREVERSE |bfVar#152|)))
                                   (#1#
                                    (SETQ |bfVar#152|
                                            (CONS (|whatSpad2Cmd,fixpat| |p|)
                                                  |bfVar#152|))))
                                  (SETQ |bfVar#151| (CDR |bfVar#151|))))
                               NIL |args| NIL))
                      (COND
                       ((EQ |key| '|things|)
                        ((LAMBDA (|bfVar#153| |opt|)
                           (LOOP
                            (COND
                             ((OR (ATOM |bfVar#153|)
                                  (PROGN (SETQ |opt| (CAR |bfVar#153|)) NIL))
                              (RETURN NIL))
                             (#1#
                              (COND
                               ((NULL (MEMQ |opt| '(|things|)))
                                (IDENTITY
                                 (|whatSpad2Cmd| (CONS |opt| |args|)))))))
                            (SETQ |bfVar#153| (CDR |bfVar#153|))))
                         |$whatOptions| NIL))
                       ((EQ |key| '|categories|)
                        (|filterAndFormatConstructors| '|category| "Categories"
                         |args|))
                       ((EQ |key| '|commands|) (|whatCommands| |args|))
                       ((EQ |key| '|domains|)
                        (|filterAndFormatConstructors| '|domain| "Domains"
                         |args|))
                       ((EQ |key| '|operations|) (|apropos| |args|))
                       ((EQ |key| '|packages|)
                        (|filterAndFormatConstructors| '|package| "Packages"
                         |args|))
                       ((EQ |key| '|synonyms|)
                        (|printSynonyms| |args|)))))))))))))
(DEFUN |whatSpad2Cmd,fixpat| (|x|)
  (PROG (|x'|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (PROGN (SETQ |x'| (CAR |x|)) #1='T)) (DOWNCASE |x'|))
      (#1# (DOWNCASE |x|))))))
 
; filterAndFormatConstructors(constrType,label,patterns) ==
;   centerAndHighlight(label,$LINELENGTH,specialChar 'hbar)
;   l := filterListOfStringsWithFn(patterns,whatConstructors constrType,
;         function rest)
;   if patterns then
;     null l =>
;       sayMessage ['"   No ",label,'" with names matching patterns:",
;         '%l,'"   ",'%b,:blankList patterns,'%d]
;     sayMessage [label,'" with names matching patterns:",
;       '%l,'"   ",'%b,:blankList patterns,'%d]
;   l => pp2Cols l
 
(DEFUN |filterAndFormatConstructors| (|constrType| |label| |patterns|)
  (PROG (|l|)
    (RETURN
     (PROGN
      (|centerAndHighlight| |label| $LINELENGTH (|specialChar| '|hbar|))
      (SETQ |l|
              (|filterListOfStringsWithFn| |patterns|
               (|whatConstructors| |constrType|) #'CDR))
      (COND
       (|patterns|
        (COND
         ((NULL |l|)
          (|sayMessage|
           (CONS "   No "
                 (CONS |label|
                       (CONS " with names matching patterns:"
                             (CONS '|%l|
                                   (CONS "   "
                                         (CONS '|%b|
                                               (APPEND (|blankList| |patterns|)
                                                       (CONS '|%d|
                                                             NIL))))))))))
         ('T
          (|sayMessage|
           (CONS |label|
                 (CONS " with names matching patterns:"
                       (CONS '|%l|
                             (CONS "   "
                                   (CONS '|%b|
                                         (APPEND (|blankList| |patterns|)
                                                 (CONS '|%d| NIL))))))))))))
      (COND (|l| (|pp2Cols| |l|)))))))
 
; whatConstructors constrType ==
;   -- here constrType should be one of 'category, 'domain, 'package
;   MSORT [CONS(GETDATABASE(con,'ABBREVIATION), STRING(con))
;     for con in allConstructors()
;       | GETDATABASE(con,'CONSTRUCTORKIND) = constrType]
 
(DEFUN |whatConstructors| (|constrType|)
  (PROG ()
    (RETURN
     (MSORT
      ((LAMBDA (|bfVar#155| |bfVar#154| |con|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#154|) (PROGN (SETQ |con| (CAR |bfVar#154|)) NIL))
            (RETURN (NREVERSE |bfVar#155|)))
           ('T
            (AND (EQUAL (GETDATABASE |con| 'CONSTRUCTORKIND) |constrType|)
                 (SETQ |bfVar#155|
                         (CONS
                          (CONS (GETDATABASE |con| 'ABBREVIATION)
                                (STRING |con|))
                          |bfVar#155|)))))
          (SETQ |bfVar#154| (CDR |bfVar#154|))))
       NIL (|allConstructors|) NIL)))))
 
; apropos l ==
;   -- l is a list of operation name fragments
;   -- this displays all operation names containing these fragments
;   ops :=
;     null l => allOperations()
;     filterListOfStrings([(DOWNCASE STRINGIMAGE p) for p in l],allOperations())
;   ops =>
;     sayMessage '"Operations whose names satisfy the above pattern(s):"
;     sayAsManyPerLineAsPossible MSORT ops
;     sayKeyedMsg("S2IF0011",[first ops])
;   sayMessage '"   There are no operations containing those patterns"
;   NIL
 
(DEFUN |apropos| (|l|)
  (PROG (|ops|)
    (RETURN
     (PROGN
      (SETQ |ops|
              (COND ((NULL |l|) (|allOperations|))
                    (#1='T
                     (|filterListOfStrings|
                      ((LAMBDA (|bfVar#157| |bfVar#156| |p|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#156|)
                                (PROGN (SETQ |p| (CAR |bfVar#156|)) NIL))
                            (RETURN (NREVERSE |bfVar#157|)))
                           (#1#
                            (SETQ |bfVar#157|
                                    (CONS (DOWNCASE (STRINGIMAGE |p|))
                                          |bfVar#157|))))
                          (SETQ |bfVar#156| (CDR |bfVar#156|))))
                       NIL |l| NIL)
                      (|allOperations|)))))
      (COND
       (|ops|
        (PROGN
         (|sayMessage| "Operations whose names satisfy the above pattern(s):")
         (|sayAsManyPerLineAsPossible| (MSORT |ops|))
         (|sayKeyedMsg| 'S2IF0011 (LIST (CAR |ops|)))))
       (#1#
        (PROGN
         (|sayMessage| "   There are no operations containing those patterns")
         NIL)))))))
 
; printSynonyms(patterns) ==
;   centerAndHighlight("System Command Synonyms",$LINELENGTH,specialChar 'hbar)
;   ls := filterListOfStringsWithFn(patterns, [[STRINGIMAGE a,:b]
;     for [a,:b] in synonymsForUserLevel $CommandSynonymAlist],
;       function first)
;   printLabelledList(ls,'"user",'"synonyms",'")",patterns)
;   nil
 
(DEFUN |printSynonyms| (|patterns|)
  (PROG (|a| |b| |ls|)
    (RETURN
     (PROGN
      (|centerAndHighlight| '|System Command Synonyms| $LINELENGTH
       (|specialChar| '|hbar|))
      (SETQ |ls|
              (|filterListOfStringsWithFn| |patterns|
               ((LAMBDA (|bfVar#160| |bfVar#159| |bfVar#158|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#159|)
                         (PROGN (SETQ |bfVar#158| (CAR |bfVar#159|)) NIL))
                     (RETURN (NREVERSE |bfVar#160|)))
                    (#1='T
                     (AND (CONSP |bfVar#158|)
                          (PROGN
                           (SETQ |a| (CAR |bfVar#158|))
                           (SETQ |b| (CDR |bfVar#158|))
                           #1#)
                          (SETQ |bfVar#160|
                                  (CONS (CONS (STRINGIMAGE |a|) |b|)
                                        |bfVar#160|)))))
                   (SETQ |bfVar#159| (CDR |bfVar#159|))))
                NIL (|synonymsForUserLevel| |$CommandSynonymAlist|) NIL)
               #'CAR))
      (|printLabelledList| |ls| "user" "synonyms" ")" |patterns|)
      NIL))))
 
; printLabelledList(ls,label1,label2,prefix,patterns) ==
;   -- prefix goes before each element on each side of the list, eg,
;   --   ")"
;   null ls =>
;     null patterns =>
;       sayMessage ['"   No ",label1,'"-defined ",label2,'" in effect."]
;     sayMessage ['"   No ",label1,'"-defined ",label2,'" satisfying patterns:",
;      '%l,'"     ",'%b,:blankList patterns,'%d]
;   if patterns then
;     sayMessage [label1,'"-defined ",label2,'" satisfying patterns:",
;      '%l,'"   ",'%b,:blankList patterns,'%d]
;   for [syn,:comm] in ls repeat
;     if SUBSTRING(syn,0,1) = '"|" then syn := SUBSTRING(syn,1,NIL)
;     if syn = '"%i" then syn := '"%i "
;     wid := MAX(30 - (entryWidth syn),1)
;     sayBrightly concat('%b,prefix,syn,'%d,
;       fillerSpaces(wid,'"."),'" ",prefix,comm)
;   sayBrightly '""
 
(DEFUN |printLabelledList| (|ls| |label1| |label2| |prefix| |patterns|)
  (PROG (|syn| |comm| |wid|)
    (RETURN
     (COND
      ((NULL |ls|)
       (COND
        ((NULL |patterns|)
         (|sayMessage|
          (LIST "   No " |label1| "-defined " |label2| " in effect.")))
        (#1='T
         (|sayMessage|
          (CONS "   No "
                (CONS |label1|
                      (CONS "-defined "
                            (CONS |label2|
                                  (CONS " satisfying patterns:"
                                        (CONS '|%l|
                                              (CONS "     "
                                                    (CONS '|%b|
                                                          (APPEND
                                                           (|blankList|
                                                            |patterns|)
                                                           (CONS '|%d|
                                                                 NIL))))))))))))))
      (#1#
       (PROGN
        (COND
         (|patterns|
          (|sayMessage|
           (CONS |label1|
                 (CONS "-defined "
                       (CONS |label2|
                             (CONS " satisfying patterns:"
                                   (CONS '|%l|
                                         (CONS "   "
                                               (CONS '|%b|
                                                     (APPEND
                                                      (|blankList| |patterns|)
                                                      (CONS '|%d|
                                                            NIL))))))))))))
        ((LAMBDA (|bfVar#162| |bfVar#161|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#162|)
                  (PROGN (SETQ |bfVar#161| (CAR |bfVar#162|)) NIL))
              (RETURN NIL))
             (#1#
              (AND (CONSP |bfVar#161|)
                   (PROGN
                    (SETQ |syn| (CAR |bfVar#161|))
                    (SETQ |comm| (CDR |bfVar#161|))
                    #1#)
                   (PROGN
                    (COND
                     ((EQUAL (SUBSTRING |syn| 0 1) "|")
                      (SETQ |syn| (SUBSTRING |syn| 1 NIL))))
                    (COND ((EQUAL |syn| "%i") (SETQ |syn| "%i ")))
                    (SETQ |wid| (MAX (- 30 (|entryWidth| |syn|)) 1))
                    (|sayBrightly|
                     (|concat| '|%b| |prefix| |syn| '|%d|
                      (|fillerSpaces| |wid| ".") " " |prefix| |comm|))))))
            (SETQ |bfVar#162| (CDR |bfVar#162|))))
         |ls| NIL)
        (|sayBrightly| "")))))))
 
; whatCommands(patterns) ==
;   label := STRCONC("System Commands for User Level: ",
;     STRINGIMAGE $UserLevel)
;   centerAndHighlight(label,$LINELENGTH,specialChar 'hbar)
;   l := filterListOfStrings(patterns,
;     [(STRINGIMAGE a) for a in commandsForUserLevel $systemCommands])
;   if patterns then
;     null l =>
;       sayMessage ['"No system commands at this level matching patterns:",
;         '%l,'"   ",'%b,:blankList patterns,'%d]
;     sayMessage ['"System commands at this level matching patterns:",
;       '%l,'"   ",'%b,:blankList patterns,'%d]
;   if l then
;     sayAsManyPerLineAsPossible l
;     SAY " "
;   patterns => nil  -- don't be so verbose
;   sayKeyedMsg("S2IZ0046",NIL)
;   nil
 
(DEFUN |whatCommands| (|patterns|)
  (PROG (|label| |l|)
    (RETURN
     (PROGN
      (SETQ |label|
              (STRCONC '|System Commands for User Level: |
               (STRINGIMAGE |$UserLevel|)))
      (|centerAndHighlight| |label| $LINELENGTH (|specialChar| '|hbar|))
      (SETQ |l|
              (|filterListOfStrings| |patterns|
               ((LAMBDA (|bfVar#164| |bfVar#163| |a|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#163|)
                         (PROGN (SETQ |a| (CAR |bfVar#163|)) NIL))
                     (RETURN (NREVERSE |bfVar#164|)))
                    (#1='T
                     (SETQ |bfVar#164| (CONS (STRINGIMAGE |a|) |bfVar#164|))))
                   (SETQ |bfVar#163| (CDR |bfVar#163|))))
                NIL (|commandsForUserLevel| |$systemCommands|) NIL)))
      (COND
       (|patterns|
        (COND
         ((NULL |l|)
          (|sayMessage|
           (CONS "No system commands at this level matching patterns:"
                 (CONS '|%l|
                       (CONS "   "
                             (CONS '|%b|
                                   (APPEND (|blankList| |patterns|)
                                           (CONS '|%d| NIL))))))))
         (#1#
          (|sayMessage|
           (CONS "System commands at this level matching patterns:"
                 (CONS '|%l|
                       (CONS "   "
                             (CONS '|%b|
                                   (APPEND (|blankList| |patterns|)
                                           (CONS '|%d| NIL)))))))))))
      (COND (|l| (|sayAsManyPerLineAsPossible| |l|) (SAY '| |)))
      (COND (|patterns| NIL)
            (#1# (PROGN (|sayKeyedMsg| 'S2IZ0046 NIL) NIL)))))))
 
; reportWhatOptions() ==
;   optList1:= "append"/[['%l,'"        ",x] for x in $whatOptions]
;   sayBrightly
;     ['%b,'"  )what",'%d,'"argument keywords are",'%b,:optList1,'%d,'%l,
;       '"   or abbreviations thereof.",'%l,
;         '%l,'"   Issue",'%b,'")what ?",'%d,'"for more information."]
 
(DEFUN |reportWhatOptions| ()
  (PROG (|optList1|)
    (RETURN
     (PROGN
      (SETQ |optList1|
              ((LAMBDA (|bfVar#166| |bfVar#165| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#165|)
                        (PROGN (SETQ |x| (CAR |bfVar#165|)) NIL))
                    (RETURN |bfVar#166|))
                   ('T
                    (SETQ |bfVar#166|
                            (APPEND |bfVar#166| (LIST '|%l| "        " |x|)))))
                  (SETQ |bfVar#165| (CDR |bfVar#165|))))
               NIL |$whatOptions| NIL))
      (|sayBrightly|
       (CONS '|%b|
             (CONS "  )what"
                   (CONS '|%d|
                         (CONS "argument keywords are"
                               (CONS '|%b|
                                     (APPEND |optList1|
                                             (CONS '|%d|
                                                   (CONS '|%l|
                                                         (CONS
                                                          "   or abbreviations thereof."
                                                          (CONS '|%l|
                                                                (CONS '|%l|
                                                                      (CONS
                                                                       "   Issue"
                                                                       (CONS
                                                                        '|%b|
                                                                        (CONS
                                                                         ")what ?"
                                                                         (CONS
                                                                          '|%d|
                                                                          (CONS
                                                                           "for more information."
                                                                           NIL)))))))))))))))))))))
 
; filterListOfStrings(patterns,names) ==
;   -- names and patterns are lists of strings
;   -- returns: list of strings in names that contains any of the strings
;   -- in patterns
;   (null patterns) or (null names) => names
;   names' := NIL
;   for name in reverse names repeat
;     satisfiesRegularExpressions(name,patterns) =>
;       names' := [name,:names']
;   names'
 
(DEFUN |filterListOfStrings| (|patterns| |names|)
  (PROG (|names'|)
    (RETURN
     (COND ((OR (NULL |patterns|) (NULL |names|)) |names|)
           (#1='T
            (PROGN
             (SETQ |names'| NIL)
             ((LAMBDA (|bfVar#167| |name|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#167|)
                       (PROGN (SETQ |name| (CAR |bfVar#167|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (COND
                    ((|satisfiesRegularExpressions| |name| |patterns|)
                     (IDENTITY (SETQ |names'| (CONS |name| |names'|)))))))
                 (SETQ |bfVar#167| (CDR |bfVar#167|))))
              (REVERSE |names|) NIL)
             |names'|))))))
 
; filterListOfStringsWithFn(patterns,names,fn) ==
;   -- names and patterns are lists of strings
;   -- fn is something like first or CADR
;   -- returns: list of strings in names that contains any of the strings
;   -- in patterns
;   (null patterns) or (null names) => names
;   names' := NIL
;   for name in reverse names repeat
;     satisfiesRegularExpressions(FUNCALL(fn,name),patterns) =>
;       names' := [name,:names']
;   names'
 
(DEFUN |filterListOfStringsWithFn| (|patterns| |names| |fn|)
  (PROG (|names'|)
    (RETURN
     (COND ((OR (NULL |patterns|) (NULL |names|)) |names|)
           (#1='T
            (PROGN
             (SETQ |names'| NIL)
             ((LAMBDA (|bfVar#168| |name|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#168|)
                       (PROGN (SETQ |name| (CAR |bfVar#168|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (COND
                    ((|satisfiesRegularExpressions| (FUNCALL |fn| |name|)
                      |patterns|)
                     (IDENTITY (SETQ |names'| (CONS |name| |names'|)))))))
                 (SETQ |bfVar#168| (CDR |bfVar#168|))))
              (REVERSE |names|) NIL)
             |names'|))))))
 
; satisfiesRegularExpressions(name,patterns) ==
;   -- this is a first cut
;   nf := true
;   dname := DOWNCASE COPY name
;   for pattern in patterns while nf repeat
;     -- use @ as a wildcard
;     STRPOS(pattern,dname,0,'"@") => nf := nil
;   null nf
 
(DEFUN |satisfiesRegularExpressions| (|name| |patterns|)
  (PROG (|nf| |dname|)
    (RETURN
     (PROGN
      (SETQ |nf| T)
      (SETQ |dname| (DOWNCASE (COPY |name|)))
      ((LAMBDA (|bfVar#169| |pattern|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#169|)
                (PROGN (SETQ |pattern| (CAR |bfVar#169|)) NIL) (NOT |nf|))
            (RETURN NIL))
           ('T
            (COND
             ((STRPOS |pattern| |dname| 0 "@") (IDENTITY (SETQ |nf| NIL))))))
          (SETQ |bfVar#169| (CDR |bfVar#169|))))
       |patterns| NIL)
      (NULL |nf|)))))
 
; processSynonyms() ==
;   p := STRPOS('")",LINE,0,NIL)
;   fill := '""
;   if p
;     then
;       line := SUBSTRING(LINE,p,NIL)
;       if p > 0 then fill := SUBSTRING(LINE,0,p)
;     else
;       p := 0
;       line := LINE
;   to := STRPOS ('" ", line, 1, nil)
;   if to then to := to - 1
;   synstr := SUBSTRING (line, 1, to)
;   syn := STRING2ID_-N (synstr, 1)
;   null (fun := LASSOC (syn, $CommandSynonymAlist)) => NIL
;   to := STRPOS('")",fun,1,NIL)
;   if to and to ~= SIZE(fun)-1 then
;     opt := STRCONC('" ",SUBSTRING(fun,to,NIL))
;     fun := SUBSTRING(fun,0,to-1)
;   else opt := '" "
;   if (SIZE synstr) > (SIZE fun) then
;     for i in (SIZE fun)..(SIZE synstr) repeat
;       fun := CONCAT (fun, '" ")
; --  $currentLine := STRCONC(fill,RPLACSTR(line, 1, SIZE synstr, fun),opt)
;   cl := STRCONC(fill,RPLACSTR(line, 1, SIZE synstr, fun),opt)
;   SETQ(LINE,cl)
;   SETQ(CHR,LINE.(p+1))
;   processSynonyms ()
 
(DEFUN |processSynonyms| ()
  (PROG (|cl| |opt| |fun| |syn| |synstr| |to| |line| |fill| |p|)
    (RETURN
     (PROGN
      (SETQ |p| (STRPOS ")" LINE 0 NIL))
      (SETQ |fill| "")
      (COND
       (|p| (SETQ |line| (SUBSTRING LINE |p| NIL))
        (COND ((< 0 |p|) (SETQ |fill| (SUBSTRING LINE 0 |p|)))))
       (#1='T (SETQ |p| 0) (SETQ |line| LINE)))
      (SETQ |to| (STRPOS " " |line| 1 NIL))
      (COND (|to| (SETQ |to| (- |to| 1))))
      (SETQ |synstr| (SUBSTRING |line| 1 |to|))
      (SETQ |syn| (STRING2ID-N |synstr| 1))
      (COND ((NULL (SETQ |fun| (LASSOC |syn| |$CommandSynonymAlist|))) NIL)
            (#1#
             (PROGN
              (SETQ |to| (STRPOS ")" |fun| 1 NIL))
              (COND
               ((AND |to| (NOT (EQUAL |to| (- (SIZE |fun|) 1))))
                (SETQ |opt| (STRCONC " " (SUBSTRING |fun| |to| NIL)))
                (SETQ |fun| (SUBSTRING |fun| 0 (- |to| 1))))
               (#1# (SETQ |opt| " ")))
              (COND
               ((< (SIZE |fun|) (SIZE |synstr|))
                ((LAMBDA (|bfVar#170| |i|)
                   (LOOP
                    (COND ((> |i| |bfVar#170|) (RETURN NIL))
                          (#1# (SETQ |fun| (CONCAT |fun| " "))))
                    (SETQ |i| (+ |i| 1))))
                 (SIZE |synstr|) (SIZE |fun|))))
              (SETQ |cl|
                      (STRCONC |fill| (RPLACSTR |line| 1 (SIZE |synstr|) |fun|)
                       |opt|))
              (SETQ LINE |cl|)
              (SETQ CHR (ELT LINE (+ |p| 1)))
              (|processSynonyms|))))))))
 
; tabsToBlanks s ==
;    k := charPosition($charTab,s,0)
;    n := #s
;    k < n =>
;       k = 0 => tabsToBlanks SUBSTRING(s,1,nil)
;       STRCONC(SUBSTRING(s,0,k),$charBlank, tabsToBlanks SUBSTRING(s,k + 1,nil))
;    s
 
(DEFUN |tabsToBlanks| (|s|)
  (PROG (|k| |n|)
    (RETURN
     (PROGN
      (SETQ |k| (|charPosition| |$charTab| |s| 0))
      (SETQ |n| (LENGTH |s|))
      (COND
       ((< |k| |n|)
        (COND ((EQL |k| 0) (|tabsToBlanks| (SUBSTRING |s| 1 NIL)))
              (#1='T
               (STRCONC (SUBSTRING |s| 0 |k|) |$charBlank|
                (|tabsToBlanks| (SUBSTRING |s| (+ |k| 1) NIL))))))
       (#1# |s|))))))
 
; doSystemCommand string ==
;    string := CONCAT('")", EXPAND_-TABS string)
;    LINE: fluid := string
;    processSynonyms()
;    string := LINE
;    string:=SUBSTRING(string,1,nil)
;    string = '"" => nil
;    tok:=getFirstWord(string)
;    tok =>
;         unab := unAbbreviateKeyword tok
;         member(unab, $noParseCommands) =>
;           handleNoParseCommands(unab, string)
;         optionList := splitIntoOptionBlocks string
;         member(unab, $tokenCommands) =>
;           handleTokensizeSystemCommands(unab, optionList)
;         handleParsedSystemCommands(unab, optionList)
;         nil
;    nil
 
(DEFUN |doSystemCommand| (|string|)
  (PROG (LINE |optionList| |unab| |tok|)
    (DECLARE (SPECIAL LINE))
    (RETURN
     (PROGN
      (SETQ |string| (CONCAT ")" (EXPAND-TABS |string|)))
      (SETQ LINE |string|)
      (|processSynonyms|)
      (SETQ |string| LINE)
      (SETQ |string| (SUBSTRING |string| 1 NIL))
      (COND ((EQUAL |string| "") NIL)
            (#1='T
             (PROGN
              (SETQ |tok| (|getFirstWord| |string|))
              (COND
               (|tok|
                (PROGN
                 (SETQ |unab| (|unAbbreviateKeyword| |tok|))
                 (COND
                  ((|member| |unab| |$noParseCommands|)
                   (|handleNoParseCommands| |unab| |string|))
                  (#1#
                   (PROGN
                    (SETQ |optionList| (|splitIntoOptionBlocks| |string|))
                    (COND
                     ((|member| |unab| |$tokenCommands|)
                      (|handleTokensizeSystemCommands| |unab| |optionList|))
                     (#1#
                      (PROGN
                       (|handleParsedSystemCommands| |unab| |optionList|)
                       NIL))))))))
               (#1# NIL)))))))))
 
; handleNoParseCommands(unab, string) ==
;   string := stripSpaces string
;   spaceIndex := SEARCH('" ", string)
;   unab = "lisp" =>
;     if (null spaceIndex) then
;       sayKeyedMsg("S2IV0005", NIL)
;       nil
;     else nplisp(stripLisp string)
;   unab = "boot" =>
;     if (null spaceIndex) then
;       sayKeyedMsg("S2IV0005", NIL)
;       nil
;     else npboot(SUBSEQ(string, spaceIndex+1))
;   unab = "system" =>
;     if (null spaceIndex) then
;       sayKeyedMsg("S2IV0005", NIL)
;       nil
;     else npsystem(unab, string)
;   unab = "synonym" =>
;     npsynonym(unab, (null spaceIndex => '""; SUBSEQ(string, spaceIndex+1)))
;   null spaceIndex =>
;     FUNCALL unab
;   member(unab, '( quit     _
;                   fin      _
;                   piles    _
;                   pquit    _
;                   credits  _
;                   copyright )) =>
;     sayKeyedMsg("S2IV0005", NIL)
;     nil
;   funName := INTERN CONCAT('"np",STRING unab)
;   FUNCALL(funName, SUBSEQ(string, spaceIndex+1))
 
(DEFUN |handleNoParseCommands| (|unab| |string|)
  (PROG (|spaceIndex| |funName|)
    (RETURN
     (PROGN
      (SETQ |string| (|stripSpaces| |string|))
      (SETQ |spaceIndex| (SEARCH " " |string|))
      (COND
       ((EQ |unab| '|lisp|)
        (COND ((NULL |spaceIndex|) (|sayKeyedMsg| 'S2IV0005 NIL) NIL)
              (#1='T (|nplisp| (|stripLisp| |string|)))))
       ((EQ |unab| '|boot|)
        (COND ((NULL |spaceIndex|) (|sayKeyedMsg| 'S2IV0005 NIL) NIL)
              (#1# (|npboot| (SUBSEQ |string| (+ |spaceIndex| 1))))))
       ((EQ |unab| '|system|)
        (COND ((NULL |spaceIndex|) (|sayKeyedMsg| 'S2IV0005 NIL) NIL)
              (#1# (|npsystem| |unab| |string|))))
       ((EQ |unab| '|synonym|)
        (|npsynonym| |unab|
         (COND ((NULL |spaceIndex|) "")
               (#1# (SUBSEQ |string| (+ |spaceIndex| 1))))))
       ((NULL |spaceIndex|) (FUNCALL |unab|))
       ((|member| |unab| '(|quit| |fin| |piles| |pquit| |credits| |copyright|))
        (PROGN (|sayKeyedMsg| 'S2IV0005 NIL) NIL))
       (#1#
        (PROGN
         (SETQ |funName| (INTERN (CONCAT "np" (STRING |unab|))))
         (FUNCALL |funName| (SUBSEQ |string| (+ |spaceIndex| 1))))))))))
 
; string2BootTree(str) == STTOSEX(str)
 
(DEFUN |string2BootTree| (|str|) (PROG () (RETURN (STTOSEX |str|))))
 
; npboot str ==
;   sex := string2BootTree str
;   FORMAT(true, '"~&~S~%", sex)
;   $ans := EVAL sex
;   FORMAT(true, '"~&Value = ~S~%", $ans)
 
(DEFUN |npboot| (|str|)
  (PROG (|sex|)
    (RETURN
     (PROGN
      (SETQ |sex| (|string2BootTree| |str|))
      (FORMAT T "~&~S~%" |sex|)
      (SETQ |$ans| (EVAL |sex|))
      (FORMAT T "~&Value = ~S~%" |$ans|)))))
 
; stripLisp str ==
;   found := false
;   strIndex := 0
;   lispStr := '"lisp"
;   for c0 in 0..#str-1 for c1 in 0..#lispStr-1 repeat
;     (char str.c0) ~= (char lispStr.c1) =>
;       return nil
;     strIndex := c0+1
;   SUBSEQ(str, strIndex)
 
(DEFUN |stripLisp| (|str|)
  (PROG (|found| |strIndex| |lispStr|)
    (RETURN
     (PROGN
      (SETQ |found| NIL)
      (SETQ |strIndex| 0)
      (SETQ |lispStr| "lisp")
      ((LAMBDA (|bfVar#171| |c0| |bfVar#172| |c1|)
         (LOOP
          (COND ((OR (> |c0| |bfVar#171|) (> |c1| |bfVar#172|)) (RETURN NIL))
                (#1='T
                 (COND
                  ((NOT
                    (EQUAL (|char| (ELT |str| |c0|))
                           (|char| (ELT |lispStr| |c1|))))
                   (RETURN NIL))
                  (#1# (SETQ |strIndex| (+ |c0| 1))))))
          (SETQ |c0| (+ |c0| 1))
          (SETQ |c1| (+ |c1| 1))))
       (- (LENGTH |str|) 1) 0 (- (LENGTH |lispStr|) 1) 0)
      (SUBSEQ |str| |strIndex|)))))
 
; nplisp str ==
;   $ans := EVAL READ_-FROM_-STRING str
;   FORMAT(true, '"~&Value = ~S~%", $ans)
 
(DEFUN |nplisp| (|str|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |$ans| (EVAL (READ-FROM-STRING |str|)))
      (FORMAT T "~&Value = ~S~%" |$ans|)))))
 
; intnplisp s ==
;   $currentLine := s
;   nplisp $currentLine
 
(DEFUN |intnplisp| (|s|)
  (PROG ()
    (RETURN (PROGN (SETQ |$currentLine| |s|) (|nplisp| |$currentLine|)))))
 
; npsystem(unab, str) ==
;   spaceIndex := SEARCH('" ", str)
;   null spaceIndex =>
;     sayKeyedMsg('"S2IZ0080", [str])
;   sysPart := SUBSEQ(str, 0, spaceIndex)
;   -- The following is a hack required by the fact that unAbbreviateKeyword
;   -- returns the word "system" for unknown words
;   null SEARCH(sysPart, STRING unab) =>
;     sayKeyedMsg('"S2IZ0080", [sysPart])
;   command := SUBSEQ(str, spaceIndex+1)
;   OBEY command
 
(DEFUN |npsystem| (|unab| |str|)
  (PROG (|spaceIndex| |sysPart| |command|)
    (RETURN
     (PROGN
      (SETQ |spaceIndex| (SEARCH " " |str|))
      (COND ((NULL |spaceIndex|) (|sayKeyedMsg| "S2IZ0080" (LIST |str|)))
            (#1='T
             (PROGN
              (SETQ |sysPart| (SUBSEQ |str| 0 |spaceIndex|))
              (COND
               ((NULL (SEARCH |sysPart| (STRING |unab|)))
                (|sayKeyedMsg| "S2IZ0080" (LIST |sysPart|)))
               (#1#
                (PROGN
                 (SETQ |command| (SUBSEQ |str| (+ |spaceIndex| 1)))
                 (OBEY |command|)))))))))))
 
; npsynonym(unab, str) ==
;   npProcessSynonym(str)
 
(DEFUN |npsynonym| (|unab| |str|) (PROG () (RETURN (|npProcessSynonym| |str|))))
 
; tokenSystemCommand(unabr, tokList) ==
;   systemCommand tokList
 
(DEFUN |tokenSystemCommand| (|unabr| |tokList|)
  (PROG () (RETURN (|systemCommand| |tokList|))))
 
; tokTran tok ==
;   STRINGP tok =>
;     #tok = 0 => nil
;     isIntegerString tok => READ_-FROM_-STRING tok
;     STRING tok.0 = '"_"" =>
;       SUBSEQ(tok, 1, #tok-1)
;     INTERN tok
;   tok
 
(DEFUN |tokTran| (|tok|)
  (PROG ()
    (RETURN
     (COND
      ((STRINGP |tok|)
       (COND ((EQL (LENGTH |tok|) 0) NIL)
             ((|isIntegerString| |tok|) (READ-FROM-STRING |tok|))
             ((EQUAL (STRING (ELT |tok| 0)) "\"")
              (SUBSEQ |tok| 1 (- (LENGTH |tok|) 1)))
             (#1='T (INTERN |tok|))))
      (#1# |tok|)))))
 
; isIntegerString tok ==
;   for i in 0..#tok-1 repeat
;     val := DIGIT_-CHAR_-P tok.i
;     not val => return nil
;   val
 
(DEFUN |isIntegerString| (|tok|)
  (PROG (|val|)
    (RETURN
     (PROGN
      ((LAMBDA (|bfVar#173| |i|)
         (LOOP
          (COND ((> |i| |bfVar#173|) (RETURN NIL))
                ('T
                 (PROGN
                  (SETQ |val| (DIGIT-CHAR-P (ELT |tok| |i|)))
                  (COND ((NULL |val|) (RETURN NIL))))))
          (SETQ |i| (+ |i| 1))))
       (- (LENGTH |tok|) 1) 0)
      |val|))))
 
; splitIntoOptionBlocks str ==
;   inString := false
;   optionBlocks := nil
;   blockStart := 0
;   parenCount := 0
;   for i in 0..#str-1 repeat
;     STRING str.i = '"_"" =>
;       inString := not inString
;     if STRING str.i = '"(" and not inString
;     then parenCount := parenCount + 1
;     if STRING str.i = '")" and not inString
;     then parenCount := parenCount - 1
;     STRING str.i = '")" and not inString and parenCount = -1 =>
;       block := stripSpaces SUBSEQ(str, blockStart, i)
;       blockList := [block, :blockList]
;       blockStart := i+1
;       parenCount := 0
;   blockList := [stripSpaces SUBSEQ(str, blockStart), :blockList]
;   nreverse blockList
 
(DEFUN |splitIntoOptionBlocks| (|str|)
  (PROG (|inString| |optionBlocks| |blockStart| |parenCount| |block|
         |blockList|)
    (RETURN
     (PROGN
      (SETQ |inString| NIL)
      (SETQ |optionBlocks| NIL)
      (SETQ |blockStart| 0)
      (SETQ |parenCount| 0)
      ((LAMBDA (|bfVar#174| |i|)
         (LOOP
          (COND ((> |i| |bfVar#174|) (RETURN NIL))
                (#1='T
                 (COND
                  ((EQUAL (STRING (ELT |str| |i|)) "\"")
                   (SETQ |inString| (NULL |inString|)))
                  (#1#
                   (PROGN
                    (COND
                     ((AND (EQUAL (STRING (ELT |str| |i|)) "(")
                           (NULL |inString|))
                      (SETQ |parenCount| (+ |parenCount| 1))))
                    (COND
                     ((AND (EQUAL (STRING (ELT |str| |i|)) ")")
                           (NULL |inString|))
                      (SETQ |parenCount| (- |parenCount| 1))))
                    (COND
                     ((AND (EQUAL (STRING (ELT |str| |i|)) ")")
                           (NULL |inString|) (EQUAL |parenCount| (- 1)))
                      (PROGN
                       (SETQ |block|
                               (|stripSpaces| (SUBSEQ |str| |blockStart| |i|)))
                       (SETQ |blockList| (CONS |block| |blockList|))
                       (SETQ |blockStart| (+ |i| 1))
                       (SETQ |parenCount| 0)))))))))
          (SETQ |i| (+ |i| 1))))
       (- (LENGTH |str|) 1) 0)
      (SETQ |blockList|
              (CONS (|stripSpaces| (SUBSEQ |str| |blockStart|)) |blockList|))
      (NREVERSE |blockList|)))))
 
; dumbTokenize str ==
;   -- split into tokens delimted by spaces, taking quoted strings into account
;   inString := false
;   tokenList := nil
;   tokenStart := 0
;   previousSpace := false
;   for i in 0..#str-1 repeat
;     STRING str.i = '"_"" =>
;       inString := not inString
;       previousSpace := false
;     STRING str.i = '" " and not inString =>
;       previousSpace => nil
;       token := stripSpaces SUBSEQ(str, tokenStart, i)
;       tokenList := [token, :tokenList]
;       tokenStart := i+1
;       previousSpace := true
;     previousSpace := false
;   tokenList := [stripSpaces SUBSEQ(str, tokenStart), :tokenList]
;   nreverse tokenList
 
(DEFUN |dumbTokenize| (|str|)
  (PROG (|inString| |tokenList| |tokenStart| |previousSpace| |token|)
    (RETURN
     (PROGN
      (SETQ |inString| NIL)
      (SETQ |tokenList| NIL)
      (SETQ |tokenStart| 0)
      (SETQ |previousSpace| NIL)
      ((LAMBDA (|bfVar#175| |i|)
         (LOOP
          (COND ((> |i| |bfVar#175|) (RETURN NIL))
                (#1='T
                 (COND
                  ((EQUAL (STRING (ELT |str| |i|)) "\"")
                   (PROGN
                    (SETQ |inString| (NULL |inString|))
                    (SETQ |previousSpace| NIL)))
                  ((AND (EQUAL (STRING (ELT |str| |i|)) " ") (NULL |inString|))
                   (COND (|previousSpace| NIL)
                         (#1#
                          (PROGN
                           (SETQ |token|
                                   (|stripSpaces|
                                    (SUBSEQ |str| |tokenStart| |i|)))
                           (SETQ |tokenList| (CONS |token| |tokenList|))
                           (SETQ |tokenStart| (+ |i| 1))
                           (SETQ |previousSpace| T)))))
                  (#1# (SETQ |previousSpace| NIL)))))
          (SETQ |i| (+ |i| 1))))
       (- (LENGTH |str|) 1) 0)
      (SETQ |tokenList|
              (CONS (|stripSpaces| (SUBSEQ |str| |tokenStart|)) |tokenList|))
      (NREVERSE |tokenList|)))))
 
; handleParsedSystemCommands(unabr, optionList) ==
;   restOptionList := [dumbTokenize opt for opt in rest optionList]
;   parcmd := [parseSystemCmd first optionList,
;              :[[tokTran tok for tok in opt] for opt in restOptionList]]
;   systemCommand parcmd
 
(DEFUN |handleParsedSystemCommands| (|unabr| |optionList|)
  (PROG (|restOptionList| |parcmd|)
    (RETURN
     (PROGN
      (SETQ |restOptionList|
              ((LAMBDA (|bfVar#177| |bfVar#176| |opt|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#176|)
                        (PROGN (SETQ |opt| (CAR |bfVar#176|)) NIL))
                    (RETURN (NREVERSE |bfVar#177|)))
                   (#1='T
                    (SETQ |bfVar#177|
                            (CONS (|dumbTokenize| |opt|) |bfVar#177|))))
                  (SETQ |bfVar#176| (CDR |bfVar#176|))))
               NIL (CDR |optionList|) NIL))
      (SETQ |parcmd|
              (CONS (|parseSystemCmd| (CAR |optionList|))
                    ((LAMBDA (|bfVar#181| |bfVar#180| |opt|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#180|)
                              (PROGN (SETQ |opt| (CAR |bfVar#180|)) NIL))
                          (RETURN (NREVERSE |bfVar#181|)))
                         (#1#
                          (SETQ |bfVar#181|
                                  (CONS
                                   ((LAMBDA (|bfVar#179| |bfVar#178| |tok|)
                                      (LOOP
                                       (COND
                                        ((OR (ATOM |bfVar#178|)
                                             (PROGN
                                              (SETQ |tok| (CAR |bfVar#178|))
                                              NIL))
                                         (RETURN (NREVERSE |bfVar#179|)))
                                        (#1#
                                         (SETQ |bfVar#179|
                                                 (CONS (|tokTran| |tok|)
                                                       |bfVar#179|))))
                                       (SETQ |bfVar#178| (CDR |bfVar#178|))))
                                    NIL |opt| NIL)
                                   |bfVar#181|))))
                        (SETQ |bfVar#180| (CDR |bfVar#180|))))
                     NIL |restOptionList| NIL)))
      (|systemCommand| |parcmd|)))))
 
; parseSystemCmd opt ==
;   spaceIndex := SEARCH('" ", opt)
;   spaceIndex =>
;     commandString := stripSpaces SUBSEQ(opt, 0, spaceIndex)
;     argString := stripSpaces SUBSEQ(opt, spaceIndex)
;     command := tokTran commandString
;     pform := parseFromString argString
;     [command, pform]
;   [tokTran tok for tok in dumbTokenize opt]
 
(DEFUN |parseSystemCmd| (|opt|)
  (PROG (|spaceIndex| |commandString| |argString| |command| |pform|)
    (RETURN
     (PROGN
      (SETQ |spaceIndex| (SEARCH " " |opt|))
      (COND
       (|spaceIndex|
        (PROGN
         (SETQ |commandString| (|stripSpaces| (SUBSEQ |opt| 0 |spaceIndex|)))
         (SETQ |argString| (|stripSpaces| (SUBSEQ |opt| |spaceIndex|)))
         (SETQ |command| (|tokTran| |commandString|))
         (SETQ |pform| (|parseFromString| |argString|))
         (LIST |command| |pform|)))
       (#1='T
        ((LAMBDA (|bfVar#183| |bfVar#182| |tok|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#182|)
                  (PROGN (SETQ |tok| (CAR |bfVar#182|)) NIL))
              (RETURN (NREVERSE |bfVar#183|)))
             (#1# (SETQ |bfVar#183| (CONS (|tokTran| |tok|) |bfVar#183|))))
            (SETQ |bfVar#182| (CDR |bfVar#182|))))
         NIL (|dumbTokenize| |opt|) NIL)))))))
 
; handleTokensizeSystemCommands(unabr, optionList) ==
;   optionList := [dumbTokenize opt for opt in optionList]
;   parcmd := [[tokTran tok for tok in opt] for opt in optionList]
;   parcmd => tokenSystemCommand(unabr, parcmd)
 
(DEFUN |handleTokensizeSystemCommands| (|unabr| |optionList|)
  (PROG (|parcmd|)
    (RETURN
     (PROGN
      (SETQ |optionList|
              ((LAMBDA (|bfVar#185| |bfVar#184| |opt|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#184|)
                        (PROGN (SETQ |opt| (CAR |bfVar#184|)) NIL))
                    (RETURN (NREVERSE |bfVar#185|)))
                   (#1='T
                    (SETQ |bfVar#185|
                            (CONS (|dumbTokenize| |opt|) |bfVar#185|))))
                  (SETQ |bfVar#184| (CDR |bfVar#184|))))
               NIL |optionList| NIL))
      (SETQ |parcmd|
              ((LAMBDA (|bfVar#189| |bfVar#188| |opt|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#188|)
                        (PROGN (SETQ |opt| (CAR |bfVar#188|)) NIL))
                    (RETURN (NREVERSE |bfVar#189|)))
                   (#1#
                    (SETQ |bfVar#189|
                            (CONS
                             ((LAMBDA (|bfVar#187| |bfVar#186| |tok|)
                                (LOOP
                                 (COND
                                  ((OR (ATOM |bfVar#186|)
                                       (PROGN
                                        (SETQ |tok| (CAR |bfVar#186|))
                                        NIL))
                                   (RETURN (NREVERSE |bfVar#187|)))
                                  (#1#
                                   (SETQ |bfVar#187|
                                           (CONS (|tokTran| |tok|)
                                                 |bfVar#187|))))
                                 (SETQ |bfVar#186| (CDR |bfVar#186|))))
                              NIL |opt| NIL)
                             |bfVar#189|))))
                  (SETQ |bfVar#188| (CDR |bfVar#188|))))
               NIL |optionList| NIL))
      (COND (|parcmd| (|tokenSystemCommand| |unabr| |parcmd|)))))))
 
; getFirstWord string ==
;   spaceIndex := SEARCH('" ", string)
;   null spaceIndex => string
;   stripSpaces SUBSEQ(string, 0, spaceIndex)
 
(DEFUN |getFirstWord| (|string|)
  (PROG (|spaceIndex|)
    (RETURN
     (PROGN
      (SETQ |spaceIndex| (SEARCH " " |string|))
      (COND ((NULL |spaceIndex|) |string|)
            ('T (|stripSpaces| (SUBSEQ |string| 0 |spaceIndex|))))))))
 
; ltrace l == trace l
 
(DEFUN |ltrace| (|l|) (PROG () (RETURN (|trace| |l|))))
 
; stripSpaces str ==
;   STRING_-TRIM([char '" "], str)
 
(DEFUN |stripSpaces| (|str|)
  (PROG () (RETURN (STRING-TRIM (LIST (|char| " ")) |str|))))
 
; npProcessSynonym(str) ==
;   if str = '"" then printSynonyms(NIL)
;   else
;     pair := processSynonymLine str
;     if $CommandSynonymAlist then
;       PUTALIST($CommandSynonymAlist, first pair, rest pair)
;     else $CommandSynonymAlist := [pair]
;   terminateSystemCommand()
 
(DEFUN |npProcessSynonym| (|str|)
  (PROG (|pair|)
    (RETURN
     (PROGN
      (COND ((EQUAL |str| "") (|printSynonyms| NIL))
            (#1='T (SETQ |pair| (|processSynonymLine| |str|))
             (COND
              (|$CommandSynonymAlist|
               (PUTALIST |$CommandSynonymAlist| (CAR |pair|) (CDR |pair|)))
              (#1# (SETQ |$CommandSynonymAlist| (LIST |pair|))))))
      (|terminateSystemCommand|)))))
 
; InterpExecuteSpadSystemCommand string ==
;   CATCH("coerceFailure",
;     CATCH("SPAD_READER", ExecuteInterpSystemCommand string) )
 
(DEFUN |InterpExecuteSpadSystemCommand| (|string|)
  (PROG ()
    (RETURN
     (CATCH '|coerceFailure|
       (CATCH 'SPAD_READER (|ExecuteInterpSystemCommand| |string|))))))
 
; intProcessSynonyms str ==
;    LINE:local := str
;    processSynonyms()
;    LINE
 
(DEFUN |intProcessSynonyms| (|str|)
  (PROG (LINE)
    (DECLARE (SPECIAL LINE))
    (RETURN (PROGN (SETQ LINE |str|) (|processSynonyms|) LINE))))
 
; ExecuteInterpSystemCommand string ==
;    string := intProcessSynonyms(string)
;    $currentLine:local:=string
;    string:=SUBSTRING(string,1,nil)
;    string = '"" => nil
;    doSystemCommand string
 
(DEFUN |ExecuteInterpSystemCommand| (|string|)
  (PROG (|$currentLine|)
    (DECLARE (SPECIAL |$currentLine|))
    (RETURN
     (PROGN
      (SETQ |string| (|intProcessSynonyms| |string|))
      (SETQ |$currentLine| |string|)
      (SETQ |string| (SUBSTRING |string| 1 NIL))
      (COND ((EQUAL |string| "") NIL) ('T (|doSystemCommand| |string|)))))))
 
; parseFromString(s) ==
;    s := next(function ncloopParse,
;         next(function lineoftoks,incString s))
;    StreamNull s => nil
;    pf2Sex macroExpanded first rest first s
 
(DEFUN |parseFromString| (|s|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |s|
              (|next| #'|ncloopParse|
               (|next| #'|lineoftoks| (|incString| |s|))))
      (COND ((|StreamNull| |s|) NIL)
            ('T (|pf2Sex| (|macroExpanded| (CAR (CDR (CAR |s|)))))))))))
 
; ncParseFromString(s) ==
;    zeroOneTran(packageTran(CATCH('SPAD_READER, parseFromString(s))))
 
(DEFUN |ncParseFromString| (|s|)
  (PROG ()
    (RETURN
     (|zeroOneTran|
      (|packageTran| (CATCH 'SPAD_READER (|parseFromString| |s|)))))))
