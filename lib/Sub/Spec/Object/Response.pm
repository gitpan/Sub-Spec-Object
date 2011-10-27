package Sub::Spec::Object::Response;

use 5.010;
use strict;
use warnings;

our $VERSION = '0.02'; # VERSION

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(ssres);

sub new {
    my ($class, $res) = @_;
    $res //= [0, "", undef];
    my $obj = \$res;
    bless $obj, $class;
}

sub status {
    my ($self, $new) = @_;
    if (defined $new) {
        my $old = ${$self}->[0];
        ${$self}->[0] = $new;
        return $old;
    }
    ${$self}->[0];
}

sub message {
    my ($self, $new) = @_;
    if (defined $new) {
        my $old = ${$self}->[1];
        ${$self}->[1] = $new;
        return $old;
    }
    ${$self}->[1];
}

sub result {
    my ($self, $new) = @_;
    if (defined $new) {
        my $old = ${$self}->[2];
        ${$self}->[2] = $new;
        return $old;
    }
    ${$self}->[2];
}

sub is_success {
    my ($self) = @_;
    my $status = ${$self}->[0];
    $status >= 200 && $status <= 299;
}

1;
# ABSTRACT: Represent sub response


__END__
=pod

=head1 NAME

Sub::Spec::Object::Response - Represent sub response

=head1 VERSION

version 0.02

=head1 SYNOPSIS

 use Sub::Spec::Object::Response;

 my $ssres = Sub::Spec::Object::Response->new([200, "OK", [1, 2, 3]]);
 print $ssres->is_success, # 1
       $ssres->status,     # 200
       $ssres->message,    # "OK"
       $ssres->result;     # [1, 2, 3]

=head1 DESCRIPTION

This class provides an object-oriented interface for sub response.

=head1 METHODS

=head2 new($res) => OBJECT

Create a new object from $res response data.

=head2 $ssres->status

Get or set status.

=head2 $ssres->message

Get or set message.

=head2 $ssres->is_success

True if status is between 200-299.

=head1 SEE ALSO

L<Sub::Spec::Object>

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

