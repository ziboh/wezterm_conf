return {
   -- ref: https://wezfurlong.org/wezterm/config/lua/SshDomain.html
   ssh_domains = {
      {
         name = 'OracleUbuntu',
         remote_address = 'a.sharezhou.eu.org',
         username = 'ubuntu',
      },
   },
   -- ref: https://wezfurlong.org/wezterm/config/lua/WslDomain.html
   -- wsl_domains = {
   --    {
   --       name = 'WSL:Ubuntu-24.04.1',
   --       distribution = 'Ubuntu',
   --       default_cwd = "~"
   --    },
   -- },
   -- default_domain = 'WSL:Ubuntu-24.04.1',
   -- default_domain = 'local',
}
