use Purple;
use utf8;

%PLUGIN_INFO = (
    perl_api_version => 2,
    name => "Filter Word",
    version => "0.1",
    summary => "Filter bad Word.",
    description => "Filter word you hate",
    author => "Severus <huynhok.uit@gmail.com",
    url => "http://pidgin.im",
    load => "plugin_load",
    unload => "plugin_unload"
);
sub plugin_init {
    return %PLUGIN_INFO;
}
sub plugin_load {
    my $plugin = shift;
    $conv = Purple::Conversations::get_handle(); 
    Purple::Signal::connect($conv, "receiving-im-msg", $plugin, \&conv_msg, "");
    Purple::Signal::connect($conv, "receiving-chat-msg", $plugin, \&conv_msg, "");
    Purple::Signal::connect($conv, "writing-chat-msg", $plugin, \&conv_msg, "");
    Purple::Signal::connect($conv, "writing-im-msg", $plugin, \&conv_msg, "");
}
sub plugin_unload {
    my $plugin = shift;
}

sub conv_msg {
    my ($account, $who, $message, $conv, $flags, $data) = @_;
    my @words = ('fuck', 'suck' , 'chó' );
    foreach $word (@words) {
        $_[2] =~ s/$word/***/g;
        Purple::Debug::info("testplugin", "$word \n");
    }

    return 0;
}