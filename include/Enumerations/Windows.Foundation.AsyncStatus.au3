#include-once
Global $mAsyncStatus[]
$mAsyncStatus[$ASYNC_Started] = "Started"
$mAsyncStatus[$ASYNC_Completed] = "Completed"
$mAsyncStatus[$ASYNC_Canceled] = "Canceled"
$mAsyncStatus[$ASYNC_Error] = "Error"

__WinRT_AddReverseMappings($mAsyncStatus)