<?php

/***
 * 
 * Playing with socketz
 * 
 * - starting with minor cfg possibilities 
 * 
 */

namespace SchrodtSven\Scktz;

use Socket;

class Server
{
    protected int $port = 1234;
    protected string $ip = "0.0.0.0";
    protected int $type = \STREAM_SERVER_BIND;

    public const string DTGRAM_SCH = "udp";
    public const string STRM_SCH = "tcp";

    protected $sck; // current socket 
    protected $srv_nmn = "Tiny UDP based service ...\n";

    public function __construct(protected string $addr = "") 
    {
        $this->sck = stream_socket_server("udp://127.0.0.1:1113", $errno, $errstr, \STREAM_SERVER_BIND);
        if (!$this->sck) {
            die("$errstr ($errno)"); //@FIXME !!!
        }
        
    }

    protected function prsAddr(string $addr)
    {
        $tmp = parse_url($addr);
        //@FIXME
    }

    public function run()
    {
        $wlc = "Welcome {$this->srv_nmn}";
        var_dump([$this->sck]);
        //socket_write($this->sck, $wlc, mb_strlen($wlc));
        do {
            $pkt = stream_socket_recvfrom($this->sck, 1024, 0, $peer);
 
            //echo "$peer: $repeer\n";
            stream_socket_sendto($this->sck, $pkt . ': ' . date("D M j H:i:s Y"), 0, $peer);
        } while ($pkt !== false);
    }
}

(new Server())->run();
