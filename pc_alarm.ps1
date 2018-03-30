<#
    .SYNOPSIS
    This script will watch and every second check for any mouse movement.  In the event of any movement it will play the caralarm.wav file

    .NOTES
    TURN YOUR SPEAKERS ALL THE WAY UP!!!!!!
    Use this to run @ work - Powershell.exe -ExecutionPolicy Bypass -File .\<filename>.ps1
    Created with PS2.0 -> only version available at work
    Press Ctr-C at the command prompt to exit the script without setting off the alarm or ctr-c to exit when it is going off
    Created by Patrick Maher
#>

#Needed to get the position of the mouse
Add-Type -AssemblyName System.Windows.Forms
#Loop while waiting for a victim
while ($true)
{
  #get the initial position of the cursor
  $initial_position = [System.Windows.Forms.Cursor]::Position
  #wait for a victim
  Start-Sleep -seconds 1
  #get the current position
  $polled_position = [System.Windows.Forms.Cursor]::Position
  #if the position has changed then set off the alarm
  if($initial_position.X -ne $polled_position.X -and $initial_position.Y -ne $polled_position.Y)
  {
      #loop forever MUHHAHAHAHAHAAHAHAHAHAHAHAHAHAHAHAHAAHAHAHAHAHAHAHAHA
      while($true)
      {
        #save a wav file in the same directory as this script and replace the name here
        (New-Object Media.SoundPlayer "caralarm.wav").PlaySync();
      }
  }
}
