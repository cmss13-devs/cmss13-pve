/** Window sizes in pixels */
export enum WindowSize {
  Small = 30,
  Medium = 45,
  Large = 60,
  Width = 380,
}

/** Line lengths for autoexpand */
export enum LineLength {
  Small = 38,
  Medium = 76,
  Large = 104,
}

/**
 * Radio prefixes.
 * Contains the properties:
 * id - string. css class identifier.
 * label - string. button label.
 */
export const RADIO_PREFIXES = {
  ':h ': {
    id: 'department',
    label: 'Depart.',
  },
  '.h ': {
    id: 'department',
    label: 'Depart.',
  },
  '#h ': {
    id: 'department',
    label: 'Depart.',
  },
  ':i ': {
    id: 'comms',
    label: 'Intercom',
  },
  '.i ': {
    id: 'comms',
    label: 'Intercom',
  },
  '#i ': {
    id: 'comms',
    label: 'Intercom',
  },
  ':l ': {
    id: 'comms',
    label: 'L Hand',
  },
  '.l ': {
    id: 'comms',
    label: 'L Hand',
  },
  ':r ': {
    id: 'comms',
    label: 'R Hand',
  },
  '.r ': {
    id: 'comms',
    label: 'R Hand',
  },
  ':w ': {
    id: 'whisper',
    label: 'Whisper',
  },
  '.w ': {
    id: 'whisper',
    label: 'Whisper',
  },
  '#w ': {
    id: 'whisper',
    label: 'Whisper',
  },
  ':a ': {
    id: 'alpha',
    label: 'Alpha',
  },
  '.a ': {
    id: 'alpha',
    label: 'Alpha',
  },
  '#a ': {
    id: 'clf-med',
    label: 'CLF Med',
  },
  ':b ': {
    id: 'bravo',
    label: 'Bravo',
  },
  '.b ': {
    id: 'bravo',
    label: 'Bravo',
  },
  '#b ': {
    id: 'clf-engi',
    label: 'CLF Engi',
  },
  ':c ': {
    id: 'charlie',
    label: 'Charl.',
  },
  '.c ': {
    id: 'charlie',
    label: 'Charl.',
  },
  '#c ': {
    id: 'cia',
    label: 'CIA',
  },
  ':d ': {
    id: 'delta',
    label: 'Delta',
  },
  '.d ': {
    id: 'delta',
    label: 'Delta',
  },
  '#d ': {
    id: 'merc',
    label: 'Mercenary',
  },
  ':e ': {
    id: 'echo',
    label: 'Echo',
  },
  '.e ': {
    id: 'echo',
    label: 'Echo',
  },
  '#e ': {
    id: 'pmc-engi',
    label: 'PMC Engi',
  },
  ':f ': {
    id: 'foxtrot',
    label: 'Foxtr.',
  },
  '.f ': {
    id: 'foxtrot',
    label: 'Foxtr.',
  },
  '#f ': {
    id: 'pmc-med',
    label: 'PMC Med',
  },
  ':g ': {
    id: 'ship',
    label: 'Ship',
  },
  '.g ': {
    id: 'ship',
    label: 'Ship',
  },
  '#g ': {
    id: 'clf',
    label: 'CLF',
  },
  ':j ': {
    id: 'jtac',
    label: 'JTAC',
  },
  '.j ': {
    id: 'jtac',
    label: 'JTAC',
  },
  '#j ': {
    id: 'upp-cct',
    label: 'UPP CCT',
  },
  ':k ': {
    id: 'sof',
    label: 'SOF',
  },
  '.k ': {
    id: 'sof',
    label: 'SOF',
  },
  '#k ': {
    id: 'specops',
    label: 'SpecOps',
  },
  '#l ': {
    id: 'provost',
    label: 'Provost',
  },
  ':m ': {
    id: 'medsci',
    label: 'MedSci',
  },
  '.m ': {
    id: 'medsci',
    label: 'MedSci',
  },
  '#m ': {
    id: 'upp-med',
    label: 'UPP Med',
  },
  ':n ': {
    id: 'engi',
    label: 'Engi',
  },
  '.n ': {
    id: 'engi',
    label: 'Engi',
  },
  '#n ': {
    id: 'upp-engi',
    label: 'UPP Engi',
  },
  ':o ': {
    id: 'colony',
    label: 'Colony',
  },
  '.o ': {
    id: 'colony',
    label: 'Colony',
  },
  '#o ': {
    id: 'pmc-cct',
    label: 'PMC CCT',
  },
  ':p ': {
    id: 'security',
    label: 'MP',
  },
  '.p ': {
    id: 'security',
    label: 'MP',
  },
  '#p ': {
    id: 'pmc',
    label: 'PMC',
  },
  ':q ': {
    id: 'rmc',
    label: 'RMC',
  },
  '.q ': {
    id: 'rmc',
    label: 'RMC',
  },
  '#q ': {
    id: 'rmc',
    label: 'RMC',
  },
  '#r ': {
    id: 'yautja',
    label: 'Yautja',
  },
  ':s ': {
    id: 'us-army',
    label: 'US Army',
  },
  '.s ': {
    id: 'us-army',
    label: 'US Army',
  },
  '#s ': {
    id: 'us-army',
    label: 'US Army',
  },
  ':t ': {
    id: 'intel',
    label: 'Int',
  },
  '.t ': {
    id: 'intel',
    label: 'Int',
  },
  '#t ': {
    id: 'upp-kdo',
    label: 'UPP Kdo',
  },
  ':u ': {
    id: 'req',
    label: 'Req',
  },
  '.u ': {
    id: 'req',
    label: 'Req',
  },
  '#u ': {
    id: 'upp',
    label: 'UPP',
  },
  ':v ': {
    id: 'command',
    label: 'Cmd.',
  },
  '.v ': {
    id: 'command',
    label: 'Cmd.',
  },
  '#v ': {
    id: 'upp-cmd',
    label: 'UPP Cmd.',
  },
  ':x ': {
    id: 'usasf',
    label: 'USASF',
  },
  '.x ': {
    id: 'usasf',
    label: 'USASF',
  },
  '#x ': {
    id: 'usasf',
    label: 'USASF',
  },
  ':y ': {
    id: 'wy',
    label: 'W-Y',
  },
  '.y ': {
    id: 'wy',
    label: 'W-Y',
  },
  '#y ': {
    id: 'wy',
    label: 'W-Y',
  },
  ':z ': {
    id: 'highcom',
    label: 'HC',
  },
  '.z ': {
    id: 'highcom',
    label: 'HC',
  },
  '#z ': {
    id: 'pmc-cmd',
    label: 'PMC Cmd.',
  },
  ':0 ': {
    id: 'uscg',
    label: 'USCG',
  },
  '.0 ': {
    id: 'uscg',
    label: 'USCG',
  },
  '#0 ': {
    id: 'uscg',
    label: 'USCG',
  },
  ':1 ': {
    id: 'usasf',
    label: 'USASF',
  },
  '.1 ': {
    id: 'usasf',
    label: 'USASF',
  },
  '#1 ': {
    id: 'usasf',
    label: 'USASF',
  },
  ':2 ': {
    id: 'pfa',
    label: 'PFA',
  },
  '.2 ': {
    id: 'pfa',
    label: 'PFA',
  },
  '#2 ': {
    id: 'pfa',
    label: 'PFA',
  },
  ':3 ': {
    id: 'jsc',
    label: 'JSC',
  },
  '.3 ': {
    id: 'jsc',
    label: 'JSC',
  },
  '#3 ': {
    id: 'jsc',
    label: 'JSC',
  },
} as const;

