REM
REM Example bat file for starting PhoenixMiner.exe to mine ETC
REM

setx GPU_FORCE_64BIT_PTR 0
setx GPU_MAX_HEAP_SIZE 100
setx GPU_USE_SYNC_OBJECTS 1
setx GPU_MAX_ALLOC_PERCENT 100
setx GPU_SINGLE_ALLOC_PERCENT 100

REM IMPORTANT: Replace the ETC address with your own ETC wallet address in the -wal option Rig001 is the name of the rig)
PhoenixMiner.exe -pool eu.etc.epool.io:8008 -pool2 us.etc.epool.io:8008 -worker Rig001 -wal 0x48dbda9443746a99ef1b26ab01dd94ac50d7014b -pass x -retrydelay 2
pause

