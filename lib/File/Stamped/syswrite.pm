package File::Stamped::syswrite;
use strict;
use warnings;
use parent 'File::Stamped';
our $VERSION = '0.01';

sub print {
    my $self = shift;

    my $fname = $self->_gen_filename();
    my $fh;
    if (*$self->{fh}) {
        if ($fname eq *$self->{fname} && *$self->{pid}==$$) {
            $fh = delete *$self->{fh};
        } else {
            my $fh = delete *$self->{fh};
            close $fh if $fh;
        }
    }
    unless ($fh) {
        open $fh, *$self->{iomode}, $fname or die "Cannot open file($fname): $!";
        if (*$self->{autoflush}) {
            my $saver = SelectSaver->new($fh);
            $|=1;
        }
    }
    syswrite($fh, (join '', @_))
        or die "Cannot write to $fname: $!";
    if (*$self->{close_after_write}) {
        close $fh;
    } else {
        *$self->{fh}    = $fh;
        *$self->{fname} = $fname;
        *$self->{pid}   = $$;
    }
}


1;

__END__

=encoding utf8

=head1 NAME

File::Stamped::syswrite - time stamped log file, use syswrite

=head1 DESCRIPTION

オリジナルの File::Stamped は CORE::print を使って出力しているが、PerlIOのバッファサイズ(5.12.2で4096バイト)を
超えたSCALARを書き込むと、アトミックに書き込みが行なわれないため並列で動作している環境で出力結果が壊れる。
本モジュールではprintの代わりにsyswriteを使うことでバッファリング無しで書き込みを実行している。

=head1 SEE ALSO

L<File::Stamped>

=head1 AUTHOR
 
Kan Fushihara E<lt>kan.fushihara@gmail.comE<gt>
  
=head1 SEE ALSO
 
 L<File::Stamped>
  
=head1 LICENSE
 
Copyright (C) Kan Fushihara
  
This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
   
=cut

