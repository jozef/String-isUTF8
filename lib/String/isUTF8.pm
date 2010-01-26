package String::isUTF8;

use utf8;

=head1 NAME

String::isUTF8 - access to is_utf8_string() Perl API function

=head1 SYNOPSIS

    use utf8;
    use String::isUTF8 qw(perlapi_is_utf8_string);
    unless (perlapi_is_utf8_string("keď vychodí slniečko")) {
        die 'panic not UTF-8';
    }

=head1 DESCRIPTION

This module offers just one function C<perlapi_is_utf8_string()> that can
be used to check if a string contains valid UTF-8 characters.

=cut

use 5.006;
use strict;
use warnings;

our $VERSION = '0.01';

use parent qw(DynaLoader);

=head2 EXPORTS

=head3 perlapi_is_utf8_string

See C<is_utf8_string> in L<perlapi/Unicode-Support>.

=cut

use Exporter 'import';
our @EXPORT_OK = qw(
    perlapi_is_utf8_string
);

__PACKAGE__->bootstrap;

1;

__END__

=head1 SEE ALSO

L<perlapi/Unicode-Support>, L<Search::Tools::UTF8>

=head1 AUTHOR

Jozef Kutej

=head1 COPYRIGHT

Copyright 2009 Jozef Kutej, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.
