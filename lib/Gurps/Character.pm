package Gurps::Character;

use Moo;
use namespace::clean;

has [ qw(name st dx iq ht)] => (
    is => 'rw',
);

has mvmt_speed => (
    is => 'lazy',
);

sub _build_mvmt_speed {
    my ($self) = @_;
    return ($self->ht + $self->dx)/4;
}

1;
