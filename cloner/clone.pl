#!/usr/bin/perl

use warnings;
use strict;

use Data::Dumper;
use File::Spec;

sub prompt {
    print("==> \x1b[38;5;3;1m$_[0]\x1b[m\n");
}

sub halt {
    print("[!] \x1b[38;5;1;1m$_[0]\x1b[m - Halting program\n");
    die $_[0];
}

sub requirements_check {
    `git` or die "Git command is not installed!";
}

sub read_clone_table {
    prompt("Reading clone table");
    my ($vol, $dir, $file) = File::Spec->splitpath($0);
    my @procedure = ();
    open(CT, "<", "$dir/clonetable")
        or halt("Clone table could not be read");
    while(<CT>) {
        chomp $_;
        if ($_ =~ "^//") {
            next;
        }
        if ($_ eq "") {
            next;
        }
        my @record = split(/\t/, $_);
        my %proc_rec = (dest => $record[0], repo => $record[1]);
        push @procedure, \%proc_rec;
    }

    return @procedure;
}

sub plan_clone {
    prompt("Planning clone");
    my @clone_table = @{$_[0]};
    my @plan_table = ();

    foreach my $record_ref (@clone_table) {
        my %record = %{$record_ref};
	my $dest = "$ENV{'HOME'}/$record{'dest'}";
	my $repo = "$record{'repo'}";
        if (-d $dest) {
            print("\x1b[38;5;245m📝 Already exists");
        } else {
            print("\x1b[38;5;2;1m✨ WILL BE LINKED");
	    my %planned = (dest => $dest, repo => $repo);
            push(@plan_table, \%planned);
        }
        print("\t$dest\t-> $repo\x1b[m\n")
    }

    return @plan_table;
}

sub confirm {
    print($_[0]);
    print(" Okay? [yN]");

    my $input = <STDIN>;
    chomp($input);
    return ($input eq "y");
}

sub clone {
    my @plan_table = @{$_[0]};

    foreach my $record_ref (@plan_table) {
        my %record = %{$record_ref};
        my $dest = $record{"dest"};
        my $repo = $record{"repo"};

        prompt("Cloning '$dest' from '$repo'");
        exec("git clone $repo $dest --depth=1")
    }
}

requirements_check();
my @clone_table = &read_clone_table();
my @plan = &plan_clone(\@clone_table);

if($#plan eq -1) {
    print("All repository was cloned!\n");
    exit;
}

if(!confirm("Check green line for the reposirepory that will be cloned.")) {
    print("Cancelled.\n");
}

clone(\@plan);

