#!/usr/bin/perl 

$num_args = $#ARGV + 1;

if($num_args < 2){
	print "\nUsage : StegYou.pl -[option] FileName 'String To Hide'\n";
	print "-h hide a string inside the image file\n";
	print "-u unhide a hidden string\n";	
	exit;
}

if($ARGV[0] eq "-h"){
	if($num_args != 3){
		print "Give a string to hide\n";
		print "Run 'perl stegYou.pl' to see options\n";
		exit;
	}
	else{
		open(file,">>$ARGV[1]")||die "Cannot Open the Given File";
		print file "Hidden text : $ARGV[2]\n";
		close(file);
		exit;
	}

}
elsif($ARGV[0] eq "-u"){
	open (file,"$ARGV[1]") || die "Cannot Open the Given File";
	while(<file>){
		if($_ =~ /Hidden/){
			$_ =~ s/[^[:ascii:]]//g;
			print "$_\n";
		}
	}
	close(file);
	exit;
}
else{
	print "Invalid argument\n";
	print "Run 'perl stegYou.pl' to see options\n";
	exit;
}

