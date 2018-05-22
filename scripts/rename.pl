#! /usr/bin/perl -w

#while(1)
{
print "input filein suffer:example--,*.log --->log\n";
my $suff_in=<STDIN>;
chomp $suff_in;
print "input fileout suffer:example--,*.txt --->txt\n";
my $suff_out=<STDIN>;
chomp $suff_out;
my @filename_all=(glob "*.$suff_in");
my @filenew_a;
my $file_new;
if(!(@filename_all) or !($suff_out)){
print "no match file suffer;\n";
print "please input any key to exit\n";
<STDIN>;
#last;
next;
}else{
print "the input file list:\n"; 
}
foreach(@filename_all){
print $_."\n";
}
print "are you sure to change *.$suff_in to *.$suff_out ---->(Y/N)\n";
my $order=<STDIN>;
chomp $order;
if(($order eq 'Y') or ($order eq 'y')){
foreach(@filename_all){
$file_new=$_;
if(!($file_new=~s/\.$suff_in$/.$suff_out/i)){
die "str error:$!\n";
}
if(-e $file_new){
warn "the $file_new is exist;\n";
}elsif(!(rename $_,$file_new)){
warn "the file $_ rename to $file_new has failed;$!\n";
}else{
push (@filenew_a,$file_new);
}
}
print "success change suffer file:\n";
foreach(@filenew_a){
print $_."\n";
}
}
print "please input any key to exit\n";
<STDIN>;
#if(('Y'or 'y')!=chomp ($tmp=<STDIN>)){last;}
}
