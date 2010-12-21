%w{zsh wget curl git-core ack vim}.each do |pkg|
  package pkg do
    action :install
  end
end
