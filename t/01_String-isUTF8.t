#!/usr/bin/perl
use strict;
use warnings;
use utf8;

#use Test::More 'no_plan';
use Test::More tests => 10;
use Encode;

use FindBin qw($Bin);
use lib "$Bin/lib";

BEGIN {
    use_ok ( 'String::isUTF8' ) or exit;
}

exit main();

sub main {
    my $utf8_on   = "ahoj svět, čičo. krôčik ševelí. ľalia";           # SvUTF8 on
    my $utf8_off  = "\303\226sterreich";                              # SvUTF8 off
    my $noutf8    = pack('C7', 0, 1, 2, 3, 253, 254, 255);
    my $noutf8_02 = pack('C2', 253, 0);
    my $utf8_01   = pack('C2', 0, 1);
    my $utf8_02 = "abc"; # normal ASCII string
    
    ok(String::isUTF8::perlapi_is_utf8_string($utf8_on),    'we have utf-8 string and SvUTF8 on');
    ok(Encode::is_utf8($utf8_on),    'SvUTF8 on');
    ok(String::isUTF8::perlapi_is_utf8_string($utf8_off),   'we have utf-8 string and SvUTF8 off');
    ok(!Encode::is_utf8($utf8_off),    'SvUTF8 off');
    ok(!String::isUTF8::perlapi_is_utf8_string($noutf8),    '0,1,2,3,253,254,255 string');
    ok(!String::isUTF8::perlapi_is_utf8_string($noutf8_02), '253,0 string (not valid UTF-8)');
    ok(String::isUTF8::perlapi_is_utf8_string($utf8_01),    '0,1 is UTF-8 (control characters)');
    ok(String::isUTF8::perlapi_is_utf8_string($utf8_02),    '"abc" is plain ASCII text SvUTF8 off');
    ok(!Encode::is_utf8($utf8_02),    'SvUTF8 off');

=for doesn't work the same way

    ok(utf8::valid($utf8_on),    'we have utf-8 string and SvUTF8 on ');
    ok(utf8::valid($utf8_off),   'we have utf-8 string and SvUTF8 off ');
    ok(!utf8::valid($noutf8),    'chr(0).chr(1).chr(2).chr(3).chr(253).chr(254).chr(255) string');
    ok(!utf8::valid($noutf8_02), 'chr(253).chr(0) string (not valid UTF-8)');
    ok(utf8::valid($utf8_01),    'chr(0).chr(1) is UTF-8 (control characters)');

=cut
    
    return 0;
}

