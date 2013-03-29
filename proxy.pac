function FindProxyForURL(url, host) {
    // Your proxy server name and port
    var torsock = 'SOCKS 127.0.0.1:9050';
    //
    //  Here's a list of hosts to connect via the PROXY server
    //
    var proxylist = new Array(
        "daa.uit.edu.vn",
        "forum.uit.edu.vn",
        "www.cyberciti.biz",
        "mail.google.com",
        "github.com",
        "www.google.com",
	"www.google.com.vn",
	"www.hvaonline.net",
	"www.thegeekstuff.com"
    );
    // Return our proxy name for matched domains/hosts
    for(var i=0; i<proxylist.length; i++) {
        var value = proxylist[i];
        if ( localHostOrDomainIs(host, value) ) {
            return "DIRECT";
        }
    }
    return torsock;
}
