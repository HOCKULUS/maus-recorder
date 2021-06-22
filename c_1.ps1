<#
https://MiRUTH.de
admin@miruth.de
TOBIAS HEINE 22.06.2021
MAUS RECORDER v1.0.0.1
#>
$global:datenset = ""
$global:Explorer = ""
$global:List_Import = ""
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()
$global:Explorer = New-Object System.Windows.Forms.OpenFileDialog -Property @{
    InitialDirectory = [Environment]::GetFolderPath("DESKTOP") 
    Filter = 'Text File|*.txt'
}
$CloseToolStripMenuItem = new-object System.Windows.Forms.ToolStripMenuItem
$CloseToolStripMenuItem.Name = "CloseToolStripMenuItem"
$CloseToolStripMenuItem.Size = new-object System.Drawing.Size(152, 22)
$CloseToolStripMenuItem.Text = "&Exit"
$CloseToolStripMenuItem.ShortcutKeyDisplayString = "Alt+F4"
$CloseToolStripMenuItem.ShowShortcutKeys = $true
$CloseToolStripMenuItem.ShortcutKeys = "Alt+F4"
$CloseToolStripMenuItem.BackColor = "#ffffff"
$CloseToolStripMenuItem.add_click({
 $Form.Visible = $false
})
$DonateToolStripMenuItem = new-object System.Windows.Forms.ToolStripMenuItem
$DonateToolStripMenuItem.Name = "DonateToolStripMenuItem"
$DonateToolStripMenuItem.Size = new-object System.Drawing.Size(152, 22)
$DonateToolStripMenuItem.Text = "&Donate"
$DonateToolStripMenuItem.ShortcutKeyDisplayString = "F3"
$DonateToolStripMenuItem.ShowShortcutKeys = $true
$DonateToolStripMenuItem.ShortcutKeys = "F3"
$DonateToolStripMenuItem.BackColor = "#ffffff"
$DonateToolStripMenuItem.add_click({
 start https://www.paypal.com/paypalme/tobiasheine
})
$HelpToolStripMenuItem = new-object System.Windows.Forms.ToolStripMenuItem
$HelpToolStripMenuItem.Name = "HelpToolStripMenuItem"
$HelpToolStripMenuItem.Size = new-object System.Drawing.Size(152, 22)
$HelpToolStripMenuItem.Text = "&Help"
$HelpToolStripMenuItem.ShortcutKeyDisplayString = "F1"
$HelpToolStripMenuItem.ShowShortcutKeys = $true
$HelpToolStripMenuItem.ShortcutKeys = "F1"
$HelpToolStripMenuItem.Enabled = $true
$HelpToolStripMenuItem.BackColor = "#ffffff"
$HelpToolStripMenuItem.add_click({
$global:scan = ""
$global:info = Get-ComputerInfo
foreach($zeile in $global:info){
[string]$global:scan += $global:zeile
}
start "mailto:admin@miruth.de?subject=MAUS RECORDER v1.0.0.1&body=$scan"
})
$HelpToolStripMenuItem.Enabled = $true
$UpdateToolStripMenuItem = new-object System.Windows.Forms.ToolStripMenuItem
$UpdateToolStripMenuItem.Name = "UpdateToolStripMenuItem"
$UpdateToolStripMenuItem.Size = new-object System.Drawing.Size(152, 22)
$UpdateToolStripMenuItem.Text = "&Update"
$UpdateToolStripMenuItem.ShortcutKeyDisplayString = "F4"
$UpdateToolStripMenuItem.ShowShortcutKeys = $true
$UpdateToolStripMenuItem.ShortcutKeys = "F4"
$UpdateToolStripMenuItem.BackColor = "#ffffff"
$UpdateToolStripMenuItem.add_click({
 start https://miruth.de
})

