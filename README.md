# NAME

File::Stamped::syswrite - time stamped log file, use syswrite

# DESCRIPTION

オリジナルの File::Stamped は CORE::print を使って出力しているが、PerlIOのバッファサイズ(5.12.2で4096バイト)を
超えたSCALARを書き込むと、アトミックに書き込みが行なわれないため並列で動作している環境で出力結果が壊れる。
本モジュールではprintの代わりにsyswriteを使うことでバッファリング無しで書き込みを実行している。

# SEE ALSO

[File::Stamped](https://metacpan.org/pod/File::Stamped), [https://redmine.fout.jp/issues/8769](https://redmine.fout.jp/issues/8769)

# AUTHOR
 

Kan Fushihara <kan.fushihara@gmail.com>
  

# SEE ALSO
 

    L<File::Stamped>
     

# LICENSE
 

Copyright (C) Kan Fushihara
  

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
   
