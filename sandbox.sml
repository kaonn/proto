(*structure PIO = PrimIO(structure Vector = CharVector *)
                     (*structure VectorSlice=CharVectorSlice *)
                     (*structure Array = CharArray *)
                     (*structure ArraySlice=CharArraySlice *)
                     (*val someElem = #"0"*)
                     (*type pos = int *)
                     (*val compare = Int.compare)*)

(*structure SIO = StreamIO(structure PrimIO = PIO*)
                       (*structure Vector = CharVector*)
                       (*structure VectorSlice=CharVectorSlice *)
                       (*structure Array = CharArray*)
                       (*structure ArraySlice=CharArraySlice *)
                       (*val someElem = #"0")*)

(*structure IIO = ImperativeIO(structure StreamIO = SIO*)
                           (*structure Vector = CharVector*)
                           (*structure Array = CharArray)*)

structure Sandbox =
struct
  val f = TextIO.openIn("test1.c0")
  val lexer = L1lex.makeLexer (fn i => TextIO.inputN(f,i))
  val nextToken = lexer()
end

