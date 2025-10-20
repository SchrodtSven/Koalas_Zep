<?php
/**
 * Very simple Eliza emulating robot - currently ONLY in GERMAN (DE,de)
 * 
 * @TODO :
 * @FIXME :
 *  - multi language
 *  . socket based communication
 * 
 * 
 * @since 2025-10-02
 * @author Sven Schrodt
 */


class Pheliza
{
    protected bool $dbg = false;

    protected string $name = 'Dr. Pheliza';

    protected string $othName = '';

    public function __construct()
    {
        system('clear');
        printf(
            'Willkommen Besucher - mein name ist %s%s',
            $this->name,
            PHP_EOL
        );
    }



    protected array $action = [
        [
            'regex' =>  '/Mir geht es nicht gut/',
            'answers' =>  [
                'Es tut mir leid zu hören, dass es dir nicht gut geht. Möchtest du darüber sprechen?',
                'Wenn du irgendetwas brauchst oder ich dir helfen kann, lass es mich wissen.',
                'Ich bin für dich da, egal was du brauchst. Manchmal kann es helfen, einfach mit jemandem zu reden.'
            ]
        ],
        [
            'regex' =>  '/Ich (.*) gern/',
            'answers' =>  [
                'Das klingt interessant. Erzähl mir mehr über %sn',
                'Welche Ziele hast du beim %sn',
                'Wie kann ich dir helfen, wenn du %sn möchtest'
            ]
        ],
        [
            'regex' =>  '/Mein Hobby ist (.*)/',
            'answers' =>  [
                'Das klingt interessant. Erzähl mir mehr vom %s.',
                'Welche Ziele hast du beim %s?',
                'Wie kann ich dir helfen, wenn du %s möchtest?'
            ]
        ],
        [
            'regex' =>  '/Mein(.*)/',
            'answers' =>  [
                'Was bedeutet es, dass dein%s.',
                'Wie verändert es dein Leben, dass dein%s?',
                'Was bewegt dich daran, dass dein%s?'
            ]
        ],
        [
            'regex' =>  '/Ich habe vor (.*)/',
            'answers' =>  [
                'Schön, dass du %s möchtest',
                'Wonach suchst du, wenn du %s möchtest',
                'Wie kann ich dir helfen, wenn du %s möchtest'
            ]
        ],
        [
            'regex' =>  '/Ich möchte (.*)/',
            'answers' =>  [
                'Schön, dass du %s möchtest',
                'Wonach suchst du, wenn du %s möchtest',
                'Wie kann ich dir helfen, wenn du %s möchtest'
            ]
        ],
        [
            'regex' =>  '/(?:Ich heisse|mein Name ist) (.*)/',
            'answers' =>  [
                'Schön, dass du da bist, %s!',
                'Wonach suchst du, %s?',
                'Wie kann ich dir helfen, %s?'
            ]
        ],
        [
            'regex' =>  '/Ich brauche (.*)/',
            'answers' =>  [
                'Warum brauchst du %s?',
                'Würde %s dir denn wirklich helfen?',
                'Bist du sicher, dass du %s brauchst?'
            ]
        ],
        [
            'regex' =>  '/Ich will (.*)/',
            'answers' =>  [
                'Warum möchtest du %s?',
                'Was erhoffst du dir von %s?',
                'Gibt es einen bestimmten Grund, warum du %s willst?'
            ]
        ],
        [
            'regex' =>  '/Ich wünsche mir (.*)/',
            'answers' =>  [
                'Warum wünschst du dir %s?',
                'Würde %s dir denn wirklich helfen?',
                'Bist du sicher, dass du %s brauchst?',
                'Dabei wünsche ich dir viel Erfolg!'
            ]
        ],
        [
            'regex' =>  '/Kannst du (.*)?/',
            'answers' =>  [
                'Ich kann %s gerne versuchen!',
                'Das kann ich leider nicht machen!',
                'Kannst du nicht selbst %s?'
            ]
        ],
        [
            'regex' =>  '/Wie geht es dir/',
            'answers' =>  [
                'Danke. Mir geht es gut und dir?',
                'Sehr gut, danke. Und wie läuft es bei dir?',
                'Ich kann nicht klagen. Was ist mit dir?',
                'Bestens. Und dir?'
            ]
        ],
        [
            'regex' =>  '/[Ee]rzähle mir (.*) [Ww]itz/',
            'answers' => [
                'Kommt ein Pferd in die Kneipe, fragt der Wirt: warum so ein langes Gesicht?',
                'Chuck Norris hält seine eigenen Elfmete',
                'Welche Sportler reden am wenigsten? Tennisspieler! Drei Sätze und dann ist Schluss!',
                'Was macht der Clown im Büro? Faxen!'
            ]

        ],
        [
            'regex' =>  '/Ee]rzähle mir von (.*)/',
            'answers' =>  [
                'Gerne erzähle ich dir mehr über %s. Was interessiert dich daran?',
                'Was möchtest du über %s wissen?',
                'Ich kann dir einige Informationen über %s geben.'
            ]
        ],

        [
            'regex' =>  '/Mir geht es gut(.*)/',
            'answers' =>  [
                'Das freut mich.',
                'Das hört man gerne',
                'Sehr schön. Wo waren wir...?',
                'Erzähle mir mehr..'
            ]
        ],
        [
            'regex' =>  '/quit/',
            'answers' =>  [
                'Auf Wiedersehen',
                'Bye, bye',
                'Bis zum nächsten Mal'
            ]
        ],
        [
            'regex' =>  '/[A-Za-z0-9_-](.*)/',
            'answers' =>  [
                'Das habe ich nicht so recht verstanden ...',
                'Magst Du das bitte anders formulieren?',
                'Ach komm - es ist auch für mich spät',
                'Was soll das bedeuten %s?'
            ]
        ]
    ];


    public function prseAnsw(string $stnc)
    {
        foreach ($this->action as $itm) {

            preg_match($itm['regex'], $stnc, $matches, PREG_OFFSET_CAPTURE);
            if ($this->dbg) {
                var_dump($matches);
                
            }

            if (count($matches) > 1) {
                // if ($this->dbg && $matches[0][0] == $stnc) {
                //     print("exact match: " . $itm['answers'][array_rand($itm['answers'])]);
                //     exit(23);
                // }
                
                $found = $matches[1][0];
                printf(
                    $itm['answers'][array_rand($itm['answers'])],
                    $found

                );
                echo PHP_EOL;
                break;
            }
        }
    }

    public function run()
    {
        while (true) {
            $in = fread(STDIN, 1024);
            echo "{$this->name}: ";
            if (trim($in) === 'quit') {
                exit(0);
            } else {
                $this->prseAnsw(trim($in));
            }
        }
    }
}

(new Pheliza)->run();
