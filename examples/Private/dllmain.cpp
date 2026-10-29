// dllmain.cpp - EXAMPLE ONLY
// Shows how to use ErbiumCrashReporter from a DLL (e.g. an Old Fortnite / OGFN plugin).
// Compile this into your own DLL project and link ErbiumCrashReporter.lib.

#include "CrashReporter.h"

#include <Windows.h>

BOOL APIENTRY DllMain(HMODULE hModule, DWORD reason, LPVOID reserved)
{
    switch (reason)
    {
    case DLL_PROCESS_ATTACH:
        DisableThreadLibraryCalls(hModule);
        FCrashReporter::Register();
        break;
    case DLL_PROCESS_DETACH:
        break;
    }
    return TRUE;
}
