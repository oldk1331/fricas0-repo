
(/VERSIONCHECK 2) 

(PUT '|OMDEV;OMopenFile;2SOme$;1| '|SPADreplace| 'OM-OPENFILEDEV) 

(DEFUN |OMDEV;OMopenFile;2SOme$;1| (|fname| |fmode| |enc| $)
  (OM-OPENFILEDEV |fname| |fmode| |enc|)) 

(PUT '|OMDEV;OMopenString;SOme$;2| '|SPADreplace| 'OM-OPENSTRINGDEV) 

(DEFUN |OMDEV;OMopenString;SOme$;2| (|str| |enc| $)
  (OM-OPENSTRINGDEV |str| |enc|)) 

(PUT '|OMDEV;OMclose;$V;3| '|SPADreplace| 'OM-CLOSEDEV) 

(DEFUN |OMDEV;OMclose;$V;3| (|dev| $) (OM-CLOSEDEV |dev|)) 

(PUT '|OMDEV;OMsetEncoding;$OmeV;4| '|SPADreplace| 'OM-SETDEVENCODING) 

(DEFUN |OMDEV;OMsetEncoding;$OmeV;4| (|dev| |enc| $)
  (OM-SETDEVENCODING |dev| |enc|)) 

(PUT '|OMDEV;OMputApp;$V;5| '|SPADreplace| 'OM-PUTAPP) 

(DEFUN |OMDEV;OMputApp;$V;5| (|dev| $) (OM-PUTAPP |dev|)) 

(PUT '|OMDEV;OMputAtp;$V;6| '|SPADreplace| 'OM-PUTATP) 

(DEFUN |OMDEV;OMputAtp;$V;6| (|dev| $) (OM-PUTATP |dev|)) 

(PUT '|OMDEV;OMputAttr;$V;7| '|SPADreplace| 'OM-PUTATTR) 

(DEFUN |OMDEV;OMputAttr;$V;7| (|dev| $) (OM-PUTATTR |dev|)) 

(PUT '|OMDEV;OMputBind;$V;8| '|SPADreplace| 'OM-PUTBIND) 

(DEFUN |OMDEV;OMputBind;$V;8| (|dev| $) (OM-PUTBIND |dev|)) 

(PUT '|OMDEV;OMputBVar;$V;9| '|SPADreplace| 'OM-PUTBVAR) 

(DEFUN |OMDEV;OMputBVar;$V;9| (|dev| $) (OM-PUTBVAR |dev|)) 

(PUT '|OMDEV;OMputError;$V;10| '|SPADreplace| 'OM-PUTERROR) 

(DEFUN |OMDEV;OMputError;$V;10| (|dev| $) (OM-PUTERROR |dev|)) 

(PUT '|OMDEV;OMputObject;$V;11| '|SPADreplace| 'OM-PUTOBJECT) 

(DEFUN |OMDEV;OMputObject;$V;11| (|dev| $) (OM-PUTOBJECT |dev|)) 

(PUT '|OMDEV;OMputEndApp;$V;12| '|SPADreplace| 'OM-PUTENDAPP) 

(DEFUN |OMDEV;OMputEndApp;$V;12| (|dev| $) (OM-PUTENDAPP |dev|)) 

(PUT '|OMDEV;OMputEndAtp;$V;13| '|SPADreplace| 'OM-PUTENDATP) 

(DEFUN |OMDEV;OMputEndAtp;$V;13| (|dev| $) (OM-PUTENDATP |dev|)) 

(PUT '|OMDEV;OMputEndAttr;$V;14| '|SPADreplace| 'OM-PUTENDATTR) 

(DEFUN |OMDEV;OMputEndAttr;$V;14| (|dev| $) (OM-PUTENDATTR |dev|)) 

(PUT '|OMDEV;OMputEndBind;$V;15| '|SPADreplace| 'OM-PUTENDBIND) 

(DEFUN |OMDEV;OMputEndBind;$V;15| (|dev| $) (OM-PUTENDBIND |dev|)) 

(PUT '|OMDEV;OMputEndBVar;$V;16| '|SPADreplace| 'OM-PUTENDBVAR) 

(DEFUN |OMDEV;OMputEndBVar;$V;16| (|dev| $) (OM-PUTENDBVAR |dev|)) 

(PUT '|OMDEV;OMputEndError;$V;17| '|SPADreplace| 'OM-PUTENDERROR) 

(DEFUN |OMDEV;OMputEndError;$V;17| (|dev| $) (OM-PUTENDERROR |dev|)) 

(PUT '|OMDEV;OMputEndObject;$V;18| '|SPADreplace| 'OM-PUTENDOBJECT) 

(DEFUN |OMDEV;OMputEndObject;$V;18| (|dev| $) (OM-PUTENDOBJECT |dev|)) 

(PUT '|OMDEV;OMputInteger;$IV;19| '|SPADreplace| 'OM-PUTINT) 

(DEFUN |OMDEV;OMputInteger;$IV;19| (|dev| |i| $) (OM-PUTINT |dev| |i|)) 

(PUT '|OMDEV;OMputFloat;$DfV;20| '|SPADreplace| 'OM-PUTFLOAT) 

(DEFUN |OMDEV;OMputFloat;$DfV;20| (|dev| |f| $) (OM-PUTFLOAT |dev| |f|)) 

(PUT '|OMDEV;OMputVariable;$SV;21| '|SPADreplace| 'OM-PUTVAR) 

(DEFUN |OMDEV;OMputVariable;$SV;21| (|dev| |v| $) (OM-PUTVAR |dev| |v|)) 

(PUT '|OMDEV;OMputString;$SV;22| '|SPADreplace| 'OM-PUTSTRING) 

(DEFUN |OMDEV;OMputString;$SV;22| (|dev| |s| $) (OM-PUTSTRING |dev| |s|)) 

(PUT '|OMDEV;OMputSymbol;$2SV;23| '|SPADreplace| 'OM-PUTSYMBOL) 

(DEFUN |OMDEV;OMputSymbol;$2SV;23| (|dev| |cd| |nm| $)
  (OM-PUTSYMBOL |dev| |cd| |nm|)) 

(PUT '|OMDEV;OMgetApp;$V;24| '|SPADreplace| 'OM-GETAPP) 

(DEFUN |OMDEV;OMgetApp;$V;24| (|dev| $) (OM-GETAPP |dev|)) 

(PUT '|OMDEV;OMgetAtp;$V;25| '|SPADreplace| 'OM-GETATP) 

(DEFUN |OMDEV;OMgetAtp;$V;25| (|dev| $) (OM-GETATP |dev|)) 

(PUT '|OMDEV;OMgetAttr;$V;26| '|SPADreplace| 'OM-GETATTR) 

(DEFUN |OMDEV;OMgetAttr;$V;26| (|dev| $) (OM-GETATTR |dev|)) 

(PUT '|OMDEV;OMgetBind;$V;27| '|SPADreplace| 'OM-GETBIND) 

(DEFUN |OMDEV;OMgetBind;$V;27| (|dev| $) (OM-GETBIND |dev|)) 

(PUT '|OMDEV;OMgetBVar;$V;28| '|SPADreplace| 'OM-GETBVAR) 

(DEFUN |OMDEV;OMgetBVar;$V;28| (|dev| $) (OM-GETBVAR |dev|)) 

(PUT '|OMDEV;OMgetError;$V;29| '|SPADreplace| 'OM-GETERROR) 

(DEFUN |OMDEV;OMgetError;$V;29| (|dev| $) (OM-GETERROR |dev|)) 

(PUT '|OMDEV;OMgetObject;$V;30| '|SPADreplace| 'OM-GETOBJECT) 

(DEFUN |OMDEV;OMgetObject;$V;30| (|dev| $) (OM-GETOBJECT |dev|)) 

(PUT '|OMDEV;OMgetEndApp;$V;31| '|SPADreplace| 'OM-GETENDAPP) 

(DEFUN |OMDEV;OMgetEndApp;$V;31| (|dev| $) (OM-GETENDAPP |dev|)) 

(PUT '|OMDEV;OMgetEndAtp;$V;32| '|SPADreplace| 'OM-GETENDATP) 

(DEFUN |OMDEV;OMgetEndAtp;$V;32| (|dev| $) (OM-GETENDATP |dev|)) 

(PUT '|OMDEV;OMgetEndAttr;$V;33| '|SPADreplace| 'OM-GETENDATTR) 

(DEFUN |OMDEV;OMgetEndAttr;$V;33| (|dev| $) (OM-GETENDATTR |dev|)) 

(PUT '|OMDEV;OMgetEndBind;$V;34| '|SPADreplace| 'OM-GETENDBIND) 

(DEFUN |OMDEV;OMgetEndBind;$V;34| (|dev| $) (OM-GETENDBIND |dev|)) 

(PUT '|OMDEV;OMgetEndBVar;$V;35| '|SPADreplace| 'OM-GETENDBVAR) 

(DEFUN |OMDEV;OMgetEndBVar;$V;35| (|dev| $) (OM-GETENDBVAR |dev|)) 

(PUT '|OMDEV;OMgetEndError;$V;36| '|SPADreplace| 'OM-GETENDERROR) 

(DEFUN |OMDEV;OMgetEndError;$V;36| (|dev| $) (OM-GETENDERROR |dev|)) 

(PUT '|OMDEV;OMgetEndObject;$V;37| '|SPADreplace| 'OM-GETENDOBJECT) 

(DEFUN |OMDEV;OMgetEndObject;$V;37| (|dev| $) (OM-GETENDOBJECT |dev|)) 

(PUT '|OMDEV;OMgetInteger;$I;38| '|SPADreplace| 'OM-GETINT) 

(DEFUN |OMDEV;OMgetInteger;$I;38| (|dev| $) (OM-GETINT |dev|)) 

(PUT '|OMDEV;OMgetFloat;$Df;39| '|SPADreplace| 'OM-GETFLOAT) 

(DEFUN |OMDEV;OMgetFloat;$Df;39| (|dev| $) (OM-GETFLOAT |dev|)) 

(PUT '|OMDEV;OMgetVariable;$S;40| '|SPADreplace| 'OM-GETVAR) 

(DEFUN |OMDEV;OMgetVariable;$S;40| (|dev| $) (OM-GETVAR |dev|)) 

(PUT '|OMDEV;OMgetString;$S;41| '|SPADreplace| 'OM-GETSTRING) 

(DEFUN |OMDEV;OMgetString;$S;41| (|dev| $) (OM-GETSTRING |dev|)) 

(PUT '|OMDEV;OMgetSymbol;$R;42| '|SPADreplace| 'OM-GETSYMBOL) 

(DEFUN |OMDEV;OMgetSymbol;$R;42| (|dev| $) (OM-GETSYMBOL |dev|)) 

(PUT '|OMDEV;OMgetType;$S;43| '|SPADreplace| 'OM-GETTYPE) 

(DEFUN |OMDEV;OMgetType;$S;43| (|dev| $) (OM-GETTYPE |dev|)) 

(DECLAIM (NOTINLINE |OpenMathDevice;|)) 

(DEFUN |OpenMathDevice| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G149)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|OpenMathDevice|)
                . #2=(|OpenMathDevice|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|OpenMathDevice|
                         (LIST (CONS NIL (CONS 1 (|OpenMathDevice;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#) (HREM |$ConstructorCache| '|OpenMathDevice|))))))))))) 

(DEFUN |OpenMathDevice;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|OpenMathDevice|) . #1=(|OpenMathDevice|))
      (LETT $ (GETREFV 56) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|OpenMathDevice| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|OpenMathDevice| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|String|) (|OpenMathEncoding|)
              |OMDEV;OMopenFile;2SOme$;1| |OMDEV;OMopenString;SOme$;2| (|Void|)
              |OMDEV;OMclose;$V;3| |OMDEV;OMsetEncoding;$OmeV;4|
              |OMDEV;OMputApp;$V;5| |OMDEV;OMputAtp;$V;6|
              |OMDEV;OMputAttr;$V;7| |OMDEV;OMputBind;$V;8|
              |OMDEV;OMputBVar;$V;9| |OMDEV;OMputError;$V;10|
              |OMDEV;OMputObject;$V;11| |OMDEV;OMputEndApp;$V;12|
              |OMDEV;OMputEndAtp;$V;13| |OMDEV;OMputEndAttr;$V;14|
              |OMDEV;OMputEndBind;$V;15| |OMDEV;OMputEndBVar;$V;16|
              |OMDEV;OMputEndError;$V;17| |OMDEV;OMputEndObject;$V;18|
              (|Integer|) |OMDEV;OMputInteger;$IV;19| (|DoubleFloat|)
              |OMDEV;OMputFloat;$DfV;20| (|Symbol|)
              |OMDEV;OMputVariable;$SV;21| |OMDEV;OMputString;$SV;22|
              |OMDEV;OMputSymbol;$2SV;23| |OMDEV;OMgetApp;$V;24|
              |OMDEV;OMgetAtp;$V;25| |OMDEV;OMgetAttr;$V;26|
              |OMDEV;OMgetBind;$V;27| |OMDEV;OMgetBVar;$V;28|
              |OMDEV;OMgetError;$V;29| |OMDEV;OMgetObject;$V;30|
              |OMDEV;OMgetEndApp;$V;31| |OMDEV;OMgetEndAtp;$V;32|
              |OMDEV;OMgetEndAttr;$V;33| |OMDEV;OMgetEndBind;$V;34|
              |OMDEV;OMgetEndBVar;$V;35| |OMDEV;OMgetEndError;$V;36|
              |OMDEV;OMgetEndObject;$V;37| |OMDEV;OMgetInteger;$I;38|
              |OMDEV;OMgetFloat;$Df;39| |OMDEV;OMgetVariable;$S;40|
              |OMDEV;OMgetString;$S;41| (|Record| (|:| |cd| 6) (|:| |name| 6))
              |OMDEV;OMgetSymbol;$R;42| |OMDEV;OMgetType;$S;43|)
           '#(|OMsetEncoding| 0 |OMputVariable| 6 |OMputSymbol| 12
              |OMputString| 19 |OMputObject| 25 |OMputInteger| 30 |OMputFloat|
              36 |OMputError| 42 |OMputEndObject| 47 |OMputEndError| 52
              |OMputEndBind| 57 |OMputEndBVar| 62 |OMputEndAttr| 67
              |OMputEndAtp| 72 |OMputEndApp| 77 |OMputBind| 82 |OMputBVar| 87
              |OMputAttr| 92 |OMputAtp| 97 |OMputApp| 102 |OMopenString| 107
              |OMopenFile| 113 |OMgetVariable| 120 |OMgetType| 125
              |OMgetSymbol| 130 |OMgetString| 135 |OMgetObject| 140
              |OMgetInteger| 145 |OMgetFloat| 150 |OMgetError| 155
              |OMgetEndObject| 160 |OMgetEndError| 165 |OMgetEndBind| 170
              |OMgetEndBVar| 175 |OMgetEndAttr| 180 |OMgetEndAtp| 185
              |OMgetEndApp| 190 |OMgetBind| 195 |OMgetBVar| 200 |OMgetAttr| 205
              |OMgetAtp| 210 |OMgetApp| 215 |OMclose| 220)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 55
                                                 '(2 0 10 0 7 12 2 0 10 0 31 32
                                                   3 0 10 0 6 6 34 2 0 10 0 6
                                                   33 1 0 10 0 19 2 0 10 0 27
                                                   28 2 0 10 0 29 30 1 0 10 0
                                                   18 1 0 10 0 26 1 0 10 0 25 1
                                                   0 10 0 23 1 0 10 0 24 1 0 10
                                                   0 22 1 0 10 0 21 1 0 10 0 20
                                                   1 0 10 0 16 1 0 10 0 17 1 0
                                                   10 0 15 1 0 10 0 14 1 0 10 0
                                                   13 2 0 0 6 7 9 3 0 0 6 6 7 8
                                                   1 0 31 0 51 1 0 31 0 55 1 0
                                                   53 0 54 1 0 6 0 52 1 0 10 0
                                                   41 1 0 27 0 49 1 0 29 0 50 1
                                                   0 10 0 40 1 0 10 0 48 1 0 10
                                                   0 47 1 0 10 0 45 1 0 10 0 46
                                                   1 0 10 0 44 1 0 10 0 43 1 0
                                                   10 0 42 1 0 10 0 38 1 0 10 0
                                                   39 1 0 10 0 37 1 0 10 0 36 1
                                                   0 10 0 35 1 0 10 0 11)))))
           '|lookupComplete|)) 

(MAKEPROP '|OpenMathDevice| 'NILADIC T) 
