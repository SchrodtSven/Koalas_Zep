<?php

use PsrExt\Http\Message\MessageInterface;
use PsrExt\Http\Message\StreamInterface;

class HttpMess implements MessageInterface
{
    private string $version = "2.0";

    protected array $headers = [];

    protected StreamInterface $body;

    public function getProtocolVersion(): string
    {
        return $this->version;
    }



    public function getHeaders(): array
    {
        return $this->headers;
    }

    public function hasHeader($name): bool
    {
        return (bool) count($this->headers);
    }

    public function getHeader($name): array
    {
        return $this->headers[$name]
            ?? null;
    }
    public function getHeaderLine($name): string 
    {
        return "{$name}: {$this->headers[$name]}";
    }

    public function withHeader($name, $value): MessageInterface 
    {
        $this->headers[$name] = $value;
        return $this;
    }

    public function withAddedHeader($name, $value): MessageInterface 
    {
        $this->headers[$name] = $value;
        return $this;
    }

    public function withoutHeader($name): MessageInterface 
    {
        unset($this->headers[$name]);
        return $this;
    }

    public function getBody(): StreamInterface 
    {
        return $this->body;
    }
    
    public function withBody(StreamInterface $body): MessageInterface 
    {
        $this->body = $body;
        return $this;
    }

    public function withProtocolVersion($version): MessageInterface
    {
        $this->version = $version;
        return $this;
    }
}

$mesg = new HttpMess();
var_dump($mesg);
