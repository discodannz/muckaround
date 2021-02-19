# Test how long it takes to list a directory on the P: drive
(get-date | Out-String).Trim() >>  c:\temp\test.log # Print the current date to test.log
(measure-command { Get-ChildItem -Recurse C:\Users\disco\Documents\ } | # Perform a directory listing (wrapped in measure-command, which checks how long it takes)
 Select-Object -Property Milliseconds | # selecting only the milliseconds property and
 Format-List | Out-String).Trim() >> c:\temp\test.log # Removing blank lines with the out-string command
echo "`n" >> c:\temp\test.log # Write an empty line to the log as a separator
