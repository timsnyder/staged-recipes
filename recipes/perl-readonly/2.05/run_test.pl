my $expected_version = "2.05";
print("import: Readonly\n");
use Readonly;

if (defined $Readonly::VERSION) {
	my $given_version = $Readonly::VERSION;
	$given_version =~ s/0+$//;
	die('Expected version ' . $expected_version . ' but found ' . $given_version) unless ($expected_version eq $given_version);
	print('	using version ' . $Readonly::VERSION . '
');

}
