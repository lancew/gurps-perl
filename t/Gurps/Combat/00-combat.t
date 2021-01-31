use strict;
use warnings;

use Test2::V0 -target=> 'Gurps::Combat';

use Gurps::Character;

subtest 'generics' => sub {
    my $participant1 = Gurps::Character->new(
        ht => 10,
        dx => 10,
    );

    my $participant2 = Gurps::Character->new(
        ht => 8,
        dx => 8,
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

    is $combat->duration, 0, 'combat->duration is 0';
    is $combat_basic->type, 'basic', 'combat->type = basic by default';
    is $combat->type, 'advanced', 'combat->type = advanced';
};

subtest 'sequence' => sub {
    my $p1 = Gurps::Character->new(
        ht => 10,
        dx => 10,
    );

    my $p2 = Gurps::Character->new(
        ht => 8,
        dx => 8,
    );

    my $combat = $CLASS->new(
        type => 'advanced',
        participants => [
            $p1,
            $p2,
        ],
    );

    is $combat->sequence,
        [
            $p1,$p2
    ],
    'combat->sequence based on move alone';

    $p1 = Gurps::Character->new(
        name => 'P1',
        ht => 12,
        dx => 12,
        encumberance => 1,
    );

    $p2 = Gurps::Character->new(
        name => 'P2',
        ht => 10,
        dx => 10,
    );

    my $p3 = Gurps::Character->new(
        name => 'P3',
        ht => 8,
        dx => 8,
    );

    $combat = $CLASS->new(
        type => 'advanced',
        participants => [
            $p3,
            $p2,
            $p1
        ],
    );


    is $combat->sequence,
        [
            $p1,$p2,$p3
    ],
    'combat->sequence based on move speed (after move)';
    note '** Need a test and implement handling of draw, with dice roll';

};

done_testing;
