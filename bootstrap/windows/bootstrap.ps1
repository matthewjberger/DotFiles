# Prerequisites
# Powershell 5+

# Set HOME
[environment]::setenvironmentvariable('HOME', "$env:USERPROFILE", 'USER')

# Install scoop
Invoke-Expression (new-object net.webclient).downloadstring('https://get.scoop.sh')
Set-ExecutionPolicy RemoteSigned -scope CurrentUser

scoop install 7zip git innounp
scoop bucket add extras
scoop bucket add games
scoop bucket add nerd-fonts

# Speed up downloads using aria2
scoop install aria2

scoop install `
  adom `
  alacritty `
  angband `
  bat `
  bitwarden `
  brave `
  brogue `
  cataclysm-dda `
  cataclysm-dda-tiles `
  ccat `
  ccleaner `
  cmake `
  cmder `
  curl `
  discord `
  dwarf-fortress-lnp `
  emacs `
  flux `
  fzf `
  gcc `
  gitkraken `
  grep `
  hack-font `
  hack-nf `
  hub `
  hxd `
  hyperfine `
  keypirinha `
  lf `
  meld `
  neovim `
  nethack `
  nodejs `
  openssh `
  python `
  rapidee `
  ripgrep `
  rustup `
  s `
  sed `
  speccy `
  stone-soup `
  stone-soup-tiles `
  sudo `
  sumatrapdf `
  tome4 `
  umoria `
  vscode `

[environment]::setenvironmentvariable('GIT_SSH', (resolve-path (scoop which ssh)), 'USER')

# Setup spacemacs
git clone https://github.com/syl20bnr/spacemacs $env:APPDATA/.emacs.d -b develop

# Install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Setup rust
rustup default stable
rustup update
rustup update nightly
rustup component add rls rust-analysis rust-src clippy-preview rustfmt
rustup target install wasm32-unknown-unknown
cargo install cargo-web rustsym ripgrep cargo-audit cargo-asm cargo-count xargo cargo-watch cargo-edit cargo-expand cargo-tree

# Setup rust-analyzer
git clone https://github.com/rust-analyzer/rust-analyzer
Set-Location rust-analyzer
cargo install-ra

# Install some npm tools
npm install -g diff-so-fancy vmd nyaovim
