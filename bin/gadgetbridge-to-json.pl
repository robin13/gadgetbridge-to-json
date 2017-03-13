#!/usr/bin/env perl

use strict;
use warnings;
use YAML;
use Getopt::Long;
use DBI;
use DBD::SQLite;
use JSON qw/encode_json/;

my %params;
GetOptions( \%params,
    'db=s',
    'output=s',
);

my $dbh = DBI->connect("dbi:SQLite:dbname=$params{db}", "", "" );
open( my $fh, '>', $params{output} ) or die( "Could not open output: $!" );
my $sth = $dbh->prepare( "SELECT * FROM mi_band_activity_sample" );
$sth->execute();
while( my $row = $sth->fetchrow_hashref ){
    print $fh encode_json( $row ) . "\n";
}
close $fh;
$dbh->disconnect();


exit( 0 );

=head1 NAME

gadgetbridge-to-json.pl

=head1 SYNOPSIS



=head1 DESCRIPTION



=head1 OPTIONS

=over 4

=item --option

option description


=back

=head1 COPYRIGHT

Copyright 2015, Robin Clarke

=head1 AUTHOR

Robin Clarke C<perl@robinclarke.net>

=cut

