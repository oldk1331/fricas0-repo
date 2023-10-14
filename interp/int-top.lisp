 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; DEFPARAMETER($ioHook, nil)
 
(DEFPARAMETER |$ioHook| NIL)
 
; ioHook(x, :args) ==
;    if $ioHook then FUNCALL($ioHook, x, args)
 
(DEFUN |ioHook| (|x| &REST |args|)
  (PROG () (RETURN (COND (|$ioHook| (FUNCALL |$ioHook| |x| |args|))))))
 
; $ncmParse :=            NIL
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$ncmParse| NIL))
 
; $ncmMacro :=            NIL
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$ncmMacro| NIL))
 
; $ncmPhase :=      NIL
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$ncmPhase| NIL))
 
; evalInlineCode() ==
;   args := getCLArgs()
;   while args repeat
;     arg := first args
;     args := rest args
;     if arg = '"-eval" and args then
;       CATCH('SPAD_READER, CATCH('top_level, parseAndEvalStr first(args)))
;       args := rest args
 
(DEFUN |evalInlineCode| ()
  (PROG (|arg| |args|)
    (RETURN
     (PROGN
      (SETQ |args| (|getCLArgs|))
      ((LAMBDA ()
         (LOOP
          (COND ((NOT |args|) (RETURN NIL))
                ('T
                 (PROGN
                  (SETQ |arg| (CAR |args|))
                  (SETQ |args| (CDR |args|))
                  (COND
                   ((AND (EQUAL |arg| "-eval") |args|)
                    (CATCH 'SPAD_READER
                      (CATCH '|top_level| (|parseAndEvalStr| (CAR |args|))))
                    (SETQ |args| (CDR |args|))))))))))))))
 
; spad() ==
;   -- starts the interpreter, read in profiles, etc.
;   $PrintCompilerMessageIfTrue: local
;   setOutputAlgebra "%initialize%"
;   readSpadProfileIfThere()
;   evalInlineCode()
;   runspad()
;   'EndOfSpad
 
(DEFUN |spad| ()
  (PROG (|$PrintCompilerMessageIfTrue|)
    (DECLARE (SPECIAL |$PrintCompilerMessageIfTrue|))
    (RETURN
     (PROGN
      (SETQ |$PrintCompilerMessageIfTrue| NIL)
      (|setOutputAlgebra| '|%initialize%|)
      (|readSpadProfileIfThere|)
      (|evalInlineCode|)
      (|runspad|)
      '|EndOfSpad|))))
 
; runspad() ==
;   mode:='restart
;   while mode='restart repeat
;     resetStackLimits()
;     CATCH($quitTag, CATCH('coerceFailure,
;                   mode:=CATCH('top_level, ncTopLevel())))
 
(DEFUN |runspad| ()
  (PROG (|mode|)
    (RETURN
     (PROGN
      (SETQ |mode| '|restart|)
      ((LAMBDA ()
         (LOOP
          (COND ((NOT (EQ |mode| '|restart|)) (RETURN NIL))
                ('T
                 (PROGN
                  (|resetStackLimits|)
                  (CATCH |$quitTag|
                    (CATCH '|coerceFailure|
                      (SETQ |mode|
                              (CATCH '|top_level| (|ncTopLevel|)))))))))))))))
 
; ncTopLevel() ==
; -- Top-level read-parse-eval-print loop for the interpreter.  Uses
; -- the Bill Burge's parser.
;   _*EOF_*: fluid := NIL
;   $InteractiveMode :fluid := true
;   $e:fluid := $InteractiveFrame
;   ncIntLoop()
 
(DEFUN |ncTopLevel| ()
  (PROG (|$e| |$InteractiveMode| *EOF*)
    (DECLARE (SPECIAL |$e| |$InteractiveMode| *EOF*))
    (RETURN
     (PROGN
      (SETQ *EOF* NIL)
      (SETQ |$InteractiveMode| T)
      (SETQ |$e| |$InteractiveFrame|)
      (|ncIntLoop|)))))
 
; printFirstPrompt?() ==
;     $interpreterFrameName ~= "initial" or not($SpadServer)
 
(DEFUN |printFirstPrompt?| ()
  (PROG ()
    (RETURN
     (OR (NOT (EQ |$interpreterFrameName| '|initial|)) (NULL |$SpadServer|)))))
 
; ncIntLoop() ==
;   intloop()
 
(DEFUN |ncIntLoop| () (PROG () (RETURN (|intloop|))))
 
; intloop () ==
;     mode := "restart"
;     while mode = "restart" repeat
;       resetStackLimits()
;       mode := CATCH("top_level",
;                     SpadInterpretStream(1, ["TIM", "DALY", "?"], true))
 
(DEFUN |intloop| ()
  (PROG (|mode|)
    (RETURN
     (PROGN
      (SETQ |mode| '|restart|)
      ((LAMBDA ()
         (LOOP
          (COND ((NOT (EQ |mode| '|restart|)) (RETURN NIL))
                ('T
                 (PROGN
                  (|resetStackLimits|)
                  (SETQ |mode|
                          (CATCH '|top_level|
                            (|SpadInterpretStream| 1 (LIST 'TIM 'DALY '?)
                             T)))))))))))))
 
; SpadInterpretStream(step_num, source, interactive?) ==
;     pile?                    := not interactive?
; --  following seems useless and causes ccl package problems
; --    $InteractiveMode : local := false
; 
;     $newcompErrorCount: local := 0 -- SMW Feb 2/90.
;                                    -- Used in highComplete, ncHardError etc.
; 
;     $inclAssertions: local := ["AIX", "CommonLisp"] -- Jan 28/90
; 
; 
;     $lastPos               : local := $nopos   ------------>!!!
;     $erMsgToss             : local := false --------------->!!!
;     $ncMsgList             : local := nil
; 
;     $promptMsg             : local := 'S2CTP023
; 
;     interactive? =>
;         if printFirstPrompt?() then
;             princPrompt()
;         intloopReadConsole('"", step_num)
;         []
;     intloopInclude (source,0)
;     []
 
(DEFUN |SpadInterpretStream| (|step_num| |source| |interactive?|)
  (PROG (|$promptMsg| |$ncMsgList| |$erMsgToss| |$lastPos| |$inclAssertions|
         |$newcompErrorCount| |pile?|)
    (DECLARE
     (SPECIAL |$promptMsg| |$ncMsgList| |$erMsgToss| |$lastPos|
      |$inclAssertions| |$newcompErrorCount|))
    (RETURN
     (PROGN
      (SETQ |pile?| (NULL |interactive?|))
      (SETQ |$newcompErrorCount| 0)
      (SETQ |$inclAssertions| (LIST 'AIX '|CommonLisp|))
      (SETQ |$lastPos| |$nopos|)
      (SETQ |$erMsgToss| NIL)
      (SETQ |$ncMsgList| NIL)
      (SETQ |$promptMsg| 'S2CTP023)
      (COND
       (|interactive?|
        (PROGN
         (COND ((|printFirstPrompt?|) (|princPrompt|)))
         (|intloopReadConsole| "" |step_num|)
         NIL))
       ('T (PROGN (|intloopInclude| |source| 0) NIL)))))))
 
; SpadInterpretFile fn ==
;   SpadInterpretStream(1, fn, nil)
 
(DEFUN |SpadInterpretFile| (|fn|)
  (PROG () (RETURN (|SpadInterpretStream| 1 |fn| NIL))))
 
; ncINTERPFILE(file, echo) ==
;   $EchoLines : local := echo
;   $ReadingFile : local := true
;   SpadInterpretFile(file)
 
(DEFUN |ncINTERPFILE| (|file| |echo|)
  (PROG (|$ReadingFile| |$EchoLines|)
    (DECLARE (SPECIAL |$ReadingFile| |$EchoLines|))
    (RETURN
     (PROGN
      (SETQ |$EchoLines| |echo|)
      (SETQ |$ReadingFile| T)
      (|SpadInterpretFile| |file|)))))
 
; setCurrentLine s ==
;   v := $currentLine
;   $currentLine :=
;      NULL(v) => s
;      u :=
;         STRINGP(s) => [s]
;         s
;      STRINGP(v) => [v, :u]
;      RPLACD(LASTNODE(v), u)
;      v
 
(DEFUN |setCurrentLine| (|s|)
  (PROG (|v| |u|)
    (RETURN
     (PROGN
      (SETQ |v| |$currentLine|)
      (SETQ |$currentLine|
              (COND ((NULL |v|) |s|)
                    (#1='T
                     (PROGN
                      (SETQ |u| (COND ((STRINGP |s|) (LIST |s|)) (#1# |s|)))
                      (COND ((STRINGP |v|) (CONS |v| |u|))
                            (#1#
                             (PROGN (RPLACD (LASTNODE |v|) |u|) |v|)))))))))))
 
; intloopReadConsole(b, n)==
;     ioHook("startReadLine")
;     a:= serverReadLine(_*STANDARD_-INPUT_*)
;     ioHook("endOfReadLine")
;     not STRINGP a => leaveScratchpad()
;     #a=0 =>
;              princPrompt()
;              intloopReadConsole('"", n)
;     $DALYMODE and intloopPrefix?('"(",a) =>
;             intnplisp(a)
;             princPrompt()
;             intloopReadConsole('"",n)
;     pfx := stripSpaces intloopPrefix?('")fi",a)
;     pfx and ((pfx = '")fi") or (pfx = '")fin")) => []
;     b = '"" and (d := intloopPrefix?('")", a)) =>
;              setCurrentLine d
;              c := ncloopCommand(d,n)
;              princPrompt()
;              intloopReadConsole('"", c)
;     a:=CONCAT(b,a)
;     ncloopEscaped a => intloopReadConsole(SUBSEQ(a, 0, (LENGTH a) - 1),n)
;     c := intloopProcessString(a, n)
;     princPrompt()
;     intloopReadConsole('"", c)
 
(DEFUN |intloopReadConsole| (|b| |n|)
  (PROG (|a| |pfx| |d| |c|)
    (RETURN
     (PROGN
      (|ioHook| '|startReadLine|)
      (SETQ |a| (|serverReadLine| *STANDARD-INPUT*))
      (|ioHook| '|endOfReadLine|)
      (COND ((NULL (STRINGP |a|)) (|leaveScratchpad|))
            ((EQL (LENGTH |a|) 0)
             (PROGN (|princPrompt|) (|intloopReadConsole| "" |n|)))
            ((AND $DALYMODE (|intloopPrefix?| "(" |a|))
             (PROGN
              (|intnplisp| |a|)
              (|princPrompt|)
              (|intloopReadConsole| "" |n|)))
            (#1='T
             (PROGN
              (SETQ |pfx| (|stripSpaces| (|intloopPrefix?| ")fi" |a|)))
              (COND
               ((AND |pfx| (OR (EQUAL |pfx| ")fi") (EQUAL |pfx| ")fin"))) NIL)
               ((AND (EQUAL |b| "") (SETQ |d| (|intloopPrefix?| ")" |a|)))
                (PROGN
                 (|setCurrentLine| |d|)
                 (SETQ |c| (|ncloopCommand| |d| |n|))
                 (|princPrompt|)
                 (|intloopReadConsole| "" |c|)))
               (#1#
                (PROGN
                 (SETQ |a| (CONCAT |b| |a|))
                 (COND
                  ((|ncloopEscaped| |a|)
                   (|intloopReadConsole| (SUBSEQ |a| 0 (- (LENGTH |a|) 1))
                    |n|))
                  (#1#
                   (PROGN
                    (SETQ |c| (|intloopProcessString| |a| |n|))
                    (|princPrompt|)
                    (|intloopReadConsole| "" |c|))))))))))))))
 
; intloopPrefix?(prefix,whole) ==
;      #prefix > #whole => false
;      good := true
;      leading := true
;      spaces := 0
;      i := 0
;      len := #prefix
;      wlen := #whole
;      for j in 0.. while (good and i < len and j < wlen) repeat
;        good := (prefix.i = whole.j) or (leading and (whole.j = char " "))
;        if prefix.i = whole.j then i := i+1
;        if (whole.j = char " ") and leading then
;          spaces := spaces + 1
;        else leading := false
;      spaces = wlen => nil
;      if good then SUBSTRING(whole,spaces,nil) else good
 
(DEFUN |intloopPrefix?| (|prefix| |whole|)
  (PROG (|good| |leading| |spaces| |i| |len| |wlen|)
    (RETURN
     (COND ((< (LENGTH |whole|) (LENGTH |prefix|)) NIL)
           (#1='T
            (PROGN
             (SETQ |good| T)
             (SETQ |leading| T)
             (SETQ |spaces| 0)
             (SETQ |i| 0)
             (SETQ |len| (LENGTH |prefix|))
             (SETQ |wlen| (LENGTH |whole|))
             ((LAMBDA (|j|)
                (LOOP
                 (COND
                  ((NOT (AND |good| (< |i| |len|) (< |j| |wlen|)))
                   (RETURN NIL))
                  (#1#
                   (PROGN
                    (SETQ |good|
                            (OR (EQUAL (ELT |prefix| |i|) (ELT |whole| |j|))
                                (AND |leading|
                                     (EQUAL (ELT |whole| |j|) (|char| '| |)))))
                    (COND
                     ((EQUAL (ELT |prefix| |i|) (ELT |whole| |j|))
                      (SETQ |i| (+ |i| 1))))
                    (COND
                     ((AND (EQUAL (ELT |whole| |j|) (|char| '| |)) |leading|)
                      (SETQ |spaces| (+ |spaces| 1)))
                     (#1# (SETQ |leading| NIL))))))
                 (SETQ |j| (+ |j| 1))))
              0)
             (COND ((EQUAL |spaces| |wlen|) NIL)
                   (#1#
                    (COND (|good| (SUBSTRING |whole| |spaces| NIL))
                          (#1# |good|))))))))))
 
; intloopProcess(n,interactive,s)==
;      StreamNull s => n
;      [lines, ptree] := first s
;      pfAbSynOp?(ptree,"command")=>
;             if interactive then setCurrentLine tokPart ptree
;             InterpExecuteSpadSystemCommand(tokPart ptree)
;             intloopProcess(n, interactive, rest s)
;      intloopProcess(intloopSpadProcess(n, lines, ptree, interactive),
;                  interactive, rest s)
 
(DEFUN |intloopProcess| (|n| |interactive| |s|)
  (PROG (|LETTMP#1| |lines| |ptree|)
    (RETURN
     (COND ((|StreamNull| |s|) |n|)
           (#1='T
            (PROGN
             (SETQ |LETTMP#1| (CAR |s|))
             (SETQ |lines| (CAR |LETTMP#1|))
             (SETQ |ptree| (CADR |LETTMP#1|))
             (COND
              ((|pfAbSynOp?| |ptree| '|command|)
               (PROGN
                (COND (|interactive| (|setCurrentLine| (|tokPart| |ptree|))))
                (|InterpExecuteSpadSystemCommand| (|tokPart| |ptree|))
                (|intloopProcess| |n| |interactive| (CDR |s|))))
              (#1#
               (|intloopProcess|
                (|intloopSpadProcess| |n| |lines| |ptree| |interactive|)
                |interactive| (CDR |s|))))))))))
 
; intloopEchoParse s==
;          [dq, stream] := first s
;          [lines, restl] := ncloopDQlines(dq, $lines)
;          setCurrentLine(mkLineList(lines))
;          if $EchoLines then ncloopPrintLines lines
;          $lines := restl
;          cons([[lines, npParse dqToList dq]], rest s)
 
(DEFUN |intloopEchoParse| (|s|)
  (PROG (|LETTMP#1| |dq| |stream| |lines| |restl|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (CAR |s|))
      (SETQ |dq| (CAR |LETTMP#1|))
      (SETQ |stream| (CADR |LETTMP#1|))
      (SETQ |LETTMP#1| (|ncloopDQlines| |dq| |$lines|))
      (SETQ |lines| (CAR |LETTMP#1|))
      (SETQ |restl| (CADR |LETTMP#1|))
      (|setCurrentLine| (|mkLineList| |lines|))
      (COND (|$EchoLines| (|ncloopPrintLines| |lines|)))
      (SETQ |$lines| |restl|)
      (CONS (LIST (LIST |lines| (|npParse| (|dqToList| |dq|)))) (CDR |s|))))))
 
; intloopInclude0(st, name, n) ==
;     $lines:local:=incStream(st,name)
;     intloopProcess(n,false,
;       next(function intloopEchoParse,
;         next(function insertpile,
;           next(function lineoftoks,$lines))))
 
(DEFUN |intloopInclude0| (|st| |name| |n|)
  (PROG (|$lines|)
    (DECLARE (SPECIAL |$lines|))
    (RETURN
     (PROGN
      (SETQ |$lines| (|incStream| |st| |name|))
      (|intloopProcess| |n| NIL
       (|next| #'|intloopEchoParse|
        (|next| #'|insertpile| (|next| #'|lineoftoks| |$lines|))))))))
 
; intloopInclude(name, n) ==
;     handle_input_file(name, function intloopInclude0, [name, n])
;       or error('"File not found")
 
(DEFUN |intloopInclude| (|name| |n|)
  (PROG ()
    (RETURN
     (OR (|handle_input_file| |name| #'|intloopInclude0| (LIST |name| |n|))
         (|error| "File not found")))))
 
; intloopInclude1(name,n) ==
;           a:=ncloopIncFileName name
;           a => intloopInclude(a,n)
;           n
 
(DEFUN |intloopInclude1| (|name| |n|)
  (PROG (|a|)
    (RETURN
     (PROGN
      (SETQ |a| (|ncloopIncFileName| |name|))
      (COND (|a| (|intloopInclude| |a| |n|)) ('T |n|))))))
 
; intloopProcessString(s,n) ==
;      setCurrentLine s
;      intloopProcess(n,true,
;          next(function ncloopParse,
;            next(function lineoftoks,incString s)))
 
(DEFUN |intloopProcessString| (|s| |n|)
  (PROG ()
    (RETURN
     (PROGN
      (|setCurrentLine| |s|)
      (|intloopProcess| |n| T
       (|next| #'|ncloopParse| (|next| #'|lineoftoks| (|incString| |s|))))))))
 
; $pfMacros := []
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$pfMacros| NIL))
 
; clearMacroTable() ==
;    SETF($pfMacros, nil)
 
(DEFUN |clearMacroTable| () (PROG () (RETURN (SETF |$pfMacros| NIL))))
 
; getParserMacros() == $pfMacros
 
(DEFUN |getParserMacros| () (PROG () (RETURN |$pfMacros|)))
 
; displayParserMacro m ==
;    m := ASSQ(m, $pfMacros)
;    NULL m => nil
;    pfPrintSrcLines(CADDR(m))
 
(DEFUN |displayParserMacro| (|m|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |m| (ASSQ |m| |$pfMacros|))
      (COND ((NULL |m|) NIL) ('T (|pfPrintSrcLines| (CADDR |m|))))))))
 
; intSetNeedToSignalSessionManager() ==
;     $NeedToSignalSessionManager := true
 
(DEFUN |intSetNeedToSignalSessionManager| ()
  (PROG () (RETURN (SETQ |$NeedToSignalSessionManager| T))))
 
; intloopSpadProcess(stepNo,lines,ptree,interactive?)==
;     $stepNo:local := stepNo
;     $currentCarrier := cc := ['carrier]
;     ncPutQ(cc, 'stepNumber, stepNo)
;     ncPutQ(cc, 'messages, $ncMsgList)
;     ncPutQ(cc, 'lines, lines)
;     $ncMsgList := nil
;     result := CATCH("SpadCompileItem",
;      CATCH("coerceFailure", CATCH("SPAD_READER",
;        interp(cc, ptree, interactive?)))) where
; 
;         interp(cc, ptree, interactive?) ==
;             ncConversationPhase(function phParse,            [cc, ptree])
;             ncConversationPhase(function phMacro,            [cc])
;             ncConversationPhase(function phIntReportMsgs,[cc, interactive?])
;             ncConversationPhase(function phInterpret,        [cc])
; 
;             #ncEltQ(cc, 'messages) ~= 0 => ncError()
; 
;     intSetNeedToSignalSessionManager()
;     $prevCarrier := $currentCarrier
;     result = 'ncEnd     => stepNo
;     result = 'ncError   => stepNo
;     result = 'ncEndItem => stepNo
;     stepNo+1
 
(DEFUN |intloopSpadProcess| (|stepNo| |lines| |ptree| |interactive?|)
  (PROG (|$stepNo| |result| |cc|)
    (DECLARE (SPECIAL |$stepNo|))
    (RETURN
     (PROGN
      (SETQ |$stepNo| |stepNo|)
      (SETQ |$currentCarrier| (SETQ |cc| (LIST '|carrier|)))
      (|ncPutQ| |cc| '|stepNumber| |stepNo|)
      (|ncPutQ| |cc| '|messages| |$ncMsgList|)
      (|ncPutQ| |cc| '|lines| |lines|)
      (SETQ |$ncMsgList| NIL)
      (SETQ |result|
              (CATCH '|SpadCompileItem|
                (CATCH '|coerceFailure|
                  (CATCH 'SPAD_READER
                    (|intloopSpadProcess,interp| |cc| |ptree|
                     |interactive?|)))))
      (|intSetNeedToSignalSessionManager|)
      (SETQ |$prevCarrier| |$currentCarrier|)
      (COND ((EQ |result| '|ncEnd|) |stepNo|)
            ((EQ |result| '|ncError|) |stepNo|)
            ((EQ |result| '|ncEndItem|) |stepNo|) ('T (+ |stepNo| 1)))))))
(DEFUN |intloopSpadProcess,interp| (|cc| |ptree| |interactive?|)
  (PROG ()
    (RETURN
     (PROGN
      (|ncConversationPhase| #'|phParse| (LIST |cc| |ptree|))
      (|ncConversationPhase| #'|phMacro| (LIST |cc|))
      (|ncConversationPhase| #'|phIntReportMsgs| (LIST |cc| |interactive?|))
      (|ncConversationPhase| #'|phInterpret| (LIST |cc|))
      (COND
       ((NOT (EQL (LENGTH (|ncEltQ| |cc| '|messages|)) 0)) (|ncError|)))))))
 
; phInterpret carrier ==
;   ptree := ncEltQ(carrier, 'ptree)
;   val := intInterpretPform(ptree)
;   ncPutQ(carrier, 'value, val)
 
(DEFUN |phInterpret| (|carrier|)
  (PROG (|ptree| |val|)
    (RETURN
     (PROGN
      (SETQ |ptree| (|ncEltQ| |carrier| '|ptree|))
      (SETQ |val| (|intInterpretPform| |ptree|))
      (|ncPutQ| |carrier| '|value| |val|)))))
 
; intInterpretPform pf ==
;   processInteractive(zeroOneTran(packageTran(pf2Sex pf)), pf)
 
(DEFUN |intInterpretPform| (|pf|)
  (PROG ()
    (RETURN
     (|processInteractive| (|zeroOneTran| (|packageTran| (|pf2Sex| |pf|)))
      |pf|))))
 
; phIntReportMsgs(carrier, interactive?) ==
;     $erMsgToss => 'OK
;     lines := ncEltQ(carrier, 'lines)
;     msgs  := ncEltQ(carrier, 'messages)
;     nerr  := #msgs
;     ncPutQ(carrier, 'ok?, nerr = 0)
;     nerr = 0 => 'OK
;     processMsgList(msgs, lines)
;     intSayKeyedMsg ('S2CTP010,[nerr])
;     'OK
 
(DEFUN |phIntReportMsgs| (|carrier| |interactive?|)
  (PROG (|lines| |msgs| |nerr|)
    (RETURN
     (COND (|$erMsgToss| 'OK)
           (#1='T
            (PROGN
             (SETQ |lines| (|ncEltQ| |carrier| '|lines|))
             (SETQ |msgs| (|ncEltQ| |carrier| '|messages|))
             (SETQ |nerr| (LENGTH |msgs|))
             (|ncPutQ| |carrier| '|ok?| (EQL |nerr| 0))
             (COND ((EQL |nerr| 0) 'OK)
                   (#1#
                    (PROGN
                     (|processMsgList| |msgs| |lines|)
                     (|intSayKeyedMsg| 'S2CTP010 (LIST |nerr|))
                     'OK)))))))))
 
; intSayKeyedMsg(key, args) ==
;   sayKeyedMsg(packageTran key, packageTran args)
 
(DEFUN |intSayKeyedMsg| (|key| |args|)
  (PROG ()
    (RETURN (|sayKeyedMsg| (|packageTran| |key|) (|packageTran| |args|)))))
 
; mkLineList lines ==
;   l := [rest line for line in lines | nonBlank rest line]
;   #l = 1 => first l
;   l
 
(DEFUN |mkLineList| (|lines|)
  (PROG (|l|)
    (RETURN
     (PROGN
      (SETQ |l|
              ((LAMBDA (|bfVar#2| |bfVar#1| |line|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#1|)
                        (PROGN (SETQ |line| (CAR |bfVar#1|)) NIL))
                    (RETURN (NREVERSE |bfVar#2|)))
                   (#1='T
                    (AND (|nonBlank| (CDR |line|))
                         (SETQ |bfVar#2| (CONS (CDR |line|) |bfVar#2|)))))
                  (SETQ |bfVar#1| (CDR |bfVar#1|))))
               NIL |lines| NIL))
      (COND ((EQL (LENGTH |l|) 1) (CAR |l|)) (#1# |l|))))))
 
; nonBlank str ==
;   value := false
;   for i in 0..MAXINDEX str repeat
;     str.i ~= char " " =>
;       value := true
;       return value
;   value
 
(DEFUN |nonBlank| (|str|)
  (PROG (|value|)
    (RETURN
     (PROGN
      (SETQ |value| NIL)
      ((LAMBDA (|bfVar#3| |i|)
         (LOOP
          (COND ((> |i| |bfVar#3|) (RETURN NIL))
                ('T
                 (COND
                  ((NOT (EQUAL (ELT |str| |i|) (|char| '| |)))
                   (IDENTITY (PROGN (SETQ |value| T) (RETURN |value|)))))))
          (SETQ |i| (+ |i| 1))))
       (MAXINDEX |str|) 0)
      |value|))))
 
; ncloopCommand (line,n) ==
;          a:=ncloopPrefix?('")include",line)=>
;                   ncloopInclude1( a,n)
;          InterpExecuteSpadSystemCommand(line)
;          n
 
(DEFUN |ncloopCommand| (|line| |n|)
  (PROG (|a|)
    (RETURN
     (COND
      ((SETQ |a| (|ncloopPrefix?| ")include" |line|))
       (|ncloopInclude1| |a| |n|))
      ('T (PROGN (|InterpExecuteSpadSystemCommand| |line|) |n|))))))
 
; ncloopEscaped x==
;      esc :=false
;      done:=false
;      for i in (# x) - 1 .. 0 by -1 while not done repeat
;          done:=
;               x.i='" ".0 =>false
;               x.i='"__".0=>
;                        esc:=true
;                        true
;               true
;      esc
 
(DEFUN |ncloopEscaped| (|x|)
  (PROG (|esc| |done|)
    (RETURN
     (PROGN
      (SETQ |esc| NIL)
      (SETQ |done| NIL)
      ((LAMBDA (|bfVar#4| |i|)
         (LOOP
          (COND
           ((OR (COND ((MINUSP |bfVar#4|) (< |i| 0)) (T (> |i| 0))) |done|)
            (RETURN NIL))
           (#1='T
            (SETQ |done|
                    (COND ((EQUAL (ELT |x| |i|) (ELT " " 0)) NIL)
                          ((EQUAL (ELT |x| |i|) (ELT "_" 0))
                           (PROGN (SETQ |esc| T) T))
                          (#1# T)))))
          (SETQ |i| (+ |i| |bfVar#4|))))
       (- 1) (- (LENGTH |x|) 1))
      |esc|))))
 
; ncloopDQlines (dq,stream)==
;         StreamNull stream
;         a:= poGlobalLinePosn tokPosn CADR dq
;         b:= poGlobalLinePosn CAAR stream
;         streamChop (a-b+1,stream)
 
(DEFUN |ncloopDQlines| (|dq| |stream|)
  (PROG (|a| |b|)
    (RETURN
     (PROGN
      (|StreamNull| |stream|)
      (SETQ |a| (|poGlobalLinePosn| (|tokPosn| (CADR |dq|))))
      (SETQ |b| (|poGlobalLinePosn| (CAAR |stream|)))
      (|streamChop| (+ (- |a| |b|) 1) |stream|)))))
 
; streamChop(n,s)==
;     if StreamNull s
;     then [nil,nil]
;     else if EQL(n,0)
;          then [nil,s]
;          else
;             [a,b]:= streamChop(n-1,cdr s)
;             line:=car s
;             c := ncloopPrefix?('")command", rest line)
;             d:= cons(car line,if c then c else cdr line)
;             [cons(d,a),b]
 
(DEFUN |streamChop| (|n| |s|)
  (PROG (|LETTMP#1| |a| |b| |line| |c| |d|)
    (RETURN
     (COND ((|StreamNull| |s|) (LIST NIL NIL)) ((EQL |n| 0) (LIST NIL |s|))
           (#1='T (SETQ |LETTMP#1| (|streamChop| (- |n| 1) (CDR |s|)))
            (SETQ |a| (CAR |LETTMP#1|)) (SETQ |b| (CADR |LETTMP#1|))
            (SETQ |line| (CAR |s|))
            (SETQ |c| (|ncloopPrefix?| ")command" (CDR |line|)))
            (SETQ |d| (CONS (CAR |line|) (COND (|c| |c|) (#1# (CDR |line|)))))
            (LIST (CONS |d| |a|) |b|))))))
 
; ncloopPrintLines lines ==
;         for line in lines repeat WRITE_-LINE rest line
;         WRITE_-LINE '" "
 
(DEFUN |ncloopPrintLines| (|lines|)
  (PROG ()
    (RETURN
     (PROGN
      ((LAMBDA (|bfVar#5| |line|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#5|) (PROGN (SETQ |line| (CAR |bfVar#5|)) NIL))
            (RETURN NIL))
           ('T (WRITE-LINE (CDR |line|))))
          (SETQ |bfVar#5| (CDR |bfVar#5|))))
       |lines| NIL)
      (WRITE-LINE " ")))))
 
; ncloopIncFileName string==
;                 fn := incFileName string
;                 not fn =>
;                     WRITE_-LINE (CONCAT(string, '" not found"))
;                     []
;                 fn
 
(DEFUN |ncloopIncFileName| (|string|)
  (PROG (|fn|)
    (RETURN
     (PROGN
      (SETQ |fn| (|incFileName| |string|))
      (COND
       ((NULL |fn|) (PROGN (WRITE-LINE (CONCAT |string| " not found")) NIL))
       ('T |fn|))))))
 
; ncloopParse s==
;          [dq, stream] := first s
;          [lines, .] := ncloopDQlines(dq, stream)
;          cons([[lines, npParse dqToList dq]], rest s)
 
(DEFUN |ncloopParse| (|s|)
  (PROG (|LETTMP#1| |dq| |stream| |lines|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (CAR |s|))
      (SETQ |dq| (CAR |LETTMP#1|))
      (SETQ |stream| (CADR |LETTMP#1|))
      (SETQ |LETTMP#1| (|ncloopDQlines| |dq| |stream|))
      (SETQ |lines| (CAR |LETTMP#1|))
      (CONS (LIST (LIST |lines| (|npParse| (|dqToList| |dq|)))) (CDR |s|))))))
 
; ncloopInclude0(st, name, n) ==
;      $lines:local := incStream(st, name)
;      ncloopProcess(n,false,
;          next(function ncloopEchoParse,
;            next(function insertpile,
;             next(function lineoftoks,$lines))))
 
(DEFUN |ncloopInclude0| (|st| |name| |n|)
  (PROG (|$lines|)
    (DECLARE (SPECIAL |$lines|))
    (RETURN
     (PROGN
      (SETQ |$lines| (|incStream| |st| |name|))
      (|ncloopProcess| |n| NIL
       (|next| #'|ncloopEchoParse|
        (|next| #'|insertpile| (|next| #'|lineoftoks| |$lines|))))))))
 
; ncloopInclude(name, n) ==
;     handle_input_file(name, function ncloopInclude0, [name, n])
;       or error('"File not found")
 
(DEFUN |ncloopInclude| (|name| |n|)
  (PROG ()
    (RETURN
     (OR (|handle_input_file| |name| #'|ncloopInclude0| (LIST |name| |n|))
         (|error| "File not found")))))
 
; ncloopInclude1(name,n) ==
;           a:=ncloopIncFileName name
;           a => ncloopInclude(a,n)
;           n
 
(DEFUN |ncloopInclude1| (|name| |n|)
  (PROG (|a|)
    (RETURN
     (PROGN
      (SETQ |a| (|ncloopIncFileName| |name|))
      (COND (|a| (|ncloopInclude| |a| |n|)) ('T |n|))))))
 
; incString s== incRenumber incLude(0,[s],0,['"strings"] ,[Top])
 
(DEFUN |incString| (|s|)
  (PROG ()
    (RETURN
     (|incRenumber| (|incLude| 0 (LIST |s|) 0 (LIST "strings") (LIST |Top|))))))
 
; ncError() ==
;     THROW("SpadCompileItem",'ncError)
 
(DEFUN |ncError| () (PROG () (RETURN (THROW '|SpadCompileItem| '|ncError|))))
 
; phParse(carrier,ptree) ==
;     phBegin 'Parsing
;     if $ncmParse then
;            nothing
;            intSayKeyedMsg ('S2CTP003,[%pform ptree])
;     ncPutQ(carrier, 'ptree, ptree)
;     'OK
 
(DEFUN |phParse| (|carrier| |ptree|)
  (PROG ()
    (RETURN
     (PROGN
      (|phBegin| '|Parsing|)
      (COND
       (|$ncmParse| (|intSayKeyedMsg| 'S2CTP003 (LIST (|%pform| |ptree|)))))
      (|ncPutQ| |carrier| '|ptree| |ptree|)
      'OK))))
 
; phMacro carrier ==
;     phBegin 'Macroing
;     ptree  := ncEltQ(carrier, 'ptree)
;     ncPutQ(carrier, 'ptreePremacro, ptree)
; 
;     ptree  := macroExpanded ptree
;     if $ncmMacro then
;         intSayKeyedMsg ('S2CTP007,[%pform ptree] )
; 
;     ncPutQ(carrier, 'ptree, ptree)
;     'OK
 
(DEFUN |phMacro| (|carrier|)
  (PROG (|ptree|)
    (RETURN
     (PROGN
      (|phBegin| '|Macroing|)
      (SETQ |ptree| (|ncEltQ| |carrier| '|ptree|))
      (|ncPutQ| |carrier| '|ptreePremacro| |ptree|)
      (SETQ |ptree| (|macroExpanded| |ptree|))
      (COND
       (|$ncmMacro| (|intSayKeyedMsg| 'S2CTP007 (LIST (|%pform| |ptree|)))))
      (|ncPutQ| |carrier| '|ptree| |ptree|)
      'OK))))
 
; phReportMsgs(carrier, interactive?) ==
;     $erMsgToss => 'OK
;     lines := ncEltQ(carrier, 'lines)
;     msgs  := ncEltQ(carrier, 'messages)
;     nerr  := #msgs
;     ncPutQ(carrier, 'ok?, nerr = 0)
;     interactive? and nerr = 0 => 'OK
;     processMsgList(msgs, lines)
;     intSayKeyedMsg ('S2CTP010,[nerr])
;     'OK
 
(DEFUN |phReportMsgs| (|carrier| |interactive?|)
  (PROG (|lines| |msgs| |nerr|)
    (RETURN
     (COND (|$erMsgToss| 'OK)
           (#1='T
            (PROGN
             (SETQ |lines| (|ncEltQ| |carrier| '|lines|))
             (SETQ |msgs| (|ncEltQ| |carrier| '|messages|))
             (SETQ |nerr| (LENGTH |msgs|))
             (|ncPutQ| |carrier| '|ok?| (EQL |nerr| 0))
             (COND ((AND |interactive?| (EQL |nerr| 0)) 'OK)
                   (#1#
                    (PROGN
                     (|processMsgList| |msgs| |lines|)
                     (|intSayKeyedMsg| 'S2CTP010 (LIST |nerr|))
                     'OK)))))))))
 
; ncConversationPhase(fn, args) ==
;     carrier := first args
; 
;     $ncMsgList: local := []
;     $convPhase: local := 'NoPhase
; 
;     UNWIND_-PROTECT( APPLY(fn, args), wrapup(carrier) ) where
;         wrapup(carrier) ==
;             for m in $ncMsgList repeat
;                 ncPutQ(carrier, 'messages, [m, :ncEltQ(carrier, 'messages)])
 
(DEFUN |ncConversationPhase| (|fn| |args|)
  (PROG (|$convPhase| |$ncMsgList| |carrier|)
    (DECLARE (SPECIAL |$convPhase| |$ncMsgList|))
    (RETURN
     (PROGN
      (SETQ |carrier| (CAR |args|))
      (SETQ |$ncMsgList| NIL)
      (SETQ |$convPhase| '|NoPhase|)
      (UNWIND-PROTECT (APPLY |fn| |args|)
        (|ncConversationPhase,wrapup| |carrier|))))))
(DEFUN |ncConversationPhase,wrapup| (|carrier|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#6| |m|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#6|) (PROGN (SETQ |m| (CAR |bfVar#6|)) NIL))
           (RETURN NIL))
          ('T
           (|ncPutQ| |carrier| '|messages|
            (CONS |m| (|ncEltQ| |carrier| '|messages|)))))
         (SETQ |bfVar#6| (CDR |bfVar#6|))))
      |$ncMsgList| NIL))))
 
; ncloopPrefix?(prefix,whole) ==
;      #prefix > #whole => false
;      good:=true
;      for i in 0..#prefix-1 for j in 0.. while good repeat
;                 good:= prefix.i = whole.j
;      if good then SUBSTRING(whole,#prefix,nil) else good
 
(DEFUN |ncloopPrefix?| (|prefix| |whole|)
  (PROG (|good|)
    (RETURN
     (COND ((< (LENGTH |whole|) (LENGTH |prefix|)) NIL)
           (#1='T
            (PROGN
             (SETQ |good| T)
             ((LAMBDA (|bfVar#7| |i| |j|)
                (LOOP
                 (COND ((OR (> |i| |bfVar#7|) (NOT |good|)) (RETURN NIL))
                       (#1#
                        (SETQ |good|
                                (EQUAL (ELT |prefix| |i|) (ELT |whole| |j|)))))
                 (SETQ |i| (+ |i| 1))
                 (SETQ |j| (+ |j| 1))))
              (- (LENGTH |prefix|) 1) 0 0)
             (COND (|good| (SUBSTRING |whole| (LENGTH |prefix|) NIL))
                   (#1# |good|))))))))
 
; phBegin id ==
;     $convPhase := id
;     if $ncmPhase then intSayKeyedMsg('S2CTP021,[id])
 
(DEFUN |phBegin| (|id|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |$convPhase| |id|)
      (COND (|$ncmPhase| (|intSayKeyedMsg| 'S2CTP021 (LIST |id|))))))))
