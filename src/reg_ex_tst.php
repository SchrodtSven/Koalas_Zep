<?php

/**
 * Playing around with regular expressions
 * 
 * 
 * @since 2025-10-02
 * @author Sven Schrodt
 */


// preg_match('/Ich esse(.*) gern/', 'Foo bar', $matches, PREG_OFFSET_CAPTURE);
// #print(trim($matches[1][0]));
// var_dump($matches);


$action = [
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
        'regex' =>  '/[Ee]rzähle mir (?:einen|einen weiteren) Witz/',
        'answers' => [
            'Kommt ein Pferd in die Kneipe, fragt der Wirt: warum so ein langes Gesicht?',
            'Chuck Norris hält seine eigenen Elfmete',
            'Welche Sportler reden am wenigsten? Tennisspieler! Drei Sätze und dann ist Schluss!',
            'Was macht der Clown im Büro? Faxen!'
        ]

    ],
    [
        'regex' =>  '/Erzähle mir von (.*)/',
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


foreach ($action as $itm) {
    $stnc = 'Erzähle mir von BooHoo!';
    $stnc = 'Mir geht es nicht gut';
    $stnc = 'Mein Schwein pfeift';
    $stnc = 'quit';
    $stnc = 'Ich surfe gerne';
    preg_match($itm['regex'], $stnc, $matches, PREG_OFFSET_CAPTURE);

    if(count($matches) >1) {
        if ($matches[0][0] == $stnc) {
            print("exact match: " .$itm['answers'][array_rand($itm['answers'])] );
            exit(23);
        }
        var_dump($matches);
        $found = $matches[1][0];
        
        printf(
            $itm['answers'][array_rand($itm['answers'])],
            $found
    
        );
        break;
    }


}