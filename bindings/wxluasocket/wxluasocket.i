// ===========================================================================
// Purpose:     wxLuaSocket specific wrappers
// Author:      J Winwood, John Labenski
// Created:     14/11/2001
// Copyright:   (c) 2001-2002 Lomtick Software. All rights reserved.
// Licence:     wxWidgets licence
// wxWidgets:   Updated to 2.8.4
// ===========================================================================

%include "wx/defs.h"
%include "wx/object.h"

%include "wxlua/include/wxlstate.h"
%include "wxlua/include/wxlbind.h"


// Show a dialog of the current stack and all of the global data in a wxListCtrl
// This also shows information about the number and kind of userdata items that
// wxLua is tracking and will delete.
// %override void StackDialog()
%function void LuaStackDialog()

// ---------------------------------------------------------------------------
// wxLuaDebugServer

%include "wxluasocket/include/wxldserv.h"

%class %delete wxLuaDebuggerServer, wxEvtHandler
    wxLuaDebuggerServer(int portNumber)

    bool StartServer()
    bool StopServer()
    long StartClient()

    bool AddBreakPoint(const wxString &fileName, int lineNumber)
    bool RemoveBreakPoint(const wxString &fileName, int lineNumber)
    bool ClearAllBreakPoints()
    bool Run(const wxString &fileName, const wxString &buffer)
    bool Step()
    bool StepOver()
    bool StepOut()
    bool Continue()
    bool Break()
    bool Reset()
    bool EvaluateExpr(int exprRef, const wxString &expr)

    void DisplayStackDialog(wxWindow *pParent, wxWindowID id = wxID_ANY)

    long GetDebuggeeProcessId() const
    bool KillDebuggee()

    static wxString GetProgramName()
    static wxString GetNetworkName()
%endclass

// ---------------------------------------------------------------------------
// wxLuaDebugData

//%class %noclassinfo wxLuaDebugData
//%endclass

// ---------------------------------------------------------------------------
// wxLuaDebuggerEvent

%class %delete wxLuaDebuggerEvent, wxEvent
    %define_event wxEVT_WXLUA_DEBUGGER_DEBUGGEE_CONNECTED       // EVT_WXLUA_DEBUGGER_DEBUGGEE_CONNECTED(id, fn)
    %define_event wxEVT_WXLUA_DEBUGGER_DEBUGGEE_DISCONNECTED    // EVT_WXLUA_DEBUGGER_DEBUGGEE_DISCONNECTED(id, fn)
    %define_event wxEVT_WXLUA_DEBUGGER_BREAK                    // EVT_WXLUA_DEBUGGER_BREAK(id, fn)
    %define_event wxEVT_WXLUA_DEBUGGER_PRINT                    // EVT_WXLUA_DEBUGGER_PRINT(id, fn)
    %define_event wxEVT_WXLUA_DEBUGGER_ERROR                    // EVT_WXLUA_DEBUGGER_ERROR(id, fn)
    %define_event wxEVT_WXLUA_DEBUGGER_EXIT                     // EVT_WXLUA_DEBUGGER_EXIT(id, fn)
    %define_event wxEVT_WXLUA_DEBUGGER_STACK_ENUM               // EVT_WXLUA_DEBUGGER_STACK_ENUM(id, fn)
    %define_event wxEVT_WXLUA_DEBUGGER_STACK_ENTRY_ENUM         // EVT_WXLUA_DEBUGGER_STACK_ENTRY_ENUM(id, fn)
    %define_event wxEVT_WXLUA_DEBUGGER_TABLE_ENUM               // EVT_WXLUA_DEBUGGER_TABLE_ENUM(id, fn)
    %define_event wxEVT_WXLUA_DEBUGGER_EVALUATE_EXPR            // EVT_WXLUA_DEBUGGER_EVALUATE_EXPR(id, fn)

    int GetLineNumber() const
    int GetReference() const
    wxString GetFileName() const
    wxString GetMessage() const
    //const wxLuaDebugData GetDebugData() const
%endclass
