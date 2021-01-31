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
is $char->mvmt_speed,6.75,'mvmt_speed';
#is $char->mvmt_move,6,'mvmt_move';

done_testing;