#
# AboutToolStripMenuItem
#
$AboutToolStripMenuItem = new-object System.Windows.Forms.ToolStripMenuItem
$AboutToolStripMenuItem.Name = "DonateToolStripMenuItem"
$AboutToolStripMenuItem.Size = new-object System.Drawing.Size(152, 22)
$AboutToolStripMenuItem.Text = "&About"
$AboutToolStripMenuItem.BackColor = "#ffffff"
$AboutToolStripMenuItem.ShortcutKeyDisplayString = "F2"
$AboutToolStripMenuItem.ShowShortcutKeys = $true
$AboutToolStripMenuItem.ShortcutKeys = "F2"
$AboutToolStripMenuItem.Enabled = $true
$AboutToolStripMenuItem.add_click({
$script = {
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()
$About                            = New-Object system.Windows.Forms.Form
$About.ClientSize                 = New-Object System.Drawing.Point(175,80)
$About.text                       = "MAUS RECODER"
$About.TopMost                    = $true
$About.BackColor                  = [System.Drawing.ColorTranslator]::FromHtml("#fffff")
$About.MainMenuStrip = $MS_Main
$About.Controls.Add($MS_Main)
$About.MinimizeBox = $false
$About.MaximizeBox = $false
$About.ShowInTaskbar = $false
$About.StartPosition = "CenterScreen"
$About.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::None

$logo                          = New-Object system.Windows.Forms.PictureBox
$logo.width                    = 165
$logo.height                   = 55
$logo.location                 = New-Object System.Drawing.Point(5,6)
$logo.imageLocation            = "E:\Bilder\LOGOS, GRAFIKEN & Co\Miruth_LOGO.png"
$logo.SizeMode                 = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "v1.0.0.1"+"`n"+"admin@miruth.de"
$Label1.AutoSize                 = $false
$Label1.width                    = 175
$Label1.height                   = 24
$Label1.TextAlign  = [System.Drawing.ContentAlignment]::MiddleCenter
$Label1.location                 = New-Object System.Drawing.Point(0,55)
$Label1.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$Label1.ForeColor                = [System.Drawing.ColorTranslator]::FromHtml("#000000")

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = "x"
$Label2.AutoSize                 = $false
$Label2.width                    = 9
$Label2.height                   = 9
$Label2.TextAlign  = [System.Drawing.ContentAlignment]::MiddleCenter
$Label2.location                 = New-Object System.Drawing.Point(160,5)
$Label2.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$Label2.ForeColor                = [System.Drawing.ColorTranslator]::FromHtml("#000000")

$exit                          = New-Object system.Windows.Forms.PictureBox
$exit.width                    = 15
$exit.height                   = 15
$exit.location                 = New-Object System.Drawing.Point(155,5)
$exit.imageLocation            = ($PSScriptRoot + "\button_del_gray.ico")
$exit.SizeMode                 = [System.Windows.Forms.PictureBoxSizeMode]::zoom
$Label2.add_click({
$About.Hide()
})
$About.add_MouseDown({
  if ($_.Button -eq [System.Windows.Forms.MouseButtons]::Left){
        $script:mousedown = $true
        $script:m_offset = new-Object System.Drawing.Point
        $script:m_offset.X = $About.PointToScreen($_.Location).X - $About.Location.X
        $script:m_offset.Y = $About.PointToScreen($_.Location).Y - $About.Location.Y
   }
})
$About.add_MouseUp({
  if ($_.Button -eq [System.Windows.Forms.MouseButtons]::Left){
        $script:mousedown = $false
   }
})

$About.add_MouseMove({
    if($script:mousedown){
        $p = new-Object System.Drawing.Point
        $p.X = [System.Windows.Forms.Cursor]::Position.X - $script:m_offset.X
        $p.Y = [System.Windows.Forms.Cursor]::Position.Y - $script:m_offset.Y
        $About.Location = $p
    }
})

$LOGO.add_MouseDown({
  if ($_.Button -eq [System.Windows.Forms.MouseButtons]::Left){
        $script:mousedown = $true
        $script:m_offset = new-Object System.Drawing.Point
        $script:m_offset.X = $About.PointToScreen($_.Location).X - $About.Location.X
        $script:m_offset.Y = $About.PointToScreen($_.Location).Y - $About.Location.Y
   }
})
$LOGO.add_MouseUp({
  if ($_.Button -eq [System.Windows.Forms.MouseButtons]::Left){
        $script:mousedown = $false
   }
})

$LOGO.add_MouseMove({
    if($script:mousedown){
        $p = new-Object System.Drawing.Point
        $p.X = [System.Windows.Forms.Cursor]::Position.X - $script:m_offset.X
        $p.Y = [System.Windows.Forms.Cursor]::Position.Y - $script:m_offset.Y
        $About.Location = $p
    }
})
$About.controls.AddRange(@($Label1,$Label2,$logo))
$About.ShowDialog()

}
Start-Job -Name "About" -ScriptBlock $script
})

