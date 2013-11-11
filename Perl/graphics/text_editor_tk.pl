#!/usr/bin/perl -w
use 5.12.4;
use strict;
use Tkx;
use File::Basename qw(basename);
Tkx::package_require("style");
Tkx::package_require("BWidget");
Tkx::style__use( "as", -priority => 70 );
my $file = "";
my $mw;
my $menu;
our $VERSION = "1.00";
( my $progname = $0 ) =~ s,.*[\\/],,;
my $IS_AQUA = Tkx::tk_windowingsystem() eq "aqua";
$mw = Tkx::widget->new(".");
$mw->g_wm_geometry("900x500-20+40");
$mw->configure( -menu => mk_menu($mw) );
( my $nb = $mw->new_ttk__notebook( -height => 1300, -width => 1300 ) )
  ->g_pack();
my $fm1 = $nb->new_ttk__frame;
my $fm5 = $nb->new_ttk__frame;
my $sw  = $fm1->new_ScrolledWindow(
	-managed    => 0,
	-background => "white",
);
$sw->g_pack(
	-fill   => "both",
	-expand => 1,
);
my $t = my $t2 = $sw->new_text(
	-padx       => 5,
	-pady       => 5,
	-background => "white",
);
$sw->setwidget($t);
$nb->add( $fm1, -text => "Tab 1" );
$nb->add( $fm5, -text => "Tab 2" );
$fm1->new_label()->g_pack(qw/-anchor nw/);
$fm5->new_label()->g_pack(qw/-anchor nw/);
$sw->new_text( -padx => 5, -pady => 5, -background => "white" );
$t2->g_bind( "<Button-3>",
	[ \&post_menu, Tkx::Ev( "%X", "%Y" ), mk_menu_popup($t2) ] );

if (@ARGV) {
	Tkx::after_idle( [ \&load, $ARGV[0] ] );
}
else {
	new();
}
Tkx::MainLoop();
exit;

sub mk_menu {
	$mw   = shift;
	$menu = $mw->new_menu;
	$file = $menu->new_menu( -tearoff => 0, );
	$mw->g_bind( "<Control-n>", \&new );
	$mw->g_bind( "<Control-o>", \&my_open );
	$mw->g_bind( "<Control-s>", \&save );
	$menu->add_cascade(
		-label     => "File",
		-underline => 0,
		-menu      => $file,
	);
	$file->add_command(
		-label     => "New",
		-underline => 0,
		-command   => sub { new(); },
	);
	$file->add_command(
		-label       => "Open",
		-underline   => 0,
		-accelerator => "Ctrl+O",
		-command     => sub { my_open(); },
	);
	$file->add_command(
		-label       => "Save",
		-underline   => 0,
		-accelerator => "Ctrl+s",
		-command     => sub { save(); },
	);
	$file->add_command(
		-label     => "Exit",
		-underline => 1,
		-command   => [ \&Tkx::destroy, $mw ],
	  )
	  unless $IS_AQUA;
	my $help = $menu->new_menu(
		-name    => "help",
		-tearoff => 0,
	);
	$menu->add_cascade(
		-label     => "Help",
		-underline => 0,
		-menu      => $help,
	);
	$help->add_command(
		-label   => "\u$progname Manual",
		-command => \&show_manual,
	);
	my $about_menu = $help;

	if ($IS_AQUA) {
		$about_menu = $menu->new_menu( -name => "apple", );
		$menu->add_cascade( -menu => $about_menu, );
	}
	$about_menu->add_command(
		-label   => "About \u$progname",
		-command => \&about,
	);
	return $menu;
}

sub mk_menu_popup {
	my $t = shift;
	my $m = $t->new_menu( -tearoff => 0, );
	$m->add_command(
		-label   => "Close",
		-command => \&close_f,
	);
	$m->add_command(
		-label   => "Empty",
		-command => \&new,
	);
	return $m;
}

sub post_menu {
	my ( $x, $y, $menu ) = @_;
	Tkx::tk___popup( $menu, $x, $y );
}

sub close_f {

	#	print "Test close_f";
}

sub about {
	Tkx::tk___messageBox(
		-parent  => $mw,
		-title   => "About \u$progname",
		-type    => "ok",
		-icon    => "info",
		-message => "$progname v$VERSION\n",
	);
}

sub my_open {
	my $f = Tkx::tk___getOpenFile( -parent => $mw, );
	load($f) if length $f;
}

sub load {
	my $f = shift;
	open( my $fh, "<:utf8", $f ) || die "Can't open '$file': $!";
	$t->delete( "1.0", "end" );
	$t->insert(
		"end",
		scalar do { local $/; <$fh> }
	);
	set_file($f);
}

sub new {
	$t->delete( "1.0", "end" );
	set_file("");
}

sub set_file {
	$file = shift;
	update_title();
}

sub update_title {
	my $title;
	if ( length $file ) {
		$title = basename($file);
	}
	else {
		$title = "<no name>";
	}

	#	$title .= " - " . basename($0);
	$title = $title . " - " . basename($0);
	$mw->g_wm_title($title);
}

sub save {
	return save_as() unless length $file;
	_save($file);
}

sub save_as {
	my $f = Tkx::tk___getSaveFile( -parent => $mw, );
	if ( length $f ) {
		_save($f);
		set_file($f);
	}
}

sub _save {
	my $f = shift;
	open SAVEFILE, ">$f" or die "Can not write to file $f $!";
	print SAVEFILE $t->get( "1.0", "end - 1 char" );
	close(SAVEFILE) or die "Can't write $f $!";
}
