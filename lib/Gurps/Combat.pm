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



1;