#
# SaveToolStripMenuItem
#
$SaveToolStripMenuItem = new-object System.Windows.Forms.ToolStripMenuItem
$SaveToolStripMenuItem.Name = "SaveToolStripMenuItem"
$SaveToolStripMenuItem.Size = new-object System.Drawing.Size(152, 22)
$SaveToolStripMenuItem.Text = "&Play"
$SaveToolStripMenuItem.BackColor = "#ffffff"
$SaveToolStripMenuItem.ShortcutKeyDisplayString = "Strg+P"
$SaveToolStripMenuItem.ShowShortcutKeys = $true
$SaveToolStripMenuItem.ShortcutKeys = "Strg+P"
$SaveToolStripMenuItem.add_click({
 
})


#
# RunToolStripMenuItem
#
$RunToolStripMenuItem = new-object System.Windows.Forms.ToolStripMenuItem
$RunToolStripMenuItem.Name = "RunToolStripMenuItem"
$RunToolStripMenuItem.Size = new-object System.Drawing.Size(152, 22)
$RunToolStripMenuItem.Text = "Record"
$RunToolStripMenuItem.BackColor = "#ffffff"
$RunToolStripMenuItem.ShortcutKeyDisplayString = "Strg+R"
$RunToolStripMenuItem.ShowShortcutKeys = $true
$RunToolStripMenuItem.ShortcutKeys = "Strg+R"
$RunToolStripMenuItem.add_click({

})
$RunToolStripMenuItem.Enabled = $false

    $StopToolStripMenuItem = new-object System.Windows.Forms.ToolStripMenuItem
    $StopToolStripMenuItem.Name = "RunToolStripMenuItem"
    $StopToolStripMenuItem.Size = new-object System.Drawing.Size(152, 22)
    $StopToolStripMenuItem.Text = "Stop"
    $StopToolStripMenuItem.BackColor = "#ffffff"
    $StopToolStripMenuItem.ShortcutKeyDisplayString = "Strg+S"
    $StopToolStripMenuItem.ShowShortcutKeys = $true
    $StopToolStripMenuItem.ShortcutKeys = "Strg+S"
    $StopToolStripMenuItem.add_click({

    })
    $StopToolStripMenuItem.Enabled = $false

#
# ClearToolStripMenuItem
#
$ClearToolStripMenuItem = new-object System.Windows.Forms.ToolStripMenuItem
$ClearToolStripMenuItem.Name = "ClearToolStripMenuItem"
$ClearToolStripMenuItem.Size = new-object System.Drawing.Size(152, 22)
$ClearToolStripMenuItem.Text = "&Clear"
$ClearToolStripMenuItem.BackColor = "#ffffff"
$ClearToolStripMenuItem.ShortcutKeyDisplayString = "Strg+Entf"
$ClearToolStripMenuItem.ShowShortcutKeys = $true
$ClearToolStripMenuItem.ShortcutKeys = "Strg+Entf"
$ClearToolStripMenuItem.add_click({


})

#
# editionToolStripMenuItem
#
$editionToolStripMenuItem = new-object System.Windows.Forms.ToolStripMenuItem
$editionToolStripMenuItem.Name = "editionToolStripMenuItem"
$editionToolStripMenuItem.Size = new-object System.Drawing.Size(51, 20)
$editionToolStripMenuItem.Text = "&Help"
$editionToolStripMenuItem.DropDownItems.AddRange(@($UpdateToolStripMenuItem,$DonateToolStripMenuItem,$AboutToolStripMenuItem,$HelpToolStripMenuItem))



function OnFormClosing_MenuForm($Sender,$e){ 
    # $this represent sender (object)
    # $_ represent  e (eventarg)

    # Allow closing
    $MenuForm.Visible = $false
}

#
# fileToolStripMenuItem
#
$fileToolStripMenuItem = new-object System.Windows.Forms.ToolStripMenuItem
$fileToolStripMenuItem.DropDownItems.AddRange(@($CloseToolStripMenuItem)) #$RunToolStripMenuItem,$StopToolStripMenuItem,$ClearToolStripMenuItem,$SaveToolStripMenuItem,
$fileToolStripMenuItem.Name = "fileToolStripMenuItem"
$fileToolStripMenuItem.Size = new-object System.Drawing.Size(35, 20)
$fileToolStripMenuItem.Text = "&File"


