package Gurps::Character;

use Moo;
use namespace::clean;

has [ qw(name st dx iq ht)] => (
    is => 'rw',
);

has encumberance => (
    is => 'lazy',
);

has speed => (
    is => 'lazy',
);

has move => (
    is => 'lazy',
);

sub _build_encumberance {
    my ($self) = @_;

    # TODO: calculate of weight etc. For now, lets just say 0
    return 0;
}

sub _build_speed {
    my ($self) = @_;
    return ($self->ht + $self->dx)/4;
}

sub _build_move {
    my ($self) = @_;
    return int( $self->speed - $self->encumberance);
}


1;
