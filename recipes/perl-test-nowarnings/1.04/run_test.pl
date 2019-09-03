my $expected_version = "1.04";
print("import: Test::NoWarnings\n");
use Test::More tests => 1;
use Test::NoWarnings;

if (defined Test::NoWarnings->VERSION) {
	my $given_version = Test::NoWarnings->VERSION;
	$given_version =~ s/0+$//;
	die('Expected version ' . $expected_version . ' but found ' . $given_version) unless ($expected_version eq $given_version);
	print('	using version ' . Test::NoWarnings->VERSION . '
');

}
print("import: Test::NoWarnings::Warning\n");
use Test::NoWarnings::Warning;

if (defined Test::NoWarnings::Warning->VERSION) {
	my $given_version = Test::NoWarnings::Warning->VERSION;
	$given_version =~ s/0+$//;
	die('Expected version ' . $expected_version . ' but found ' . $given_version) unless ($expected_version eq $given_version);
	print('	using version ' . Test::NoWarnings::Warning->VERSION . '
');

}
