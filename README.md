# emacs インストール手順
### Windows
[emacs_zip](http://ftp.gnu.org/pub/gnu/emacs/windows/)

    上記アクセス後、欲しいバージョンのzipフォルダをダウンロードして解凍(v26は日本非対応 2018/9/21時点)
    解凍して出来たフォルダのbin配下にある runemacs.exe ファイルで実行

### CentOS
[emacs_tar.gz](http://ftp.gnu.org/gnu/emacs/) このサイトから欲しいバージョンを下のxx.xに代入

    sudo wget http://ftp.gnu.org/gnu/emacs/emacs-xx.x.tar.gz
    sudo tar zxvf emacs-xx.x.tar.gz
    cd emacs-xx.x
    # ローカルにインストールしたい場合のオプション付き
    ./configure --without-x --prefix=/home/{user}/local
    sudo make
    sudo make install

# 設定方法
### zipダウンロードして配置の場合  
1.zipダウンロードして解凍  
2.C:/User/AppData/Roaming/ 配下に.emacs.dのフォルダ作成(もし、なければ。emacs初回起動時に自動作成。)  
3.C:/User/AppData/Roaming/.emacs.d/ 配下に解凍したフォルダの中身を配置

### コマンドラインからの場合
Window

    cd ~/AppData/Roaming
    mkdir .emacs.d
    git clone https://github.com/s-shoichi/my_emacs.git .emacs.d

CentOS

    1.cd ~/
    2.mkdir ~/.emacs.d
    3.git clone https://github.com/s-shoichi/my_emacs.git .emacs.d

![emacs](https://github.com/s-shoichi/my_emacs/blob/master/org/emacs.jpg)