#
# MS_Main
#
$MS_Main = new-object System.Windows.Forms.MenuStrip
$MS_Main.Items.AddRange(@(
$fileToolStripMenuItem,
$editionToolStripMenuItem
))
$MS_Main.Location = new-object System.Drawing.Point(0, 0)
$MS_Main.Name = "MS_Main"
$MS_Main.Size = new-object System.Drawing.Size(354, 24)
$MS_Main.TabIndex = 0
$MS_Main.Text = "menuStrip1"
$MS_Main.ForeColor = "black"
$MS_Main.BackColor = "#ffffff"

$Form                            = New-Object system.Windows.Forms.Form
$Form.AllowTransparency = $true
$Form.Opacity = 1
$Form.ClientSize                 = New-Object System.Drawing.Point(175,80)
$Form.text                       = "MAUS RECODER"
$Form.TopMost                    = $true
$Form.BackColor                  = [System.Drawing.ColorTranslator]::FromHtml("#fffff")
$Form.MainMenuStrip = $MS_Main
$Form.Controls.Add($MS_Main)
$Form.MinimizeBox = $false
$Form.MaximizeBox = $false
$Form.ShowInTaskbar = $false
$Form.StartPosition = "CenterScreen"
$Form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::None
#$Form.Icon = "<<<<<<<<<"#########################################################################################################################

$Form.add_MouseDown({
  if ($_.Button -eq [System.Windows.Forms.MouseButtons]::Left){
        $script:mousedown = $true
        $script:m_offset = new-Object System.Drawing.Point
        $script:m_offset.X = $form.PointToScreen($_.Location).X - $form.Location.X
        $script:m_offset.Y = $form.PointToScreen($_.Location).Y - $form.Location.Y
   }
})
$Form.add_MouseUp({
  if ($_.Button -eq [System.Windows.Forms.MouseButtons]::Left){
        $script:mousedown = $false
   }
})

$Form.add_MouseMove({
    if($script:mousedown){
        $p = new-Object System.Drawing.Point
        $p.X = [System.Windows.Forms.Cursor]::Position.X - $script:m_offset.X
        $p.Y = [System.Windows.Forms.Cursor]::Position.Y - $script:m_offset.Y
        $form.Location = $p
    }
})

$MS_Main.add_MouseDown({
  if ($_.Button -eq [System.Windows.Forms.MouseButtons]::Left){
        $script:mousedown = $true
        $script:m_offset = new-Object System.Drawing.Point
        $script:m_offset.X = $form.PointToScreen($_.Location).X - $form.Location.X
        $script:m_offset.Y = $form.PointToScreen($_.Location).Y - $form.Location.Y
   }
})
$MS_Main.add_MouseUp({
  if ($_.Button -eq [System.Windows.Forms.MouseButtons]::Left){
        $script:mousedown = $false
   }
})

$MS_Main.add_MouseMove({
    if($script:mousedown){
        $p = new-Object System.Drawing.Point
        $p.X = [System.Windows.Forms.Cursor]::Position.X - $script:m_offset.X
        $p.Y = [System.Windows.Forms.Cursor]::Position.Y - $script:m_offset.Y
        $form.Location = $p
    }
})

$Button_rec                          = New-Object system.Windows.Forms.PictureBox
$Button_rec.width                    = 25
$Button_rec.height                   = 25
$Button_rec.location                 = New-Object System.Drawing.Point(15,40)
$Button_rec.imageLocation            = ($PSScriptRoot + "\button_rec.ico")
$Button_rec.SizeMode                 = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$Button_rec.add_click({
if($Button_rec.imageLocation -eq ($PSScriptRoot + "\button_rec.ico")){
$Button_rec.imageLocation            = ($PSScriptRoot + "\button_rec_gray.ico")
$Button_stop.imageLocation            = ($PSScriptRoot + "\button_stop.ico")
$Button_run.imageLocation            = ($PSScriptRoot + "\button_run_gray.ico")
$Button_del.imageLocation            = ($PSScriptRoot + "\button_del_gray.ico")
Remove-Job -Name $job_name -Force
Start-Sleep -Milliseconds 1
$global:job_name = (Get-Date)
$global:record_job = start-job -Name $job_name -ScriptBlock $scripblock -OutVariable Output
do{[System.Windows.Forms.Application]::DoEvents()
Start-Sleep -Milliseconds 1
[void]$Form.Update()
if($Button_rec.imageLocation -eq ($PSScriptRoot + "\button_rec.ico") -or $Form.Visible -eq $false){
Stop-Job -Name $job_name -OutVariable global:OUTPUTV
}
}until($global:record_job.State -ne "Running")
$global:result = Receive-Job -Job $record_job

foreach($part in $result){
    $global:datenset += $part
}
}
})

