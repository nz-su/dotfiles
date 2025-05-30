local platform = require('utils.platform')

local options = {
  default_prog = {},
  launch_menu = {},
}

if platform.is_win then
  options.default_domain = 'WSL:Ubuntu'
  -- options.default_prog = { 'C:\\Program Files\\Git\\bin\\bash.exe' }
  options.launch_menu = {
    {
      label = 'PowerShell Desktop',
      args = { 'powershell' },
      domain = { DomainName = 'local' },
    },
    {
      label = 'Git Bash',
      args = { 'C:\\Program Files\\Git\\bin\\bash.exe' },
      domain = { DomainName = 'local' },
    },
  }
elseif platform.is_mac then
  options.default_prog = { '/opt/homebrew/bin/fish', '-l' }
  options.launch_menu = {
    { label = 'Bash',    args = { 'bash', '-l' } },
    { label = 'Fish',    args = { '/opt/homebrew/bin/fish', '-l' } },
    { label = 'Nushell', args = { '/opt/homebrew/bin/nu', '-l' } },
    { label = 'Zsh',     args = { 'zsh', '-l' } },
  }
elseif platform.is_linux then
  options.default_prog = { 'fish', '-l' }
  options.launch_menu = {
    { label = 'Bash', args = { 'bash', '-l' } },
    { label = 'Fish', args = { 'fish', '-l' } },
    { label = 'Zsh',  args = { 'zsh', '-l' } },
  }
end

return options
