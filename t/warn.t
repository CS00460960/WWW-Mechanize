use warnings;
use strict;
use Test::More;

BEGIN {
    eval "use Test::Warn";
    plan skip_all => "Test::Warn required to test warn" if $@;
    plan tests => 4;
}

BEGIN {
    use_ok( 'WWW::Mechanize' );
}

my $m = WWW::Mechanize->new;
isa_ok( $m, 'WWW::Mechanize' );

warning_like {
    $m->warn( "Something bad" );
} qr[Something bad.+line \d+], "Passes the message, and includes the line number";

warning_like {
    $m->quiet(1);
    $m->warn( "Something bad" );
} undef, "Quiets correctly";