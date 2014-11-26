package Vim::X::Window;
BEGIN {
  $Vim::X::Window::AUTHORITY = 'cpan:YANICK';
}
# ABSTRACT: A window in Vim
$Vim::X::Window::VERSION = '1.0.1';
use strict;
use warnings;

use Vim::X;
use Vim::X::Buffer;
use Carp;

use Moo;

has _window => (
    is => 'ro',
    required => 1,
);


sub buffer {
    my $self = shift;
    return Vim::X::Buffer->new( _buffer => $self->_window->Buffer, index =>
        0 );
}


sub cursor {
    my $win = shift;
    my @cursor = $win->_window->Cursor;
    return wantarray ? @cursor
        : Vim::X::Line->new( buffer => $win->buffer, index => $cursor[0] );
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Vim::X::Window - A window in Vim

=head1 VERSION

version 1.0.1

=head1 FUNCTIONS

=head2 buffer() 

Returns the buffer associated with the window as a .L<Vim::X::Buffer> object 

=head2 cursor() 

Returns the cursor position in the window. 
In list context, returns the I<(line,colum)> coordinates. In scalar
context, the line as a L<Vim::X::Line> object.

=head1 AUTHOR

Yanick Champoux <yanick@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Yanick Champoux.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
