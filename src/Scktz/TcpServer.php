<?php
/**
 * Simple TCP based server class 
 * 
 * 
 * @since 2025-10-01
 * @author Sven Schrodt
 */

namespace SchrodtSven\Koalas\Scktz;

error_reporting(E_ALL);
set_time_limit(0);
ob_implicit_flush();

class TcpServer
{

    
    protected string $wlcMsg = "\nWelcome to the PHP Test Server. \n" .
                                "To quit, type 'quit'. To shut down the server type 'shutdown'.\n";
    protected $sck;

    public function __construct(protected string $address = '0.0.0.0',
                                protected int $port = 10000)
    {
        $this->_init();
        $this->run();
    }

    protected function _init()
    {
        if (($this->sck = socket_create(AF_INET, SOCK_STREAM, SOL_TCP)) === false) {
            $this->throwMsg("create()", socket_strerror(socket_last_error()));
        }

        if (socket_bind($this->sck, $this->address, $this->port) === false) {

            $this->throwMsg("bind()", socket_strerror(socket_last_error($this->sck)));
        }

        if (socket_listen($this->sck, 5) === false) {

            $this->throwMsg("listen()", socket_strerror(socket_last_error($this->sck)));
        }
    }




    protected function throwMsg(string $part, string $reason)
    {
        throw new \Error(sprintf("socket_%s() failed! The reason: %s\n", $part, $reason));
    }

    public function run()
    {
        do {
            if (($msgsock = socket_accept($this->sck)) === false) {
                $this->throwMsg("accept()", socket_strerror(socket_last_error($this->sck)));
                break;
            }
            /* Send instructions. */
            
            socket_write($msgsock, $this->wlcMsg, mb_strlen($this->wlcMsg));

            do {
                if (false === ($buf = socket_read($msgsock, 2048, PHP_NORMAL_READ))) {
                    $this->throwMsg("read()", socket_strerror(socket_last_error($msgsock)));
                    break 2;
                }
                if (!$buf = trim($buf)) {
                    continue;
                }
                if ($buf == 'quit') {
                    break;
                }
                if ($buf == 'shutdown') {
                    socket_close($msgsock);
                    break 2;
                }
                if ($buf == 'date') {
                    $talkback = "The time is now: " . date('Y-m-d H:i:s') . PHP_EOL;
                    socket_write($msgsock, $talkback, mb_strlen($talkback));
                }
                if($buf == 'uname') {
                    $talkback = php_uname() . PHP_EOL;
                }
                $talkback = $talkback = php_uname('n') . ": You said '$buf'\n";
                $talkback .= "in rot13: '{".str_rot13($buf)."}'\n";
                socket_write($msgsock, $talkback, mb_strlen($talkback));
                echo "$buf\n";
            } while (true);
            socket_close($msgsock);
        } while (true);

        socket_close($this->sck);
    }
}


$foo = new TcpServer();