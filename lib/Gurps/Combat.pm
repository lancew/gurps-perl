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

sub _build_sequence {
    my ($self) = @_;

    my @sequence = sort {
        $b->move <=> $a->move ||
        $b->speed <=> $a->speed
    } @{$self->participants};

    return \@sequence;
}


1;
