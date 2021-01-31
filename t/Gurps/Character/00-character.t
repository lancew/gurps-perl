use strict;
use warnings;

use Test2::V0 -target=> 'Gurps::Character';

my $char = Gurps::Character->new(
    name => 'Dai Blackthorn',
    st => 8,
    dx => 15,
    iq => 12,
    ht => 12,
);

is $char->name,'Dai Blackthorn','name';
is $char->st,8,'st';
is $char->dx,15,'dx';
is $char->iq,12,'iq';
is $char->ht,12,'ht';
is $char->speed,6.75,'speed';
is $char->move,6,'move';


use Data::Dumper;
$Data::Dumper::Sortkeys=1;
note Dumper $char;


done_testing;
