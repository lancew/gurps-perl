use strict;
use warnings;

use Test2::V0 -target=> 'Gurps::Combat';

use Gurps::Character;

my $participant1 = Gurps::Character->new(

);

my $participant2 = Gurps::Character->new(

);

my $combat_basic = $CLASS->new(
    type => 'basic',
    participants => [
        $participant1,
        $participant2,
    ],
);

my $combat = $CLASS->new(
    type => 'advanced',
    participants => [
        $participant1,
        $participant2,
    ],
);
subtest 'generics' => sub {
    is $combat->duration, 0, 'combat->duration is 0';
    is $combat_basic->type, 'basic', 'combat->type = basic by default';
    is $combat->type, 'advanced', 'combat->type = advanced';
};

subtest 'sequence' => sub {
  ok 1;    
};

done_testing;
