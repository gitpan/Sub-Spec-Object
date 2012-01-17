package Sub::Spec::Object;

use 5.010;
use strict;
use warnings;

our $VERSION = '0.04'; # VERSION

require Exporter;
our @ISA    = qw(Exporter);
our @EXPORT = qw(ssreq ssres ssspec sssub);

sub ssreq {
    require Sub::Spec::Object::Request;
    Sub::Spec::Object::Request->new(@_);
}

sub ssres {
    require Sub::Spec::Object::Response;
    Sub::Spec::Object::Response->new(@_);
}

sub ssspec {
    require Sub::Spec::Object::Spec;
    Sub::Spec::Object::Spec->new(@_);
}

sub sssub {
    require Sub::Spec::Object::Sub;
    Sub::Spec::Object::Sub->new(@_);
}

1;
# ABSTRACT: Object-oriented interface for sub/spec/request/response/etc


__END__
=pod

=head1 NAME

Sub::Spec::Object - Object-oriented interface for sub/spec/request/response/etc

=head1 VERSION

version 0.04

=head1 SYNOPSIS

 use Sub::Spec::Object;

 my $ssres = ssres [200, "OK", [1, 2, 3]];
 print $ssres->is_success, # 1
       $ssres->status,     # 200
       $ssres->message,    # "OK"
       $ssres->result;     # [1, 2, 3]

 # TODO: ssspec
 $SPEC{foo} = { features => { undo=>1 } };
 my $ssspec = ssspec $SPEC{foo};
 my $ssspec->feature('undo');    # 1
 my $ssspec->feature('dry_run'); # ""

 # TODO: ssreq
 # TODO: sssub

=head1 DESCRIPTION

B<NOTICE>: This module and the L<Sub::Spec> standard is deprecated as of Jan
2012. L<Rinci> is the new specification to replace Sub::Spec, it is about 95%
compatible with Sub::Spec, but corrects a few issues and is more generic.
L<Rias> is the Perl implementation for Rinci and many of its modules can handle
existing Sub::Spec sub specs. L<Rias::Object> is the replacement for
Sub::Spec::Object.

L<Sub::Spec> works using pure data structures, but sometimes it's convenient to
have an object-oriented interface for those data. This module provides just
that.

=head1 FUNCTIONS

=head2 ssreq $req => OBJECT

Exported by default. A shortcut for Sub::Spec::Object::Request->new($req).

=head2 ssres $res => OBJECT

Exported by default. A shortcut for Sub::Spec::Object::Response->new($res).

=head2 ssspec $spec => OBJECT

Exported by default. A shortcut for Sub::Spec::Object::Spec->new($spec).

=head2 sssub $sub => OBJECT

Exported by default. A shortcut for Sub::Spec::Object::Sub->new($sub).

=head1 SEE ALSO

L<Sub::Spec>

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

