" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein setting

" XDG_CACHE_HOME対応
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = s:cache_home . '/dein'
" dein.vim本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein,vimがなければgithubから落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めたTOMLファイル
  let g:rc_dir = expand('~/.vim/rc')
  let s:toml = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOMLを読み込みキャッシュしておく
  call dein#load_toml(s:toml, {'lazy':0})
  call dein#load_toml(s:lazy_toml, {'lazy':1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし未インストールのものがあったらインストール
if dein#check_install()
  call dein#install()
endif

" 画面表示の設定

syntax on
"colorscheme hybrid
"colorscheme twilight
""colorscheme molokai
"set background=dark

set number "行番号を表示する
set ruler "カーソル位置を表示する
set cursorline "カーソル行をハイライトする
set cursorcolumn "カーソル位置のカラムをハイライトする
set laststatus=2 "ステータス行を常に表示
set cmdheight=2 "メッセージ表示欄を2行確保
set showmatch "対応する括弧を強調表示
set helpheight=999 "ヘルプを画面いっぱいに開く
set list "不可視文字を表示
" 不可視文字の表示記号指定
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮

" カーソル移動関連の設定

set backspace=indent,eol,start "Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,] "行頭行末の左右移動で行をまたぐ
set scrolloff=8 "上下8行の視界を確保
set sidescrolloff=16 "左右スクロール時の視界を確保
set sidescroll=1 "左右スクロールは一文字ずつ行う

" ファイル処理関連の設定

set confirm "保存されていないファイルがあるときは終了前に保存確認
set hidden "保存されていないファイルがあるときでも別のファイルを開くことができる
set autoread "外部でファイルに変更があった場合は読み直す
set nobackup "ファイル保存時にバックアップファイルを作らない
set noswapfile "ファイル編集中にスワップファイルを作らない

" 検索/置換の設定

set hlsearch "検索文字列をハイライトする
set incsearch "インクリメンタルサーとを行う
set ignorecase "大文字と小文字を区別しない
set smartcase "ただし検索文字列に大文字が含まれる場合は区別する
set wrapscan "最後尾まで検索を終えたら先頭にもどる
set gdefault "置換のgオプションをデフォルトで有効にする

" タブ/インデントの設定
set expandtab "タブを半角スペースに置き換える
set tabstop=2 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
"set softtabstop=2 "連続した空白に対してカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

" 動作環境との統合関連の設定

" OSのクリップボードをレジスタ指定なしでYank, Put出来るようにする
set clipboard=unnamed,unnamedplus
" マウスの入力を受け付ける
set mouse=a

" コマンドラインの設定

set showcmd "コマンドを画面最下部に表示する
set wildmenu "コマンドライン補完が強力になる
set wildmode=list:longest,full "コマンドライン補完のモード指定
set history=10000 "コマンドラインの履歴を10000件保存する
set virtualedit=onemore "行末の一文字先までカーソルを移動できる

" ビープの設定

set visualbell "ビープ音を可視化

" キーマップの設定

nnoremap <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap j gj
nnoremap k gk

inoremap [ []<left>
inoremap ( ()<left>
inoremap { {}<left>
inoremap < <><left>
inoremap 「 「」<left>
inoremap （ （）<left>
inoremap ・・ ……
inoremap  ーー ――

" 変数設定

let g:neocomplete#enable_at_startup = 1
