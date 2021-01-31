package Gurps::Combat;

use Moo;
use namespace::clean;

has [ qw(participants)] => (
    is => 'rw',
);

has 'type' => (
    is  => 'ro',
    default => 'basic',
);

has 'duration' => (
    is => 'rw',
    default => 0,
);

has 'sequence' => (
    is => 'lazy',
);

has 'manuevers' => (
    is => 'ro',
    default => sub { return [qw( move change_position ready reloading aim attack all_out_attack feint wait all_out_defense concentrate long_action free_actions)]},
);

sub _build_sequence {
    my ($self) = @_;

    my @sequence = sort {
        $b->move <=> $a->move ||
        $b->speed <=> $a->speed
    } @{$self->participants};

    return \@sequence;
}


1;
