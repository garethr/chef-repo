name        'garethr'
description 'Sort out users and ssh access for new machines'
run_list    "recipe[sudo]", "recipe[garethr]", "recipe[garethr-tools]"
