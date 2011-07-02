#!/usr/bin/perl -w

use strict;
use Net::Twitter;

my $nt = Net::Twitter->new(
	traits				=> [qw/OAuth API::REST/],
	consumer_key		=> $consumer_key,
	consumer_secret		=> $consumer_secret,
	access_token		=> $token,
	access_token_secret => $token_secret,
);
