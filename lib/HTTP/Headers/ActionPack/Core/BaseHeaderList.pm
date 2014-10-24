package HTTP::Headers::ActionPack::Core::BaseHeaderList;
# ABSTRACT: A Base Header List

use strict;
use warnings;

use Scalar::Util                    qw[ blessed ];
use HTTP::Headers::ActionPack::Util qw[ split_header_words ];

use parent 'HTTP::Headers::ActionPack::Core::Base';

sub new_from_string {
    my ($class, $header_string) = @_;
    my $list = $class->new;
    foreach my $header ( split_header_words( $header_string ) ) {
        $list->add_header_value( $header )
    }
    $list;
}

sub as_string {
    my $self = shift;
    join ', ' => map { blessed $_ ? $_->as_string : $_ } $self->iterable;
}

sub add              { die "Abstract method" }
sub add_header_value { die "Abstract method" }
sub iterable         { die "Abstract method" }

1;



=pod

=head1 NAME

HTTP::Headers::ActionPack::Core::BaseHeaderList - A Base Header List

=head1 VERSION

version 0.02

=head1 SYNOPSIS

  use HTTP::Headers::ActionPack::Core::BaseHeaderList;

=head1 DESCRIPTION

This is a base class for header lists. There is no real
user servicable parts in here.

=head1 METHODS

=item C<new_from_string ( $header_string )>

This accepts a HTTP header string which get parsed
and loaded accordingly.

=item C<as_string>

=back

=head1 ABSTRACT METHODS

=over 4

=item C<add>

=item C<add_header_value>

=item C<iterable>

=back

=head1 AUTHOR

Stevan Little <stevan.little@iinteractive.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Infinity Interactive, Inc..

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__END__

