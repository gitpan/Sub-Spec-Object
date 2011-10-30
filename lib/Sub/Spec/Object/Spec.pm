package Sub::Spec::Object::Spec;

use 5.010;
use strict;
use warnings;

our $VERSION = '0.03'; # VERSION

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(ssspec);

sub new {
    my ($class, $spec) = @_;
    $spec //= {};
    my $obj = \$spec;
    bless $obj, $class;
}

sub feature {
    my $self = shift;
    my $name = shift;
    if (@_) {
        my $value = shift;
        ${$self}->{features} //= {};
        my $old = ${$self}->{features}{$name};
        ${$self}->{features}{$name} = $value;
        return $old;
    } else {
        ${$self}->{features}{$name};
    }
}

sub arg {
    my $self = shift;
    my $name = shift;
    if (@_) {
        my $value = shift;
        ${$self}->{args} //= {};
        my $old = ${$self}->{args}{$name};
        ${$self}->{args}{$name} = $value;
        return $old;
    } else {
        ${$self}->{args}{$name};
    }
}

1;
# ABSTRACT: Represent sub spec


__END__
=pod

=head1 NAME

Sub::Spec::Object::Spec - Represent sub spec

=head1 VERSION

version 0.03

=head1 SYNOPSIS

 use Sub::Spec::Object::Response;

 $SPEC{foo} = { args => { b => 'int' }, features => {undo=>1} };
 my $ssspec = ssspec $SPEC{foo};
 print $ssres->feature('undo'), # 1
       $ssres->arg('a');        # undef

=head1 DESCRIPTION

This class provides an object-oriented interface for sub spec.

=head1 METHODS

=head2 new($spec) => OBJECT

Create a new object from $spec. If $spec is undef, creates an empty spec.

=head2 $ssspec->feature(NAME[, VALUE])

Get or set named feature (B<features> key in spec). If a feature doesn't exist,
undef will be returned.

=head2 $ssres->arg(NAME[, VALUE])

Get or set argument (B<args> key in spec). If an argument doesn't exist, undef
will be returned.

=head1 SEE ALSO

L<Sub::Spec::Object>

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

