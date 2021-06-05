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
  
  
