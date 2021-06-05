#define ARRAYCOPY(Dest, Source)                                                               \
  if (ArraySize(Source) > 0)                                                                  \
  {                                                                                           \
    const int handleRAM = FileOpen("\\\\REN\\pipe\\RAM", FILE_READ | FILE_WRITE | FILE_BIN);  \
    if (handleRAM != INVALID_HANDLE)                                                          \
    {                                                                                         \
      if (FileWriteArray(handleRAM, Source) > 0)                                              \
        FileReadArray(handleRAM, Dest);                                                       \
      FileClose(handleRAM);                                                                   \
      FileDelete(handleRAM);                                                                  \
    }                                                                                         \
  }                                                                                           \
  
  
string GetTickFlag( uint tickflag )
{
   string flag = "";
#define TICKFLAG_MACRO(A) flag += ((bool)(tickflag & TICK_FLAG_##A)) ? " TICK_FLAG_" + #A : "";
   TICKFLAG_MACRO(BID)
   TICKFLAG_MACRO(ASK)
   TICKFLAG_MACRO(LAST)
   TICKFLAG_MACRO(VOLUME)
   TICKFLAG_MACRO(BUY)
   TICKFLAG_MACRO(SELL)
#undef TICKFLAG_MACRO
   if (flag == "")
      flag = " FLAG_UNKNOWN (" + (string)tickflag + ")";
   return(flag);
}
#define TOSTRING(A) " " + #A + " = " + (string)Tick.A
string TickToString( const MqlTick &Tick )
{
   return(TOSTRING(time) + "." + (string)IntegerToString(Tick.time_msc % 1000, 3, '0') +
          TOSTRING(bid) + TOSTRING(ask) + TOSTRING(last) + TOSTRING(volume) + GetTickFlag(Tick.flags));
}
/* // Example
   MqlTick Tick;
   if (SymbolInfoTick(_Symbol, Tick))
      Print(TickToString(Tick));
*/



