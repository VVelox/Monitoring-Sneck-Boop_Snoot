use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

my %WriteMakefileArgs = (
	NAME               => 'Monitoring::Sneck::Boop_Snoot',
	AUTHOR             => q{Zane C. Bowers-Hadley <vvelox@vvelox.net>},
	VERSION_FROM       => 'lib/Monitoring/Sneck/Boop_Snoot.pm',
	ABSTRACT_FROM      => 'lib/Monitoring/Sneck/Boop_Snoot.pm',
	LICENSE            => 'artistic_2',
	MIN_PERL_VERSION   => '5.006',
	INST_SCRIPT        => 'bin',
	CONFIGURE_REQUIRES => {
		'ExtUtils::MakeMaker' => '0',
	},
	TEST_REQUIRES => {
		'Test::More' => '0',
	},
	PREREQ_PM => {
		'JSON'               => '0',
		'String::ShellQuote' => '0',
		'MIME::Base64'       => '0',
		'Gzip::Faster'       => '0',
	},
	META_MERGE => {
		"meta-spec" => { version => 2 },
		resources   => {
			repository => {
				type => 'git',
				url  => 'https://github.com/VVelox/Monitoring-Sneck-Boop_Snoot.git',
				web  => 'https://github.com/VVelox/Monitoring-Sneck-Boop_Snoot',
			},
		},
	},
	dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
	clean => { FILES    => 'Monitoring-Sneck-Boop_Snoot-*' },
);

# Compatibility with old versions of ExtUtils::MakeMaker
unless ( eval { ExtUtils::MakeMaker->VERSION('6.64'); 1 } ) {
	my $test_requires = delete $WriteMakefileArgs{TEST_REQUIRES} || {};
	@{ $WriteMakefileArgs{PREREQ_PM} }{ keys %$test_requires } = values %$test_requires;
}

unless ( eval { ExtUtils::MakeMaker->VERSION('6.55_03'); 1 } ) {
	my $build_requires = delete $WriteMakefileArgs{BUILD_REQUIRES} || {};
	@{ $WriteMakefileArgs{PREREQ_PM} }{ keys %$build_requires } = values %$build_requires;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
	unless eval { ExtUtils::MakeMaker->VERSION('6.52'); 1 };
delete $WriteMakefileArgs{MIN_PERL_VERSION}
	unless eval { ExtUtils::MakeMaker->VERSION('6.48'); 1 };
delete $WriteMakefileArgs{LICENSE}
	unless eval { ExtUtils::MakeMaker->VERSION('6.31'); 1 };

WriteMakefile(%WriteMakefileArgs);
