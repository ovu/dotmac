function forrest  --description 'stop and start launchctl agents. Run like Forrest Gump!'
  launchctl stop com.ovu.ssh.git.agent
  launchctl stop com.ovu.ssh.gitweb.agent
  launchctl stop com.ovu.ssh.nexus.agent
  launchctl stop com.ovu.ssh.exchange.agent

  launchctl start com.ovu.ssh.git.agent
  launchctl start com.ovu.ssh.gitweb.agent
  launchctl start com.ovu.ssh.nexus.agent
  launchctl start com.ovu.ssh.exchange.agent
end
