use strict;
use warnings;

my %dna_to_rna = (
	"A" => "U",
	"T" => "A",
	"G" => "C",
	"C" => "G"
); 

my %codon_to_aa = (
	"UUU" => "F",
	"UUC" => "F",
	"UUA" => "L",
	"UUG" => "L",
	"UCU" => "S",
	"UCC" => "S",
	"UCA" => "S",
	"UCG" => "S",
	"UAU" => "Y",
	"UAC" => "Y",
	"UAA" => "-",
	"UAG" => "-",
	"UGU" => "C",
	"UGC" => "C",
	"UGA" => "-",
	"UGG" => "W",
	"CUU" => "L",
	"CUC" => "L",
	"CUA" => "L",
	"CUG" => "L",
	"CCU" => "P",
	"CCC" => "P",
	"CCA" => "P",
	"CCG" => "P",
	"CAU" => "H",
	"CAC" => "H",
	"CAA" => "Q",
	"CAG" => "Q",
	"CGU" => "R",
	"CGC" => "R",
	"CGA" => "R",
	"CGG" => "R",
	"AUU" => "I",
	"AUC" => "I",
	"AUA" => "I",
	"AUG" => "M",
	"ACU" => "T",
	"ACC" => "T",
	"ACA" => "T",
	"ACG" => "T",
	"AAU" => "N",
	"AAC" => "N",
	"AAA" => "K",
	"AAG" => "K",
	"AGU" => "S",
	"AGC" => "S",
	"AGA" => "R",
	"AGG" => "R",
	"GUU" => "V",
	"GUC" => "V",
	"GUA" => "V",
	"GUG" => "V",
	"GCU" => "A",
	"GCC" => "A",
	"GCA" => "A",
	"GCG" => "A",
	"GAU" => "D",
	"GAC" => "D",
	"GAA" => "E",
	"GAG" => "E",
	"GGU" => "G",
	"GGC" => "G",
	"GGA" => "G",
	"GGG" => "G"
);


my $input_f = 'input.txt';
my $output_f = 'output.txt';
open(OUTPUT_FILE, '>', $output_f) or die "Could not open file '$output_f' $!";
open(INPUT_FILE, '<', $input_f) or die "Could not open file '$input_f' $!";

my $line;
my $rna = "";
while($line = <INPUT_FILE>){
	print "\n**********************************\n";
	print "DNA: $line";
	chomp $line;
	my @array = split("", $line);
	my $i;
	my $rna = "";
	foreach $i (@array){
		$rna .= $dna_to_rna{$i};
	}
	print "RNA: $rna\n";
	my @triplets = unpack("a3" x (length($rna)/3), $rna);
	print "Codons: @triplets\n";
	my $aa_seq = "";
	foreach $i (@triplets){
		print OUTPUT_FILE $codon_to_aa{$i};
		$aa_seq .= $codon_to_aa{$i};
	}
	print OUTPUT_FILE "\n";
	print "Aminoacid Sequence: $aa_seq\n\n";
}