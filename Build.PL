use strict;
use warnings;
use Module::Build;
use File::Spec;

my $builder = Module::Build->new(
    module_name         => 'String::isUTF8',
    license             => 'perl',
    dist_author         => q{Jozef Kutej <jkutej@cpan.org>},
    dist_version_from   => 'lib/String/isUTF8.pm',
    build_requires => {
        'Test::More' => 0,
        'Encode'     => 0,
    },
    add_to_cleanup      => [
        'String-isUTF8-*',
        File::Spec->catfile('lib', 'String', 'isUTF8.c'),
        File::Spec->catfile('lib', 'String', 'isUTF8.o')
    ],
    create_makefile_pl => 'traditional',
    create_readme       => 1,
    sign                => 1,
    meta_merge => {
        resources => {
            repository => 'git://github.com/jozef/String-isUTF8.git',
            bugtracker => 'http://github.com/jozef/String-isUTF8/issues',
        },
        keywords => [ qw/ utf-8 string perlapi / ],
    },
);

$builder->create_build_script();
