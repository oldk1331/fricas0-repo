 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; $backslash := char '_\
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$backslash| (|char| '|\\|)))
 
; $runTestFlag := nil          -- referenced by maPrin to stash output
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$runTestFlag| NIL))
 
; $mkTestFlag := nil           -- referenced by READLN to stash input
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$mkTestFlag| NIL))
 
; $mkTestOutputStack := nil    -- saves output for $testStream (see maPrin)
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$mkTestOutputStack| NIL))
 
; $mkTestOutputType := nil     -- saves the type for $testStream
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$mkTestOutputType| NIL))
 
; inputFile2RecordFile(pathname,:option) ==
;   ifn := PATHNAME_-NAME pathname
;   not isExistingFile pathname => throwKeyedMsg("S2IL0003",[namestring ifn])
;   opath := IFCAR option or pathname
;   odirect := pathnameDirectory opath
;   opathname := htMkPath(odirect,ifn,'"rec")
;   -- logically _*PRINT_-ARRAY_* should be local, but Common Lisp
;   -- forces us to omit it.
;   _*PRINT_-ARRAY_* := true
;   $mkTestFlag: local := true
;   $runTestFlag: local := false
;   $mkTestOutputStack: local := nil
;   $mkTestOutputType: local := nil
;   $currentLine: local := nil
;   if isExistingFile opathname then DELETE_-FILE opathname
;   $testStream := MAKE_OUTSTREAM(opathname)
;   CATCH('SPAD_READER, do_read(pathname, nil))
;   --for trailing system commands
;   if not null $currentLine then recordAndPrintTest '(ForSystemCommands)
;   SHUT $testStream
;   opathname
 
(DEFUN |inputFile2RecordFile| (|pathname| &REST |option|)
  (PROG (|$currentLine| |$mkTestOutputType| |$mkTestOutputStack| |$runTestFlag|
         |$mkTestFlag| *PRINT-ARRAY* |opathname| |odirect| |opath| |ifn|)
    (DECLARE
     (SPECIAL |$currentLine| |$mkTestOutputType| |$mkTestOutputStack|
      |$runTestFlag| |$mkTestFlag|))
    (RETURN
     (PROGN
      (SETQ |ifn| (PATHNAME-NAME |pathname|))
      (COND
       ((NULL (|isExistingFile| |pathname|))
        (|throwKeyedMsg| 'S2IL0003 (LIST (|namestring| |ifn|))))
       ('T
        (PROGN
         (SETQ |opath| (OR (IFCAR |option|) |pathname|))
         (SETQ |odirect| (|pathnameDirectory| |opath|))
         (SETQ |opathname| (|htMkPath| |odirect| |ifn| "rec"))
         (SETQ *PRINT-ARRAY* T)
         (SETQ |$mkTestFlag| T)
         (SETQ |$runTestFlag| NIL)
         (SETQ |$mkTestOutputStack| NIL)
         (SETQ |$mkTestOutputType| NIL)
         (SETQ |$currentLine| NIL)
         (COND ((|isExistingFile| |opathname|) (DELETE-FILE |opathname|)))
         (SETQ |$testStream| (MAKE_OUTSTREAM |opathname|))
         (CATCH 'SPAD_READER (|do_read| |pathname| NIL))
         (COND
          ((NULL (NULL |$currentLine|))
           (|recordAndPrintTest| '(|ForSystemCommands|))))
         (SHUT |$testStream|)
         |opathname|)))))))
 
; printRecordFile(pathname,:option) ==
;   $LINELENGTH : local := IFCAR option or 76
;   $printTimeIfTrue: local := nil
;   $printTypeIfTrue: local := true
;   stream := MAKE_INSTREAM(pathname)
;   repeat
;     NULL (PEEK_-CHAR ( true, stream , nil, nil )) => return nil
;     [i,t,:o] := dewritify VMREAD stream
;     sayNewLine()
;     for x in i repeat sayBrightly x
;     sayNewLine()
;     for x in o repeat maPrin x
;     if t~= '(Void) then printTypeAndTime(nil,t)
 
(DEFUN |printRecordFile| (|pathname| &REST |option|)
  (PROG (|$printTypeIfTrue| |$printTimeIfTrue| $LINELENGTH |o| |t| |i|
         |LETTMP#1| |stream|)
    (DECLARE (SPECIAL |$printTypeIfTrue| |$printTimeIfTrue| $LINELENGTH))
    (RETURN
     (PROGN
      (SETQ $LINELENGTH (OR (IFCAR |option|) 76))
      (SETQ |$printTimeIfTrue| NIL)
      (SETQ |$printTypeIfTrue| T)
      (SETQ |stream| (MAKE_INSTREAM |pathname|))
      ((LAMBDA ()
         (LOOP
          (COND (NIL (RETURN NIL))
                (#1='T
                 (COND ((NULL (PEEK-CHAR T |stream| NIL NIL)) (RETURN NIL))
                       (#1#
                        (PROGN
                         (SETQ |LETTMP#1| (|dewritify| (VMREAD |stream|)))
                         (SETQ |i| (CAR |LETTMP#1|))
                         (SETQ |t| (CADR . #2=(|LETTMP#1|)))
                         (SETQ |o| (CDDR . #2#))
                         (|sayNewLine|)
                         ((LAMBDA (|bfVar#1| |x|)
                            (LOOP
                             (COND
                              ((OR (ATOM |bfVar#1|)
                                   (PROGN (SETQ |x| (CAR |bfVar#1|)) NIL))
                               (RETURN NIL))
                              (#1# (|sayBrightly| |x|)))
                             (SETQ |bfVar#1| (CDR |bfVar#1|))))
                          |i| NIL)
                         (|sayNewLine|)
                         ((LAMBDA (|bfVar#2| |x|)
                            (LOOP
                             (COND
                              ((OR (ATOM |bfVar#2|)
                                   (PROGN (SETQ |x| (CAR |bfVar#2|)) NIL))
                               (RETURN NIL))
                              (#1# (|maPrin| |x|)))
                             (SETQ |bfVar#2| (CDR |bfVar#2|))))
                          |o| NIL)
                         (COND
                          ((NOT (EQUAL |t| '(|Void|)))
                           (|printTypeAndTime| NIL |t|)))))))))))))))
 
; verifyRecordFile(pathname) ==
;   ifn := PATHNAME_-NAME pathname
;   sayBrightly ['"Verifying",:bright ifn]
;   not isExistingFile pathname => throwKeyedMsg("S2IL0003",[namestring ifn])
;   stream := MAKE_INSTREAM(pathname)
;   clearCmdAll()
;   result := 'ok
;   for j in 1.. repeat
;     NULL (PEEK_-CHAR ( true, stream ,nil,nil ))=>return nil
;     [i,t,:o] := dewritify VMREAD stream
;     null i => return nil
;     t = 'ForSystemCommands =>
;       return testInput2Output(i,nil)
;         --read trailing system commands
;     [typ,:output] := testInput2Output(i,j)
;     typ = t =>
;       output = o => 'ok
;       result := 'error
;       wasIs(o,output)
;     result := 'error
;     wasIs(o,output,t,typ)
;   suffix := (result = 'ok => '"is ok"; '"has errors")
;   sayBrightly [:bright ifn,suffix]
 
(DEFUN |verifyRecordFile| (|pathname|)
  (PROG (|ifn| |stream| |result| |LETTMP#1| |i| |t| |o| |typ| |output|
         |suffix|)
    (RETURN
     (PROGN
      (SETQ |ifn| (PATHNAME-NAME |pathname|))
      (|sayBrightly| (CONS "Verifying" (|bright| |ifn|)))
      (COND
       ((NULL (|isExistingFile| |pathname|))
        (|throwKeyedMsg| 'S2IL0003 (LIST (|namestring| |ifn|))))
       (#1='T
        (PROGN
         (SETQ |stream| (MAKE_INSTREAM |pathname|))
         (|clearCmdAll|)
         (SETQ |result| '|ok|)
         ((LAMBDA (|j|)
            (LOOP
             (COND (NIL (RETURN NIL))
                   (#1#
                    (COND ((NULL (PEEK-CHAR T |stream| NIL NIL)) (RETURN NIL))
                          (#1#
                           (PROGN
                            (SETQ |LETTMP#1| (|dewritify| (VMREAD |stream|)))
                            (SETQ |i| (CAR |LETTMP#1|))
                            (SETQ |t| (CADR . #2=(|LETTMP#1|)))
                            (SETQ |o| (CDDR . #2#))
                            (COND ((NULL |i|) (RETURN NIL))
                                  ((EQ |t| '|ForSystemCommands|)
                                   (RETURN (|testInput2Output| |i| NIL)))
                                  (#1#
                                   (PROGN
                                    (SETQ |LETTMP#1|
                                            (|testInput2Output| |i| |j|))
                                    (SETQ |typ| (CAR |LETTMP#1|))
                                    (SETQ |output| (CDR |LETTMP#1|))
                                    (COND
                                     ((EQUAL |typ| |t|)
                                      (COND ((EQUAL |output| |o|) '|ok|)
                                            (#1#
                                             (PROGN
                                              (SETQ |result| '|error|)
                                              (|wasIs| |o| |output|)))))
                                     (#1#
                                      (PROGN
                                       (SETQ |result| '|error|)
                                       (|wasIs| |o| |output| |t|
                                        |typ|))))))))))))
             (SETQ |j| (+ |j| 1))))
          1)
         (SETQ |suffix|
                 (COND ((EQ |result| '|ok|) "is ok") (#1# "has errors")))
         (|sayBrightly| (APPEND (|bright| |ifn|) (CONS |suffix| NIL))))))))))
 
; testInput2Output(lines,n) ==
;   $mkTestOutputStack: local := nil
;   $mkTestOutputType: local := nil
;   $mkTestFlag: local := nil
;   $runTestFlag: local := true
;   $testOutput: local := nil
;   evaluateLines lines
;   null n => nil     --return from reading trailing system commands
;   typ := $mkTestOutputType
;   output := NREVERSE $mkTestOutputStack
;   [prefix2String typ,:output]
 
(DEFUN |testInput2Output| (|lines| |n|)
  (PROG (|$testOutput| |$runTestFlag| |$mkTestFlag| |$mkTestOutputType|
         |$mkTestOutputStack| |output| |typ|)
    (DECLARE
     (SPECIAL |$testOutput| |$runTestFlag| |$mkTestFlag| |$mkTestOutputType|
      |$mkTestOutputStack|))
    (RETURN
     (PROGN
      (SETQ |$mkTestOutputStack| NIL)
      (SETQ |$mkTestOutputType| NIL)
      (SETQ |$mkTestFlag| NIL)
      (SETQ |$runTestFlag| T)
      (SETQ |$testOutput| NIL)
      (|evaluateLines| |lines|)
      (COND ((NULL |n|) NIL)
            ('T
             (PROGN
              (SETQ |typ| |$mkTestOutputType|)
              (SETQ |output| (NREVERSE |$mkTestOutputStack|))
              (CONS (|prefix2String| |typ|) |output|))))))))
 
; evaluateLines lines ==
;   file := MAKE_OUTSTREAM('"/tmp/temp.input")
;   for line in lines repeat
; --  stringPrefix?('")read ",line) => 'skip
;     stringPrefix?('")r",line) => 'skip
;     stringPrefix?('")undo )redo",line) => 'skip
;     PRINTEXP(line, file)
;     TERPRI file
;   SHUT file
;   $edit_file : fluid := '"/tmp/temp.input"
;   read_or_compile(false, false)
;     -- can't use $edit_file since it might be reset
;   DELETE_-FILE '"/tmp/temp.input"
 
(DEFUN |evaluateLines| (|lines|)
  (PROG (|$edit_file| |file|)
    (DECLARE (SPECIAL |$edit_file|))
    (RETURN
     (PROGN
      (SETQ |file| (MAKE_OUTSTREAM "/tmp/temp.input"))
      ((LAMBDA (|bfVar#3| |line|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#3|) (PROGN (SETQ |line| (CAR |bfVar#3|)) NIL))
            (RETURN NIL))
           (#1='T
            (COND ((|stringPrefix?| ")r" |line|) '|skip|)
                  ((|stringPrefix?| ")undo )redo" |line|) '|skip|)
                  (#1# (PROGN (PRINTEXP |line| |file|) (TERPRI |file|))))))
          (SETQ |bfVar#3| (CDR |bfVar#3|))))
       |lines| NIL)
      (SHUT |file|)
      (SETQ |$edit_file| "/tmp/temp.input")
      (|read_or_compile| NIL NIL)
      (DELETE-FILE "/tmp/temp.input")))))
 
; wasIs(old,new,:typePart) ==
;   sayBrightly '"*************************************************************"
;   if old ~= new then
;     sayBrightly '"Was ----------> "
;     for x in old repeat maPrin x
;     sayBrightly '"Is -----------> "
;     for x in new repeat maPrin x
;   typePart is [oldtype,newtype] and oldtype ~= newtype =>
;     sayBrightlyNT ['" Type was ---> ",oldtype]
;     pp old
;     sayBrightlyNT ['" Type is  ---> ",newtype]
;     pp new
 
(DEFUN |wasIs| (|old| |new| &REST |typePart|)
  (PROG (|oldtype| |ISTMP#1| |newtype|)
    (RETURN
     (PROGN
      (|sayBrightly|
       "*************************************************************")
      (COND
       ((NOT (EQUAL |old| |new|)) (|sayBrightly| "Was ----------> ")
        ((LAMBDA (|bfVar#4| |x|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#4|) (PROGN (SETQ |x| (CAR |bfVar#4|)) NIL))
              (RETURN NIL))
             (#1='T (|maPrin| |x|)))
            (SETQ |bfVar#4| (CDR |bfVar#4|))))
         |old| NIL)
        (|sayBrightly| "Is -----------> ")
        ((LAMBDA (|bfVar#5| |x|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#5|) (PROGN (SETQ |x| (CAR |bfVar#5|)) NIL))
              (RETURN NIL))
             (#1# (|maPrin| |x|)))
            (SETQ |bfVar#5| (CDR |bfVar#5|))))
         |new| NIL)))
      (COND
       ((AND (CONSP |typePart|)
             (PROGN
              (SETQ |oldtype| (CAR |typePart|))
              (SETQ |ISTMP#1| (CDR |typePart|))
              (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                   (PROGN (SETQ |newtype| (CAR |ISTMP#1|)) #1#)))
             (NOT (EQUAL |oldtype| |newtype|)))
        (PROGN
         (|sayBrightlyNT| (LIST " Type was ---> " |oldtype|))
         (|pp| |old|)
         (|sayBrightlyNT| (LIST " Type is  ---> " |newtype|))
         (|pp| |new|))))))))
 
; htMkPath(directory,name,typ) ==
;   nameType := STRCONC(name,'".",typ)
;   null directory => nameType
;   STRCONC(directory,nameType)
 
(DEFUN |htMkPath| (|directory| |name| |typ|)
  (PROG (|nameType|)
    (RETURN
     (PROGN
      (SETQ |nameType| (STRCONC |name| "." |typ|))
      (COND ((NULL |directory|) |nameType|)
            ('T (STRCONC |directory| |nameType|)))))))
 
; recordAndPrintTest md ==  --called by recordAndPrint
;   input :=
;     STRINGP $currentLine => [$currentLine]
;     fn $currentLine where fn x ==
;       x is [y,:r] =>
;         y.(k := MAXINDEX y) = char '__ =>
;           u := fn r
;           [STRCONC(SUBSTRING(y,0,k),'" ",first u),:rest u]
;         [y,:fn r]
;       x
;   output := NREVERSE $mkTestOutputStack -- set by maPrin
;   PRINT(writify [input,prefix2String md,:output],$testStream)
;   $mkTestOutputStack := nil
 
(DEFUN |recordAndPrintTest| (|md|)
  (PROG (|input| |output|)
    (RETURN
     (PROGN
      (SETQ |input|
              (COND ((STRINGP |$currentLine|) (LIST |$currentLine|))
                    ('T (|recordAndPrintTest,fn| |$currentLine|))))
      (SETQ |output| (NREVERSE |$mkTestOutputStack|))
      (PRINT (|writify| (CONS |input| (CONS (|prefix2String| |md|) |output|)))
             |$testStream|)
      (SETQ |$mkTestOutputStack| NIL)))))
(DEFUN |recordAndPrintTest,fn| (|x|)
  (PROG (|y| |r| |k| |u|)
    (RETURN
     (COND
      ((AND (CONSP |x|)
            (PROGN (SETQ |y| (CAR |x|)) (SETQ |r| (CDR |x|)) #1='T))
       (COND
        ((EQUAL (ELT |y| (SETQ |k| (MAXINDEX |y|))) (|char| '_))
         (PROGN
          (SETQ |u| (|recordAndPrintTest,fn| |r|))
          (CONS (STRCONC (SUBSTRING |y| 0 |k|) " " (CAR |u|)) (CDR |u|))))
        (#1# (CONS |y| (|recordAndPrintTest,fn| |r|)))))
      (#1# |x|)))))
