 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; DEFPARAMETER($prev_line_number, 0)
 
(DEFPARAMETER |$prev_line_number| 0)
 
; DEFPARAMETER($curent_line_number, 0)
 
(DEFPARAMETER |$curent_line_number| 0)
 
; DEFPARAMETER($prev_line, nil)
 
(DEFPARAMETER |$prev_line| NIL)
 
; DEFPARAMETER($curent_line, nil)
 
(DEFPARAMETER |$curent_line| NIL)
 
; DEFPARAMETER($compiler_InteractiveFrame,
;              addBinding('$DomainsInScope,
;                     [["FLUID", :true],
;                       ["special", :(COPY_-TREE $InitialDomainsInScope)]],
;                     addBinding('$Information, nil,
;                                 makeInitialModemapFrame())))
 
(DEFPARAMETER |$compiler_InteractiveFrame|
  (|addBinding| '|$DomainsInScope|
   (LIST (CONS 'FLUID T)
         (CONS '|special| (COPY-TREE |$InitialDomainsInScope|)))
   (|addBinding| '|$Information| NIL (|makeInitialModemapFrame|))))
 
; DEFPARAMETER($NONBLANK, nil)
 
(DEFPARAMETER $NONBLANK NIL)
 
; set_nonblank(val) == SETF($NONBLANK, val)
 
(DEFUN |set_nonblank| (|val|) (PROG () (RETURN (SETF $NONBLANK |val|))))
 
; current_line_number() ==
;     tok := CURRENT_-TOKEN()
;     tok =>
;          pos := TOKEN_-NONBLANK(tok)
;          pos and INTEGERP(pos) => pos
;          nil
;     nil
 
(DEFUN |current_line_number| ()
  (PROG (|pos| |tok|)
    (RETURN
     (PROGN
      (SETQ |tok| (CURRENT-TOKEN))
      (COND
       (|tok|
        (PROGN
         (SETQ |pos| (TOKEN-NONBLANK |tok|))
         (COND ((AND |pos| (INTEGERP |pos|)) |pos|) (#1='T NIL))))
       (#1# NIL))))))
 
; spad_syntax_error(wanted, parsing) ==
;     SPAD_ERROR_LOC(true)
;     if $prev_line then
;         FORMAT(true, '"~&The prior line was:~%~%~5D> ~A~%~%",
;            $prev_line_number, $prev_line)
;     if $curent_line then
;         FORMAT(true, '"~&The current line is:~%~%~5D> ~A~%~%",
;            $curent_line_number, $curent_line)
;     TOKEN_-STACK_-SHOW()
;     THROW('SPAD_READER, nil)
 
(DEFUN |spad_syntax_error| (|wanted| |parsing|)
  (PROG ()
    (RETURN
     (PROGN
      (SPAD_ERROR_LOC T)
      (COND
       (|$prev_line|
        (FORMAT T "~&The prior line was:~%~%~5D> ~A~%~%" |$prev_line_number|
                |$prev_line|)))
      (COND
       (|$curent_line|
        (FORMAT T "~&The current line is:~%~%~5D> ~A~%~%" |$curent_line_number|
                |$curent_line|)))
      (TOKEN-STACK-SHOW)
      (THROW 'SPAD_READER NIL)))))
 
; fakeloopInclude(name, n) ==
;     handle_input_file(name, function fakeloopInclude0, [name, n])
 
(DEFUN |fakeloopInclude| (|name| |n|)
  (PROG ()
    (RETURN
     (|handle_input_file| |name| #'|fakeloopInclude0| (LIST |name| |n|)))))
 
; DEFPARAMETER($COMBLOCKLIST, nil)
 
(DEFPARAMETER $COMBLOCKLIST NIL)
 
; DEFPARAMETER($docList, nil)
 
(DEFPARAMETER |$docList| NIL)
 
; DEFVAR($spad_scanner, false)
 
(DEFVAR |$spad_scanner| NIL)
 
; DEFVAR($restore_list, nil)
 
(DEFVAR |$restore_list| NIL)
 
; spadCompile(name) ==
;     $comp370_apply : local := FUNCTION PRINT_-DEFUN
;     _*FILEACTQ_-APPLY_* : local := FUNCTION PRINT_-DEFUN
;     $SPAD : local := true
;     $BOOT : local := false
;     _*EOF_* : local := false
;     _/EDITFILE : local := name
;     $InteractiveMode : local := false
;     $spad_scanner : local := true
;     $COMBLOCKLIST : local := nil
;     $docList : local := nil
;     $curent_line_number := 0
;     $prev_line := nil
;     $InteractiveFrame : local := $compiler_InteractiveFrame
;     $MacroTable := MAKE_-HASH_-TABLE()
;     $restore_list := nil
;     a := ncloopIncFileName name
;     res := fakeloopInclude(name, nil)
;     true
 
(DEFUN |spadCompile| (|name|)
  (PROG (|$InteractiveFrame| |$docList| $COMBLOCKLIST |$spad_scanner|
         |$InteractiveMode| /EDITFILE *EOF* $BOOT $SPAD *FILEACTQ-APPLY*
         |$comp370_apply| |res| |a|)
    (DECLARE
     (SPECIAL |$InteractiveFrame| |$docList| $COMBLOCKLIST |$spad_scanner|
      |$InteractiveMode| /EDITFILE *EOF* $BOOT $SPAD *FILEACTQ-APPLY*
      |$comp370_apply|))
    (RETURN
     (PROGN
      (SETQ |$comp370_apply| #'PRINT-DEFUN)
      (SETQ *FILEACTQ-APPLY* #'PRINT-DEFUN)
      (SETQ $SPAD T)
      (SETQ $BOOT NIL)
      (SETQ *EOF* NIL)
      (SETQ /EDITFILE |name|)
      (SETQ |$InteractiveMode| NIL)
      (SETQ |$spad_scanner| T)
      (SETQ $COMBLOCKLIST NIL)
      (SETQ |$docList| NIL)
      (SETQ |$curent_line_number| 0)
      (SETQ |$prev_line| NIL)
      (SETQ |$InteractiveFrame| |$compiler_InteractiveFrame|)
      (SETQ |$MacroTable| (MAKE-HASH-TABLE))
      (SETQ |$restore_list| NIL)
      (SETQ |a| (|ncloopIncFileName| |name|))
      (SETQ |res| (|fakeloopInclude| |name| NIL))
      T))))
 
; DEFPARAMETER($toklst, nil)
 
(DEFPARAMETER |$toklst| NIL)
 
; $trans_table := [["id", "IDENTIFIER"], ["key", "KEYWORD"], _
;                   ["string", "SPADSTRING"], ["char", "SPADSTRING"], _
;                   ["integer", "NUMBER"], ["float", "SPADFLOAT"]]
 
(EVAL-WHEN (EVAL LOAD)
  (SETQ |$trans_table|
          (LIST (LIST '|id| 'IDENTIFIER) (LIST '|key| 'KEYWORD)
                (LIST '|string| 'SPADSTRING) (LIST '|char| 'SPADSTRING)
                (LIST '|integer| 'NUMBER) (LIST '|float| 'SPADFLOAT))))
 
; $trans_key := [ _
;                 ["ADD", "add"], _
;                 ["AND", "and"], _
;                 ["ARROW", "->"], _
;                 ["AT", "@"], _
;                 ["BAR", "|"], _
;                 ["BECOMES", ":="], _
;                 ["BY", "by"], _
;                 ["CARAT", "^"], _
;                 ["CASE", "case"], _
;                 ["COERCE", "::"], _
;                 ["COLON", ":"], _
;                 ["COMMA", ","], _
;                 ["DEF", "=="], _
;                 ["DIV", "div"], _
;                 ["DOT", "."], _
;                 ["ELSE", "else"], _
;                 ["EQUAL", "="], _
;                 ["EXIT", "=>"], _
;                 ["EXIT2", "exit"], _
;                 ["EXQUO", "exquo"], _
;                 ["FOR", "for"], _
;                 ["GE", ">="], _
;                 ["GIVES", "+->"], _
;                 ["GT", ">"], _
;                 ["HAS", "has"], _
;                 ["IF", "if"], _
;                 ["IMPORT", "import"], _
;                 ["IN", "in"], _
;                 ["IS", "is"], _
;                 ["LE", "<="], _
;                 ["LEAVE", "leave"], _
;                 ["LT", "<"], _
;                 ["MDEF", "==>"], _
;                 ["MINUS", "-"], _
;                 ["NOT", "not"], _
;                 ["NOTEQUAL", "~="], _
;                 ["OR", "or"], _
;                 ["PLUS", "+"], _
;                 ["QUO", "quo"], _
;                 ["PRETEND", "pretend"], _
;                 ["REM", "rem"], _
;                 ["REPEAT", "repeat"], _
;                 ["RETURN", "return"], _
;                 ["SEG", ".."], _
;                 ["SEMICOLON", ";"], _
;                 ["SLASH", "/"], _
;                 ["THEN", "then"], _
;                 ["TIMES", "*"], _
;                 ["UNTIL", "until"], _
;                 ["WHERE", "where"], _
;                 ["WHILE", "while"], _
;                 ["WITH", "with"], _
;                 ["SETTAB", "("], _
;                 ["BACKSET", ";"], _
;                 ["BACKTAB", ")"], _
;                 ["CATCH", "catch"], _
;                 ["TRY", "try"], _
;                 ["FINALLY", "finally"]]
 
(EVAL-WHEN (EVAL LOAD)
  (SETQ |$trans_key|
          (LIST (LIST 'ADD '|add|) (LIST 'AND '|and|) (LIST 'ARROW '->)
                (LIST 'AT '@) (LIST 'BAR '|\||) (LIST 'BECOMES '|:=|)
                (LIST 'BY '|by|) (LIST 'CARAT '^) (LIST 'CASE '|case|)
                (LIST 'COERCE '|::|) (LIST 'COLON '|:|) (LIST 'COMMA '|,|)
                (LIST 'DEF '==) (LIST 'DIV '|div|) (LIST 'DOT '|.|)
                (LIST 'ELSE '|else|) (LIST 'EQUAL '=) (LIST 'EXIT '=>)
                (LIST 'EXIT2 '|exit|) (LIST 'EXQUO '|exquo|) (LIST 'FOR '|for|)
                (LIST 'GE '>=) (LIST 'GIVES '+->) (LIST 'GT '>)
                (LIST 'HAS '|has|) (LIST 'IF '|if|) (LIST 'IMPORT '|import|)
                (LIST 'IN '|in|) (LIST 'IS '|is|) (LIST 'LE '<=)
                (LIST 'LEAVE '|leave|) (LIST 'LT '<) (LIST 'MDEF '==>)
                (LIST 'MINUS '-) (LIST 'NOT '|not|) (LIST 'NOTEQUAL '~=)
                (LIST 'OR '|or|) (LIST 'PLUS '+) (LIST 'QUO '|quo|)
                (LIST 'PRETEND '|pretend|) (LIST 'REM '|rem|)
                (LIST 'REPEAT '|repeat|) (LIST 'RETURN '|return|)
                (LIST 'SEG '|..|) (LIST 'SEMICOLON '|;|) (LIST 'SLASH '/)
                (LIST 'THEN '|then|) (LIST 'TIMES '*) (LIST 'UNTIL '|until|)
                (LIST 'WHERE '|where|) (LIST 'WHILE '|while|)
                (LIST 'WITH '|with|) (LIST 'SETTAB '|(|) (LIST 'BACKSET '|;|)
                (LIST 'BACKTAB '|)|) (LIST 'CATCH '|catch|) (LIST 'TRY '|try|)
                (LIST 'FINALLY '|finally|))))
 
; $trans_key_id := [ _
;                 ["BREAK", "break"], _
;                 ["DEFAULT", "default"], _
;                 ["FREE", "free"], _
;                 ["RULE", "rule"], _
;                 ["fooo", "baaar"] _
;                 ]
 
(EVAL-WHEN (EVAL LOAD)
  (SETQ |$trans_key_id|
          (LIST (LIST 'BREAK '|break|) (LIST 'DEFAULT '|default|)
                (LIST 'FREE '|free|) (LIST 'RULE '|rule|)
                (LIST '|fooo| '|baaar|))))
 
; DEFVAR($paren_level)
 
(DEFVAR |$paren_level|)
 
; DEFVAR($settab_level)
 
(DEFVAR |$settab_level|)
 
; DEFVAR($tab_states)
 
(DEFVAR |$tab_states|)
 
; DEFVAR($ignored_tab)
 
(DEFVAR |$ignored_tab|)
 
; DEFVAR($ignorable_backset)
 
(DEFVAR |$ignorable_backset|)
 
; ntokreader(token) ==
;     nonblank_flag := nil
;     set_nonblank(nil)
;     if $toklst then
;         tok1 := first $toklst
;         $toklst := rest $toklst
;         type1 := first(tok1)
;         sym := tok1.1
;         pos := tok1.4
;         line_info := first(rest(pos))
;         line_no := first(rest(rest(line_info)))
;         if not($curent_line_number = line_no) then
;             $prev_line := $curent_line
;             $prev_line_number := $curent_line_number
;             $curent_line := line_info.1
;             $curent_line_number := line_no
;         if type1 = "integer" and STRINGP(sym) then
;             sym := READ_-FROM_-STRING(sym)
;         if type1 = "float" then
;             mant_i := READ_-FROM_-STRING(first(sym))
;             exp := READ_-FROM_-STRING(sym.2)
;             mant_fl := #(sym.1)
;             mant_f := READ_-FROM_-STRING(sym.1)
;             sym := make_float(mant_i, mant_f, mant_fl, exp)
;         if sym = "(" and type1 = "key" and tok1.3 = "nonblank" then
;             nonblank_flag := true
;             set_nonblank(true) 
;         type := ASSQ(type1, $trans_table)
;         greater_SI($paren_level, 0) and type1 = "key" and _
;           sym in ["BACKSET", "BACKTAB", "SETTAB"] =>
;             if sym = "SETTAB" then
;                 $settab_level := inc_SI($settab_level)
;             if sym = "BACKTAB" then
;                 $settab_level := dec_SI($settab_level)
;             ntokreader(token)
;         greater_SI($settab_level, 0) and type1 = "key" and sym = "BACKTAB" =>
;             $settab_level := dec_SI($settab_level)
;             ntokreader(token)
;         -- Fix bad piles 
;         if type1 = "key" and sym = "BACKSET" and $toklst then
;             ntok1 := first $toklst
;             ntype1 := first(ntok1)
;             nsym := ntok1.1
;             if ntype1 = "key" and nsym in ["THEN", "ELSE"] then
;                 return ntokreader(token)
;         type1 = "key" and sym = "BACKSET" and $ignorable_backset =>
;             ntokreader(token)
;         if type1 = "key" and sym in ["[", "COMMA", "SEMICOLON"] then
;             $ignorable_backset := true
;         else
;             $ignorable_backset := false
;         if type1 = "key" and sym = "SETTAB" and $toklst then
;             ntok1 := first $toklst
;             ntype1 := first(ntok1)
;             nsym := ntok1.1
;             if ntype1 = "key" and nsym in ["THEN", "ELSE",
;                   "COMMA", "SEMICOLON"] then
;                 PUSH($ignored_tab, $tab_states)
;                 $ignored_tab := true
;                 return ntokreader(token)
;             else
;                 PUSH($ignored_tab, $tab_states)
;                 $ignored_tab := false
;         if type1 = "key" and sym = "BACKSET" and $ignored_tab then
;             return ntokreader(token)
;         if type1 = "key" and sym = "BACKTAB" then
;             $ignored_tab0 := $ignored_tab
;             $ignored_tab := POP($tab_states)
;             if $ignored_tab0 then
;                 return ntokreader(token)
;         if type then
;             type := type.1
;         else
;             SAY([sym, type1])
;         if type1 = "key" then
;             sym = "(" =>
;                 $paren_level := inc_SI($paren_level)
;             sym = ")" =>
;                 $paren_level := dec_SI($paren_level)
;             sym = "#1" => type := "ARGUMENT-DESIGNATOR"
;             sym1 := ASSQ(sym, $trans_key)
;             sym2 := ASSQ(sym, $trans_key_id)
;             if sym2 then
;                 type := "IDENTIFIER"
;                 sym1 := sym2
;             sym :=
;                 sym1 => sym1.1
;                 sym
;         TOKEN_-INSTALL(sym, type, token, line_no)
;     else
;         TOKEN_-INSTALL(nil, "*EOF", token, nil)
 
(DEFUN |ntokreader| (|token|)
  (PROG (|nonblank_flag| |tok1| |type1| |sym| |pos| |line_info| |line_no|
         |mant_i| |exp| |mant_fl| |mant_f| |type| |ntok1| |ntype1| |nsym|
         |sym1| |sym2|)
    (RETURN
     (PROGN
      (SETQ |nonblank_flag| NIL)
      (|set_nonblank| NIL)
      (COND
       (|$toklst| (SETQ |tok1| (CAR |$toklst|))
        (SETQ |$toklst| (CDR |$toklst|)) (SETQ |type1| (CAR |tok1|))
        (SETQ |sym| (ELT |tok1| 1)) (SETQ |pos| (ELT |tok1| 4))
        (SETQ |line_info| (CAR (CDR |pos|)))
        (SETQ |line_no| (CAR (CDR (CDR |line_info|))))
        (COND
         ((NULL (EQUAL |$curent_line_number| |line_no|))
          (SETQ |$prev_line| |$curent_line|)
          (SETQ |$prev_line_number| |$curent_line_number|)
          (SETQ |$curent_line| (ELT |line_info| 1))
          (SETQ |$curent_line_number| |line_no|)))
        (COND
         ((AND (EQ |type1| '|integer|) (STRINGP |sym|))
          (SETQ |sym| (READ-FROM-STRING |sym|))))
        (COND
         ((EQ |type1| '|float|) (SETQ |mant_i| (READ-FROM-STRING (CAR |sym|)))
          (SETQ |exp| (READ-FROM-STRING (ELT |sym| 2)))
          (SETQ |mant_fl| (LENGTH (ELT |sym| 1)))
          (SETQ |mant_f| (READ-FROM-STRING (ELT |sym| 1)))
          (SETQ |sym| (|make_float| |mant_i| |mant_f| |mant_fl| |exp|))))
        (COND
         ((AND (EQ |sym| '|(|) (EQ |type1| '|key|)
               (EQ (ELT |tok1| 3) '|nonblank|))
          (SETQ |nonblank_flag| T) (|set_nonblank| T)))
        (SETQ |type| (ASSQ |type1| |$trans_table|))
        (COND
         ((AND (|greater_SI| |$paren_level| 0) (EQ |type1| '|key|)
               (|member| |sym| (LIST 'BACKSET 'BACKTAB 'SETTAB)))
          (PROGN
           (COND
            ((EQ |sym| 'SETTAB)
             (SETQ |$settab_level| (|inc_SI| |$settab_level|))))
           (COND
            ((EQ |sym| 'BACKTAB)
             (SETQ |$settab_level| (|dec_SI| |$settab_level|))))
           (|ntokreader| |token|)))
         ((AND (|greater_SI| |$settab_level| 0) (EQ |type1| '|key|)
               (EQ |sym| 'BACKTAB))
          (PROGN
           (SETQ |$settab_level| (|dec_SI| |$settab_level|))
           (|ntokreader| |token|)))
         (#1='T
          (PROGN
           (COND
            ((AND (EQ |type1| '|key|) (EQ |sym| 'BACKSET) |$toklst|)
             (SETQ |ntok1| (CAR |$toklst|)) (SETQ |ntype1| (CAR |ntok1|))
             (SETQ |nsym| (ELT |ntok1| 1))
             (COND
              ((AND (EQ |ntype1| '|key|) (|member| |nsym| (LIST 'THEN 'ELSE)))
               (RETURN (|ntokreader| |token|))))))
           (COND
            ((AND (EQ |type1| '|key|) (EQ |sym| 'BACKSET) |$ignorable_backset|)
             (|ntokreader| |token|))
            (#1#
             (PROGN
              (COND
               ((AND (EQ |type1| '|key|)
                     (|member| |sym| (LIST '[ 'COMMA 'SEMICOLON)))
                (SETQ |$ignorable_backset| T))
               (#1# (SETQ |$ignorable_backset| NIL)))
              (COND
               ((AND (EQ |type1| '|key|) (EQ |sym| 'SETTAB) |$toklst|)
                (SETQ |ntok1| (CAR |$toklst|)) (SETQ |ntype1| (CAR |ntok1|))
                (SETQ |nsym| (ELT |ntok1| 1))
                (COND
                 ((AND (EQ |ntype1| '|key|)
                       (|member| |nsym| (LIST 'THEN 'ELSE 'COMMA 'SEMICOLON)))
                  (PUSH |$ignored_tab| |$tab_states|) (SETQ |$ignored_tab| T)
                  (RETURN (|ntokreader| |token|)))
                 (#1# (PUSH |$ignored_tab| |$tab_states|)
                  (SETQ |$ignored_tab| NIL)))))
              (COND
               ((AND (EQ |type1| '|key|) (EQ |sym| 'BACKSET) |$ignored_tab|)
                (RETURN (|ntokreader| |token|))))
              (COND
               ((AND (EQ |type1| '|key|) (EQ |sym| 'BACKTAB))
                (SETQ |$ignored_tab0| |$ignored_tab|)
                (SETQ |$ignored_tab| (POP |$tab_states|))
                (COND (|$ignored_tab0| (RETURN (|ntokreader| |token|))))))
              (COND (|type| (SETQ |type| (ELT |type| 1)))
                    (#1# (SAY (LIST |sym| |type1|))))
              (COND
               ((EQ |type1| '|key|)
                (COND
                 ((EQ |sym| '|(|)
                  (SETQ |$paren_level| (|inc_SI| |$paren_level|)))
                 ((EQ |sym| '|)|)
                  (SETQ |$paren_level| (|dec_SI| |$paren_level|)))
                 ((EQ |sym| '|#1|) (SETQ |type| 'ARGUMENT-DESIGNATOR))
                 (#1#
                  (PROGN
                   (SETQ |sym1| (ASSQ |sym| |$trans_key|))
                   (SETQ |sym2| (ASSQ |sym| |$trans_key_id|))
                   (COND
                    (|sym2| (SETQ |type| 'IDENTIFIER) (SETQ |sym1| |sym2|)))
                   (SETQ |sym| (COND (|sym1| (ELT |sym1| 1)) (#1# |sym|))))))))
              (TOKEN-INSTALL |sym| |type| |token| |line_no|))))))))
       (#1# (TOKEN-INSTALL NIL '*EOF |token| NIL)))))))
 
; DEFVAR($token_reader)
 
(DEFVAR |$token_reader|)
 
; fakeloopInclude0(st, name, n) ==
;     $lines : local := incStream(st, name)
;     $token_reader := function ntokreader
;     fakeloopProcess(n,
;       next(function insertpile,
;         next(function lineoftoks,$lines)))
;     nil
 
(DEFUN |fakeloopInclude0| (|st| |name| |n|)
  (PROG (|$lines|)
    (DECLARE (SPECIAL |$lines|))
    (RETURN
     (PROGN
      (SETQ |$lines| (|incStream| |st| |name|))
      (SETQ |$token_reader| #'|ntokreader|)
      (|fakeloopProcess| |n|
       (|next| #'|insertpile| (|next| #'|lineoftoks| |$lines|)))
      NIL))))
 
; fakeloopProcess1(tok_list) ==
;     $toklst := tok_list
;     $paren_level := 0
;     $settab_level := 0
;     $tab_states := nil
;     $ignored_tab := false
;     $ignorable_backset := false
;     finish_comment()
;     TOKEN_-STACK_-CLEAR()
;     parse_new_expr()
;     parseout := pop_stack_1()
;     if parseout then S_process(parseout)
;     nil
 
(DEFUN |fakeloopProcess1| (|tok_list|)
  (PROG (|parseout|)
    (RETURN
     (PROGN
      (SETQ |$toklst| |tok_list|)
      (SETQ |$paren_level| 0)
      (SETQ |$settab_level| 0)
      (SETQ |$tab_states| NIL)
      (SETQ |$ignored_tab| NIL)
      (SETQ |$ignorable_backset| NIL)
      (|finish_comment|)
      (TOKEN-STACK-CLEAR)
      (|parse_new_expr|)
      (SETQ |parseout| (|pop_stack_1|))
      (COND (|parseout| (|S_process| |parseout|)))
      NIL))))
 
; processSymbol(s) ==
;     sym1 := first s
;     pos := first(rest(sym1))
;     npos := rest rest pos
;     rest rest sym1 => [first sym1, rest s, npos, "nonblank", pos]
;     [first sym1, rest s, npos, false, pos]
 
(DEFUN |processSymbol| (|s|)
  (PROG (|sym1| |pos| |npos|)
    (RETURN
     (PROGN
      (SETQ |sym1| (CAR |s|))
      (SETQ |pos| (CAR (CDR |sym1|)))
      (SETQ |npos| (CDR (CDR |pos|)))
      (COND
       ((CDR (CDR |sym1|))
        (LIST (CAR |sym1|) (CDR |s|) |npos| '|nonblank| |pos|))
       ('T (LIST (CAR |sym1|) (CDR |s|) |npos| NIL |pos|)))))))
 
; processCommand(line) ==
;     cl := rest(line)
;     InterpExecuteSpadSystemCommand(cl)
 
(DEFUN |processCommand| (|line|)
  (PROG (|cl|)
    (RETURN
     (PROGN (SETQ |cl| (CDR |line|)) (|InterpExecuteSpadSystemCommand| |cl|)))))
 
; fakeloopProcess(n, s) ==
;     StreamNull s => nil
;     lp := first s
;     line := first first lp
;     kind := first first first line
;     kind = "command" =>
;         processCommand(first(line))
;         fakeloopProcess(n, rest s)
;     nline := [processSymbol(sym) for sym in line]
;     fakeloopProcess1(nline)
;     fakeloopProcess(n, rest s)
 
(DEFUN |fakeloopProcess| (|n| |s|)
  (PROG (|lp| |line| |kind| |nline|)
    (RETURN
     (COND ((|StreamNull| |s|) NIL)
           (#1='T
            (PROGN
             (SETQ |lp| (CAR |s|))
             (SETQ |line| (CAR (CAR |lp|)))
             (SETQ |kind| (CAR (CAR (CAR |line|))))
             (COND
              ((EQ |kind| '|command|)
               (PROGN
                (|processCommand| (CAR |line|))
                (|fakeloopProcess| |n| (CDR |s|))))
              (#1#
               (PROGN
                (SETQ |nline|
                        ((LAMBDA (|bfVar#2| |bfVar#1| |sym|)
                           (LOOP
                            (COND
                             ((OR (ATOM |bfVar#1|)
                                  (PROGN (SETQ |sym| (CAR |bfVar#1|)) NIL))
                              (RETURN (NREVERSE |bfVar#2|)))
                             (#1#
                              (SETQ |bfVar#2|
                                      (CONS (|processSymbol| |sym|)
                                            |bfVar#2|))))
                            (SETQ |bfVar#1| (CDR |bfVar#1|))))
                         NIL |line| NIL))
                (|fakeloopProcess1| |nline|)
                (|fakeloopProcess| |n| (CDR |s|)))))))))))
