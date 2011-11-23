%w{zsh wget curl lynx git-core ack-grep vim-nox dvtm build-essential tree}.each do |pkg|
  package pkg do
    action :install
  end
end

git "/home/garethr/.oh-my-zsh" do
  repository node[:garethr][:ohmyzsh]
  action :checkout
  user "garethr"
  group "garethr"
end

execute ".zshrc" do
  command "cp /home/garethr/.oh-my-zsh/templates/zshrc.zsh-template /home/garethr/.zshrc"
  creates "/home/garethr/.zshrc"
  user "garethr"
end

execute "usermod -s /bin/zsh garethr"

git "/home/garethr/.vim" do
  repository node[:garethr][:dotvim]
  action :checkout
  user "garethr"
end

%w{rake ruby-dev exuberant-ctags}.each do |pkg|
  package pkg do
    action :install
  end
end

execute "build janus" do
  command "rake"
  user "garethr"
  cwd "/home/garethr/.vim"
  environment ({'HOME' => '/home/garethr'})
  creates "/home/garethr/.vimrc"
end
