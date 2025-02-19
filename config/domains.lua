return {
   -- ref: https://wezfurlong.org/wezterm/config/lua/SshDomain.html
   ssh_domains = {
      {
         name = 'LocalUbuntu',
         remote_address = '192.168.0.88',
         username = 'zibo',
      },
   },
   -- ref: https://wezfurlong.org/wezterm/config/lua/WslDomain.html
   wsl_domains = {
      {
         name = 'WSL:Ubuntu-24.04.1',
         distribution = 'Ubuntu',
      },
   },
   default_domain = 'WSL:Ubuntu-24.04.1',
}