export const LANGUAGE_PREFIXES = {
  '!0 ': {
    id: 'scandinavian',
    label: 'Scandinavian',
  },
  '!1 ': {
    id: 'english',
    label: 'English',
  },
  '!2 ': {
    id: 'japanese',
    label: 'Japanese',
  },
  '!3 ': {
    id: 'russian',
    label: 'Russian',
  },
  '!4 ': {
    id: 'german',
    label: 'German',
  },
  '!5 ': {
    id: 'spanish',
    label: 'Spanish',
  },
  '!6 ': {
    id: 'apollo',
    label: 'Apollo',
  },
  '!7 ': {
    id: 'french',
    label: 'French',
  },
  '!8 ': {
    id: 'chinese',
    label: 'Chinese',
  },
  '!9 ': {
    id: 'russian patois',
    label: 'Russian patois',
  },
  '!f ': {
    id: 'filipino',
    label: 'Filipino',
  },
  '!h ': {
    id: 'hellhound',
    label: 'Hellhound',
  },
  '!l ': {
    id: 'tactical sign language',
    label: 'Tacitical Sign',
  },
  '!m ': {
    id: 'primitive',
    label: 'Primitive',
  },
  '!p ': {
    id: 'polish',
    label: 'Polish',
  },
  '!s ': {
    id: 'sainja',
    label: 'Sainja',
  },
  '!t ': {
    id: 'telepathy',
    label: 'Telepathy',
  },
  '!q ': {
    id: 'hivemind',
    label: 'Hivemind',
  },
  '!x ': {
    id: 'xenomorph',
    label: 'Xenomporph',
  },
} as const;
