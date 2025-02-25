local options = {
   default_prog = {},
   launch_menu = {},
}

options.default_prog = { 'nu' }
options.launch_menu = {
   { label = 'PowerShell 7', args = { 'pwsh', '-NoLogo' }, domain = { DomainName = 'local' } },
   { label = 'NuShell', args = { 'nu' }, domain = { DomainName = 'local' } },
   {
      label = 'Git Bash',
      args = { 'D:\\scoop\\apps\\git\\current\\bin\\bash.exe' },
      domain = { DomainName = 'local' },
   },
   {
      label = 'SSH Ubuntu',
      args = { 'ssh', 'zibo@ubuntu' },
      domain = { DomainName = 'local' },
   },
   {
      label = 'Orcal Cloud',
      args = { 'mosh.exe', 'ubuntu@oraclecloud' },
      domain = { DomainName = 'local' },
   },
   { label = 'Command Prompt', args = { 'cmd' }, domain = { DomainName = 'local' } },
   { label = 'PowerShell 5', args = { 'powershell' }, domain = { DomainName = 'local' } },
}

return options
