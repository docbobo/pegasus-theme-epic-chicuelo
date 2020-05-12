const TEXT_COLOR = '#818181';

const systems = {
    '3do': {
        short: '32 BIT CONSOLE',
        long:  'The 3DO Interactive Multiplayer, often called simply the 3DO, is a home video game console platform developed by The 3DO Company',
    },
    'amiga': {
        short: '1987  ·  16/32-BIT COMPUTER',
        long:  'The original model was part of a wave of 16 and 32 bit computers that featured 256KB or more of RAM, mouse-based GUIs, and improved graphics & audio',
    },
    'amstradcpc': { 
        short: '1984  ·  8-BIT COMPUTER', 
        long:  'The Amstrad CPC is a series of 8-bit home computers. The CPC series was pitched against other home computers and enjoyed a strong supply of game software',
    },
    'apple2': {
        short: '8-BIT COMPUTER',
        long:  '8 bit home computer, one of the first highly successful mass-produced microcomputer products, designed primarily by Steve Wozniak',
    },
    'arcade': {
        short: 'COIN OPERATED CABINET',
        long: 'Coin-operated entertainment machines. The golden age is defined as a period between 1970s and ending the mid-1980s',
    },
    'atari800': {
        short: '1979  ·  8-BIT COMPUTER',
        long:  'The Atari 8-bit family is a series of 8-bit home computers. All of the machines in the family are technically similar and differ primarily in packaging',
    },
    'atari2600': { 
        short: '1977  ·  128 BYTES CONSOLE', 
        long:  'The Atari 2600 is credited with popularizing the use of microprocessor-based hardware and ROM cartridges containing game code',
    },
    'atari5200': {
        short: '1982  ·  8-BIT CONSOLE',
        long:  'Home video game console that was introduced as a higher-end complementary console for the popular Atari 2600',
    },
    'atari7800': {
        short: '1986  ·  8-BIT CONSOLE',
        long:  'Almost fully backward-compatible with the Atari 2600, the 7800 was the first console to have backward compatibility without the use of additional modules',
    },
    'atarijaguar': {
        short: '1993  ·  64-BIT CONSOLE',
        long:  'Sixth and last programmable console to be developed under the Atari brand, Atari marketed the Jaguar as being the first 64-bit video game console',
    },
    'atarilynx': {
        short: '1989  ·  16-bit Handheld Console',
        long:  'The Lynx was the world\'s first handheld electronic game with a color LCD and was also notable for its advanced graphics and ambidextrous layout',
    },
    'atarist': {
        short: '1985  ·  16-BIT COMPUTER',
        long:  'The Atari ST is a line of home computers from Atari Corporation and the successor to the Atari 8-bit family',
    },
    'c64': {
        short: '1982  ·  8-bit Computer',
        long:  'The C64 is listed in the Guinness World Records as the highest-selling single computer model of all time',
    },
    'coco': {
        short: '1980  ·  8-BIT COMPUTER',
        long:  'The TRS-80 Color Computer (affectionately nicknamed CoCo) lasted through three generations of hardware until being discontinued in 1991',
    },
    'colecovision': {
        short: '1982  ·  8-BIT CONSOLE',
        long:  'The ColecoVision offered a closer experience to more powerful arcade game systems compared to competitors such as the Atari 2600',
    },
    'daphne': {
        short: 'LASERDISCS CONSOLE',
        long:  'Converged device and home video game console capable of playing Laserdiscs, Compact Discs, console games, and LD-G karaoke discs',
    },
    'dragon32': {
        short: '1980  ·  8-BIT COMPUTER',
        long:  'The Dragon 32 and Dragon 64 were home computers similar to the TRS-80 Color Computer. The 32 and 64 refer to the kilobytes of RAM.',
    },
    'dreamcast': {
        short: '1998  ·  \'128-BIT\' CONSOLE',
        long:  'The Dreamcast was Sega\'s final home console, marking the end of the company\'s 18 years in the console market',
    },
    'famicom': {
        short: '1986  ·  8-BIT CONSOLE',
        long:  'The Family Computer is a peripheral for Nintendo\'s Family Computer home video game console, released only in Japan',
    },
    'fba': {
        short: 'COIN OPERATED CABINET',
        long:  'Coin-operated entertainment machines. The golden age is defined as a period between the late 1970s and ending in the mid-1980s',
    },
    'fds': {
        short: '1986  ·  8-BIT CONSOLE',
        long:  'The Family Computer is a peripheral for Nintendo\'s Family Computer home video game console, released only in Japan'
    },
    'gameandwatch': {
        short: 'HANDHELD ELECTRONIC GAMES',
        long:  'Line of handheld electronic games produced by Nintendo from 1980 to 1991. Created by game designer Gunpei Yokoi',
    },
    'gamegear': {
        short: '1990  ·  8-bit Handheld Console',
        long:  'The Game Gear shares much of its hardware with the Master System and is able to play its own titles as well as those of the Master System',
    },
    'gba': {
        short: '2001  ·  32-bit Handheld Console',
        long:  'Successor to the Game Boy Color. Market competitors at the time were the Neo Geo Pocket Color, Wonder Swan, GP32 and the N-Gage',
    },
    'gbc': {
        short: '1998  ·  8-bit Handheld Console',
        long:  'The Game Boy Color features a color screen. It is slightly thicker and taller and features a slightly smaller screen then the Game Boy Pocket',
    },
    'gc': {
        short: '2001  ·  \'128-BIT\' CONSOLE',
        long:  'The Nintendo GameCube is the successor to the Nintendo 64 and is the first Nintendo console to use optical discs as its primary storage medium',
    },
    'genesis': {
        short: '16 BIT CONSOLE',
        long:  'Sega\'s third console and the successor to the Master System. First released as the Mega Drive in Japan in 1988',
    },
    'intellivision': {
        short: '1980  ·  8-BIT CONSOLE',
        long:  'The Intellivision is a home video game console released by Mattel Electronics, and was in direct competition with the Atari 2600',
    },
    'kodi': {
        short: 'STREAMING VIDEO SERVICE',
        long:  'Kodi is an award-winning free and open source cross-platform software media player and entertainment hub for digital media for HTPCs',
    },
    'macintosh': {
        short: '1984  ·  8-BIT COMPUTER',
        long:  'The Macintosh 128K, originally released as the Apple Macintosh, is the original Apple Macintosh personal computer',
    },
    'mame': {
        short: 'COIN OPERATED CABINET',
        long:  'Coin-operated entertainment machines. The golden age is defined as a period between the late 1970s and ending in the mid-1980s',
    },
    'mastersystem': {
        short: '1985  ·  8-bit Console',
        long:  'Succeeding the SG-1000, the Master System was released as a direct competitor to the Nintendo Entertainment System',
    },
    'megacd': {
        short: '1991  ·  16-BIT CONSOLE',
        long:  'CD-ROM add-on to the Megadrive, it launched many FMV games, including the infamous Night Trap, which led to the creation of the ESRB',
    },
    'megadrive': {
        short: '1988  ·  16-bit Console',
        long:  'Sega\'s third console and the successor to the Master System. First released as the Mega Drive in Japan',
    },
    'mess': {
        short: 'MULTI HARDWARE EMULATOR',
        long:  'MESS (Multi Emulator Super System) is a system that emulates a vast quantity of obscure hardware'
    },
    'msx': {
        short: '1983  ·  8-BIT COMPUTER',
        long:  'MSX is a standardized home computer architecture, conceived as an attempt to create unified standards among various hardware makers',
    },
    'msx2': {
        short: '1984  ·  16-BIT COMPUTER',
        long:  'MSX2 is a standardized home computer architecture, conceived as an attempt to create unified standards among various hardware makers',
    },
    'n64': {
        short: '64 BIT CONSOLE',
        long:  'It was the last major home console to use the cartridge as its primary storage format until Nintendo\'s seventh console The Switch',
    },
    'nds': {
        short: '2004  ·  32-BIT HANDHELD CONSOLE',
        long:  'The Nintendo DS is a dual-screen handheld game console developed and released by Nintendo that featured two LCD screens working in tandem',
    },
    'neogeo': {
        short: '1990  ·  24-bit Console',
        long:  'Originally launched as the MVS coin-operated arcade machine. It was ranked 19th out of 25 best video game consoles of all time',
    },
    'nes': {
        short: '1983  ·  8-bit Console',
        long:  'The best selling gaming console of its time, the NES helped revitalize the US video game industry following the video game crash of 1983',
    },
    'ngp': {
        short: '1998  ·  16-BIT HANDHELD CONSOLE',
        long:  'Monochrome handheld game console released by SNK. It was the company\'s first handheld system and is part of the Neo Geo family',
    },
    'ngpc': {
        short: '1999  ·  16-BIT HANDHELD CONSOLE',
        long:  'The Neo Geo Pocket Color is the successor to SNK\'s monochrome Neo Geo Pocket, with the Color being fully backward compatible',
    },
    'odyssey2': {
        short: '1978  ·  8-BIT CONSOLE',
        long:  'The Odyssey2 was one of the major three home consoles prior to the 1983 video game market crash, along with Atari 2600 and IntelliVision',
    },
    'oric': {
        short: '1983  ·  8-BIT COMPUTER',
        long:  'The Oric was a series of home computers originally released by the Tangerine Computer Systems, including the original Oric-1',
    },
    'pc': {
        short:    '1981  ·  DESKTOP COMPUTERS',
        long:     'MS-DOS is an operating system for x86-based personal computers mostly developed by Microsoft',
        sort_key: 'MSDOS'
    },
    'pc88': {
        short: '1981  ·  8-BIT COMPUTER',
        long:  'The PC-8800 series, commonly shortened to PC-88, are a brand of Zilog Z80-based home computers released by NEC',
    },
    'pcengine': {
        short: '16 BIT CONSOLE',
        long:  'Originally intended to compete with the NES, it ended up competing with the Sega Genesis, and later on the Super Nintendo',
    },
    'pcfx': {
        short: '1994  ·  32-BIT CONSOLE',
        long:  'The PC-FX was released just weeks after Sony\'s PlayStation and a month after the Sega Saturn. It is the successor to the PC Engine',
    },
    'ports': {
        short: 'SOFTWARE',
        long:  'Multi-platform ports of software and game engines from PC to DOS',
    },
    'ps2': {
        short: '2000  ·  \'128-BIT\' CONSOLE',
        long:  'The PlayStation 2 is the best-selling video game console of all time, selling over 155 million units.',
    },
    'psp': {
        short: '2004  ·  32-BIT HANDHELD CONSOLE',
        long:  'Sony\'s first handheld, it was also the first real competition to Nintendo handhelds since the Game Gear',
    },
    'psx': {
        short: '1994  ·  32-BIT CONSOLE',
        long:  'The Sony PlayStation primarily competed with the Nintendo 64 and the Sega Saturn as part of the fifth generation of video game consoles',
    },
    'residualvm': {
        short: 'CROSS PLATFORM COMPUTER',
        long:  'Play the classic "Point and Click" graphic adventure games from different platforms and systems like MS-DOS, C64, Apple II or PC',
    },
    'samcoupe': {
        short: '1989  ·  8-BIT COMPUTER',
        long:  'The SAM Coupé is a British home computer and was marketed as a logical upgrade from the Spectrum',
    },
    'saturn': {
        short: '1994  ·  32-BIT CONSOLE',
        long:  'Fifth generation home video game console developed by Sega and successor to the successful Sega Genesis',
    },
    'scummvm': {
        short: 'CROSS PLATFORM COMPUTER',
        long:  'Play the classic "Point and Click" graphic adventure games from different platforms and systems like MS-DOS, C64, Apple II or PC',
    },
    'sega32x': {
        short: '1994  ·  32-bit Addon',
        long: 'Designed to expand the power of the Genesis and serve as a transitional console into the 32-bit era until the release of the Sega Saturn',
    },
    'segacd': {
        short: '32 BIT CONSOLE',
        long: 'Designed to expand the power of the Genesis and serve as a transitional console into the 32-bit era until the release of the Sega Saturn',
    },
    'sg-1000': {
        short: '1983  ·  8-BIT CONSOLE',
        long:  'Sega\'s first entry into the home video game hardware business provided the basis for the more successful Master System.',
    },
    'snes': {
        short: '1990  ·  16-BIT CONSOLE',
        long:  'Nintendo\'s second home console introduced advanced graphics and sound capabilities compared with other systems at the time',
    },
    'steam': {
        short: 'DIGITAL PLATFORM',
        long:  'Developed by Valve Corporation,  Steam offers digital rights management, multiplayer gaming, video streaming and social networking services',
    },
    'tg16': {
        short: '1987  ·  16-BIT CONSOLE',
        long:  'Originally intended to compete with the NES, it ended up competing with the Sega Genesis, and later on the Super Nintendo',
    },
    'ti99': {
        short: '1981  ·  16-BIT COMPUTER',
        long:  'Released by Texas Instruments, the TI-99/4 series holds the distinction of being the first 16-bit personal computer.',
    },
    'trs-80': {
        short: '1977  ·  8-BIT COMPUTER',
        long:  'The TRS-80 is a desktop microcomputer and was one of the earliest mass-produced and mass-marketed retail personal computers',
    },
    'vectrex': {
        short: '1982  ·  8-BIT CONSOLE',
        long:  'Vector display based home video game console that was developed by Western Technologies Smith Engineering',
    },
    'videopac': {
        short: '1978  ·  8-BIT CONSOLE',
        long:  'The Videopac was one of the major three home consoles prior to the 1983 video game market crash, along with Atari 2600 and IntelliVision'
    },
    'virtualboy': {
        short: '1995  ·  32-bit Table-top Console',
        long:  'It was marketed as the first console capable of displaying stereoscopic 3D graphics using a parallax effect to create the illusion of depth',
    },
    'wii': {
        short: '2006  ·  32-BIT CONSOLE',
        long:  'The Wii introduced the Wii Remote controller, which can be used as a handheld pointing device and detects movement in three dimensions.',
    },
    'wiiu': {
        short: '2012  ·  HANDHELD CONSOLE',
        long: 'Successor to the Wii and the first eighth-gen video game console, as it competed with Microsoft\'s Xbox One and Sony\'s PS4.',
    },
    'wonderswan': {
        short: '1999  ·  16-BIT HANDHELD CONSOLE',
        long:  'Powered by a 16 bit central processing unit, it took advantage of a low price point and long battery life in comparison to its competition',
    },
    'wonderswancolor': {
        short: '1999  ·  16-BIT HANDHELD CONSOLE',
        long:  'Powered by a 16 bit central processing unit, it took advantage of a low price point and long battery life in comparison to its competition',
    },
    'x68000': {
        short: '1987  ·  \'24-BIT\' COMPUTER',
        long:  'The X68000 is a home computer, sold only in Japan. In terms of hardware, the X68K was very similar to arcade machines of the time',
    },
    'zmachine': {
        short: '1979  ·  16-BIT VM',
        long:  'The Z-machine is a virtual machine that was developed by Joel Berez and Marc Blank and used by Infocom for its text adventure games',
    },
    'zxspectrum': {
        short: '1982  ·  8-BIT COMPUTER',
        long: 'The Spectrum was among the first mainstream-audience home computers in the UK, similar in significance to the Commodore 64 in the USA',
    },


    'auto-allgames': {
        short: 'ALL CONSOLES / HANDHELDS',
        long:  'Your entire game collection',
    },
    'auto-favorites': {
        short:    'FAVORITES',
        long:     'Access and quickly play your favorite games across the entire library',
        sort_key: 'Z02favorites'
    },
    'auto-lastplayed': {
        short: 'ALL CONSOLES / HANDHELDS',
        long:  'Your last played games',
    },

    'custom-collections': {
        short: 'CUSTOM COLLECTIONS',
        long:  'Access and quickly play games you have added to your custom collections',
    },


    'action': {
        short: 'GAME GENRE',
        long:  'An action game emphasizes physical challenges, including hand–eye coordination and reaction-time',
    },
    'adventure': {
        short: 'GAME GENRE',
        long:  'In an adventure game the player follows an interactive story, driven by exploration and puzzle-solving',
    },
    'btmups': {
        short: 'GAME GENRE',
        long:  'Beat \'em up (also known as brawler) feature hand-to-hand or weapon combat between the protagonist and an improbably large number of opponents',
    },
    'fighting': {
        short: 'GAME GENRE',
        long:  'In a fighting game, the player engages in close combat with an AI or player-controlled opponent',
    },
    'fixedscreen': {
        short: 'GAME GENRE',
        long:  'A fixed or single screen perspective applies to all video games in which the entire playfield is shown on the screen',
    },
    'kids': {
        short: 'GAME GENRE',
        long:  'A kids-friendly game may include minimal cartoon or fantasy violence, and infrequent mild language',
    },
    'platformers': {
        short: 'GAME GENRE',
        long:  'In a platformer the player controls a character to jump between suspended platforms and avoid obstacles',
    },
    'puzzle': {
        short: 'GAME GENRE',
        long:  'Puzzle games can test many problem-solving skills including logic, pattern recognition, sequence solving, and word completion',
    },
    'racing': {
        short: 'GAME GENRE',
        long:  'In racing games the player partakes in competitions with any type of land, water, air or space vehicles, either real or fictional',
    },
    'rpgs': {
        short: 'GAME GENRE',
        long:  'In a role-playing game, the player controls the actions of one or several characters, immersed in an often fantastical world',
    },
    'shmups': {
        short: 'GAME GENRE',
        long:  'In a shoot \'em up, the player shoots large numbers of enemies while dodging obstacles, often in a spacecraft or aircraft',
    },
    'sports': {
        short: 'GAME GENRE',
        long:  'Most sports have been recreated with a game, including team sports, track and field, extreme sports and combat sports',
    },
    'strategy': {
        short: 'GAME GENRE',
        long:  'Strategy video games focus on thinking and planning, and provide strategic, tactical, and sometimes logistical challenges',
    },


    'power': {
        short:    'Shut Down Menu',
        long:     'Safe option to Shut down or restart your System',
        sort_key: 'Z01power'
    }
};