$Button_stop                          = New-Object system.Windows.Forms.PictureBox
$Button_stop.width                    = 25
$Button_stop.height                   = 25
$Button_stop.location                 = New-Object System.Drawing.Point(55,40)
$Button_stop.imageLocation            = ($PSScriptRoot + "\button_stop_gray.ico")
$Button_stop.SizeMode                 = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$Button_stop.add_click({
if($Button_stop.imageLocation -eq ($PSScriptRoot + "\button_stop.ico")){
$Button_rec.imageLocation            = ($PSScriptRoot + "\button_rec.ico")
$Button_stop.imageLocation            = ($PSScriptRoot + "\button_stop_gray.ico")
$Button_run.imageLocation            = ($PSScriptRoot + "\button_run.ico")
$Button_del.imageLocation            = ($PSScriptRoot + "\button_del.ico")
Stop-Job -Name RUN
}
})

$Button_run                          = New-Object system.Windows.Forms.PictureBox
$Button_run.width                    = 25
$Button_run.height                   = 25
$Button_run.location                 = New-Object System.Drawing.Point(135,40)
$Button_run.imageLocation            = ($PSScriptRoot + "\button_run_gray.ico")
$Button_run.SizeMode                 = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$Button_run.add_click({
if($Button_run.imageLocation -eq ($PSScriptRoot + "\button_run.ico")){
$Button_rec.imageLocation            = ($PSScriptRoot + "\button_rec_gray.ico")
$Button_stop.imageLocation            = ($PSScriptRoot + "\button_stop.ico")
$Button_run.imageLocation            = ($PSScriptRoot + "\button_run_gray.ico")
$Button_del.imageLocation            = ($PSScriptRoot + "\button_del_gray.ico")
$global:run_job = Start-Job -Name "RUN" -ScriptBlock $scripblock2 -ArgumentList $datenset
do{[System.Windows.Forms.Application]::DoEvents()
Start-Sleep -Milliseconds 1
[void]$Form.Update()
}until($global:run_job.State -ne "Running")
}
if($Button_stop.imageLocation -eq ($PSScriptRoot + "\button_stop.ico")){
$Button_rec.imageLocation            = ($PSScriptRoot + "\button_rec.ico")
$Button_stop.imageLocation            = ($PSScriptRoot + "\button_stop_gray.ico")
$Button_run.imageLocation            = ($PSScriptRoot + "\button_run.ico")
$Button_del.imageLocation            = ($PSScriptRoot + "\button_del.ico")
}
})

$Button_del                          = New-Object system.Windows.Forms.PictureBox
$Button_del.width                    = 25
$Button_del.height                   = 25
$Button_del.location                 = New-Object System.Drawing.Point(95,40)
$Button_del.imageLocation            = ($PSScriptRoot + "\button_del_gray.ico")
$Button_del.SizeMode                 = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$Button_del.add_click({
if($Button_del.imageLocation -eq ($PSScriptRoot + "\Button_del.ico")){
$global:datenset = ""
$Button_rec.imageLocation            = ($PSScriptRoot + "\button_rec.ico")
$Button_stop.imageLocation            = ($PSScriptRoot + "\button_stop_gray.ico")
$Button_run.imageLocation            = ($PSScriptRoot + "\button_run_gray.ico")
$Button_del.imageLocation            = ($PSScriptRoot + "\button_del_gray.ico")
}
})

$ProgressBar1                    = New-Object system.Windows.Forms.ProgressBar
$ProgressBar1.width              = 1184
$ProgressBar1.height             = 7
$ProgressBar1.location           = New-Object System.Drawing.Point(16,356)

$ListBox1                        = New-Object System.Windows.Forms.ListView
$ListBox1.width                  = 591
$ListBox1.height                 = 200
$ListBox1.location               = New-Object System.Drawing.Point(16,366)
$ListBox1.FullRowSelect = $true
$ListBox1.GridLines = $false
$ListBox1.HeaderStyle = "Nonclickable"
$ListBox1.BackColor = "#ffffff"
$ListBox1.View = 'Details'
$ListBox1.Columns.Add('Domain')
$ListBox1.Columns.Add('HTML Status')
$ListBox1.Columns.Add('DENIC Status')
$ListBox1.Columns.Add('Last Scan')
$ListBox1.Columns[0].Width = 241
$ListBox1.Columns[1].Width = 78
$ListBox1.Columns[2].Width = 178
$ListBox1.Columns[3].Width = 70
$ListBox1.AutoScrollOffset.X = 1
$ListBox1.AutoScrollOffset.y = 1
#$ListBox1.HotTracking = $true
$ListBox1.AllowColumnReorder       = $true

