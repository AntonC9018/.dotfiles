source $HOME/.bashrc

cp wsl/init_windows_host.sh $HOME/init_windows_host
./wsl/init_init_windows_host.sh

sudo apt-get install software-properties-common
echo "deb http://llvm.org/apt/xenial/ llvm-toolchain-xenial main" | sudo tee /etc/apt/sources.list.d/llvm.list
echo "deb http://llvm.org/apt/xenial/ llvm-toolchain-xenial-3.9 main" | sudo tee -a /etc/apt/sources.list.d/llvm.list
wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key | sudo apt-key add -
sudo add-apt-repository ppa:deadsnakes/ppa
sudo add-apt-repository ppa:george-edison55/cmake-3.x
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt-get update

sudo apt-get install neovim rustc go cmake fzf ripgrep python3-lldb-17 clang-17 lldb-17 lld-17
sudo apt-get upgrade

wget https://ziglang.org/download/0.13.0/zig-linux-x86_64-0.13.0.tar.xz -O zig.tar.xz
tar -xf zig.tar.xz
mv zig-linux-x86_64-0.13.0 zig
rm zig.tar.xz

# https://github.com/llvm/llvm-project/issues/55575#issuecomment-1247426995
ln -s /usr/lib/llvm-14/lib/python3.10/dist-packages/lldb/* /usr/lib/python3/dist-packages/lldb/

# TODO: Font installation