var indicators = [
    '../assets/indicators/1st-system.png',
    '../assets/indicators/2nd-system.png',
    '../assets/indicators/3rd-system.png',
    '../assets/indicators/4th-system.png',
    '../assets/indicators/5th-system.png',
    '../assets/indicators/6th-system.png',
    '../assets/indicators/7th-system.png',
    '../assets/indicators/8th-system.png',
    '../assets/indicators/9th-system.png',
    '../assets/indicators/10th-system.png',
    '../assets/indicators/11th-system.png',
    '../assets/indicators/12th-system.png',
    '../assets/indicators/13th-system.png',
    '../assets/indicators/14th-system.png',
    '../assets/indicators/15th-system.png',
    '../assets/indicators/16th-system.png',
];

function format_game_count(modelData) {
    let count = modelData.games.count
    if (count == 0) {
        return "NO GAMES AVAILABLE";
    } else if (count == 1) {
        return "ONE GAME AVAILABLE";
    } else {
        return count + " GAMES AVAILABLE";
    }
}

function lookup_summary(modelData)  {
    if (modelData.summary) return modelData.summary;

    let system = systems[modelData.shortName];
    if (system) return system.short;
    return null;
}

function lookup_description(modelData)  {
    if (modelData.description) return modelData.description;

    let system = systems[modelData.shortName];
    if (system) return system.long;
    return null;
}

function lookup_indicator(index, item)  {
    if (item.shortName == 'power') {
        return  "../assets/indicators/power.png"
    } else if (item.shortName == 'auto-favorites') {
        return  "../assets/indicators/auto-favorites.png"
    }

    return indicators[index];
}

function get_sort_key(modelData) {
    let system = systems[modelData.shortName];
    if (system && system.sort_key) return system.sort_key;
    return modelData.name;
}

function test(modelData) {
    console.log(JSON.stringify(modelData));
    return modelData;
}