$ToolTip1                        = New-Object system.Windows.Forms.ToolTip
$ToolTip1.AutomaticDelay = 1567
$ToolTip1.InitialDelay = 1300
$ToolTip1.AutoPopDelay = 2000
$ToolTip1.SetToolTip($Button_rec,"Record")
$ToolTip1.SetToolTip($Button_stop,"Stop")
$ToolTip1.SetToolTip($Button_run,"Play")
$ToolTip1.SetToolTip($Button_del,"Clear")

$Form.controls.AddRange(@($ListBox1,$ProgressBar1,$Button_rec,$Button_stop,$Button_run,$Button_del))
$abbruch = 0
$global:i = 2
$global:timer1 = 0

$scripblock = {
$Source = @'
using System;
using System.Drawing;
using System.Runtime.InteropServices;
using System.Windows.Forms;
public class Clicker
{
//https://msdn.microsoft.com/en-us/library/windows/desktop/ms646270(v=vs.85).aspx
[StructLayout(LayoutKind.Sequential)]
struct INPUT
{ 
    public int        type; // 0 = INPUT_MOUSE,
                            // 1 = INPUT_KEYBOARD
                            // 2 = INPUT_HARDWARE
    public MOUSEINPUT mi;
}

//https://msdn.microsoft.com/en-us/library/windows/desktop/ms646273(v=vs.85).aspx
[StructLayout(LayoutKind.Sequential)]
struct MOUSEINPUT
{
    public int    dx ;
    public int    dy ;
    public int    mouseData ;
    public int    dwFlags;
    public int    time;
    public IntPtr dwExtraInfo;
}

//This covers most use cases although complex mice may have additional buttons
//There are additional constants you can use for those cases, see the msdn page
const int MOUSEEVENTF_MOVED      = 0x0001 ;
const int MOUSEEVENTF_LEFTDOWN   = 0x0002 ;
const int MOUSEEVENTF_LEFTUP     = 0x0004 ;
const int MOUSEEVENTF_RIGHTDOWN  = 0x0008 ;
const int MOUSEEVENTF_RIGHTUP    = 0x0010 ;
const int MOUSEEVENTF_MIDDLEDOWN = 0x0020 ;
const int MOUSEEVENTF_MIDDLEUP   = 0x0040 ;
const int MOUSEEVENTF_WHEEL      = 0x0080 ;
const int MOUSEEVENTF_XDOWN      = 0x0100 ;
const int MOUSEEVENTF_XUP        = 0x0200 ;
const int MOUSEEVENTF_ABSOLUTE   = 0x8000 ;

const int screen_length = 0x10000 ;

//https://msdn.microsoft.com/en-us/library/windows/desktop/ms646310(v=vs.85).aspx
[System.Runtime.InteropServices.DllImport("user32.dll")]
extern static uint SendInput(uint nInputs, INPUT[] pInputs, int cbSize);

public static void LeftClickAtPoint(int x, int y)
{
    //Move the mouse
    INPUT[] input = new INPUT[3];
    input[0].mi.dx = x*(65535/System.Windows.Forms.Screen.PrimaryScreen.Bounds.Width);
    input[0].mi.dy = y*(65535/System.Windows.Forms.Screen.PrimaryScreen.Bounds.Height);
    input[0].mi.dwFlags = MOUSEEVENTF_MOVED | MOUSEEVENTF_ABSOLUTE;
    //Left mouse button down
    input[1].mi.dwFlags = MOUSEEVENTF_LEFTDOWN;
    //Left mouse button up
    input[2].mi.dwFlags = MOUSEEVENTF_LEFTUP;
    SendInput(3, input, Marshal.SizeOf(input[0]));
}
}
'@
Add-Type -TypeDefinition $Source -ReferencedAssemblies System.Windows.Forms,System.Drawing
    Add-Type -TypeDefinition '
    using System;
    using System.IO;
    using System.Diagnostics;
    using System.Runtime.InteropServices;
    using System.Windows.Forms;

    namespace ClickCounter {
      public static class Prog {
        private const int WH_MOUSE_LL = 14;
        private const int WM_LBUTTONDOWN = 0x201;
        private const int WM_RBUTTONDOWN = 0x204;
        private const int WM_MBUTTONDOWN = 0x207;

        private static HookProc hookProc = HookCallback;
        private static IntPtr hookId = IntPtr.Zero;
        private static int keyCode = 0;

        [DllImport("user32.dll")]
        private static extern IntPtr CallNextHookEx(IntPtr hhk, int nCode, IntPtr wParam, IntPtr lParam);

        [DllImport("user32.dll")]
        private static extern bool UnhookWindowsHookEx(IntPtr hhk);

        [DllImport("user32.dll")]
        private static extern IntPtr SetWindowsHookEx(int idHook, HookProc lpfn, IntPtr hMod, uint dwThreadId);

        [DllImport("kernel32.dll")]
        private static extern IntPtr GetModuleHandle(string lpModuleName);

        public static int WaitForClick() {
          hookId = SetHook(hookProc);
          Application.Run();
          UnhookWindowsHookEx(hookId);
          return keyCode;
        }

        private static IntPtr SetHook(HookProc hookProc) {
          IntPtr moduleHandle = GetModuleHandle(Process.GetCurrentProcess().MainModule.ModuleName);
          return SetWindowsHookEx(WH_MOUSE_LL, hookProc, moduleHandle, 0);
        }

        private delegate IntPtr HookProc(int nCode, IntPtr wParam, IntPtr lParam);

        private static IntPtr HookCallback(int nCode, IntPtr wParam, IntPtr lParam) {
          if (nCode >= 0 && (wParam == (IntPtr)WM_LBUTTONDOWN || wParam == (IntPtr)WM_RBUTTONDOWN || wParam == (IntPtr)WM_MBUTTONDOWN)) {
            keyCode = Marshal.ReadInt32(lParam);
            Application.Exit();
          }
          return CallNextHookEx(hookId, nCode, wParam, lParam);
        }
      }
    }
    ' -ReferencedAssemblies System.Windows.Forms
    $global:container = @()
    $global:count = 0
    while(1 -eq 1){
    Start-Sleep -Milliseconds 1
        $a = Get-Date
        [void][ClickCounter.Prog]::WaitForClick()
        $b = Get-Date
        $count++
        $global:container += ,@(""+[System.Windows.Forms.Cursor]::Position.X+","+[System.Windows.Forms.Cursor]::Position.Y+","+[math]::Round(($b - $a).TotalMilliseconds)+",")
    $global:container[($count - 1)]
    }

}

