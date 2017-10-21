function _ssh_commands() {
    local ret=1 state
    _arguments ':subcommand:->subcommand' && ret=0

    case $state in
      subcommand)
        subcommands=(
          "thinklikeamink.net:the animal that will devour you"
          "zivter.net:where evil seeds are sown"
        )
        _describe -t subcommands 'common ssh hosts' subcommands && ret=0
    esac

    return ret
}

compdef _ssh_commands ssh
