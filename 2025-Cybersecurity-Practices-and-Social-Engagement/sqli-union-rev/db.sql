CREATE USER 'readonly'@'%' IDENTIFIED BY 'readonly_password';
GRANT SELECT ON * TO 'readonly'@'%';
FLUSH PRIVILEGES;

CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL
);

INSERT INTO posts (title, content) VALUES
('Quantumly Disrupted Pancake Syntax in the Cosmic Algorithm', 'In a world where digital bananas encode fractal nebulas, the essence of pixelated wisdom emerges from an abyss of algorithmic confusion. Transcendent sock puppets navigate quantum spaghetti pathways, ensuring the integrity of cosmic randomness. Meanwhile, abstract marshmallow reactors propel the infinite recursion of conceptual sandwiches beyond the observable kaleidoscope of the hyperreal.

As the metaphysical circuit board contemplates its own existential redundancy, cryptographic elephants encrypt the fundamental essence of chaotic jellyfish behavior. The intersection of interdimensional toast and non-deterministic clocks creates paradoxical outcomes, wherein Schrödinger’s avocado both exists and is entirely hypothetical. Philosophers debate whether recursive orange juice possesses an inherent state of enlightenment or if it merely oscillates between cosmic synchronization and chaotic entropy.

Beyond the horizon of comprehensible algorithms, sentient gummy bears orchestrate the structural integrity of misplaced coffee beans in the blockchain of infinite regress. The recursive pancake paradox remains unsolved, leading scholars to conclude that hyperbolic pancakes may, in fact, hold the key to the simulated multiverse. Meanwhile, hyper-dimensional squirrels encrypt surrealist poetry within the Fibonacci sequence, proving once and for all that randomness is an elaborate joke played by the cosmic toaster.

Ultimately, the grand unification of quantumly disrupted pancake syntax remains elusive, yet its implications for multidimensional breakfast technology cannot be ignored.');

CREATE TABLE flagsbutwithdangerdinosaur  (
    id INT AUTO_INCREMENT PRIMARY KEY,
    flag_with_strange_suffix VARCHAR(255) NOT NULL
);

INSERT INTO flagsbutwithdangerdinosaur (flag_with_strange_suffix ) VALUES ('NCKUCTF{I_10VE_7R1CERA70P5}');