$scripblock2 = {
$Source = @'
using System;
using System.Drawing;
using System.Runtime.InteropServices;
using System.Windows.Forms;
public class Clicker
{
//https://msdn.microsoft.com/en-us/library/windows/desktop/ms646270(v=vs.85).aspx
[StructLayout(LayoutKind.Sequential)]
struct INPUT
{ 
    public int        type; // 0 = INPUT_MOUSE,
                            // 1 = INPUT_KEYBOARD
                            // 2 = INPUT_HARDWARE
    public MOUSEINPUT mi;
}

//https://msdn.microsoft.com/en-us/library/windows/desktop/ms646273(v=vs.85).aspx
[StructLayout(LayoutKind.Sequential)]
struct MOUSEINPUT
{
    public int    dx ;
    public int    dy ;
    public int    mouseData ;
    public int    dwFlags;
    public int    time;
    public IntPtr dwExtraInfo;
}

//This covers most use cases although complex mice may have additional buttons
//There are additional constants you can use for those cases, see the msdn page
const int MOUSEEVENTF_MOVED      = 0x0001 ;
const int MOUSEEVENTF_LEFTDOWN   = 0x0002 ;
const int MOUSEEVENTF_LEFTUP     = 0x0004 ;
const int MOUSEEVENTF_RIGHTDOWN  = 0x0008 ;
const int MOUSEEVENTF_RIGHTUP    = 0x0010 ;
const int MOUSEEVENTF_MIDDLEDOWN = 0x0020 ;
const int MOUSEEVENTF_MIDDLEUP   = 0x0040 ;
const int MOUSEEVENTF_WHEEL      = 0x0080 ;
const int MOUSEEVENTF_XDOWN      = 0x0100 ;
const int MOUSEEVENTF_XUP        = 0x0200 ;
const int MOUSEEVENTF_ABSOLUTE   = 0x8000 ;

const int screen_length = 0x10000 ;

//https://msdn.microsoft.com/en-us/library/windows/desktop/ms646310(v=vs.85).aspx
[System.Runtime.InteropServices.DllImport("user32.dll")]
extern static uint SendInput(uint nInputs, INPUT[] pInputs, int cbSize);

public static void LeftClickAtPoint(int x, int y)
{
    //Move the mouse
    INPUT[] input = new INPUT[3];
    input[0].mi.dx = x*(65535/System.Windows.Forms.Screen.PrimaryScreen.Bounds.Width);
    input[0].mi.dy = y*(65535/System.Windows.Forms.Screen.PrimaryScreen.Bounds.Height);
    input[0].mi.dwFlags = MOUSEEVENTF_MOVED | MOUSEEVENTF_ABSOLUTE;
    //Left mouse button down
    input[1].mi.dwFlags = MOUSEEVENTF_LEFTDOWN;
    //Left mouse button up
    input[2].mi.dwFlags = MOUSEEVENTF_LEFTUP;
    SendInput(3, input, Marshal.SizeOf(input[0]));
}
}
'@
Add-Type -TypeDefinition $Source -ReferencedAssemblies System.Windows.Forms,System.Drawing
    Add-Type -TypeDefinition '
    using System;
    using System.IO;
    using System.Diagnostics;
    using System.Runtime.InteropServices;
    using System.Windows.Forms;

    namespace ClickCounter {
      public static class Prog {
        private const int WH_MOUSE_LL = 14;
        private const int WM_LBUTTONDOWN = 0x201;
        private const int WM_RBUTTONDOWN = 0x204;
        private const int WM_MBUTTONDOWN = 0x207;

        private static HookProc hookProc = HookCallback;
        private static IntPtr hookId = IntPtr.Zero;
        private static int keyCode = 0;

        [DllImport("user32.dll")]
        private static extern IntPtr CallNextHookEx(IntPtr hhk, int nCode, IntPtr wParam, IntPtr lParam);

        [DllImport("user32.dll")]
        private static extern bool UnhookWindowsHookEx(IntPtr hhk);

        [DllImport("user32.dll")]
        private static extern IntPtr SetWindowsHookEx(int idHook, HookProc lpfn, IntPtr hMod, uint dwThreadId);

        [DllImport("kernel32.dll")]
        private static extern IntPtr GetModuleHandle(string lpModuleName);

        public static int WaitForClick() {
          hookId = SetHook(hookProc);
          Application.Run();
          UnhookWindowsHookEx(hookId);
          return keyCode;
        }

        private static IntPtr SetHook(HookProc hookProc) {
          IntPtr moduleHandle = GetModuleHandle(Process.GetCurrentProcess().MainModule.ModuleName);
          return SetWindowsHookEx(WH_MOUSE_LL, hookProc, moduleHandle, 0);
        }

        private delegate IntPtr HookProc(int nCode, IntPtr wParam, IntPtr lParam);

        private static IntPtr HookCallback(int nCode, IntPtr wParam, IntPtr lParam) {
          if (nCode >= 0 && (wParam == (IntPtr)WM_LBUTTONDOWN || wParam == (IntPtr)WM_RBUTTONDOWN || wParam == (IntPtr)WM_MBUTTONDOWN)) {
            keyCode = Marshal.ReadInt32(lParam);
            Application.Exit();
          }
          return CallNextHookEx(hookId, nCode, wParam, lParam);
        }
      }
    }
    ' -ReferencedAssemblies System.Windows.Forms
    $database = [array[]]::new(($args[0] -split ",").Count) #nullen entfernen
    $zäher = 0
    $coun = 1
    foreach($ele in ($args[0] -split ",")){
    $coun++
    if($coun -gt 4){
    $coun = 2
    $zäher ++
    }
    if($coun -lt 4 -or $coun -eq 4 -and $ele.Length -ne 0){
    $database[$zäher] += $ele
    }
    }
    foreach($global:element in $database[0..($database.Count)]){
    [int]$x = $element[0]
    [int]$y = $element[1]
    [Clicker]::LeftClickAtPoint($x*1.004,$y*1.012)
        do{[System.Windows.Forms.Application]::DoEvents()
            Start-Sleep -Milliseconds 1
            $Milliseconds += 1
        }until($Milliseconds -gt $element[2])
        $Milliseconds = 0
    }

}
[void]$Form.ShowDialog()