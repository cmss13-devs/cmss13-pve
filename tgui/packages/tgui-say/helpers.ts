import type { Channel } from './ChannelIterator';
import { LANGUAGE_PREFIXES, RADIO_PREFIXES, WindowSize } from './constants';

/**
 * Once byond signals this via keystroke, it
 * ensures window size, visibility, and focus.
 */
export const windowOpen = (channel: Channel, scale: boolean) => {
  setWindowVisibility(true, scale);
  Byond.sendMessage('open', { channel });
};

/**
 * Resets the state of the window and hides it from user view.
 * Sending "close" logs it server side.
 */
export const windowClose = (scale: boolean) => {
  setWindowVisibility(false, scale);
  Byond.winset('map', {
    focus: true,
  });
  Byond.sendMessage('close');
};

/**
 * Modifies the window size.
 */
export const windowSet = (size = WindowSize.Small, scale: boolean) => {
  const pixelRatio = scale ? window.devicePixelRatio : 1;

  let sizeStr = `${WindowSize.Width * pixelRatio}x${size * pixelRatio}`;

  Byond.winset('tgui_say', {
    size: sizeStr,
  });

  Byond.winset('tgui_say.browser', {
    size: sizeStr,
  });
};

/** Helper function to set window size and visibility */
const setWindowVisibility = (visible: boolean, scale: boolean) => {
  const pixelRatio = scale ? window.devicePixelRatio : 1;

  const sizeString = `${WindowSize.Width * pixelRatio}x${WindowSize.Small * pixelRatio}`;

  Byond.winset('tgui_say', {
    'is-visible': visible,
    size: sizeString,
  });

  Byond.winset('tgui_say.browser', {
    size: sizeString,
  });
};

const CHANNEL_REGEX = /^[!:.#]\w\s/;

/** Tests for a channel prefix, returning it or none */
export function getPrefix(
  value: string,
): keyof typeof RADIO_PREFIXES | keyof typeof LANGUAGE_PREFIXES | undefined {
  if (!value || value.length < 3 || !CHANNEL_REGEX.test(value)) {
    return;
  }
  let adjusted;
  let languagePrefixCheck = value.charAt(0);
  if ((languagePrefixCheck = '!')) {
    adjusted = value
      .slice(0, 3)
      ?.toLowerCase() as keyof typeof LANGUAGE_PREFIXES;
  } else {
    adjusted = value.slice(0, 3)?.toLowerCase() as keyof typeof RADIO_PREFIXES;
  }

  if (!RADIO_PREFIXES[adjusted] && !LANGUAGE_PREFIXES[adjusted]) {
    return;
  }

  return adjusted;
}
