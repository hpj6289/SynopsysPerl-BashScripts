#!/depot/perl-5.8.3/bin/perl -w

#############################
#############################
# Author : Himanshu Joshi   #
# Copyright Synopsys        #
# All Rights Reserved       #
#############################
#############################

use lib "/remote/cfadm/tools/FHM2/lib";
use strict;
use warnings;
use Term::ANSIColor;
use JSON;
use Data::Dumper;
use LWP::Simple;
use POSIX;
if (scalar @ARGV != 1) {

 print colored("Usage: $0 hostname\n", 'bold');
       exit;
}

my $host = $ARGV[0];
 
        my $url = "http://iims/solr/properties/select/?wt=json&rows=1&q=$host";
        my $json = get($url) or die "ERROR: Could not parse $url - $!\n";
      my $decoded_json = decode_json($json);

my $numFound = $decoded_json->{response}->{numFound};
my $hostX="DETAILS BELOW ARE FOR THE HOSTNAME:$host\n";
print "\n" .colored($hostX,'bold underline') if($numFound);
my $hash3=$decoded_json->{response}->{docs}->[0];
foreach my $key (sort keys %{$hash3}){
my $hash2=  $hash3->{$key};
                printf "%-50s | %-30s\n",uc $key,$hash2;
}
       
    unless ($numFound) {
                print"\n".colored("ERROR:$host NOT_IN_ALCHEMY\n",'bold underline');

        }
