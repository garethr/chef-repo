
%w{zsh wget curl git-core ack vim}.each do |pkg|
  package pkg do
    action :install
  end
end

git "/home/vagrant/.oh-my-zsh" do
  repository "https://github.com/robbyrussell/oh-my-zsh.git"
  action :checkout
  user "vagrant"
  group "vagrant"
end

execute ".zshrc" do
  command "cp /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template /home/vagrant/.zshrc"
  creates "/home/vagrant/.zshrc"
  user "vagrant"
end

file "/etc/profile.d/zsh.sh" do
  content "export SHELL=/bin/zsh"
  action :create
end

git "/home/vagrant/.vim" do
  repository "https://github.com/jtimberman/dotvim.git"
  action :checkout
  user "vagrant"
end

link "/home/vagrant/.vimrc" do
  to "/home/vagrant/.vim/vimrc"
  owner "vagrant"
end

